import type {Person} from './campaign-catalog.ts';
const p=(name:string,role:string,detail:string,file:string):Person=>({name,role,detail,portrait:{file,kind:'template',archetype:file.startsWith('v5/')?'v5-borrowed':'robedElder',variant:file,position:'center top',size:file.startsWith('v6/')?'auto 150%':'auto 100%'}});
export const taihuaV2Characters:Record<string,Person>={
 th_fache:p('法彻','少林青序 · 三十六岁','第一日上午对慕容景生，第四次左进时封门，第四十八招胜；不是正序法舟或慧觉。','v5/npc-monk.webp'),
 th_jingsheng:p('慕容景生','八卦青序 · 三十二岁','前三次进左，第四次落脚后左门消失，真负法彻；不是七十六岁的正序慕容怀真。','v6/npc-martial-adult.webp'),
 th_walnut:p('武当白发老人','棚后看青序的长辈 · 原典未名','掰核桃、吃炒豆，六年前见过霍，不因此便能保证他今日多强；与华山夜院嗑瓜子的老人分开。','v6/npc-robed-elder-b.webp'),
 th_huijue:p('慧觉','少林正序 · 八十九岁','八十四入化，本届正序第三；与季一百零三平、陆一百四十余平，不凭最终第三反改平局。','v6/npc-aged-monk.webp'),
};
const s=(name:string,time:string,art:string)=>({name,time,art});
export const taihuaV2Scenes={
 th_firstwatch:s('藏云台 · 第一场旁观','第一日上午 · 四十八招','v6/taihua-court.webp'),th_mingtrial:s('藏云台 · 明澄与谢','青序第三试 · 袖破与近身','v6/taihua-court.webp'),th_huotrial:s('藏云台 · 霍与谢','第二轮 · 第五十三招不是终局','v6/taihua-court.webp'),th_youngorder:s('藏云台 · 青序收席','六席落定 · 各有胜负','v6/taihua-court.webp'),th_oldfirst:s('藏云台 · 正序初看','翌日 · 年长不自动入化','v6/taihua-court.webp'),th_jihui:s('藏云台 · 季与慧觉','第五十一与一百零三','v6/taihua-court.webp'),th_oldfinal:s('藏云台 · 正序争首','午后云散 · 左手十三剑','v6/taihua-court.webp'),th_mufront:s('石栏旁 · 两老复手','闭会前 · 宗主只走一剑','v6/th-mufront.webp'),th_lastmeal:s('六家后院 · 最后一夜','不大宴 · 一桌未说完的话','v6/taihua-guest.webp'),th_guidanceyard:s('散席后的石坪边','一炷香 · 错过同辈半日','v6/taihua-court.webp'),
};
export const taihuaV2Facts={
 th_48:{name:'第四次左门',text:'法彻36对慕容景生32，前三次左入，第四次内错半步，48掌停胸，少林胜。先前优势也是真的，但不能只凭前三十便判定最后。'},
 th_53:{name:'五十三与不稳',text:'霍对谢第53不退，慢剑先占下一剑的去处；140弃剑空手却不追，因为那一步不稳，最终170余真胜。不是让、也非53已直接分胜。'},
 th_mu_front:{name:'前面多了半寸',text:'季与陆复走左手第11剑，穆站季位置而非陆，前两步同路，到原处少半寸；只示范一剑，不记正式胜负。正序之上仍有上座，不能凭旁听让青年越级。'},
};
export const taihuaV2Chapters=[['th_guest','一 · 临时叫到名字'],['th_stone','二 · 藏云台初见'],['th_firstwatch','三 · 前三十招'],['th_mingtrial','四 · 明明占着'],['th_night','五 · 没记进册的一场'],['th_huotrial','六 · 第五十三招'],['th_round','七 · 等两百招'],['th_youngorder','八 · 六人各有路'],['th_oldfirst','九 · 正序与上座']];
