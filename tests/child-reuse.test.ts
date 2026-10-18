import {evidencePath} from './evidence-path.ts';
import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync,writeFileSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {VNRuntime,restoreVN} from '../src/vn-runtime.ts';
import {resolvePortrait,characters} from '../src/catalog.ts';
import content from '../src/generated/sea-tide.json' with {type:'json'};
import contentArchive from '../src/generated/sea-tide-after-child.json' with {type:'json'};
import previousContent from '../src/generated/sea-tide-before-child.json' with {type:'json'};
import archive from '../src/generated/sea-tide-v1.json' with {type:'json'};
const version='sea-tide-2.0.0',edition={content,previousContent,version},freezeEdition={content:contentArchive,previousContent,version};
function at(data:Record<string,unknown>,id:string,v=version){const s=new VNRuntime(data,v);while(s.frame.id!==id){assert.ok(!s.frame.ending,id);s.frame.choices.length?s.choose(s.frame.choices[0].id):s.advance()}return s}

test('Child portrait changes only trusted childhood presentations; both full old V2 paths retain every word, choice, world and restorable snapshot',()=>{
 const rows=[];for(const side of [0,1]){const a=new VNRuntime(previousContent,version),b=new VNRuntime(contentArchive,version),changed=[];while(true){assert.equal(a.frame.id,b.frame.id);assert.equal(a.frame.text,b.frame.text);assert.deepEqual(a.frame.choices,b.frame.choices);const old=a.save(),fresh=b.save();assert.deepEqual(JSON.parse(old.runtime).variablesState,JSON.parse(fresh.runtime).variablesState);const delta=old.runtime!==fresh.runtime||JSON.stringify(old.presentation)!==JSON.stringify(fresh.presentation);const restored=restoreVN(JSON.stringify(old),freezeEdition);if(delta){assert.match(a.frame.id,/^st_(trial|four_tests)_\d+$/);assert.equal(restored.migration,'illustration-staging');assert.equal(restored.save.savedAt,old.savedAt);assert.equal(restored.save.presentation.stage.looks?.st_an,'childV2');changed.push(a.frame.id)}else assert.ok(!restored.migrated);assert.deepEqual(restored.save.presentation,fresh.presentation);if(a.frame.ending)break;a.frame.choices.length?(a.choose(a.frame.choices[side].id),b.choose(b.frame.choices[side].id)):(a.advance(),b.advance())}assert.ok(changed.length>5);assert.deepEqual(a.commands,b.commands);rows.push({side,changed,ending:b.frame.ending,wordsAndCommandsIdentical:true})}writeFileSync(evidencePath('docs/evidence/v6/child-reuse-delta.json'),JSON.stringify(rows,null,2)+'\n');
});

test('Child update cannot accept forged stage, world, commands, wrong edition or missing frozen authority',()=>{
 const old=at(previousContent,'st_trial_1').save(),state=JSON.parse(old.runtime),key=Object.keys(state.variablesState).find(k=>typeof state.variablesState[k]==='boolean')!;state.variablesState[key]=!state.variablesState[key];for(const bad of [{...old,presentation:{...old.presentation,stage:{...old.presentation.stage,looks:{st_an:'adult'}}}},{...old,runtime:JSON.stringify(state)},{...old,commands:old.commands.slice(0,-1)}])assert.throws(()=>restoreVN(JSON.stringify(bad),edition),/状态/);assert.throws(()=>restoreVN(JSON.stringify(old),{content,version}),/状态/);assert.throws(()=>restoreVN(JSON.stringify({...old,storyContentVersion:'sea-tide-1.0.0'}),edition),/版本/);
});

test('Generic child remains a youth-template variant; archived child and all later age images stay unchanged',()=>{
 assert.equal(characters.st_an.portrait.kind,'template');assert.equal(characters.st_an.portrait.archetype,'youth');assert.equal(resolvePortrait('st_an','neutral','child')!.file,'v5/npc-youth-blue.webp');assert.equal(resolvePortrait('st_an','neutral','childV2')!.file,'v6/npc-child-boy.webp');assert.equal(resolvePortrait('st_an','neutral','childV2')!.size,'auto 85%');assert.equal(resolvePortrait('st_an','neutral','childV2')!.position,'center bottom');for(const [id,look]of [['st_trial_1','childV2'],['st_outer_years_1','youth'],['st_eleven_years_1','adult'],['st_last_look_1','late']])assert.equal(at(content,id).frame.stage.looks?.st_an,look);assert.equal(at(archive,'st_trial_1','sea-tide-1.0.0').frame.stage.looks?.st_an,'child');
});

test('Child source, final bytes and trusted pre-update files match retained provenance',()=>{
 const r=JSON.parse(readFileSync('docs/evidence/v6/reusable-child-art-assets.json','utf8'));for(const [p,sha]of Object.entries(r.frozen) as [string,string][])assert.equal(createHash('sha256').update(readFileSync(p)).digest('hex'),sha);const a=r.assets[0];assert.equal(createHash('sha256').update(readFileSync(a.file)).digest('hex'),a.sha256);assert.deepEqual(a.dimensions,[512,768]);assert.equal(a.sourceAlphaRange[0],0);
});
