"""Read-only image/provenance audit; writes only the requested manifest artifacts."""
from pathlib import Path
from PIL import Image
import hashlib,json,re
from datetime import datetime,timezone

ROOT=Path(__file__).resolve().parent.parent
ART=ROOT/'public/art'
OUT=ROOT/'docs/art'
def load(p):return json.loads(p.read_bytes())
def text(p):return p.read_bytes().decode('utf-8')
def save(p,data):p.write_bytes((json.dumps(data,ensure_ascii=False,indent=2)+'\n').encode('utf-8'))
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
inventory={p.relative_to(ART).as_posix():p for p in sorted(ART.rglob('*')) if p.suffix.lower() in ('.png','.webp')}
usage=load(OUT/'asset-usage-v6.json')
for work in usage['works']:
    assert sha(ROOT/work['content'])==work['sha256'],f"Stale runtime usage: {work['work']}"
usage_by_file={a['file']:a for a in usage['assets']}
assert not (set(usage_by_file)-set(inventory)),f"Registered file missing: {set(usage_by_file)-set(inventory)}"
records={file:[] for file in inventory}
provenance_inputs={}
unmatched=[]
def norm(value):
    if not isinstance(value,str):return None
    s=value.replace('\\','/')
    if 'public/art/' in s:return s.split('public/art/',1)[1]
    if s.startswith(('v5/','v6/')):return s
    return None
def add(file,record,path,common=None,pointer=''):
    if file not in records:
        unmatched.append({'record':path,'pointer':pointer,'target':file});return
    c={**(common or {}),**record}
    prompt=c.get('prompt')
    if not isinstance(prompt,str):return
    source=c.get('source',c.get('raw'))
    directory=c.get('rawDirectory')
    resolved=None
    if isinstance(source,str):
        if re.match(r'^[A-Za-z]:[/\\]',source):resolved=source
        elif directory:resolved=str(Path(directory)/source)
    records[file].append({'record':path,'pointer':pointer,'tool':c.get('tool',c.get('mode','recorded tool unspecified')),'prompt':prompt,'promptStatus':'retained-in-existing-record','sourceRecorded':source,'sourceResolvedOnlyFromExplicitDirectory':resolved,'sourceExists':Path(resolved).is_file() if resolved else None,'references':c.get('references',c.get('reference',c.get('target'))),'processing':c.get('processing',c.get('conversion',c.get('packaging',c.get('formatRepair')))),'reuse':c.get('reuse',c.get('strategy')),'priorReviewClaim':c.get('review'),'recordedBytes':c.get('bytes')})
def walk(node,path,common,pointer='',inferred=None):
    if not isinstance(node,dict):return
    inherited={k:v for k,v in common.items()}
    for key in ('tool','mode','rawDirectory','processing','conversion','packaging','strategy','review'):
        if key in node:inherited[key]=node[key]
    file=norm(node.get('file')) or norm(node.get('output')) or inferred
    if file and isinstance(node.get('prompt'),str):add(file,node,path,inherited,pointer)
    for key,value in node.items():
        if key=='assets' and isinstance(value,list):
            for i,asset in enumerate(value):walk(asset,path,inherited,f'{pointer}/assets/{i}')
        elif isinstance(value,dict) and key not in ('prompts','formatRepair'):
            candidate=f'v6/{key}.webp'
            walk(value,path,inherited,f'{pointer}/{key}',candidate if candidate in inventory else None)

paths=set((ROOT/'docs/v6').glob('*provenance.json'))|set((ROOT/'docs/v6').glob('*prompts.json'))|set((ROOT/'docs/v6').glob('*edits.json'))|set((ROOT/'docs/v6').glob('*assets.json'))|set((ROOT/'docs/evidence/v6').glob('*art-asset*.json'))|set((ROOT/'docs/evidence/v6').glob('*study-prompt.json'))
for p in sorted(paths):
    path=p.relative_to(ROOT).as_posix();provenance_inputs[path]=sha(p);data=load(p)
    base=re.sub(r'-(?:provenance|prompts|edits)$','',p.stem)
    fallback=f'v6/{base}.webp'
    # An explicit output takes priority over a conventional document filename.
    walk(data,path,{},inferred=fallback if fallback in inventory else None)
    if p.name=='th-shen-prompts.json':
        for mood,prompt in data['prompts'].items():
            file='v6/th-shen'+('' if mood=='neutral' else '-'+mood)+'.webp'
            add(file,{'prompt':prompt,'source':data.get('source' if mood=='neutral' else mood)},path,{'tool':data['tool']},'/prompts/'+mood)
    if p.name=='th-huo-edits.json':
        for mood in ('intent','uneasy'):add('v6/th-huo-'+mood+'.webp',data[mood],path,{'tool':data['tool'],'target':data['target']},'/'+mood)

# Existing Markdown logs, with their original prompt strings left intact.
markdown_records=[
 ('docs/v6/ART_PROVENANCE.md','v6/taihua-night.webp',0),
 ('docs/v6/LONGMEN_V2_ADAPTATION_BRIEF.md','v6/lm-zhang.webp',0),
 ('docs/v6/LONGMEN_V2_ADAPTATION_BRIEF.md','v6/cg-longmen-night.webp',1),
 ('docs/v6/WHITE_STONE_ADAPTATION_BRIEF.md','v6/reusable-snow-courtyard.webp',0),
]
for path,file,index in markdown_records:
    p=ROOT/path;s=text(p);provenance_inputs[path]=sha(p)
    prompts=re.findall(r'^> (Use case:.*)$',s,re.M);assert len(prompts)>index,path
    # Source filenames are attached only from the named asset's existing log.
    raw_names=re.findall(r'exec-[0-9a-f-]+\.png',s)
    source=raw_names[index] if path.endswith('LONGMEN_V2_ADAPTATION_BRIEF.md') else (raw_names[0] if raw_names else None)
    dirs=re.findall(r'C:/Users/admin/\.codex/generated_images/[0-9a-f-]+/',s)
    add(file,{'prompt':prompts[index],'source':source,'rawDirectory':dirs[0] if dirs else None,'tool':'built-in image_gen','processing':'See existing source log; no new image processing in manifest audit.'},path,pointer=f'blockquote-{index+1}')
for p in sorted(ART.glob('*.webp.json')):
    path=p.relative_to(ROOT).as_posix();provenance_inputs[path]=sha(p)
    data=load(p);file=p.name[:-5]
    if isinstance(data.get('prompt'),str):add(file,{**data,'tool':data.get('tool','legacy sidecar; tool unspecified')},path)

rows=[]
for file,p in inventory.items():
    u=usage_by_file.get(file,{'registrations':[],'observations':[]})
    with Image.open(p) as im:
        im.load();alpha=im.getchannel('A').getextrema() if 'A' in im.getbands() else None
        specs={'format':im.format,'mode':im.mode,'width':im.width,'height':im.height,'bytes':p.stat().st_size,'sha256':sha(p),'alphaExtrema':alpha,'hasTransparentPixels':bool(alpha and alpha[0]<255)}
    seen={(r['record'],r['pointer']):r for r in records[file]};rec=list(seen.values())
    roles=sorted(set(o['kind'] for o in u['observations']))
    metadata=sorted(set(o['time'] for o in u['observations'] if o.get('time')))
    origins=('旧版继承；原始逐字提示未完整保留' if not file.startswith('v6/') else 'V6来源记录缺失；未补造原提示') if not rec else ('V6已有生成/参考编辑记录；本轮只读核验' if file.startswith('v6/') else '旧版继承；附既有提示记录')
    row={'assetId':'art-'+re.sub(r'[^a-zA-Z0-9]+','-',file.rsplit('.',1)[0]),'file':'public/art/'+file,'sourceClass':origins,'promptRecordCount':len(rec),'provenance':rec,'technical':specs,'registered':bool(u['registrations']),'registrations':u['registrations'],'observedInRuntime':bool(u['observations']),'observations':u['observations'],'runtimeRoles':roles,'periodLabelsFromScript':metadata,'periodCaveat':'时期取自现有场景标签，非重新考据；同一人物年龄/服饰与事件前后约束仍须遵守。','qa':{'technical':'IMAGE_DECODED_AND_HASHED','browserDecode':'NOT_YET_CHECKED_IN_THIS_MANIFEST','priorVisualClaims':'See individual provenance records; not upgraded to final acceptance.','finalVisualAcceptance':'NOT_PROVEN_BY_MANIFEST'},'reusePolicy':'背景须符合季节/昼夜/完好状态；人物仅可复用同一身份及相容年龄/服饰；CG须保持其中身份、物件和动作条件，不因删对白就变成任意角色图。'}
    row['recordedByteMismatches']=[{'record':r['record'],'bytes':r['recordedBytes']} for r in rec if r.get('recordedBytes') and r['recordedBytes']!=specs['bytes']]
    row['intentSummary']=('原提示摘录：'+rec[0]['prompt'][:180]+('…' if len(rec[0]['prompt'])>180 else '')) if rec else '原始生成意图未完整保留；当前服务对象及用途仅按目录登记与实际剧本引用记录。'
    rows.append(row)
assert len({r['assetId'] for r in rows})==len(rows),'Asset ID collision'
fingerprint=hashlib.sha256(json.dumps([[r['file'],r['technical']['sha256']] for r in rows],ensure_ascii=False,separators=(',',':')).encode()).hexdigest()
browser_reports={}
for place in ('root','subpath'):
    p=ROOT/f'docs/evidence/v6/asset-manifest-browser-{place}.json'
    if p.is_file():
        data=load(p)
        if data.get('assetFingerprint')==fingerprint and data.get('status')=='ALL_RASTER_BYTES_AND_BROWSER_DECODE_VERIFIED' and data.get('files')==len(rows):browser_reports[place]=p.relative_to(ROOT).as_posix()
if len(browser_reports)==2:
    for r in rows:r['qa']['browserDecode']='EXACT_BYTES_AND_DIMENSIONS_ROOT_AND_SUBPATH_VERIFIED'
counts={'rasterFiles':len(rows),'v6RasterFiles':sum(r['file'].startswith('public/art/v6/') for r in rows),'withRetainedPromptRecords':sum(bool(r['provenance']) for r in rows),'withoutRetainedPromptRecords':sum(not r['provenance'] for r in rows),'observedRuntimeFiles':sum(r['observedInRuntime'] for r in rows),'registeredFiles':sum(r['registered'] for r in rows),'byteMismatchFiles':sum(bool(r['recordedByteMismatches']) for r in rows),'bytesOnDisk':sum(r['technical']['bytes'] for r in rows)}
report={'status':'TRACEABLE_CURRENT_ASSET_INVENTORY_NOT_FINAL_ART_ACCEPTANCE','generatedAt':datetime.now(timezone.utc).isoformat(),'counts':counts,'usageEvidence':'docs/art/asset-usage-v6.json','usageEvidenceSHA256':sha(OUT/'asset-usage-v6.json'),'provenanceInputs':provenance_inputs,'unmatchedHistoricalTargets':unmatched,'assets':rows,'limits':['All public/art raster files are inventoried; two JSON sidecars are evidence, not extra images.','Runtime sampling is 168 paths per work, not exhaustive path proof. No original legacy engine path coverage claim.','Existing prompt strings are copied from their actual records; missing originals are explicitly missing. Relative source PNG filenames are not silently resolved using a guessed directory.','Decode, hash, registration and prior review claims do not prove visual acceptance, identity correctness or narrative quality.','No image creation, image edits, format changes, deletions or moves performed.']}
report['assetFingerprint']=fingerprint
report['browserEvidence']=browser_reports
save(OUT/'ASSET_MANIFEST_V6.json',report)

def esc(s):return str(s).replace('|','／').replace('\n',' ')
lines=['# V6 美术资产清单','', '本表按当前磁盘与剧情运行记录生成，具体数量以下方本次统计为准；不是逐图审美验收。完整人物/场景登记、全部采样节拍、保留的原提示及来源路径见 [逐项 JSON](ASSET_MANIFEST_V6.json)，覆盖边界见 [运行引用记录](asset-usage-v6.json)。','',f"当前图片 {counts['rasterFiles']} 张，其中V6目录 {counts['v6RasterFiles']} 张；保留提示记录 {counts['withRetainedPromptRecords']} 张，提示记录缺失 {counts['withoutRetainedPromptRecords']} 张。未因生成清单增加任何图片。",'', '使用状态：`剧情`为采样运行实际引用，`登记`仅表示目录/封面/静态代码已关联；CG覆盖的角色元数据不当作该拍已显示的立绘。时期是现行场景标签，未新增正典年月。QA“可解码”只说明文件可读取，历史视觉检查原话另列于JSON，全部终验继续保留边界。','', '复用约束：普通场景优先复用；须符合季节、昼夜、地点结构与损毁状态。人物不能跨身份、跨年龄借脸；完整旧刀不能用于断刀后现场，普通雪院不能冒充雪崩废墟。剧情文字、胜负和意义继续由可替换剧本承担。','', '|资产ID／当前文件|服务人物或场景|来源／意图与提示记录|技术规格|时期／使用位置例|正式引用与QA|','|---|---|---|---|---|---|']
for r in rows:
    refs=r['registrations'];purposes=list(dict.fromkeys(x.get('name',x.get('title',x.get('source',x.get('id','')))) for x in refs))
    prompt=r['sourceClass']+'<br>'+esc(r['intentSummary'])+'<br>'+'；'.join(f"[{Path(x['record']).name}](../../{x['record']})" for x in r['provenance'])
    t=r['technical'];obs=r['observations'];examples='；'.join(f"{o['work']}:{o['beats'][0]}（{o.get('time','')}）" for o in obs[:2]) or '未在本轮VN运行观察；登记项详见JSON'
    lines.append('|'+ '|'.join([f"`{r['assetId']}`<br>`{r['file']}`",esc('、'.join(purposes[:6]))+('等；全映射见JSON' if len(purposes)>6 else ''),prompt,f"{t['format']} {t['width']}×{t['height']} {t['mode']}<br>{t['bytes']} B；透明像素：{'有' if t['hasTransparentPixels'] else '无'}",esc(examples),('剧情引用' if r['observedInRuntime'] else '仅登记' if r['registered'] else '未引用')+('；解码/哈希/根子浏览器已核；审美另验' if len(browser_reports)==2 else '；可解码/哈希已核；浏览器与审美另验')])+'|')
lines+=['','## 生成与校核','','先运行 `node --experimental-strip-types scripts/collect-art-usage-v6.mjs`，再运行 `python scripts/build-art-manifest-v6.py`。脚本不编译剧本，不改原图或已有来源文件。技术浏览器结果记录在 `docs/evidence/v6/asset-manifest-browser-*.json`；这些检查不替代逐场取景、人物身份、动作/CG和阅读体验验收。','', '缺失原提示的继承图按缺失记录，未根据文件名、画面或记忆重造“原始提示”。来源文件存在的检查仅为路径可用，未据此假定所有转换后的像素与源PNG逐像素一致。', '']
(OUT/'ASSET_MANIFEST_V6.md').write_bytes('\n'.join(lines).encode('utf-8'))
print(json.dumps({'counts':counts,'missingV6Prompts':[r['file'] for r in rows if r['file'].startswith('public/art/v6/') and not r['provenance']],'unmatchedHistoricalTargets':unmatched},ensure_ascii=True))
