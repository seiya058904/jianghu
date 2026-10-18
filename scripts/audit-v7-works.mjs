import {evidencePath} from '../tests/evidence-path.ts';
// V7 works + canon-coverage audit.
// Reads the canonical work registry (src/chronicle-catalog.ts) and the author
// sources (story/*.ink) with no browser, then writes two ledgers:
//   docs/evidence/v7/works-ledger.json       — every registered edition
//   docs/evidence/v7/works-current.json      — current editions only
// Run: node --experimental-strip-types scripts/audit-v7-works.mjs
import {readFileSync,writeFileSync,mkdirSync,existsSync} from 'node:fs';
import {chronicleWorks} from '../src/chronicle-catalog.ts';
import {chronicleCharacters} from '../src/chronicle-catalog.ts';



function inkStats(file){
  const path=`story/${file}.ink`;
  if(!existsSync(path))return null;
  const text=readFileSync(path,'utf8');
  const uniq=(pattern)=>new Set([...text.matchAll(pattern)].map(match=>match[1]));
  const beats=uniq(/# beat:([A-Za-z0-9_]+)/g);
  const choices=uniq(/# cid:([A-Za-z0-9_]+)/g);
  const endings=uniq(/# ending:([A-Za-z0-9_]+)/g);
  const scenes=uniq(/# scene:([A-Za-z0-9_]+)/g);
  const cast=uniq(/# cast:([A-Za-z0-9_,]+)/g).size;
  // Longest run of consecutive beats that offer no player choice is measured on
  // the author source order, which is the same order the speaker reads.
  let longest=0,run=0;
  for(const line of text.split('\n')){
    // A choice line is `* [text # cid:…]`: the option itself is the reset point,
    // and the beats between two choice lines are the passive stretch.
    if(/^\s*[*+]/.test(line)){run=0;continue}
    if(!/# beat:/.test(line))continue;
    run++;if(run>longest)longest=run;
  }
  return {beats:beats.size,choices:choices.size,endings:endings.size,scenes:scenes.size,playableCast:cast,longestPassiveRun:longest,sourceBytes:Buffer.byteLength(text,'utf8')};
}

const ledger=[];
for(const work of chronicleWorks){
  const stats=inkStats(work.slug);
  const cast=new Set();
  for(const match of readFileSync(`story/${work.slug}.ink`,'utf8').matchAll(/# cast:([^#\r\n]+)/g))
    for(const id of match[1].trim().split(','))if(id&&id!=='none')cast.add(id);
  const dedicated=[...cast].filter(id=>chronicleCharacters[id]?.portrait?.kind==='dedicated');
  ledger.push({
    slug:work.slug,file:work.file,title:work.title,version:work.version,prefix:work.prefix,
    viewpoints:work.viewpoint,note:work.note,coverArt:work.coverArt??null,
    declaredChapters:work.chapters?.length??0,declaredEndings:work.endingCount??stats?.endings??null,
    stats,cast:cast.size,dedicatedCast:dedicated.length,
  });
}
const current=ledger.filter(row=>!/-(v1|v2|v3|v4|v5)$/.test(row.slug));

writeFileSync(evidencePath('docs/evidence/v7/works-ledger.json'),JSON.stringify({
  generatedBy:'node --experimental-strip-types scripts/audit-v7-works.mjs',
  editions:ledger.length,currentEditions:current.length,
  rows:ledger,
},null,2)+'\n');
writeFileSync(evidencePath('docs/evidence/v7/works-current.json'),JSON.stringify({current},null,2)+'\n');

console.log(`Registered editions: ${ledger.length}`);
for(const row of ledger)
  console.log(`  ${row.slug.padEnd(20)} ${String(row.stats?.beats??'-').padStart(4)} beats/${String(row.stats?.choices??'-').padStart(3)} options/${String(row.stats?.endings??'-')} endings  cast ${String(row.cast).padStart(3)} (dedicated ${row.dedicatedCast})  longest passive run ${row.stats?.longestPassiveRun??'-'}`);
console.log(`Current editions: ${current.length}`);
