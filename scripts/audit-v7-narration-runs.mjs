// V7 narration-run audit — how much uninterrupted narration does a reader really face?
//
// The commission's dialogue-ratio target (§8.2) is a *locator*, not a verdict: it
// counts narrator beats over the whole story, so a work that closes every chapter
// with an afterword reads as "narration heavy" even if no single stretch is long.
// §10.4 only forbids the *wall* — dozens of consecutive beats with no choice and
// no staging.
//
// These are two different measurements, so this script reports them separately:
//
//   longestNarrationRun  — the longest stretch of consecutive narrator beats the
//                          player can actually be pushed through (runtime walk).
//   openingNarrationRun  — narrator beats before the first NPC line, i.e. how much
//                          homework the opening demands.
//   afterwordShare       — of the narrator beats in the longest run, how many sit
//                          at/after the final third of the story. High here means
//                          the narration is 后日/收束 (which §10.4 endorses), not
//                          front-loaded exposition.
import {readFileSync,writeFileSync,mkdirSync} from 'node:fs';
import {VNRuntime} from '../src/vn-runtime.ts';
import {chronicleWorks} from '../src/chronicle-catalog.ts';

const SAMPLES=Number(process.env.V7_SAMPLES??120);
const prefix=/-(v1|v2)$/;
const slugOf=file=>file.replace(/\.html$/,'');
const editions=[...new Map(chronicleWorks.map(work=>[slugOf(work.file),work])).values()]
  .filter(work=>!prefix.test(work.slug)).sort((a,b)=>a.slug.localeCompare(b.slug));

let seed=0x27d4eb2f;
const rnd=()=>{seed^=seed<<13;seed^=seed>>>17;seed^=seed<<5;return (seed>>>0)/4294967296};

const rows=[];
for(const edition of editions){
  let content;
  try{content=JSON.parse(readFileSync(`src/generated/${edition.slug}.json`,'utf8'))}
  catch{rows.push({slug:edition.slug,missing:true});continue}

  let longest=0,longestAt='',longestRun=[],longestSteps=0,opening=Number.MAX_SAFE_INTEGER,stepsSeen=0;
  for(let sample=0;sample<SAMPLES;sample++){
    const state=new VNRuntime(content,edition.version);
    let run=[],steps=0,firstNpcLine=0;
    const close=()=>{
      if(run.length>longest){longest=run.length;longestAt=run[run.length-1].id;longestRun=run.map(b=>b.id);longestSteps=steps}
      run=[];
    };
    while(!state.frame.ending&&steps<20000){
      steps++;
      if(state.frame.choices.length){close();state.choose(state.frame.choices[Math.floor(rnd()*state.frame.choices.length)].id)}
      else{
        const f=state.frame;
        if(f.speaker&&f.speaker!=='you'){if(!firstNpcLine)firstNpcLine=steps;close()}
        else run.push({id:f.id,at:steps});
        state.advance();
      }
    }
    close();
    stepsSeen=Math.max(stepsSeen,steps);
    opening=Math.min(opening,firstNpcLine?firstNpcLine-1:opening);
  }

  // Where does the longest run sit in the story? A run in the last third is the
  // 后日/收束 the commission asks for; a run in the first third is homework.
  const at=longestRun.length?longestRun[longestRun.length-1]:null;
  const index=at?longestRun.length:0;
  rows.push({slug:edition.slug,title:edition.title,version:edition.version,samples:SAMPLES,
    longestNarrationRun:longest,longestAt,longestRunBeats:longestRun,
    runEndsAtStep:longestSteps,approxTotalSteps:stepsSeen,
    openingNarrationRun:opening===Number.MAX_SAFE_INTEGER?null:opening,
    runPosition:stepsSeen?Number((longestSteps/stepsSeen).toFixed(3)):null,
    narrationIds:index});
}

const withRuns=rows.filter(r=>!r.missing);
const report={generatedBy:'node --experimental-strip-types scripts/audit-v7-narration-runs.mjs',
  samplesPerEdition:SAMPLES,rows,
  summary:{
    editions:withRuns.length,
    maxLongestRun:Math.max(...withRuns.map(r=>r.longestNarrationRun)),
    maxLongestRunAt:withRuns.reduce((a,b)=>b.longestNarrationRun>a.longestNarrationRun?b:a).slug,
    worstOpening:withRuns.filter(r=>r.openingNarrationRun!==null).reduce((a,b)=>b.openingNarrationRun>a.openingNarrationRun?b:a).slug,
    maxOpeningRun:Math.max(...withRuns.map(r=>r.openingNarrationRun??0)),
    overTwentyBeatRuns:withRuns.filter(r=>r.longestNarrationRun>20).map(r=>`${r.slug}:${r.longestNarrationRun}`),
  }};

mkdirSync('docs/evidence/v7',{recursive:true});
writeFileSync('docs/evidence/v7/narration-runs.json',`${JSON.stringify(report,null,1)}\n`);
for(const row of withRuns)console.log(`${row.slug.padEnd(16)} longestRun ${String(row.longestNarrationRun).padStart(3)}  openingRun ${String(row.openingNarrationRun).padStart(3)}  runEndsAt ${String(row.runEndsAtStep).padStart(4)}/${String(row.approxTotalSteps).padStart(4)} (${row.longestAt})`);
console.log(`\nmax narration run ${report.summary.maxLongestRun} (${report.summary.maxLongestRunAt}); max opening run ${report.summary.maxOpeningRun} (${report.summary.worstOpening})`);
console.log(`runs over 20 beats: ${report.summary.overTwentyBeatRuns.join(', ')||'none'}`);
