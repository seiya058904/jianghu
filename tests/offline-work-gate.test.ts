import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync,writeFileSync} from 'node:fs';
import {runInNewContext} from 'node:vm';
import {chronicleWorks} from '../src/chronicle-catalog.ts';
test('Every registered work can complete the actual service-worker download message at root and subpath; unknown work is ignored',async()=>{
 const works=[...chronicleWorks.map(w=>({slug:w.slug,file:w.file})),{slug:'tide-v6',file:'index.html'}],rows=[];
 for(const scope of ['http://localhost/','http://localhost/Jianghu/'])for(const work of works){const handlers:Record<string,Function>={},jobs:Promise<unknown>[]=[],requests:string[]=[],added:string[]=[],replies:any[]=[];runInNewContext(readFileSync('public/sw.js','utf8'),{self:{registration:{scope},addEventListener:(type:string,fn:Function)=>handlers[type]=fn},URL,fetch:async(url:string)=>{requests.push(url);return{ok:true,json:async()=>['./'+work.file]}},caches:{open:async()=>({match:async()=>null,addAll:async(files:string[])=>added.push(...files)})}});handlers.message({data:{type:'cache-work',work:work.slug},ports:[{postMessage:(r:unknown)=>replies.push(r)}],waitUntil:(p:Promise<unknown>)=>jobs.push(p)});assert.equal(jobs.length,1,`${scope}${work.slug}: registered work rejected`);await Promise.all(jobs);assert.equal(replies[0]?.ok,true,work.slug);assert.deepEqual(requests,[`./offline-${work.slug}.json`]);assert.deepEqual(added,['./'+work.file]);const previous=jobs.length;handlers.message({data:{type:'cache-work',work:'unknown-work'},ports:[{postMessage:(r:unknown)=>replies.push(r)}],waitUntil:(p:Promise<unknown>)=>jobs.push(p)});assert.equal(jobs.length,previous);rows.push({scope,work:work.slug,replyOK:replies[0].ok})}
 writeFileSync('docs/evidence/v6/offline-work-gate-audit.json',JSON.stringify({scope:'Actual message listener with in-memory fetch/cache adapters; real offline browser tests remain separate',registeredWorks:works.length,rows},null,2)+'\n');
});
