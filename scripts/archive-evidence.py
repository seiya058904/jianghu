"""Copy and verify an explicit historical PNG manifest before removing originals.

Usage: python scripts/archive-evidence.py PROJECT_EXTERNAL_ARCHIVE
No Git objects, canon, frozen source, or runtime assets are changed.
"""
from pathlib import Path
import csv, hashlib, json, os, shutil, subprocess, sys

root = Path(__file__).resolve().parent.parent
destination = Path(sys.argv[1]).resolve()
if destination == root or root in destination.parents:
    raise SystemExit('Archive must be outside the project')
destination.mkdir(parents=True, exist_ok=True)
evidence = (root/'docs/evidence').resolve()
output = root/'docs/audits/independent-final'
tracked = set(subprocess.check_output(['git','ls-files','-z'],cwd=root).decode('utf-8').split('\0'))
paths = sorted(p for p in evidence.rglob('*.png') if p.is_file() and not p.is_symlink())
rows = []
def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()
for path in paths:
    if evidence not in path.resolve().parents:
        raise SystemExit(f'Unsafe source {path}')
    relative=path.relative_to(root).as_posix()
    target=destination/relative
    if destination not in target.resolve().parents:
        raise SystemExit('Unsafe destination')
    rows.append(dict(path=relative,bytes=path.stat().st_size,sha256=digest(path),tracked=relative in tracked))
# Freeze the exact input set before any mutation; this is also the recovery map.
manifest=output/'historical-png-archive.csv'
with manifest.open('w',encoding='utf-8',newline='') as f:
    writer=csv.DictWriter(f,fieldnames=['path','bytes','sha256','tracked']);writer.writeheader();writer.writerows(rows)
shutil.copy2(manifest,destination/'historical-png-archive.csv')
for i,row in enumerate(rows):
    source=root/row['path'];target=destination/row['path'];target.parent.mkdir(parents=True,exist_ok=True)
    if target.exists() and digest(target)!=row['sha256']:
        raise SystemExit(f'Archive collision: {row["path"]}')
    if not target.exists():shutil.copy2(source,target)
    if target.stat().st_size!=row['bytes'] or digest(target)!=row['sha256'] or digest(source)!=row['sha256']:
        raise SystemExit(f'Verification failed: {row["path"]}')
    # Only the verified, explicitly manifested source file is removed.
    source.unlink()
    if i%200==0:print(f'Verified and archived {i+1}/{len(rows)}',flush=True)
index=output/'historical-png-untrack.txt'
index.write_text('\n'.join(row['path'] for row in rows if row['tracked'])+'\n',encoding='utf-8')
summary={'files':len(rows),'bytes':sum(r['bytes'] for r in rows),'tracked':sum(r['tracked'] for r in rows),'manifestSHA256':digest(manifest),'archiveOutsideProject':True,'verifiedEveryCopyBeforeRemoval':True}
(output/'historical-png-summary.json').write_text(json.dumps(summary,indent=2)+'\n',encoding='utf-8')
print(json.dumps(summary),flush=True)
