import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync,writeFileSync} from 'node:fs';
import {VNRuntime,restoreVN} from '../src/vn-runtime.ts';
import content from '../src/generated/longmen-v1.json' with {type:'json'};
const edition={content,version:'longmen-1.0.0'};
function run(pick:(ids:string[])=>string){const s=new VNRuntime(content,edition.version);let gap=0,longest=0;while(!s.frame.ending){if(s.frame.choices.length){s.choose(pick(s.frame.choices.map(c=>c.id)));gap=0}else{s.advance();longest=Math.max(longest,++gap)}assert.ok(s.commands.length<350)}return{s,longest,text:s.frames.map(f=>f.text).join('\n')}}
test('Longmen two endings preserve fixed bouts, sourced recollection and the five-year jump',()=>{
 const travel=run(ids=>ids[0]),home=run(ids=>ids[1]);
 assert.equal(travel.s.frame.ending,'lm_travel');assert.equal(home.s.frame.ending,'lm_home');
 for(const r of [travel,home]){
  assert.match(r.text,/第一百一十九合/);assert.match(r.text,/第四十七招/);assert.match(r.text,/第一剑/);
  assert.match(r.text,/五年以后/);assert.match(r.text,/贺景庭百岁后自请退榜/);
  assert.match(r.text,/今日亲口回述/);assert.ok(r.longest<=18);
  assert.deepEqual(restoreVN(JSON.stringify(r.s.save()),edition).session.frames,r.s.frames);
  assert.throws(()=>restoreVN(JSON.stringify(r.s.save()),{content,version:'taihua-1.0.0'}),/作品或版本不兼容/);
 }
 assert.match(travel.text,/送剑那一段/);assert.match(home.text,/轮到你留在门口/);
 writeFileSync('docs/evidence/v6/longmen-travel-transcript.txt',travel.text);
 writeFileSync('docs/evidence/v6/longmen-home-transcript.txt',home.text);
});
test('Longmen paired spectator duty changes what was witnessed; early overwork and lifting carries a later limit',()=>{
 const safe=run(ids=>ids[0]);const strained=run(ids=>ids.includes('lm_travel_choice')?'lm_travel_choice':ids[1]);
 assert.match(safe.text,/没有看全后八剑/);assert.doesNotMatch(safe.text,/九剑，你都看见了/);
 assert.match(strained.text,/九剑，你都看见了/);assert.match(strained.text,/这几日别出力试手/);
 assert.doesNotMatch(safe.text,/这几日别出力试手/);
 assert.match(strained.text,/上路头三日/);assert.match(strained.text,/直到第四日/);
 const homeHurt=run(ids=>ids.find(id=>['lm_practice_more','lm_take_frame','lm_home_choice'].includes(id))??ids[0]);
 assert.match(homeHurt.text,/这三日你只排步位/);assert.doesNotMatch(homeHurt.text,/上路头三日/);
});
test('Longmen sampled paths cover authored nodes without inventing a hidden conversation for the apprentice',()=>{
 const visited=new Set<string>(),people=new Set<string>();let longest=0;
 for(let seed=1;seed<=128;seed++){
  let state=Math.imul(seed,2654435761)>>>0;
  const r=run(ids=>{state=(Math.imul(state,1664525)+1013904223)>>>0;return ids[state>>>31]});
  r.s.frames.forEach(f=>{visited.add(f.id);f.stage.cast.forEach(id=>people.add(id))});longest=Math.max(longest,r.longest);
  assert.doesNotMatch(r.text,/贺老若年轻二十年/,'the private post-meeting conversation was not witnessed by this POV');
 }
 const declared=[...readFileSync('story/longmen-v1.ink','utf8').matchAll(/# beat:(\S+)/g)].map(m=>m[1]);
 assert.deepEqual([...visited].sort(),declared.sort());assert.equal(people.size,9);
 writeFileSync('docs/evidence/v6/longmen-content-audit.json',JSON.stringify({status:'DRAFT_NOT_FINAL',sourceBeats:declared.length,visited:visited.size,decisionPointsPerRoute:20,choiceOptions:42,cast:[...people],sampledPaths:128,exhaustive:false,longestPassiveGap:longest,limits:'Expanded supplement scenes require production browser and full editorial review; not final acceptance.'},null,2));
});
test('Longmen playable Qinghe recollection explicitly switches age and viewpoint while all three cane results stay fixed',()=>{
 for(const side of [0,1]){
  const r=run(ids=>ids[side]);
  for(const text of ['许重山五十六岁','清和八十四','右肘忽然无处可落','胸前已空','喉前两寸','二十年后，何必还是今日这一刀','你是来借刀的门人，不是当年的许重山'])assert.ok(r.text.includes(text),text);
  assert.match(r.text,/一百一十九|第一百一十九/);assert.match(r.text,/第四十七招/);
 }
});
test('Longmen early school and outsider paths have different partners and later work or trust costs from one changed input',()=>{
 const walk=(overrides:string[])=>run(ids=>ids.find(id=>overrides.includes(id))??ids[0]);
 const taught=walk([]),paper=walk(['lm_copy_lane']),exact=walk(['lm_route_guest']),smooth=walk(['lm_route_guest','lm_smooth_post']);
 assert.match(taught.text,/他能守这一小段/);assert.doesNotMatch(paper.text,/他能守这一小段/);
 assert.match(paper.text,/抬架那头的同门多等了一会/);
 assert.match(exact.text,/下一封帖，也请你送/);assert.doesNotMatch(smooth.text,/下一封帖，也请你送/);
 assert.match(smooth.text,/没再请你替他递/);
 for(const [a,b,cid]of [[taught,paper,'lm_show_lane'],[exact,smooth,'lm_deliver_exact']] as const){
  const at=a.s.commands.indexOf(`choice:${cid}`);assert.ok(at>0);assert.deepEqual(a.s.commands.slice(0,at),b.s.commands.slice(0,at));
 }
 assert.doesNotMatch(taught.text,/你替他把门让开，没有去拆/);assert.doesNotMatch(exact.text,/新门人拿着早饭后那张图/);
});
