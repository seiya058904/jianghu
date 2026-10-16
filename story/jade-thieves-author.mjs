import {writeFileSync} from 'node:fs';
import {createWriter} from './chronicle-writer.mjs';
import {writeVault} from './jade-thieves-vault.mjs';
import {writeFlight} from './jade-thieves-flight.mjs';
import {writeTemple} from './jade-thieves-temple.mjs';
import {writeAftermath} from './jade-thieves-aftermath.mjs';
const w=createWriter('jt_');
// Only the viewpoint's own interior is supplied. Reset cast after the two
// alternatives so subsequent common choices cannot inherit the other branch.
w.view=(scene,shen,jiang)=>{w.out.push('{\n- jt_pov == 1:');w.stage(scene,'jt_jiang');w.say(shen);w.out.push('- else:');w.stage(scene,'jt_shen');w.say(jiang);w.out.push('}');w.stage(scene,'')};
writeVault(w);writeFlight(w);writeTemple(w);writeAftermath(w);
const vars={jt_pov:0,jt_checked_vault:false,jt_escape:0,jt_name_plain:false,jt_auction_watch:false,jt_took_real:false,jt_plain_pack:false,jt_shared_turn:false,jt_bound_wound:false,jt_bread_shared:false,jt_truth_patience:false,jt_temple_word:0,jt_waited_craft:false,jt_fake_motif:0,jt_cover_apprentice:false,jt_ordinary_day:false,jt_cart_call:0,jt_close_press:0,jt_last_action:0,jt_future:0,jt_last_trade:false,jt_kept_ordinary:false};
writeFileSync('story/jade-thieves.ink','// Source: 宋世江湖24156–28497; first volume, fixed Jiang death and genuine-object state.\n'+Object.entries(vars).map(([key,value])=>`VAR ${key} = ${value}`).join('\n')+'\n-> threshold\n'+w.render());
