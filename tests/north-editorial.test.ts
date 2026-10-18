import {historicalBytes} from './historical-baselines.ts';
import {evidencePath} from './evidence-path.ts';
import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync,writeFileSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {frozenBytes} from './frozen-baselines.ts';
import {Compiler} from 'inkjs/compiler/Compiler';
import content from '../src/generated/north.json' with {type:'json'};
import {readingLock} from '../src/chronicle-access.ts';
import {VNRuntime,restoreVN} from '../src/vn-runtime.ts';
import published from '../src/generated/north-v2.json' with {type:'json'};
const source=readFileSync('story/north.ink','utf8'),version='north-3.0.0';
function run(picks:string[]=[],seed?:number,data=content){const s=new VNRuntime(data,version);let n=seed??0,gap=0,longest=0;while(!s.frame.ending){assert.ok(s.commands.length<750);if(s.frame.choices.length){n=(Math.imul(n,1664525)+1013904223)>>>0;s.choose((s.frame.choices.find(c=>picks.includes(c.id))??s.frame.choices[seed===undefined?0:(n>>>16)%s.frame.choices.length]).id);gap=0}else{s.advance();longest=Math.max(longest,++gap)}}return{s,text:s.frames.map(f=>f.text).join('\n'),longest}}
const scene=(r:ReturnType<typeof run>,part:string)=>r.s.frames.filter(f=>f.id.startsWith('nq_'+part+'_')).map(f=>f.text).join('\n');

test('North V3 keeps reviewed author identity (historical north-after) and frozen V2 bytes, with reusable tea and identity cameras',()=>{
 const d=JSON.parse(readFileSync('docs/evidence/v6/north-editorial-integration-preservation.json','utf8'));assert.equal(Object.keys(d.frozen).length,20);for(const [p,h]of Object.entries(d.frozen)){const b=frozenBytes(d.pathMap[p]??p);if(!b)continue;assert.equal(createHash('sha256').update(b).digest('hex'),h,p)}
 for(const file of ['north-author.mjs','north-yard.mjs','north-road.mjs','north-rain.mjs','north-duels.mjs','north-after.mjs']){let reviewed=readFileSync('story/drafts/north/'+file,'utf8');if(file==='north-author.mjs')reviewed=reviewed.replace('../../chronicle-writer.mjs','./chronicle-writer.mjs').replace('story/drafts/north/north-editorial.ink','story/north.ink');const actual=file==='north-after.mjs'?historicalBytes('story/'+file)?.toString('utf8'):readFileSync('story/'+file,'utf8');if(actual!==undefined)assert.equal(actual,reviewed,file)}
 const r=run(),frames=r.s.frames;for(const id of ['nq_too_heavy_2','nq_third_teacher_6','nq_last_tea_3'])assert.equal(frames.find(f=>f.id===id)!.stage.camera,'portrait');for(const id of ['nq_last_tea_1','nq_last_tea_2'])assert.equal(frames.find(f=>f.id===id)!.stage.cg,'plainTea');assert.equal(frames.find(f=>f.id==='nq_last_tea_3')!.stage.cg,undefined);
});

test('North Notes accepts North V1/V2/V3 and Qian Kun V1/V2/V3, rejecting forged families and future namespaces',()=>{
 for(const nv of ['v1','v2','v3'])for(const qv of ['v1','v2','v3']){const m=new Map([['jianghu:chronicle:north:'+nv+':endings','["nq_three_names"]'],['jianghu:chronicle:qian-kun:'+qv+':endings','["qk_open_lesson"]']]);assert.equal(readingLock('north-notes',k=>m.get(k)??null),'');m.set('jianghu:chronicle:north:'+nv+':endings','["qk_open_lesson"]');assert.match(readingLock('north-notes',k=>m.get(k)??null),/三师一枪/)}
 const m=new Map([['jianghu:chronicle:north:v4:endings','["nq_first_again"]'],['jianghu:chronicle:qian-kun:v4:endings','["qk_open_lesson"]']]);assert.match(readingLock('north-notes',k=>m.get(k)??null),/三师一枪.*不会算账/);
});

test('North V3 reproduces late three-month explanation, then returns to school before age-64 trial on all letter and pupil paths',()=>{
 const old=run([],undefined,published);assert.ok(old.text.indexOf('六十四第一次')<old.text.indexOf('这一回返馆'));
 for(const letter of ['nq_write_relearn','nq_write_safe_only'])for(const pupil of ['nq_meet_pupil_plain','nq_meet_class_together']){
  const r=run([letter,pupil]),ids=r.s.frames.map(f=>f.id);assert.ok(ids.indexOf('nq_return_school_1')<ids.indexOf('nq_sixty_four_1'));assert.ok(ids.indexOf('nq_sixty_four_1')<ids.indexOf('nq_two_firsts_1'));
  assert.match(scene(r,'return_school'),/三个月离枪已过/);assert.doesNotMatch(scene(r,'return_school'),/老人面前的三年/);assert.equal(r.s.frames.find(f=>f.id==='nq_return_school_1')!.stage.looks?.nq_yuan,'late');
  assert.match(scene(r,'return_school'),letter==='nq_write_relearn'?/少年敢说自己拦不住/:/花两日撤掉/);if(letter==='nq_write_safe_only'){assert.match(r.text,/旅费也由自己赔/);assert.match(r.text,/半月馆师不能/)}
 }
});

test('North V3 departures keep introduction distinct from a promised visit and preserve real handoff costs',()=>{
 for(const early of [false,true]){const r=run(early?['nq_depart_with_letter']:[]),labels=r.s.frames.flatMap(f=>f.choices.map(c=>c.text)).join('\n');assert.doesNotMatch(labels,/已经约好|耽误的远约/);assert.match(r.text,early?/夜课推了半年/:/错过原拟同行的车/);assert.match(r.text,early?/错过那年回乡探亲/:/没再.*多带半年/);assert.match(r.text,/第一场三十二招/)}
});

test('North V3 tea is a dated memory, chair already owned, relic stays hung and later pupils are distinct',()=>{
 const r=run();assert.match(scene(r,'last_tea'),/七十六岁那场终南茶席/);assert.match(scene(r,'three_objects'),/记忆落回枪房/);assert.match(scene(r,'three_objects'),/旧枪仍留架上/);assert.match(scene(r,'one_more_spear'),/又一名新来的后生/);assert.doesNotMatch(r.text,/玩家|固定胜负/);
 const chairChoices=r.s.frames.flatMap(f=>f.choices).find(c=>c.id==='nq_take_chair_piece')!;assert.match(chairChoices.text,/早已留下/);
 for(const f of r.s.frames.filter(f=>f.stage.scene==='nq_gunroom'))assert.ok(!f.stage.cast.some(id=>['nq_zhou','nq_chu','nq2_heng','nq2_mender'].includes(id)));
 const reveal=r.s.frames.findIndex(f=>f.text==='司马衡。');assert.ok(reveal>0);assert.ok(!r.s.frames.slice(0,reveal).some(f=>f.stage.cast.includes('nq2_heng')));
});

test('North V3 keeps fixed four battles, three teachers, old ranks and both personal endings with exact replay',()=>{
 for(const ending of ['nq_end_teach','nq_end_visits']){const r=run([ending]);for(const p of ['一百二十七','十三岁','扎、拦、拿','一百零九','七十三','三十二招','四十五','一百六十余招','第三十六','三百余','第八十三','第二百零八','三个月不许碰枪','第六十一招','六十五','六十七','六十九','七十一','第一百三十二','胸前一寸','肩外四寸','一百六十四','三百零八','七寸','岁月胜','旧白蜡枪','半截断杆','仍未返真'])assert.ok(r.text.includes(p),p);assert.equal(r.s.commands.filter(c=>c.startsWith('choice:')).length,31);assert.equal(r.s.frame.ending,ending==='nq_end_teach'?'nq_first_again':'nq_three_names');assert.deepEqual(restoreVN(JSON.stringify(r.s.save()),{content,version}).session.frames,r.s.frames);assert.throws(()=>restoreVN(JSON.stringify(r.s.save()),{content:published,version:'north-2.0.0'}),/作品或版本不兼容/);writeFileSync(evidencePath(`docs/evidence/v6/north-editorial-current-${ending}.txt`),r.text)}
});

test('North V3 sampled alternatives cover all beats and choices with bounded passive reading',()=>{
 const visited=new Set<string>(),options=new Set<string>(),ends=new Set<string>();let longest=0;for(let seed=1;seed<=512;seed++){const r=run([],seed);longest=Math.max(longest,r.longest);for(const f of r.s.frames){visited.add(f.id);f.choices.forEach(c=>options.add(c.id));assert.ok(f.stage.cast.length<=3)}ends.add(r.s.frame.ending!)}const declared=[...source.matchAll(/# beat:(\S+)/g)].map(m=>m[1]);assert.deepEqual([...visited].sort(),declared.sort());assert.equal(options.size,62);assert.equal(ends.size,2);assert.ok(longest<=18,`gap ${longest}`);writeFileSync(evidencePath('docs/evidence/v6/north-editorial-current-audit.json'),JSON.stringify({status:'VERSIONED_V3_LOCAL_INTEGRATION_NOT_FULL_GOAL_ACCEPTANCE',declared:declared.length,visited:visited.size,options:options.size,decisions:31,samples:512,exhaustive:false,longestPassiveGap:longest,gameArtChanges:0},null,2)+'\n');
});

test('North V3 preserves all 17 published and canon baselines byte-for-byte',()=>{
 const d=JSON.parse(readFileSync('docs/evidence/v6/north-editorial-preservation.json','utf8')),m=JSON.parse(readFileSync('docs/evidence/v6/north-editorial-integration-preservation.json','utf8'));assert.equal(Object.keys(d.frozen).length,17);for(const [p,h]of Object.entries(d.frozen)){const b=frozenBytes(m.pathMap[p]??p);if(!b)continue;assert.equal(createHash('sha256').update(b).digest('hex'),h,p)}
});

test('North V3 actual Yuan visit occurs only after a confirmed date, in his school with a return journey',()=>{
 const letter=run(),visit=run(['nq_visit_yuan_class']);assert.ok(!letter.s.frames.some(f=>f.id.startsWith('nq_yuan_visit_')));assert.match(scene(visit,'thirty_six'),/阿原回定下月一晚/);assert.match(scene(visit,'yuan_visit'),/少练了几日自己的长枪/);assert.match(scene(visit,'yuan_visit'),/回楚师处以后/);assert.ok(visit.s.frames.filter(f=>f.id.startsWith('nq_yuan_visit_')).every(f=>f.stage.scene==='nq_school'&&f.stage.cast.includes('nq_yuan')&&!f.stage.cast.includes('nq_chu')));assert.equal(visit.s.commands.filter(c=>c.startsWith('choice:')).length,31);
});

test('North V3 six earlier actions return as specific work and costs under both endings',()=>{
 const rows=[];for(const ending of ['nq_end_teach','nq_end_visits'])for(const first of [true,false]){
  const picks=[ending,first?'nq_trace_first_loss':'nq_compare_thirteen',first?'nq_show_other_foot':'nq_record_change',first?'nq_split_own_share':'nq_help_chair_space',first?'nq_try_no_display':'nq_admit_not_understood',first?'nq_read_chosen_place':'nq_save_whole_again',first?'nq_keep_gu_in_notes':'nq_try_with_liu'],r=run(picks);
  assert.match(scene(r,'first_north_loss'),first?/这回比枪脱手早了两招/:/第二晚只好另铺一张/);
  assert.match(scene(r,'return_school'),first?/纸上四次改过的脚位/:/问枪要顺延一日/);
  assert.match(scene(r,'without_spear'),first?/先垫高明日要用的干柴/:/多熬半个时辰/);
  assert.match(scene(r,'sixty_four'),first?/头一轮仍被压下/:/第二日照样却连五十招也撑不住/);
  assert.match(scene(r,'one_sixty_four'),first?/重试/:/次晨重新画双方脚位/);
  assert.match(scene(r,'what_to_leave'),first?/等一记没有来的第七剑/:/等他看准/);rows.push({ending,first});
 }
 writeFileSync(evidencePath('docs/evidence/v6/north-editorial-consequence-combinations.json'),JSON.stringify({rows,count:rows.length,limits:'Paired six-action regression plus 512 sampled paths; not all combinations.'},null,2)+'\n');
});

test('North V3 preparation precedes the actual garden and three round snapshots keep their declared changes',()=>{
 const r=run();assert.ok(r.s.frames.findIndex(f=>f.text.includes('赴旧园前'))<r.s.frames.findIndex(f=>f.text.includes('金陵城外旧园')));assert.equal(r.s.frames.find(f=>f.text.includes('金陵城外旧园'))!.stage.scene,'nq_garden');
 for(const [round,count]of [[1,14],[2,12],[3,15]]){const d=JSON.parse(readFileSync(`docs/evidence/v6/north-editorial-round${round}-records.json`,'utf8'));assert.equal(d.records.length,count);assert.ok(d.records.every((r:{before:string,after:string})=>r.before!==r.after));}
 const manifest=JSON.parse(readFileSync('docs/evidence/v6/north-editorial-round-snapshots.json','utf8'));assert.equal(Object.keys(manifest.files).length,21);for(const [p,h]of Object.entries(manifest.files)){const b=frozenBytes(p);if(!b)continue;assert.equal(createHash('sha256').update(b).digest('hex'),h,p)}
 for(const round of [1,2,3]){const c=new Compiler(readFileSync(`story/drafts/north/round${round}/north-editorial.ink`,'utf8')),data=JSON.parse(c.Compile().ToJson());assert.deepEqual(c.errors,[]);for(const ending of ['nq_end_teach','nq_end_visits'])assert.equal(run([ending],undefined,data).s.frame.ending,ending==='nq_end_teach'?'nq_first_again':'nq_three_names');}
});
