import {writeFileSync} from 'node:fs';
import {createWriter} from './chronicle-writer.mjs';
import {writeYouth} from './qingshi-youth.mjs';
import {writeCareer} from './qingshi-career.mjs';
import {writeLast} from './qingshi-last.mjs';
const w=createWriter('qs_');writeYouth(w);writeCareer(w);writeLast(w);
const vars={qs_honest_start:false,qs_chen_word:0,qs_han_word:0,qs_song_word:0,qs_zhao_word:0,qs_paid_wine:false,qs_rest_leg:false,qs_wait_word:false,qs_family_truth:false,qs_returned:false,qs_exit_drill:false,qs_shield_gap:false,qs_finished_chop:false,qs_kept_reasons:false,qs_handover:false,qs_carriage_drill:false,qs_settled_driver:false,qs_army_drill:false,qs_runner_return:false,qs_counted:false,qs_shared_limit:false,qs_last_duty:0,qs_names_left:false,qs_final_call:false,qs_epilogue_roll:false,qs_home_lesson:0};
// Show the viewpoint character at three explicitly matching life phases. Other
// ages remain first-person: a 17-year-old face is never displayed as age32/70.
// The elder is withdrawn before the terminal fight and all posthumous scenes.
const directed=w.render().split('\n').map(line=>{
 const id=line.match(/# beat:(\S+)/)?.[1],scene=line.match(/# scene:(\S+)/)?.[1];if(!id)return line;
 const look=id==='qs_oldknife_6'?'age92close':scene==='qs_yard17'?'age17':scene==='qs_wei46'?'age46':/^qs_(city92|night92|oldknife)_/.test(id)||id==='qs_breach_1'?'age92':null;
 if(!look)return line;
 const raw=line.match(/# cast:([^#\r\n]+)/)?.[1];if(!raw)throw new Error(`Missing protagonist cast ${id}`);
 const speaker=line.match(/# speaker:(\w+)/)?.[1];const cast=raw.trim().split(',').filter(id=>id!=='none'&&id!=='qs_xu');
 const others=[...new Set([...(speaker&&cast.includes(speaker)?[speaker]:[]),...cast])].slice(0,2);
 return line.replace(`# cast:${raw}`,`# cast:qs_xu,${others.join(',')} `)+` # look:qs_xu=${look}`;
}).join('\n');
writeFileSync('story/qingshi.ink','// Source: 宋世江湖 14850–20213; fixed four deaths and Xu age92 sacrifice.\n'+Object.entries(vars).map(([key,value])=>`VAR ${key} = ${value}`).join('\n')+'\n-> grain\n'+directed);
