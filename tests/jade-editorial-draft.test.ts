import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync,writeFileSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {Compiler} from 'inkjs/compiler/Compiler';
import {VNRuntime,restoreVN} from '../src/vn-runtime.ts';
import published from '../src/generated/jade-v1.json' with {type:'json'};
const source=readFileSync('story/drafts/jade/jade-editorial.ink','utf8'),compiler=new Compiler(source),content=JSON.parse(compiler.Compile().ToJson()),version='jade-editorial-draft-3';assert.deepEqual(compiler.errors,[]);
function run(picks:string[]=[],seed?:number,data=content){const s=new VNRuntime(data,version);let n=seed??0,gap=0,longest=0;while(!s.frame.ending){assert.ok(s.commands.length<700);if(s.frame.choices.length){n=(Math.imul(n,1664525)+1013904223)>>>0;s.choose((s.frame.choices.find(c=>picks.includes(c.id))??s.frame.choices[seed===undefined?0:(n>>>16)%s.frame.choices.length]).id);gap=0}else{s.advance();longest=Math.max(longest,++gap)}}return{s,text:s.frames.map(f=>f.text).join('\n'),longest}}
const scene=(r:ReturnType<typeof run>,part:string)=>r.s.frames.filter(f=>f.id.startsWith('jd_'+part+'_')).map(f=>f.text).join('\n');

test('Jade second-volume draft reproduces false unvisited report and preserves actual fourth/fifth eyewitnesses under either report and post',()=>{
 assert.match(run(['jd_send_plain_report'],undefined,published).text,/你把两处未亲入的写清/);
 const rows=[];for(const surface of [true,false])for(const report of ['jd_take_duty','jd_send_plain_report'])for(const post of ['jd_stay_grain','jd_stay_records']){const r=run([surface?'jd_keep_surface':'jd_read_dark_first',report,post]);assert.doesNotMatch(r.text,/你把两处未亲入的写清/);if(surface){assert.ok(r.s.frames.some(f=>f.stage.scene==='jd_fourth'));assert.ok(!r.s.frames.some(f=>f.stage.scene==='jd_returnarchive'));assert.match(r.text,/第四、五库你亲进去/)}else{assert.ok(r.s.frames.some(f=>f.stage.scene==='jd_returnarchive'));assert.ok(!r.s.frames.some(f=>f.stage.scene==='jd_fourth'));assert.match(r.text,/第四、五库没有跟到现场/)}rows.push({surface,report,post})}writeFileSync('docs/evidence/v6/jade-editorial-witness-combinations.json',JSON.stringify({count:rows.length,rows},null,2)+'\n');
});

test('Jade second-volume draft no longer jumps twenty days forward then back into the same night',()=>{
 for(const post of ['jd_stay_grain','jd_stay_records'])for(const family of [true,false]){const r=run([post,family?'jd_receive_people':'jd_keep_porridge_hot']);const merged=r.s.frames.findIndex(f=>f.id==='jd_rejoin_1'),returned=r.s.frames.findIndex(f=>f.id==='jd_family_return_1');assert.ok(merged>0&&returned>merged);const before=r.s.frames.slice(0,merged).map(f=>f.text).join('\n');assert.doesNotMatch(before,/二十日后父女才重逢|二十天走的路/);assert.match(r.s.frames[merged].text,/天亮后/);assert.match(r.s.frames[returned].text,/二十余日以后/);if(family){assert.doesNotMatch(r.text,/二十日后父女才重逢/);assert.match(r.text,/没有被.*分开|没再被人流分开/)}else{assert.match(scene(r,'family_return'),/二十日后父女才重逢/);assert.match(r.text,/冬粮.*少一截|冬粮钱里少了一截/);assert.match(before,post==='jd_stay_grain'?/今晚仍未找到父亲/:/没有重逢的回信/)}
 }
});

test('Jade second-volume draft either initial Sima presentation reaches one formal quarter-hour and one old-file request',()=>{
 for(const ask of ['jd_bring_archive','jd_say_map_wrong']){const r=run([ask]);assert.equal(r.s.frames.filter(f=>f.text.includes('看足一刻钟')).length,1);assert.equal(r.s.frames.filter(f=>f.speaker==='jd_sima'&&f.text==='还有那张旧档么？').length,1);assert.match(r.text,/这里怎么一股酱味/);assert.match(r.text,/柳观河从这里悟剑，所以呢/)}
});

test('Jade second-volume draft surface copy costs three permitted days and paper; early incision cannot recover a complete first surface',()=>{
 const kept=run(),early=run(['jd_read_dark_first']);assert.match(scene(kept,'gold'),/请准三日/);assert.match(scene(kept,'gold'),/上面准了三日/);assert.doesNotMatch(scene(kept,'gold'),/不拦暗刻的工/);assert.match(kept.text,/自己垫掉一笔纸钱/);assert.match(early.text,/这层刮了便不能再照原面描/);assert.match(early.text,/补两夜/);
});

test('Jade second-volume draft paid job or real contact remains Qiao own actual decision after reunion',()=>{
 for(const family of [true,false])for(const job of [true,false]){const r=run([family?'jd_receive_people':'jd_keep_porridge_hot',job?'jd_offer_paid_shift':'jd_leave_real_contact']);const part=scene(r,'family_return');if(family)assert.match(part,/还没有答应接下哪一班/);assert.match(part,job?/她选了半日/:/阿荞指明哪天不能来/);assert.doesNotMatch(part,/她自己挑了能回去照应的时辰/)}
});

test('Jade second-volume draft fixed nine stores, separate nights, final breakage and two ordinary careers stay playable and restore exactly',()=>{
 for(const post of ['jd_stay_grain','jd_stay_records'])for(const career of ['jd_choose_storework','jd_choose_archivework']){const r=run([post,career]);for(const text of ['十三文','婚书','洗三日','半年','璧半、册半','第一库挖开，塌了','酒窖','第三库进水','木架','第五','第六库','第七','第八库','第九库','玉丢不算大事，库丢才算','第七粮守住','第九真璧碎','二十文没卖成'])assert.ok(r.text.includes(text),text);assert.equal(r.s.frame.ending,career==='jd_choose_storework'?'jd_storework':'jd_archivework');assert.equal(r.s.commands.filter(c=>c.startsWith('choice:')).length,post==='jd_stay_grain'?29:28);assert.ok(r.s.frames.some(f=>f.id==='jd_two_fighters_1')===(post==='jd_stay_grain'));assert.ok(r.s.frames.some(f=>f.id==='jd_three_impacts_1')===(post==='jd_stay_records'));assert.deepEqual(restoreVN(JSON.stringify(r.s.save()),{content,version}).session.frames,r.s.frames);assert.throws(()=>restoreVN(JSON.stringify(r.s.save()),{content:published,version:'jade-1.0.0'}),/作品或版本不兼容/);writeFileSync(`docs/evidence/v6/jade-editorial-draft-${post}-${career}.txt`,r.text)}
});

test('Jade second-volume draft 512 sampled alternatives cover all declared beats and choices with bounded gaps',()=>{
 const visited=new Set<string>(),choices=new Set<string>(),ends=new Set<string>();let longest=0;for(let seed=1;seed<=512;seed++){const r=run([],seed);longest=Math.max(longest,r.longest);for(const f of r.s.frames){visited.add(f.id);f.choices.forEach(c=>choices.add(c.id));assert.ok(f.stage.cast.length<=3)}ends.add(r.s.frame.ending!)}const declared=[...source.matchAll(/# beat:(\S+)/g)].map(m=>m[1]);assert.deepEqual([...visited].sort(),declared.sort());assert.equal(choices.size,68);assert.equal(ends.size,2);writeFileSync('docs/evidence/v6/jade-editorial-draft-audit.json',JSON.stringify({status:'THREE_INTERNAL_ROUNDS_DRAFT_NOT_INTEGRATED',declared:declared.length,visited:visited.size,options:choices.size,endings:[...ends],decisions:{grain:29,records:28},samples:512,longestPassiveGap:longest,exhaustive:false},null,2)+'\n');assert.ok(longest<=18,`longest ${longest}`);
});

test('Jade second-volume draft leaves original six authors, both current books, before-CG source and canon byte-identical',()=>{
 const d=JSON.parse(readFileSync('docs/evidence/v6/jade-editorial-integration-preservation.json','utf8'));for(const [p,h]of Object.entries(d.frozen))assert.equal(createHash('sha256').update(readFileSync(p)).digest('hex'),h,p);const records=JSON.parse(readFileSync('docs/evidence/v6/jade-editorial-round1-records.json','utf8'));assert.equal(records.records.length,13);assert.ok(records.records.every((r:{before:string,after:string})=>r.before!==r.after));for(const [round,count]of [[2,12],[3,18]]){const d=JSON.parse(readFileSync(`docs/evidence/v6/jade-editorial-round${round}-records.json`,'utf8'));assert.equal(d.records.length,count)}
});


test('Jade second-volume draft new grain fire responses separate damp half-load from burnt straw and missing basket; fixed battle remains intact',()=>{
 const rows=[];for(const cover of [true,false])for(const traffic of [true,false])for(const family of [true,false]){const r=run([cover?'jd_fold_wet_canvas':'jd_pull_ember_cart',traffic?'jd_keep_people_lane':'jd_keep_grain_lane',family?'jd_receive_people':'jd_keep_porridge_hot']);assert.match(scene(r,'grain_sparks'),/落在车沿的干草下/);assert.match(scene(r,'grain_sparks'),cover?/半担粮沾水/:/盛焦草的筐不再拿去装粮/);assert.match(scene(r,'night_reports'),cover?/湿粮另进验粮棚/:/补筐的时辰/);assert.match(r.text,/近百招/);assert.match(r.text,/第七库最终没有烧/);assert.equal(r.s.commands.filter(c=>c.startsWith('choice:')).length,29);rows.push({cover,traffic,family})}const other=run(['jd_stay_records']);assert.ok(!other.s.frames.some(f=>f.id.startsWith('jd_grain_sparks_')));assert.equal(other.s.commands.filter(c=>c.startsWith('choice:')).length,28);writeFileSync('docs/evidence/v6/jade-editorial-fire-combinations.json',JSON.stringify({count:rows.length,rows},null,2)+'\n');
});

test('Jade second-volume draft four middle tasks have distinct later practical burdens',()=>{
 for(const pick of ['jd_keep_material_record','jd_help_remove_rot','jd_pay_return_work','jd_send_verified_page']){const surface=pick==='jd_keep_material_record'||pick==='jd_help_remove_rot',r=run([surface?'jd_keep_surface':'jd_read_dark_first',pick]);assert.match(scene(r,'sixth'),pick==='jd_keep_material_record'?/留下补一幅小图/:pick==='jd_help_remove_rot'?/找出还能修的一只/:pick==='jd_pay_return_work'?/少买一份热食/:/改接次班/)}
});

test('Jade second-volume draft archive source, packet method and preparation choices have later returns without omniscient reports',()=>{
 for(const names of [true,false])for(const packet of [true,false])for(const water of [true,false])for(const post of ['jd_stay_grain','jd_stay_records']){const r=run([names?'jd_sort_old_names':'jd_follow_repair',packet?'jd_send_objects_separate':'jd_take_verified_copy',water?'jd_help_water':'jd_help_signal',post]);assert.match(scene(r,'half_year'),names?/前后两个书名都留着/:/没替你省下这一夜补称名/);assert.match(scene(r,'in_palace'),packet?/两份都收妥/:/回信再问/);assert.match(scene(r,'post_gate'),water?/湿的哪捆只压火/:/仍得等本人跑来/);if(post==='jd_stay_grain')assert.match(r.text,/你在粮路听到这个次序/);else assert.match(r.text,/不是你在第九库也亲见过的那一夜/)}
});

test('Jade second-volume draft wedding promise and later objects stay with their owners under all gift and presentation actions',()=>{
 for(const sample of [true,false])for(const gift of [true,false])for(const show of [true,false]){const r=run([sample?'jd_show_hand':'jd_confirm_names',gift?'jd_return_wedding_copy':'jd_visit_without_treasure',show?'jd_show_best_work':'jd_name_best_work']);assert.match(scene(r,'marriage_letter'),/次日，你先核两家的名字和吉日，把婚书交到何家/);assert.doesNotMatch(scene(r,'marriage_letter'),/你先把婚书写完/);assert.match(scene(r,'he_late'),gift?/你带的底稿已卷角/:/干货先被放到秤边/);assert.match(scene(r,'he_late'),sample?/给我看了两行/:/没来问猫/);assert.match(scene(r,'he_late'),show?/叫家里取来当年那封婚书/:/叫儿子从里屋找出婚书/);assert.doesNotMatch(scene(r,'he_late'),/取出当年留下的誊本/)}
});


test('Jade second-volume draft exposes real present compensation and pending balance rather than spending future pay twice',()=>{
 for(const post of ['jd_stay_grain','jd_stay_records']){const r=run([post,'jd_keep_porridge_hot']);assert.match(scene(r,'family_return'),/此刻能拿出的路费先补/);assert.match(scene(r,'family_return'),/等下一份酬钱实领再给/);assert.doesNotMatch(r.text,/拿后来能领到的酬钱先补/)}assert.doesNotMatch(scene(run(),'night_reports'),/这牌我带着/);
});
