import type {Person} from './campaign-catalog.ts';
// Production draft: stable shared templates. Protagonist ages, frontier spaces
// and important identities remain in the art acceptance backlog, not counted as complete.
const p=(name:string,role:string,detail:string,file:string,archetype:string):Person=>({name,role,detail,portrait:{file,kind:'template',archetype,variant:file,position:'center top',size:'contain'}});
export const qingshiCharacters:Record<string,Person>={
 qs_xu:{name:'许长安',role:'青石五友 · 本篇视角',detail:'石门村出来的年轻人，最初只想练厉害一点。同朋友在粮仓后认识的江湖，一步步走到门外。',portrait:{file:'v6/qs-xu-age17.webp',kind:'dedicated',position:'center top',size:'contain',looks:{age17:{file:'v6/qs-xu-age17.webp'},age46:{file:'v6/qs-xu-age46.webp'},age92:{file:'v6/qs-xu-age92.webp'},age92close:{file:'v6/qs-xu-age92.webp',size:'auto 240%',position:'center top'}}}},
 qs_chen:p('陈虎','青石五友 · 铁匠子','比许长安大一岁，肩背宽，使重刀，想开武馆；真打时有自己的骄傲。','v6/npc-young-laborer.webp','porter'),
 qs_han:p('韩小七','青石五友 · 码头脚夫','本名韩七郎，逃荒来镇，嘴碎腿快，想一路走镖到京城。','v5/npc-youth-blue.webp','youth'),
 qs_song:p('宋礼','青石五友 · 布铺子弟','读过几年书，喜欢剑；省吃俭用半年买来的铁剑太重，却舍不得换。','v6/npc-martial-adult.webp','martialAdult'),
 qs_zhao:p('赵大春','青石五友 · 商号护院','初识时二十五岁，有妻与两岁女儿，最想多挣些钱，稳重也有脾气。','v5/npc-porter.webp','porter'),
 qs_feng:p('冯老六','石门村 · 启蒙拳师','人称铁算盘，绰号来由说法不同。先教站，教短拳、擒拿和齐眉棍，不是隐居返真。','v5/npc-elder-male.webp','elder'),
 qs_ma:p('马元魁','镇山手 · 民间名录旧人','三川十六手是地方民间名录。他问过真正小榜而未进，不替自己没见过的路榜人物编胜负。','v6/npc-martial-elder.webp','martialElder'),
 qs_yang:p('杨老镖师','四十九岁的练腿人','春会遇见时四十九，腿练了二十多年。看着不快，落点却让年轻人站不住。','v6/npc-seasoned-traveler.webp','martialAdult'),
 qs_du:p('杜百川','摧心手 · 伪装药商的凶徒','无榜籍却有路榜中段实力，不因伤势或被围便成为普通乡镇武人能制服的对手。','v5/npc-merchant-male.webp','merchant'),
 qs_lu:p('陆慎行','青崖剑 · 公门礼聘','路榜中位，见过更高的武林，也知道普通人一次错估会留下多少后事。','v5/npc-traveler.webp','traveler'),
 qs_wife:p('赵家嫂子','赵大春之妻','关心丈夫何时回、东西交到哪里，有权追问，也有权不因幸存者后来立功便原谅。','v6/npc-mature-woman-b.webp','matureWoman'),
 qs_meng:p('孟长庚','铁衣手 · 府衙总教头','五十余岁时遇许，小榜前位、曾第二，冲府榜未成；把杂学按捕人的事重新排。','v6/npc-robed-elder.webp','robedElder'),
 qs_wei:p('魏沉舟','卧松叟 · 退榜旧人','旧路榜第一坐过十一年，退榜二十余年。骑瘦驴，收酒不等于肯教，不把许长安硬改成自己。','v6/npc-martial-elder-b.webp','martialElder'),
 qs_wang:p('赵允和','靖王','年轻亲王，不习武，重视许长安带人和编组护卫的本领；不同于荣王赵承晏。','v6/npc-martial-adult-b.webp','martialAdult'),
 qs_zhaodaughter:p('赵家女儿','青石旧人','幼时见过仓后五友，后来守着家人自己的记忆，不代替母亲说原谅。','v6/npc-mature-woman.webp','matureWoman'),
 qs_vice:p('定塞副将','边军 · 共同守城者','顾惜伤兵，也主张该撤时撤。把命令化成一班班有人能接的差事。','v6/npc-martial-adult-b.webp','martialAdult'),
 qs_runner:p('阿满','边军新卒 · 原典留白人物','外县入军，腿快，识字少。会问谁在转弯处，最后有自己能见、不能见的经历。','v5/npc-youth-blue.webp','youth'),
 qs_ale:p('阿勒台','敌军刀将','边战多年，接近路榜前位。不是南北榜人物，仍让一座边城的守者难以抵挡。','v6/npc-seasoned-traveler.webp','martialAdult'),
 qs_wu:p('乌延海','赤狼 · 北地武人','比阿勒台年轻，快而狠，后来从军。对已老的守将，他的速度是实在的危险。','v6/npc-martial-adult.webp','martialAdult'),
 qs_xiao:p('萧姓枪将','敌军长兵将领','中原人，投北地多年，年轻时在河朔高层地方榜有名。不是萧天策。','v5/npc-porter.webp','porter'),
};
// Equal-aspect medium framing keeps full-body resources readable beside the
// inherited half-body sprites. Gallery files remain complete and unstretched.
qingshiCharacters.qs_chen.portrait={file:'v6/qs-chen.webp',position:'center top',size:'contain',kind:'dedicated'};
qingshiCharacters.qs_han.portrait={file:'v6/qs-han.webp',position:'center top',size:'contain',kind:'dedicated'};
qingshiCharacters.qs_song.portrait={file:'v6/qs-song.webp',position:'center top',size:'contain',kind:'dedicated'};
for(const person of Object.values(qingshiCharacters))if(person.portrait.file.startsWith('v6/'))person.portrait.size='auto 150%';
export const qingshiScenes={
 qs_yard17:{name:'青石镇 · 粮仓矮墙',time:'许长安十七岁',art:'v6/grain-yard.webp'},
 qs_village:{name:'石门村 · 冯家院',time:'旧事 · 十四岁',art:'v6/longmen-backyard.webp'},
 qs_town20:{name:'青石镇 · 酒楼外',time:'二十岁 · 民间十杰',art:'v5/inn.webp'},
 qs_mahouse:{name:'北镇 · 马家小院',time:'二十岁前后 · 马六十八',art:'v6/longmen-backyard.webp'},
 qs_fair23:{name:'三镇春会',time:'二十三岁 · 未涉正式榜',art:'v5/arena.webp'},
 qs_wall32:{name:'青石镇 · 旧矮墙',time:'三十二岁 · 最后一夜',art:'v6/grain-yard.webp'},
 qs_road32:{name:'镇外荒路',time:'次日下午 · 路沟与竹林',art:'v5/ridge.webp'},
 qs_sick32:{name:'青石镇 · 养伤处',time:'五日后醒来',art:'v5/inn.webp'},
 qs_graves32:{name:'青石镇外 · 坟前',time:'三十二岁 · 后事',art:'v5/reeds.webp'},
 qs_office:{name:'州府 · 教场',time:'入公门后 · 三十余岁',art:'v6/longmen-hall.webp'},
 qs_office44:{name:'府衙 · 值房',time:'四十四岁 · 半年布网',art:'v6/longmen-hall.webp'},
 qs_road44:{name:'围捕之谷 · 官道',time:'半年以后 · 杜再突围',art:'v6/reusable-stone-valley.webp'},
 qs_wei46:{name:'魏家小院',time:'四十六岁 · 再学一点',art:'v6/longmen-backyard.webp'},
 qs_fair56:{name:'数县武会 · 教场',time:'五十六岁',art:'v5/arena.webp'},
 qs_capital64:{name:'京城 · 王府教场',time:'六十四岁入京以后',art:'v6/qingxi-veranda.webp'},
 qs_guard66:{name:'巡田车路 · 狭口',time:'六十余岁 · 护送',art:'v5/ridge.webp'},
 qs_home70:{name:'青石镇 · 旧人门前',time:'七十岁 · 回乡',art:'v5/inn.webp'},
 qs_army76:{name:'边军驻地 · 校场',time:'七十六岁入军至八十四岁',art:'v6/reusable-stone-inner-gate.webp'},
 qs_army84:{name:'定塞驻军 · 后门',time:'八十四岁 · 新卒',art:'v6/reusable-stone-inner-gate.webp'},
 qs_wall92:{name:'定塞城 · 城防',time:'九十二岁 · 头两日',art:'v6/reusable-stone-inner-gate.webp'},
 qs_room92:{name:'定塞 · 值房',time:'第二日夜至第三日晨',art:'v6/longmen-hall.webp'},
 qs_stairs92:{name:'定塞内门 · 石阶',time:'第三日上午',art:'v6/qs-stairs92.webp'},
 qs_after:{name:'定塞至青石 · 后人所记',time:'许长安身后',art:'v5/dawn.webp'},
};
export const qingshiEndings={qs_records:'五个人的旧录',qs_heirs:'下一道门'};
export const qingshiFacts={};
export const qingshiChapters=[['qs_yard17','一 · 粮仓后的五人'],['qs_town20','二 · 镇上与榜外'],['qs_wall32','三 · 荒道'],['qs_office','四 · 公门与七手'],['qs_wei46','五 · 再学一点'],['qs_capital64','六 · 京城与回乡'],['qs_army76','七 · 军中不是武会'],['qs_wall92','八 · 守一天'],['qs_after','九 · 五个名字']];
export const qingshiV1Work={slug:'qingshi-v1',file:'qingshi-v1.html',title:'青石五友 · 旧稿',version:'qingshi-1.0.0',prefix:'jianghu:chronicle:qingshi:v1:',start:'坐上粮仓后的矮墙',hook:'先练厉害一点。<br>明日，还在这里见。',intro:'五个人的年轻话，<br>一个人用了七十余年去答。',viewpoint:'十七岁至九十二岁的许长安',note:'制作中 · 正典生涯草稿',coverArt:'v6/grain-yard.webp',chapters:qingshiChapters};

export const qingshiV2Work={...qingshiV1Work,slug:'qingshi-v2',file:'qingshi-v2.html',title:'青石五友 · 第二版旧稿',version:'qingshi-2.0.0',prefix:'jianghu:chronicle:qingshi:v2:',note:'冻结第二版 · 保留原演出和旧存档'};
export const qingshiWork={...qingshiV2Work,slug:'qingshi',file:'qingshi.html',title:'青石五友 · 守一天',version:'qingshi-3.0.0',prefix:'jianghu:chronicle:qingshi:v3:',note:'五人旧约 · 一生的回响'};
