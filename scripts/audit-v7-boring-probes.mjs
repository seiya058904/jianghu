import {evidencePath} from '../tests/evidence-path.ts';
// V7 "boring audit" probes — the two §8.2 items a machine can actually decide.
//
// The commission's §8.2 list asks, per work, for (among other things):
//   - beats that are pure exposition / catchphrases / repeated semantics / carry
//     no new information;
//   - whether a choice's options differ *immediately* and *later*.
//
// Two of those are decidable without a human, and this script decides them
// honestly rather than heuristically guessing "boring":
//
//   repeatedBeatTexts  — the same line of dialogue/narration appearing more than
//                        once inside one work (catchphrase OR accidental copy).
//                        Reported with beat ids so an editor can judge which it is.
//   flatChoiceGroups   — a choice where the very next beat is *byte-identical*
//                        for two or more replies, i.e. the options visibly do
//                        nothing in the moment. Later divergence is NOT measured
//                        here; that is the payoff ledger's job.
//
// `noLaterDivergence` walks a sample of playthroughs and records choices whose
// taken reply never changed any variable (`variablesState`) — a hint, not a
// verdict, because Ink may branch purely on `visits`.
import {readFileSync,writeFileSync,mkdirSync} from 'node:fs';
import {VNRuntime} from '../src/vn-runtime.ts';
import {chronicleWorks} from '../src/chronicle-catalog.ts';

const SAMPLES=Number(process.env.V7_SAMPLES??120);
const prefix=/-(v1|v2)$/;
const slugOf=file=>file.replace(/\.html$/,'');
const editions=[...new Map(chronicleWorks.map(work=>[slugOf(work.file),work])).values()]
  .filter(work=>!prefix.test(work.slug)).sort((a,b)=>a.slug.localeCompare(b.slug));

let seed=0x165667b1;
const rnd=()=>{seed^=seed<<13;seed^=seed>>>17;seed^=seed<<5;return (seed>>>0)/4294967296};

const rows=[];
for(const edition of editions){
  let content;
  try{content=JSON.parse(readFileSync(`src/generated/${edition.slug}.json`,'utf8'))}
  catch{rows.push({slug:edition.slug,missing:true});continue}

  // --- pass 1: repeated beat text (collect every beat once, per work) ---
  const seen=new Map();
  {
    const state=new VNRuntime(content,edition.version);
    let steps=0;
    while(!state.frame.ending&&steps<20000){
      steps++;
      const f=state.frame;
      const key=f.text.trim();
      if(key)seen.set(key,(seen.get(key)??[]).concat(f.id));
      if(f.choices.length)state.choose(f.choices[0].id);else state.advance();
    }
  }
  const repeated=[...seen.entries()].filter(([,ids])=>ids.length>1)
    .map(([text,ids])=>({ids,count:ids.length,text:text.slice(0,90)}))
    .sort((a,b)=>b.count-a.count);

  // --- pass 2: flat choices + variable-silent choices ---
  const flat=new Map();          // frameId -> [{choices,nextText}]
  const silent=new Map();        // cid -> count of times it changed nothing
  const taken=new Map();         // cid -> times taken
  for(let sample=0;sample<SAMPLES;sample++){
    const state=new VNRuntime(content,edition.version);
    let steps=0;
    while(!state.frame.ending&&steps<20000){
      steps++;
      const f=state.frame;
      if(f.choices.length){
        // NOTE: save().runtime is a JSON *string* (story.state.ToJson()), not an
        // object — the codebase reads variablesState via JSON.parse(save.runtime).
        // Comparing `save().runtime.variablesState` directly yields undefined for
        // both sides and silently reports every reply as "changed nothing".
        const before=JSON.parse(state.save().runtime).variablesState;
        const cd=f.choices[Math.floor(rnd()*f.choices.length)];
        state.choose(cd.id);
        const after=JSON.parse(state.save().runtime).variablesState;
        taken.set(cd.id,(taken.get(cd.id)??0)+1);
        if(JSON.stringify(before)===JSON.stringify(after))silent.set(cd.id,(silent.get(cd.id)??0)+1);
        // what does the reader see immediately after each reply?
        const bucket=flat.get(f.id)??new Map();
        flat.set(f.id,bucket);
        const next=state.frame.text.trim();
        bucket.set(cd.id,next);
      }else state.advance();
    }
  }
  const flatGroups=[];
  for(const [frameId,byChoice] of flat){
    const texts=new Map();
    for(const [cid,text] of byChoice)texts.set(text,(texts.get(text)??[]).concat(cid));
    for(const [text,cids] of texts)if(cids.length>1)
      flatGroups.push({frameId,replies:cids,nextText:text.slice(0,80)});
  }
  const alwaysSilent=[...taken.entries()]
    .filter(([cid,n])=>silent.get(cid)===n&&n>=5).map(([cid,n])=>({cid,taken:n}))
    .sort((a,b)=>b.taken-a.taken);

  rows.push({slug:edition.slug,title:edition.title,version:edition.version,samples:SAMPLES,
    repeatedBeatTexts:repeated,repeatedCount:repeated.length,
    flatChoiceGroups:flatGroups,flatCount:flatGroups.length,
    alwaysSilentChoices:alwaysSilent,silentCount:alwaysSilent.length});
}

const withData=rows.filter(r=>!r.missing);
const report={generatedBy:'node --experimental-strip-types scripts/audit-v7-boring-probes.mjs',
  samplesPerEdition:SAMPLES,rows,
  summary:{
    editions:withData.length,
    worksWithRepeatedText:withData.filter(r=>r.repeatedCount).map(r=>`${r.slug}:${r.repeatedCount}`),
    worksWithFlatChoices:withData.filter(r=>r.flatCount).map(r=>`${r.slug}:${r.flatCount}`),
    worksWithSilentChoices:withData.filter(r=>r.silentCount).map(r=>`${r.slug}:${r.silentCount}`),
  }};


writeFileSync(evidencePath('docs/evidence/v7/boring-probes.json'),`${JSON.stringify(report,null,1)}\n`);
for(const row of withData)console.log(`${row.slug.padEnd(16)} repeatedTexts ${String(row.repeatedCount).padStart(3)}  flatChoiceGroups ${String(row.flatCount).padStart(3)}  alwaysSilentChoices ${String(row.silentCount).padStart(3)}`);
console.log(`\nrepeated text: ${report.summary.worksWithRepeatedText.join(' | ')||'none'}`);
console.log(`flat choices: ${report.summary.worksWithFlatChoices.join(' | ')||'none'}`);
