import type {Person} from './campaign-catalog.ts';
import {hengPortrait} from './heng-portraits.ts';
const p=(name:string,role:string,detail:string,file:string,archetype:string):Person=>({name,role,detail,portrait:{file,kind:'template',archetype,variant:file,position:'center top',size:file.startsWith('v6/')?'auto 150%':'auto 100%'}});
export const northCharacters:Record<string,Person>={
 nq_zhou:p('周定川','定北枪 · 六合馆','河朔地方宗师，一生未进北榜，教秦扎拦拿；不是因后来人更高就只剩一个不如。','v6/npc-martial-elder.webp','martialElder'),
 nq_yuan:p('阿原','六合同门 · 原典留白人物','比秦年长两岁，想开自己的夜班。离馆怎样交课会改变他的半年与探亲，不是只等师弟成名。','v5/npc-youth-blue.webp','youth'),
 nq_chu:p('楚怀锋','天门枪 · 秦第二位师父','旧北榜最高第四，初见秦三十二招落枪；自己也有能教的尽头，不以师父名分把人留到终老。','v6/npc-martial-elder-b.webp','martialElder'),
 nq_border:p('当年的北榜末席','秦初问天下榜的对手','一百六十余招胜秦，再问才平；不借当今榜位替旧年姓名乱对号。','v6/npc-martial-adult.webp','martialAdult'),
 nq_xue:p('薛云山','霸王神棍 · 当年北榜第二','七尺乌木棍与秦58岁的枪相争，208胜，拒绝让想抢回一招的人再急打一场。','v6/npc-seasoned-traveler.webp','martialAdult'),
 nq_mender:p('修椅老人','终南旧观借宿处','修一把木椅，让借宿人先劈半时辰柴。不先问他榜位。','v5/npc-elder-male.webp','elder'),
 nq_heng:p('司马衡','秦第三位师父 · 返真中段旧人','不改秦的六合门籍，教他放下枪三月再学；也教过另一位天岳。不是要后辈只记最强一位老师。','v5/npc-elder-male.webp','elder'),
 nq_hanbei:p('韩镇北','三次问枪的北地旧对手','170余、120余、约100，不以每枪更少便把自己说得不值再问。不是虎啸金刀韩世雄。','v6/npc-robed-elder.webp','robedElder'),
 nq_young:p('六合年轻弟子','后来的问枪者 · 原典留白人物','不因师长已入化便先会扎枪，也不必为一回不会寻找旧伤借口。','v6/npc-young-laborer.webp','porter'),
 nq_hanshi:p('韩世雄','虎啸金刀 · 门前一人','公平正面132招败秦，懂门里还远；能指出这次赢者仍被点伤的地方。','v6/npc-martial-elder.webp','martialElder'),
 nq_qinghe:p('清和道人','武当玄门第九','以藤问秦枪，不是天下第九；164松藤两指喉，称楚教得好，不为晚辈编一个正式旧胜负。','v6/npc-robed-elder-b.webp','robedElder'),
 nq_gu:p('顾长风','剑镇三江 · 南榜首 / 总谱第九','308胜秦高半筹，早练十余年的岁月有分量；称对方天赋高不等于今日不敢真赢。','v6/npc-martial-elder-b.webp','martialElder'),
 nq_liu:p('柳成章','金陵问艺旁观者','会问顾赢在哪，也能陪秦重走先动的一步；个人所见不是天下绝对判定。','v6/npc-robed-elder.webp','robedElder'),
};
northCharacters.nq_yuan.portrait.looks={adult:{file:'v6/npc-martial-adult-b.webp',size:'auto 150%'},late:{file:'v6/npc-martial-elder.webp',size:'auto 150%'}};
northCharacters.nq2_mender={...northCharacters.nq_mender,canonicalIdentity:'sima-heng',portrait:hengPortrait('later')};
northCharacters.nq2_heng={...northCharacters.nq_heng,canonicalIdentity:'sima-heng',portrait:hengPortrait('later')};
const s=(name:string,time:string,art:string)=>({name,time,art});
export const northScenes={
 nq_home:s('河朔 · 牲口行后院','秦天岳十三岁','v6/longmen-backyard.webp'),nq_school:s('城西 · 六合馆','从寅时到后来归馆','v6/longmen-hall.webp'),nq_fair:s('河朔 · 地方武会','二十岁三场胜','v5/arena.webp'),nq_chuyard:s('楚怀锋居处','二十九初试至后来探望','v6/longmen-backyard.webp'),nq_northfield:s('北地 · 问枪场','旧榜随当年 · 非今榜','v5/arena.webp'),nq_riverfield:s('黄河北岸旧校场','五十八 · 北榜第五问第二','v5/arena.webp'),nq_rainporch:s('终南旧观 · 檐下','六十一 · 大雨绕路','v6/nq-rainporch.webp'),nq_rainyard:s('旧观 · 雨院','第二日 · 木椅尚未修完','v6/longmen-backyard.webp'),nq_oldyard:s('终南 · 旧观院中','三月、三年与旧日茶席','v6/qingxi-veranda.webp'),nq_hanyard:s('河洛 · 韩家旧场','七十余后 · 132','v6/longmen-backyard.webp'),nq_wudang:s('武当紫霄峰 · 后院','坐稳北榜首后 · 164','v6/taihua-court.webp'),nq_garden:s('金陵城外旧园','两人入化多年 · 308','v6/qingxi-veranda.webp'),nq_gunroom:s('六合馆 · 枪房','八十余 · 三位师父的东西','v6/longmen-hall.webp'),
};
export const northEndings={nq_first_again:'仍从第一枪',nq_three_names:'三个人的名字'};
export const northChapters=[['nq_home','一 · 一百二十七'],['nq_chuyard','二 · 枪有'],['nq_riverfield','三 · 正面过不去'],['nq_rainporch','四 · 修椅的人'],['nq_oldyard','五 · 六十一还想改'],['nq_hanyard','六 · 进去了还问'],['nq_wudang','七 · 第九不是第九'],['nq_garden','八 · 岁月胜'],['nq_gunroom','九 · 三件东西']];
export const northV1Work={slug:'north-v1',file:'north-v1.html',title:'北枪与乾坤 · 三师一枪旧稿',version:'north-1.0.0',prefix:'jianghu:chronicle:north:v1:',start:'把竹竿放低半寸',hook:'十三岁肯重练，<br>六十一岁，还肯么？',intro:'从河朔旧馆，到终南雨夜。<br>三个人，把一杆枪教到他们各自的尽头。',viewpoint:'秦天岳 · 十三岁至八十余岁',note:'制作中 · 第一卷全链剧情草稿',coverArt:'v6/longmen-backyard.webp',chapters:northChapters};

export const northV2Work={...northV1Work,slug:'north-v2',file:'north-v2.html',title:'北枪与乾坤 · 三师一枪上一版',version:'north-2.0.0',prefix:'jianghu:chronicle:north:v2:',note:'司马衡 · 同一位老师的两段年景'};
export const northWork={...northV2Work,slug:'north',file:'north.html',title:'北枪与乾坤 · 三师一枪',version:'north-3.0.0',prefix:'jianghu:chronicle:north:v3:',note:'一杆枪，三位老师，仍从第一下练起。'};
