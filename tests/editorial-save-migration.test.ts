import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {VNRuntime,restoreVN} from '../src/vn-runtime.ts';
import {editorialBaselineManifest,loadEditorialBaseline} from '../src/editorial-baselines.ts';

const source = (slug:string) => JSON.parse(readFileSync(`src/generated/${slug}.json`,'utf8'));
const routes:Record<string,string[][]>={longmen:[['lm_route_guest','lm_deliver_exact']], 'dead-ranking':[['dr_hold_bad_foot','dr_watch_actual_person','dr_keep_last_hand'],['dr_career_visit','dr_road_let_next_ask']], 'seven-questions':[['sq_follow_valley']], 'white-stone':[['ws_record_reason','ws_ask_today'],['ws_record_next','ws_rest_water']]};
for(const row of editorialBaselineManifest)test(`trusted pre-audit ${row.slug}: real old saves replay across complete routes`,async()=>{
 const bytes=readFileSync(`src/generated/independent-pre-audit/${row.slug}.json`);
 assert.equal(bytes.length,row.bytes);assert.equal(createHash('sha256').update(bytes).digest('hex'),row.sha256);
 const editorialContent=await loadEditorialBaseline(row.version);assert.ok(editorialContent);
 const edition={content:source(row.slug),version:row.version,editorialContent};
 for(const overrides of routes[row.slug]??[[]]){
  const old=new VNRuntime(editorialContent,row.version);let checked=0,migrated=0;const consumed=new Set<string>();
  for(let guard=0;guard<3000;guard++){
   const raw=JSON.stringify(old.save());
   const result=restoreVN(raw,edition);checked++;if(result.migrated){migrated++;assert.equal(result.migration,'editorial-text');}
   assert.equal(result.session.frame.id,old.frame.id);assert.equal(result.save.savedAt,JSON.parse(raw).savedAt);
   assert.deepEqual(result.save.commands,old.commands);assert.equal(result.save.runtime,result.session.save().runtime);
   assert.equal(restoreVN(JSON.stringify(result.save),edition).migrated,undefined,'new save must use strict path');
   if(old.frame.phase==='ending')break;
   if(old.frame.phase==='awaitingAdvance')old.advance();else{const choice=old.frame.choices.find(c=>overrides.includes(c.id))??old.frame.choices[0];consumed.add(choice.id);old.choose(choice.id);}
  }
  assert.equal(old.frame.phase,'ending');assert.ok(checked>50);for(const id of overrides)assert.ok(consumed.has(id),`not selected: ${id}`);
  if(row.slug==='longmen'||row.slug==='dead-ranking')assert.ok(migrated>0,'must exercise real changed old snapshot');
 }
});

async function fixture(){const version='longmen-3.0.0',editorialContent=await loadEditorialBaseline(version);assert.ok(editorialContent);const old=new VNRuntime(editorialContent,version);for(let n=0;n<1000;n++){if(old.frame.id==='lm_sore_14')return{save:old.save(),edition:{version,editorialContent,content:source('longmen')}};if(old.frame.phase==='awaitingAdvance')old.advance();else old.choose(old.frame.choices.find(c=>['lm_route_guest','lm_deliver_exact'].includes(c.id))?.id??old.frame.choices[0].id);}throw Error('missing target');}
for(const mutation of ['runtime','stage','commands','version'] as const)test(`old raw tampering rejects ${mutation}`,async()=>{
 const {save,edition}=await fixture();const bad=structuredClone(save);
 if(mutation==='runtime'){const state=JSON.parse(bad.runtime);state.variablesState.injected=1;bad.runtime=JSON.stringify(state);}
 if(mutation==='stage')bad.presentation.stage.scene='courtyard';
 if(mutation==='commands')bad.commands[0]='choice:not_offered';
 if(mutation==='version')bad.storyContentVersion='longmen-2.0.0';
 assert.throws(()=>restoreVN(JSON.stringify(bad),edition));
});
test('real old changed snapshot requires explicitly supplied trusted baseline',async()=>{const {save,edition}=await fixture();assert.throws(()=>restoreVN(JSON.stringify(save),{version:edition.version,content:edition.content}));assert.equal(await loadEditorialBaseline('longmen-2.0.0'),undefined);});
for(const mutation of ['speaker','choice-text','variable'] as const)test(`migration refuses authentic old saves if current ${mutation} changed`,async()=>{
 const {save,edition}=await fixture();const content=structuredClone(edition.content);let replaced=false;
 function replace(value:unknown):unknown{
  if(typeof value==='string'){
   if(mutation==='speaker'&&value.trim()==='^speaker:lm_shi'){replaced=true;return '^speaker:you';}
   if(mutation==='choice-text'&&value.includes('去接武陵问剑的来客')){replaced=true;return value+' changed';}
  }
  if(Array.isArray(value)){
   if(mutation==='variable'&&value.some(v=>v&&typeof v==='object'&&v['VAR=']==='lm_early_route')){const changed=[...value];const i=changed.findIndex(v=>v&&typeof v==='object'&&v['VAR=']==='lm_early_route');changed[i-1]=99;replaced=true;return changed;}
   return value.map(replace);
  }
  if(value&&typeof value==='object')return Object.fromEntries(Object.entries(value).map(([k,v])=>[k,replace(v)]));return value;
 }
 const changed=replace(content) as Record<string,unknown>;
 assert.ok(replaced,`mutation must really modify ${mutation}`);assert.notDeepEqual(changed,content);
 assert.throws(()=>restoreVN(JSON.stringify(save),{...edition,content:changed}));
});
test('different work and frozen edition reject authentic old raw',async()=>{const {save,edition}=await fixture();assert.throws(()=>restoreVN(JSON.stringify(save),{version:'dead-ranking-1.0.0',content:source('dead-ranking'),editorialContent:edition.editorialContent}));assert.throws(()=>restoreVN(JSON.stringify(save),{...edition,version:'longmen-2.0.0'}));});
