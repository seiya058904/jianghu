import type {Person} from './campaign-catalog.ts';
const p=(name:string,role:string,detail:string,file:string,archetype:string):Person=>({name,role,detail,portrait:{file,kind:'template',archetype,variant:file,position:'center top',size:file.startsWith('v6/')?'auto 150%':'auto 100%'}});
export const seaCharacters:Record<string,Person>={
 sr_oldmaster:p('太极老人','陆玄都时代 · 极老返真宗师','上午至日落四百余招后自认输，不是两百余年后的赵无极。','v6/npc-robed-elder-b.webp','robedElder'),
 sr_oldboat:p('旧日船人','陆玄都时代 · 原典留白人物','只知自己能接的一潮，不替出海人的终老作证。','v5/npc-boatwoman.webp','boatwoman'),
 sr_boatman:p('阿汀','罗天海时代 · 同行船夫 · 原典留白人物','靠船务谋生，会帮异乡同伴，也得照顾整船的下一程。仅在罗三十五至四十岁这段当面出场。','v5/npc-traveler.webp','traveler'),
 sr_young:p('蓬莱武馆弟子','港口争船位者','十二招倒地，不能替师父和整个蓬莱的本事作数。','v5/npc-youth-blue.webp','youth'),
 sr_teacher:p('武馆师父','蓬莱当地武人','四十三招败后仍能指旧卷与今日的练处。','v6/npc-martial-adult-b.webp','martialAdult'),
 sr_elder:p('蓬莱阁大长老','蓬莱五年中的第一败','两百余招使罗剑脱手，眼前失路不能用换兵器抹去。','v6/npc-martial-elder.webp','martialElder'),
 sr_canghe:p('沧鹤老人','蓬莱五年中的第二败','罗九十七招主动认输；去过中原，问赢完以后。','v6/npc-robed-elder.webp','robedElder'),
 sr_innkeeper:p('泉州店家','十二日病中的照应者 · 原典留白人物','还有别桌要上饭，肯听病客把旧名与新名说完。','v6/npc-mature-woman.webp','matureWoman'),
 sr_guest:p('南榜末段武人','江南八府会对手','认真接罗两百一十余招，不随人群拿口音取笑。','v6/npc-martial-adult.webp','martialAdult'),
 sr_oldfriend:p('总谱旧对手','罗五十一、五十二败而五十四平的对手','六十一再问，亲口认罗已入返真；每次问手自己也在变。','v6/npc-martial-elder-b.webp','martialElder'),
 sr_xuanmen:p('武当玄门老人','百余岁 · 罗五十四岁时问手','使罗主动停手，不以虚构公开少林胜绩补齐一张榜。','v5/npc-elder-male.webp','elder'),
 sr_zhao:p('赵无极','太极退居老人 · 百余岁','非当代掌门或现总谱；五访后留罗半年，不正式收徒，不能替他返真。','v6/npc-robed-elder-b.webp','robedElder'),
 sr_carpenter:p('木工学生','江南小馆十二普通弟子之一 · 原典留白人物','练武后还要做活，能接课，也有不能代看的日子。','v6/npc-young-laborer.webp','porter'),
 sr_seller:p('卖鱼学生','江南小馆十二普通弟子之一 · 原典留白人物','敢同师父讲没讲明的地方，赶集日也要谋生。','v6/npc-mature-woman-b.webp','matureWoman'),
 sr_challenger:p('未再问手的来客','罗五十八岁复出后第三位拟问者','看前两场后说像罗自己，没发生的第三场不能算胜。','v6/npc-seasoned-traveler.webp','martialAdult'),
 sr_latefriend:p('晚访总谱旧友','八十余岁 · 百余招后喝酒','不另定为六十一那位旧对手；本次没有公开胜负。','v6/npc-martial-elder.webp','martialElder'),
 sr_successor:p('后来弟子','罗晚年 · 原典留白人物','接课与接信，会留疑处，也会用自己的脚走新港；不预定为第二代宗主。','v6/npc-martial-adult-b.webp','martialAdult'),
};
const s=(name:string,time:string,art:string)=>({name,time,art});
export const seaScenes={
 sr_oldarena:s('太极问手处','陆玄都五十余岁 · 旧时代','v6/longmen-backyard.webp'),sr_oldshore:s('旧岸 · 出海前','陆玄都六十前后至失踪','v5/quay.webp'),
 sr_newshore:s('蓬莱港口','两百余年后 · 阿罗真三十五','v5/quay.webp'),sr_port:s('蓬莱 · 船位之外','十二、四十三、八十余','v5/quay.webp'),
 sr_islandyard:s('蓬莱阁 · 较艺处','岛上五年 · 二十八场','v6/longmen-backyard.webp'),sr_lonelyisle:s('蓬莱岛岸','沧鹤老人 · 第九十七招','v5/levee.webp'),sr_islandshore:s('蓬莱 · 转船处','罗四十岁 · 往中原','v5/quay.webp'),
 sr_quanzhou:s('泉州 · 客栈','十二日水土不服','v5/inn.webp'),sr_mainlandyard:s('中原 · 问手处','从八府会到六十一','v6/longmen-backyard.webp'),sr_mountainyard:s('武当 · 玄门问手','五十四岁 · 主动停手','v6/taihua-court.webp'),
 sr_zhaoyard:s('太极 · 赵无极居处','五十五岁 · 五访与半年','v6/longmen-backyard.webp'),sr_school:s('江南小武馆','十二名普通学生 · 两年','v6/longmen-hall.webp'),sr_newhall:s('江淮 · 天海宗','自己的门 · 初立三年','v6/longmen-hall.webp'),sr_lateyard:s('天海宗 · 晚年院中','不再替后来人走完','v6/qingxi-veranda.webp'),sr_afterhall:s('天海宗 · 后世祖堂','第二代与第三代以后','v6/longmen-hall.webp'),
};
export const seaEndings={sr_open_courtyard:'肯看重来',sr_next_harbor:'下一岸的回信'};
export const seaChapters=[['sr_oldarena','序 · 陆玄都与海'],['sr_newshore','一 · 两百年后的船位'],['sr_islandyard','二 · 赢完呢'],['sr_quanzhou','三 · 十二日'],['sr_mountainyard','四 · 很深'],['sr_zhaoyard','五 · 你的呢'],['sr_school','六 · 十二个普通人'],['sr_newhall','七 · 开自己的门'],['sr_lateyard','八 · 还没画完']];
export const seaWork={slug:'sea',file:'sea.html',title:'海路两世 · 中原以外',version:'sea-2.0.0',prefix:'jianghu:chronicle:sea:v2:',start:'先接眼前这一掌',hook:'赢完以后，<br>你还要去哪？',intro:'陆玄都出了中原，罗天海走进中原。<br>两百余年、两个人，各自去问地图以外。',viewpoint:'陆玄都旧事 → 阿罗真／罗天海一生',note:'第一册 · 两代人的远行',coverArt:'v5/quay.webp',chapters:seaChapters};

export const seaV1Work={...seaWork,slug:'sea-v1',file:'sea-v1.html',title:'海路两世 · 中原以外 · 旧稿',version:'sea-1.0.0',prefix:'jianghu:chronicle:sea:v1:',note:'旧稿 · 继续原来的旅程与存档'};
