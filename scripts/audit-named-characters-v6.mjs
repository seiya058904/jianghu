import assert from 'node:assert/strict';
import {readFileSync,writeFileSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {characters,scenes} from '../src/catalog.ts';
const definition=JSON.parse(readFileSync('docs/v6/named-character-verified-subset.json','utf8'));
const audit=JSON.parse(readFileSync('docs/evidence/v6/production-content-audit.json','utf8'));
const canon=readFileSync('宋世江湖.md','utf8').split('\n');
const locators={kuhe:[364,1803],qingshi:[14850,20213],longmen:[1804,2021],taihua:[2022,6057]};
const sourceName=work=>work==='tide-v6'?'campaign-v6':work;
const sources=new Map();const hashes={};
for(const work of new Set(definition.people.map(row=>row[2]))){
 const compiled=readFileSync(`src/generated/${sourceName(work)}.json`);const hash=createHash('sha256').update(compiled).digest('hex');
 assert.equal(audit.works[work].contentSHA256,hash,`Stale production audit: ${work}; rerun audit-production-v6`);
 assert.deepEqual(audit.works[work].unvisited,[],`Unknown reachability in ${work}`);
 hashes[work]=hash;sources.set(work,readFileSync(`story/${sourceName(work)}.ink`,'utf8').split('\n'));
}
assert.equal(definition.people.length,60);assert.equal(new Set(definition.people.map(row=>row[0])).size,60);assert.equal(new Set(definition.people.map(row=>row[1])).size,60);
const claimedIDs=new Set();
const rows=definition.people.map(([name,id,work])=>{
 assert.equal(characters[id]?.name,name,`Name changed: ${id}`);
 const aliases=[id,...(definition.knownAppearanceAliases[id]??[])];
 for(const alias of aliases){assert.ok(!claimedIDs.has(alias),`Counted twice: ${alias}`);claimedIDs.add(alias);assert.equal(characters[alias]?.name,name)}
 const observed=audit.people.find(person=>person.id===id);assert.ok(observed?.spokenBeats>0&&observed.works.includes(work),`No actual speaking evidence: ${id}`);
 const lines=sources.get(work);const lineIndex=lines.findIndex(line=>new RegExp(`# speaker:${id}(?:\\s|$)`).test(line));assert.ok(lineIndex>=0,id);
 const line=lines[lineIndex],beat=line.match(/# beat:(\S+)/)?.[1],scene=line.match(/# scene:(\S+)/)?.[1];assert.ok(beat&&scene);
 const range=locators[work];const canonHits=range?canon.flatMap((line,index)=>index+1>=range[0]&&index+1<=range[1]&&line.includes(name)?[index+1]:[]):[];
 // A source spelling such as 韩七郎 is recorded separately rather than invented by the verifier.
 return{name,id,work,appearanceAliases:aliases.slice(1),role:characters[id].role,profile:characters[id].detail,firstDeclaredSpokenBeat:beat,firstScene:scene,firstSceneTime:scenes[scene]?.time??null,source:`story/${sourceName(work)}.ink`,sourceLine:lineIndex+1,spokenText:line.split(' # ')[0],observedSpeakingBeatsAcrossRegisteredWorks:observed.spokenBeats,canonicalNameHits:canonHits,canonicalScope:range??null,origin:work==='tide-v6'?'original-compatible':'canonical-adaptation'};
});
const report={canonSHA256:createHash('sha256').update(readFileSync('宋世江湖.md')).digest('hex'),status:'VERIFIED_NAMED_SUBSET_NOT_FULL_PERSON_CENSUS',count:rows.length,definition:'docs/v6/named-character-verified-subset.json',productionContentHashes:hashes,people:rows,limits:definition.limits};
writeFileSync('docs/evidence/v6/named-character-verified-subset.json',JSON.stringify(report,null,2)+'\n');
const text=['# V6 已核对的60位具名发言人物','', `这是具名发言人物的正向下限，不是${audit.counts.speakingNPC}个发言ID的全量去重。每人只选一个活跃稿身份，已知外观别名合并；未名岗位不计入。各人物有实际采样发言证据，所选作品全部声明拍已被采样访问，并验证当前编译文件SHA与审计输入一致。`, '', '主篇兼容原创人物不冒称原典已有传记。原典姓名检索只在该篇已核对区间内定位；绰号与全名异写仍需按作品资料解释，不据零命中判断人物不存在。时代/年龄栏是首次声明发言场景的时间标签，不是为原典留白补生日。', '', '|人物|职责|活跃稿/首个声明发言拍|场景时间|源码|','|---|---|---|---|---|',...rows.map(r=>`|${r.name}|${r.role}|${r.work} / ${r.firstDeclaredSpokenBeat}|${r.firstSceneTime??'原典留白'}|${r.source}:${r.sourceLine}|`),'','完整别名、职责资料、原典姓名命中行与输入SHA见`docs/evidence/v6/named-character-verified-subset.json`。运行：`node --experimental-strip-types scripts/audit-named-characters-v6.mjs`，需先刷新production审计。人物美术完成度、完整年龄关系核查、全部ID去重与文学验收仍分别进行。',''];
writeFileSync('docs/v6/NAMED_CHARACTER_CENSUS_V6.md',text.join('\n'));
console.log(JSON.stringify({status:report.status,verifiedNamedLowerBound:rows.length,sourceWorks:Object.keys(hashes),fullCensus:false}));
