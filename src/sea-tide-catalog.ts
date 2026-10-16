import type {Person} from './campaign-catalog.ts';
const p=(name:string,role:string,detail:string,file:string,archetype:string):Person=>({name,role,detail,portrait:{file,kind:'template',archetype,variant:file,position:'center top',size:file.startsWith('v6/')?'auto 150%':'auto 100%'}});
export const seaTideCharacters:Record<string,Person>={
 st2_boatkeeper:{...p('送试门的老船人','沈十二岁 · 原典船上老人','在外岛与归潮岛间送人，顺手修理船上木作；会等孩子站稳，也还要把船送到泊位。','v5/npc-elder-male.webp','elder'),canonicalIdentity:'st_boatkeeper'},
 st_boatkeeper:p('送试门的船人','沈十二岁 · 原典留白人物','把孩子送到归潮岛，不替试门许一个一定留下的结果。','v5/npc-boatwoman.webp','boatwoman'),
 st_coach:p('外院教头','试门与六年外院','让孩子先学会活，问船沉了算谁赢，不把所有海上功夫缩成一场擂台。','v6/npc-martial-elder.webp','martialElder'),
 st_an:p('阿岑','白螺屿同伴 · 原典留白人物','会接缆，也得靠船钱生活。十七岁后持续换手练习影响二十九岁救船时的腕伤；六十三仍会将泊位先留给别船。','v5/npc-youth-blue.webp','youth'),
 st_tidemaster:p('潮行老师','沈十八岁 · 正传','不教永远钉稳的一式，仍要学生从不稳里找到下一步。','v6/npc-martial-adult-b.webp','martialAdult'),
 st_shipper:p('遇险船主','十一商船风灾 · 原典留白人物','急着指出孩子所在，船将沉而非等武人互斗分胜负。','v5/npc-merchant-male.webp','merchant'),
 st_ye:p('叶孤舟','海天门内院第六席 · 未入化','懂船、潮与乱局；救船最后离开，九招败谢不以状态不好遮掉。','v6/npc-seasoned-traveler.webp','martialAdult'),
 st_guanlan:p('叶观澜','海天门内院第四席 · 未入化','更擅平地较艺，龙虎会一百零六合与郭洪同时被叫停；沈只在岛上闻报。','v6/npc-martial-adult.webp','martialAdult'),
 st_oldtutor:p('老教习','内院看人看地的前辈','肯说大约中段到中前段，也提醒换人、地、年就会变。','v6/npc-robed-elder.webp','robedElder'),
 st_xie:p('谢观海','第一席 · 九十余 · 入化多年','九手胜状态很好的叶孤舟，仍要处理门务而未住镇海院。','v6/npc-martial-elder-b.webp','martialElder'),
 st_zhou:p('周望海','沈四十九岁时补入第九','沈赢过他；处理两帮后七年不斗，风灾带回九船，适合那几年的职责。','v6/npc-martial-elder.webp','martialElder'),
 st_deckhand:p('接位船工','沈四十七岁风灾 · 原典留白人物','不是不肯接，要真知道谁能松、谁先进去；候夜便少接一份短工。','v6/npc-young-laborer.webp','porter'),
 st_fishelder:p('晒鱼老人','镇海院百岁旧人 · 确切境界未知','叶称师叔祖，一指点住六十三岁的沈；继续晒鱼，不被擅自指定为返真。','v6/npc-robed-elder-b.webp','robedElder'),
};
seaTideCharacters.st_an.portrait.looks={childV2:{file:'v6/npc-child-boy.webp',size:'auto 85%',position:'center bottom'},child:{file:'v5/npc-youth-blue.webp'},youth:{file:'v5/npc-youth-blue.webp'},adult:{file:'v6/npc-martial-adult-b.webp',size:'auto 150%'},late:{file:'v6/npc-martial-elder.webp',size:'auto 150%'}};
seaTideCharacters.st_ye.portrait.looks={late:{file:'v6/npc-martial-elder-b.webp'}};
const s=(name:string,time:string,art:string)=>({name,time,art});
export const seaTideScenes={
 st_latepier:s('归潮岛 · 楼下泊位','六十三岁以后 · 接课与接船','v5/quay.webp'),
 st_approach:s('东极 · 归潮岛外','十二岁 · 五日船程','v5/rainboat.webp'),st_trialshore:s('归潮岛 · 试门岸','四十七留十六','v5/quay.webp'),st_outeryard:s('海天门 · 外院','外院六年 · 十七岁','v6/longmen-backyard.webp'),st_smallboat:s('正传 · 潮行小船','十八岁 · 七日之后','v6/dongting-deck.webp'),st_workshore:s('白螺屿与归潮岛之间','十一年后 · 风前与风后','v5/quay.webp'),
 st_storm:s('东极 · 十一商船','二十九岁 · 三船撞礁','v5/storm.webp'),st_mast:s('将沉的船 · 断桅旁','二十余人未转','v6/dongting-deck.webp'),st_inner:s('海天门 · 内院','从近三十到六十三','v6/longmen-hall.webp'),st_court:s('内院 · 平整青石坪','第四与第六 · 都未入化','v6/taihua-court.webp'),st_teacourt:s('谢观海居处 · 茶碗旁','四十余岁 · 第一回看九招','v6/longmen-backyard.webp'),st_returnport:s('归潮岛 · 接班港','四十七岁七船 · 以后十四年','v5/quay.webp'),st_oldyard:s('镇海院 · 东崖之后','六十三岁 · 晒鱼','v6/qingxi-veranda.webp'),st_tower:s('望海楼 · 门内','所见之海，非海之尽','v6/qingxi-veranda.webp'),st_horizon:s('楼外 · 东海','口述之后 · 仍有海','v5/dawn.webp'),
};
export const seaTideEndings={st_next_step:'不稳里的下一步',st_next_watch:'下一港有人接'};
export const seaTideChapters=[['st_approach','一 · 吐了三日'],['st_trialshore','二 · 先会活'],['st_smallboat','三 · 稳错了'],['st_storm','四 · 三步与最后一个人'],['st_inner','五 · 第四与第六'],['st_teacourt','六 · 九招够了'],['st_returnport','七 · 七与九'],['st_oldyard','八 · 这么年轻'],['st_tower','九 · 所见之海']];
export const seaTideWork={slug:'sea-tide',file:'sea-tide.html',title:'海路两世 · 归潮岛',version:'sea-tide-2.0.0',prefix:'jianghu:chronicle:sea-tide:v2:',start:'抬头看望海楼',hook:'你赢了，<br>船沉了，算谁赢？',intro:'十二岁入门，六十三岁坐第九席。<br>你用了半生，才懂那张椅子要接住什么。',viewpoint:'沈见潮 · 十二至六十三岁及晚年口述',note:'第二册 · 一张椅子与下一班船',coverArt:'v5/quay.webp',chapters:seaTideChapters};

export const seaTideV1Work={...seaTideWork,slug:'sea-tide-v1',file:'sea-tide-v1.html',title:'海路两世 · 归潮岛 · 旧稿',version:'sea-tide-1.0.0',prefix:'jianghu:chronicle:sea-tide:v1:',note:'旧稿 · 继续原来的旅程与存档'};
