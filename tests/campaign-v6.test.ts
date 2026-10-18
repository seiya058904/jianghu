import {evidencePath} from './evidence-path.ts';
import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync,writeFileSync} from 'node:fs';
import {VNRuntime,restoreVN} from '../src/vn-runtime.ts';
import content from '../src/generated/campaign-v6.json' with {type:'json'};
import {campaignRoutes,pickChoice} from './campaign-routes.ts';
const edition={content,version:'tide-promise-2.0.0'};
function walk(preferred:string[]=[],random?:()=>number,override?:string){const s=new VNRuntime(content,edition.version);let gap=0,longest=0,decisions=0;while(!s.frame.ending){if(s.frame.choices.length){s.choose(random?s.frame.choices[random()%s.frame.choices.length].id:(s.frame.choices.find(c=>c.id===override)??pickChoice(s.frame.choices,preferred)).id);decisions++;gap=0}else{s.advance();longest=Math.max(longest,++gap)}assert.ok(s.commands.length<1800)}return{s,decisions,longest,text:s.frames.map(f=>f.text).join('\n'),scenes:[...new Set(s.frames.map(f=>f.stage.scene))]}}
test('v6 preview preserves eight reachable ending families while all three chapter-seven/nine/ten paths and independent after-scenes run',()=>{
 const routes:Record<string,unknown>={};
 for(const [ending,preferred] of Object.entries(campaignRoutes)){
  const r=walk(preferred);assert.equal(r.s.frame.ending,ending,ending);
  for(const scene of ['v6_depart','v6_contract','v6_wind','v6_levee'])assert.ok(r.scenes.includes(scene),`${ending} missing ${scene}`);
  assert.deepEqual(restoreVN(JSON.stringify(r.s.save()),edition).session.frames,r.s.frames);
  assert.throws(()=>restoreVN(JSON.stringify(r.s.save()),{content,version:'tide-promise-1.0.0'}),/作品或版本不兼容/);
  assert.ok(!r.s.frames.some(frame=>frame.id.startsWith('c_ordinary_day')));
  assert.equal(new Set(r.s.frames.filter(f=>/^c6_v6_after_(harbor|name|together|teacher|captain|apart|scar|lost)_/.test(f.id)).map(f=>f.id.split('_').slice(0,4).join('_'))).size,1);
  routes[ending]={beats:r.s.frames.length,decisions:r.decisions,longestPassiveGap:r.longest,scenes:r.scenes};
  writeFileSync(evidencePath(`docs/evidence/v6/main-draft-transcript-${ending}.txt`),r.text);
 }
 const stay=walk(['route_stay']);
 assert.equal(stay.s.frame.ending,'harbor');assert.ok(stay.scenes.includes('v6_stay')&&stay.scenes.includes('v6_staycare'));
 assert.ok(!stay.scenes.some(id=>['v6_bridge','v6_ridge','v6_reeds','v6_rainboat'].includes(id)));
 assert.match(stay.text,/两只好手/);assert.doesNotMatch(stay.text,/我的手不能爬/);
 const injured=walk(['route_stay','v6_tie_flag']);
 assert.match(injured.text,/我的手不能爬/);assert.doesNotMatch(injured.text,/才向高杆走去/);
 routes.stay={beats:stay.s.frames.length,decisions:stay.decisions,longestPassiveGap:stay.longest,scenes:stay.scenes};
 writeFileSync(evidencePath('docs/evidence/v6/main-draft-three-route-audit.json'),JSON.stringify({status:'DRAFT_NOT_FINAL',version:edition.version,routes,limits:'Node playthroughs and paired consequences only; new art, browser paths and editorial rounds pending.'},null,2));
});
test('v6 preview samples route variants without a dead end and reports genuinely unvisited source nodes',()=>{
 const seen=new Set<string>();let state=0x16a4b5;
 for(let i=0;i<160;i++){const r=walk([],()=>{state=(Math.imul(state,1664525)+1013904223)>>>0;return state>>>16});r.s.frames.forEach(f=>seen.add(f.id))}
 const declared=[...readFileSync('story/campaign-v6.ink','utf8').matchAll(/# beat:(\S+)/g)].map(m=>m[1]);
 const missed=declared.filter(id=>!seen.has(id));
 assert.ok(seen.size>1000);assert.ok(missed.length<50,`missed ${missed.length} nodes need targeted routes`);
 writeFileSync(evidencePath('docs/evidence/v6/main-draft-coverage.json'),JSON.stringify({sampledPaths:160,exhaustive:false,declared:declared.length,visited:seen.size,missed},null,2));
});

test('five distinct canon incidents change later practical outcomes while holding the other choices fixed',()=>{
 const baseline=walk();
 const pairs=[
  {choice:'v6_delegate_books',early:'c6_v6_books_',late:'c6_v6_canon_reckon_',yes:/客舍那夜分开晾透了/,no:/粘住的那几页还没分开/},
  {choice:'v6_name_own_shift',early:'c6_v6_roles_anchor_',late:'c6_v6_canon_reckon_',yes:/两班木牌照出发前走的换过/,no:/后船没接上人/},
  {choice:'v6_leave_rested',early:'c6_v6_roles_after_',late:'c6_v6_sluice_',yes:/出发前练过的两声接在一起/,no:/回头多走的这一段/},
  {choice:'v6_keep_evening',early:'c6_v6_grain_inventory_',late:'c6_v6_sluice_',yes:/横梯搭上/,no:/只能绕内巷/},
  {choice:'v6_split_rumor',early:'c6_v6_evidence_',late:'c6_v6_canon_reckon_',yes:/你签过的私试照原样留了/,no:/明日都得早到一刻/},
 ];
 const ledger=[];
 for(const pair of pairs){
  const changed=walk([pair.choice]);
  const frames=(r:ReturnType<typeof walk>)=>r.s.frames.filter(frame=>frame.id.startsWith(pair.late)).map(frame=>frame.text).join('\n');
  assert.match(frames(baseline),pair.yes);assert.doesNotMatch(frames(baseline),pair.no);
  assert.match(frames(changed),pair.no);assert.doesNotMatch(frames(changed),pair.yes);
  assert.equal(changed.s.frame.ending,baseline.s.frame.ending,'These consequences must not replace the established ending conditions.');
  const early=changed.s.frames.findIndex(f=>f.id.startsWith(pair.early));const late=changed.s.frames.findIndex(f=>f.id.startsWith(pair.late));
  assert.ok(early>=0&&late>early+20,`${pair.choice}: payoff must occur after intervening play`);
  ledger.push({onlyChangedChoice:pair.choice,sourceBeat:changed.s.frames[early].id,payoffBeat:changed.s.frames[late].id,interveningFrames:late-early-1,baseline:frames(baseline),counterfactual:frames(changed)});
 }
 writeFileSync(evidencePath('docs/evidence/v6/main-canon-paired-consequences.json'),JSON.stringify({method:'Same first-choice path except one named early decision; compare later scene with all other choices fixed.',pairs:ledger},null,2));
});

test('early injuries accumulate across chapters: each single contribution can change a prepared rescue into the scar outcome',()=>{
 const two=walk(['load_shoulder','bridge_jump']);
 assert.equal(two.s.frame.ending,'harbor');
 const three=walk(['load_shoulder','bridge_jump','duel_risk']);
 assert.equal(three.s.frame.ending,'scar');assert.match(three.text,/伤处先替你松了力/);
 for(const alternate of ['load_unload','bridge_expert','duel_three']){
  const r=walk(['load_shoulder','bridge_jump','duel_risk',alternate]);
  assert.equal(r.s.frame.ending,'harbor',alternate);assert.match(r.text,/照鲤借船身的转向靠拢/);
 }
 const hall=walk(['load_shoulder','bridge_jump','press_again']);
 assert.equal(hall.s.frame.ending,'scar');
 const hurried=walk(['final_hurry']);assert.equal(hurried.s.frame.ending,'lost');
 assert.match(hurried.text,/手臂先替你松了力/);assert.doesNotMatch(hurried.text,/伤处先替你松了力/);
});

test('the promised extra month survives every ending family instead of disappearing when the player leaves the harbor',()=>{
 for(const [ending,preferred] of Object.entries(campaignRoutes)){
  const r=walk([...preferred,'v6_cover_shift']);assert.equal(r.s.frame.ending,ending);
  if(ending==='scar')assert.match(r.text,/我先垫替工的钱/);
  else assert.match(r.text,/月底回执签完/);
  if(['together5','apart'].includes(ending))assert.match(r.text,/你等下一队/);
  assert.doesNotMatch(r.text,/凌照衡/);
 }
});

test('thirty manually reviewed main decisions retain exclusive later consequences, including ten delayed high-weight decisions',()=>{
 const ledger=JSON.parse(readFileSync('story/campaign/causal-ledger-v6.json','utf8'));
 assert.equal(ledger.records.length,30);assert.equal(new Set(ledger.records.map(r=>r.point)).size,30);
 assert.ok(ledger.records.filter(r=>r.weight==='high').length>=10);
 const results=[];
 for(const row of ledger.records){
  const a=walk(row.preferred),b=walk(row.preferred,undefined,row.other);
  const early=a.s.frames.findIndex(f=>f.choices.some(c=>c.id===row.anchor)&&f.choices.some(c=>c.id===row.other));
  assert.ok(early>=0,`${row.id}: missing authored decision`);
  assert.ok(a.s.frames[early].id.startsWith(row.point+'_'),row.id);
  assert.equal(b.s.frames[early].id,a.s.frames[early].id,row.id);
  assert.deepEqual(a.s.commands.slice(0,early),b.s.commands.slice(0,early),`${row.id}: prefix must be identical`);
  assert.notEqual(a.s.commands[early],b.s.commands[early],`${row.id}: one real input must change`);
  assert.equal(b.s.commands[early],`choice:${row.other}`,row.id);
  assert.notEqual(a.s.frames[early].stage.scene,row.laterA,row.id);
  assert.notEqual(b.s.frames[early].stage.scene,row.laterB,row.id);
  const late=(r:ReturnType<typeof walk>,scene:string)=>r.s.frames.filter((f,i)=>i>early&&f.stage.scene===scene&&f.kind!=='ending').map(f=>f.text).join('\n');
  const lateA=late(a,row.laterA),lateB=late(b,row.laterB);
  assert.ok(lateA.includes(row.a)&&!lateB.includes(row.a),`${row.id}: baseline consequence must be exclusive`);
  assert.ok(lateB.includes(row.b)&&!lateA.includes(row.b),`${row.id}: counterfactual consequence must be exclusive`);
  const atA=a.s.frames.findIndex((f,i)=>i>early&&f.stage.scene===row.laterA&&f.text.includes(row.a));
  const atB=b.s.frames.findIndex((f,i)=>i>early&&f.stage.scene===row.laterB&&f.text.includes(row.b));
  if(row.weight==='high')assert.ok(atA-early>20&&atB-early>20,`${row.id}: high weight is delayed across intervening play`);
  results.push({id:row.id,decisionPoint:row.point,weight:row.weight,effect:row.effect,preferred:row.preferred,baselineChoice:a.s.commands[early],changedChoice:b.s.commands[early],earlyBeat:a.s.frames[early].id,baseline:{beat:a.s.frames[atA].id,scene:row.laterA,quote:a.s.frames[atA].text,distance:atA-early,ending:a.s.frame.ending},counterfactual:{beat:b.s.frames[atB].id,scene:row.laterB,quote:b.s.frames[atB].text,distance:atB-early,ending:b.s.frame.ending}});
 }
 const plain=walk(['route_stay']),advanced=walk(['route_stay','v6_advance_wage']);
 assert.doesNotMatch(plain.text,/会场把那笔路费还馆里了/);assert.match(advanced.text,/会场把那笔路费还馆里了/);
 writeFileSync(evidencePath('docs/evidence/v6/main-reviewed-causal-ledger.json'),JSON.stringify({status:'PAIRED_REGRESSIONS_PASS_NOT_EXTERNAL_PLAYTEST',decisions:30,highWeight:results.filter(r=>r.weight==='high').length,method:ledger.method,excluded:ledger.excluded,results},null,2));
});
