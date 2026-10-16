import {readFileSync,writeFileSync} from 'node:fs';
import {directV6Endings} from './v6-ending-direction.mjs';
import {createWriter} from '../chronicle-writer.mjs';
import {authorV6Scenes} from './v6-scenes.mjs';
import {authorV6After} from './v6-after.mjs';
import {authorCanonScenes,canonPayoffs} from './v6-canon-scenes.mjs';
import {campaignCharacters} from '../../src/campaign-catalog.ts';
// v5 author runs first. Never rewrite its source, compiled content, or command meaning.
const original=readFileSync('story/campaign.ink','utf8');
const sections=[...original.matchAll(/^=== (\w+) ===\s*$/gm)];
if(!sections.length)throw new Error('Missing v5 chapter structure');
const knots=new Map(sections.map((match,index)=>[match[1],original.slice(match.index,sections[index+1]?.index??original.length)]));
function replaceIn(id,oldText,newText){const source=knots.get(id);if(!source?.includes(oldText))throw new Error(`v6 adaptation anchor changed: ${id}/${oldText}`);knots.set(id,source.replace(oldText,newText))}
// Insert new formal chapters at explicit boundaries, before appending new knots.
for(const [id,source] of knots)knots.set(id,source.replaceAll('-> arena_open','-> v6_contract').replaceAll('-> arena_pair_result','-> v6_wind'));
replaceIn('departure','- else:\n-> water_load','- route == 2:\n-> water_load\n- else:\n-> v6_stay_open');
replaceIn('departure','{ route == 1:','{\n- route == 1:');
for(const id of ['inn_depart','after_choice','after_friends','after_master','after_route','ordinary_day','ordinary_day_after'])knots.delete(id);
const workshop=createWriter('c6_');
workshop.part('workshop_gate','v6_workshop','he,aunt,qiao',`n|第三日清早，修船坞的门板架成饭桌，一锅汤滚得很响。陆队、水队与留在会场的人，终于坐到一处。
aunt|先喝。谁想讲最险的那一下，先看看碗里有没有捞到菜。
qiao~amused|我今日没抢最重的。你们也别一见就先审我。
he|没抢。只问了十九遍谁还没到。
n|他右腕没有抬高，左手先把空凳往你这边挪。`);
workshop.out.push('{\n- route == 1:');
workshop.say(`zhaoli|听说你们桥边耽搁。我们也迟了，只是缘故不一样。
y|你们船上的事，我先听你讲，不拿山路上那套替你猜。`);
workshop.out.push('- route == 2:');
workshop.say(`pei|整夜没见你们灯。砚生把汤端热三回，最后不敢再问。
y|我们在等水。桥上的那段，也得从你们口里听。`);
workshop.out.push('- else:');
workshop.say(`rong~uneasy|你们护药的回来了。我今日留在会场，也没把一张钱账办利落。
y|我只见过这里这一段。药车和船的事，轮到他们自己讲。
qiao~calm|那我从第一面坡讲，先别笑。范遇说往前不远，说了五回。`);
workshop.out.push('}');
workshop.choose('workshop_people',[
 ['reunion_honest','先讲自己做错的那一下。','honest = true',`y|我不是每步都做对。最想省工夫的时候，差点让别人替我付。
qiao~calm|你肯回来讲，我就敢告诉你没做好的。先吃，不是抢着认罪。`],
 ['reunion_light','先讲最好笑的一件，给大家喘口气。','honest = false',`y|先说不疼的。陆汀舟能把回函压在饼下面，我们怎么还怕没笑话？
lu~amused|这桩比师门三百年还难翻篇。下回我要挑个没你们的饭桌。`],
]);
knots.set('workshop_gate',workshop.render());
// The old climax's vehicle bottleneck is now at the levee, distinct from the fair exit.
replaceIn('levee_call','东堤的水不高，却已把车轮底下的土掏空。棚里还有老人，出口卡着运米的车。','东堤的水已掏空车轮下的土。最外棚还有老人，堤上另一辆米车陷进了泥里。');
replaceIn('levee_call','你们昨夜报过回水。我把棚往内挪了两丈，还少做了一步。','你们报过回水。我把棚往内挪了两丈，还少做了一步。');
replaceIn('levee_wrist','昨天肯歇，手就还没坏到拿不住轻物。','之前肯歇，手就还没坏到拿不住轻物。');
replaceIn('levee_wrist','昨天没肯休，今天这一下不能再商量。','之前没肯休，这一下不能再商量。');
replaceIn('arena_open','你昨夜要我真打。','你在客舍要我真打。');
replaceIn('arena_open','你昨夜说只认判线。','你在客舍说只认判线。');
replaceIn('storm_act','岸绳突然震动，你试图多撑一瞬，伤处先替你松了力。','岸绳突然震动，你试图多撑一瞬，{wound > 0:伤处|手臂}先替你松了力。');
// Chapter nine continues across the interrupted result scene; no chapter-label regression.
knots.set('arena_pair_result',knots.get('arena_pair_result').replaceAll('# scene:arena','# scene:v6_wind'));
let body=[...knots.values()].join('\n')+'\n'+authorV6Scenes()+authorV6After();
// Insert before appending their source so the new knots never redirect into themselves.
body=body.replaceAll('-> inn_depart','-> v6_books').replaceAll('-> departure','-> v6_roles_anchor').replaceAll('-> arena_open','-> v6_grain_inventory').replaceAll('-> storm_return','-> v6_canon_reckon').replaceAll('-> levee_call','-> v6_sluice');
body+='\n'+authorCanonScenes()+canonPayoffs();
body=body.replace(/# scene:([a-z0-9_]+)/g,(tag,id)=>id.startsWith('v6_')?tag:`# scene:v6_${id}`);
// Concern for an old companion differs from the physician's firm work state.
body=body.replace(/(^.*# beat:c_workshop_people_1\b.*# mood:ling=)neutral/m,'$1uneasy');
const actor=id=>Object.hasOwn(campaignCharacters,id)?'v6_'+id:id;
body=body.replace(/# speaker:([a-z0-9_]+)/g,(_,id)=>'# speaker:'+actor(id));
body=body.replace(/# cast:([^#\r\n]+)/g,(_,ids)=>'# cast:'+ids.trim().split(',').map(actor).join(',')+' ');
body=body.replace(/# mood:([^#\r\n]+)/g,(_,items)=>'# mood:'+items.trim().split(',').map(item=>{const [id,mood]=item.split('=');return actor(id)+'='+mood}).join(',')+' ');
body=directV6Endings(body);
// Departure remains chapter three even though its location is the same quay as the prologue.
for(const id of ['departure','farewell','farewell_after'])body=body.replace(new RegExp('(=== '+id+' ===[\\s\\S]*?)(?=\\n=== |$)'),section=>section.replaceAll('# scene:v6_quay','# scene:v6_depart'));
const added={v6_qiao_asked:false,v6_stopped:false,v6_labor_first:false,v6_advance:false,v6_flag_safe:false,v6_escort:false,v6_ledger:false,v6_public_cost:false,v6_one_shift:true,v6_qiao_agency:false,v6_gate_clear:false,v6_roles_clear:false,v6_after_shift:0,v6_book_dry:false,v6_handover:false,v6_exit_drill:false,v6_stock_checked:false,v6_witness_signed:false};
const header=original.slice(0,sections[0].index).replace('-> cargo',Object.entries(added).map(([key,value])=>`VAR ${key} = ${value}`).join('\n')+'\n-> cargo');
writeFileSync('story/campaign-v6.ink',('// V6 preview: isolated from v5 and still undergoing editorial/art production.\n'+header+body).replace(/[ \t]+$/gm,''));
console.log(`V6 preview: ${[...body.matchAll(/# beat:/g)].length} source beats; three midroutes and independent after-scenes.`);
