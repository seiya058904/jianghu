import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync,writeFileSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {VNRuntime,restoreVN} from '../src/vn-runtime.ts';
import {campaignRoutes,pickChoice} from './campaign-routes.ts';
import content from '../src/generated/campaign-v6.json' with {type:'json'};
import previousContent from '../src/generated/campaign-v6-before-ending-staging.json' with {type:'json'};
const version='tide-promise-2.0.0',edition={content,previousContent,version};
function ending(data:Record<string,unknown>,preferred:string[]=[]){const s=new VNRuntime(data,version);while(!s.frame.ending)s.frame.choices.length?s.choose(pickChoice(s.frame.choices,preferred).id):s.advance();return s}
test('Ending direction retains exact pre-change V6 and frozen V5 bytes',()=>{
 for(const [file,hash] of [['story/campaign-v6-before-ending-staging.ink','76977c62fafa1f307bbcfe6c619c2428883bcf483441bdb5c20c4efc6b2d9ff7'],['src/generated/campaign-v6-before-ending-staging.json','f9fbb2de979b17ef702ed09606578772d0605fc8e4ad4675da5b792a20d957a8'],['src/generated/campaign-v5-1.0.0.json','b0c071f9cf69c22817edf712d92cd9002c9373e92905e721cb7a1a29755c63ec']])assert.equal(createHash('sha256').update(readFileSync(file)).digest('hex'),hash);
});
test('Every affected ending beat in nine complete routes migrates only presentation while keeping every word, option and command',()=>{
 const rows=[];let migrated=0;
 for(const [route,preferred] of Object.entries({...campaignRoutes,stay:['route_stay']})){
  const old=new VNRuntime(previousContent,version),current=new VNRuntime(content,version);let affected=0;
  while(true){assert.equal(current.frame.id,old.frame.id);assert.equal(current.frame.text,old.frame.text);assert.deepEqual(current.frame.choices,old.frame.choices);assert.equal(current.frame.ending,old.frame.ending);
   if(/^c_ending_/.test(old.frame.id)){const raw=JSON.stringify(old.save()),result=restoreVN(raw,edition);assert.ok(result.migrated);assert.equal(result.migration,'ending-staging');assert.deepEqual(result.session.save().presentation,current.save().presentation);assert.equal(result.save.savedAt,JSON.parse(raw).savedAt);assert.deepEqual(JSON.parse(result.save.runtime).variablesState,JSON.parse(old.save().runtime).variablesState);assert.deepEqual(result.save.commands,old.commands);assert.ok(!restoreVN(JSON.stringify(result.save),edition).migrated);migrated++;affected++}
   if(current.frame.ending)break;if(current.frame.choices.length){const id=pickChoice(current.frame.choices,preferred).id;current.choose(id);old.choose(id)}else{current.advance();old.advance()}
  }
  assert.deepEqual(current.commands,old.commands);rows.push({route,ending:current.frame.ending,affectedBeatsChecked:affected,finalStage:current.frame.stage});
 }
 writeFileSync('docs/evidence/v6/main-ending-staging-content-audit.json',JSON.stringify({status:'DIRECTION_AND_MIGRATION_NOT_FULL_ACCEPTANCE',contentSHA256:createHash('sha256').update(readFileSync('src/generated/campaign-v6.json')).digest('hex'),previousSHA256:createHash('sha256').update(readFileSync('src/generated/campaign-v6-before-ending-staging.json')).digest('hex'),newGeneratedRasterFiles:0,actualNodeCompleteRoutes:rows.length,migratedEndingSnapshots:migrated,wordsOptionsCommandsUnchanged:true,routes:rows},null,2));
});
test('Frozen validation rejects forged stage/runtime/commands, wrong versions and non-cosmetic changes',()=>{
 const old=ending(previousContent),save=old.save();const attempts=[{...save,presentation:{...save.presentation,stage:{...save.presentation.stage,cast:[]}}},{...save,runtime:JSON.stringify({...JSON.parse(save.runtime),variablesState:{...JSON.parse(save.runtime).variablesState,wound:99}})},{...save,commands:save.commands.slice(0,-1)},{...save,storyContentVersion:'tide-promise-1.0.0'}];
 for(const forged of attempts)assert.throws(()=>restoreVN(JSON.stringify(forged),edition),/存档|进度|状态|版本/);
 assert.throws(()=>restoreVN(JSON.stringify(save),{content,version}),/状态/);
 const serialized=JSON.stringify(content),changed=serialized.replace('潮又涨起来。','不相同的剧情。');assert.notEqual(changed,serialized);assert.throws(()=>restoreVN(JSON.stringify(save),{content:JSON.parse(changed),previousContent,version}),/状态/);
 const pending=new VNRuntime(previousContent,version);while(!pending.frame.choices.length)pending.advance();assert.ok(!restoreVN(JSON.stringify(pending.save()),edition).migrated);
});
test('Ending views reflect the actual people and work without generating outcome-specific illustrations',()=>{
 for(const [id,preferred] of Object.entries(campaignRoutes)){const s=ending(content,preferred),f=s.frame;assert.equal(f.stage.scene,'v6_end_'+id);
  if(id==='harbor')assert.equal(f.stage.cg,'dawn');else if(id==='scar')assert.equal(f.stage.cg,'quiet');else assert.equal(f.stage.cg,undefined);
  if(id==='together5'){assert.deepEqual(f.stage.cast,['v6_qiao','v6_pei']);const farewell=s.frames.find(f=>f.id==='c_ending_together5_6')!;assert.equal(farewell.stage.scene,'v6_end_departure');assert.ok(farewell.stage.cast.includes('v6_zhaoli'))}
  if(id==='apart')assert.deepEqual(f.stage.cast,[]);
  if(id==='lost')assert.ok(f.stage.cast.includes('v6_liu'));
 }
});
