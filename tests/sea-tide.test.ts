import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync,writeFileSync} from 'node:fs';
import {VNRuntime,restoreVN} from '../src/vn-runtime.ts';
import {resolvePortrait} from '../src/catalog.ts';
import content from '../src/generated/sea-tide.json' with {type:'json'};
const edition={content,version:'sea-tide-2.0.0'};
function run(pick:(ids:string[])=>string){const s=new VNRuntime(content,edition.version);let gap=0,longest=0;while(!s.frame.ending){if(s.frame.choices.length){s.choose(pick(s.frame.choices.map(c=>c.id)));gap=0}else{s.advance();longest=Math.max(longest,++gap)}assert.ok(s.commands.length<500)}return{s,text:s.frames.map(f=>f.text).join('\n'),longest}}
const route=(overrides:string[]=[])=>run(ids=>ids.find(id=>overrides.includes(id))??ids[0]);
test('Sea Tide full lives preserve entry, rescue, forties nine hands, failed seat and sixty-three appointment',()=>{
 for(const side of [0,1]){const r=run(ids=>ids[side]);assert.equal(r.s.frame.ending,side?'st_next_watch':'st_next_step');for(const phrase of ['十二岁','五日','吐了三日','四十余岛','三处大港','四十七个','十六个','外院六年','十七岁','船却沉了','十八岁','连续七日','二十九岁','十一艘','三艘撞礁','二十余人','木梁把你压','三步','最后一个离船','半年后','近三十','两人都未入化','一百零六合','北榜第十四','四十多','九十余','第二招','第五招','第七招','第九招','棍仍在外侧','四十九岁','候选五人','自认第二','周望海','三个月','七年','七条','九条','六十三','第九席','百余岁','一根手指','确切境界','总谱第三','不知道','所见之海，非海之尽'])assert.ok(r.text.includes(phrase),phrase);
 assert.deepEqual(restoreVN(JSON.stringify(r.s.save()),edition).session.frames,r.s.frames);assert.throws(()=>restoreVN(JSON.stringify(r.s.save()),{content,version:'sea-1.0.0'}),/作品或版本不兼容/);writeFileSync(`docs/evidence/v6/sea-tide-editorial-current-${r.s.frame.ending}-transcript.txt`,r.text);
 const nine=r.s.frames.findIndex(f=>f.stage.scene==='st_teacourt'),seat=r.s.frames.findIndex(f=>f.id==='st_sixty_three_1');assert.ok(nine>0&&seat>nine);assert.ok(!r.s.frames.some(f=>f.stage.cast.some(id=>id.startsWith('sr_'))));
 }
});
test('Sea Tide a single sustained-practice change alters wrist injury and two months of work cost twelve years later',()=>{
 const shared=route();assert.match(shared.text,/手没被那回接绳抽伤/);assert.doesNotMatch(shared.text,/腕上的伤养了两个月/);
 for(const choice of ['st_practice_alone']){const hurt=route([choice]);assert.match(hurt.text,/腕上的伤养了两个月/);assert.match(hurt.text,/少了两趟船钱/);assert.match(hurt.text,/旧腕阴天仍会酸/);assert.match(hurt.text,/木梁把你压/);assert.match(hurt.text,/最后一个离船/)}
});
test('Sea Tide post preparation changes the seventh ship handoff and real waiting cost without changing seven versus nine',()=>{
 const prepared=route(),alone=route(['st_prepare_fast_post']);const at=prepared.s.commands.indexOf('choice:st_prepare_shared_post');assert.ok(at>0);assert.deepEqual(prepared.s.commands.slice(0,at),alone.s.commands.slice(0,at));assert.match(prepared.text,/错过了当晚原约的问手/);assert.match(alone.text,/船工也跟着多候一夜/);for(const r of [prepared,alone]){assert.match(r.text,/你带回七条船，周望海九条/);assert.match(r.text,/定下来的却是周望海/)}
});
test('Sea Tide two duties lead to sustained different personal aftermath and appropriate portrait phase/framing',()=>{
 const teach=route(),patrol=route(['st_life_patrol']);assert.match(teach.text,/今日你带新人回小船/);assert.match(patrol.text,/今日你随新人候潮/);assert.match(teach.text,/少跑几条/);assert.match(patrol.text,/少亲看几班/);
 const s=teach.s;for(const [beat,look] of [['st_trial_1','childV2'],['st_outer_years_1','youth'],['st_eleven_years_1','adult'],['st_last_look_1','late']])assert.equal(s.frames.find(f=>f.id===beat)!.stage.looks?.st_an,look);
 assert.equal(resolvePortrait('st_an','neutral','child')!.size,'auto 100%');assert.equal(resolvePortrait('st_an','neutral','adult')!.size,'auto 150%');assert.equal(s.frames.find(f=>f.id==='st_sixty_three_1')!.stage.looks?.st_ye,'late');
});
test('Sea Tide sampled routes visit all authored beats and choices with bounded reading gaps',()=>{
 const visited=new Set<string>(),choices=new Set<string>(),ends=new Set<string>();let longest=0;for(let seed=1;seed<=512;seed++){let state=Math.imul(seed,2654435761)>>>0;const r=run(ids=>{state=(Math.imul(state,1664525)+1013904223)>>>0;return ids[state>>>31]});r.s.frames.forEach(f=>{visited.add(f.id);f.choices.forEach(c=>choices.add(c.id));assert.ok(f.stage.cast.length<=3)});ends.add(r.s.frame.ending!);longest=Math.max(longest,r.longest)}
 const beats=[...readFileSync('story/sea-tide.ink','utf8').matchAll(/# beat:(\S+)/g)].map(m=>m[1]);assert.deepEqual([...visited].sort(),beats.sort());assert.equal(choices.size,42);assert.equal(ends.size,2);assert.ok(longest<=18,`gap ${longest}`);writeFileSync('docs/evidence/v6/sea-tide-editorial-current-content-audit.json',JSON.stringify({status:'SECOND_VOLUME_V2_INTERNAL_EDITORIAL_NOT_FULL_ACCEPTANCE',sourceBeats:beats.length,visited:visited.size,choiceOptions:choices.size,decisionsPerRoute:21,sampledPaths:512,exhaustive:false,longestPassiveGap:longest,limits:'Child now uses a reusable preteen variant; later multi-age identity, protagonists, overseas geography/actions and final literary/visual acceptance remain open.'},null,2));
});
