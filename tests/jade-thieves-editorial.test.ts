import {jadeThievesFacts,jadeThievesScenes} from '../src/jade-thieves-catalog.ts';
import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync,writeFileSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {frozenBytes} from './frozen-baselines.ts';
import content from '../src/generated/jade-thieves.json' with {type:'json'};
import {VNRuntime,restoreVN} from '../src/vn-runtime.ts';
import published from '../src/generated/jade-thieves-v1.json' with {type:'json'};
const source=readFileSync('story/jade-thieves.ink','utf8'),version='jade-thieves-2.0.0';
function run(picks:string[]=[],seed?:number,data=content){const s=new VNRuntime(data,version);let n=seed??0,gap=0,longest=0;while(!s.frame.ending){assert.ok(s.commands.length<600);if(s.frame.choices.length){n=(Math.imul(n,1664525)+1013904223)>>>0;s.choose((s.frame.choices.find(c=>picks.includes(c.id))??s.frame.choices[seed===undefined?0:(n>>>16)%s.frame.choices.length]).id);gap=0}else{s.advance();longest=Math.max(longest,++gap)}}return{s,text:s.frames.map(f=>f.text).join('\n'),longest}}
const section=(r:ReturnType<typeof run>,key:string)=>r.s.frames.filter(f=>f.id.startsWith('jt_'+key+'_')).map(f=>f.text).join('\n');

test('Jade draft reproduces premature order reveal then leaves actual disclosure to the player',()=>{
 assert.match(section(run([],undefined,published),'revealed'),/两边的命令都摆到能看见/);
 for(const pov of ['jt_be_shen','jt_be_jiang'])for(const response of ['jt_hold_distance','jt_show_order']){const r=run([pov,response]);const first=r.s.frames.find(f=>f.id==='jt_revealed_1')!;assert.match(first.text,/还没有当面说清/);assert.doesNotMatch(first.text,/绝旁知者|不留外人|命令都摆/);assert.match(r.text,response==='jt_hold_distance'?/还要一起走么/:/要我动手的，我没照做/);const before=r.s.frames.slice(0,r.s.frames.findIndex(f=>f.id==='jt_revealed_1')).map(f=>f.text).join('\n');assert.doesNotMatch(before,pov==='jt_be_shen'?/璧归门。同行非本门者/:/得璧。绝旁知者/)}
});

test('Jade draft auction observation and rescue priorities each produce their actual later action',()=>{
 for(const pov of ['jt_be_shen','jt_be_jiang'])for(const watch of [true,false])for(const person of [true,false]){const r=run([pov,watch?'jt_watch_pass':'jt_hear_buyers',person?'jt_clear_person':'jt_wait_real']);assert.match(section(r,'auction'),watch?/端匣人那双湿鞋/:/记下的外门果然被堵/);assert.match(section(r,'four_hands'),person?/伙计伏着身/:/这一回不必拆开再认/);assert.match(r.text,/四人手间换过/);assert.match(r.text,/第一次江救沈/)}
});

test('Jade draft sleeve actions name both bodies under either viewpoint and retain different wet-clothes treatment costs',()=>{
 for(const pov of ['jt_be_shen','jt_be_jiang'])for(const bind of [true,false]){const r=run([pov,bind?'jt_bind_sleeve':'jt_move_to_bank']);const labels=r.s.frames.flatMap(f=>f.choices).filter(c=>['jt_bind_sleeve','jt_move_to_bank'].includes(c.id)).map(c=>c.text).join('\n');assert.doesNotMatch(labels,/先替她|包扎请她/);assert.match(labels,/沈先压住伤处/);assert.match(section(r,'temple_laugh'),bind?/两双湿鞋/:/没涉水的鞋仍能穿/);assert.match(r.text,/第二次江救沈/);assert.match(r.text,/挡开贴近江颈侧/)}
});

test('Jade draft early naming and package actions keep distinct shared-life and resource returns',()=>{
 for(const pov of ['jt_be_shen','jt_be_jiang'])for(const name of [true,false])for(const pack of [true,false]){const r=run([pov,name?'jt_give_name':'jt_ask_way',pack?'jt_change_load':'jt_change_path']);assert.match(section(r,'first_order'),name?/普通留饭的叫法/:/见面的时辰却又被你们各核/);assert.match(section(r,'pursuers'),pack?/省下的这一宿钱留作药费/:/少买一份干粮/);assert.match(r.text,/盘查已改成一男一女|到镇上才换普通箱/)}
});

test('Jade draft repayment alternatives do not re-owe already settled craftsman wages; time and escape stay concrete',()=>{
 for(const debt of ['jt_share_ordinary','jt_finish_debts'])for(const later of ['jt_take_living_work','jt_keep_private_record'])for(const exposed of ['jt_hide_apprentice','jt_send_apprentice']){const r=run([debt,later,exposed]);const death=r.s.frames.findIndex(f=>f.id==='jt_gone_1'),after=r.s.frames.slice(death).map(f=>f.text).join('\n');assert.doesNotMatch(after,/未还的工钱|送到的工钱/);assert.match(r.text,/假璧被抢走的半年以后/);assert.match(after,/沿石后的窄缝拖着木箱退/);assert.match(after,/没有把他的那条路也带出来/);assert.ok(r.s.frames.slice(death).every(f=>!f.stage.cast.includes('jt_jiang')&&f.speaker!=='jt_jiang'));assert.match(r.text,exposed==='jt_send_apprentice'?/腿要养一个月/:/少牵进这一名学徒/)}
});

test('Jade draft two viewpoints and both private futures preserve fixed death, ordinary true jade and final objects; saves replay exactly',()=>{
 for(const pov of ['jt_be_shen','jt_be_jiang'])for(const late of ['jt_take_living_work','jt_keep_private_record']){const r=run([pov,late]);assert.equal(r.s.frame.ending,late==='jt_take_living_work'?'jt_unmarked_life':'jt_private_account');assert.equal(r.s.commands.filter(c=>c.startsWith('choice:')).length,22);for(const phrase of ['空的','做旧容易，做这么丑难','真货放在普通木箱','本有机会走','也还行','江十七死了','十一年后','十三年','旧铜钱','失败试片'])assert.ok(r.text.includes(phrase),phrase);assert.deepEqual(restoreVN(JSON.stringify(r.s.save()),{content,version}).session.frames,r.s.frames);assert.throws(()=>restoreVN(JSON.stringify(r.s.save()),{content:published,version:'jade-thieves-1.0.0'}),/作品或版本不兼容/);writeFileSync(`docs/evidence/v6/jade-thieves-editorial-current-${pov}-${late}.txt`,r.text)}
});

test('Jade draft 768 sampled alternatives cover all declared beats/options and keep bounded passive gaps',()=>{
 const visited=new Set<string>(),options=new Set<string>(),ends=new Set<string>();let longest=0;
 for(let seed=1;seed<=768;seed++){const r=run([],seed);longest=Math.max(longest,r.longest);for(const f of r.s.frames){visited.add(f.id);f.choices.forEach(c=>options.add(c.id));assert.ok(f.stage.cast.length<=3)}ends.add(r.s.frame.ending!)}
 const declared=[...source.matchAll(/# beat:(\S+)/g)].map(m=>m[1]);assert.deepEqual([...visited].sort(),declared.sort());assert.equal(options.size,45);assert.equal(ends.size,2);
 writeFileSync('docs/evidence/v6/jade-thieves-editorial-current-audit.json',JSON.stringify({status:'VERSIONED_PRODUCTION_CONTENT_VERIFIED_NOT_FULL_GOAL_ACCEPTANCE',declared:declared.length,visited:visited.size,options:options.size,endings:[...ends],decisions:22,samples:768,exhaustive:false,longestPassiveGap:longest},null,2)+'\n');assert.ok(longest<=18,`longest passive gap ${longest}`);
});

test('Jade draft leaves published first/second volume, canon and original authors exact',()=>{
 const d=JSON.parse(readFileSync('docs/evidence/v6/jade-thieves-editorial-integration-preservation.json','utf8'));const moved=JSON.parse(readFileSync('docs/evidence/v6/jade-editorial-integration-preservation.json','utf8')).pathMap;for(const [p,hash]of Object.entries(d.frozen)){const b=frozenBytes(moved[p]??p);if(!b)continue;assert.equal(createHash('sha256').update(b).digest('hex'),hash,p)}
 for(const [round,count]of [[1,16],[2,13],[3,22]]){const records=JSON.parse(readFileSync(`docs/evidence/v6/jade-thieves-editorial-round${round}-records.json`,'utf8'));assert.equal(records.records.length,count);assert.ok(records.records.every((r:{before:string,after:string})=>r.before!==r.after))}
});


test('Jade draft exact orders are actually spoken only after disclosure in both viewpoints',()=>{
 for(const pov of ['jt_be_shen','jt_be_jiang'])for(const show of [true,false])for(const check of [true,false]){const r=run([pov,show?'jt_show_order':'jt_hold_distance',check?'jt_check_before_asking':'jt_send_meeting']),scene=section(r,'not_fighting');if(show){assert.match(scene,/绝旁知者/);assert.match(scene,/同行非本门者，不留/);assert.ok(r.s.frames.some(f=>f.id.startsWith('jt_not_fighting_')&&f.speaker==='you'&&f.text.includes(pov==='jt_be_shen'?'得璧':'璧归门')))}else{assert.doesNotMatch(scene,/绝旁知者|璧归门/);assert.match(scene,/明早出门时先叫醒/)}assert.match(section(r,'revealed'),check?/错过原本能赶的那班船/:/等过一遍更/)}
});

test('Jade draft hot meal and early settlement both pay the craftsman, with distinct night and travel costs',()=>{
 for(const meal of [true,false])for(const early of [true,false])for(const bread of [true,false]){const r=run([meal?'jt_share_ordinary':'jt_finish_debts',early?'jt_go_by_work':'jt_go_by_oldmark',bread?'jt_share_bread':'jt_count_cost']);assert.match(section(r,'settled_road'),meal?/先把老匠余款.*交清/:/昨夜先结清余款/);assert.match(section(r,'settled_road'),meal?/没赶上早车/:/赶上这班车/);assert.match(section(r,'craftsman'),early?/转了半夜磨盘/:/订钱也在这时交下/);assert.match(section(r,'not_fighting'),bread?/没动贴身那枚旧钱/:/先前少住一宿省下的钱已经添过药/);assert.match(r.text,/旧铜钱/)}
});

test('Jade draft close-range actions retain positions and injury echoes without avoiding Jiang death',()=>{
 const rows=[];for(const pov of ['jt_be_shen','jt_be_jiang'])for(const inside of [true,false])for(const cart of [true,false])for(const press of [true,false]){const r=run([pov,inside?'jt_open_inside':'jt_keep_blade_range',cart?'jt_clear_other_cart':'jt_leave_marker',press?'jt_press_wound':'jt_pull_to_rock']);assert.match(section(r,'close_press'),/短刃够不到握刀的手/);assert.match(section(r,'close_press'),inside?/肩贴近一步才挑到腕侧/:/剑尖留在对方前腕前/);assert.match(section(r,'turn_back'),inside?/发麻的手握不住他的衣带/:/被顶疼的肩没能再撑/);assert.match(section(r,'gone'),cart?/先前放走的最后一辆车/:/记得你们喊过的石角/);assert.match(r.text,/本有机会走/);assert.match(r.text,/江十七死了/);assert.equal(r.s.commands.filter(c=>c.startsWith('choice:')).length,22);rows.push({pov,inside,cart,press})}writeFileSync('docs/evidence/v6/jade-thieves-editorial-close-combinations.json',JSON.stringify({count:rows.length,rows},null,2)+'\n');
});

test('Jade draft later work and final paper actions survive either private future',()=>{
 for(const future of ['jt_take_living_work','jt_keep_private_record'])for(const work of [true,false])for(const paper of [true,false]){const r=run([future,work?'jt_ask_today_work':'jt_finish_old_account',paper?'jt_leave_ordinary':'jt_leave_silence']);assert.match(section(r,'hidden_years'),work?/隔日再去，才攒到下一包药/:/先去帮着择菜偿这两日/);assert.match(section(r,'box'),paper?/谁肯收、谁已搬走/:/药钱另记新纸/);assert.match(section(r,'box'),/真的太重，假的轻些/);assert.equal(r.s.frame.ending,future==='jt_take_living_work'?'jt_unmarked_life':'jt_private_account')}
});


test('Jade draft both settlement routes keep chronology coherent and held-order route learns threats without reading the other letter',()=>{
 const r=run(['jt_finish_debts','jt_hold_distance','jt_count_cost','jt_keep_blade_range']);assert.doesNotMatch(section(r,'settled_road'),/车已经走/);assert.match(section(r,'settled_road'),/赶上这班车/);assert.match(section(r,'not_fighting'),/先前少住一宿省下的钱已经添过药/);assert.match(section(r,'not_fighting'),/江问内廷的人会不会放他，沈问盗门会不会放她。两人都摇头/);assert.doesNotMatch(section(r,'not_fighting'),/得璧。绝旁知者|璧归门/);assert.match(section(r,'close_press'),/右肩/);assert.doesNotMatch(section(r,'close_press'),/旧肩/);
});


test('Jade revised fact and scene subtitle do not reveal either order before the chosen disclosure; frozen metadata stays available',()=>{
 const r=run(['jt_hold_distance']),f=r.s.frames.find(f=>f.id==='jt_revealed_1')!;assert.ok(f.tags.includes('fact:jt_roles_v2'));assert.equal(f.stage.scene,'jt2_temple_reveal');assert.doesNotMatch(jadeThievesFacts.jt_roles_v2.text+jadeThievesScenes.jt2_temple_reveal.time,/绝旁知者|不留外人|命令已明/);assert.match(jadeThievesFacts.jt_roles.text,/绝旁知者/);assert.equal(jadeThievesScenes.jt_temple_reveal.time,'身份与命令已明');
});


test('Jade V2 preserves exact empty-box timing, two new portrait anchors, old version prefix and narrow migration boundary',()=>{
 for(const pov of ['jt_be_shen','jt_be_jiang']){const r=run([pov]);const cg=r.s.frames.findIndex(f=>f.id==='jt_empty_box_1');assert.equal(r.s.frames[cg].stage.cg,'emptyBox');assert.equal(r.s.frames[cg+1].stage.cg,'emptyBox');assert.equal(r.s.frames[cg+2].stage.cg,undefined);const close=r.s.frames.find(f=>f.stage.camera==='portrait')!;assert.equal(close.id,pov==='jt_be_shen'?'jt_revealed_10':'jt_revealed_15');assert.equal(close.speaker,pov==='jt_be_shen'?'jt_jiang':'jt_shen');assert.equal(r.s.frames[r.s.frames.indexOf(close)+1].stage.camera,undefined)}
 const ed=readFileSync('src/edition.ts','utf8');assert.match(ed,/slug==='jade-thieves-v1'\?await import\('\.\/generated\/jade-thieves-before-cg/);assert.doesNotMatch(ed,/slug==='jade-thieves'\?await import\('\.\/generated\/jade-thieves-before-cg/);
});
