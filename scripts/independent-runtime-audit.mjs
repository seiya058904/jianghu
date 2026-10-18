import {readFileSync,writeFileSync,mkdirSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {VNRuntime} from '../src/vn-runtime.ts';
import {chronicleWorks} from '../src/chronicle-catalog.ts';
import {characters,scenes,cgs,resolvePortrait} from '../src/catalog.ts';

// Deterministic state-machine evidence, not exhaustive reachable-state proof or
// a substitute for literary review. Does not compile or modify historical data.
const out=process.env.JIANGHU_EVIDENCE_DIR?`${process.env.JIANGHU_EVIDENCE_DIR}/independent-final`:'docs/audits/independent-final';
mkdirSync(out,{recursive:true});
const editions=[...new Map(chronicleWorks.filter(w=>!/-v[12]$/.test(w.slug)).map(w=>[w.slug,w])).values()];
const walks=Number(process.env.INDEPENDENT_WALKS??600);
const usage=new Map(),works=[],causal=[];
const sha=data=>createHash('sha256').update(data).digest('hex');
function observe(slug,frame){
 const resources=[['background',frame.stage.scene,scenes[frame.stage.scene]?.art],
  ...frame.stage.cast.map(id=>['portrait',id,resolvePortrait(id,frame.stage.moods[id],frame.stage.looks?.[id])?.file]),
  ...(frame.stage.cg?[['cg',frame.stage.cg,cgs[frame.stage.cg]?.file]]:[])];
 for(const [kind,id,file] of resources){
  if(!file)throw Error(`Missing ${slug}:${frame.id}:${kind}:${id}`);
  const key=[slug,kind,id,file].join('|');
  const row=usage.get(key)??{slug,kind,id,file,beats:new Set(),looks:new Set()};
  row.beats.add(frame.id);if(kind==='portrait')row.looks.add(frame.stage.looks?.[id]??'default');usage.set(key,row);
 }
}
function follow(content,version,commands,choice){
 const s=new VNRuntime(content,version);
 for(const command of commands)command==='next'?s.advance():s.choose(command.slice(7));
 s.choose(choice);
 const first=s.frame.id;
 while(!s.frame.ending){if(s.commands.length>10000)throw Error('Path budget exceeded');s.frame.choices.length?s.choose(s.frame.choices[0].id):s.advance()}
 return{first,frames:s.frames.slice(commands.length+1),ending:s.frame.ending,commands:s.commands.filter(c=>c!=='next')};
}
for(const edition of editions){
 const raw=readFileSync(`src/generated/${edition.slug}.json`),content=JSON.parse(raw);
 const ink=readFileSync(`story/${edition.slug}.ink`,'utf8'),lines=ink.split('\n');
 const declared=[...new Set([...ink.matchAll(/# ending:(\S+)/g)].map(m=>m[1]))].sort();
 const reached=new Set(),seen=new Set(),tried=new Map(),choices=new Map();
 let longest=0,firstChoice=0,seed=0x12345678;
 for(let walk=0;walk<walks;walk++){
  const s=new VNRuntime(content,edition.version);let passive=0;
  while(true){
   seen.add(s.frame.id);observe(edition.slug,s.frame);
   if(s.frame.choices.length){
    if(!firstChoice)firstChoice=s.frames.length;
    passive=0;
    for(const c of s.frame.choices)if(!choices.has(c.id))choices.set(c.id,{choice:c,beat:s.frame.id,scene:s.frame.stage.scene,commands:[...s.commands],siblings:s.frame.choices.map(c=>c.id)});
   }else longest=Math.max(longest,++passive);
   if(s.frame.ending){reached.add(s.frame.ending);break}
   if(s.commands.length>10000)throw Error(`${edition.slug}: path budget exceeded`);
   if(s.frame.choices.length){
    const options=s.frame.choices,used=tried.get(s.frame.id)??new Set();tried.set(s.frame.id,used);
    // Avoid LCG low-bit alternation coupling every binary reply to the next.
    seed^=seed<<13;seed^=seed>>>17;seed^=seed<<5;seed>>>=0;
    const pick=options.find(c=>!used.has(c.id))??options[(seed>>>0)%options.length];used.add(pick.id);s.choose(pick.id);
   }else s.advance();
  }
 }
 const variables=[...ink.matchAll(/^VAR (\w+)\s*=\s*(.+)$/gm)].map(m=>{
  const name=m[1],uses=[];
  lines.forEach((text,i)=>{if(new RegExp(`\\b${name}\\b`).test(text)&&!/^\s*(VAR |~)/.test(text))uses.push({line:i+1,text:text.trim().slice(0,180)})});
  return{name,initial:m[2],reads:uses};
 });
 for(const [cid,row] of choices){
  const line=lines.findIndex(s=>s.includes(`# cid:${cid}]`));let effects=[];
  for(let i=line+1;i<lines.length&&/^\s*~/.test(lines[i]);i++)effects.push(lines[i].trim());
  const other=row.siblings.find(id=>id!==cid);
  const a=follow(content,edition.version,row.commands,cid),b=follow(content,edition.version,row.commands,other);
  const bm=new Map(b.frames.map(f=>[f.id,f]));
  const changes=a.frames.filter(f=>!bm.has(f.id)||bm.get(f.id).text!==f.text);
  const sharedChanges=a.frames.filter(f=>bm.has(f.id)&&bm.get(f.id).text!==f.text);
  const distant=changes.filter(f=>f.stage.scene!==row.scene);
  causal.push({slug:edition.slug,cid,sourceLine:line+1,beat:row.beat,effects,variables:effects.flatMap(t=>variables.filter(v=>new RegExp(`\\b${v.name}\\b`).test(t))),
   comparison:{otherCid:other,prefixChoices:row.commands.filter(c=>c!=='next'),suffixPolicy:'same first offered choice in each run',firstDivergence:changes[0]?{beat:changes[0].id,text:changes[0].text}:null,
    lastDifferentSharedBeat:sharedChanges.at(-1)?{beat:sharedChanges.at(-1).id,text:sharedChanges.at(-1).text}:null,
    lastDifferentSceneBeat:distant.at(-1)?{beat:distant.at(-1).id,text:distant.at(-1).text}:null,endings:[a.ending,b.ending]},
   assessment:'Observed text/state divergence only; literary significance requires the accompanying editorial review.'});
 }
 const authored=new Set([...ink.matchAll(/# beat:(\S+)/g)].map(m=>m[1]));
 works.push({slug:edition.slug,version:edition.version,contentSHA256:sha(raw),walks,firstChoice,longestPassiveIncludingEnding:longest,declaredEndings:declared,reachedEndings:[...reached].sort(),unreachedEndings:declared.filter(e=>!reached.has(e)),authoredBeats:authored.size,visitedBeats:seen.size,unvisitedBeats:[...authored].filter(b=>!seen.has(b)),choices:choices.size,variables: variables.length});
 console.log(`${edition.slug}: endings ${reached.size}/${declared.length}, beats ${seen.size}/${authored.size}, options ${choices.size}`);
}
const traces=[...usage.values()].map(row=>({...row,beats:[...row.beats],looks:[...row.looks]}));
for(const row of traces)if(!readFileSync(`public/art/${row.file}`).length)throw Error(`Empty resource ${row.file}`);
const meta={kind:'B_RUNTIME_NOT_BROWSER_OR_HUMAN_ACCEPTANCE',walksPerEdition:walks,coverage:'deterministic novelty-guided samples and per-observed-choice paired replay; not exhaustive all state combinations'};
writeFileSync(`${out}/runtime-coverage.json`,JSON.stringify({...meta,works},null,2)+'\n');
writeFileSync(`${out}/ART_USAGE_TRACE.json`,JSON.stringify({...meta,resources:traces},null,2)+'\n');
writeFileSync(`${out}/CHOICE_CAUSAL_AUDIT.json`,JSON.stringify({...meta,choices:causal},null,2)+'\n');
