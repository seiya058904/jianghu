import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {VNRuntime,restoreVN} from '../src/vn-runtime.ts';
import {loadEditorialBaseline} from '../src/editorial-baselines.ts';
import {experienceBaselineManifest,loadEditorialHistory} from '../src/experience-baselines.ts';

function route(content:Record<string,unknown>,version:string,overrides:string[]=[]){
 const state=new VNRuntime(content,version),used=new Set<string>();
 while(!state.frame.ending){assert.ok(state.commands.length<1000);if(state.frame.choices.length){const id=state.frame.choices.find(c=>overrides.includes(c.id))?.id??state.frame.choices[0].id;used.add(id);state.choose(id)}else state.advance()}
 for(const id of overrides)assert.ok(used.has(id),id);return state;
}
const source=(slug:string)=>JSON.parse(readFileSync(`src/generated/${slug}.json`,'utf8'));
for(const wait of [true,false])for(const own of [true,false])test(`Gu testimony follows both independent replies: wait=${wait}, own=${own}`,()=>{
 const state=route(source('dead-ranking'),'dead-ranking-1.0.0',[wait?'dr_wait_for_gu':'dr_ask_night_first',own?'dr_ask_own_words':'dr_ask_delay']);
 const text=state.frames.filter(f=>f.id.startsWith('dr_living_benefit_')).map(f=>f.text).join('\n');
 assert.doesNotMatch(text,/第十年才开口/);
 assert.match(text,own?(wait?/等他自己/:/先问二月十六夜/):/三日怎样拖成十年/);
 assert.match(text,/怕丢人/);
});
test('Luhua explicitly leaves the protagonist viewpoint for the two masters private conversation',()=>{
 const state=route(source('luhua'),'luhua-1.0.0');
 assert.match(state.frames.find(f=>f.id==='lh_own_sleeve_3')!.text,/私谈，你并未在场/);
 assert.match(state.frames.find(f=>f.id==='lh_own_sleeve_6')!.text,/那就是他的/);
});
for(const row of experienceBaselineManifest)test(`authentic intervening ${row.slug} saves restore on both routes without accepting tampering`,async()=>{
 const bytes=readFileSync(`src/generated/experience-pre-audit/${row.slug}.json`);
 assert.equal(bytes.length,row.bytes);assert.equal(createHash('sha256').update(bytes).digest('hex'),row.sha256);
 const editorialContent=await loadEditorialBaseline(row.version),editorialHistory=await loadEditorialHistory(row.version);
 const edition={content:source(row.slug),version:row.version,editorialContent,editorialHistory};
 const paths=row.slug==='dead-ranking'?[['dr_wait_for_gu','dr_ask_own_words'],['dr_wait_for_gu','dr_ask_delay'],['dr_ask_night_first','dr_ask_own_words'],['dr_ask_night_first','dr_ask_delay']]:[[],['lh_visit_coast']];
 for(const overrides of paths){
  const old=new VNRuntime(JSON.parse(bytes.toString('utf8')),row.version);let migrations=0;
  while(true){
   const raw=JSON.stringify(old.save()),result=restoreVN(raw,edition);
   assert.equal(result.session.frame.id,old.frame.id);assert.deepEqual(result.save.commands,old.commands);
   if(result.migrated){migrations++;assert.equal(result.migration,'editorial-text');}
   assert.equal(restoreVN(JSON.stringify(result.save),edition).migrated,undefined);
   if(old.frame.ending){const forged=JSON.parse(raw);forged.presentation.beatId+='-forged';assert.throws(()=>restoreVN(JSON.stringify(forged),edition));break;}
   old.frame.choices.length?old.choose(old.frame.choices.find(c=>overrides.includes(c.id))?.id??old.frame.choices[0].id):old.advance();
  }
  if(row.slug==='dead-ranking'&&overrides.includes('dr_wait_for_gu')&&overrides.includes('dr_ask_own_words'))assert.equal(migrations,0,'unchanged route uses strict restoration');
  else assert.ok(migrations>0,'changed text must exercise migration');
 }
});
