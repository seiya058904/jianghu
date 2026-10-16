import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync,writeFileSync} from 'node:fs';
import {Session,restore,ENDINGS} from '../src/runtime.ts';
import {routes} from './routes.ts';
import {people,facts} from '../src/knowledge.ts';

test('complete routes, native Ink save/load at every choice, unique consequences',()=>{
  const metrics:Record<string,unknown>={};
  for(const [name,path] of Object.entries(routes)){
    let s=new Session();
    for(const id of path){
      const before=s.frame;
      s=restore(JSON.stringify(s.save(120))).session;
      assert.deepEqual(s.frame,before);
      s.choose(id);
    }
    assert.equal(s.frame.ending,name);assert.equal(s.frame.choices.length,0);
    assert.ok(s.frame.paragraphs.join('').includes('全篇完'));
    const chinese=s.frames.flatMap(f=>f.paragraphs).join('').match(/[\u3400-\u9fff]/g)?.length??0;
    metrics[name]={choices:s.trail.length,chineseCharacters:chinese,readingMinutesAt350Chars:Math.ceil(chinese/350)};
    assert.ok(chinese>6000,'A full route must contain substantial prose');
    if(name==='quiet')assert.match(s.frame.paragraphs.join(''),/手腕在雨天会酸/);
    if(name==='common')assert.match(s.frame.paragraphs.join(''),/先伸向他/);
  }
  writeFileSync('docs/evidence/reading-metrics.json',JSON.stringify(metrics,null,2));
});

test('schema, size, unsafe state, impossible choices rejected without altering existing session',()=>{
  const s=new Session();const good=s.save();
  assert.throws(()=>restore('{broken'),/JSON/);
  assert.throws(()=>restore(' '.repeat(1000001)),/1 MB/);
  assert.throws(()=>restore(JSON.stringify({...good,saveSchemaVersion:99})),/版本/);
  assert.throws(()=>restore(JSON.stringify({...good,storyContentVersion:'old'})),/版本/);
  assert.throws(()=>restore(JSON.stringify({...good,trail:['end_common']})),/不一致/);
  assert.throws(()=>restore(JSON.stringify({...good,runtime:'<script>alert(1)</script>'})),/不一致/);
  assert.throws(()=>restore(JSON.stringify({...good,ui:{scroll:-1}})),/不完整/);
  assert.throws(()=>s.choose('end_common'),/不属于/);
  assert.equal(s.frame.scene,'rain');assert.deepEqual(s.trail,[]);
});

test('all reachable state combinations terminate; conditions and all declared nodes/choices covered',()=>{
  const source=readFileSync('story/main.ink','utf8');
  const declaredScenes=[...source.matchAll(/^# scene:(\w+)/gm)].map(m=>m[1]);
  const declaredIds=[...source.matchAll(/# cid:(\w+)\]/g)].map(m=>m[1]);
  assert.equal(new Set(declaredScenes).size,declaredScenes.length);
  assert.equal(new Set(declaredIds).size,declaredIds.length);
  const scenes=new Set<string>(),ids=new Set<string>(),ends=new Map<string,number>();
  const visited=new Set<string>(); let edges=0;
  function walk(s:Session){
    const variables=JSON.parse(s.story.state.ToJson()).variablesState;
    const signature=JSON.stringify([s.frame.scene,variables]);
    if(visited.has(signature))return;visited.add(signature);
    assert.ok(s.trail.length<25);scenes.add(s.frame.scene);
    assert.ok(s.frame.paragraphs.length>0);
    for(const tag of s.frame.tags){
      if(tag.startsWith('person:'))assert.ok(people[tag.slice(7)],tag);
      if(tag.startsWith('fact:'))assert.ok(facts[tag.slice(5)],tag);
    }
    const choices=s.frame.choices.map(c=>c.id);
    if(s.frame.scene==='decision'){
      assert.equal(choices.includes('end_public'),variables.proof===true);
      assert.equal(choices.includes('end_common'),['deposit','trust','rescued','confessed','consent'].every(k=>variables[k]===true));
      assert.ok(choices.includes('end_quiet') && choices.includes('end_leave'));
    }
    if(s.frame.ending){ends.set(s.frame.ending,(ends.get(s.frame.ending)??0)+1);return;}
    assert.ok(choices.length>0);
    for(const id of choices){
      ids.add(id);edges++;
      const next=new Session();next.story.state.LoadJson(s.story.state.ToJson());
      next.frame=s.frame;next.trail=[...s.trail];next.history=[...s.history];
      next.choose(id);walk(next);
    }
  }
  walk(new Session());
  assert.deepEqual([...scenes].sort(),declaredScenes.sort());
  assert.deepEqual([...ids].sort(),declaredIds.sort());
  assert.deepEqual([...ends.keys()].sort(),[...ENDINGS].sort());
  const report={states:visited.size,edges,scenes:scenes.size,choiceIds:ids.size,endings:Object.fromEntries(ends)};
  writeFileSync('docs/evidence/graph-coverage.json',JSON.stringify(report,null,2));console.log(report);
});
