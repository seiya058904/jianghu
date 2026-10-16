import {readFileSync,writeFileSync} from 'node:fs';
import {VNRuntime} from '../src/vn-runtime.ts';
import {campaignRoutes} from '../tests/campaign-routes.ts';
const content=JSON.parse(readFileSync('src/generated/campaign-v6.json','utf8'));
function run(preferred,override){
 const s=new VNRuntime(content,'tide-promise-2.0.0');
 while(!s.frame.ending){
  if(s.commands.length>2200)throw new Error('Story did not close');
  if(s.frame.choices.length)s.choose((s.frame.choices.find(c=>c.id===override)??s.frame.choices.find(c=>preferred.includes(c.id))??s.frame.choices[0]).id);else s.advance();
 }
 return s;
}
const records=[],seen=new Set();
const scenarios=[...['route_land','route_water','route_stay'].map(route=>({route,preferred:[route]})),...Object.entries(campaignRoutes).filter(([name])=>name!=='harbor').map(([name,preferred])=>({route:'ending_'+name,preferred})),{route:'boundary_three',preferred:['load_shoulder','bridge_jump','duel_risk']},{route:'boundary_two',preferred:['load_shoulder','bridge_jump']}];
for(const {route,preferred} of scenarios){
 const base=run(preferred);
 for(const [at,decision] of base.frames.entries()){
  if(!decision.choices.length)continue;
  const original=decision.choices.find(c=>c.text===decision.selected);
  if(!original)throw new Error('Missing recorded choice');
  for(const alternative of decision.choices.filter(c=>c.id!==original.id)){
   const key=route+':'+[original.id,alternative.id].sort().join('/');if(seen.has(key))continue;seen.add(key);
   const changed=run(preferred,alternative.id),early=changed.frames.findIndex(f=>f.id===decision.id);
   const laterA=base.frames.slice(at+1).filter(f=>f.kind!=='ending'&&f.stage.scene!==decision.stage.scene);
   const laterB=changed.frames.slice(early+1).filter(f=>f.kind!=='ending'&&f.stage.scene!==decision.stage.scene);
   const scenesA=new Set(laterA.map(f=>f.stage.scene)),scenesB=new Set(laterB.map(f=>f.stage.scene));
   const textsA=new Set(laterA.map(f=>f.text)),textsB=new Set(laterB.map(f=>f.text));
   const a=laterA.filter(f=>scenesB.has(f.stage.scene)&&!textsB.has(f.text)),b=laterB.filter(f=>scenesA.has(f.stage.scene)&&!textsA.has(f.text));
   if(!a.length&&!b.length)continue;
   const entry=f=>({beat:f.id,scene:f.stage.scene,text:f.text,distance:(f===undefined?0:(base.frames.indexOf(f)>=0?base.frames.indexOf(f)-at:changed.frames.indexOf(f)-early))});
   records.push({route,decisionPoint:decision.id.replace(/_\d+$/,''),optionSet:decision.choices.map(c=>c.id).sort().join('|'),decisionOptions:decision.choices.map(c=>c.id),earlyBeat:decision.id,earlyScene:decision.stage.scene,baseline:{choice:original.id,label:original.text,ending:base.frame.ending,witnesses:a.slice(0,8).map(entry)},counterfactual:{choice:alternative.id,label:alternative.text,ending:changed.frame.ending,witnesses:b.slice(0,8).map(entry)}});
  }
 }
}
writeFileSync('docs/evidence/v6/delayed-choice-candidates.json',JSON.stringify({status:'CANDIDATES_REQUIRE_MANUAL_REVIEW',method:'One changed named decision; same named ending/route policy elsewhere. Compare actual non-ending text in a shared later scene, excluding the decision scene. Changed branch availability may change later input opportunities. One decision per authored knot; strip only the terminal numeric beat suffix to group branch-specific choice frames and conditional option availability. Verify this grouping manually in the ledger.',count:records.length,distinctDecisionGroups:new Set(records.map(r=>r.decisionPoint)).size,records},null,2));
for(const row of records)console.log(JSON.stringify({choice:row.counterfactual.choice,from:row.earlyScene,to:[...new Set([...row.baseline.witnesses,...row.counterfactual.witnesses].map(w=>w.scene))],a:row.baseline.witnesses.slice(0,2).map(w=>w.text),b:row.counterfactual.witnesses.slice(0,2).map(w=>w.text)}));
