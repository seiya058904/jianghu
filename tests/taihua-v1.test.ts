import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {VNRuntime,restoreVN} from '../src/vn-runtime.ts';
import content from '../src/generated/taihua-v1.json' with {type:'json'};
import next from '../src/generated/taihua.json' with {type:'json'};
import {chronicleWorks} from '../src/chronicle-catalog.ts';
test('Taihua frozen v1 bytes, both old routes and save identity survive the expanded edition',()=>{
 for(const [file,hash]of [['story/taihua-v1.ink','f61de7f912d58bb7a82e83b85164e8cfe371b8bf7a2babcdd578f226fa45e9fd'],['src/generated/taihua-v1.json','59e7f5e688ba05c396434b3426eb18ba8894fe2d7578dc8e15eaaa8a5ec24e98']])assert.equal(createHash('sha256').update(readFileSync(file)).digest('hex'),hash);
 assert.equal(chronicleWorks.find(w=>w.slug==='taihua-v1')!.prefix,'jianghu:chronicle:taihua:v1:');assert.equal(chronicleWorks.find(w=>w.slug==='taihua')!.prefix,'jianghu:chronicle:taihua:v3:');
 assert.equal(chronicleWorks.find(w=>w.slug==='taihua-v2')!.prefix,'jianghu:chronicle:taihua:v2:');
 for(const side of [0,1]){const s=new VNRuntime(content,'taihua-1.0.0');let decisions=0;while(!s.frame.ending){if(s.frame.choices.length){assert.deepEqual(restoreVN(JSON.stringify(s.save()),{content,version:'taihua-1.0.0'}).session.frames,s.frames);s.choose(s.frame.choices[side].id);decisions++}else s.advance();assert.ok(s.commands.length<400)}assert.equal(decisions,18);assert.equal(s.frame.ending,side?'th_letter':'th_company');assert.throws(()=>restoreVN(JSON.stringify(s.save()),{content:next,version:'taihua-3.0.0'}),/作品或版本不兼容/)}
});
