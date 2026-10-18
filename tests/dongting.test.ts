import {evidencePath} from './evidence-path.ts';
import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync,writeFileSync} from 'node:fs';
import {VNRuntime,restoreVN} from '../src/vn-runtime.ts';
import content from '../src/generated/dongting.json' with {type:'json'};
const edition={content,version:'dongting-1.0.0'};
function run(preferred:string[]=[],random?:()=>number){const s=new VNRuntime(content,edition.version);let gap=0,longest=0;while(!s.frame.ending){if(s.frame.choices.length){s.choose(random?s.frame.choices[random()%s.frame.choices.length].id:(s.frame.choices.find(c=>preferred.includes(c.id))??s.frame.choices[0]).id);gap=0}else{s.advance();longest=Math.max(longest,++gap)}assert.ok(s.commands.length<350)}return{s,text:s.frames.map(f=>f.text).join('\n'),longest}}
test('Dongting two life outcomes retain the 106/79 bouts, 4–3 recusal and Chen’s independent later seat',()=>{
 const company=run(),cargo=run(['dt_save_cargo']);
 assert.equal(company.s.frame.ending,'dt_company');assert.equal(cargo.s.frame.ending,'dt_cargo');
 for(const r of [company,cargo]){
  assert.match(r.text,/第一百零六合/);assert.match(r.text,/第七十九招杀魏虎/);
  assert.match(r.text,/四推梁，三推陈/);assert.match(r.text,/三年以后.*陈震.*第十五/);
  assert.doesNotMatch(r.text,/沈老七|沈鹤汀|叶孤舟/);
  assert.deepEqual(restoreVN(JSON.stringify(r.s.save()),edition).session.frames,r.s.frames);
  assert.equal(r.s.frames.find(frame=>frame.text.includes('陈震右肩中戟'))?.stage.moods.dt_chen,'hurt');
  assert.equal(r.s.frames.find(frame=>frame.stage.scene==='dt_three')?.stage.moods.dt_chen,'calm');
  assert.ok(r.longest<=18);
 }
 assert.doesNotMatch(company.text,/我站不起来/);assert.match(cargo.text,/脚还在下面/);
 assert.match(company.text,/留下来还那批损货的工债/);assert.match(cargo.text,/你保住主运粮线/);
 writeFileSync(evidencePath('docs/evidence/v6/dongting-company-transcript.txt'),company.text);
 writeFileSync(evidencePath('docs/evidence/v6/dongting-cargo-transcript.txt'),cargo.text);
});
test('Dongting early spare rope and rest materially change a later rescue injury',()=>{
 const good=run(),short=run(['dt_cargo_tight']),tired=run(['dt_make_cargo']);
 assert.doesNotMatch(good.text,/我站不起来/);assert.match(short.text,/我站不起来/);assert.match(tired.text,/我站不起来/);
 assert.match(good.text,/汪苇的脚还撑得住/);assert.doesNotMatch(short.text,/汪苇的脚还撑得住/);
 const common=run(['dt_share_channel','dt_take_positions']);assert.match(common.text,/听见你报内/);
 const unsignalled=run(['dt_keep_channel']);
 assert.match(unsignalled.text,/听见你报船在内/);
 assert.match(unsignalled.text,/没练熟内外交错的口令/);
 assert.doesNotMatch(unsignalled.text,/我方才分不清谁在喊/);
});
test('Dongting reaches every authored branch in a bounded sample; acting cast excludes merely mentioned elders',()=>{
 const visited=new Set<string>(),cast=new Set<string>();let state=0x7563,longest=0;
 for(let i=0;i<160;i++){const r=run([],()=>{state=(Math.imul(state,1664525)+1013904223)>>>0;return state>>>16});longest=Math.max(longest,r.longest);r.s.frames.forEach(f=>{visited.add(f.id);f.stage.cast.forEach(id=>cast.add(id))})}
 const declared=[...readFileSync('story/dongting.ink','utf8').matchAll(/# beat:(\S+)/g)].map(m=>m[1]);assert.deepEqual([...visited].sort(),declared.sort());assert.equal(cast.size,10);
 writeFileSync(evidencePath('docs/evidence/v6/dongting-content-audit.json'),JSON.stringify({status:'DRAFT_NOT_FINAL',sourceBeats:declared.length,visited:visited.size,cast:[...cast],decisionPoints:11,sampledPaths:160,exhaustive:false,longestPassiveGap:longest,limits:'Pending dedicated art, entry, browser playthrough, and editorial rounds.'},null,2));
});
