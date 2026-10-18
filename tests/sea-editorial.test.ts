import {evidencePath} from './evidence-path.ts';
import test from 'node:test';
import assert from 'node:assert/strict';
import {writeFileSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {frozenBytes,frozenJson} from './frozen-baselines.ts';
import {VNRuntime,restoreVN} from '../src/vn-runtime.ts';
import current from '../src/generated/sea.json' with {type:'json'};
import archive from '../src/generated/sea-v1.json' with {type:'json'};
import beforeArt from '../src/generated/sea-before-rigging.json' with {type:'json'};
const version='sea-2.0.0',edition={content:current,version};
const dimensions=[['sr_trust_line','sr_hold_line'],['sr_ask_local_method','sr_test_old_record'],['sr_ask_lost_grip','sr_try_without_sword'],['sr_teach_daily','sr_teach_pair'],['sr_leave_class_in_turn','sr_leave_short_work'],['sr_late_teach','sr_late_sea'],['sr_pages_as_question','sr_pages_beside_routes']];
function run(overrides:string[]=[],content:Record<string,unknown>=current,v=version){const s=new VNRuntime(content,v);while(!s.frame.ending){assert.ok(s.commands.length<600);s.frame.choices.length?s.choose((s.frame.choices.find(c=>overrides.includes(c.id))??s.frame.choices[0]).id):s.advance()}return {s,text:s.frames.map(f=>f.text).join('\n')}}
function at(id:string,overrides:string[]=[]){const s=new VNRuntime(current,version);while(s.frame.id!==id){assert.ok(!s.frame.ending,id);s.frame.choices.length?s.choose((s.frame.choices.find(c=>overrides.includes(c.id))??s.frame.choices[0]).id):s.advance()}return s}

test('Sea V2 seven consequential binary dimensions keep fixed history, 23 decisions and isolated original-era cast across 128 combinations',()=>{
 const rows=[];for(let mask=0;mask<128;mask++){
  const selected=dimensions.map((pair,i)=>pair[(mask>>i)&1]),r=run(selected);assert.equal(r.s.commands.filter(c=>c.startsWith('choice:')).length,23);
  for(const phrase of ['五十三岁','十二位','十胜两平','七年','三百余招胜旧阁主','第三日各自离开而无胜负','两百余年后','九岁入门','第十二招','四十三招','八十余招','二十八场','二十三胜、三平、两败','第九十七招','十二日','五十一','五十二','五十四','六十一，返真','不正式收','天海宗不是天都门','第二代宗主入化很深，却未返真','第三代再出返真','一百二十余年'])assert.ok(r.text.includes(phrase),phrase);
  assert.equal(r.s.frame.ending,(mask&32)?'sr_next_harbor':'sr_open_courtyard');const transition=r.s.frames.findIndex(f=>f.id==='sr_two_centuries_1');assert.ok(transition>0);assert.ok(r.s.frames.slice(transition).every(f=>!f.stage.cast.some(id=>['sr_oldmaster','sr_oldboat'].includes(id))));assert.deepEqual(restoreVN(JSON.stringify(r.s.save()),edition).session.frames,r.s.frames);
  rows.push({mask,selected,frames:r.s.frames.length,ending:r.s.frame.ending});
 }
 writeFileSync(evidencePath('docs/evidence/v6/sea-editorial-branch-audit.json'),JSON.stringify({scope:'All 128 combinations of seven named dimensions; other choices use first legal option. Not exhaustive over all 23 decisions.',rows},null,2)+'\n');
});

test('Sea V2 shared cargo work has a shown initial time cost and later assistance, while self-managed goods keep the earlier visit but pay for a porter',()=>{
 const shared=run(),held=run(['sr_hold_line']);assert.match(shared.text,/挪出一下午/);assert.match(shared.text,/少请一趟脚夫/);assert.doesNotMatch(shared.text,/候一宿的费用/);assert.match(held.text,/今日的拜访来得及/);assert.match(held.text,/候一宿的费用/);assert.match(held.text,/他仍帮你找好住处/);assert.doesNotMatch(held.text,/你一向把物/);
});

test('Sea V2 local practice and disarm experiments get distinct later feedback, with no altered fixed enlightenment',()=>{
 const practice=run(),records=run(['sr_test_old_record','sr_try_without_sword']);assert.match(practice.text,/你在阁里练过这一步/);assert.match(practice.text,/为免剑脱手往后退半掌/);assert.match(records.text,/前人的脚到了/);assert.match(records.text,/丢开剑重走一遍/);for(const r of [practice,records])assert.match(r.text,/六十一，返真/);
});

test('Sea V2 return promise and assigned work actually get called back at the school; late document handling affects later use',()=>{
 const date=run(),work=run(['sr_leave_short_work','sr_pages_beside_routes']);assert.match(date.text,/门边的归期我没擦/);assert.match(date.text,/成卷年月未填的旁注/);assert.match(work.text,/十二张纸摊开/);assert.match(work.text,/先抽走了后添的纸/);
 for(const r of [date,work])for(const f of r.s.frames.filter(f=>f.text.includes('门边的归期我没擦')||f.text.includes('十二张纸摊开'))){assert.equal(f.stage.scene,'sr_school');assert.ok(f.stage.cast.includes('sr_carpenter'));assert.ok(!f.stage.cast.includes('sr_challenger'))}
});

test('Sea V2 reuses the ordinary rigging CG and puts both closeups on Canghe actual questions, clearing the next beat',()=>{
 const cg=at('sr_two_centuries_3');assert.equal(cg.frame.stage.cg,'rigging');cg.advance();assert.equal(cg.frame.stage.cg,'rigging');cg.advance();assert.equal(cg.frame.stage.cg,undefined);
 for(const [id,choices]of [['sr_ninety_seven_13',[]],['sr_ninety_seven_16',['sr_admit_no_answer']]] as [string,string[]][]){const s=at(id,choices);assert.equal(s.frame.stage.camera,'portrait');assert.deepEqual(s.frame.stage.cast,['sr_canghe']);assert.match(s.frame.text,/赢完/);s.advance();assert.equal(s.frame.stage.camera,undefined)}
});

test('Sea V1 bytes and pre-CG migration remain available; V1 commands cannot be relabelled and accepted as V2',()=>{
 const ledger=frozenJson<{sha256:Record<string,string>}>('docs/archives/sea-v1-editorial-baseline/manifest.json');if(ledger)for(const [path,key]of [['宋世江湖.md','宋世江湖.md'],['src/generated/sea-tide-v1.json','src/generated/sea-tide.json'],['story/sea-tide-v1.ink','story/sea-tide.ink'],['src/generated/sea-v1.json','src/generated/sea.json'],['story/sea-v1.ink','story/sea.ink']] as [string,string][]){const b=frozenBytes(path);if(b)assert.equal(createHash('sha256').update(b).digest('hex'),ledger.sha256[key],`${path} must stay byte-identical to the recorded ${key}`)}
 const old=new VNRuntime(beforeArt,'sea-1.0.0');while(old.frame.id!=='sr_two_centuries_3')old.frame.choices.length?old.choose(old.frame.choices[0].id):old.advance();assert.equal(restoreVN(JSON.stringify(old.save()),{content:archive,previousContent:beforeArt,version:'sea-1.0.0'}).migration,'illustration-staging');assert.throws(()=>restoreVN(JSON.stringify(old.save()),edition),/版本/);assert.throws(()=>restoreVN(JSON.stringify({...old.save(),storyContentVersion:version}),edition),/状态/);
});

test('Sea default, archive and sequel load separate real content, version and save namespaces',async()=>{
 const previous=globalThis.location;try{for(const [i,path,v,prefix]of [[0,'/sea.html','sea-2.0.0','jianghu:chronicle:sea:v2:'],[1,'/sea-v1.html','sea-1.0.0','jianghu:chronicle:sea:v1:'],[2,'/sea-tide.html','sea-tide-2.0.0','jianghu:chronicle:sea-tide:v2:']] as [number,string,string,string][]){globalThis.location={pathname:path} as Location;const m=await import(`../src/edition.ts?sea-editorial=${i}`);assert.equal(m.campaignEdition.version,v);assert.equal(m.edition.prefix,prefix);if(i===0){assert.strictEqual(m.campaignEdition.content,current);assert.equal(m.campaignEdition.previousContent,undefined)}if(i===1){assert.strictEqual(m.campaignEdition.content,archive);assert.strictEqual(m.campaignEdition.previousContent,beforeArt)}}}finally{globalThis.location=previous}
});
