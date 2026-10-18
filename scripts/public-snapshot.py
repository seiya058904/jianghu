"""Plan/apply a curated tracked snapshot onto a clean clone of public main.

Never pushes, changes remotes, rewrites history, or reads untracked source files.
Review the plan before invoking the same command with --apply.
"""
import argparse, hashlib, io, json, re, subprocess, tarfile
from pathlib import Path

parser=argparse.ArgumentParser()
parser.add_argument('--source-ref',required=True)
parser.add_argument('--destination',required=True)
parser.add_argument('--plan',required=True)
parser.add_argument('--apply',action='store_true')
args=parser.parse_args()
root=Path(__file__).resolve().parent.parent
destination=Path(args.destination).resolve()
if destination==root or root in destination.parents:
    raise SystemExit('Use an isolated public checkout outside the author repository')
def git(cwd,*items):
    return subprocess.check_output(['git',*items],cwd=cwd)
if Path(git(destination,'rev-parse','--show-toplevel').decode().strip()).resolve()!=destination:
    raise SystemExit('Destination must be the public Git checkout root')
plan=Path(args.plan).resolve()
if plan==root or root in plan.parents or plan==destination or destination in plan.parents:
    raise SystemExit('Keep the review plan outside both checkouts')
if git(destination,'status','--porcelain').strip():
    raise SystemExit('Public checkout is dirty')
source_sha=git(root,'rev-parse',args.source_ref+'^{commit}').decode().strip()
before=git(destination,'rev-parse','HEAD').decode().strip()
data=git(root,'archive','--format=tar',source_sha)
files={};excluded=[];redactions=[];retained_legacy_binaries=[]
# Already public, reviewed runtime art. This is an exact-byte preservation rule,
# not permission to add or replace large binaries in a new release.
legacy_binaries={'public/art/ferry.png':'3afd0d4d63d4b77745b5cf7aa567d18ec053ec5dd5562afe7b187fc09568ba9e'}
def allowed_path(name):
    path=Path(name)
    if '/' not in name:
        return name in ('.gitignore','.gitattributes','package.json','package-lock.json','tsconfig.json','vite.config.ts','playwright.config.ts') or path.suffix.lower() in ('.html','.md')
    scopes={'src':{'.ts','.css','.json'},'story':{'.mjs','.ink','.json','.md'},'public':{'.js','.json','.svg','.webp','.png','.txt','.ico'},'scripts':{'.mjs','.py','.ps1','.sh'},'tests':{'.ts','.json'},'docs':{'.md','.json','.log','.txt','.csv','.webp'}}
    if name.startswith('.github/workflows/'):
        return path.suffix.lower() in ('.yml','.yaml')
    return name.split('/')[0] in scopes and path.suffix.lower() in scopes[name.split('/')[0]]
def excluded_path(name):
    return (name=='宋世江湖.md' or name.startswith(('docs/archives/','.workbuddy/','.impeccable/','docs/art/candidates-'))
        or re.match(r'^docs/evidence/.*\.(png|jpe?g)$',name,re.I)
        or re.search(r'(^|/)(\.env(?:\..*)?|[^/]*\.(?:zip|bundle|pem|key))$',name,re.I))
def redact(text):
    # Documentary machine paths are not part of the public product contract.
    # Do not rewrite code, source maps, expected hashes, or executable fixtures.
    archive=root.parent/'Jianghu-independent-20261018'
    for path,replacement in ((archive,'../Jianghu-independent-20261018'),(root,'.')):
        text=text.replace(str(path),replacement).replace(path.as_posix(),replacement)
    return re.sub(r'(?<![A-Za-z0-9_])[A-Za-z]:[\\/][^\n\r"<>`|]*','[author-local-path]',text)
def clean_value(value):
    if isinstance(value,str):return redact(value)
    if isinstance(value,list):return [clean_value(v) for v in value]
    if isinstance(value,dict):return {k:clean_value(v) for k,v in value.items()}
    return value
with tarfile.open(fileobj=io.BytesIO(data),mode='r:') as archive:
    for member in archive.getmembers():
        if member.isdir():continue
        name=member.name
        if not member.isfile():raise SystemExit(f'Unreviewed link/special file: {name}')
        if excluded_path(name) or not allowed_path(name):excluded.append(name);continue
        blob=archive.extractfile(member).read()
        if Path(name).suffix.lower() in ('.md','.log','.txt','.json','.csv') and not name.startswith(('src/','story/')) and name!='package-lock.json':
            original=blob
            text=blob.decode('utf-8-sig')
            if name.endswith('.json'):
                value=json.loads(text);cleaned=clean_value(value)
                if cleaned!=value:blob=(json.dumps(cleaned,ensure_ascii=False,indent=2)+'\n').encode('utf-8')
            else:blob=redact(text).encode('utf-8')
            if blob!=original:redactions.append(name)
        if len(blob)>1_000_000 and Path(name).suffix.lower() in ('.png','.jpg','.jpeg','.webp','.zip','.bundle'):
            previous=destination/name
            if legacy_binaries.get(name)!=hashlib.sha256(blob).hexdigest() or not previous.is_file() or previous.read_bytes()!=blob:
                raise SystemExit(f'Unreviewed large binary: {name}')
            retained_legacy_binaries.append(name)
        files[name]=blob
old=set(git(destination,'ls-files','-z').decode('utf-8').split('\0'))-{''}
manifest=[{'path':name,'bytes':len(blob),'sha256':hashlib.sha256(blob).hexdigest()} for name,blob in sorted(files.items())]
changed=[name for name,blob in files.items() if name not in old or not (destination/name).exists() or (destination/name).read_bytes()!=blob]
removed=sorted(old-files.keys())
result={'sourceCommit':source_sha,'publicBefore':before,'trackedFiles':len(files),'trackedBytes':sum(len(b) for b in files.values()),'maximumFile':max(manifest,key=lambda r:r['bytes']),
    'excluded':excluded,'documentaryRedactions':redactions,'retainedLegacyBinaries':retained_legacy_binaries,'changed':sorted(changed),'removed':removed,'files':manifest}
plan.parent.mkdir(parents=True,exist_ok=True)
plan.write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
if args.apply:
    for name in removed:
        target=(destination/name).resolve()
        if destination not in target.parents:raise SystemExit('Removal escapes public checkout')
        if target.is_file():target.unlink()
    for name,blob in files.items():
        target=(destination/name).resolve()
        if destination not in target.parents:raise SystemExit('Write escapes public checkout')
        target.parent.mkdir(parents=True,exist_ok=True);target.write_bytes(blob)
print(json.dumps({k:v for k,v in result.items() if k in ('sourceCommit','publicBefore','trackedFiles','trackedBytes','maximumFile')},ensure_ascii=False))
