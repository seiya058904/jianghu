import type {Person} from './campaign-catalog.ts';
const p=(name:string,role:string,detail:string,file:string,archetype:string):Person=>({name,role,detail,portrait:{file,kind:'template',archetype,variant:file,position:'center top',size:file.startsWith('v6/')?'auto 150%':'auto 100%'}});
export const deadRankingCharacters:Record<string,Person>={
 dr_lu:p('陆观棋','江汉榜房 · 战绩核验者','不是官衙判官，也不靠自己一人喜恶定榜。晒旧册，催第二问，肯让自己过去没查下去的事重新被问。','v6/npc-robed-elder.webp','robedElder'),
 dr_apprentice:p('年轻抄手','周砚查案时的随行者 · 原典未名','会问为什么亲口认负还不等于身份真，听不懂也敢问第二句；不是后来每个年代都同一张年轻脸。','v5/npc-youth-blue.webp','youth'),
 dr_liang:p('梁启山','断江掌 · 江汉第二十一','右臂肿起仍亲口认负八十三，没看清脸与确实输过同时成立。愿说明不等于愿被人反复当笑话。','v6/npc-martial-elder.webp','martialElder'),
 dr_zhao:p('赵问川','青蒲剑 · 江汉第十六','六十九招真败，口述中对方右脚吃重；自称是谁仍须另核。','v6/npc-martial-adult.webp','martialAdult'),
 dr_he:p('何定远','伏波刀 · 江汉第十二','一百一十四招真败，记得对方出剑前吸气，不能仅凭几种熟悉细节替人定身份。','v6/npc-martial-adult-b.webp','martialAdult'),
 dr_shen:p('沈霁娘','秋水刀 · 六十八岁','右腿旧伤、自行退榜，旧十七最高十四。与真的谢问过三次，并不靠一眼便知道所有人。','v5/npc-elder.webp','elder'),
 dr_wudeng:p('谢无灯','白沙渡撑船人 · 四十七岁','瘦，左脚微跛，先把一船乘客送到岸；问及梁的伤时篙曾停一瞬。不是白水渡的掌船人。','v6/npc-seasoned-traveler.webp','martialAdult'),
 dr_yan:p('严松','南边小县郎中 · 五十一岁','手稳心细，先接完孩子脱臼的手、洗净才同周谈；不能一场大案就让整间医馆停成等人问话。','v6/npc-martial-adult-b.webp','martialAdult'),
 dr_du:p('杜青禾','棺材铺木工 · 四十四岁','粗手，刨柏木。先指第九未公开帖，说没打因为对方不应；未发生的战不能靠帖子变真。','v5/npc-porter.webp','porter'),
 dr_oldwoman:p('鹿溪酒馆老妇','九十余岁的旧驿工人','十八年前便已七十多。记得自己的位置，也敢说没看见哪一处，不替人编满一夜招数。','v5/npc-elder.webp','elder'),
 dr_gu:p('顾临川','横江叟 · 退榜旧人','如今九十余，住江边旧庄。过去的第一与眼前肯不肯开口，是两件仍要分别问的事。','v6/npc-robed-elder-b.webp','robedElder'),
 dr_householder:p('接路家主','白水旧产受益者 · 原典未名','愿说支持查凶，却不愿讲产业与当时所知；受益不自动等于参与杀人，拒答也不是周可随手写成罪的证。','v5/npc-merchant-male.webp','merchant'),
 dr_next:p('后来新抄手','周砚接房后的学事者 · 原典未名','逐渐学会问不认负时还有哪些证，不以昨日一条规矩替所有今日答完。后来也会从年轻变成能接班的人。','v5/npc-youth.webp','youth'),
 dr_youngwinner:p('胜过府榜的年轻人','周接房第一年 · 原典未名','十二可靠旁观已见真胜，对手不肯认；能示范今日的手，不能让当日再发生一遍。','v6/npc-young-laborer.webp','porter'),
};
deadRankingCharacters.dr_next.portrait.looks={late:{file:'v6/npc-martial-adult-b.webp',size:'auto 150%'}};
const s=(name:string,time:string,art:string)=>({name,time,art});
export const deadRankingScenes={
 dr_boardhouse:s('江汉榜房 · 前屋','周砚三十六岁起 · 不同来访日','v6/longmen-hall.webp'),dr_practice:s('榜房 · 晒册院边','三十七与六十一的旧梦','v6/longmen-backyard.webp'),dr_lianghouse:s('断江掌门下 · 桌边','来信十九日后 · 右臂肿起','v6/longmen-hall.webp'),dr_road:s('梁家回程 · 城外','认负与身份两行','v5/ridge.webp'),
 dr_nightground:s('城外问掌处 · 口述复原','持剑者暂未知名 · 八十三','v5/arena.webp'),dr_dayground:s('青蒲剑问艺处 · 口述复原','持剑者暂未知名 · 六十九','v6/longmen-backyard.webp'),dr_knifeground:s('伏波刀问艺处 · 口述复原','持剑者暂未知名 · 一百一十四','v5/arena.webp'),dr_shenyard:s('沈霁娘院中','两日口述与三个人','v6/longmen-backyard.webp'),dr_whitesand:s('白沙渡 · 江心与岸','不是白水渡 · 三日等候','v6/dongting-dock.webp'),dr_clinic:s('南边小县 · 医馆','先忙完眼前病人','v5/inn.webp'),dr_woodshop:s('县中棺材铺','柏木还没刨平','v5/workshop.webp'),dr_petitionroom:s('小院 · 旧申诉箱旁','十七次申状','v6/longmen-hall.webp'),dr_boxroom:s('小院 · 未寄信旁','再查两年与几月以后','v6/longmen-hall.webp'),
 dr_whitewater:s('白水渡旧地','十八年前的产业与今日的路','v5/quay.webp'),dr_oldrecords:s('榜房 · 旧库','验尸旧簿 · 不替证据长故事','v6/longmen-hall.webp'),dr_luxi:s('鹿溪 · 旧驿酒馆','七十余里外 · 一位老妇','v5/inn.webp'),dr_gumanor:s('江边顾庄','九十余旧人 · 不能再等三日','v6/qingxi-veranda.webp'),dr_roadestate:s('接路之家 · 门前','今日仍在的好处','v6/longmen-hall.webp'),
 dr_council:s('江汉大修 · 长桌','九月 · 先活人后旧案','v6/longmen-hall.webp'),dr_outeryard:s('大修院后 · 三人站处','一礼与没有被抵掉的十八年','v6/longmen-backyard.webp'),dr_newboard:s('新榜下 · 后来五年','渡灯手第二十四','v6/qingxi-board.webp'),dr_luroom:s('陆观棋居处','旧案收尾后第三年 · 八十二','v6/longmen-hall.webp'),dr_ferryroad:s('外县 · 访证的渡口','周砚接房第一年','v6/dongting-dock.webp'),dr_lateyard:s('榜房院中 · 晚来阳光','周砚七十余退下之后','v6/qingxi-veranda.webp'),
};
export const deadRankingEndings={dr_room_after:'门里仍问第二遍',dr_road_after:'门外也能把话说完'};
export const deadRankingChapters=[['dr_boardhouse','一 · 死人的帖子'],['dr_whitesand','二 · 三个人的名字'],['dr_whitewater','三 · 怕丢人'],['dr_council','四 · 一礼与三场真胜'],['dr_boxroom','五 · 未寄出的信'],['dr_luroom','六 · 名字之间']];
export const deadRankingWork={slug:'dead-ranking',file:'dead-ranking.html',title:'死人争榜',version:'dead-ranking-1.0.0',prefix:'jianghu:chronicle:dead-ranking:v1:',start:'再看一遍落款',hook:'死去十八年的人，<br>要把第七拿回来。',intro:'三场真胜。一个旧名字。<br>当有人亲口认败，来的人究竟是谁？',viewpoint:'榜房周砚 · 中后段另有现场视角',note:'制作中 · 六事件单元与两个人后日',coverArt:'v6/longmen-hall.webp',chapters:deadRankingChapters};
