import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync,writeFileSync} from 'node:fs';
import {VNRuntime,restoreVN} from '../src/vn-runtime.ts';
import content from '../src/generated/sea.json' with {type:'json'};
const edition={content,version:'sea-2.0.0'};
function run(pick:(ids:string[])=>string){const s=new VNRuntime(content,edition.version);let gap=0,longest=0;while(!s.frame.ending){if(s.frame.choices.length){s.choose(pick(s.frame.choices.map(c=>c.id)));gap=0}else{s.advance();longest=Math.max(longest,++gap)}assert.ok(s.commands.length<500)}return{s,text:s.frames.map(f=>f.text).join('\n'),longest}}
const route=(overrides:string[]=[])=>run(ids=>ids.find(id=>overrides.includes(id))??ids[0]);
test('Sea keeps separate protagonists, fixed defeats, ordinary pupils, realm and posthumous succession on both full routes',()=>{
 for(const side of [0,1]){const r=run(ids=>ids[side]);assert.equal(r.s.frame.ending,side?'sr_next_harbor':'sr_open_courtyard');
 for(const phrase of ['五十三岁','十二位','十胜两平','十一日','十七日','两百余年后','父母所生','九岁入门','三十五','第十二招','四十三招','八十余招','二十八场','二十三胜、三平、两败','第九十七招','四十岁','十二日','阿罗真','罗天海','两百一十余招','五十一','五十二','五十四','五十五','五日','半年','不正式收','十二名普通弟子','五十八','一百八十余招','六十一','四十余招','返真','天海宗不是天都门','海天门','学我者，不得终于我','返真中段','并未走到后段','据说','没有全证','一百二十余年','第二代','未返真','第三代','八家之一'])assert.ok(r.text.includes(phrase),phrase);
 assert.ok(!r.s.frames.filter(f=>f.stage.scene!=='sr_oldarena'&&f.stage.scene!=='sr_oldshore').some(f=>f.stage.cast.some(id=>id==='sr_oldmaster'||id==='sr_oldboat')));
 assert.deepEqual(restoreVN(JSON.stringify(r.s.save()),edition).session.frames,r.s.frames);assert.throws(()=>restoreVN(JSON.stringify(r.s.save()),{content,version:'jade-1.0.0'}),/作品或版本不兼容/);
 writeFileSync(`docs/evidence/v6/sea-editorial-current-${r.s.frame.ending}-transcript.txt`,r.text);
 }
});
test('Sea one early cooperation change pays off five years later with a different illness transfer cost',()=>{
 const shared=route(),held=route(['sr_hold_line']);const at=shared.s.commands.indexOf('choice:sr_trust_line');assert.ok(at>0);assert.deepEqual(shared.s.commands.slice(0,at),held.s.commands.slice(0,at));
 assert.match(shared.text,/少请一趟脚夫/);assert.doesNotMatch(shared.text,/候一宿的费用/);assert.match(held.text,/候一宿的费用/);assert.match(held.text,/他仍帮你找好住处/);
});
test('Sea teaching styles change actual later cover duties and time costs without changing the fixed enlightenment',()=>{
 const daily=route(),paired=route(['sr_teach_pair']);const at=daily.s.commands.indexOf('choice:sr_teach_daily');assert.ok(at>0);assert.deepEqual(daily.s.commands.slice(0,at),paired.s.commands.slice(0,at));
 assert.match(daily.text,/几次代课接不下去/);assert.match(daily.text,/少接了一次远处的邀约/);assert.match(paired.text,/替下一班看一轮/);assert.match(paired.text,/留给晚班|给晚班留/);assert.match(paired.text,/访友的一夜/);
 for(const r of [daily,paired])assert.match(r.text,/六十一，返真/);
});
test('Sea personal aftermath changes sustained late activity and keeps disputed Lu pages uncertain',()=>{
 const teach=route(),sea=route(['sr_late_sea']);assert.match(teach.text,/少去的一场远游/);assert.doesNotMatch(teach.text,/海上回信，不是你旧日/);assert.match(sea.text,/海上回信，不是你旧日/);assert.match(sea.text,/少去一班自己还想看的课/);
 for(const r of [teach,sea]){assert.match(r.text,/不能证明祖师尚在人世/);assert.match(r.text,/终老、葬处与最后境界/)}
});
test('Sea sampled branches visit every authored beat with bounded reading gaps',()=>{
 const visited=new Set<string>(),choices=new Set<string>(),ends=new Set<string>();let longest=0;
 for(let seed=1;seed<=512;seed++){let state=Math.imul(seed,2654435761)>>>0;const r=run(ids=>{state=(Math.imul(state,1664525)+1013904223)>>>0;return ids[state>>>31]});r.s.frames.forEach(f=>{visited.add(f.id);f.choices.forEach(c=>choices.add(c.id));assert.ok(f.stage.cast.length<=3)});ends.add(r.s.frame.ending!);longest=Math.max(longest,r.longest)}
 const beats=[...readFileSync('story/sea.ink','utf8').matchAll(/# beat:(\S+)/g)].map(m=>m[1]);assert.deepEqual([...visited].sort(),beats.sort());assert.equal(choices.size,46);assert.equal(ends.size,2);assert.ok(longest<=18,`gap ${longest}`);
 writeFileSync('docs/evidence/v6/sea-editorial-current-content-audit.json',JSON.stringify({status:'FIRST_VOLUME_V2_INTERNAL_EDITORIAL_NOT_FULL_ACCEPTANCE',sourceBeats:beats.length,visited:visited.size,choiceOptions:choices.size,sampledPaths:512,exhaustive:false,longestPassiveGap:longest,limits:'First-volume internal editorial done in this batch; dedicated characters/ages, actual overseas environments, action, second-volume three rounds and external human reading remain incomplete.'},null,2));
});
