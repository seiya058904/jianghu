import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync,writeFileSync} from 'node:fs';
import {VNRuntime,restoreVN} from '../src/vn-runtime.ts';
import {characters} from '../src/catalog.ts';
import content from '../src/generated/north-v2.json' with {type:'json'};
const edition={content,version:'north-2.0.0'};
function run(pick:(ids:string[])=>string){const s=new VNRuntime(content,edition.version);let gap=0,longest=0;while(!s.frame.ending){if(s.frame.choices.length){s.choose(pick(s.frame.choices.map(c=>c.id)));gap=0}else{s.advance();longest=Math.max(longest,++gap)}assert.ok(s.commands.length<650)}return{s,text:s.frames.map(f=>f.text).join('\n'),longest}}
const route=(overrides:string[]=[])=>run(ids=>ids.find(id=>overrides.includes(id))??ids[0]);
test('North full careers keep three teachers, old ranks, four battles and unfinished realm on both personal paths',()=>{
 for(const side of [0,1]){const r=run(ids=>ids[side]);assert.equal(r.s.frame.ending,side?'nq_three_names':'nq_first_again');for(const p of ['一百二十七','十三岁','寅时','扎、拦、拿','十一招','二十七','七十余','十七岁','十八岁','二十一招','三十七招','六十四招','一百四十六','十九场','十七胜','两平','一百零九','七十六招','七十三','三十二招','三十八','四十一','四十五','枪有','一百六十余招','四十一','第三十六','三十一','五十','第八','三百余','五十八','第八十三','第一百七十二','虎口裂','右臂麻','第二百零八','六十一','半个时辰','三成','第二五成','第三七成','司马天岳是我徒弟','你仍是六合门的人','三个月不许碰枪','二十七盘','第二十八','两千余枪','第七日','三年','第六十一招','六十五','六十七','六十九','七十一','一百七十余','一百二十余','约百招','七十多','第一百三十二','胸前一寸','肩外四寸','一百四十一','一百六十四','三百零一','三百零八','七寸','岁月胜','七十六岁','返真','旧白蜡枪','半截断杆','扶手','仍未返真'])assert.ok(r.text.includes(p),p);
 assert.deepEqual(restoreVN(JSON.stringify(r.s.save()),edition).session.frames,r.s.frames);assert.throws(()=>restoreVN(JSON.stringify(r.s.save()),{content,version:'sea-1.0.0'}),/作品或版本不兼容/);writeFileSync(`docs/evidence/v6/heng-north-${r.s.frame.ending}-transcript.txt`,r.text);
 }
});
test('North a single departure choice changes the old school and friend costs twelve years later',()=>{
 const ready=route(),early=route(['nq_depart_with_letter']);const at=ready.s.commands.indexOf('choice:nq_teach_before_departure');assert.ok(at>0);assert.deepEqual(ready.s.commands.slice(0,at),early.s.commands.slice(0,at));assert.match(ready.text,/错过原拟同行的车/);assert.match(ready.text,/没再.*多带半年/);assert.match(early.text,/夜课推了半年/);assert.match(early.text,/错过那年回乡探亲/);assert.match(early.text,/别人的日子就自己接上/);for(const r of [ready,early])assert.match(r.text,/第一场三十二招/);
});
test('North one relearning letter changes later appointments, two-day costs and pupil trust without losing the spear',()=>{
 const plain=route(),brief=route(['nq_write_safe_only']);const at=plain.s.commands.indexOf('choice:nq_write_relearn');assert.ok(at>0);assert.deepEqual(plain.s.commands.slice(0,at),brief.s.commands.slice(0,at));assert.match(plain.text,/少年敢说自己拦不住/);assert.doesNotMatch(plain.text,/花两日去撤/);assert.match(brief.text,/花两日去撤/);assert.match(brief.text,/多请半月馆师/);assert.match(brief.text,/没有人因此再禁你拿枪/);assert.match(brief.text,/后来那位|曾传的伤退/);
});
test('North mender identity is not presented before the reveal; old tea and aged friend do not share the wrong time',()=>{
 const r=route(),frames=r.s.frames;const reveal=frames.findIndex(f=>f.text==='司马衡。');assert.ok(reveal>0);assert.ok(!frames.slice(0,reveal).some(f=>f.stage.cast.includes('nq2_heng')));assert.doesNotMatch(characters.nq2_mender.name+characters.nq2_mender.role+characters.nq2_mender.detail,/司马|返真|老师/);
 assert.ok(frames.filter(f=>f.stage.scene==='nq_gunroom').every(f=>!f.stage.cast.some(id=>['nq_zhou','nq_chu','nq2_heng','nq2_mender'].includes(id))));assert.equal(frames.find(f=>f.id==='nq_letter_1')!.stage.looks?.nq_yuan,'adult');assert.equal(frames.find(f=>f.id==='nq_three_objects_1')!.stage.looks?.nq_yuan,'late');assert.match(r.text,/回到七十六岁/);
 const remembered=route(['nq_end_visits']);assert.match(r.text,/少去一场外地的邀约/);assert.match(remembered.text,/少亲带一班/);assert.equal(remembered.s.frame.ending,'nq_three_names');
});
test('North sampled routes cover all authored beats and choices with bounded passive reading',()=>{
 const visited=new Set<string>(),choices=new Set<string>(),ends=new Set<string>();let longest=0;for(let seed=1;seed<=512;seed++){let state=Math.imul(seed,2654435761)>>>0;const r=run(ids=>{state=(Math.imul(state,1664525)+1013904223)>>>0;return ids[state>>>31]});r.s.frames.forEach(f=>{visited.add(f.id);f.choices.forEach(c=>choices.add(c.id));assert.ok(f.stage.cast.length<=3)});ends.add(r.s.frame.ending!);longest=Math.max(longest,r.longest)}
 const beats=[...readFileSync('story/north-v2.ink','utf8').matchAll(/# beat:(\S+)/g)].map(m=>m[1]);assert.deepEqual([...visited].sort(),beats.sort());assert.equal(choices.size,62);assert.equal(ends.size,2);assert.ok(longest<=18,`gap ${longest}`);writeFileSync('docs/evidence/v6/heng-north-content-audit.json',JSON.stringify({status:'FIRST_VOLUME_DRAFT_NOT_FINAL',sourceBeats:beats.length,visited:visited.size,choiceOptions:choices.size,decisionsPerRoute:31,sampledPaths:512,exhaustive:false,longestPassiveGap:longest,limits:'Second life and cross-interview exist separately; Heng has a dedicated identity. Qin and other important identities/ages, active spear/cane/sword staging, old chair/relic art, full literary rounds and human reading remain incomplete.'},null,2));
});
