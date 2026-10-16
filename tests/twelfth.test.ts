import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync,writeFileSync} from 'node:fs';
import {VNRuntime,restoreVN} from '../src/vn-runtime.ts';
import {resolvePortrait} from '../src/catalog.ts';
import {validateDialogue} from '../scripts/validate-dialogue.mjs';
import content from '../src/generated/twelfth.json' with {type:'json'};
const edition={content,version:'twelfth-1.0.0'};
function run(pick:(ids:string[])=>string){const s=new VNRuntime(content,edition.version);let gap=0,longest=0;while(!s.frame.ending){if(s.frame.choices.length){s.choose(pick(s.frame.choices.map(c=>c.id)));gap=0}else{s.advance();longest=Math.max(longest,++gap)}assert.ok(s.commands.length<400)}return{s,longest,text:s.frames.map(f=>f.text).join('\n')}}
test('Twelfth two personal careers preserve Xue’s real win, candidate status, injury record, 4–3 and one edition for four years',()=>{
 const school=run(ids=>ids[0]),palace=run(ids=>ids[1]);
 assert.equal(school.s.frame.ending,'qw_school');assert.equal(palace.s.frame.ending,'qw_palace');
 for(const r of [school,palace]){
  assert.match(r.text,/一百四十余招.*赵承晏败/);assert.match(r.text,/候看录/);
  assert.match(r.text,/四比三/);assert.match(r.text,/一版四年/);assert.match(r.text,/问第十一，败/);
  assert.match(r.text,/没有偷听/);assert.match(r.text,/由周伏生口中听到/);
  assert.ok(r.longest<=20);assert.deepEqual(restoreVN(JSON.stringify(r.s.save()),edition).session.frames,r.s.frames);
  const dead=r.s.frames.findIndex(frame=>frame.text.includes('三日后陈去世'));assert.ok(dead>0);
  assert.ok(r.s.frames.slice(dead).every(frame=>!frame.stage.cast.includes('qw_chen')),'deceased teacher is never left on stage');
 }
 assert.match(school.text,/馆没空着/);assert.match(palace.text,/旧馆的几班课/);
 writeFileSync('docs/evidence/v6/twelfth-school-transcript.txt',school.text);writeFileSync('docs/evidence/v6/twelfth-palace-transcript.txt',palace.text);
});
test('Twelfth middle-career duty changes the later school; physical overreach survives as a lesson rather than a magic recovery',()=>{
 const kept=run(ids=>ids[0]);
 const left=run(ids=>ids.includes('qw_school_choice')?'qw_school_choice':ids[1]);
 assert.match(kept.text,/馆没空着/);assert.match(left.text,/回乡重开一处更小的练场/);
 assert.match(kept.text,/偶尔还紧/);assert.doesNotMatch(left.text,/偶尔还紧/);
 assert.match(kept.text,/今日亲口转述/);assert.doesNotMatch(left.text,/今日亲口转述/);
});
test('Twelfth three age appearances are deterministic, survive replay and reject forged or unknown looks',()=>{
 const r=run(ids=>ids[0]);const looks=new Set<string>(),imagesByLook=new Map<string,Set<string>>();
 for(const frame of r.s.frames)if(frame.stage.cast.includes('qw_zhao')){
  const look=frame.stage.looks?.qw_zhao;assert.ok(look);looks.add(look);
  const file=resolvePortrait('qw_zhao',frame.stage.moods.qw_zhao??'neutral',look)!.file;
  assert.ok(file.startsWith(`v6/qw-zhao-${look.slice(3)}`),'An expression must keep the current age.');
  if(!imagesByLook.has(look))imagesByLook.set(look,new Set());imagesByLook.get(look)!.add(file);
 }
 assert.deepEqual([...looks],['age44','age52','age58']);
 assert.equal(imagesByLook.get('age44')!.size,1);assert.equal(imagesByLook.get('age52')!.size,1);
 assert.ok(imagesByLook.get('age58')!.size>=3,'The later age has real expression variants without borrowing younger images.');
 const raw=r.s.save();raw.presentation.stage.looks={qw_zhao:'age12'};assert.throws(()=>restoreVN(JSON.stringify(raw),edition),/不一致/);
 const source=readFileSync('story/twelfth.ink','utf8');assert.throws(()=>validateDialogue(source.replace('qw_zhao=age44','qw_zhao=age12')),/外观/);
});
test('Twelfth sampled paths cover the authored branches and only actual speaking characters count',()=>{
 const seen=new Set<string>(),cast=new Set<string>();let state=0x445258,longest=0;
 for(let i=0;i<168;i++){const r=run(ids=>{state=(Math.imul(state,1664525)+1013904223)>>>0;return ids[state>>>31]});longest=Math.max(longest,r.longest);r.s.frames.forEach(frame=>{seen.add(frame.id);if(frame.speaker&&frame.speaker!=='you')cast.add(frame.speaker)})}
 const declared=[...readFileSync('story/twelfth.ink','utf8').matchAll(/# beat:(\S+)/g)].map(m=>m[1]);assert.deepEqual([...seen].sort(),declared.sort());assert.equal(cast.size,11);
 writeFileSync('docs/evidence/v6/twelfth-content-audit.json',JSON.stringify({status:'DRAFT_NOT_FINAL',sourceBeats:declared.length,visited:seen.size,speakingCast:[...cast],decisionPoints:18,sampledPaths:168,exhaustive:false,longestPassiveGap:longest,limits:'Pending browser age validation, art completion and three editorial rounds.'},null,2));
});
