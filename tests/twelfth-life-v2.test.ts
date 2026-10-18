import {evidencePath} from './evidence-path.ts';
import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync,writeFileSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {VNRuntime,restoreVN} from '../src/vn-runtime.ts';
import {resolvePortrait} from '../src/catalog.ts';
import content from '../src/generated/twelfth-life-v2.json' with {type:'json'};
import old from '../src/generated/twelfth-life-v1.json' with {type:'json'};
test('Royal life frozen v1 bytes remain available',()=>{
 for(const [file,hash] of [['story/twelfth-life-v1.ink','363bc235c070c05163f3f75dcbd7d1b4d43171b503eca44390c7324221f745d8'],['src/generated/twelfth-life-v1.json','718d15fbcd9e54cb6d69ce67faaf1f926eb7183f39ae0f5593c2878c546d31ff']])assert.equal(createHash('sha256').update(readFileSync(file)).digest('hex'),hash);
});
test('Royal life both personal outcomes keep words and commands while sorting letters moves home and aging is monotonic',()=>{
 for(const side of [0,1]){const s=new VNRuntime(content,'twelfth-life-2.0.0'),v1=new VNRuntime(old,'twelfth-life-1.0.0');let phase=0;while(!s.frame.ending){assert.equal(s.frame.id,v1.frame.id);assert.equal(s.frame.text,v1.frame.text);assert.deepEqual(s.frame.choices,v1.frame.choices);
  const f=s.frame;if(f.stage.cast.includes('rl2_lu')){const age=f.stage.looks?.rl2_lu;const next=age==='late'?2:age==='mid'?1:0;assert.ok(next>=phase);phase=next;assert.ok(!f.stage.cast.includes('rl_lu'))}
  if(f.id==='rl_fair_seat_3'){assert.equal(f.stage.scene,'rl2_study');assert.deepEqual(f.stage.cast,['rl2_lu','rl_gu'])}
  if(f.choices.length||['rl_married_swords_2','rl_fair_seat_4','rl_first_year_3','rl_wife_board_1'].includes(f.id))assert.deepEqual(restoreVN(JSON.stringify(s.save()),{content,version:'twelfth-life-2.0.0'}).session.frames,s.frames);
  if(f.choices.length){s.choose(f.choices[side].id);v1.choose(v1.frame.choices[side].id)}else{s.advance();v1.advance()}
 }assert.deepEqual(s.commands,v1.commands);assert.equal(s.frame.ending,v1.frame.ending);assert.throws(()=>restoreVN(JSON.stringify(v1.save()),{content,version:'twelfth-life-2.0.0'}),/作品或版本不兼容/)}
 assert.notEqual(resolvePortrait('rl2_lu','amused','mid')!.file,resolvePortrait('rl2_lu','intent','mid')!.file);
});
test('512 sampled Royal life alternatives reach every beat and all five actual Lu sprite files',()=>{
 const beats=new Set<string>(),options=new Set<string>(),files=new Set<string>();for(let seed=1;seed<=512;seed++){let r=Math.imul(seed,2654435761)>>>0;const s=new VNRuntime(content,'twelfth-life-2.0.0');while(true){const f=s.frame;beats.add(f.id);f.choices.forEach(c=>options.add(c.id));if(f.stage.cast.includes('rl2_lu'))files.add(resolvePortrait('rl2_lu',f.stage.moods.rl2_lu,f.stage.looks?.rl2_lu)!.file);if(f.ending)break;if(f.choices.length){r=(Math.imul(r,1664525)+1013904223)>>>0;s.choose(f.choices[r>>>31].id)}else s.advance()}}
 assert.deepEqual([...beats].sort(),[...readFileSync('story/twelfth-life-v2.ink','utf8').matchAll(/# beat:(\S+)/g)].map(m=>m[1]).sort());assert.equal(files.size,5);assert.equal(options.size,66);
 writeFileSync(evidencePath('docs/evidence/v6/twelfth-life-v2-content-audit.json'),JSON.stringify({status:'CHARACTER_ART_INCREMENT_NOT_FINAL',beats:beats.size,options:options.size,sampledPaths:512,exhaustive:false,LuActualImages:[...files],limits:'Three ages plus middle-age neutral/amused/firm. Same person as archive Lu, not extra NPC. Character identity audit only; royalLetters CG is checked separately. Other principal identities and full literary review remain incomplete.'},null,2));
});
