import test from 'node:test';
import assert from 'node:assert/strict';
import {Session} from '../src/runtime.ts';

test('legacy storage preserves old auto when backup fails and rejects stale tab writes',async()=>{
  const values=new Map<string,string>();let failing=false;
  Object.defineProperty(globalThis,'localStorage',{configurable:true,value:{getItem:(key:string)=>values.get(key)??null,setItem:(key:string,raw:string)=>{if(failing)throw new Error('quota');values.set(key,raw)}}});
  try{
    const store=await import('../src/storage.ts?reliability');
    const session=new Session();store.read('auto');store.persist(session);
    const raw=values.get(store.PREFIX+'auto');assert.ok(raw);
    failing=true;assert.throws(()=>store.preserveAuto(),/quota/);assert.equal(values.get(store.PREFIX+'auto'),raw);
    failing=false;values.set(store.PREFIX+'auto','other-tab');
    assert.throws(()=>store.persist(session),/另一标签页/);assert.equal(values.get(store.PREFIX+'auto'),'other-tab');
    store.preserveAuto();assert.equal(values.get(store.PREFIX+'previous'),'other-tab');store.persist(session);
    assert.notEqual(values.get(store.PREFIX+'auto'),'other-tab');
  }finally{Reflect.deleteProperty(globalThis,'localStorage')}
});

test('legacy reads degrade safely when storage access is denied',async()=>{
  Object.defineProperty(globalThis,'localStorage',{configurable:true,get(){throw new Error('denied')}});
  try{const store=await import('../src/storage.ts?denied');assert.equal(store.read('auto'),null);assert.doesNotThrow(()=>store.preserveAuto());assert.throws(()=>store.persist(new Session()),/denied/)}finally{Reflect.deleteProperty(globalThis,'localStorage')}
});
