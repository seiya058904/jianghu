import {evidencePath} from './evidence-path.ts';
import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync,writeFileSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {frozenBytes} from './frozen-baselines.ts';
import {VNRuntime,restoreVN} from '../src/vn-runtime.ts';
import {characters,resolvePortrait} from '../src/catalog.ts';
import {readingLock} from '../src/chronicle-access.ts';
import north from '../src/generated/north-v2.json' with {type:'json'};
import northOld from '../src/generated/north-v1.json' with {type:'json'};
import qian from '../src/generated/qian-kun-v2.json' with {type:'json'};
import qianOld from '../src/generated/qian-kun-v1.json' with {type:'json'};
import notes from '../src/generated/north-notes.json' with {type:'json'};
const works=[{slug:'north',content:north,old:northOld,cg:'nq_last_tea_1',cameras:['nq_too_heavy_2','nq_third_teacher_6','nq_last_tea_3']},{slug:'qian-kun',content:qian,old:qianOld,cg:'qk_late_way_1',cameras:['qk_slow_questions_3']}];
const alias:Record<string,string>={nq2_mender:'nq_mender',nq2_heng:'nq_heng',qk2_heng_earlier:'qk_heng',qk2_heng_later:'qk_heng'};
for(const w of works)test(`${w.slug} Heng V2: identical narrative/inputs/world, exact frozen V1 restores and wrong-version rejection`,()=>{
 const output=[];for(const side of [0,1]){const a=new VNRuntime(w.old,w.slug+'-1.0.0'),b=new VNRuntime(w.content,w.slug+'-2.0.0');
  while(true){assert.equal(a.frame.id,b.frame.id);assert.equal(a.frame.text,b.frame.text);assert.deepEqual(a.frame.choices,b.frame.choices);assert.equal(a.frame.phase,b.frame.phase);assert.equal(a.frame.ending,b.frame.ending);assert.equal(a.frame.speaker,alias[b.frame.speaker]??b.frame.speaker);assert.deepEqual(a.frame.stage.cast,b.frame.stage.cast.map(id=>alias[id]??id));assert.deepEqual(JSON.parse(a.save().runtime).variablesState,JSON.parse(b.save().runtime).variablesState);
   assert.deepEqual(restoreVN(JSON.stringify(a.save()),{content:w.old,version:w.slug+'-1.0.0'}).save.presentation,a.save().presentation);
   if(a.frame.ending)break;if(a.frame.choices.length){const id=a.frame.choices[side].id;a.choose(id);b.choose(id)}else{a.advance();b.advance()}
  }assert.deepEqual(a.commands,b.commands);assert.throws(()=>restoreVN(JSON.stringify(a.save()),{content:w.content,version:w.slug+'-2.0.0'}),/版本/);assert.deepEqual(restoreVN(JSON.stringify(b.save()),{content:w.content,version:w.slug+'-2.0.0'}).session.frames,b.frames);output.push({side,frames:b.frames.length,ending:b.frame.ending});
 }writeFileSync(evidencePath(`docs/evidence/v6/heng-${w.slug}-version-proof.json`),JSON.stringify(output,null,2)+'\n');
 const frozen=JSON.parse(readFileSync('docs/evidence/v6/heng-art-assets.json','utf8')).frozen;for(const [file,hash]of Object.entries(frozen)){const b=frozenBytes(file);if(!b)continue;assert.equal(createHash('sha256').update(b).digest('hex'),hash)}
});

test('Heng is one explicit identity with two ages and three actual files per age, also in the older Notes interview',()=>{
 for(const id of [...Object.keys(alias),'nn_heng'])assert.equal(characters[id].canonicalIdentity,'sima-heng');assert.doesNotMatch(characters.nq2_mender.name+characters.nq2_mender.role+characters.nq2_mender.detail,/司马|返真|老师/);
 const files=new Set<string>(),seen=new Map<string,Set<string>>();
 for(const age of ['earlier','later']){const id=age==='earlier'?'qk2_heng_earlier':'qk2_heng_later',states=new Set(['neutral','intent','amused'].map(m=>resolvePortrait(id,m)!.file));assert.equal(states.size,3);states.forEach(f=>files.add(f))}assert.equal(files.size,6);
 const first=new VNRuntime(qian,'qian-kun-2.0.0');let later=false;while(true){if(first.frame.id==='qk_tomorrow_1')later=true;assert.ok(!first.frame.stage.cast.includes(later?'qk2_heng_earlier':'qk2_heng_later'));if(first.frame.ending)break;first.frame.choices.length?first.choose(first.frame.choices[0].id):first.advance()}
 for(const [slug,data,version]of [['north',north,'north-2.0.0'],['qian-kun',qian,'qian-kun-2.0.0'],['north-notes',notes,'north-notes-1.0.0']] as const){let random=171;const visited=new Set<string>();for(let run=0;run<256;run++){const s=new VNRuntime(data,version);while(true){visited.add(s.frame.id);for(const id of s.frame.stage.cast)if(characters[id].canonicalIdentity==='sima-heng'){if(!seen.has(id))seen.set(id,new Set());seen.get(id)!.add(resolvePortrait(id,s.frame.stage.moods[id]??'neutral',s.frame.stage.looks?.[id])!.file)}if(s.frame.ending)break;if(s.frame.choices.length){random=(Math.imul(random,1664525)+1013904223)>>>0;s.choose(s.frame.choices[(random>>>16)%s.frame.choices.length].id)}else s.advance()}}const declared=[...readFileSync(`story/${['north','qian-kun'].includes(slug)?slug+'-v2':slug}.ink`,'utf8').matchAll(/# beat:(\S+)/g)].map(m=>m[1]);assert.deepEqual([...visited].sort(),declared.sort())}
 assert.equal(seen.get('qk2_heng_earlier')!.size,3);assert.equal(seen.get('qk2_heng_later')!.size,3);assert.deepEqual(seen.get('nn_heng'),seen.get('nq2_heng'));assert.equal(resolvePortrait('nq_heng')!.file,'v5/npc-elder-male.webp');assert.equal(resolvePortrait('qk_heng')!.file,'v5/npc-elder-male.webp');
 writeFileSync(evidencePath('docs/evidence/v6/heng-identity-usage.json'),JSON.stringify({canonicalIdentity:'sima-heng',actorAliases:Object.fromEntries([...seen].map(([id,f])=>[id,[...f]])),sampledPathsPerWork:256,exhaustive:false},null,2)+'\n');
});

test('Both plain tea CGs last two frames and every focused camera clears on the next frame',()=>{
 for(const w of works){for(const target of [w.cg,...w.cameras]){const s=new VNRuntime(w.content,w.slug+'-2.0.0');while(s.frame.id!==target){assert.ok(!s.frame.ending,target);s.frame.choices.length?s.choose(s.frame.choices[0].id):s.advance()}if(target===w.cg){assert.equal(s.frame.stage.cg,'plainTea');s.advance();assert.equal(s.frame.stage.cg,'plainTea');s.advance();assert.equal(s.frame.stage.cg,undefined)}else{assert.equal(s.frame.stage.camera,'portrait');assert.equal(s.frame.stage.cast.length,1);s.frame.choices.length?s.choose(s.frame.choices[0].id):s.advance();assert.equal(s.frame.stage.camera,undefined)}}}
});

test('Notes accepts either exact released edition of each book, mixed V1/V2, and rejects wrong families/versions',()=>{
 const m=new Map<string,string>(),read=(key:string)=>m.get(key)??null;const north='jianghu:chronicle:north:',qian='jianghu:chronicle:qian-kun:';
 m.set(north+'v2:endings','["nq_first_again"]');assert.match(readingLock('north-notes',read),/不会算账/);m.set(qian+'v2:endings','["qk_open_lesson"]');assert.equal(readingLock('north-notes',read),'');m.delete(north+'v2:endings');m.set(north+'v1:endings','["nq_three_names"]');assert.equal(readingLock('north-notes',read),'');m.set(north+'v1:endings','["qk_open_lesson"]');assert.match(readingLock('north-notes',read),/三师一枪/);m.set(north+'v9:endings','["nq_first_again"]');assert.match(readingLock('north-notes',read),/三师一枪/);m.set(north+'v1:endings','broken');assert.match(readingLock('north-notes',read),/三师一枪/);
});
