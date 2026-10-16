import {existsSync,readFileSync,readdirSync,writeFileSync,statSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {execFileSync} from 'node:child_process';
import {campaignCharacters,campaignScenes,npcArchetypes} from '../src/campaign-catalog.ts';
const story=readFileSync('story/campaign.ink','utf8'),lore=readFileSync('宋世江湖.md','utf8');
const used=new Set([...story.matchAll(/# cast:([^#\n]+)/g)].flatMap(m=>m[1].trim().split(',')));
const resources=new Set(Object.values(campaignScenes).map(s=>s.art));
for(const p of Object.values(campaignCharacters)){resources.add(p.portrait.file);for(const file of Object.values(p.portrait.moods??{}))resources.add(file)}
for(const name of ['rescue','storm','dawn','quiet'])resources.add(`v5/cg-${name}.webp`);
const files=[];
for(const resource of resources){const file='public/art/'+resource;if(!existsSync(file))throw Error('Missing '+file);const info=JSON.parse(execFileSync('ffprobe',['-v','error','-show_entries','stream=width,height,pix_fmt','-of','json',file],{encoding:'utf8'}));files.push({file,bytes:statSync(file).size,...info.streams[0]})}
const names=Object.values(campaignCharacters).map(p=>p.name);if(new Set(names).size!==names.length)throw Error('Duplicate character names');
const clashes=names.filter(name=>lore.includes(name));if(clashes.length)throw Error('Lore name collision '+clashes);
const original=JSON.parse(readFileSync('docs/archives/v4-source-20261015.json','utf8'));
// This snapshot also caught the first v5 generated PNG. Its smaller WebP is now used;
// the original PNG is still in the snapshot and the image tool's output directory.
const replacedGenerated='public/art/v5/zhaoli.png';
const missing=original.filter(x=>x.path.replaceAll('\\','/')!==replacedGenerated&&!existsSync(x.path));if(missing.length)throw Error('Missing baseline files '+missing.map(x=>x.path));
const preserved=['宋世江湖.md','story/main.ink','story/duel.ink','src/runtime.ts','src/storage.ts','src/knowledge.ts','src/presentation.ts','src/generated/duel-1.0.0.json'];
for(const file of preserved){const expected=original.find(x=>x.path.replaceAll('\\','/')===file)?.sha256;const actual=createHash('sha256').update(readFileSync(file)).digest('hex');if(actual!==expected)throw Error('Protected file changed '+file)}
const report={sourceVersion:'tide-promise-1.0.0',registeredCharacters:names.length,actualCharacters:used.size,dedicatedCharacters:[...used].filter(id=>campaignCharacters[id].portrait.kind==='dedicated').length,npcArchetypes:Object.keys(npcArchetypes).length,npcTemplateImages:new Set(Object.values(campaignCharacters).filter(p=>p.portrait.kind==='template').map(p=>p.portrait.file)).size,scenes:Object.keys(campaignScenes).length,cg:4,files,artBytes:files.reduce((n,f)=>n+f.bytes,0),nameClashes:clashes,preserved,missingBaselineFiles:missing};
writeFileSync('docs/evidence/v5-asset-audit.json',JSON.stringify(report,null,2));
writeFileSync('CHARACTER_ROSTER.md','# 人物与视觉登记（含轻微剧透）\n\n所有登场人物为本作原创。登记32位，实际出场'+used.size+'位；未出场条目不算剧情规模。普通人物的图像共享原型，不计独立立绘。\n\n|稳定ID|姓名 / 身份|等级|素材|实际出场|人物动机与边界|\n|---|---|---|---|---|---|\n'+Object.entries(campaignCharacters).map(([id,p])=>`|${id}|${p.name} / ${p.role}|${p.portrait.kind==='dedicated'?'核心':'配角'}|${p.portrait.file}${p.portrait.variant?' / '+p.portrait.variant:''}|${used.has(id)?'是':'登记备用'}|${p.detail}|`).join('\n')+'\n');
writeFileSync('ART_ASSET_MANIFEST.md','# 实际美术清单\n\n本轮内置 imagegen 生成、压缩并接入：12位独立人物，4张保身份表情编辑，8组NPC原型及4张额外变体，12个背景，4张CG，共44张WebP。独立人物不是从一张多人图裁切。\n\n素材总计 '+(report.artBytes/1024/1024).toFixed(2)+' MiB；细项分辨率、格式、体积见 `docs/evidence/v5-asset-audit.json`。生成来源与可用的逐字prompt见 `docs/art-v5-provenance.json`。早期批次prompt未全部另存逐字副本，在对话工具调用中可追溯，不能把摘要称为逐字原始记录。\n\n|文件|分辨率|字节|\n|---|---|---|\n'+files.map(f=>`|${f.file}|${f.width}×${f.height}|${f.bytes}|`).join('\n')+'\n\n绑定：人物见CHARACTER_ROSTER；背景见src/campaign-catalog.ts的sceneId；`rescue`用于水路旧桩湾救人，`storm`用于终章松绳，`dawn`用于六类后日，`quiet`用于两类有代价的后日。CG状态写入保存快照并重放核验，切到不同scene时清除。\n\n四位重点人物有图片表情变体；其余情绪是姓名牌与姿态提示，未假称都有绘制过的表情。未采用的照鲤候选仍在工具默认输出，不计入交付。\n');
console.log({characters:used.size,dedicated:report.dedicatedCharacters,resources:files.length,artMiB:(report.artBytes/1024/1024).toFixed(2),protectedFiles:preserved.length});
