// V7 ending coverage — which declared endings can a real reader actually settle on?
//
// The commission (§10.2) forbids claiming "we seeded 120 replays so every node was
// visited". Seeded replay only proves the nodes *it happened to touch*. So this
// script does two separate things and keeps them apart:
//
//   declared  = every `# ending:<name>` tag present in the compiled story.
//   reached   = the endings actually settled on by deterministic, novelty-guided
//               walks of the real VNRuntime (prefer an untried reply at each
//               frame, so coverage grows instead of plateauing).
//
// An ending that is declared but never reached in N walks is reported as such —
// it is *not* silently counted as covered.
import {readFileSync,writeFileSync,mkdirSync} from 'node:fs';
import {VNRuntime} from '../src/vn-runtime.ts';
import {chronicleWorks} from '../src/chronicle-catalog.ts';

const WALKS=Number(process.env.V7_WALKS??600);
const prefix=/-(v1|v2)$/;
const slugOf=file=>file.replace(/\.html$/,'');
const editions=[...new Map(chronicleWorks.map(work=>[slugOf(work.file),work])).values()]
  .filter(work=>!prefix.test(work.slug)).sort((a,b)=>a.slug.localeCompare(b.slug));

let seed=0x2545f491;
const rnd=()=>{seed^=seed<<13;seed^=seed>>>17;seed^=seed<<5;return (seed>>>0)/4294967296};

const rows=[];
for(const edition of editions){
  let raw,content;
  try{raw=readFileSync(`src/generated/${edition.slug}.json`,'utf8');content=JSON.parse(raw)}
  catch{rows.push({slug:edition.slug,missing:true});continue}

  const declared=[...new Set([...raw.matchAll(/ending:([A-Za-z0-9_]+)/g)].map(m=>m[1]))].sort();

  // Novelty map is per edition: frame id -> set of reply ids already tried.
  const tried=new Map();
  const reached=new Map();
  // Three different "when does this story come alive" probes, kept separate so
  // no single weak proxy can be mistaken for the others:
  //   firstNpcLineStep  — an NPC actually says something (speaker !== you)
  //   firstTwoHanderStep— an NPC speaks while two or more people are on stage
  //                       (a real face-to-face, not a lone voice in narration)
  //   firstNpcActionStep— an NPC line that also carries an explicit `# action:`
  //                       tag. Zero here means the story stages movement by other
  //                       means, NOT that nothing happens.
  let firstChoiceStep=0,firstNpcLineStep=0,firstTwoHanderStep=0,firstNpcActionStep=0,unsettled=0;

  for(let walk=0;walk<WALKS;walk++){
    const state=new VNRuntime(content,edition.version);
    let steps=0;
    while(!state.frame.ending&&steps<20000){
      steps++;
      if(state.frame.choices.length){
        if(!firstChoiceStep)firstChoiceStep=steps;
        const id=state.frame.id;
        const seen=tried.get(id)??new Set();
        tried.set(id,seen);
        const fresh=state.frame.choices.filter(c=>!seen.has(c.id));
        const pick=fresh.length?fresh[0]:state.frame.choices[Math.floor(rnd()*state.frame.choices.length)];
        seen.add(pick.id);
        state.choose(pick.id);
      }else{
        const speaker=state.frame.speaker;
        if(speaker&&speaker!=='you'){
          if(!firstNpcLineStep)firstNpcLineStep=steps;
          if(!firstTwoHanderStep&&state.frame.stage.cast.length>=2)firstTwoHanderStep=steps;
          if(!firstNpcActionStep&&state.frame.action)firstNpcActionStep=steps;
        }
        state.advance();
      }
    }
    if(!state.frame.ending){unsettled++;continue}
    reached.set(state.frame.ending,(reached.get(state.frame.ending)??0)+1);
  }

  const reachedList=[...reached.keys()].sort();
  const unreached=declared.filter(name=>!reached.has(name));
  const extra=reachedList.filter(name=>!declared.includes(name));
  rows.push({slug:edition.slug,title:edition.title,version:edition.version,walks:WALKS,
    declaredCount:declared.length,reachedCount:reachedList.length,
    declared,reached:reachedList,unreached,extra,
    firstChoiceStep,firstNpcLineStep,firstTwoHanderStep,firstNpcActionStep,unsettledWalks:unsettled});
}

const complete=rows.filter(r=>!r.missing&&r.unreached.length===0).map(r=>r.slug);
const report={generatedBy:'node --experimental-strip-types scripts/audit-v7-ending-coverage.mjs',
  walksPerEdition:WALKS,rows,
  summary:{
    editions:rows.filter(r=>!r.missing).length,
    declaredTotal:rows.filter(r=>!r.missing).reduce((sum,r)=>sum+r.declaredCount,0),
    reachedTotal:rows.filter(r=>!r.missing).reduce((sum,r)=>sum+r.reachedCount,0),
    fullyCovered:complete,
    withUnreached:rows.filter(r=>!r.missing&&r.unreached.length).map(r=>`${r.slug}:${r.unreached.join('+')}`),
    unsettled:rows.filter(r=>!r.missing&&r.unsettledWalks).map(r=>`${r.slug}:${r.unsettledWalks}`),
  }};

mkdirSync('docs/evidence/v7',{recursive:true});
writeFileSync('docs/evidence/v7/ending-coverage.json',`${JSON.stringify(report,null,1)}\n`);
for(const row of rows){
  if(row.missing){console.log(`${row.slug.padEnd(16)} MISSING compiled story`);continue}
  console.log(`${row.slug.padEnd(16)} ${String(row.reachedCount).padStart(2)}/${String(row.declaredCount).padStart(2)} endings  choice@${String(row.firstChoiceStep).padStart(3)}  npcLine@${String(row.firstNpcLineStep).padStart(3)}  twoHander@${String(row.firstTwoHanderStep).padStart(3)}  npcAction@${String(row.firstNpcActionStep).padStart(3)}  ${row.unreached.length?`UNREACHED ${row.unreached.join(',')}`:'all reached'}`);
}
console.log(`\ndeclared ${report.summary.declaredTotal} / reached ${report.summary.reachedTotal} (${WALKS} walks each)`);
console.log(`unreached somewhere: ${report.summary.withUnreached.join(' | ')||'none'}`);
