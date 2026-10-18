import {evidencePath} from './evidence-path.ts';
import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync,writeFileSync} from 'node:fs';
import {VNRuntime,restoreVN} from '../src/vn-runtime.ts';
import content from '../src/generated/taihua-v2.json' with {type:'json'};
import {chronicleCharacters} from '../src/chronicle-catalog.ts';
import {resolvePortrait} from '../src/catalog.ts';
import {taihuaV2Chapters} from '../src/taihua-v2-catalog.ts';
const edition={content,version:'taihua-2.0.0'};
function run(pick:(ids:string[])=>string,restore=false){
 const session=new VNRuntime(content,edition.version);let gap=0,maxGap=0;
 while(!session.frame.ending){
  if(session.frame.choices.length){
   if(restore)assert.deepEqual(restoreVN(JSON.stringify(session.save()),edition).session.frames,session.frames);
   session.choose(pick(session.frame.choices.map(c=>c.id)));gap=0;
  }else{session.advance();maxGap=Math.max(maxGap,++gap)}
  assert.ok(session.commands.length<650,'bounded complete story');
 }
 return {session,maxGap,text:session.frames.map(f=>f.text).join('\n')};
}
test('Taihua two actual endings replay choices, preserve canon, and fulfil different plans',()=>{
 const together=run(ids=>ids[0],true),letter=run(ids=>ids[1],true);
 assert.equal(together.session.frame.ending,'th_company');assert.equal(letter.session.frame.ending,'th_letter');
 for(const r of [together,letter]){
  assert.match(r.text,/第一百零二手/);assert.match(r.text,/第二百一十八手/);
  assert.match(r.text,/这一回，你败/);assert.match(r.text,/第四手.*没有原先那条路/);
  assert.match(r.text,/霍停云、明澄、谢临川、司马承一、陆青珩、沈照微/);
  assert.ok(r.maxGap<=18,`longest passive gap ${r.maxGap}`);
  assert.deepEqual(restoreVN(JSON.stringify(r.session.save()),edition).session.frames,r.session.frames);
  assert.throws(()=>restoreVN(JSON.stringify(r.session.save()),{content,version:'tide-promise-1.0.0'}),/作品或版本不兼容/);
 }
 assert.match(together.text,/院里有人笑/);assert.doesNotMatch(letter.text,/院里有人笑/);
 assert.match(letter.text,/你确实错过了/);assert.doesNotMatch(together.text,/你确实错过了/);
 writeFileSync(evidencePath('docs/evidence/v6/taihua-v2-company-transcript.txt'),together.text);
 writeFileSync(evidencePath('docs/evidence/v6/taihua-v2-letter-transcript.txt'),letter.text);
});
test('Taihua seeded branch sample reaches all authored beats without loops or missing actors',()=>{
 const beats=new Set<string>(),choices=new Set<string>(),people=new Set<string>();const endings=new Set<string>();let maxGap=0;
 for(let seed=1;seed<=512;seed++){
  let state=Math.imul(seed,2654435761)>>>0;
  const r=run(ids=>{state=(Math.imul(state,1664525)+1013904223)>>>0;return ids[(state>>>16)%ids.length]});
  for(const frame of r.session.frames){beats.add(frame.id);frame.stage.cast.forEach(id=>people.add(id));frame.choices.forEach(c=>choices.add(c.id))}
  maxGap=Math.max(maxGap,r.maxGap);assert.ok(r.maxGap<=18,`sampled passive gap ${r.maxGap}`);endings.add(r.session.frame.ending!);
 }
 const declared=[...readFileSync('story/taihua-v2.ink','utf8').matchAll(/# beat:(\S+)/g)].map(match=>match[1]);
 assert.deepEqual([...beats].sort(),declared.sort());assert.equal(choices.size,61);assert.equal(endings.size,3);
 assert.equal(people.size,18);
 const dedicated=[...people].filter(id=>chronicleCharacters[id].portrait.kind==='dedicated');
 writeFileSync(evidencePath('docs/evidence/v6/taihua-v2-content-audit.json'),JSON.stringify({status:'DRAFT_IMPLEMENTED_NOT_FINAL_ACCEPTANCE',sampledPaths:512,exhaustive:false,reachableBeats:beats.size,choiceOptions:choices.size,decisionPoints:30,cast:[...people],endings:[...endings],longestPassiveGap:maxGap,dedicatedNewPortraits:dedicated,notes:'Remaining temporary portraits explicitly marked templates. Statistical content reach is not editorial or visual acceptance.'},null,2));
});
test('early physical overreach plus late heavy lifting carries a delayed cost; prior private agreement changes the actual practice partner',()=>{
 const rough=run(ids=>ids.find(id=>['th_rush','th_force','th_carry','th_together'].includes(id))??ids[0]);
 const shared=run(ids=>ids.find(id=>['th_rush','th_force','th_share_load','th_together','th_ownwork'].includes(id))??ids[0]);
 assert.match(rough.text,/有一个月不能抬剑/);assert.doesNotMatch(shared.text,/有一个月不能抬剑/);
 assert.match(rough.text,/沈照微先摆第一场/);assert.doesNotMatch(shared.text,/沈照微先摆第一场/);
 assert.match(shared.text,/沈照微没有来复手/);assert.match(shared.text,/司马承一把箱子挪到墙根/);
 assert.ok(shared.session.frames.filter(f=>f.stage.scene==='th_leavepractice').every(f=>!f.stage.cast.includes('th_shen')));
 assert.ok(rough.session.frames.filter(f=>f.stage.scene==='th_home').every(f=>f.stage.cast.every(id=>id==='th_bro')));
});

test('returning early does not erase shoulder damage, and an unmade promise is never invented later',()=>{
 const r=run(ids=>ids.find(id=>['th_rush','th_force','th_carry','th_letter','th_quiet','th_keep_promise','th_ask_huo'].includes(id))??ids[0]);
 assert.equal(r.session.frame.ending,'th_letter');assert.match(r.text,/有一个月不能抬剑/);
 assert.doesNotMatch(r.text,/我前一回答应讲/);assert.match(r.text,/这回我想从头讲/);
 assert.match(r.text,/给霍的信另夹了一页/);
 const another=run(ids=>ids.find(id=>['th_ask_ming','th_letter'].includes(id))??ids[0]);
 assert.match(another.text,/我还是不甘/);assert.doesNotMatch(another.text,/给霍的信另夹了一页/);
});

test('Taihua concrete observation and three-layer escalation preserve each actual combat result',()=>{
 const mistaken=run(ids=>ids[0]),careful=run(ids=>ids.find(id=>id==='th_predict_wait')??ids[0]);
 assert.match(mistaken.text,/我刚才说还能进/);assert.match(careful.text,/我只猜他等/);
 for(const r of [mistaken,careful]){for(const phrase of ['第四十八招','慕容景生三十二','明澄右袖破','肩口又破线','一百四十，两剑轻碰','那一步不稳','一百七十余招','第五十一','一百零三','第一百三十二','第十四','不是多半寸。是前面多了半寸','三十三','十四入白石谷'])assert.ok(r.text.includes(phrase),phrase);const ids=r.session.frames.map(f=>f.id);assert.ok(ids.indexOf('th_fache_open_1')<ids.indexOf('th_chase_1'));assert.ok(ids.indexOf('th_ming_open_1')<ids.indexOf('th_supper_1'));assert.ok(ids.indexOf('th_huo_fifty_three_1')<ids.indexOf('th_round_open_1'));assert.ok(ids.indexOf('th_old_final_1')<ids.indexOf('th_six_open_1'));assert.ok(ids.indexOf('th_six_open_4')<ids.indexOf('th_mu_front_1'));const starts=taihuaV2Chapters.map(([scene])=>r.session.frames.findIndex(f=>f.stage.scene===scene));assert.equal(starts.length,9);assert.ok(starts.every((n,i)=>n>=0&&(!i||n>starts[i-1])));}
});

test('Taihua third outcome receives limited actual instruction, misses peers and respects earlier unasked questions',()=>{
 const guidance=run(ids=>ids.find(id=>id==='th_guidance')??ids[0],true);assert.equal(guidance.session.frame.ending,'th_guidance');assert.match(guidance.text,/一炷香，张没问你第五/);assert.match(guidance.text,/先前真站过的半步/);assert.match(guidance.text,/没有从这一炷香拿回一场同辈复手/);assert.match(guidance.text,/霍要的那页也寄出/);assert.match(guidance.text,/沈没说无妨/);assert.ok(guidance.session.frames.some(f=>f.stage.scene==='th_guidanceyard'&&f.stage.cast.includes('th_zhang')));assert.ok(guidance.session.frames.every(f=>f.stage.scene!=='th_leavepractice'));assert.deepEqual(restoreVN(JSON.stringify(guidance.session.save()),edition).session.frames,guidance.session.frames);writeFileSync(evidencePath('docs/evidence/v6/taihua-v2-guidance-transcript.txt'),guidance.text);
 const noEarlierQuestion=run(ids=>ids.find(id=>['th_note_stop','th_guidance'].includes(id))??ids[0]);assert.match(noEarlierQuestion.text,/没在第六十四手后当场试过/);assert.doesNotMatch(noEarlierQuestion.text,/正式场后你向他比过三处/);
 const missed=run(ids=>ids.find(id=>['th_keep_mu_blank','th_guidance'].includes(id))??ids[0]);assert.notEqual(missed.session.frame.ending,'th_guidance');assert.ok(missed.session.frames.every(f=>f.choices.every(c=>c.id!=='th_guidance')));assert.match(missed.text,/错过的指点不影响青序第五/);
 const injury=run(ids=>ids.find(id=>['th_rush','th_force','th_carry','th_guidance'].includes(id))??ids[0]);assert.match(injury.text,/有一个月不能抬剑/);assert.equal(injury.session.frame.ending,'th_guidance');
});

test('Taihua Mu keeps a distinct expanded look, leaves after returning upstage and does not change frozen defaults',()=>{
 const r=run(ids=>ids[0]);assert.equal(chronicleCharacters.th_mu.portrait.file,'v6/npc-robed-elder-b.webp');assert.equal(r.session.frames.find(f=>f.id==='th_mu_front_5')!.stage.looks?.th_mu,'v2');for(const f of r.session.frames){if(f.stage.cg)continue;const files=f.stage.cast.map(id=>resolvePortrait(id,f.stage.moods[id]??'neutral',f.stage.looks?.[id]).file);assert.equal(new Set(files).size,files.length,f.id)}const exit=r.session.frames.findIndex(f=>f.text.includes('穆转身回上座'));assert.ok(exit>0);assert.ok(r.session.frames.slice(exit+1).every(f=>!f.stage.cast.includes('th_mu')));
});
