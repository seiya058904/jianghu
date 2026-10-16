import {readFileSync,writeFileSync,statSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {VNRuntime} from '../src/vn-runtime.ts';
import {characters,scenes,cgs,resolvePortrait} from '../src/catalog.ts';
import {chronicleWorks} from '../src/chronicle-catalog.ts';
import {npcArchetypes} from '../src/npc-archetypes.ts';
import {campaignRoutes,pickChoice} from '../tests/campaign-routes.ts';
const works=[{slug:'tide-v6',source:'campaign-v6',version:'tide-promise-2.0.0',routes:campaignRoutes},...chronicleWorks.map(work=>({slug:work.slug,source:work.slug,version:work.version,routes:{}}))];
const people=new Map(),backgrounds=new Map(),cgUses=new Map(),owners=new Map(),collisions=new Map(),resources=new Set(),reports={};
function ownerKey(id){return characters[id].canonicalIdentity??id}
function asset(file,owner){resources.add(file);if(owner){if(!owners.has(file))owners.set(file,new Set());owners.get(file).add(ownerKey(owner))}}
for(const work of works){
 const content=JSON.parse(readFileSync(`src/generated/${work.source}.json`,'utf8'));
 const source=readFileSync(`story/${work.source}.ink`,'utf8');const declared=[...source.matchAll(/# beat:(\S+)/g)].map(match=>match[1]);
 const visited=new Set(),choices=new Set(),endings=new Set(),workCGs=new Set(),workExpressions=new Map(),workLooks=new Map();let random=0x6137,longest=0;
 for(let run=0;run<168;run++){
  const preferred=Object.values(work.routes)[run];const s=new VNRuntime(content,work.version);let gap=0;
  while(true){
   const b=s.frame;visited.add(b.id);const visibleFiles=[];
   backgrounds.set(scenes[b.stage.scene].art,true);asset(scenes[b.stage.scene].art);
   if(b.stage.cg){workCGs.add(b.stage.cg);cgUses.set(b.stage.cg,true);asset(cgs[b.stage.cg].file)}
   for(const id of b.stage.cast){
    const person=people.get(id)??{id,name:characters[id].name,works:new Set(),spokenBeats:new Set(),presentBeats:new Set(),images:new Set(),statesByLook:new Map(),scenes:new Set()};
    person.works.add(work.slug);person.presentBeats.add(b.id);person.scenes.add(b.stage.scene);if(b.speaker===id)person.spokenBeats.add(b.id);
    const look=b.stage.looks?.[id]??'default';const file=resolvePortrait(id,b.stage.moods[id]??'neutral',b.stage.looks?.[id]).file;
    if(look!=='default')workLooks.set(`${id}:${look}`,{id,look,file,beat:b.id,size:resolvePortrait(id,'neutral',look).size,position:resolvePortrait(id,'neutral',look).position});
    if(b.speaker===id&&file!==resolvePortrait(id,'neutral',b.stage.looks?.[id]).file)workExpressions.set(`${id}:${look}:${file}`,{id,look,mood:b.stage.moods[id],file,beat:b.id,kind:characters[id].portrait.kind});
    person.images.add(file);if(!person.statesByLook.has(look))person.statesByLook.set(look,new Set());person.statesByLook.get(look).add(file);people.set(id,person);asset(file,id);visibleFiles.push([id,file]);
   }
   if(!b.stage.cg&&new Set(visibleFiles.map(([,file])=>file)).size<visibleFiles.length)collisions.set(`${work.slug}:${b.id}`,{work:work.slug,beat:b.id,cast:visibleFiles});
   if(b.choices.length){b.choices.forEach(choice=>choices.add(choice.id));gap=0}else longest=Math.max(longest,++gap);
   if(b.ending){endings.add(b.ending);break}
   if(s.commands.length>2500)throw new Error(`Unbounded story ${work.slug}`);
   if(b.choices.length){if(preferred)s.choose(pickChoice(b.choices,preferred).id);else if(run===0)s.choose(b.choices[0].id);else if(run===1)s.choose(b.choices.at(-1).id);else{random=(Math.imul(random,1664525)+1013904223)>>>0;s.choose(b.choices[(random>>>16)%b.choices.length].id)}}else s.advance();
  }
 }
 reports[work.slug]={version:work.version,contentSHA256:createHash('sha256').update(readFileSync(`src/generated/${work.source}.json`)).digest('hex'),sourceBeats:declared.length,visitedBeats:visited.size,unvisited:declared.filter(id=>!visited.has(id)),choiceOptions:choices.size,endings:[...endings],longestPassiveGap:longest,sampledRuns:168,exhaustive:false,storyCGs:[...workCGs],nonNeutralPortraitTriggers:[...workExpressions.values()],appearanceTriggers:[...workLooks.values()]};
}
const rows=[...people].map(([id,p])=>({id,canonicalIdentity:ownerKey(id),name:p.name,works:[...p.works],spokenBeats:p.spokenBeats.size,presentBeats:p.presentBeats.size,scenes:[...p.scenes],kind:characters[id].portrait.kind,archetype:characters[id].portrait.archetype,images:[...p.images],imageStatesByAppearance:Object.fromEntries([...p.statesByLook].map(([look,files])=>[look,[...files]])),hasThreeStatesAtSameAppearance:[...p.statesByLook.values()].some(files=>files.size>=3)}));
const dedicated=rows.filter(person=>person.kind==='dedicated'&&person.spokenBeats>0);
const ownershipConflicts=dedicated.flatMap(person=>person.images.filter(file=>owners.get(file).size>1).map(file=>({id:person.id,file,alsoUsedBy:[...owners.get(file)].filter(id=>id!==person.canonicalIdentity)})));
const independent=dedicated.filter(person=>!ownershipConflicts.some(conflict=>conflict.id===person.id));
const assets=[...resources].map(file=>{const full=`public/art/${file}`;return{file,bytes:statSync(full).size,sha256:createHash('sha256').update(readFileSync(full)).digest('hex')}});
const counts={speakingNPC:rows.filter(person=>person.spokenBeats>0).length,registeredDedicatedUsed:dedicated.length,independentDedicatedActorIdsUsed:independent.length,independentDedicatedUsed:new Set(independent.map(p=>p.canonicalIdentity)).size,charactersWithThreeImagesAtSameAppearance:new Set(rows.filter(person=>person.hasThreeStatesAtSameAppearance&&person.spokenBeats>0).map(p=>p.canonicalIdentity)).size,registeredArchetypesUsed:new Set(rows.map(person=>person.archetype).filter(id=>Object.hasOwn(npcArchetypes,id??''))).size,distinctBackgroundFiles:backgrounds.size,distinctCGFiles:new Set([...cgUses.keys()].map(id=>cgs[id].file)).size,referencedBytes:assets.reduce((total,item)=>total+item.bytes,0)};
const report={status:'IN_PROGRESS_NOT_FINAL_ACCEPTANCE',generatedAt:new Date().toISOString(),counts,works:reports,people:rows,dedicatedOwnershipConflicts:ownershipConflicts,simultaneousPortraitCollisions:[...collisions.values()],assets,limits:['Speaking NPC count is speaking identifiers, not a final unique-person census; aliases and repeated source characters across works still need canonical reconciliation.','Sampling is not exhaustive path proof.','Three states require three actual image files within one age/appearance, not three age-only portraits.','Dedicated identity ownership is checked across every sampled named actor. Only explicitly declared canonicalIdentity aliases are coalesced; other IDs remain separate.','Quantities do not prove literary quality, causal weight, visual quality, human reading time, or external acceptance.']};
writeFileSync('docs/evidence/v6/production-content-audit.json',JSON.stringify(report,null,2));console.log(JSON.stringify({counts,ownershipConflicts:ownershipConflicts.length,simultaneousCollisions:collisions.size,works:reports},null,2));
