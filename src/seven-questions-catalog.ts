import type {Person} from './campaign-catalog.ts';
// Neutral shared templates are provisional staging. No dedicated hero face is
// borrowed; fire, injuries and fourteen-chair composition await visual review.
const p=(name:string,role:string,detail:string,file:string,archetype:string):Person=>({name,role,detail,portrait:{file,kind:'template',archetype,variant:file,position:'center top',size:file.startsWith('v6/')?'auto 150%':'auto 100%'}});
export const sevenQuestionsCharacters:Record<string,Person>={
 sq_hesheng:p('禾生','金陵抄手 · 原典留白人物','怕照抄伤人，也会急、会算自己的工钱。先核副报者，可以请他共同出面；后来要回门教新抄手。','v5/npc-clerk-male.webp','clerk'),
 sq_asheng:p('阿笙','南岳传讯门人 · 原典留白人物','跑外路，想让混编的应声真能相接。笑禾生量椅子，八月还有自己答应的师妹课。','v6/npc-mature-woman-b.webp','matureWoman'),
 sq_disciple:p('季老弟子','七问遗命与真本核验者','原典未名弟子的合适出场，不替死去的周北衡说新话；承认自己起初也不知后四卷藏处。','v5/npc-traveler.webp','traveler'),
 sq_wen:p('闻道尘','太玄门主 · 门外极深','初会八十余岁，最终活到一百一十余未返真。留下的不只有境界，还有十四门会。','v6/npc-robed-elder-b.webp','robedElder'),
 sq_gu:p('顾南陵','金陵剑门之主','坚持共同验案与武道无籍，曾反对限阅，后来同意分卷方案。不是上一册的沈或林。','v6/npc-martial-elder-b.webp','martialElder'),
 sq_shen:p('沈孤鸿','本代南岳掌门','商号追真卷，与顾争至肩伤。不是三百余年前辞门的沈照岳。','v6/npc-robed-elder.webp','robedElder'),
 sq_lu:p('陆青崖','华山宗主 · 已返真二十七年','辨多送一寸、九十六招止斗，东门四十一招制闻人。不会因门派名头便替人取消疑问。','v5/npc-elder-male.webp','elder'),
 sq_murong:p('慕容破岳','八卦门主 · 已返真','商号一手搭腕一手按脊止两剑，指出争剑时仓中商人已死。','v6/npc-seasoned-traveler.webp','martialAdult'),
 sq_yan:p('燕横江','六合门主 · 门外极深','与顾争书，也同闻合挡滚石。肯同被自己质问的人接住眼前一块石。','v6/npc-martial-elder.webp','martialElder'),
 sq_hui:p('慧寂','少林方丈 · 已返真','先送弟子再迎闻人，不追引向山崩的退路。与闻谈门前门内，未许其明年必成。','v6/npc-aged-monk.webp','monk'),
 sq_sima:p('司马归元','太极掌门 · 已返真','不随聪明人多走一步，留院喝茶；八十一招掌停萧心口，答这只是我。','v6/npc-robed-elder.webp','robedElder'),
 sq_pei:p('裴照庭','河东当家人','一直追问外院两位入化长老眼下何人能无声杀周，不把断指证据并成万能凶手。','v6/npc-martial-adult-b.webp','martialAdult'),
 sq_xu:p('许问岑','青城当家人 · 门外极深','识旧河断流，也提出闻人旧踪。围攻中肩伤，与燕闻合势仍未填平境界。','v5/npc-traveler.webp','traveler'),
 sq_xiao:p('萧天策','同光会布局者 · 旧总谱十三','未返真，右手缺小指；借旧裂缝、假招痕与分兵图谋，不与闻人宿合并。','v6/npc-seasoned-traveler.webp','martialAdult'),
 sq_wenren:p('闻人宿','同光会杀人者 · 旧总谱八','一百余岁灰袍空手，失踪四十余年后已返真。先伤于慧寂，后东门认输于陆。','v6/npc-robed-elder-b.webp','robedElder'),
 sq_eastscribe:p('东门录事','亲见东门问手者 · 原典留白人物','向伏牛慢队回报三十七与四十一招，不拿自己短尺冒充陆的剑，仍留没看清的空处。','v5/npc-clerk-male.webp','clerk'),
};
const s=(name:string,time:string,art:string)=>({name,time,art});
export const sevenQuestionsScenes={
 sq_receipt:s('鹿门往来 · 收件处','约八十年前 · 独立新视角','v6/qingxi-veranda.webp'),sq_record:s('季老故居 · 遗命','青石驿案后','v6/longmen-hall.webp'),sq_four:s('四门初会','验旧痕与新试','v6/longmen-hall.webp'),
 sq_copy:s('金陵 · 街口','第一卷现市','v5/inn.webp'),sq_warehouse:s('金陵商号 · 仓外','一百三十余招以后','v6/grain-yard.webp'),sq_outer:s('少林外院 · 送件处','周北衡死后','v6/longmen-backyard.webp'),
 sq_chairs:s('嵩阳旧院 · 圆席','十四门会','v6/longmen-hall.webp'),sq_night:s('嵩阳 · 夜里小桌','六与八各有争论','v6/taihua-night.webp'),sq_ash:s('旧院 · 核物处','一撮盐浸船木灰','v6/longmen-hall.webp'),sq_depart:s('嵩阳 · 分行','半日准备以后','v6/longmen-backyard.webp'),
 sq_valley:s('伏牛旧河 · 溪沟','第三日 · 火石封路','v6/reusable-stone-valley.webp'),sq_court:s('嵩阳 · 留守院','同日 · 另一条路线','v6/longmen-backyard.webp'),sq_court_fire:s('嵩阳 · 后门','烟起后的交接','v6/longmen-backyard.webp'),
 sq_return:s('嵩阳 · 外廊','十四家回流','v6/qingxi-veranda.webp'),sq_east:s('嵩阳 · 东门外廊','留守者亲见','v6/longmen-backyard.webp'),sq_east_record:s('嵩阳 · 东门录事处','伏牛慢队事后听核','v6/longmen-hall.webp'),sq_records:s('鹿门与旧院 · 分卷','前三与后四各核来处','v6/longmen-hall.webp'),sq_door:s('少室山脚','大会散后两日','v5/ridge.webp'),sq_after:s('各地 · 后来的常差','书流传以后','v5/dawn.webp'),
};
export const sevenQuestionsEndings={sq_shared_road:'下一班接信人',sq_open_lesson:'鹿门一堂课'};
export const sevenQuestionsChapters=[['sq_receipt','一 · 朱名册'],['sq_warehouse','二 · 一寸与内外'],['sq_outer','三 · 不及收件'],['sq_chairs','四 · 十四张椅子'],['sq_night','五 · 灰与断指'],['sq_depart','六 · 分行半日'],['sq_valley','七甲 · 先送弟子'],['sq_court','七乙 · 留着喝茶'],['sq_east_record','八 · 亲见与后来听见'],['sq_records','九 · 三卷与四卷'],['sq_door','后日 · 门前的人']];
export const sevenQuestionsV1Work={slug:'seven-questions-v1',file:'seven-questions-v1.html',title:'一剑两脉 · 门外七问旧稿',version:'seven-questions-1.0.0',prefix:'jianghu:chronicle:seven-questions:v1:',start:'展开没有签完的收件单',hook:'有人想掀桌。<br>你先接住桌边这一张纸。',intro:'七卷遗录，十四家旧缝。<br>赴伏牛，或留嵩阳，亲见各自的一场火。',viewpoint:'约八十年前的鹿门普通收发门人',note:'制作中 · 第二册正典草稿',coverArt:'v6/longmen-hall.webp',chapters:sevenQuestionsChapters};

export const sevenQuestionsWork={...sevenQuestionsV1Work,slug:'seven-questions',file:'seven-questions.html',title:'一剑两脉 · 门外七问',version:'seven-questions-2.0.0',prefix:'jianghu:chronicle:seven-questions:v2:',note:'东门前后 · 两路亲见与个人常差',chapters:sevenQuestionsChapters.flatMap(row=>row[0]==='sq_east_record'?[['sq_east','八甲 · 东门亲见'],['sq_east_record','八乙 · 东门后闻']]:[row])};
