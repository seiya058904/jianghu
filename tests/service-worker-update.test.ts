import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import {runInNewContext} from 'node:vm';

for(const scope of ['https://example.test/','https://example.test/jianghu/'])test(`work download refreshes the complete shell and keeps other works at ${scope}`,async()=>{
  const handlers:Record<string,Function>={},jobs:Promise<unknown>[]=[],replies:{ok:boolean}[]=[],added:Request[][]=[];
  const oldOther=new URL('./sea.html',scope).href;
  const oldArt=new URL('./art/v6/taihua-guest.webp',scope).href;
  const stored=new Set([oldOther,new URL('./assets/library-old.js',scope).href,oldArt]);
  runInNewContext(readFileSync('public/sw.js','utf8'),{URL,Request:class extends Request{constructor(input:string,init?:RequestInit){super(new URL(input,scope),init)}},self:{registration:{scope},addEventListener:(type:string,handler:Function)=>handlers[type]=handler},fetch:async(path:string)=>({ok:true,json:async()=>path==='./offline-manifest.json'?['./','./index.html','./assets/library-new.js','./assets/library-new.css']:['./taihua.html','./assets/taihua-new.js','./art/v6/taihua-guest.webp']}),caches:{open:async()=>({match:async(url:URL)=>stored.has(url.href),addAll:async(files:Request[])=>{added.push([...files]);for(const file of files)stored.add(file.url)}})}});
  handlers.message({data:{type:'cache-work',work:'taihua'},ports:[{postMessage:(reply:{ok:boolean})=>replies.push(reply)}],waitUntil:(job:Promise<unknown>)=>jobs.push(job)});
  await Promise.all(jobs);assert.equal(replies[0].ok,true);
  for(const file of ['./','./index.html','./assets/library-new.js','./assets/library-new.css','./taihua.html','./assets/taihua-new.js','./art/v6/taihua-guest.webp'])assert.ok(added.flat().some(request=>request.url===new URL(file,scope).href),file);
  assert.ok(added.flat().every(request=>request.cache==='no-store'),'offline refresh must bypass stale HTTP cache');
  assert.ok(stored.has(oldOther),'other work cache must survive');
});

for(const failure of ['http','unsafe','cache'] as const)test(`shell download ${failure} failure cannot report success`,async()=>{
  const handlers:Record<string,Function>={},jobs:Promise<unknown>[]=[],replies:{ok:boolean}[]=[];
  runInNewContext(readFileSync('public/sw.js','utf8'),{URL,Request:class extends Request{constructor(input:string,init?:RequestInit){super(new URL(input,'https://example.test/jianghu/'),init)}},self:{registration:{scope:'https://example.test/jianghu/'},addEventListener:(type:string,handler:Function)=>handlers[type]=handler},fetch:async(path:string)=>({ok:!(failure==='http'&&path==='./offline-manifest.json'),json:async()=>path==='./offline-manifest.json'?(failure==='unsafe'?['./../outside.js']:['./','./index.html','./assets/library.js']):['./taihua.html']}),caches:{open:async()=>({match:async()=>null,addAll:async()=>{if(failure==='cache')throw new Error('quota')}})}});
  handlers.message({data:{type:'cache-work',work:'taihua'},ports:[{postMessage:(reply:{ok:boolean})=>replies.push(reply)}],waitUntil:(job:Promise<unknown>)=>jobs.push(job)});
  await Promise.all(jobs);assert.equal(replies[0].ok,false);
});
