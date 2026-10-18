import {evidencePath} from './evidence-path.ts';
import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync,writeFileSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {Compiler} from 'inkjs/compiler/Compiler';
import {VNRuntime,restoreVN} from '../src/vn-runtime.ts';
const source=readFileSync('story/drafts/kuhe-editorial.ink','utf8');
const compiler=new Compiler(source),compiled=compiler.Compile();
assert.deepEqual(compiler.errors,[]);
const content=JSON.parse(compiled.ToJson()),version='kuhe-editorial-draft-1';
function run(overrides:string[]=[],seed?:number){const s=new VNRuntime(content,version);let state=seed??0;while(!s.frame.ending){if(s.frame.choices.length){state=(Math.imul(state,1664525)+1013904223)>>>0;const c=s.frame.choices.find(c=>overrides.includes(c.id))??s.frame.choices[seed===undefined?0:state>>>31];s.choose(c.id)}else s.advance();assert.ok(s.commands.length<600)}return{s,text:s.frames.map(f=>f.text).join('\n')}}
test('Unpublished Kuhe first-round draft preserves published data bytes and canonical final fates',()=>{
 const ledger=JSON.parse(readFileSync('docs/evidence/v6/kuhe-editorial-round1-changes.json','utf8'));assert.equal(createHash('sha256').update(readFileSync('src/generated/kuhe-v2.json')).digest('hex'),ledger.publishedSHA256);
 for(const overrides of [[],['kh_save_pages','kh_choose_record','kh_leave_choice']]){const r=run(overrides);for(const t of ['空劫死，无生客死','第七日，孟归藏醒了','左臂终身未复','此后三十年未离太极山门','孟归藏不再与人正式交手'])assert.ok(r.text.includes(t),t);assert.deepEqual(restoreVN(JSON.stringify(r.s.save()),{content,version}).session.frames,r.s.frames)}
});
test('Leave-camp choice has voluntary limited-duty return; single preparation changes have delayed concrete consequences',()=>{
 const base=run(),left=run(['kh_leave_choice']),unready=run(['kh_offer_run']),pages=run(['kh_save_pages']),strap=run(['kh_make_strap']),beds=run(['kh_answer_hope']),duty=run(['kh_keep_beds']);
 assert.match(left.text,/他自己来找药师/);assert.match(left.text,/我不接谷里那头/);assert.doesNotMatch(left.text,/手没有再从布上离开/);assert.match(base.text,/手没有再从布上离开/);
 assert.match(base.text,/备好的小刀递给药师/);assert.match(unready.text,/翻了两只药袋才找到/);assert.doesNotMatch(pages.text,/剪刀呢|备好的小刀递给药师/);assert.match(pages.text,/布盖过了脸/);
 assert.match(strap.text,/缝好的宽带从肩下穿过/);assert.match(strap.text,/这一月别提重物/);assert.match(beds.text,/擦去床边倒出的药粉/);assert.match(duty.text,/时辰牌已经添了两个接班人的名字/);assert.match(base.text,/撤路图已核过两处/);
 for(const [r,cid,needle]of [[unready,'kh_offer_run','翻了两只药袋'],[strap,'kh_make_strap','缝好的宽带从肩下'],[beds,'kh_answer_hope','擦去床边倒出的药粉'],[duty,'kh_keep_beds','时辰牌已经添了'] ] as const){const at=r.s.frames.findIndex(f=>f.choices.some(c=>c.id===cid)),after=r.s.frames.findIndex(f=>f.text.includes(needle));assert.ok(after-at>4,`${cid}: consequence is not an immediate reply ${after-at}`);assert.notEqual(r.s.frames[at].id.replace(/_\d+$/,''),r.s.frames[after].id.replace(/_\d+$/,''),`${cid}: consequence belongs to a later authored passage`)}
});
test('512 sampled draft paths reach every authored beat and both personal endings without rewriting fixed history',()=>{
 const ids=new Set<string>(),options=new Set<string>(),endings=new Set<string>();let longest=0;
 for(let seed=1;seed<=512;seed++){const r=run([],seed*139);let gap=0;for(const f of r.s.frames){ids.add(f.id);if(f.choices.length){f.choices.forEach(c=>options.add(c.id));gap=0}else longest=Math.max(longest,++gap)}endings.add(r.s.frame.ending!);assert.ok(r.text.indexOf('他自己来找药师')<r.text.indexOf('第二日正午')||!r.text.includes('他自己来找药师'))}
 assert.deepEqual([...ids].sort(),[...source.matchAll(/# beat:(\S+)/g)].map(m=>m[1]).sort());assert.equal(options.size,40);assert.equal(endings.size,2);
 writeFileSync(evidencePath('docs/evidence/v6/kuhe-editorial-draft-audit.json'),JSON.stringify({status:'THREE_INTERNAL_ROUNDS_DIRECTION_CHECK_SEPARATE',editorialRounds:3,sourceBeats:ids.size,options:options.size,endings:[...endings],sampledPaths:512,exhaustive:false,longestPassiveGap:longest,compilerWarnings:compiler.warnings,limits:'Draft has no production-direction pass or browser entry; not three editorial rounds or final acceptance.'},null,2)+'\n');
});
