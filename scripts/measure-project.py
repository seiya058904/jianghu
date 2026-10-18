"""Measure logical bytes and Windows file allocation without following links."""
from pathlib import Path
import collections, csv, ctypes, hashlib, json, os, subprocess, sys

root=Path(__file__).resolve().parent.parent
out=root/'docs/audits/independent-final'
suffix=sys.argv[1] if len(sys.argv)>1 else 'AFTER'
if suffix not in ('BEFORE','AFTER'):raise SystemExit('Expected BEFORE or AFTER')
tracked=set(subprocess.check_output(['git','ls-files','-z'],cwd=root).decode('utf-8').split('\0'))
rows=[];groups=collections.defaultdict(lambda:{'files':0,'logical_bytes':0,'allocated_bytes':0})
class StandardInfo(ctypes.Structure):
    _fields_=[('allocation',ctypes.c_longlong),('end',ctypes.c_longlong),('links',ctypes.c_ulong),('delete_pending',ctypes.c_ubyte),('directory',ctypes.c_ubyte)]
if os.name=='nt':
    kernel=ctypes.WinDLL('kernel32',use_last_error=True)
    kernel.CreateFileW.argtypes=[ctypes.c_wchar_p,ctypes.c_ulong,ctypes.c_ulong,ctypes.c_void_p,ctypes.c_ulong,ctypes.c_ulong,ctypes.c_void_p]
    kernel.CreateFileW.restype=ctypes.c_void_p
    kernel.GetFileInformationByHandleEx.argtypes=[ctypes.c_void_p,ctypes.c_int,ctypes.c_void_p,ctypes.c_ulong]
    kernel.CloseHandle.argtypes=[ctypes.c_void_p]
def allocated(path,stat):
    if os.name!='nt':return stat.st_blocks*512
    handle=kernel.CreateFileW(str(path),0,7,None,3,0,None)
    if handle==ctypes.c_void_p(-1).value:raise ctypes.WinError(ctypes.get_last_error())
    info=StandardInfo()
    try:
        if not kernel.GetFileInformationByHandleEx(handle,1,ctypes.byref(info),ctypes.sizeof(info)):raise ctypes.WinError(ctypes.get_last_error())
        return info.allocation
    finally:kernel.CloseHandle(handle)
for folder,dirs,files in os.walk(root,followlinks=False):
    dirs[:]=[name for name in dirs if not (Path(folder)/name).is_symlink()]
    for name in files:
        path=Path(folder)/name
        if path.is_symlink():continue
        relative=path.relative_to(root).as_posix();stat=path.stat();allocation=allocated(path,stat)
        top=relative.split('/')[0] if '/' in relative else '(root)'
        group=groups[top];group['files']+=1;group['logical_bytes']+=stat.st_size;group['allocated_bytes']+=allocation
        rows.append({'path':relative,'bytes':stat.st_size,'allocated_bytes':allocation,'tracked':relative in tracked})
logical=sum(r['bytes'] for r in rows);allocation=sum(r['allocated_bytes'] for r in rows);git_size=groups['.git']['logical_bytes']
summary={'head':subprocess.check_output(['git','rev-parse','HEAD'],cwd=root).decode().strip(),
    'all_bytes':logical,'allocated_bytes':allocation,'git_bytes':git_size,'worktree_bytes':logical-git_size,
    'all_GiB':logical/2**30,'all_GB_decimal':logical/10**9,'under_1GiB':logical<2**30,
    'files':len(rows),'groups':dict(groups),'allocation_method':'FILE_STANDARD_INFO.AllocationSize, excludes directory metadata and shared-object deduplication' if os.name=='nt' else 'stat.st_blocks * 512'}
with (out/f'SIZE_INVENTORY_{suffix}.csv').open('w',encoding='utf-8',newline='') as f:
    writer=csv.DictWriter(f,fieldnames=list(rows[0]));writer.writeheader();writer.writerows(rows)
(out/f'size-{suffix.lower()}.json').write_text(json.dumps(summary,indent=2)+'\n',encoding='utf-8')
print(json.dumps({k:v for k,v in summary.items() if k!='groups'}))
