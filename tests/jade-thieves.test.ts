import {evidencePath} from './evidence-path.ts';
import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync,writeFileSync} from 'node:fs';
import {VNRuntime,restoreVN} from '../src/vn-runtime.ts';
import {jadeThievesCharacters} from '../src/jade-thieves-catalog.ts';
import content from '../src/generated/jade-thieves-v1.json' with {type:'json'};
const edition={content,version:'jade-thieves-1.0.0'};
function run(pick:(ids:string[])=>string){const s=new VNRuntime(content,edition.version);let gap=0,longest=0;while(!s.frame.ending){if(s.frame.choices.length){s.choose(pick(s.frame.choices.map(c=>c.id)));gap=0}else{s.advance();longest=Math.max(longest,++gap)}assert.ok(s.commands.length<500)}return{s,text:s.frames.map(f=>f.text).join('\n'),longest}}
const route=(overrides:string[]=[])=>run(ids=>ids.find(id=>overrides.includes(id))??ids[0]);
test('Jade first volume has two complete viewpoints with fixed empty box, mutual rescues, Jiang death and genuine-object journey',()=>{
 for(const side of [0,1]){const r=run(ids=>ids.at(side?-1:0)!);assert.equal(r.s.frame.ending,side?'jt_private_account':'jt_unmarked_life');
  for(const phrase of ['空的','四人手间换过','第一次江救沈','第二次江救沈','挡开贴近江颈侧','第三个月','以前哪句是真的','名字','做旧容易，做这么丑难','假的','西角','银补','半年以后','本有机会走','也还行','江十七死了','赎么','最终没有回来','十一年后','十三年','旧铜钱','失败试片','真的太重，假的轻些'])assert.ok(r.text.includes(phrase),phrase);
  const death=r.s.frames.findIndex(f=>f.id==='jt_gone_1');assert.ok(death>0);assert.ok(!r.s.frames.slice(death).some(f=>f.stage.cast.includes('jt_jiang')||f.speaker==='jt_jiang'));
  assert.ok(r.s.frames[death+1].text.includes('你是带着木箱独行的沈玉娘'));
  assert.deepEqual(restoreVN(JSON.stringify(r.s.save()),edition).session.frames,r.s.frames);assert.throws(()=>restoreVN(JSON.stringify(r.s.save()),{content,version:'jade-1.0.0'}),/作品或版本不兼容/);
  writeFileSync(evidencePath(`docs/evidence/v6/jade-thieves-editorial-archive-v1-${side?'jiang':'shen'}-transcript.txt`),r.text);
 }
});
test('Jade each viewpoint keeps the other hidden order and identity until the temple, including knowledge descriptions',()=>{
 const shen=route(),jiang=route(['jt_be_jiang']);
 const before=(r:ReturnType<typeof route>)=>r.s.frames.slice(0,r.s.frames.findIndex(f=>f.id==='jt_revealed_1')).map(f=>f.text).join('\n');
 assert.match(before(shen),/你是沈玉娘，三十五岁/);assert.match(before(shen),/得璧。绝旁知者/);assert.doesNotMatch(before(shen),/璧归门|江十七来自盗门|你是江十七/);
 assert.match(before(jiang),/你是江十七/);assert.match(before(jiang),/璧归门。同行非本门者，不留/);assert.doesNotMatch(before(jiang),/内廷密使|得璧。绝旁知者/);
 for(const r of [shen,jiang]){assert.ok(r.s.frames.find(f=>f.id==='jt_revealed_1')!.tags.includes('fact:jt_roles'));assert.ok(!r.s.frames.slice(0,r.s.frames.findIndex(f=>f.id==='jt_revealed_1')).some(f=>f.tags.includes('fact:jt_roles')))}
 for(const id of ['jt_shen','jt_jiang'])assert.doesNotMatch(jadeThievesCharacters[id].role+jadeThievesCharacters[id].detail,/密使|内廷|盗门|死于|山道回救/);
});
test('Jade one early solo/cooperative decision changes actual auction escape space and cost; informed deception requires a checked door',()=>{
 const joint=route(),solo=route(['jt_go_alone']);const at=joint.s.commands.indexOf('choice:jt_work_together');assert.ok(at>0);assert.deepEqual(joint.s.commands.slice(0,at),solo.s.commands.slice(0,at));
 assert.ok(joint.s.frames.some(f=>f.stage.scene==='jt_sidehall'));assert.ok(!joint.s.frames.some(f=>f.stage.scene==='jt_kitchen'));assert.ok(solo.s.frames.some(f=>f.stage.scene==='jt_kitchen'));assert.match(solo.text,/布勒住小臂/);
 assert.ok(joint.s.frames.some(f=>f.choices.some(c=>c.id==='jt_fake_quarrel')));const unchecked=route(['jt_read_box']);assert.ok(!unchecked.s.frames.some(f=>f.choices.some(c=>c.id==='jt_fake_quarrel')));
 const deceptive=route(['jt_fake_quarrel']);assert.match(deceptive.text,/脚步正被半开的门挡住/);
});
test('Jade counterfeit exposure changes a secondary person’s later injury and study delay, not Jiang’s canon death',()=>{
 const covered=route(),exposed=route(['jt_send_apprentice']);const at=covered.s.commands.indexOf('choice:jt_hide_apprentice');assert.ok(at>0);assert.deepEqual(covered.s.commands.slice(0,at),exposed.s.commands.slice(0,at));
 assert.match(covered.text,/少牵进这一名学徒/);assert.doesNotMatch(covered.text,/腿要养一个月/);assert.match(exposed.text,/腿要养一个月/);assert.match(exposed.text,/学徒腿养了一个月才继续南去/);
 for(const r of [covered,exposed])assert.match(r.text,/江十七死了/);
 const gilded=route(),polished=route(['jt_polish_jade']);assert.match(gilded.text,/金线完整便最真的夸法也流下去/);assert.match(polished.text,/仿者把银补彻底从传闻中删掉/);
});
test('Jade first volume sampled alternatives reach every authored beat and all three escape choices without long passive stretches',()=>{
 const visited=new Set<string>(),choices=new Set<string>(),endings=new Set<string>();let longest=0;
 for(let seed=1;seed<=768;seed++){let state=Math.imul(seed,2654435761)>>>0;const r=run(ids=>{state=(Math.imul(state,1664525)+1013904223)>>>0;return ids[(state>>>16)%ids.length]});for(const f of r.s.frames){visited.add(f.id);f.choices.forEach(c=>choices.add(c.id));assert.ok(f.stage.cast.length<=3)}endings.add(r.s.frame.ending!);longest=Math.max(longest,r.longest)}
 const declared=[...readFileSync('story/jade-thieves-v1.ink','utf8').matchAll(/# beat:(\S+)/g)].map(m=>m[1]);assert.deepEqual([...visited].sort(),declared.sort());assert.equal(choices.size,43);assert.equal(endings.size,2);
 writeFileSync(evidencePath('docs/evidence/v6/jade-thieves-editorial-archive-v1-content-audit.json'),JSON.stringify({status:'FIRST_VOLUME_PRODUCTION_DRAFT_NOT_FINAL',sourceBeats:declared.length,visited:visited.size,choiceOptions:choices.size,decisionsPerRoute:21,sampledPaths:768,exhaustive:false,longestPassiveGap:longest,limits:'Second volume unimplemented. Vault, bridge, temple, jade-state objects, active special action, CG and full editorial rounds remain incomplete; no human playtime claim.'},null,2));assert.ok(longest<=18,`longest passive gap ${longest}`);
});
