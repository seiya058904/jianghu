// V7 opening-rhythm ledger — no browser.
//
// For every current edition it measures, straight from the compiled Ink:
//   * beats                 — authored `# beat:` count
//   * firstNpcBeat          — first beat spoken by anyone but the narrator
//   * firstPlayerBeat       — first beat tagged `# speaker:you`
//   * firstChoiceBeat       — ordinal of the beat carrying the first `# cid:`
//   * narratorRatio         — narrator beats / all beats (so dialogue ≈ 1 - this)
//   * longestPassiveRun     — longest run of beats without a `# cid:` choice
//
// The commission's §5.1/§8.2 gates are: a real interaction within the first
// 30–90 seconds (we read that as "first choice inside the opening beats") and
// dialogue near 65% in ordinary scenes. This script only *locates* those
// numbers; it is not a literary verdict, and `EDITORIAL_REVIEW_V7.md` must
// still argue each long passive run by hand.
import {readFileSync,writeFileSync,mkdirSync} from 'node:fs';
import {chronicleWorks} from '../src/chronicle-catalog.ts';

const prefix=/-(v1|v2)$/;
const slugOf=file=>file.replace(/\.html$/,'');
const current=[...new Set(chronicleWorks.map(work=>slugOf(work.file)))].filter(slug=>!prefix.test(slug)).sort();

const rows=[];
for(const slug of current){
  let text='';
  try{text=readFileSync(`story/${slug}.ink`,'utf8')}catch{rows.push({slug,missing:true});continue}
  const lines=text.split(/\r?\n/);
  let beats=0,firstNpc=0,firstPlayer=0,firstChoice=0,narrator=0,passive=0,longest=0;
  for(const line of lines){
    const beat=line.match(/# beat:([A-Za-z0-9_]+)/);
    if(beat){
      beats++;
      const speaker=line.match(/# speaker:([a-z_]+)/)?.[1]??'?';
      if(speaker==='narrator')narrator++;
      if(speaker!=='narrator'&&!firstNpc)firstNpc=beats;
      if(speaker==='you'&&!firstPlayer)firstPlayer=beats;
    }
    if(line.match(/# cid:([A-Za-z0-9_]+)/)){
      if(!firstChoice)firstChoice=beats;
      passive=0;
    }else if(beat){
      passive++;
      if(passive>longest)longest=passive;
    }
  }
  rows.push({slug,beats,firstNpcBeat:firstNpc,firstPlayerBeat:firstPlayer,firstChoiceBeat:firstChoice,
    narratorBeats:narrator,narratorRatio:Number((narrator/beats).toFixed(4)),
    dialogueRatio:Number(((beats-narrator)/beats).toFixed(4)),longestPassiveRun:longest});
}

const dialogueAtLeast65=rows.filter(row=>row.dialogueRatio>=0.65).map(row=>row.slug);
const firstChoiceWithin8=rows.filter(row=>row.firstChoiceBeat<=8).map(row=>row.slug);
const report={generatedBy:'node --experimental-strip-types scripts/audit-v7-opening.mjs',
  currentEditions:current.length,rows,
  summary:{dialogueAtLeast65,firstChoiceWithin8,
    longestPassiveRunMax:Math.max(...rows.map(row=>row.longestPassiveRun)),
    dialogueRatioMin:Math.min(...rows.map(row=>row.dialogueRatio))}};

mkdirSync('docs/evidence/v7',{recursive:true});
writeFileSync('docs/evidence/v7/opening-rhythm.json',`${JSON.stringify(report,null,1)}\n`);
console.log(`opening rhythm: ${rows.length} current editions`);
console.log(`first choice within 8 beats: ${firstChoiceWithin8.length}/${rows.length}`);
console.log(`dialogue >= 65%: ${dialogueAtLeast65.length}/${rows.length} (${dialogueAtLeast65.join(', ')||'none'})`);
console.log(`longest passive run across all works: ${report.summary.longestPassiveRunMax} beats`);
