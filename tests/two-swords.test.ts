import {evidencePath} from './evidence-path.ts';
import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync,writeFileSync} from 'node:fs';
import {VNRuntime,restoreVN} from '../src/vn-runtime.ts';
import content from '../src/generated/two-swords.json' with {type:'json'};
import archived from '../src/generated/two-swords-v1.json' with {type:'json'};
import {createHash} from 'node:crypto';
import {frozenBytes} from './frozen-baselines.ts';
import {twoSwordsWork,twoSwordsV1Work} from '../src/two-swords-catalog.ts';
const edition={content,version:'two-swords-2.0.0'};
function run(pick:(ids:string[])=>string){const s=new VNRuntime(content,edition.version);let gap=0,longest=0;while(!s.frame.ending){if(s.frame.choices.length){s.choose(pick(s.frame.choices.map(c=>c.id)));gap=0}else{s.advance();longest=Math.max(longest,++gap)}assert.ok(s.commands.length<600)}return{s,text:s.frames.map(f=>f.text).join('\n'),longest}}
const route=(overrides:string[]=[])=>run(ids=>ids.find(id=>overrides.includes(id))??ids[0]);
test('Two Swords V2 keeps V1 bytes and storage separate, and restores every frame on both old routes',()=>{
 const record=JSON.parse(readFileSync('docs/evidence/v6/two-swords-editorial-changes.json','utf8'));
 for(const [file,hash]of Object.entries(record.frozen)){const b=frozenBytes(file);if(!b)continue;assert.equal(createHash('sha256').update(b).digest('hex'),hash)}
 assert.notEqual(twoSwordsWork.prefix,twoSwordsV1Work.prefix);assert.notEqual(twoSwordsWork.version,twoSwordsV1Work.version);
 for(const side of [0,1]){const s=new VNRuntime(archived,twoSwordsV1Work.version);while(true){const raw=JSON.stringify(s.save());assert.deepEqual(restoreVN(raw,{content:archived,version:twoSwordsV1Work.version}).save.presentation,s.save().presentation);assert.throws(()=>restoreVN(raw,edition),/版本/);if(s.frame.ending)break;s.frame.choices.length?s.choose(s.frame.choices[side].id):s.advance()}}
});

test('Two Swords V2 letter, classroom method and divided records have distinct delayed consequences',()=>{
 const a=route(),b=route(['ss_return_direct','ss_compare_ground','ss_keep_lesson']);
 const after=(r:ReturnType<typeof route>,id:string)=>r.s.frames.slice(r.s.frames.findIndex(f=>f.id===id)).map(f=>f.text).join('\n');
 assert.match(a.text,/信里说床不换/);assert.doesNotMatch(a.text,/昨日师弟还在山下等/);assert.match(b.text,/昨日师弟还在山下等/);
 assert.match(after(a,'ss_years_later_1'),/旧课簿翻到一处汗渍/);assert.match(after(b,'ss_years_later_1'),/装不下堂上所有人的话/);
 assert.match(after(a,'ss_guihong_1'),/带着当年的整段议录/);assert.match(after(b,'ss_guihong_1'),/送到已是剑会第三日/);
 assert.doesNotMatch(a.text,/随自己多留一日/);assert.match(a.text,/落款旁还写了值日时辰/);
 const stay=route(['ss_stay_one_bout']);assert.match(stay.text,/补差也确实从自己的束脩里少了一份/);assert.doesNotMatch(stay.text,/落款旁还写了值日时辰/);
});
test('Two Swords separates three viewpoints, fixed losses and both personal careers',()=>{
 for(const side of [0,1]){const r=run(ids=>ids[side]);assert.equal(r.s.frame.ending,side?'ss_library_lesson':'ss_mountain_lesson');
  for(const phrase of ['四十三岁','谢知白年过七十','七日','四十余年','此刻视角换为林负山','三百余合','是另一门','新的视角','炭烘纸引起','两册没有完整副本','七辆车','七箱','这是你们的','三十年过去','又二十年','转身换线的一瞬','答案仍是两家'])assert.ok(r.text.includes(phrase),phrase);
  assert.deepEqual(restoreVN(JSON.stringify(r.s.save()),edition).session.frames,r.s.frames);
  assert.throws(()=>restoreVN(JSON.stringify(r.s.save()),{content,version:'qingshi-1.0.0'}),/作品或版本不兼容/);
  const late=r.s.frames.findIndex(f=>f.id==='ss_rain_work_1');assert.ok(late>0);assert.ok(!r.s.frames.slice(late).some(f=>f.stage.cast.some(id=>['ss_pupil','ss_xiezhibai','ss_olderpupil','ss_xietingsong'].includes(id))));
  const elder=r.s.frames.findIndex(f=>f.id==='ss_years_later_1');assert.ok(!r.s.frames.slice(elder).some(f=>f.stage.cast.includes('ss_tang')),'young companion is conveyed through letters after thirty years');
  writeFileSync(evidencePath(`docs/evidence/v6/two-swords-editorial-${r.s.frame.ending}-transcript.txt`),r.text);
 }
});
test('Two Swords one early passage choice changes later rescue injury without changing canon destruction',()=>{
 const clear=route(['ss_delegate_and_save']),blocked=route(['ss_finish_wetlist','ss_delegate_and_save']);
 const at=clear.s.commands.indexOf('choice:ss_clear_passage');assert.ok(at>0);assert.deepEqual(clear.s.commands.slice(0,at),blocked.s.commands.slice(0,at));
 assert.match(clear.text,/掌上有一处擦红/);assert.doesNotMatch(clear.text,/三个月里要换别人持剑示范/);assert.match(blocked.text,/手掌烫伤，三个月里要换别人持剑示范/);assert.match(blocked.text,/后来手养好，她自己走了山路/);assert.match(blocked.text,/手刚养好，今日能走哪一段，我自己试/);assert.doesNotMatch(blocked.text,/我这三个月先不握剑/);
 for(const r of [clear,blocked]){assert.match(r.text,/两册没有完整副本/);assert.match(r.text,/你的课堂稿在/)}
 const alternative=route();assert.match(alternative.text,/你的课堂稿烧了/);assert.doesNotMatch(alternative.text,/手掌烫伤/);
});
test('Two Swords choosing a career changes middle teacher, later correspondence and final duty',()=>{
 const mountain=route(),library=route(['ss_stay_library']);const at=mountain.s.commands.indexOf('choice:ss_go_with_books');assert.ok(at>0);assert.deepEqual(mountain.s.commands.slice(0,at),library.s.commands.slice(0,at));
 assert.ok(mountain.s.frames.some(f=>f.stage.scene==='ss_mountainwork'));assert.ok(!mountain.s.frames.some(f=>f.stage.scene==='ss_librarywork'));
 assert.ok(library.s.frames.some(f=>f.stage.scene==='ss_librarywork'));assert.ok(!library.s.frames.some(f=>f.stage.scene==='ss_mountainwork'));
 assert.match(mountain.text,/山下等你接课的学生/);assert.match(library.text,/楼里等你核借录的人/);assert.notEqual(mountain.s.frame.ending,library.s.frame.ending);
});
test('Two Swords sampled alternatives cover every authored beat and choice with bounded reading gaps',()=>{
 const visited=new Set<string>(),choices=new Set<string>(),endings=new Set<string>();let longest=0;
 for(let seed=1;seed<=512;seed++){let state=Math.imul(seed,2654435761)>>>0;const r=run(ids=>{state=(Math.imul(state,1664525)+1013904223)>>>0;return ids[state>>>31]});for(const f of r.s.frames){visited.add(f.id);f.choices.forEach(c=>choices.add(c.id));assert.ok(f.stage.cast.length<=3)}endings.add(r.s.frame.ending!);longest=Math.max(longest,r.longest)}
 const declared=[...readFileSync('story/two-swords.ink','utf8').matchAll(/# beat:(\S+)/g)].map(m=>m[1]);assert.deepEqual([...visited].sort(),declared.sort());assert.equal(choices.size,50);assert.equal(endings.size,2);
 writeFileSync(evidencePath('docs/evidence/v6/two-swords-content-audit.json'),JSON.stringify({status:'FIRST_BOOK_V2_INTERNAL_EDIT_NOT_FINAL',sourceBeats:declared.length,visited:visited.size,choiceOptions:choices.size,sampledPaths:512,exhaustive:false,longestPassiveGap:longest,limits:'Second book exists separately; this bounded sample is not exhaustive. Age-matched companion identity, sword action, external literary acceptance and human reading-time remain unverified.'},null,2));
 assert.ok(longest<=18,`longest passive gap ${longest}`);
});
