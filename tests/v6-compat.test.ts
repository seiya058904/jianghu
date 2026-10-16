import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {VNRuntime,restoreVN} from '../src/vn-runtime.ts';
import frozen from '../src/generated/campaign-v5-1.0.0.json' with {type:'json'};
import {campaignRoutes,pickChoice} from './campaign-routes.ts';
const edition={content:frozen,version:'tide-promise-1.0.0'};
test('frozen v5 content matches the pre-v6 baseline bytes',()=>{
 const expected='b0c071f9cf69c22817edf712d92cd9002c9373e92905e721cb7a1a29755c63ec';
 assert.equal(createHash('sha256').update(readFileSync('src/generated/campaign-v5-1.0.0.json')).digest('hex'),expected);
});
test('all eight frozen v5 endings and pending choices restore with identical world and stage',()=>{
 for(const [ending,preferred] of Object.entries(campaignRoutes)){
  const s=new VNRuntime(frozen,edition.version);
  while(!s.frame.ending){
   if(s.frame.choices.length){assert.deepEqual(restoreVN(JSON.stringify(s.save()),edition).session.frames,s.frames);s.choose(pickChoice(s.frame.choices,preferred).id)}else s.advance();
   assert.ok(s.commands.length<1500);
  }
  assert.equal(s.frame.ending,ending);assert.deepEqual(restoreVN(JSON.stringify(s.save()),edition).session.frames,s.frames);
  assert.throws(()=>restoreVN(JSON.stringify({...s.save(),storyContentVersion:'tide-v6'}),edition),/作品或版本不兼容/);
 }
});
