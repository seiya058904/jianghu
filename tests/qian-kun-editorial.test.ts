import {historicalBytes} from './historical-baselines.ts';
import {evidencePath} from './evidence-path.ts';
import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync,writeFileSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {frozenBytes} from './frozen-baselines.ts';
import {Compiler} from 'inkjs/compiler/Compiler';
import content from '../src/generated/qian-kun.json' with {type:'json'};
import {readingLock} from '../src/chronicle-access.ts';
import {qianKunScenes} from '../src/qian-kun-catalog.ts';
import {VNRuntime,restoreVN} from '../src/vn-runtime.ts';
import published from '../src/generated/qian-kun-v2.json' with {type:'json'};
const source=readFileSync('story/qian-kun.ink','utf8'),version='qian-kun-3.0.0';
function run(picks:string[]=[],seed?:number,data=content,side=0){const s=new VNRuntime(data,version);let n=seed??0,gap=0,longest=0;while(!s.frame.ending){assert.ok(s.commands.length<750);if(s.frame.choices.length){n=(Math.imul(n,1664525)+1013904223)>>>0;s.choose((s.frame.choices.find(c=>picks.includes(c.id))??s.frame.choices[seed===undefined?side:(n>>>16)%s.frame.choices.length]).id);gap=0}else{s.advance();longest=Math.max(longest,++gap)}}return{s,text:s.frames.map(f=>f.text).join('\n'),longest}}
const scene=(r:ReturnType<typeof run>,part:string)=>r.s.frames.filter(f=>f.id.startsWith('qk_'+part+'_')).map(f=>f.text).join('\n');

test('Qian Kun V3 reviewed author identity (historical qian-kun-slow) retain reusable tea, identity ages and untouched former-book bytes',()=>{
 const d=JSON.parse(readFileSync('docs/evidence/v6/qian-kun-editorial-integration-preservation.json','utf8'));assert.equal(Object.keys(d.frozen).length,28);for(const [p,h]of Object.entries(d.frozen)){const b=historicalBytes(d.pathMap[p]??p);if(!b)continue;assert.equal(createHash('sha256').update(b).digest('hex'),h,p)}
 for(const file of ['qian-kun-author.mjs','qian-kun-young.mjs','qian-kun-slow.mjs','qian-kun-head.mjs','qian-kun-clouds.mjs','qian-kun-after.mjs']){let reviewed=readFileSync('story/drafts/qian-kun/'+file,'utf8');if(file==='qian-kun-author.mjs')reviewed=reviewed.replace('../../chronicle-writer.mjs','./chronicle-writer.mjs').replace('story/drafts/qian-kun/qian-kun-editorial.ink','story/qian-kun.ink');const actual=file==='qian-kun-slow.mjs'?historicalBytes('story/'+file)?.toString('utf8'):readFileSync('story/'+file,'utf8');if(actual!==undefined)assert.equal(actual,reviewed,file)}
 const r=run();assert.equal(r.s.frames.find(f=>f.id==='qk_nine_days_1')!.stage.scene,'qk_gate');assert.equal(qianKunScenes.qk_gate.time,'门前等候');assert.equal(r.s.frames.find(f=>f.text.startsWith('第九日，院门终于开'))!.stage.scene,'qk_gate');assert.equal(r.s.frames.find(f=>f.id==='qk_slow_questions_3')!.stage.camera,'portrait');for(const id of ['qk_late_way_1','qk_late_way_2'])assert.equal(r.s.frames.find(f=>f.id===id)!.stage.cg,'plainTea');assert.equal(r.s.frames.find(f=>f.id==='qk_late_way_3')!.stage.cg,undefined);assert.equal(r.s.frames.find(f=>f.id==='qk_accounts_1')!.stage.looks?.qk_xu,'late');assert.equal(r.s.frames.find(f=>f.id==='qk_trouble_1')!.stage.looks?.qk_manager,'late');
});

test('Both books accept all nine declared edition pairs for Notes, but no wrong family or invented fourth version',()=>{
 for(const nv of ['v1','v2','v3'])for(const qv of ['v1','v2','v3']){const m=new Map([['jianghu:chronicle:north:'+nv+':endings','["nq_first_again"]'],['jianghu:chronicle:qian-kun:'+qv+':endings','["qk_open_mountain"]']]);assert.equal(readingLock('north-notes',k=>m.get(k)??null),'');m.set('jianghu:chronicle:qian-kun:'+qv+':endings','["nq_first_again"]');assert.match(readingLock('north-notes',k=>m.get(k)??null),/不会算账/)}assert.match(readingLock('north-notes',k=>k==='jianghu:chronicle:qian-kun:v4:endings'?'["qk_open_mountain"]':null),/三师一枪.*不会算账/);
});

test('Qian Kun V3 reproduces duplicate letter and clears one physical envelope, sleeve-rule defeat remains',()=>{
 assert.match(run([],undefined,published).text,/手里那封还等着你送出去的信/);const r=run();assert.match(scene(r,'forgot_letter'),/怀里露出的信封角/);assert.doesNotMatch(r.text,/手里那封还等着|只要答对眼前一句/);assert.match(r.text,/袖里短尺/);assert.match(r.text,/输了/);
});

test('Qian Kun V3 searches the old book before either departure, with no already-promised Zhou appointment',()=>{
 for(const pick of ['qk_clear_before_mountain','qk_send_route_back'])for(const refusal of ['qk_receive_real_refusal','qk_name_what_seeking']){const r=run([pick,refusal]),research=r.s.frames.findIndex(f=>f.text.includes('翻太极旧册')),departure=r.s.frames.findIndex(f=>f.choices.some(c=>c.id==='qk_clear_before_mountain')),gate=r.s.frames.findIndex(f=>f.id==='qk_nine_days_1');assert.ok(research>0&&research<departure&&departure<gate);assert.doesNotMatch(r.s.frames.flatMap(f=>f.choices.map(c=>c.text)).join('\n'),/先按已经定的约/);assert.match(scene(r,'nine_days'),/祖师不见/);const second=r.s.frames.findIndex(f=>f.text.includes('第二日你想请童子'));if(second>=0)assert.ok(second<r.s.frames.findIndex(f=>f.text.startsWith('第九日，院门终于开')));assert.doesNotMatch(scene(r,'nine_days'),/翻旧册/);assert.ok(r.s.frames.filter(f=>f.speaker==='qk_zhou'&&f.text.includes('还找我做什么')).every(f=>f.stage.cast.includes('qk_zhou')));assert.equal(r.s.frames.filter(f=>f.speaker==='qk_zhou'&&f.text.includes('还找我做什么')).length,1);assert.match(scene(r,'zhou_field'),/老人领你进院/)}
});

test('Qian Kun V3 remembered old bouts leave the boat and do not teleport Ye to the school',()=>{
 const r=run(),frames=r.s.frames;assert.ok(frames.findIndex(f=>f.id==='qk_wet_again_1')<frames.findIndex(f=>f.id==='qk_other_inquiries_1'));assert.match(scene(r,'other_inquiries'),/回山以后/);for(const f of frames.filter(f=>f.id.startsWith('qk_other_inquiries_')))assert.ok(f.stage.scene==='qk_headroom'&&!f.stage.cast.includes('qk_ye'));assert.match(scene(r,'other_inquiries'),/一百九十余败/);assert.match(scene(r,'other_inquiries'),/第三未出便停/);assert.doesNotMatch(scene(r,'first_in_line'),/重新坐稳总谱第一/);
});

test('Qian Kun V3 both legal personal afterlives preserve ages, fixed fights, bounded rumor and exact replay',()=>{
 for(const [side,ending]of [[0,'qk_leave_open_school'],[1,'qk_leave_open_road']]as const){const r=run([ending],undefined,content,side);for(const p of ['十四岁','左脚短一寸','三十余名','半个时辰','都喜欢','人会撒谎','二十九','一百六十余','第三十七剑','十二年','四十三','七十余','四十五到五十五','十七日','第十八','六十八','七十一','两年','败、败、平','三百七十余','早几年就超过','你又没问','七十三','二十九招','一百零二','第九日','第一剑后便信','第二剑发生什么再不肯讲','第五十一','一百九十余败','第三未出','总谱第一','最好没有'])assert.ok(r.text.includes(p),p);assert.equal(r.s.frame.ending,ending==='qk_leave_open_school'?'qk_open_lesson':'qk_open_mountain');assert.equal(r.s.commands.filter(c=>c.startsWith('choice:')).length,25);assert.deepEqual(restoreVN(JSON.stringify(r.s.save()),{content,version}).session.frames,r.s.frames);assert.throws(()=>restoreVN(JSON.stringify(r.s.save()),{content:published,version:'qian-kun-2.0.0'}),/作品或版本不兼容/);writeFileSync(evidencePath(`docs/evidence/v6/qian-kun-editorial-current-${ending}.txt`),r.text)}
});

test('Qian Kun V3 two strong early choices retain their independent later costs under all personal endings',()=>{
 for(const letter of [true,false])for(const head of [true,false])for(const ending of ['qk_leave_open_school','qk_leave_open_road']){const r=run([letter?'qk_leave_plain_receipt':'qk_trust_own_memory',head?'qk_name_who_can_ask':'qk_keep_teaching_promise',ending]);assert.match(scene(r,'accounts'),letter?/来人当日还能赶回/:/来人多等两日/);assert.match(scene(r,'first_in_line'),head?/少了一夜随兴看剑/:/课停了一月/);if(!head){assert.match(scene(r,'first_in_line'),/接掌那年/);assert.match(scene(r,'first_in_line'),/把以后谁能来问一并说清/);}assert.match(scene(r,'late_way'),letter?/送到又来回一句/:/多等的两日与两晚/)}
});

test('Qian Kun V3 512 samples visit every declared beat and option and keep age aliases separate',()=>{
 const visited=new Set<string>(),options=new Set<string>(),ends=new Set<string>();let longest=0;for(let seed=1;seed<=512;seed++){const r=run([],seed);longest=Math.max(longest,r.longest);let later=false;for(const f of r.s.frames){if(f.id==='qk_tomorrow_1')later=true;assert.ok(!f.stage.cast.includes(later?'qk2_heng_earlier':'qk2_heng_later'));assert.ok(f.stage.cast.length<=3);visited.add(f.id);f.choices.forEach(c=>options.add(c.id))}ends.add(r.s.frame.ending!)}const declared=[...source.matchAll(/# beat:(\S+)/g)].map(m=>m[1]);assert.deepEqual([...visited].sort(),declared.sort());assert.equal(options.size,50);assert.equal(ends.size,2);assert.ok(longest<=18,`gap ${longest}`);writeFileSync(evidencePath('docs/evidence/v6/qian-kun-editorial-current-audit.json'),JSON.stringify({status:'VERSIONED_V3_LOCAL_INTEGRATION_NOT_FULL_GOAL_ACCEPTANCE',declared:declared.length,visited:visited.size,options:options.size,decisions:25,samples:512,exhaustive:false,longestPassiveGap:longest,gameArtChanges:0},null,2)+'\n');
});

test('Qian Kun V3 leaves all twenty published, companion and canon paths byte-identical',()=>{
 const d=JSON.parse(readFileSync('docs/evidence/v6/qian-kun-editorial-preservation.json','utf8')),m=JSON.parse(readFileSync('docs/evidence/v6/qian-kun-editorial-integration-preservation.json','utf8'));assert.equal(Object.keys(d.frozen).length,20);for(const [p,h]of Object.entries(d.frozen)){const b=historicalBytes(m.pathMap[p]??p);if(!b)continue;assert.equal(createHash('sha256').update(b).digest('hex'),h,p)}
});

test('Qian Kun V3 three-day promise has an actual school return before learning slow, independent of ending',()=>{
 for(const ending of ['qk_leave_open_school','qk_leave_open_road'])for(const direct of [true,false]){const r=run([ending,direct?'qk_let_manager_speak':'qk_offer_real_time']);assert.equal(r.s.frames.some(f=>f.id==='qk_office_followup_1'),!direct);if(!direct){assert.match(scene(r,'office_followup'),/三日后，你依约回来/);assert.match(scene(r,'office_followup'),/出门已过了原拟午时/);assert.ok(r.s.frames.findIndex(f=>f.id==='qk_office_followup_1')<r.s.frames.findIndex(f=>f.id==='qk_slow_questions_1'));assert.ok(r.s.frames.filter(f=>f.id.startsWith('qk_office_followup_')).every(f=>f.stage.scene==='qk_office'))}}
});

test('Qian Kun V3 boat footing choices change actual trial and later teaching, never fixed fall or shore results',()=>{
 const rows=[];for(const method of ['qk_follow_deck_pitch','qk_test_shore_step'])for(const rope of ['qk_take_rope_then_again','qk_swim_clear_of_side'])for(const ending of ['qk_leave_open_school','qk_leave_open_road']){const r=run([method,rope,ending]);assert.match(scene(r,'boat_tipping'),method==='qk_follow_deck_pitch'?/前两次真接住了起落/:/脚落准了，身子却/);assert.match(scene(r,'boat_fifty_one'),/第五十一，直接掉进海/);assert.match(scene(r,'wet_again'),method==='qk_follow_deck_pitch'?/接到了。可你又想等它/:/拿纸画下方才认准/);assert.match(scene(r,'first_in_line'),method==='qk_follow_deck_pitch'?/随着起落换脚/:/另画进今日船头朝向/);assert.match(r.text,/陆地不知道，海上打不过/);assert.equal(r.s.commands.filter(c=>c.startsWith('choice:')).length,25);rows.push({method,rope,ending})}writeFileSync(evidencePath('docs/evidence/v6/qian-kun-editorial-boat-combinations.json'),JSON.stringify({count:rows.length,rows},null,2)+'\n');
});

test('Qian Kun V3 learning methods, mountain handoff and rumor evidence return as concrete work on either personal path',()=>{
 for(const first of [true,false])for(const ending of ['qk_leave_open_school','qk_leave_open_road']){const r=run([ending,first?'qk_show_waist':'qk_test_same_step',first?'qk_ask_return':'qk_try_balance',first?'qk_ask_false_step':'qk_retrace_own_entry',first?'qk_clear_before_mountain':'qk_send_route_back',first?'qk_record_rumor_bounds':'qk_ask_first_sea',first?'qk_keep_missing_bouts':'qk_plan_real_visit']);assert.match(scene(r,'sixty_eight'),first?/陪他多走两轮/:/另铺一页/);assert.match(scene(r,'slow_questions'),first?/练完才去吃早饭/:/半日上午只得/);assert.match(scene(r,'zhou_field'),first?/空处也是真的/:/那一条仍会回到同一个位置/);assert.match(scene(r,'first_in_line'),first?/没有为寻你再跑一趟/:/回来坐满一下午/);assert.match(scene(r,'first_in_line'),first?/哪栏也没写成你亲见三剑/:/另留一晚/);assert.match(scene(r,'first_in_line'),first?/没见的几行照旧留空/:/眼下都不见/)}
});

test('Qian Kun V3 all three round snapshots compile and reach both endings, with retained real before/after records',()=>{
 const manifest=JSON.parse(readFileSync('docs/evidence/v6/qian-kun-editorial-round-snapshots.json','utf8'));assert.equal(Object.keys(manifest.files).length,21);for(const [p,h]of Object.entries(manifest.files)){const b=frozenBytes(p);if(!b)continue;assert.equal(createHash('sha256').update(b).digest('hex'),h,p)}
 for(const[round,count]of [[1,14],[2,12],[3,21]]){const d=JSON.parse(readFileSync(`docs/evidence/v6/qian-kun-editorial-round${round}-records.json`,'utf8'));assert.equal(d.records.length,count);assert.ok(d.records.every((r:{before:string,after:string})=>r.before!==r.after));const c=new Compiler(readFileSync(`story/drafts/qian-kun/round${round}/qian-kun-editorial.ink`,'utf8')),data=JSON.parse(c.Compile().ToJson());assert.deepEqual(c.errors,[]);for(const ending of ['qk_leave_open_school','qk_leave_open_road'])assert.equal(run([ending],undefined,data).s.frame.ending,ending==='qk_leave_open_school'?'qk_open_lesson':'qk_open_mountain')}
 assert.match(scene(run(),'four_weapons'),/第二日依言先拿钱/);
});
