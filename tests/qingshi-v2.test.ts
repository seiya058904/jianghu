import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync,writeFileSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {VNRuntime,restoreVN} from '../src/vn-runtime.ts';
import {resolvePortrait} from '../src/catalog.ts';
import {chronicleWorks} from '../src/chronicle-catalog.ts';
import content from '../src/generated/qingshi-v2.json' with {type:'json'};
import old from '../src/generated/qingshi-v1.json' with {type:'json'};
test('Qingshi v1 archive bytes and independently addressable saves remain frozen',()=>{
 for(const [file,hash] of [['story/qingshi-v1.ink','8c300886e48b822539c82cb036c4dd56c4533cd8b2c22dc3feb05376a606d2db'],['src/generated/qingshi-v1.json','ed390e1dccdcea7d32f32f0287904174ed6af21239a21e7aaf1f40d37ddd72f6']])assert.equal(createHash('sha256').update(readFileSync(file)).digest('hex'),hash);
 assert.equal(chronicleWorks.find(w=>w.slug==='qingshi-v1')!.prefix,'jianghu:chronicle:qingshi:v1:');
 assert.equal(chronicleWorks.find(w=>w.slug==='qingshi-v2')!.prefix,'jianghu:chronicle:qingshi:v2:');
});
test('Qingshi v2 512 sampled lives visit every authored beat and keep the knife insert before its break',()=>{
 const visited=new Set<string>(),options=new Set<string>(),endings=new Set<string>();
 for(let seed=1;seed<=512;seed++){let random=Math.imul(seed,2654435761)>>>0;const s=new VNRuntime(content,'qingshi-2.0.0');while(!s.frame.ending){visited.add(s.frame.id);s.frame.choices.forEach(c=>options.add(c.id));if(s.frame.choices.length){random=(Math.imul(random,1664525)+1013904223)>>>0;s.choose(s.frame.choices[random>>>31].id)}else s.advance()}visited.add(s.frame.id);endings.add(s.frame.ending!);
  assert.ok(s.frames.filter(f=>f.stage.cg==='oldKnife').every(f=>/^qs_oldknife_[1-5]$/.test(f.id)));
  assert.ok(s.frames.filter(f=>f.stage.looks?.qs_xu==='age92close').every(f=>f.id==='qs_oldknife_6'));
 }
 assert.deepEqual([...visited].sort(),[...readFileSync('story/qingshi-v2.ink','utf8').matchAll(/# beat:(\S+)/g)].map(m=>m[1]).sort());assert.equal(options.size,58);assert.equal(endings.size,2);
 writeFileSync('docs/evidence/v6/qingshi-v2-content-audit.json',JSON.stringify({status:'ART_INCREMENT_NOT_FINAL',sourceBeats:visited.size,options:options.size,endings:[...endings],sampledPaths:512,exhaustive:false,newRasterFiles:1,CG:'oldKnife',reusedCameraImage:'v6/qs-xu-age92.webp',limits:'One still-life illustration and reused camera; four friends remain template art, no three-state or full-three-editorial-round claim.'},null,2));
});
test('Qingshi both lives keep all words and inputs, old knife CG and elder closeup restore without resurrecting anyone',()=>{
 for(const side of [0,1]){const current=new VNRuntime(content,'qingshi-2.0.0'),prior=new VNRuntime(old,'qingshi-1.0.0');
  while(!current.frame.ending){assert.equal(current.frame.id,prior.frame.id);assert.equal(current.frame.text,prior.frame.text);assert.deepEqual(current.frame.choices,prior.frame.choices);
   if(current.frame.choices.length||current.frame.stage.cg||current.frame.id==='qs_oldknife_6')assert.deepEqual(restoreVN(JSON.stringify(current.save()),{content,version:'qingshi-2.0.0'}).session.frames,current.frames);
   if(current.frame.choices.length){current.choose(current.frame.choices[side].id);prior.choose(prior.frame.choices[side].id)}else{current.advance();prior.advance()}
  }
  assert.equal(current.frame.ending,prior.frame.ending);assert.deepEqual(current.commands,prior.commands);
  assert.throws(()=>restoreVN(JSON.stringify(prior.save()),{content,version:'qingshi-2.0.0'}),/作品或版本不兼容/);
  const frames=current.frames;assert.equal(frames.find(f=>f.id==='qs_oldknife_1')!.stage.cg,'oldKnife');
  const close=frames.find(f=>f.id==='qs_oldknife_6')!;assert.equal(close.stage.cg,undefined);assert.equal(close.stage.looks?.qs_xu,'age92close');
  assert.equal(resolvePortrait('qs_xu','neutral','age92close')!.file,resolvePortrait('qs_xu','neutral','age92')!.file);
  assert.ok(frames.filter(f=>f.stage.scene==='qs_after').every(f=>!f.stage.cast.includes('qs_xu')));
 }
});
