import {evidencePath} from './evidence-path.ts';
import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync,writeFileSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {frozenBytes} from './frozen-baselines.ts';
import {VNRuntime,restoreVN} from '../src/vn-runtime.ts';
import published from '../src/generated/taihua-v2.json' with {type:'json'};
import content from '../src/generated/taihua.json' with {type:'json'};
const source=readFileSync('story/taihua.ink','utf8'),version='taihua-3.0.0';
function run(picks:string[]=[],data=content,v=version,seed?:number){const s=new VNRuntime(data,v);let r=seed??0;while(!s.frame.ending){assert.ok(s.commands.length<650);if(s.frame.choices.length){r=(Math.imul(r,1664525)+1013904223)>>>0;s.choose((s.frame.choices.find(c=>picks.includes(c.id))??s.frame.choices[seed===undefined?0:(r>>>16)%s.frame.choices.length]).id)}else s.advance()}return{s,text:s.frames.map(f=>f.text).join('\n')}}

test('Taihua reproduces erased V2 Shen commitment; draft keeps it until explicitly kept or cancelled in all24 named paths',()=>{
 const old=run(['th_practice','th_sulk','th_together'],published,'taihua-2.0.0');assert.match(old.text,/你没欠我一场私打/);assert.match(old.text,/你没另约过，或还没准备好/);
 const rows=[];for(const promised of [false,true])for(const listen of [false,true])for(const future of ['th_together','th_letter','th_guidance'])for(const kept of [false,true]){const r=run([promised?'th_practice':'th_ownwork',listen?'th_credit_shen':'th_sulk',future,kept?'th_keep_promise':'th_tomorrow']);assert.equal(r.s.commands.filter(c=>c.startsWith('choice:')).length,future==='th_guidance'?31:30);assert.equal(r.s.frame.ending,future==='th_together'?'th_company':future==='th_letter'?'th_letter':'th_guidance');if(promised){assert.doesNotMatch(r.text,/你没欠我一场私打|你没另约过，或|你没另约成沈这一回/);assert.match(r.text,/你约的复手，我记得/);if(future==='th_together')assert.match(r.text,listen?/沈照微先摆第一场/:/早先约了你，是我改/);if(future==='th_letter')assert.match(r.text,/今晨这一次取消/);if(future==='th_guidance')assert.match(r.text,/你当面将原约改去问张/)}else{assert.match(r.text,/你没欠我一场私打/);assert.doesNotMatch(r.text,/你当面将原约改去问张|早先约了你，是我改/)}if(future==='th_together'&&!listen){const frames=r.s.frames.filter(f=>f.stage.scene==='th_leavepractice'),start=frames.findIndex(f=>f.text==='我可以。不过先说好，还是不记场。');assert.ok(start>=0);assert.ok(frames.slice(start).every(f=>!f.stage.cast.includes('th_shen')))}rows.push({promised,listen,future,kept,ending:r.s.frame.ending})}
 writeFileSync(evidencePath('docs/evidence/v6/taihua-editorial-commitment-combinations.json'),JSON.stringify({combinations:rows.length,scope:'2 promised x2 willing-to-listen x3 futures x2 brother-recap =24; other choices first legal',rows},null,2)+'\n');
});

test('Deferred brother diagram is delivered on the actual next morning before first elder bout, independently of initial promise',()=>{
 for(const promise of [false,true])for(const kept of [false,true])for(const future of ['th_together','th_letter','th_guidance']){const r=run([promise?'th_promise':'th_quiet',kept?'th_keep_promise':'th_tomorrow',future]);const at=r.s.frames.findIndex(f=>f.text.includes('昨晚答应今晨交的图')),court=r.s.frames.findIndex(f=>f.stage.scene==='th_oldfirst');assert.ok(court>=0);if(kept){assert.equal(at,-1);assert.doesNotMatch(r.text,/那张补过的图收好/)}else{assert.ok(at>=0&&at<court);assert.match(r.text,/才将纸交给他/);assert.match(r.text,/那张补过的图收好/);assert.doesNotMatch(r.text,/没画完的，不装作已经讲清了/)}if(!promise&&kept)assert.doesNotMatch(r.text,/先还。答应讲的讲了/)}
});

test('24 arm/load/future paths carry actual first-leg cost without inventing refused rotation or healthy injured brother',()=>{
 const old=run(['th_rush','th_force','th_carry'],published,'taihua-2.0.0');assert.match(old.text,/这段我抬。下山再换/);assert.match(old.text,/抬重箱时没肯换人/);
 const rows=[];for(const strain of [false,true])for(const measured of [false,true])for(const carried of [false,true])for(const future of ['th_together','th_letter','th_guidance']){const r=run([strain?'th_rush':'th_hold',measured?'th_patience':'th_force',carried?'th_carry':'th_share_load',future]);assert.equal(r.text.includes('有一个月不能抬剑'),strain&&!measured&&carried);assert.doesNotMatch(r.text,/抬重箱时没肯换人|练步子，我陪/);assert.match(r.text,/同门答应在第一处宽石阶接箱/);if(carried){assert.match(r.text,/我先到宽石阶/);if(strain&&!measured){assert.match(r.text,/还没到交接的宽石阶/);assert.match(r.text,/你就地放箱，叫同门来接/);assert.match(r.text,/我坐着看，你练脚下/)}else assert.match(r.text,/到第一处宽石阶，同门接过重箱/)}else{assert.match(r.text,/同门从屋门就接/);assert.match(r.text,/你空出手开门/)}rows.push({strain,measured,carried,future,monthWithoutSword:strain&&!measured&&carried})}
 writeFileSync(evidencePath('docs/evidence/v6/taihua-editorial-load-combinations.json'),JSON.stringify({combinations:rows.length,rows},null,2)+'\n');
});

test('Asked-after-night Xie question is actually revisited before Huo bout; no invented prior request',()=>{
 for(const asked of [false,true]){const r=run([asked?'th_ask_xie_later':'th_leave_xie_room']);const at=r.s.frames.findIndex(f=>f.text==='你要问第三剑？先站远点。'),huo=r.s.frames.findIndex(f=>f.stage.scene==='th_huotrial');assert.equal(at>=0,asked);if(asked){assert.ok(at<huo);assert.match(r.text,/他把剑停在尚未伸足的地方/);assert.match(r.text,/我还没想好怎么接/)}assert.deepEqual(restoreVN(JSON.stringify(r.s.save()),{content,version}).session.frames,r.s.frames)}
});

test('512 sampled Taihua draft routes reach every authored beat,63 options and3 endings with canonical victories unchanged',()=>{
 const ids=new Set<string>(),options=new Set<string>(),ends=new Set<string>();let longest=0;for(let seed=1;seed<=512;seed++){const r=run([],content,version,seed*139);let gap=0;for(const f of r.s.frames){ids.add(f.id);f.choices.forEach(c=>options.add(c.id));gap=f.choices.length?0:gap+1;longest=Math.max(longest,gap)}ends.add(r.s.frame.ending!);for(const t of ['第一百零二手','第二百一十八手','这一回，你败','第四十八招','一百七十余招','第六手，他停','不是多半寸。是前面多了半寸','霍停云、明澄、谢临川、司马承一、陆青珩、沈照微','陆栖真居首，季闻鹤、慧觉、张玄岳、法舟、司马沉岳'])assert.ok(r.text.includes(t),t);if(seed<=3)writeFileSync(evidencePath(`docs/evidence/v6/taihua-editorial-current-route-${seed}.txt`),r.text+'\n')}
 assert.deepEqual([...ids].sort(),[...source.matchAll(/# beat:(\S+)/g)].map(m=>m[1]).sort());assert.equal(options.size,63);assert.equal(ends.size,3);assert.ok(longest<=18,`gap${longest}`);writeFileSync(evidencePath('docs/evidence/v6/taihua-editorial-current-audit.json'),JSON.stringify({status:'THREE_INTERNAL_ROUNDS_CURRENT_COMPILED',beforeAfterRecords:49,beats:ids.size,options:options.size,ends:[...ends],sampledPaths:512,exhaustive:false,longestPassiveGap:longest,compiledBy:'scripts/compile-story.mjs',limits:'Current compiled/directed version; no claim of human acceptance or full goal completion.'},null,2)+'\n');
});

test('Published Taihua versions, author modules and canon stay byte-identical; draft cannot consume a published save',()=>{
 const l=JSON.parse(readFileSync('docs/evidence/v6/taihua-editorial-first-pass.json','utf8'));const map=JSON.parse(readFileSync('docs/evidence/v6/taihua-editorial-preservation.json','utf8')).pathMap;for(const [p,h]of Object.entries(l.frozen)){const b=frozenBytes(map[p]);if(!b)continue;assert.equal(createHash('sha256').update(b).digest('hex'),h,p)}assert.throws(()=>restoreVN(JSON.stringify(run([],published,'taihua-2.0.0').s.save()),{content,version}),/作品或版本不兼容/);
});

test('Sima private practice asks about the actual patient or rushed bout, never invents a rush on patient path',()=>{
 for(const measured of [false,true]){const r=run(['th_ownwork','th_together',measured?'th_patience':'th_force']);const privateText=r.s.frames.filter(f=>f.stage.scene==='th_leavepractice').map(f=>f.text).join('\n');assert.match(privateText,measured?/你带我转出去时/:/抢的那半步/);if(measured)assert.doesNotMatch(privateText,/我对你时抢的那半步/)}
});

test('Guidance is an actual repeat-or-record action with distinct home rehearsal; neither consumes the missed peer session',()=>{
 for(const repeated of [false,true])for(const asked of [false,true]){const r=run(['th_guidance',repeated?'th_guidance_repeat':'th_guidance_mark',asked?'th_ask_stop':'th_note_stop']);assert.equal(r.s.frame.ending,'th_guidance');assert.equal(r.s.commands.filter(c=>c.startsWith('choice:')).length,31);assert.ok(r.s.frames.every(f=>f.stage.scene!=='th_leavepractice'));assert.match(r.text,repeated?/脚后终于空出/:/第二次没走，不在旁边写已经会了/);assert.match(r.text,repeated?/先前在张面前真走的那回，手还在追旧落点/:/第二次还没走，图在这里/);assert.equal(r.text.includes('先前真站过的半步'),asked);assert.match(r.text,/没有从这一炷香拿回一场同辈复手/);assert.match(r.text,/仍是追沈时的起手/);assert.deepEqual(restoreVN(JSON.stringify(r.s.save()),{content,version}).session.frames,r.s.frames)}
});

test('Reserved Zhang instruction is explicitly cancelled only when promised and another future chosen; soup joke depends on actual tray action',()=>{
 const rows=[];for(const booked of [false,true])for(const soup of [false,true])for(const future of ['th_together','th_letter','th_guidance']){const r=run([booked?'th_show_front_page':'th_keep_mu_blank',soup?'th_tray':'th_watch',future]);const cancelled=r.text.includes('前辈留的一炷香，我今日不来了');assert.equal(cancelled,booked&&future!=='th_guidance');assert.equal(r.text.includes('我照自己的时辰走'),cancelled);assert.equal(r.text.includes('我今日没碗在你手里'),soup);assert.equal(r.text.includes('今日不用坐墙头'),!soup);rows.push({booked,soup,requested:future,ending:r.s.frame.ending,cancelled})}writeFileSync(evidencePath('docs/evidence/v6/taihua-editorial-instruction-combinations.json'),JSON.stringify({combinations:rows.length,rows},null,2)+'\n');
});
test('Three late routes respect original Shen appointment and injured shoulder, including repeat-vs-mark guidance home work',()=>{
 for(const promised of [false,true])for(const repeated of [false,true]){const r=run([promised?'th_practice':'th_ownwork','th_guidance',repeated?'th_guidance_repeat':'th_guidance_mark','th_rush','th_force','th_carry']);assert.match(r.text,/有一个月不能抬剑/);assert.match(r.text,promised?/给沈的信另写原约怎样取消/:/不虚写她原本在等/);assert.match(r.text,repeated?/手还要歇，今日先看脚下/:/我先只试脚下/)}const peers=run(['th_practice','th_credit_shen','th_together','th_rush','th_force','th_share_load']);assert.match(peers.text,/右肩仍紧，沈只让你把那只脚摆回去/);assert.doesNotMatch(peers.text,/有一个月不能抬剑/);
});

test('V3 CG starts at actual night bowl/doorway after quarrel, exits before falling leaf; V2 remains frozen',()=>{
 const r=run(),start=r.s.frames.find(f=>f.stage.cg==='nightCompany')!;assert.equal(start.id,'th_supper_8');assert.match(start.text,/明澄端着碗站在门边/);assert.ok(r.s.frames.find(f=>f.id==='th_supper_10')!.stage.cg===undefined);const mu=r.s.frames.find(f=>f.id==='th_mu_front_5')!;assert.equal(mu.stage.looks?.th_mu,'v2');assert.ok(r.s.frames.some(f=>f.stage.cg==='mountainInquiry'));const at=r.s.frames.findIndex(f=>f.text.includes('穆转身回上座'));assert.ok(at>=0&&r.s.frames.slice(at+1).every(f=>!f.stage.cast.includes('th_mu')));
});
