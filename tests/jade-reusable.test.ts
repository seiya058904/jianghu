import {evidencePath} from './evidence-path.ts';
import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync,writeFileSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {frozenBytes} from './frozen-baselines.ts';
import {VNRuntime,restoreVN} from '../src/vn-runtime.ts';
import {jadeArtWorks as works,jadeAt as at} from './jade-reusable-fixtures.ts';

for(const w of works)test(`${w.slug} reusable art: all sampled old snapshots preserve narrative/world and restore only verified staging`,()=>{
 let random=739;const changed=new Set<string>(),visited=new Set<string>(),options=new Set<string>();
 for(let run=0;run<256;run++){
  const a=new VNRuntime(w.previousContent,w.version),b=new VNRuntime(w.content,w.version);
  while(true){
   assert.equal(a.frame.id,b.frame.id);assert.equal(a.frame.text,b.frame.text);assert.deepEqual(a.frame.choices,b.frame.choices);assert.equal(a.frame.ending,b.frame.ending);visited.add(a.frame.id);a.frame.choices.forEach(c=>options.add(c.id));
   const old=a.save(),fresh=b.save();assert.deepEqual(JSON.parse(old.runtime).variablesState,JSON.parse(fresh.runtime).variablesState);
   if(old.runtime!==fresh.runtime||JSON.stringify(old.presentation)!==JSON.stringify(fresh.presentation)){
    changed.add(a.frame.id);
    // Replay each observed frame/branch at least once per representative route;
    // the remaining samples verify the declared coverage and identical words.
    if(run<2){const restored=restoreVN(JSON.stringify(old),w);assert.equal(restored.migration,'illustration-staging');assert.deepEqual(restored.save.presentation,fresh.presentation);assert.deepEqual(restored.save.commands,old.commands);assert.equal(restored.save.savedAt,old.savedAt);assert.ok(!restoreVN(JSON.stringify(restored.save),w).migrated)}
   }
   if(a.frame.ending)break;
   if(a.frame.choices.length){random=(Math.imul(random,1664525)+1013904223)>>>0;const id=a.frame.choices[run<2?(run?a.frame.choices.length-1:0):(random>>>16)%a.frame.choices.length].id;a.choose(id);b.choose(id)}else{a.advance();b.advance()}
  }assert.deepEqual(a.commands,b.commands);
 }
 const expected=JSON.parse(readFileSync('docs/evidence/v6/jade-reusable-snapshot-scope.json','utf8')).find((r:{work:string})=>r.work===w.slug).changed;assert.deepEqual([...changed].sort(),expected);
 const declared=[...readFileSync(`story/${w.source}.ink`,'utf8').matchAll(/# beat:(\S+)/g)].map(m=>m[1]);assert.deepEqual([...visited].sort(),declared.sort());
 writeFileSync(evidencePath(`docs/evidence/v6/jade-reusable-${w.slug}-audit.json`),JSON.stringify({beats:visited.size,options:options.size,sampledPaths:256,exhaustive:false,changed:[...changed].sort(),representativeOldSnapshotMigrationVerified:true},null,2)+'\n');
});

test('Jade reusable CGs exit before replies; both first-book viewpoints and next-frame cameras remain distinct',()=>{
 for(const w of works){const s=at(w,w.cg);assert.equal(s.frame.stage.cg,w.cgId);s.advance();assert.equal(s.frame.stage.cg,w.cgId);s.advance();assert.equal(s.frame.stage.cg,undefined);const c=at(w,w.camera);assert.equal(c.frame.stage.camera,'portrait');assert.equal(c.frame.stage.cast.length,1);c.advance();assert.equal(c.frame.stage.camera,undefined)}
 const w=works[0],s=at(w,'jt_empty_box_1',false,1);assert.equal(s.frame.stage.cg,'emptyBox');s.advance();assert.equal(s.frame.id,'jt_empty_box_5');assert.equal(s.frame.stage.cg,'emptyBox');s.advance();assert.equal(s.frame.stage.cg,undefined);
 const c=at(w,'jt_revealed_13',false,1);assert.deepEqual(c.frame.stage.cast,['jt_shen']);assert.equal(c.frame.stage.camera,'portrait');c.advance();assert.equal(c.frame.stage.camera,undefined);
});

test('Jade staging migration rejects forged stage/world/commands/version and requires the exact frozen source',()=>{
 const record=JSON.parse(readFileSync('docs/evidence/v6/jade-reusable-art-assets.json','utf8'));for(const [path,hash]of Object.entries(record.frozen)){const b=frozenBytes(path);if(!b)continue;assert.equal(createHash('sha256').update(b).digest('hex'),hash)}
 for(const w of works){const raw=at(w,w.cg,true).save(),state=JSON.parse(raw.runtime),key=Object.keys(state.variablesState).find(k=>typeof state.variablesState[k]==='boolean')!;assert.ok(key);state.variablesState[key]=!state.variablesState[key];
  for(const bad of [{...raw,presentation:{...raw.presentation,stage:{...raw.presentation.stage,cg:w.cgId}}},{...raw,runtime:JSON.stringify(state)},{...raw,commands:raw.commands.slice(0,-1)}])assert.throws(()=>restoreVN(JSON.stringify(bad),w),/状态/);
  assert.throws(()=>restoreVN(JSON.stringify({...raw,storyContentVersion:'other'}),w),/版本/);assert.throws(()=>restoreVN(JSON.stringify(raw),{content:w.content,version:w.version}),/状态/);
 }
});
