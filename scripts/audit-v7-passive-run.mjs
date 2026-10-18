// V7 real passive-run measurement — no browser, but it does walk the runtime.
//
// `works-ledger.json` measures the longest run of beats without a `# cid:` by a
// linear scan of the Ink source. That overcounts: Ink `{cond: a | b}` blocks put
// two mutually exclusive beats next to each other, so a single playthrough never
// sees the concatenated total. This script walks the actual runtime instead and
// reports, per current edition, the longest stretch of advances the player can
// really be forced through before a choice appears.
//
// It samples many playthroughs (deterministic seed) and reports the observed
// maximum and median, plus the frame where the maximum occurred.
import {readFileSync,writeFileSync,mkdirSync} from 'node:fs';
import {VNRuntime} from '../src/vn-runtime.ts';
import {chronicleWorks} from '../src/chronicle-catalog.ts';

const SAMPLES=Number(process.env.V7_SAMPLES??240);
const prefix=/-(v1|v2)$/;
const slugOf=file=>file.replace(/\.html$/,'');
const editions=[...new Map(chronicleWorks.map(work=>[slugOf(work.file),work])).values()]
  .filter(work=>!prefix.test(work.slug)).sort((a,b)=>a.slug.localeCompare(b.slug));

// xorshift32 so every run of this script samples the same paths.
let seed=0x9e3779b9;
const rnd=()=>{seed^=seed<<13;seed^=seed>>>17;seed^=seed<<5;return (seed>>>0)/4294967296};

const rows=[];
for(const edition of editions){
  let content;
  try{content=JSON.parse(readFileSync(`src/generated/${edition.slug}.json`,'utf8'))}catch{rows.push({slug:edition.slug,missing:true});continue}
  const runs=[];
  for(let sample=0;sample<SAMPLES;sample++){
    const state=new VNRuntime(content,edition.version);
    let passive=0,longest=0,longestAt='',steps=0;
    while(!state.frame.ending&&steps<20000){
      steps++;
      if(state.frame.choices.length){
        if(passive>longest){longest=passive;longestAt=state.frame.id}
        passive=0;
        const choices=state.frame.choices;
        state.choose(choices[Math.floor(rnd()*choices.length)].id);
      }else{
        passive++;
        state.advance();
      }
    }
    if(passive>longest){longest=passive;longestAt=state.frame.id}
    runs.push({longest,longestAt});
  }
  const values=runs.map(run=>run.longest).sort((a,b)=>a-b);
  const worst=runs.reduce((a,b)=>b.longest>a.longest?b:a);
  rows.push({slug:edition.slug,samples:SAMPLES,
    maxPassiveRun:values[values.length-1],medianPassiveRun:values[Math.floor(values.length/2)],
    maxAt:worst.longestAt});
}

const atOrUnder20=rows.filter(row=>!row.missing&&row.maxPassiveRun<=20).map(row=>row.slug);
const report={generatedBy:'node --experimental-strip-types scripts/audit-v7-passive-run.mjs',
  samplesPerEdition:SAMPLES,rows,
  summary:{maxPassiveRunOverall:Math.max(...rows.filter(r=>!r.missing).map(r=>r.maxPassiveRun)),
    withinTwentyBeats:atOrUnder20,overTwentyBeats:rows.filter(r=>!r.missing&&r.maxPassiveRun>20).map(r=>`${r.slug}:${r.maxPassiveRun}`)}};

mkdirSync('docs/evidence/v7',{recursive:true});
writeFileSync('docs/evidence/v7/passive-run.json',`${JSON.stringify(report,null,1)}\n`);
for(const row of rows)console.log(`${row.slug.padEnd(18)} max ${String(row.maxPassiveRun).padStart(3)}  median ${String(row.medianPassiveRun).padStart(3)}  at ${row.maxAt}`);
console.log(`\nover 20 beats (real paths): ${report.summary.overTwentyBeats.join(', ')||'none'}`);
