import {evidencePath} from './evidence-path.ts';
import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync,writeFileSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {frozenBytes} from './frozen-baselines.ts';
import {VNRuntime,restoreVN} from '../src/vn-runtime.ts';
import content from '../src/generated/kuhe.json' with {type:'json'};
import old from '../src/generated/kuhe-v2.json' with {type:'json'};
import {chronicleWorks} from '../src/chronicle-catalog.ts';
const version='kuhe-3.0.0';
function run(picks:string[]=[],data=content,v=version,seed?:number){const s=new VNRuntime(data,v);let state=seed??0;while(!s.frame.ending){assert.ok(s.commands.length<600);if(s.frame.choices.length){state=(Math.imul(state,1664525)+1013904223)>>>0;s.choose((s.frame.choices.find(c=>picks.includes(c.id))??s.frame.choices[seed===undefined?0:state>>>31]).id)}else s.advance()}return{s,text:s.frames.map(f=>f.text).join('\n')}}
test('Kuhe V3 64 combinations preserve canonical history while fixing rescue, light wound and voluntary-return contradictions',()=>{
 const dimensions=[['kh_plan_second','kh_leave_choice'],['kh_prepare_litter','kh_offer_run'],['kh_save_runner','kh_save_pages'],['kh_admit_gap','kh_first_names'],['kh_write_known','kh_keep_beds'],['kh_choose_care','kh_choose_record']],rows=[];
 for(let mask=0;mask<64;mask++){const picks=dimensions.map((p,i)=>p[(mask>>i)&1]),r=run(picks);for(const t of ['十二位宗师','四人重伤，两人死','第二阵一人战死，三人重伤','第八十二招','第二百一十三招','空劫死，无生客死','第七日，孟归藏醒了','孟归藏不再与人正式交手','左臂终身未复','此后三十年未离太极山门'])assert.ok(r.text.includes(t),t);assert.equal(r.s.commands.filter(c=>c.startsWith('choice:')).length,20);assert.equal(r.s.frame.ending,mask&32?'kh_record':'kh_care');assert.doesNotMatch(r.text,/右腕忌重/);if(mask&4){assert.match(r.text,/谁认得？/);assert.doesNotMatch(r.text,/腿还在流血|这条腿我来托|备好的小刀递给药师|剪刀呢/)}else{assert.equal(r.text.includes('备好的小刀递给药师'),!(mask&2));assert.equal(r.text.includes('只送水，没有被一句着急'),Boolean(mask&1))}assert.deepEqual(restoreVN(JSON.stringify(r.s.save()),{content,version}).session.frames,r.s.frames);rows.push({mask,picks,ending:r.s.frame.ending,frames:r.s.frames.length})}
 const legacy=run(['kh_leave_choice'],old,'kuhe-2.0.0');assert.doesNotMatch(legacy.text,/他自己来找药师/);const fixed=run(['kh_leave_choice']);assert.match(fixed.text,/他自己来找药师/);assert.ok(fixed.text.indexOf('他自己来找药师')<fixed.text.indexOf('第二日正午'));writeFileSync(evidencePath('docs/evidence/v6/kuhe-editorial-branch-audit.json'),JSON.stringify({scope:'All 64 combinations of six listed dimensions; remaining choices first legal, not exhaustive over20 decisions',rows},null,2)+'\n');
});
test('Kuhe V3 single-input record, cloth and wrist changes are paid in later passages without reassigning fixed fates',()=>{
 for(const [pick,yes,no]of [['kh_hide_short','两张不合的布单','认出你报过的三卷布'],['kh_ask_breath','两次试喊的位置','八十二招，空劫叫两人合手'],['kh_send_record','第一份伤亡名册','当年先送药留下的'],['kh_make_strap','这一月别提重物','还好没有伤筋']]){const r=run([pick]);assert.ok(r.text.includes(yes),pick);assert.ok(!r.text.includes(no),pick)}
 const injured=run(['kh_make_strap','kh_hide_wrist']);assert.match(injured.text,/右腕忌重/);const light=run(['kh_hide_wrist']);assert.match(light.text,/还好没有伤筋/);assert.doesNotMatch(light.text,/右腕忌重/);
});
test('Kuhe V3 512 sampled paths reach every directed beat and retain staged injuries, CG exits and deaths',()=>{
 const ids=new Set<string>(),choices=new Set<string>();let longest=0;for(let seed=1;seed<=512;seed++){const r=run([],content,version,seed*139);let gap=0;for(const f of r.s.frames){ids.add(f.id);f.choices.forEach(c=>choices.add(c.id));gap=f.choices.length?0:gap+1;longest=Math.max(longest,gap)}const fs=r.s.frames,at=(id:string)=>fs.findIndex(f=>f.id===id);assert.equal(fs[at('kh_bell_13')].stage.cg,'oldPillars');assert.ok(fs.slice(at('kh_bell_13')+1).some(f=>!f.stage.cg));assert.equal(fs[at('kh_kong_trial_8')].stage.looks?.kh2_kong,'wounded');assert.equal(fs[at('kh_three_old_5')].stage.looks?.kh2_xuan,'empty');assert.equal(fs[at('kh_lock_2')].stage.looks?.kh2_gui,'locking');assert.ok(fs.slice(at('kh_lock_5')).every(f=>!f.stage.cast.includes('kh2_gui')));assert.ok(fs.slice(at('kh_retreat_1')).every(f=>!f.stage.cast.some(id=>['kh2_kong','kh2_wusheng'].includes(id))));if(seed<=2)writeFileSync(evidencePath(`docs/evidence/v6/kuhe-editorial-route-${seed}.txt`),r.text+'\n')}
 assert.deepEqual([...ids].sort(),[...readFileSync('story/kuhe.ink','utf8').matchAll(/# beat:(\S+)/g)].map(m=>m[1]).sort());assert.equal(choices.size,40);writeFileSync(evidencePath('docs/evidence/v6/kuhe-editorial-current-audit.json'),JSON.stringify({beats:ids.size,options:choices.size,decisions:20,sampledPaths:512,exhaustive:false,longestPassiveGap:longest,status:'THREE_INTERNAL_ROUNDS_NOT_FINAL_PROJECT_ACCEPTANCE'},null,2)+'\n');
});
test('Kuhe V2 bytes and namespace stay frozen and cannot import into rewritten V3',()=>{
 const frozen=JSON.parse(readFileSync('docs/evidence/v6/kuhe-editorial-preservation.json','utf8'));for(const [p,h]of Object.entries(frozen.frozen)){const b=frozenBytes(p);if(!b)continue;assert.equal(createHash('sha256').update(b).digest('hex'),h)}assert.equal(chronicleWorks.find(w=>w.slug==='kuhe')!.prefix,'jianghu:chronicle:kuhe:v3:');assert.equal(chronicleWorks.find(w=>w.slug==='kuhe-v2')!.prefix,'jianghu:chronicle:kuhe:v2:');const r=run([],old,'kuhe-2.0.0');assert.throws(()=>restoreVN(JSON.stringify(r.s.save()),{content,version}),/作品或版本不兼容/);
});
