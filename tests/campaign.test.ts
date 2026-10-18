import {evidencePath} from './evidence-path.ts';
import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync,writeFileSync} from 'node:fs';
import {VNRuntime,restoreVN} from '../src/vn-runtime.ts';
import content from '../src/generated/campaign.json' with {type:'json'};
import {campaignCharacters,campaignEndings,campaignScenes} from '../src/campaign-catalog.ts';
import {campaignRoutes,pickChoice} from './campaign-routes.ts';
const edition={content,version:'tide-promise-1.0.0'};
export function walk(preferred:string[]=[]){const s=new VNRuntime(content,edition.version);let decisions=0;while(!s.frame.ending){if(s.frame.choices.length){s.choose(pickChoice(s.frame.choices,preferred).id);decisions++}else s.advance();assert.ok(s.commands.length<1500)}return {s,decisions}}
test('eight distinct complete endings, both middle routes and genuine later callbacks',()=>{
 const report:Record<string,unknown>={};const totalPeople=new Set<string>();const totalScenes=new Set<string>();
 for(const [ending,ids] of Object.entries(campaignRoutes)){
  const {s,decisions}=walk(ids);assert.equal(s.frame.ending,ending,ending);
  assert.ok(decisions>=40);assert.ok(s.frames.length>450);
  assert.deepEqual(restoreVN(JSON.stringify(s.save()),edition).session.frames,s.frames);
  assert.throws(()=>restoreVN(JSON.stringify(s.save())),/作品|版本/);
  const cast=new Set(s.frames.flatMap(b=>b.stage.cast));cast.forEach(x=>totalPeople.add(x));const scenes=new Set(s.frames.map(b=>b.stage.scene));scenes.forEach(x=>totalScenes.add(x));
  assert.ok(s.frames.some(b=>b.text.includes('梯子给你留着')));
  assert.ok(s.frames.some(b=>b.text.includes('停试令已报全')));
  if(ending==='captain'){assert.ok(scenes.has('rainboat'));assert.ok(!scenes.has('bridge'))}else{assert.ok(scenes.has('bridge'));assert.ok(!scenes.has('rainboat'))}
  report[ending]={beats:s.frames.length,decisions,characters:s.frames.reduce((n,b)=>n+b.text.length,0),people:cast.size,scenes:scenes.size,commands:s.commands};
 }
 writeFileSync(evidencePath('docs/evidence/v5-route-metrics.json'),JSON.stringify({routes:report,people:[...totalPeople],scenes:[...totalScenes],interpretation:'automated route replay, not human play-time or player approval'},null,2));
 assert.equal(totalScenes.size,Object.keys(campaignScenes).length);
 assert.ok(totalPeople.size>=28);
 assert.equal(Object.keys(campaignEndings).length,8);
});
test('choice, actor-entry, CG and ending snapshots replay exactly; wrong story/tampering rejected',()=>{
 const s=new VNRuntime(content,edition.version);let checked=0;
 while(!s.frame.ending){
  if(s.frame.choices.length||s.frame.stage.cg){const raw=JSON.stringify(s.save());assert.deepEqual(restoreVN(raw,edition).session.frames,s.frames);const forged={...s.save(),presentation:{...s.save().presentation,beatId:'forged'}};assert.throws(()=>restoreVN(JSON.stringify(forged),edition),/不一致/);checked++}
  if(s.frame.choices.length){assert.throws(()=>s.advance(),/明确选择/);s.choose(s.frame.choices[0].id)}else s.advance();
 }
 assert.ok(checked>40);assert.throws(()=>restoreVN(JSON.stringify(new VNRuntime().save()),edition),/作品|版本/);
});
test('seeded route variations terminate with legal stages; report measured source coverage',()=>{
 const beats=new Set<string>(),choices=new Set<string>(),endings=new Set<string>();let seed=71;
 for(let run=0;run<120;run++){
  const s=new VNRuntime(content,edition.version);
  while(true){const f=s.frame;beats.add(f.id);assert.ok(f.stage.cast.length<=3);if(f.speaker&&f.speaker!=='you')assert.ok(f.stage.cast.includes(f.speaker));assert.equal(new Set(f.stage.cast.map(id=>campaignCharacters[id].portrait.file)).size,f.stage.cast.length,`portrait collision ${f.id}`);
   assert.ok(!f.choices.some(c=>!c.text));if(f.ending){endings.add(f.ending);break}
   if(f.choices.length){seed=(Math.imul(seed,1664525)+1013904223)>>>0;const c=f.choices[(seed>>>16)%f.choices.length];choices.add(c.id);s.choose(c.id)}else s.advance();assert.ok(s.commands.length<1500)
  }
 }
 const source=readFileSync('story/campaign.ink','utf8');const declared=[...source.matchAll(/# beat:([a-z0-9_]+)/g)].map(m=>m[1]);
 const unvisited=declared.filter(x=>!beats.has(x));
 writeFileSync(evidencePath('docs/evidence/v5-sampled-coverage.json'),JSON.stringify({seed:71,runs:120,sourceBeats:declared.length,visitedBeats:beats.size,choices:choices.size,endings:[...endings],unvisited,exhaustive:false},null,2));
 assert.ok(beats.size>800);assert.ok(choices.size>100);assert.equal(Object.keys(campaignCharacters).length,32);
});
