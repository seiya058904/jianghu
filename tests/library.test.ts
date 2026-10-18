import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import {chronicleWorks} from '../src/chronicle-catalog.ts';
import {workEntries,groupedEditionSlugs,legacyOriginal,resolveEdition,editionFile,editionPrefix,editionEndings,readProgress,estimateMinutes} from '../src/works-registry.ts';
import {indexHtml,archiveHtml,workEditionLinks,workArchiveLinks} from '../src/work-index.ts';

const inkBeats=(slug:string)=>{const text=readFileSync(`story/${slug}.ink`,'utf8');return new Set([...text.matchAll(/# beat:([A-Za-z0-9_]+)/g)].map(match=>match[1])).size};
const storageOf=(values:Record<string,string>)=>({getItem:(key:string)=>Object.hasOwn(values,key)?values[key]:null});

test('Every collection card points at a real registered edition and no edition is reachable twice or not at all',()=>{
 assert.equal(new Set(workEntries.map(work=>work.id)).size,workEntries.length,'duplicate work id');
 for(const work of workEntries){
  assert.ok(resolveEdition(work.entry),`${work.id} entry slug ${work.entry} is not registered`);
  for(const ref of [...work.volumes,...work.companions,...work.archives])assert.ok(resolveEdition(ref.slug),`${work.id} references unknown edition ${ref.slug}`);
  assert.ok(work.volumes.some(ref=>ref.slug===work.entry),`${work.id} must list its own current edition as a volume`);
 }
 assert.equal(new Set(groupedEditionSlugs).size,groupedEditionSlugs.length,'an edition is listed twice');
 const registered=chronicleWorks.map(work=>work.slug);
 assert.deepEqual([...groupedEditionSlugs].sort(),[...registered].sort(),'the collection must expose exactly the registered editions');
 for(const work of workEntries)assert.notEqual(editionFile(work.entry),'','every current work needs a page');
});

test('Estimated reading time is derived from the measured beat count of the current edition',()=>{
 for(const work of workEntries)assert.equal(work.beats,inkBeats(work.entry),`${work.id} beat count drifted from story/${work.entry}.ink`);
 assert.equal(estimateMinutes(60),'5–8 分钟（按拍数估计）');
 const low=(text:string)=>Number(text.split('–')[0]);
 assert.ok(low(estimateMinutes(400))>low(estimateMinutes(100)),'longer works must not read shorter');
});

test('All 22 canon groups are represented, and at least 18 canon plays are directly playable',()=>{
 const covered=workEntries.flatMap(work=>work.canon);
 const groups=covered.map(label=>label.slice(0,4));
 for(const id of ['原典01','原典02','原典03','原典04','原典05','原典06','原典07','原典08','原典09','原典10','原典11','原典12','原典13','原典14','原典15','原典16','原典17','原典18','原典19','原典20','原典21','原典22'])
  assert.ok(groups.includes(id),`canon group ${id} has no work in the collection`);
 const locked=new Set(['bamboo','north-notes','beyond-ranking']);
 const reachable=[...new Set(workEntries.flatMap(work=>[work.entry,...work.volumes.map(v=>v.slug),...work.companions.map(c=>c.slug)]))];
 const playable=reachable.filter(slug=>!locked.has(slug));
 assert.ok(playable.length>=18,`expected at least 18 directly playable canon editions, found ${playable.length}: ${playable.join(',')}`);
 for(const slug of playable){
  assert.ok(inkBeats(slug)>=60,`${slug} is presented as a playable work but carries only ${inkBeats(slug)} beats`);
  assert.ok(editionEndings(slug)>=2,`${slug} must be able to settle on at least two personal endings`);
 }
});

test('Progress is per work and never shared across works or editions',()=>{
 const empty=storageOf({});
 for(const work of workEntries)assert.deepEqual(readProgress(work,empty),{state:'new',unlocked:0,total:editionEndings(work.entry)});
 const longmen=workEntries.find(work=>work.id==='longmen')!,qingshi=workEntries.find(work=>work.id==='qingshi')!;
 assert.equal(readProgress(longmen,storageOf({[editionPrefix(longmen.entry)+'auto']:'{}'})).state,'reading','saved progress counts as started');
 assert.equal(readProgress(longmen,storageOf({[editionPrefix(longmen.entry)+'endings']:'["lm_travel"]'})).state,'reading','one of two endings is still in progress');
 assert.equal(readProgress(longmen,storageOf({[editionPrefix(longmen.entry)+'endings']:'["lm_travel","lm_home"]'})).state,'finished');
 assert.equal(readProgress(qingshi,storageOf({[editionPrefix(longmen.entry)+'endings']:'["lm_travel","lm_home"]'})).state,'new','another work must not inherit this progress');
 assert.equal(readProgress(qingshi,empty).total,editionEndings('qingshi'));
 const broken=storageOf({[editionPrefix(longmen.entry)+'endings']:'{not json'});
 assert.deepEqual(readProgress(longmen,broken),{state:'new',unlocked:0,total:2},'malformed progress degrades instead of throwing');
 assert.equal(readProgress(longmen,null).state,'new','no storage at all is safe');
 assert.equal(readProgress(longmen,{getItem(){throw new Error('SecurityError')}}).state,'new','unavailable storage methods are safe');
});

test('The shared index lists the current editions first, archives separately and the original stories last',()=>{
 const html=indexHtml('./');
 const currentAt=html.indexOf('现行作品'),archiveAt=html.indexOf('历史版本与旧存档'),originalAt=html.indexOf('原创旧篇');
 assert.ok(currentAt>=0&&archiveAt>currentAt&&originalAt>archiveAt,'sections must be ordered current → archive → original');
 for(const work of workEntries){
  const entry=resolveEdition(work.entry)!;
  assert.ok(html.includes(`>${entry.title}</a>`),`index is missing the current edition link ${entry.title}`);
  for(const link of workEditionLinks(work))assert.ok(html.includes(`>${link.title}</a>`),`index is missing volume/companion ${link.title}`);
 }
 const archiveOnly=archiveHtml('./');
 assert.ok(!archiveOnly.includes('现行作品'),'the archive panel must not restate the current catalogue');
 for(const work of workEntries)for(const link of workArchiveLinks(work))assert.ok(archiveOnly.includes(`>${link.title}</a>`),`archive panel is missing ${link.title}`);
 for(const item of legacyOriginal)assert.ok(html.includes(`>${item.title}</a>`),`original story ${item.title} must stay reachable`);
 assert.ok(html.includes('>潮生有约 · V6</a>'),'the original main story keeps a link, just not the front page');
});

test('Card hooks are conflict lines, not encyclopaedia intros, and every work states who you play',()=>{
 for(const work of workEntries){
  assert.ok(work.hook.length>4&&work.hook.length<60,`${work.id} hook length ${work.hook.length}`);
  assert.ok(!work.hook.includes('命运的抉择'),`${work.id} uses a generic hook`);
  assert.ok(work.summary.includes('你'),`${work.id} summary must say who the player is`);
  assert.ok(work.era.length>2&&work.viewpoint.length>2,`${work.id} needs an era and a viewpoint`);
  assert.ok(['斗嘴为主','斗武为主','斗嘴与斗武'].includes(work.fight));
 }
});
