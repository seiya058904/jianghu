import {evidencePath} from './evidence-path.ts';
import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync,writeFileSync} from 'node:fs';
import {VNRuntime,restoreVN} from '../src/vn-runtime.ts';
import content from '../src/generated/kuhe-v1.json' with {type:'json'};
const edition={content,version:'kuhe-1.0.0'};
function run(pick:(ids:string[])=>string){
 const s=new VNRuntime(content,edition.version);let gap=0,longest=0;
 while(!s.frame.ending){if(s.frame.choices.length){s.choose(pick(s.frame.choices.map(c=>c.id)));gap=0}else{s.advance();longest=Math.max(longest,++gap)}assert.ok(s.commands.length<500)}
 return {s,text:s.frames.map(f=>f.text).join('\n'),longest};
}
const route=(preferred:string[],flip?:string)=>run(ids=>flip&&ids.includes(flip)?flip:ids.find(id=>preferred.includes(id))??ids[0]);
test('Kuhe full two personal endings preserve the staged battle, deaths, injuries and seven-day aftermath',()=>{
 for(const end of ['kh_choose_care','kh_choose_record']){
  const r=route([end]);assert.equal(r.s.frame.ending,end==='kh_choose_care'?'kh_care':'kh_record');
  for(const text of ['第一日','十二位宗师','四人重伤，两人死','第二阵一人战死，三人重伤','第一百八十六招','二百四十余招','第八十二招','第二百一十三招','孟归藏双手合住','空劫死，无生客死','第七日，孟归藏醒了','左臂终身未复','此后三十年未离太极山门'])assert.ok(r.text.includes(text),text);
  assert.doesNotMatch(r.text,/空劫师祖|阿谁|你击败了无生客|无生客逃走/);
  assert.ok(!r.s.frames.find(f=>f.id==='kh_lock_6')!.stage.cast.includes('kh_gui'),'fallen Meng is not shown standing through the retreat order');
  assert.deepEqual(restoreVN(JSON.stringify(r.s.save()),edition).session.frames,r.s.frames);
  assert.throws(()=>restoreVN(JSON.stringify(r.s.save()),{content,version:'taihua-1.0.0'}),/作品或版本不兼容/);
  writeFileSync(evidencePath(`docs/evidence/v6/kuhe-${r.s.frame.ending}-transcript.txt`),r.text);
 }
});
test('Kuhe paired early preparation changes later physical route and one-month work capacity, without rewriting canon',()=>{
 const base=route([]),other=route([],'kh_make_strap');
 assert.match(base.text,/绕过石缝，没有再把担架立起/);assert.match(base.text,/右腕没有被一阵锐痛拉住/);
 assert.match(other.text,/右腕撑上碎石/);assert.match(other.text,/这一月别提重物/);
 assert.doesNotMatch(base.text,/这一月别提重物|一个月里不能提重物的人/);
 const moment=base.s.frames.find(f=>f.choices.some(c=>c.id==='kh_walk_detour'))!;
 const at=base.s.commands.indexOf('choice:kh_walk_detour');
 assert.deepEqual(base.s.commands.slice(0,at),other.s.commands.slice(0,at));
 const outcome=base.s.frames.find(f=>f.text.includes('右腕没有被一阵锐痛拉住'))!;
 assert.notEqual(moment.stage.scene,outcome.stage.scene);
 assert.ok(base.s.frames.indexOf(outcome)-base.s.frames.indexOf(moment)>100);
});
test('Kuhe trust and agreed work position echo in a different scene; rescue and pages yield concrete different lives',()=>{
 const partnered=route([]),alone=route([],'kh_push_courage'),lost=route([],'kh_save_pages');
 assert.match(partnered.text,/我陪你走第一段/);assert.match(alone.text,/我先回营，晾的布还没收/);
 assert.match(partnered.text,/你拖出的弟子这日能饮半碗粥/);assert.doesNotMatch(lost.text,/你拖出的弟子这日能饮半碗粥/);
 assert.match(lost.text,/布盖过了脸/);assert.match(lost.text,/纸袋终于打开/);
 const handover=route([],'kh_more_stretchers');assert.match(handover.text,/你拿着未填的布条再跑一趟/);
 assert.doesNotMatch(partnered.text,/你拿着未填的布条再跑一趟/);
});
test('Kuhe sampled branches reach all authored nodes, two endings and stable visible identities',()=>{
 const ids=new Set<string>(),choices=new Set<string>(),endings=new Set<string>();let longest=0;
 for(let seed=1;seed<=512;seed++){
  let state=Math.imul(seed,2654435761)>>>0;
  const r=run(ids=>{state=(Math.imul(state,1664525)+1013904223)>>>0;return ids[state>>>31]});
  for(const f of r.s.frames){ids.add(f.id);f.choices.forEach(c=>choices.add(c.id));assert.ok(f.stage.cast.length<=3)}
  endings.add(r.s.frame.ending!);longest=Math.max(longest,r.longest);
 }
 const source=readFileSync('story/kuhe-v1.ink','utf8');const beats=[...source.matchAll(/# beat:(\S+)/g)].map(m=>m[1]);
 assert.deepEqual([...ids].sort(),beats.sort());assert.equal(choices.size,40);assert.equal(endings.size,2);
 writeFileSync(evidencePath('docs/evidence/v6/kuhe-content-audit.json'),JSON.stringify({status:'PRODUCTION_DRAFT_NOT_FINAL',sourceBeats:beats.length,visited:ids.size,choiceOptions:choices.size,decisionPoints:20,sampledPaths:512,exhaustive:false,longestPassiveGap:longest,limits:'No external reader, no human playtime, elder identity art and CG pending; three editorial rounds not complete.'},null,2));
 assert.ok(longest<=18,`longest passive gap ${longest}`);
});
