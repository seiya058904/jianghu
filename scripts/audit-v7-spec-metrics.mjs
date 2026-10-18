// V7 剧本指标审计 —— 拍数 / 发言者构成 / 双人拍 / 旁白占比。
//
// 为什么需要它：`docs/evidence/v7/*.json` 里的比例数字必须能一键复现，
// 否则「旁白占比从 60.0% 降到 58.7%」这类结论无法被复核。
//
// 用法：
//   node scripts/audit-v7-spec-metrics.mjs                 # 全库 23 个现行篇，输出 JSON + 表格
//   node scripts/audit-v7-spec-metrics.mjs luhua           # 单篇
//   node scripts/audit-v7-spec-metrics.mjs luhua --before  # 与 `git show HEAD:story/luhua.ink` 对照
//
// 口径（写死，免得每次改）：
//   beats      `# beat:` 出现次数
//   you / npc / narrator   该拍 `# speaker:` 的归属；`narrator` 为旁白
//   twoHander  `# cast:` >=2 且该拍有具体发言者（旁白不算"面对面"）
//   narShare   旁白 / (you+npc+narrator)
import {readFileSync,existsSync} from 'node:fs';
import {execFileSync} from 'node:child_process';
import {chronicleWorks} from '../src/chronicle-catalog.ts';

const measure=(inkPath,label)=>{
  const src=readFileSync(inkPath,'utf8');
  let beats=0,you=0,npc=0,narrator=0,twoHander=0;const ids=[];
  for(const line of src.split(/\r?\n/)){
    const b=line.match(/#\s*beat:\s*(\S+)/);
    if(!b)continue;
    beats++;ids.push(b[1]);
    const sp=(line.match(/#\s*speaker:\s*(\S+)/)||[])[1]??'';
    if(sp==='you')you++;else if(sp==='narrator'||sp==='n')narrator++;else npc++;
    const castRaw=(line.match(/#\s*cast:\s*([^#]*)/)||[])[1];
    const cast=castRaw&&castRaw.trim()?castRaw.trim().split(/\s*,\s*/):[];
    if(cast.length>=2&&sp!=='narrator'&&sp!=='n')twoHander++;
  }
  const total=you+npc+narrator;
  return {label,beats,you,npc,narrator,twoHander,
    narShare:`${(narrator/total*100).toFixed(1)}%`,
    dialogueShare:`${((you+npc)/total*100).toFixed(1)}%`,
    firstBeat:ids[0]??null,lastBeat:ids.at(-1)??null};
};

const beforeOf=slug=>{
  try{return execFileSync('git',['show',`HEAD:story/${slug}.ink`],{encoding:'utf8',maxBuffer:64*1024*1024})}
  catch{return null}
};

const arg=process.argv[2];
const withBefore=process.argv.includes('--before');
const slugs=arg?[arg]:[...new Set(chronicleWorks.map(work=>work.file.replace(/\.html$/,'')))].sort();

const rows=[];
for(const slug of slugs){
  const path=`story/${slug}.ink`;
  if(!existsSync(path)){console.error(`skip ${slug}: ${path} 不存在`);continue}
  const after=measure(path,slug);
  if(withBefore){
    const raw=beforeOf(slug);
    if(raw){
      const tmp=`.tmp-${slug}-before.ink`;
      const {writeFileSync,unlinkSync}=await import('node:fs');
      writeFileSync(tmp,raw);
      const before=measure(tmp,`${slug}(HEAD)`);
      unlinkSync(tmp);
      console.log(`${slug.padEnd(16)} BEFORE ${JSON.stringify(before)}`);
      console.log(`${slug.padEnd(16)} AFTER  ${JSON.stringify(after)}`);
      rows.push({slug,label:slug,before,after});
      continue;
    }
  }
  rows.push(after);
}
if(!withBefore){
  for(const r of rows)console.log(
    `${r.label.padEnd(16)} beats ${String(r.beats).padStart(4)}  you ${String(r.you).padStart(3)}  npc ${String(r.npc).padStart(3)}  narrator ${String(r.narrator).padStart(4)}  twoHander ${String(r.twoHander).padStart(4)}  narShare ${r.narShare}  dialogue ${r.dialogueShare}`);
}
console.log(JSON.stringify(rows));
