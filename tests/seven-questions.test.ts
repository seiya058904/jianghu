import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync,writeFileSync} from 'node:fs';
import {createHash} from 'node:crypto';
import frozen from '../src/generated/seven-questions-v1.json' with {type:'json'};
import {VNRuntime,restoreVN} from '../src/vn-runtime.ts';
import content from '../src/generated/seven-questions.json' with {type:'json'};
const edition={content,version:'seven-questions-2.0.0'};
function run(pick:(ids:string[])=>string){const s=new VNRuntime(content,edition.version);let gap=0,longest=0;while(!s.frame.ending){if(s.frame.choices.length){s.choose(pick(s.frame.choices.map(c=>c.id)));gap=0}else{s.advance();longest=Math.max(longest,++gap)}assert.ok(s.commands.length<700)}return{s,text:s.frames.map(f=>f.text).join('\n'),longest}}
const route=(overrides:string[]=[])=>run(ids=>ids.find(id=>overrides.includes(id))??ids[0]);

test('Seven Questions V2 chronology keeps east duel before slow-team reunion for either viewpoint',()=>{
 for(const partner of [[],['sq_joint_nanyue']])for(const court of [false,true]){
  const r=route([...partner,...(court?['sq_hold_courtyard']:[])]),ids=r.s.frames.map(f=>f.id);
  assert.ok(ids.indexOf(court?'sq_east_gate_7':'sq_east_gate_2')<ids.indexOf('sq_converge_1'));
  assert.ok(ids.indexOf('sq_converge_1')<ids.indexOf('sq_middle_chairs_1'));
  if(court){assert.ok(ids.includes('sq_court_report_4'));assert.ok(!ids.includes('sq_hui_turn_1'));const arriving=route([...partner,'sq_hold_courtyard','sq_pair_arrivals']);assert.match(arriving.text,/最先回来的两名传讯人/);assert.ok(arriving.s.frames.findIndex(f=>f.id==='sq_east_gate_7')<arriving.s.frames.findIndex(f=>f.id==='sq_converge_1'))}else{assert.match(r.text,/你随慢队回到院时，东门已经收势/);assert.ok(!ids.includes('sq_eighty_one_1'))}
  assert.doesNotMatch(r.text,/两日前还要争得见血的人/);
 }
});

test('Seven Questions recovered questions, waiting for notes and paid handover have distinct delayed consequences',()=>{
 for(const court of [false,true])for(const teacher of [false,true]){
  const base=[...(court?['sq_hold_courtyard']:[]),...(teacher?['sq_choose_reading']:[])];
  for(const [alternative,positive,negative]of [
   ['sq_deliver_sources','三处字旁另有小楷','送午饭的人已把担子挑走'],
   ['sq_check_injured','仍认得提问人的字','请他重新讲一遍'],
   ['sq_pay_next_shift','才知道自己答应的剩下这一份有多重','下一次开课便自己修那张旧凳'],
  ]){const a=route(base),b=route([...base,alternative]);assert.match(a.text,new RegExp(positive));assert.doesNotMatch(a.text,new RegExp(negative));assert.match(b.text,new RegExp(negative));assert.doesNotMatch(b.text,new RegExp(positive));assert.equal(a.s.frame.ending,b.s.frame.ending);const changed=a.s.commands.findIndex((command,i)=>command!==b.s.commands[i]);assert.ok(changed>0);assert.deepEqual(a.s.commands.slice(0,changed),b.s.commands.slice(0,changed));assert.deepEqual(restoreVN(JSON.stringify(b.s.save()),edition).session.frames,b.s.frames)}
 }
});

test('Seven Questions frozen V1 remains exact and both old routes restore only in their own edition',()=>{
 for(const [file,hash]of [['story/seven-questions-v1.ink','c788b74ec54af765beac3ed5d482271101e41cee307fe351e7cee0481a6215a4'],['src/generated/seven-questions-v1.json','2763e894391f75703da0e3b021b30455cf5234134c7c15cd2760d83b044a2791']])assert.equal(createHash('sha256').update(readFileSync(file)).digest('hex'),hash);
 for(const side of [0,1]){const s=new VNRuntime(frozen,'seven-questions-1.0.0');while(!s.frame.ending){assert.deepEqual(restoreVN(JSON.stringify(s.save()),{content:frozen,version:'seven-questions-1.0.0'}).session.frames,s.frames);s.frame.choices.length?s.choose(s.frame.choices[side].id):s.advance()}assert.throws(()=>restoreVN(JSON.stringify(s.save()),edition),/版本/);assert.equal(s.frame.ending,side?'sq_open_lesson':'sq_shared_road')}
});
test('Seven Questions full two routes retain canon losses, fourteen houses, distinct perpetrators and actual disposition',()=>{
 for(const side of [0,1]){const r=run(ids=>ids[side]);assert.equal(r.s.frame.ending,side?'sq_open_lesson':'sq_shared_road');
  for(const phrase of ['二十四死、两重伤、一失踪','七卷','多送了一寸','一百三十余招','喉骨，从外往里碎','周北衡','十四张椅子','张玄初','司马归元','公孙照雪','妙澄','罗承岳','裴照庭','许问岑','第九十六招','盐水长期浸过','萧天策','闻人宿','第八十一招','这只是我','第三十七招','第四十一招','二十七年','只有前三卷','后四卷','前两卷逐步外流','第三至七','至少三家共验','武道无籍','最终没有返真'])assert.ok(r.text.includes(phrase),phrase);
  assert.match(r.text,/七人，六(?:个)?蒙面/);
  assert.deepEqual(restoreVN(JSON.stringify(r.s.save()),edition).session.frames,r.s.frames);
  assert.throws(()=>restoreVN(JSON.stringify(r.s.save()),{content,version:'two-swords-1.0.0'}),/作品或版本不兼容/);
  assert.ok(!r.s.frames.some(f=>f.stage.cast.some(id=>id.startsWith('ss_'))),'different era does not reuse previous book actors');
  assert.ok(!r.s.frames.filter(f=>f.stage.scene==='sq_after').some(f=>f.stage.cast.length),'posthumous record has no standing dead elder');
  writeFileSync(`docs/evidence/v6/seven-questions-${r.s.frame.ending}-transcript.txt`,r.text);
 }
});
test('Seven Questions single half-day preparation changes health in each route while fixed deaths remain fixed',()=>{
 for(const court of [false,true]){const base=court?['sq_hold_courtyard']:[],water=route(base),relay=route([...base,'sq_set_relay']);
  const at=water.s.commands.indexOf('choice:sq_walk_water');assert.ok(at>0);assert.deepEqual(water.s.commands.slice(0,at),relay.s.commands.slice(0,at));
  if(court){assert.match(water.text,/右臂烫伤，养伤三个月/);assert.match(relay.text,/人没受重伤/);assert.doesNotMatch(relay.text,/右臂烫伤，养伤三个月/)}else{assert.match(water.text,/他踩实了，没从湿树侧面滑下/);assert.match(relay.text,/腿撞在石棱/);assert.match(relay.text,/腿伤门人三个月后重新走远路/);assert.doesNotMatch(water.text,/腿伤门人三个月后/)}
  for(const r of [water,relay])assert.match(r.text,/青石驿押送队二十四死、两重伤、一失踪/);
 }
});
test('Seven Questions route choice changes witnessed action and uses reports for the other location',()=>{
 const valley=route(),court=route(['sq_hold_courtyard']);const at=valley.s.commands.indexOf('choice:sq_follow_valley');assert.ok(at>0);assert.deepEqual(valley.s.commands.slice(0,at),court.s.commands.slice(0,at));
 assert.ok(valley.s.frames.some(f=>f.id==='sq_hui_turn_1'));assert.ok(!valley.s.frames.some(f=>f.id==='sq_eighty_one_1'));
 assert.ok(court.s.frames.some(f=>f.id==='sq_eighty_one_1'));assert.ok(!court.s.frames.some(f=>f.id==='sq_hui_turn_1'));
 assert.match(valley.text,/你随慢队回到院时，东门已经收势/);assert.doesNotMatch(valley.text,/从外廊望见闻人宿遇上陆青崖/);assert.match(court.text,/从外廊望见闻人宿遇上陆青崖/);
 assert.ok(!valley.s.frames.some(f=>f.stage.scene==='sq_east'));assert.ok(court.s.frames.some(f=>f.stage.scene==='sq_east'));assert.ok(!court.s.frames.some(f=>f.stage.scene==='sq_east_record'),'courtyard eyewitness must not unlock the reported-history chapter from a shared opening frame');
 const first=route(),other=route(['sq_joint_nanyue']);assert.ok(first.s.frames.some(f=>f.stage.scene==='sq_valley'&&f.speaker==='sq_hesheng'));assert.ok(other.s.frames.some(f=>f.stage.scene==='sq_valley'&&f.speaker==='sq_asheng'));
 assert.ok(!first.s.frames.filter(f=>f.stage.scene==='sq_valley').some(f=>f.stage.cast.includes('sq_asheng')));assert.ok(!other.s.frames.filter(f=>f.stage.scene==='sq_valley').some(f=>f.stage.cast.includes('sq_hesheng')));
});
test('Seven Questions early joint witness and shared testing change later introduction and remaining verification work',()=>{
 const joint=route(),urgent=route(['sq_send_urgent']);const at=joint.s.commands.indexOf('choice:sq_send_with_witness');assert.ok(at>0);assert.deepEqual(joint.s.commands.slice(0,at),urgent.s.commands.slice(0,at));
 assert.match(joint.text,/往后的共同验案有人肯带你去做交接/);assert.match(urgent.text,/你后来补走一趟/);
 const promised=route(),paid=route(['sq_pay_next_shift']);assert.match(promised.text,/剩下这一份，写我的名字/);assert.match(paid.text,/你少了一份束脩/);
});
test('Seven Questions sampled paths cover all authored beats and options without passive exposition stretches',()=>{
 const visited=new Set<string>(),choices=new Set<string>(),endings=new Set<string>();let longest=0;
 for(let seed=1;seed<=512;seed++){let state=Math.imul(seed,2654435761)>>>0;const r=run(ids=>{state=(Math.imul(state,1664525)+1013904223)>>>0;return ids[state>>>31]});for(const f of r.s.frames){visited.add(f.id);f.choices.forEach(c=>choices.add(c.id));assert.ok(f.stage.cast.length<=3)}endings.add(r.s.frame.ending!);longest=Math.max(longest,r.longest)}
 const declared=[...readFileSync('story/seven-questions.ink','utf8').matchAll(/# beat:(\S+)/g)].map(m=>m[1]);assert.deepEqual([...visited].sort(),declared.sort());assert.equal(choices.size,62);assert.equal(endings.size,2);
 writeFileSync('docs/evidence/v6/seven-questions-content-audit.json',JSON.stringify({status:'SECOND_BOOK_V2_INTERNAL_EDITORIAL_NOT_FINAL_ACCEPTANCE',sourceBeats:declared.length,visited:visited.size,choiceOptions:choices.size,decisionsByRoute:{valley:27,courtyard:26},sampledPaths:512,exhaustive:false,longestPassiveGap:longest,limits:'Three internal editorial purposes recorded in SEVEN_QUESTIONS_V2_EDITORIAL.md. Fire, injury and fourteen-chair visual staging, dedicated identities, special action/CG, first-book editorial work and external acceptance remain incomplete. No human playtime claim.'},null,2));assert.ok(longest<=18,`longest passive gap ${longest}`);
});
