import type {Person} from './campaign-catalog.ts';
import {hengPortrait} from './heng-portraits.ts';
const p=(name:string,role:string,detail:string,file:string,archetype:string):Person=>({name,role,detail,portrait:{file,kind:'template',archetype,variant:file,position:'center top',size:file.startsWith('v6/')?'auto 150%':'auto 100%'}});
export const qianKunCharacters:Record<string,Person>={
 qk_tutor:p('少年时的教习','太极门演掌','被指出左脚一寸，肯自己站进去试；不把少年看对一处说成全会。','v6/npc-martial-adult.webp','martialAdult'),
 qk_xu:p('许师姐','太极同代门人 · 原典只留姓氏','转腰好，也会当面催灯与信。过日子的难处不会因同门入化返真便都替他消失。','v6/npc-mature-woman-b.webp','matureWoman'),
 qk_heng:p('司马衡','太极旧人 · 司马天岳的老师','司马十四正式收徒，教看得快的人慢；对另一位六合弟子则先离枪，不能以师承相通便改门籍。','v5/npc-elder-male.webp','elder'),
 qk_knifeman:p('地方刀客','十八岁第三场对手','三十余岁，以假滑步与袖尺真胜少年；不是需要后来人补判不合规的反派。','v6/npc-seasoned-traveler.webp','martialAdult'),
 qk_xue:p('薛百川','华山同代名手','29起五场平、平、司马半手胜、薛胜、司马胜；第三十七剑练十二年，仍真接每次变化。','v6/npc-martial-adult-b.webp','martialAdult'),
 qk_oldmaster:p('旧总谱末段宗师','司马四十三岁问手者','第七十余掌后退五步自停，不因此替自然半步命名绝招。','v6/npc-martial-elder.webp','martialElder'),
 qk_huashan:p('华山老宿','十七日门外等候之后','第十八日出门骂也真出手，不是只被少年诚心感动便送一部秘籍。','v6/npc-robed-elder.webp','robedElder'),
 qk_manager:p('当时的门务管事','太极门 · 原典留白人物','账、水、镖路得有人真管。能接普通务，不等于掌门四项职责也可无限等他归来。','v5/npc-clerk-male.webp','clerk'),
 qk_boy:p('改起手的年轻弟子','六十八岁 · 肩骨不同','半年走不顺不是不肯努力；换起手一遍顺，也仍能再问哪里紧。','v5/npc-youth-blue.webp','youth'),
 qk_retired:p('重出山的旧人物','初列总谱第一后真胜司马者','此后败、败、平，第四年拒再问；未写定姓名，不擅对号某个百岁旧人。','v6/npc-martial-elder-b.webp','martialElder'),
 qk_gatechild:p('混元院守门童子','周道玄院外','起初不识总谱第一，也不必为不识而受罚。','v5/npc-youth.webp','youth'),
 qk_zhou:p('周道玄','太极旧掌 · 混元院','宁无极私评居首非官方全知榜。73再29真胜司马，对天外旧事仍标或许与不知道。','v6/npc-robed-elder-b.webp','robedElder'),
 qk_zhang:p('张玄衡','武当旧首席','140余后使司马仍有力却无第二条路，与少年演掌的教习不是一人。','v6/npc-martial-elder.webp','martialElder'),
 qk_ye:p('叶无涯','东海上一代门主','海船51使司马落水，先问会游么；陆地结果没有被他在海上那次胜利包办。','v6/npc-seasoned-traveler.webp','martialAdult'),
 qk_youngscribe:p('晚来记录者','太极后辈 · 原典留白人物','敢说茶苦，手拿杯先放好才能打；不替掌门将不知道写成已经尽头。','v6/npc-martial-adult.webp','martialAdult'),
};
qianKunCharacters.qk_manager.portrait.looks={late:{file:'v6/npc-robed-elder.webp',size:'auto 150%'}};
qianKunCharacters.qk_xu.portrait.looks={late:{file:'v5/npc-elder.webp',size:'auto 100%'}};
qianKunCharacters.qk2_heng_earlier={...qianKunCharacters.qk_heng,canonicalIdentity:'sima-heng',portrait:hengPortrait('earlier')};
qianKunCharacters.qk2_heng_later={...qianKunCharacters.qk_heng,canonicalIdentity:'sima-heng',portrait:hengPortrait('later')};
const s=(name:string,time:string,art:string)=>({name,time,art});
export const qianKunScenes={
 qk_training:s('太极门 · 少年演掌院','司马天岳十四岁','v6/longmen-backyard.webp'),qk_oldyard:s('司马衡居处','从十四岁到八十余','v6/qingxi-veranda.webp'),qk_path:s('太极门 · 送信途中','少年 · 剑与信','v6/longmen-backyard.webp'),qk_fair:s('地方武会','十八岁 · 袖中短尺','v5/arena.webp'),qk_swordyard:s('华山问剑处','二十九以后 · 五次较艺','v6/taihua-court.webp'),qk_oldtrial:s('旧总谱人物问手处','四十三 · 七十余','v6/longmen-backyard.webp'),qk_mountain:s('华山 · 老宿门外','四十五至五十五 · 第十八日','v6/taihua-steps.webp'),qk_office:s('太极门 · 门务处','四十五以后 · 账与镖路','v6/longmen-hall.webp'),qk_headroom:s('太极门 · 掌门与传功处','七十一以后 · 四件大事','v6/longmen-hall.webp'),qk_youngyard:s('太极门 · 弟子练处','六十八 · 半年与今日','v6/longmen-backyard.webp'),qk_rankyard:s('旧人物问手处','总谱首两年之后 · 再三问','v6/longmen-backyard.webp'),qk_gate:s('终南混元院 · 门前','门前等候','v6/reusable-stone-inner-gate.webp'),qk_mixedyard:s('混元院 · 云外','七十三加二十九','v6/qingxi-veranda.webp'),qk_wudang:s('武当 · 闭门问艺','一百四十余 · 仍有力','v6/taihua-court.webp'),qk_boat:s('东海 · 叶无涯海船','第五十一 · 水里','v6/dongting-deck.webp'),qk_lateyard:s('太极门 · 后来的茶席','好剑与苦茶','v6/qingxi-veranda.webp'),
};
export const qianKunEndings={qk_open_lesson:'问得到的一课',qk_open_mountain:'云外还可问'};
export const qianKunChapters=[['qk_training','一 · 脚短一寸'],['qk_fair','二 · 人会撒谎'],['qk_swordyard','三 · 真是赞美'],['qk_oldtrial','四 · 明日练什么'],['qk_youngyard','五 · 这个人这一手'],['qk_headroom','六 · 麻烦的掌门'],['qk_gate','七 · 谱外等九日'],['qk_boat','八 · 会游水么'],['qk_lateyard','九 · 最好没有']];
export const qianKunV1Work={slug:'qian-kun-v1',file:'qian-kun-v1.html',title:'北枪与乾坤 · 不会算账旧稿',version:'qian-kun-1.0.0',prefix:'jianghu:chronicle:qian-kun:v1:',start:'指出那一寸',hook:'掌门不会算账。<br>可这一掌，他看见了。',intro:'十四岁看出脚短一寸。<br>半生以后，才肯慢下来，看眼前这个人。',viewpoint:'司马天岳 · 十四岁到晚年',note:'制作中 · 第二卷全链剧情草稿',coverArt:'v6/qingxi-veranda.webp',chapters:qianKunChapters};

export const qianKunV2Work={...qianKunV1Work,slug:'qian-kun-v2',file:'qian-kun-v2.html',title:'北枪与乾坤 · 不会算账上一版',version:'qian-kun-2.0.0',prefix:'jianghu:chronicle:qian-kun:v2:',note:'司马衡 · 同一位老师的两段年景'};
export const qianKunWork={...qianKunV2Work,slug:'qian-kun',file:'qian-kun.html',title:'北枪与乾坤 · 不会算账',version:'qian-kun-3.0.0',prefix:'jianghu:chronicle:qian-kun:v3:',note:'看懂一掌，也得把这一程交清。'};
