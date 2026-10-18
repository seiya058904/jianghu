import {evidencePath} from './evidence-path.ts';
import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync,writeFileSync} from 'node:fs';
import {VNRuntime,restoreVN} from '../src/vn-runtime.ts';
import content from '../src/generated/jade-v1.json' with {type:'json'};
const edition={content,version:'jade-1.0.0'};
function run(pick:(ids:string[])=>string){const s=new VNRuntime(content,edition.version);let gap=0,longest=0;while(!s.frame.ending){if(s.frame.choices.length){s.choose(pick(s.frame.choices.map(c=>c.id)));gap=0}else{s.advance();longest=Math.max(longest,++gap)}assert.ok(s.commands.length<600)}return{s,text:s.frames.map(f=>f.text).join('\n'),longest}}
const route=(overrides:string[]=[])=>run(ids=>ids.find(id=>overrides.includes(id))??ids[0]);
test('Jade full second-volume paths keep thirteen coins, nine actual store outcomes, fixed breakage and ordinary Lu career',()=>{
 for(const side of [0,1]){const r=run(ids=>ids[side]);assert.equal(r.s.frame.ending,side?'jd_archivework':'jd_storework');
  for(const phrase of ['二十文','十三文','婚书','洗三日','半年','璧半、册半','一股酱味','它本来就是拿来找库','第一库挖开，塌了','第二库','酒窖','第三库进水','第四','木架','第五','药','第六库','第七库','第八库','第九库','军械','玉丢不算大事，库丢才算','近百招','第一次','银补脱','残片','第七粮守住','第九真璧碎','不大不小的官','二十文没卖成','二十余年后','皇家赝品'])assert.ok(r.text.includes(phrase),phrase);
  assert.deepEqual(restoreVN(JSON.stringify(r.s.save()),edition).session.frames,r.s.frames);assert.throws(()=>restoreVN(JSON.stringify(r.s.save()),{content,version:'jade-thieves-1.0.0'}),/作品或版本不兼容/);
  assert.ok(!r.s.frames.some(f=>f.stage.cast.some(id=>id.startsWith('jt_'))),'previous century’s thieves do not walk into Lu’s present');
  writeFileSync(evidencePath(`docs/evidence/v6/jade-editorial-archive-v1-${r.s.frame.ending}-transcript.txt`),r.text);
 }
});
test('Jade single surface decision has an explicit three-day private cost and changes witnessed middle scenes',()=>{
 const surface=route(),dark=route(['jd_read_dark_first']);const at=surface.s.commands.indexOf('choice:jd_keep_surface');assert.ok(at>0);assert.deepEqual(surface.s.commands.slice(0,at),dark.s.commands.slice(0,at));
 assert.match(surface.text,/自己垫掉一笔纸钱/);assert.ok(surface.s.frames.some(f=>f.stage.scene==='jd_fourth'));assert.ok(!surface.s.frames.some(f=>f.stage.scene==='jd_returnarchive'));
 assert.ok(dark.s.frames.some(f=>f.stage.scene==='jd_returnarchive'));assert.ok(!dark.s.frames.some(f=>f.stage.scene==='jd_fourth'));assert.match(dark.text,/第四、五库没有跟到现场/);assert.match(dark.text,/没有把那两页又抄成自己也站在里面/);
});
test('Jade seventh grain defence and ninth broken-object event remain different witnessed locations',()=>{
 const grain=route(),record=route(['jd_stay_records']);const at=grain.s.commands.indexOf('choice:jd_stay_grain');assert.ok(at>0);assert.deepEqual(grain.s.commands.slice(0,at),record.s.commands.slice(0,at));
 assert.ok(grain.s.frames.some(f=>f.id==='jd_two_fighters_1'));assert.ok(!grain.s.frames.some(f=>f.id==='jd_three_impacts_1'));assert.match(grain.text,/你在粮路听到这个次序/);
 assert.ok(record.s.frames.some(f=>f.id==='jd_three_impacts_1'));assert.ok(!record.s.frames.some(f=>f.id==='jd_two_fighters_1'));assert.match(record.text,/不是你在第九库也亲见过的那一夜/);
 assert.ok(!grain.s.frames.some(f=>f.stage.scene==='jd_ninthfire'));assert.ok(!record.s.frames.some(f=>f.stage.scene==='jd_grainfight'));
});
test('Jade the early absent-family question changes reunion and winter-money cost in either later post',()=>{
 for(const post of [[],['jd_stay_records']]){const named=route(post),hot=route([...post,'jd_keep_porridge_hot']);const at=named.s.commands.indexOf('choice:jd_receive_people');assert.ok(at>0);assert.deepEqual(named.s.commands.slice(0,at),hot.s.commands.slice(0,at));
  assert.match(named.text,/没有被.*分开|没再被人流分开/);assert.doesNotMatch(named.text,/二十日后父女才重逢/);assert.match(hot.text,/二十日后父女才重逢/);assert.match(hot.text,/冬粮钱里少了一截/);assert.match(hot.text,/先补找人路费/);
  for(const r of [named,hot]){assert.match(r.text,/第七粮守住/);assert.match(r.text,/第九真璧碎/)}
 }
});
test('Jade personal notes have distinct private costs, and He ages only in the late scene',()=>{
 const kept=route(['jd_stay_records']),left=route(['jd_stay_records','jd_leave_private_notes']);assert.match(kept.text,/右手养了一月/);assert.doesNotMatch(left.text,/右手养了一月/);assert.match(left.text,/火里丢的几页私稿没有又在箱底奇迹般找到/);
 const ordinary=route();assert.doesNotMatch(ordinary.text,/右手养了一月|火里丢的几页私稿/);
 const first=ordinary.s.frames.find(f=>f.stage.cast.includes('jd_he'))!,late=ordinary.s.frames.find(f=>f.id==='jd_he_late_1')!;assert.equal(first.stage.looks?.jd_he,undefined);assert.equal(late.stage.looks?.jd_he,'late');
 assert.equal(restoreVN(JSON.stringify(kept.s.save()),edition).session.frame.ending,'jd_storework');
});
test('Jade sampled branches cover all authored beats and options with bounded reading gaps',()=>{
 const visited=new Set<string>(),choices=new Set<string>(),endings=new Set<string>();let longest=0;
 for(let seed=1;seed<=512;seed++){let state=Math.imul(seed,2654435761)>>>0;const r=run(ids=>{state=(Math.imul(state,1664525)+1013904223)>>>0;return ids[state>>>31]});for(const f of r.s.frames){visited.add(f.id);f.choices.forEach(c=>choices.add(c.id));assert.ok(f.stage.cast.length<=3)}endings.add(r.s.frame.ending!);longest=Math.max(longest,r.longest)}
 const declared=[...readFileSync('story/jade-v1.ink','utf8').matchAll(/# beat:(\S+)/g)].map(m=>m[1]);assert.deepEqual([...visited].sort(),declared.sort());assert.equal(choices.size,66);assert.equal(endings.size,2);
 writeFileSync(evidencePath('docs/evidence/v6/jade-editorial-archive-v1-content-audit.json'),JSON.stringify({status:'SECOND_VOLUME_PRODUCTION_DRAFT_NOT_FINAL',sourceBeats:declared.length,visited:visited.size,choiceOptions:choices.size,decisionsPerRoute:28,sampledPaths:512,exhaustive:false,longestPassiveGap:longest,limits:'Actual shop/store interiors, broken-object layers, dedicated protagonists, action/CG, full three editorial rounds and human playtime remain incomplete.'},null,2));assert.ok(longest<=18,`longest passive gap ${longest}`);
});
