import {readFileSync,writeFileSync,mkdirSync,readdirSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {VNRuntime,VN_CONTENT_VERSION} from '../src/vn-runtime.ts';
import {characters,scenes,cgs,resolvePortrait} from '../src/catalog.ts';
import {chronicleWorks} from '../src/chronicle-catalog.ts';
import {campaignRoutes,pickChoice} from '../tests/campaign-routes.ts';

// Inventory evidence, not a literary or aesthetic acceptance test. No source or
// image mutation; archived JSON is read directly, never recompiled here.
const samples=168,assets=new Map();
function fileEntry(file){if(!assets.has(file))assets.set(file,{file,registrations:[],observations:new Map()});return assets.get(file)}
function register(file,data){if(file)fileEntry(file).registrations.push(data)}
for(const [id,s]of Object.entries(scenes))register(s.art,{kind:'scene',id,name:s.name,time:s.time});
for(const [id,c]of Object.entries(cgs))register(c.file,{kind:'cg',id,title:c.title,work:c.work});
for(const [id,p]of Object.entries(characters)){
 const common={kind:'portrait',id,canonicalIdentity:p.canonicalIdentity??id,name:p.name,role:p.role,detail:p.detail,identityKind:p.portrait.kind??'legacy-sheet'};
 register(p.portrait.file,{...common,look:'default',mood:'neutral'});
 for(const [mood,file]of Object.entries(p.portrait.moods??{}))register(file,{...common,look:'default',mood});
 for(const [look,data]of Object.entries(p.portrait.looks??{})){
  register(data.file,{...common,look,mood:'neutral'});
  for(const [mood,file]of Object.entries(data.moods??{}))register(file,{...common,look,mood});
 }
}
for(const w of chronicleWorks)register(w.coverArt,{kind:'cover',work:w.slug,title:w.title});
const works=[{slug:'tide-v6',source:'campaign-v6',version:'tide-promise-2.0.0',routes:campaignRoutes},...chronicleWorks.map(w=>({slug:w.slug,source:w.slug,version:w.version,routes:{}})),{slug:'tide-current-root',source:'campaign-v6',version:'tide-promise-2.0.0',routes:campaignRoutes},{slug:'tide-v5',source:'campaign-v5-1.0.0',version:'tide-promise-1.0.0',routes:{}},{slug:'half-step',source:'duel',version:VN_CONTENT_VERSION,routes:{}}];
function observe(file,work,frame,kind,extra={}){
 const entry=fileEntry(file),scene=scenes[frame.stage.scene],key=JSON.stringify([work,frame.stage.scene,kind,extra]);
 if(!entry.observations.has(key))entry.observations.set(key,{work,scene:frame.stage.scene,sceneName:scene.name,time:scene.time,kind,...extra,beats:new Set()});
 entry.observations.get(key).beats.add(frame.id);
}
const coverage=[];
for(const work of works){
 const path=`src/generated/${work.source}.json`,bytes=readFileSync(path),content=JSON.parse(bytes),visited=new Set();let random=0x6137;
 for(let run=0;run<samples;run++){
  const s=new VNRuntime(content,work.version),preferred=Object.values(work.routes)[run];
  while(true){const f=s.frame;visited.add(f.id);
   observe(scenes[f.stage.scene].art,work.slug,f,'background',{visibility:f.stage.cg?'under-cg':'stage'});
   if(f.stage.cg)observe(cgs[f.stage.cg].file,work.slug,f,'cg',{cg:f.stage.cg});
   // The renderer replaces cast sprites with the CG. Hidden cast metadata is
   // not counted as an observed portrait file.
   else for(const id of f.stage.cast){const mood=f.stage.moods[id]??'neutral',look=f.stage.looks?.[id];observe(resolvePortrait(id,mood,look).file,work.slug,f,'portrait',{id,name:characters[id].name,mood,look:look??'default'})}
   if(f.ending)break;if(s.commands.length>2500)throw Error(`Unbounded ${work.slug}`);
   if(f.choices.length){if(preferred)s.choose(pickChoice(f.choices,preferred).id);else if(run<2)s.choose(f.choices[run?f.choices.length-1:0].id);else{random=(Math.imul(random,1664525)+1013904223)>>>0;s.choose(f.choices[(random>>>16)%f.choices.length].id)}}else s.advance();
  }
 }
 const ink=`story/${work.source}.ink`;let declared=[];try{declared=[...readFileSync(ink,'utf8').matchAll(/# beat:(\S+)/g)].map(m=>m[1])}catch{/* Frozen v5 JSON is the authority when no paired Ink exists. */}
 coverage.push({work:work.slug,version:work.version,content:path,sha256:createHash('sha256').update(bytes).digest('hex'),samples,visited:visited.size,declared:declared.length,unvisited:declared.filter(id=>!visited.has(id)),declaredSourceAvailable:declared.length>0});
}
// Include literal art references in the older, non-VN interface separately.
const legacy=[];function scan(dir){for(const ent of readdirSync(dir,{withFileTypes:true})){const path=`${dir}/${ent.name}`;if(ent.isDirectory()){if(ent.name!=='generated')scan(path)}else if(/\.(ts|css|html)$/.test(path)){const text=readFileSync(path,'utf8');for(const match of text.matchAll(/(?:\.\/|\/)?art\/([\w/-]+\.(?:webp|png))/g)){register(match[1],{kind:'static-literal',source:path});legacy.push({file:match[1],source:path})}}}}scan('src');
mkdirSync('docs/art',{recursive:true});
const rows=[...assets.values()].sort((a,b)=>a.file.localeCompare(b.file)).map(a=>({...a,observations:[...a.observations.values()].map(o=>({...o,beats:[...o.beats].sort()}))}));
writeFileSync('docs/art/asset-usage-v6.json',JSON.stringify({status:'CURRENT_RUNTIME_SAMPLING_AND_REGISTRATIONS_NOT_VISUAL_ACCEPTANCE',sampledPathsPerWork:samples,exhaustive:false,works:coverage,assets:rows,legacyStaticReferences:legacy,limits:['Includes current V6, all registered chronicles/archives, frozen V5, current root and half-step. Original non-VN legacy engine is covered only by literal references.','Scene period labels are existing script metadata, not independent canonical dating.','Registration/underlay and actual non-CG portrait observations are kept separate.','No crop, identity, expression, visual quality, human playtime or external acceptance inferred from sampling.']},null,2)+'\n');
console.log(JSON.stringify({works:coverage.length,registeredFiles:rows.length,workGaps:coverage.filter(w=>w.unvisited.length).map(w=>({work:w.work,unvisited:w.unvisited.length}))}));
