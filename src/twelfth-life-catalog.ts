import type {Person} from './campaign-catalog.ts';
const p=(name:string,role:string,detail:string,file:string):Person=>({name,role,detail,portrait:{file,kind:'template',archetype:file.startsWith('v5/')?'v5-borrowed':'robedElder',variant:file,position:'center top',size:file.startsWith('v6/')?'auto 150%':'auto 100%'}});
export const twelfthLifeCharacters:Record<string,Person>={
 rl_sun:p('孙毅','皇城武学教习 · 后来退任','年轻时府榜中段，伤后退；教幼年赵先摆脚，赵三十二时六十余，晚年百岁上下耳背。','v6/npc-martial-adult.webp'),
 rl_boy:p('陪练少年','皇城武学 · 原典未名','十二岁三胜之一；被问让没让即跪，不因一句不治罪便自动不怕。','v5/npc-youth-blue.webp'),
 rl_lu:p('陆清婉','荣王妃','文臣家出、不习武，能同陈封谱，也会烦丈夫总想买铁；支持有自己的话与边界。','v6/npc-mature-woman.webp'),
 rl_gu:p('顾廷安','王府长史','安排信与暗卫，职责不能由王爷一声都撤便消失；也不能永远一人接两处事。','v5/npc-clerk-male.webp'),
 rl_luo:p('罗师傅','青溪馆师 · 六十余','先说没法算几年进榜，再讲会、教、开馆与非正式前列到小榜仍有一生路。','v6/npc-robed-elder.webp'),
 rl_spearman:p('北地老枪师','不会教王爷 · 原典未名','不愿骂一句先跪一句，不教也是真答复。','v6/npc-martial-elder-b.webp'),
 rl_shen:p('沈履平','澄江剑翁 · 七十余','旧南榜二十余，教一月站走转腰；不是芦花渡沈鹤汀。','v6/npc-martial-elder.webp'),
 rl_emperor:p('赵承暄','皇帝 · 赵承晏兄长','不能以皇权证明不靠皇权的榜；病重时留弟京四年，后来仍亲自收下那张榜。','v6/npc-martial-adult-b.webp'),
 rl_monk:p('少林老僧','少林访问 · 原典未名','缺十年不换，不另承诺一门功法便可进榜。','v6/npc-aged-monk.webp'),
 rl_innerelder:p('武当内院老人','武当访问 · 原典未名','陪走山问第七步从谁学，不冒称赵见到了玄门高席。','v6/npc-robed-elder.webp'),
 rl_taijielder:p('太极退位老人','太极访问 · 原典未名','七个人的答案不能并作一道题，问哪家最强仍没懂。','v6/npc-robed-elder-b.webp'),
 rl_circleelder:p('八卦老人','八卦访问 · 原典未名','走圈半日，腰硬的事须真实练，不能随口定几月包成。','v6/npc-martial-elder.webp'),
 rl_swordelder:p('华山剑师','华山访问 · 原典未名','三次打落木剑，强的是人不自动是给赵的捷径。','v6/npc-martial-elder-b.webp'),
 rl_kunlun:p('昆仑中年人','白石谷外 · 原典未名','陪半日叫一年别学新；赵未进内山，未见掌门。','v6/npc-martial-adult.webp'),
 rl_attendant:p('随行亲信','赵晏出门时 · 原典未名','两个亲信中一位，鞋破、河边晕眩都要真管，不是只替赵叫好。','v5/npc-traveler.webp'),
 rl_cloud:p('云中散人','化名赵晏遇到的骗子','二十两玄天闭气神功，回头找时已跑；未知姓名背景不强补真实高人。','v6/npc-seasoned-traveler.webp'),
 rl_chen:p('陈三平','青溪普通馆师 · 初见六十三','两问正式小榜都负、腿伤后断念；最合教赵，仍无正式席位。','v6/npc-robed-elder-b.webp'),
 rl_boardelder:p('青溪议榜老人','榜房 · 原典未名','规矩不禁亲王，可信战绩须各自核；不是王府属员。','v5/npc-elder-male.webp'),
 rl_xuewife:p('薛夫人','薛直之妻 · 原典未名','知道拒与来都怕，不因王爷认负便从此无忧；不必供一府人反复当证。','v6/npc-mature-woman-b.webp'),
 rl_scribe:p('文河','王府书吏 · 兼容补写','留京四年里学接事的人，家中添孩子也有自己的归期，不会为名家练剑自动多一双手。','v5/npc-youth.webp'),
};
twelfthLifeCharacters.rl_sun.portrait.looks={elder:{file:'v6/npc-martial-elder.webp'},late:{file:'v6/npc-robed-elder.webp'}};
twelfthLifeCharacters.rl_lu.portrait.looks={mid:{file:'v6/npc-mature-woman.webp',size:'auto 150%'},late:{file:'v6/npc-mature-woman-b.webp',size:'auto 150%'}};
twelfthLifeCharacters.rl_gu.portrait.looks={late:{file:'v6/npc-robed-elder.webp',size:'auto 150%'}};
twelfthLifeCharacters.rl_emperor.portrait.looks={late:{file:'v6/npc-martial-elder-b.webp'}};
const s=(name:string,time:string,art:string)=>({name,time,art});
export const twelfthLifeScenes={
 rl_laterpublic:s('青溪较艺 · 候看以后','五十二起 · 不同来约','v5/arena.webp'),rl_afterpalace:s('宫中 · 收下这一张','五十八入榜之后','v5/hall.webp'),rl_capitalroom:s('京中 · 不能离开的日子','留京第一年','v5/hall.webp'),
 rl_childyard:s('皇城武学 · 院门','十二岁 · 三场之后','v6/taihua-court.webp'),rl_swordroom:s('荣王府 · 藏剑与旧谱','婚后 · 三年封谱与后来','v5/hall.webp'),rl_princeyard:s('王府练场','二十二起 · 反复重新站','v6/longmen-backyard.webp'),rl_board:s('青溪榜下','三十二初看 · 后来五十八','v6/qingxi-board.webp'),rl_letterroom:s('长史桌边','四十七封与三只箱','v6/longmen-hall.webp'),rl_northyard:s('北地枪师院','不教也是答复','v6/longmen-backyard.webp'),rl_palace:s('宫中 · 兄弟之间','七师十三艺 · 拒诏与收榜','v5/hall.webp'),rl_shaolin:s('少林院中','缺十年不换','v6/taihua-court.webp'),rl_wudang:s('武当山路','第七步是谁的','v6/taihua-steps.webp'),rl_taiji:s('太极退位老人院','七个人的答案','v6/qingxi-veranda.webp'),rl_bagua:s('八卦院中','走圈半日 · 腰仍硬','v6/longmen-backyard.webp'),rl_huashan:s('华山较剑处','木剑三落','v5/arena.webp'),rl_whitevalley:s('白石谷外','未进内山 · 半日','v5/ridge.webp'),rl_fair:s('武会场边','贵席看不清脚','v6/longmen-fair.webp'),rl_roadinn:s('化名出门的路','床硬面咸脚泡 · 第五日','v5/inn.webp'),rl_river:s('出游河边','闭气第三日 · 第四日回头','v5/quay.webp'),rl_chenyard:s('陈三平馆中','三年一条底 · 后来近两年恢复','v6/longmen-backyard.webp'),rl_private:s('私下问拳处','四十四 · 身份先到','v6/qingxi-veranda.webp'),rl_public:s('青溪公开较艺场','四十四、五十二、五十五各有一场','v6/rl-public.webp'),rl_veranda:s('王府檐下','不送礼 · 许多年与晚年','v6/qingxi-veranda.webp'),rl_sickroom:s('宫中病榻边','留京第二年 · 兄长未死','v5/hall.webp'),rl_courtyard:s('京中王府 · 交班处','留京第三年','v6/longmen-hall.webp'),rl_boardroom:s('青溪榜房','五十八 · 大修近六年','v6/longmen-hall.webp'),rl_chenroom:s('陈馆师居处','临终 · 三日之后','v6/longmen-hall.webp'),rl_oldyard:s('孙教习居处','百岁上下 · 问三遍','v6/qingxi-veranda.webp'),rl_oldbook:s('青溪旧册 · 后来人所读','赵已去世 · 无在场人物','v6/longmen-hall.webp'),
};
export const twelfthLifeEndings={rl_watch_after:'一起看清一场',rl_letter_after:'一封没有求绝学的信'};
export const twelfthLifeV1Work={slug:'twelfth-life-v1',file:'twelfth-life-v1.html',title:'第十二席 · 旧稿',version:'twelfth-life-1.0.0',prefix:'jianghu:chronicle:twelfth-life:v1:',start:'回院取那块玉佩',hook:'赢了三场，<br>却不知道真赢了没有。',intro:'十二岁的一夜，半生的一张榜。<br>从找最强老师，到肯让别人真赢自己。',viewpoint:'赵承晏 · 十二岁起，末页明确切身后旧册',note:'制作中 · 八个事件单元与两种晚年关系',coverArt:'v6/qingxi-veranda.webp',chapters:[['rl_childyard','一 · 门外的玉佩'],['rl_letterroom','二 · 四十七封信'],['rl_shaolin','三 · 六家的答复'],['rl_fair','四 · 二十两与三年'],['rl_private','五 · 先输一场'],['rl_capitalroom','六 · 京中四年'],['rl_laterpublic','七 · 候看的那些年'],['rl_afterpalace','八 · 名字没有备好']]};

export const twelfthLifeV2Work={...twelfthLifeV1Work,slug:'twelfth-life-v2',file:'twelfth-life-v2.html',title:'第十二席 · 第二版旧稿',version:'twelfth-life-2.0.0',prefix:'jianghu:chronicle:twelfth-life:v2:',note:'冻结第二版 · 原演出与原存档',chapters:twelfthLifeV1Work.chapters.map(([id,title])=>[id==='rl_letterroom'?'rl2_study':id,title])};
export const twelfthLifeWork={...twelfthLifeV2Work,slug:'twelfth-life',file:'twelfth-life.html',title:'第十二席 · 赵承晏',version:'twelfth-life-3.0.0',prefix:'jianghu:chronicle:twelfth-life:v3:',note:'真输与末席 · 半生相伴'};
