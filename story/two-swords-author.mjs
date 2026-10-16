import {writeFileSync} from 'node:fs';
import {createWriter} from './chronicle-writer.mjs';
import {writeOrigin} from './two-swords-origin.mjs';
import {writeBooks} from './two-swords-books.mjs';
import {writeLater} from './two-swords-later.mjs';
const w=createWriter('ss_');writeOrigin(w);writeBooks(w);writeLater(w);
const vars={ss_help_body:false,ss_old_use:false,ss_show_compare:false,ss_letter_plain:false,ss_roof:false,ss_lineage_clear:false,ss_duel_read:0,ss_passage:false,ss_read_whole:false,ss_own_notes:0,ss_saved_notes:false,ss_loss_open:false,ss_path:0,ss_lesson:0,ss_kept_question:false,ss_gui_method:0,ss_last_kept:false};
writeFileSync('story/two-swords.ink','// Source: 宋世江湖 11850–13918. Three explicitly separated viewpoints, fixed canon losses.\n'+Object.entries(vars).map(([key,value])=>`VAR ${key} = ${value}`).join('\n')+'\n-> ridge\n'+w.render());
