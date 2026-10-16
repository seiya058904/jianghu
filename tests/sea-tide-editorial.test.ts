import test from 'node:test';
import assert from 'node:assert/strict';
import {writeFileSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {frozenBytes,frozenJson} from './frozen-baselines.ts';
import {VNRuntime,restoreVN} from '../src/vn-runtime.ts';
import current from '../src/generated/sea-tide.json' with {type:'json'};
import archive from '../src/generated/sea-tide-v1.json' with {type:'json'};
import {seaTideCharacters} from '../src/sea-tide-catalog.ts';
import beforeChild from '../src/generated/sea-tide-before-child.json' with {type:'json'};
import before from '../src/generated/sea-tide-before-rigging.json' with {type:'json'};
const version='sea-tide-2.0.0',edition={content:current,version};
const dimensions=[['st_learn_shared_knot','st_learn_fast_knot'],['st_practice_exchange','st_practice_alone'],['st_follow_motion','st_release_fixed'],['st_set_transfer_line','st_send_nearest_people'],['st_prepare_shared_post','st_prepare_fast_post'],['st_pay_waiting','st_rehearse_handoff'],['st_repair_talk','st_repair_work'],['st_life_teach','st_life_patrol']];
function run(choices:string[]=[],content:Record<string,unknown>=current,v=version){const s=new VNRuntime(content,v);while(!s.frame.ending){assert.ok(s.commands.length<600);s.frame.choices.length?s.choose((s.frame.choices.find(c=>choices.includes(c.id))??s.frame.choices[0]).id):s.advance()}return {s,text:s.frames.map(f=>f.text).join('\n')}}
function at(id:string){const s=new VNRuntime(current,version);while(s.frame.id!==id){assert.ok(!s.frame.ending,id);s.frame.choices.length?s.choose(s.frame.choices[0].id):s.advance()}return s}

test('Sea Tide V2 256 combinations of eight dimensions preserve public history and 21 decisions',()=>{
 const rows=[];for(let mask=0;mask<256;mask++){const choices=dimensions.map((pair,i)=>pair[(mask>>i)&1]),r=run(choices);assert.equal(r.s.commands.filter(c=>c.startsWith('choice:')).length,21);for(const phrase of ['十二岁','五日','吐了三日','四十七个','十六个','外院六年','十七岁','十八岁','连续七日','二十九岁','十一艘','三艘撞礁','二十余人','木梁把你压','三步','最后一个离船','半年后','近三十','两人都未入化','一百零六合','北榜第十四','四十多','九十余','第二招','第五招','第七招','第九招','棍仍在外侧','四十九岁','候选五人','自认第二','定下来的却是周望海','七年','七条','九条','十四年后，六十三岁','第九席','一根手指','确切境界','总谱第三','不知道'])assert.ok(r.text.includes(phrase),phrase);assert.equal(r.s.frame.ending,(mask&128)?'st_next_watch':'st_next_step');assert.equal(r.text.includes('腕上的伤养了两个月'),Boolean(mask&2));assert.ok(r.s.frames.findIndex(f=>f.stage.scene==='st_teacourt')<r.s.frames.findIndex(f=>f.id==='st_sixty_three_1'));assert.deepEqual(restoreVN(JSON.stringify(r.s.save()),edition).session.frames,r.s.frames);rows.push({mask,choices,frames:r.s.frames.length,ending:r.s.frame.ending})}
 writeFileSync('docs/evidence/v6/sea-tide-editorial-branch-audit.json',JSON.stringify({scope:'All 256 combinations of eight named dimensions, other choices first legal. Not exhaustive over 21 decisions.',rows},null,2)+'\n');
});

test('Sea Tide V2 fixes the V1 fictitious overnight bill for a prepared handoff and retains the actual failed-handoff costs',()=>{
 const legacy=run(['st_rehearse_handoff'],archive,'sea-tide-1.0.0');assert.match(legacy.text,/昨天多候的一夜/);const rows=[];
 for(const shared of [true,false])for(const paid of [true,false]){const choices=[shared?'st_prepare_shared_post':'st_prepare_fast_post',paid?'st_pay_waiting':'st_rehearse_handoff'],r=run(choices),text=r.s.frames.filter(f=>f.id.startsWith('st_handoff_account_')).map(f=>f.text).join('\n');if(shared){assert.match(text,paid?/账上没有候夜/:/今日没人候夜/);assert.doesNotMatch(text,/候夜和次日少接|照实付昨夜与短工/)}else assert.match(text,paid?/候夜和次日少接的短工/:/照实付昨夜与短工/);rows.push({shared,paid,actualSettlement:text})}
 writeFileSync('docs/evidence/v6/sea-tide-editorial-settlement-audit.json',JSON.stringify({V1preparedRehearsalErroneouslyBilledNight:true,V2rows:rows},null,2)+'\n');
});

test('Sea Tide V2 childhood knot does not decide adult injury, and both learned tide styles remain constrained by the fixed mast',()=>{
 for(const child of ['st_learn_shared_knot','st_learn_fast_knot'])for(const practice of ['st_practice_exchange','st_practice_alone'])for(const tide of ['st_follow_motion','st_release_fixed']){const r=run([child,practice,tide]);assert.equal(r.text.includes('腕上的伤养了两个月'),practice==='st_practice_alone');assert.match(r.text,/第一掌拍断压你的梁/);assert.match(r.text,/最后一个离船/);if(child==='st_learn_fast_knot')assert.match(r.text,/第二日真去叫过阿岑/);assert.match(r.text,tide==='st_follow_motion'?/先得有人替你移开木梁/:/脚跟却卡在梁下/)}
});

test('Sea Tide V2 late recall uses only the actual selected nine-hand question and the repaired peer relationship',()=>{
 const asked=run(),analytical=run(['st_ask_earlier','st_repair_work']);const late=(r:ReturnType<typeof run>)=>r.s.frames.filter(f=>f.id.startsWith('st_old_depth_')).map(f=>f.text).join('\n');assert.match(late(asked),/当年问叶孤舟是不是状态不好/);assert.doesNotMatch(late(analytical),/状态不好/);assert.match(late(analytical),/当年问他每手/);assert.match(asked.text,/把最末那段也讲了/);assert.match(analytical.text,/把白沙屿那份单另给了你/);
});

test('Sea Tide V2 both childhood gestures return in both late duties at a late pier with the late portrait',()=>{
 for(const rail of [true,false])for(const teach of [true,false]){const r=run([rail?'st_take_rail':'st_wait_wave',teach?'st_life_teach':'st_life_patrol']),frames=r.s.frames.filter(f=>f.stage.scene==='st_latepier');assert.ok(frames.length>0);for(const f of frames){assert.equal(f.stage.looks?.st_an,'late');assert.deepEqual(f.stage.cast,['st_an'])}assert.match(r.text,teach?(rail?/学生把栏抓得指节发白/:/学生坐在船边等浪过去/):(rail?/新人伸手抓栏/:/新人催着出港/));}
 const cg=at('st_outer_years_1');assert.equal(cg.frame.stage.cg,'rigging');cg.advance();assert.equal(cg.frame.stage.cg,'rigging');cg.advance();assert.equal(cg.frame.stage.cg,undefined);const question=at('st_outer_years_4');assert.equal(question.frame.stage.camera,'portrait');assert.deepEqual(question.frame.stage.cast,['st_coach']);question.advance();assert.equal(question.frame.stage.camera,undefined);
});

test('Sea Tide V1 bytes, older raw staging and the unchanged Sea V2/canon remain protected',()=>{
 assert.equal(seaTideCharacters.st_boatkeeper.portrait.file,'v5/npc-boatwoman.webp');assert.equal(seaTideCharacters.st2_boatkeeper.portrait.file,'v5/npc-elder-male.webp');assert.equal(seaTideCharacters.st2_boatkeeper.canonicalIdentity,'st_boatkeeper');const ledger=frozenJson<{sha256:Record<string,string>}>('docs/archives/sea-tide-v1-editorial-baseline/manifest.json');if(ledger)for(const [path,key]of [['src/generated/sea-tide-v1.json','src/generated/sea-tide.json'],['story/sea-tide-v1.ink','story/sea-tide.ink'],['src/generated/sea.json','src/generated/sea.json'],['宋世江湖.md','宋世江湖.md']] as [string,string][]){const b=frozenBytes(path);if(b)assert.equal(createHash('sha256').update(b).digest('hex'),ledger.sha256[key],`${path} must stay byte-identical to the recorded ${key}`)}const s=new VNRuntime(before,'sea-tide-1.0.0');while(s.frame.id!=='st_outer_years_1')s.frame.choices.length?s.choose(s.frame.choices[0].id):s.advance();assert.equal(restoreVN(JSON.stringify(s.save()),{content:archive,previousContent:before,version:'sea-tide-1.0.0'}).migration,'illustration-staging');assert.throws(()=>restoreVN(JSON.stringify(s.save()),edition),/版本/);assert.throws(()=>restoreVN(JSON.stringify({...s.save(),storyContentVersion:version}),edition),/状态/);
});

test('Sea Tide current and V1 archive load distinct content and namespaces while first-volume Sea stays V2',async()=>{
 const previous=globalThis.location;try{for(const [i,path,v,prefix]of [[0,'/sea-tide.html','sea-tide-2.0.0','jianghu:chronicle:sea-tide:v2:'],[1,'/sea-tide-v1.html','sea-tide-1.0.0','jianghu:chronicle:sea-tide:v1:'],[2,'/sea.html','sea-2.0.0','jianghu:chronicle:sea:v2:']] as [number,string,string,string][]){globalThis.location={pathname:path} as Location;const m=await import(`../src/edition.ts?sea-tide-editorial=${i}`);assert.equal(m.campaignEdition.version,v);assert.equal(m.edition.prefix,prefix);if(i===0){assert.strictEqual(m.campaignEdition.content,current);assert.strictEqual(m.campaignEdition.previousContent,beforeChild)}if(i===1){assert.strictEqual(m.campaignEdition.content,archive);assert.strictEqual(m.campaignEdition.previousContent,before)}}}finally{globalThis.location=previous}
});
