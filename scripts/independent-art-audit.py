"""Read image pixels without editing assets; report alpha separately from identity QA."""
from pathlib import Path
from PIL import Image, ImageOps, ImageDraw
import json, csv, hashlib

root = Path(__file__).resolve().parent.parent
out = root / 'docs/audits/independent-final'
out.mkdir(parents=True, exist_ok=True)
rows = []
files = sorted(set((root/'public/art').rglob('*')) | set((root/'docs/art/candidates-2026-10-17').rglob('*')))
for path in files:
    if path.suffix.lower() not in ('.png', '.webp', '.jpg', '.jpeg') or not path.is_file():
        continue
    with Image.open(path) as image:
        image.load()
        alpha = image.getchannel('A') if 'A' in image.getbands() else None
        extrema = alpha.getextrema() if alpha is not None else (255, 255)
        histogram = alpha.histogram() if alpha is not None else None
        rows.append(dict(path=path.relative_to(root).as_posix(), bytes=path.stat().st_size,
            sha256=hashlib.sha256(path.read_bytes()).hexdigest(), width=image.width, height=image.height,
            mode=image.mode, alpha_min=extrema[0], alpha_max=extrema[1],
            transparent_pixels=histogram[0] if histogram else 0,
            partial_alpha_pixels=sum(histogram[1:255]) if histogram else 0,
            aspect=round(image.width/image.height, 4),
            classification='candidate' if 'candidates-' in str(path) else 'runtime',
            visual_status='CONTACT_SHEET_REVIEW_REQUIRED'))
with (out/'ART_ASSET_AUDIT.csv').open('w', encoding='utf-8', newline='') as f:
    writer=csv.DictWriter(f, fieldnames=list(rows[0]));writer.writeheader();writer.writerows(rows)
# Contact sheets are deliberately small, uncommitted working review artifacts.
preview = root.parent/'Jianghu-independent-20261018'/'art-contact-sheets'
preview.mkdir(parents=True, exist_ok=True)
for start in range(0, len(rows), 20):
    sheet = Image.new('RGB', (1000, 1000), '#ddd9cc')
    draw=ImageDraw.Draw(sheet)
    for i, row in enumerate(rows[start:start+20]):
        x=(i%5)*200;y=(i//5)*250
        with Image.open(root/row['path']) as image:
            thumb=ImageOps.contain(image.convert('RGBA'), (196, 212))
            sheet.paste(thumb, (x+(200-thumb.width)//2,y), thumb)
        label=Path(row['path']).name
        draw.text((x+2,y+215),label[:29],fill='black')
        draw.text((x+2,y+232),f"{start+i} alpha={row['alpha_min']}..{row['alpha_max']}",fill='black')
    sheet.save(preview/f'art-{start//20:02}.webp', quality=80)
summary={'files':len(rows),'runtime':sum(r['classification']=='runtime' for r in rows),
    'candidates':sum(r['classification']=='candidate' for r in rows),
    'with_real_transparent_pixels':sum(r['transparent_pixels']>0 for r in rows),
    'all_decode':True,'pixel_checks_do_not_prove':'Character age, weapon, provenance, single-person composition, background purity or stage correctness'}
(out/'art-summary.json').write_text(json.dumps(summary,indent=2)+'\n',encoding='utf-8')
print(json.dumps(summary))
