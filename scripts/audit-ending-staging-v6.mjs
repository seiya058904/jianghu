import assert from 'node:assert/strict';
import {readFileSync,writeFileSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {VNRuntime} from '../src/vn-runtime.ts';
import {cgs,characters,scenes,resolvePortrait} from '../src/catalog.ts';
import {campaignRoutes,pickChoice} from '../tests/campaign-routes.ts';
const bytes=readFileSync('src/generated/campaign-v6.json'),content=JSON.parse(bytes);
const rows=[];
for(const [ending,preferred] of Object.entries(campaignRoutes)){
 const s=new VNRuntime(content,'tide-promise-2.0.0');while(!s.frame.ending)s.frame.choices.length?s.choose(pickChoice(s.frame.choices,preferred).id):s.advance();assert.equal(s.frame.ending,ending);
 const tail=s.frames.filter(f=>f.id.startsWith('c_ending_'+ending+'_'));
 const after=s.frames.filter(f=>f.id.startsWith('c6_v6_after_'));
 rows.push({ending,finalBeat:s.frame.id,finalScene:s.frame.stage.scene,finalSceneName:scenes[s.frame.stage.scene].name,finalBackground:scenes[s.frame.stage.scene].art,finalCG:s.frame.stage.cg??null,finalCGFile:s.frame.stage.cg?cgs[s.frame.stage.cg].file:null,cast:s.frame.stage.cast.map(id=>({id,name:characters[id].name,file:resolvePortrait(id,s.frame.stage.moods[id],s.frame.stage.looks?.[id]).file})),distinctAftermathBeats:after.map(f=>f.id),endingSequence:tail.map(f=>({id:f.id,text:f.text,scene:f.stage.scene,cg:f.stage.cg??null,cast:f.stage.cast}))});
}
const shared={};for(const row of rows)(shared[row.finalCGFile??row.finalScene]??=[]).push(row.ending);
const report={status:'V6_SOURCE_DIRECTION_UPDATED_NOT_GLOBAL_ACCEPTANCE',contentSHA256:createHash('sha256').update(bytes).digest('hex'),v5SharedRuleUnchanged:'story/campaign/author.mjs:894',v6Direction:'story/campaign/v6-ending-direction.mjs',newGeneratedRasterFiles:0,reusedBackgroundFiles:[...new Set(rows.map(row=>row.finalBackground))],reusedCGFiles:[...new Set(rows.map(row=>row.finalCGFile).filter(Boolean))],sharedTerminalViews:shared,rows,limits:['Eight independent written aftermaths and the command/world contract are unchanged; prior source snapshot is retained.','No invented requirement that eight unique generated CGs must exist. Reuse is preferred.','Six families return to ordinary places and people; harbor dawn and scar recovery retain compatible existing CGs. Source audit is separate from rendered browser proof.','Functional browser results and visual/editorial acceptance are separate evidence.']};
writeFileSync('docs/evidence/v6/main-ending-staging-view-audit.json',JSON.stringify(report,null,2)+'\n');
console.log(JSON.stringify({endingFamilies:rows.length,sharedTerminalViews:shared,status:report.status}));
