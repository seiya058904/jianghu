// Measured reachability evidence; sampling is explicitly not exhaustive or literary QA.
import {readFileSync,writeFileSync,mkdirSync,existsSync,statSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {VNRuntime} from '../src/vn-runtime.ts';
import {campaignCharacters,campaignScenes} from '../src/campaign-catalog.ts';
import {campaignRoutes,pickChoice} from '../tests/campaign-routes.ts';
const dir='docs/evidence/v6';mkdirSync(dir,{recursive:true});
const content=JSON.parse(readFileSync('src/generated/campaign.json','utf8'));
const source=readFileSync('story/campaign.ink','utf8');
const sourceBeats=[...source.matchAll(/# beat:([a-z0-9_]+)/g)].map(m=>m[1]);
const used=new Map(),sceneUses=new Map(),cgUses=new Map(),visited=new Set(),choiceBeats=new Map(),routes={};
let seed=71;
for(let run=0;run<128;run++){
 const [expected,preferred]=Object.entries(campaignRoutes)[run]??['sample-'+run,[]];
 const s=new VNRuntime(content,'tide-promise-1.0.0');let passive=0,longest=0,gapStart='',longStart='',decisions=0;
 while(true){const b=s.frame;visited.add(b.id);
  for(const id of b.stage.cast){const p=used.get(id)??{beats:new Set(),scenes:new Set(),expressions:new Set(),images:new Set()};p.beats.add(b.id);p.scenes.add(b.stage.scene);const mood=b.stage.moods[id]??'neutral';p.expressions.add(mood);p.images.add(campaignCharacters[id].portrait.moods?.[mood]??campaignCharacters[id].portrait.file);used.set(id,p);}
  if(!sceneUses.has(b.stage.scene))sceneUses.set(b.stage.scene,new Set());sceneUses.get(b.stage.scene).add(b.id);
  if(b.stage.cg){if(!cgUses.has(b.stage.cg))cgUses.set(b.stage.cg,new Set());cgUses.get(b.stage.cg).add(b.id);}
  if(b.choices.length){decisions++;for(const c of b.choices)choiceBeats.set(c.id,{beat:b.id,scene:b.stage.scene,text:c.text});passive=0;gapStart='';}
  else {gapStart||=b.id;passive++;if(passive>longest){longest=passive;longStart=gapStart;}}
  if(b.ending)break;
  if(s.commands.length>=3000)throw new Error(`Non-terminating route: ${expected}`);
  if(b.choices.length){if(run<8)s.choose(pickChoice(b.choices,preferred).id);else{seed=(Math.imul(seed,1664525)+1013904223)>>>0;s.choose(b.choices[(seed>>>16)%b.choices.length].id)}}else s.advance();
 }
 if(run<8){if(s.frame.ending!==expected)throw new Error(`Ending mismatch ${expected}`);routes[expected]={beats:s.frames.length,decisions,longestPassiveRun:longest,longestPassiveStart:longStart,scenes:[...new Set(s.frames.map(b=>b.stage.scene))],ending:s.frame.ending};
  writeFileSync(`${dir}/baseline-transcript-${expected}.txt`,s.frames.map(b=>`[${b.id}] ${campaignScenes[b.stage.scene].time} / ${b.speaker??'旁白'}\n${b.text}${b.choices.length?'\n'+b.choices.map(c=>`  ${c.id}: ${c.text}`).join('\n'):''}${b.selected?'\n已选：'+b.selected:''}`).join('\n\n'));
 }
}
const characters=[...used].map(([id,p])=>({id,name:campaignCharacters[id].name,kind:campaignCharacters[id].portrait.kind,archetype:campaignCharacters[id].portrait.archetype,beats:[...p.beats],scenes:[...p.scenes],declaredMoodsSeen:[...p.expressions],distinctImageFiles:[...p.images]}));
const resources=new Map();for(const p of characters)for(const file of p.distinctImageFiles)resources.set(file,true);for(const id of sceneUses.keys())resources.set(campaignScenes[id].art,true);for(const id of cgUses.keys())resources.set(`v5/cg-${id}.webp`,true);
const assets=[...resources.keys()].map(file=>{const path=`public/art/${file}`;if(!existsSync(path))throw new Error(`Missing referenced asset ${path}`);return {file,bytes:statSync(path).size,sha256:createHash('sha256').update(readFileSync(path)).digest('hex')};});
const report={version:'tide-promise-1.0.0',kind:'v5-baseline-measured-for-v6',generatedAt:new Date().toISOString(),sourceSha256:createHash('sha256').update(source).digest('hex'),sourceBeats:sourceBeats.length,sampledRuns:128,seed:71,exhaustive:false,visitedBeats:visited.size,unvisitedBeats:sourceBeats.filter(id=>!visited.has(id)),routes,counts:{actualNPC:characters.length,dedicatedNPC:characters.filter(p=>p.kind==='dedicated').length,charactersWithThreeDistinctImages:characters.filter(p=>p.distinctImageFiles.length>=3).length,archetypesUsed:new Set(characters.map(p=>p.archetype).filter(Boolean)).size,backgroundsUsed:sceneUses.size,cgUsed:cgUses.size,choicesSeen:choiceBeats.size,referencedAssetBytes:assets.reduce((n,f)=>n+f.bytes,0)},characters,scenes:[...sceneUses].map(([id,beats])=>({id,beats:[...beats]})),cgs:[...cgUses].map(([id,beats])=>({id,beats:[...beats]})),choices:[...choiceBeats].map(([id,data])=>({id,...data})),assets,limits:['No external player rating or duration measured','Distinct files do not establish distinct visual design; inspect images','Choices seen do not establish delayed causal impact; ledger and paired routes required','Unvisited sampled nodes require follow-up; no exhaustive coverage claim']};
writeFileSync(`${dir}/baseline-content-audit.json`,JSON.stringify(report,null,2));console.log(JSON.stringify({counts:report.counts,routes,sourceBeats:report.sourceBeats,visitedBeats:report.visitedBeats,unvisitedBeats:report.unvisitedBeats.length,exhaustive:false},null,2));
