// V7 orphan-variable audit — the §2.5 / §8.2 half a machine can decide honestly.
//
// §8.2 asks, per work, whether "a choice's options differ immediately AND later".
// The commission's existing boring-probes script answers a *different* question:
// whether taking an option changed `variablesState` at all — and Ink's
// variablesState omits globals that were never assigned, so `~ x = false`
// (writing an already-default value back) reads as "changed nothing". That makes
// `alwaysSilentChoices` unusable as a verdict on later divergence.
//
// The decidable question is this one:
//
//   A variable that is *assigned* by an option but *never read* by any condition
//   can never change a later beat. Every option setting only such variables has
//   immediate text and no downstream consequence.
//
// This script reports, per edition, every VAR that is declared and assigned but
// never appears outside its own `VAR x = …` header and `~ x = …` assignments.
//
// It does not judge whether the *prose* is good. It only refuses to let
// "each option writes a variable" be mistaken for "each option has a payoff".
import {readFileSync,writeFileSync,mkdirSync} from 'node:fs';
import {chronicleWorks} from '../src/chronicle-catalog.ts';

const prefix=/-(v1|v2)$/;
const editions=[...new Map(chronicleWorks.map(work=>[work.file.replace(/\.html$/,''),work])).values()]
  .filter(work=>!prefix.test(work.slug)).sort((a,b)=>a.slug.localeCompare(b.slug));

const rows=[];
for(const edition of editions){
  const path=`story/${edition.slug}.ink`;
  let source;
  try{source=readFileSync(path,'utf8')}
  catch{rows.push({slug:edition.slug,missing:true});continue}

  const declared=[...source.matchAll(/^\s*VAR\s+(\w+)/gm)].map(m=>m[1]);
  // Everything that is not a declaration and not a bare assignment is "read
  // position": option gates `{x: …}`, `{x and y: …}`, ending conditionals.
  const readPosition=source.split('\n')
    .filter(line=>!/^\s*VAR\s/.test(line)&&!/^\s*~\s*\w+\s*=/.test(line))
    .join('\n');
  const orphan=declared.filter(name=>!new RegExp(`\\b${name}\\b`).test(readPosition));

  rows.push({slug:edition.slug,title:edition.title,declared:declared.length,
    readInCondition:declared.length-orphan.length,orphanCount:orphan.length,orphan});
}

const withData=rows.filter(r=>!r.missing);
const report={generatedBy:'node --experimental-strip-types scripts/audit-v7-orphan-vars.mjs',
  judgement:'orphan = declared + assigned by at least one option, but never read by any condition, so its value can never change a later beat',
  rows,
  summary:{
    editions:withData.length,
    totalDeclared:withData.reduce((n,r)=>n+r.declared,0),
    totalOrphan:withData.reduce((n,r)=>n+r.orphanCount,0),
    worst:withData.slice().sort((a,b)=>b.orphanCount-a.orphanCount).slice(0,6).map(r=>`${r.slug}:${r.orphanCount}/${r.declared}`),
  }};

mkdirSync('docs/evidence/v7',{recursive:true});
writeFileSync('docs/evidence/v7/orphan-vars.json',`${JSON.stringify(report,null,1)}\n`);
for(const row of withData)console.log(`${row.slug.padEnd(16)} VAR ${String(row.declared).padStart(3)}  read-by-condition ${String(row.readInCondition).padStart(3)}  ORPHAN ${String(row.orphanCount).padStart(3)}  ${row.orphan.join(',')}`);
console.log(`\ntotal VAR ${report.summary.totalDeclared}; total orphan ${report.summary.totalOrphan}; worst ${report.summary.worst.join(' | ')}`);
