import type {Person} from './campaign-catalog.ts';
const p=(name:string,role:string,detail:string,file:string):Person=>({name,role,detail,portrait:{file:`v6/${file}.webp`,kind:'template',archetype:'v6-borrowed',variant:file,position:'center top',size:'auto 150%'}});
export const whiteStoneCharacters:Record<string,Person>={
 ws_stepelder:p('传古步的老人','雪灾幸存十二日 · 原典未名','全门唯一完整知古步者，接手者三年后承认末段断一截；不补姓名、境界或被救活分支。','npc-robed-elder'),
 ws_swordelder:p('老剑师','白石内议 · 原典未名','练剑八十年，最初问看掌何用；不因争论补旧总谱名次。','npc-martial-elder-b'),
 ws_messenger:p('交信的门人','祁玄岳下山前 · 改编新增','交多年积信，原送信者已病死；非一位暗藏答案的返真长辈。','npc-martial-adult-b'),
 ws_visitor:p('少林接待者','等法晦十三日 · 原典未名','来问等什么，非能任意闯后山的普通弟子旁观者。','npc-aged-monk'),
 ws_fahui:p('法晦','少林退位老人','百岁前退门务，撤谱数十年，返真后又三十余年；97先止无正式胜负，等祁先错是后来对弟子说。','npc-aged-monk'),
 ws_dongxuan:p('司马洞玄','太极旧掌 · 前代总谱第一','四十余年前榜首，退位后在山三十余年；日暮弃先后守，再停认今日你高，无准确招数。','npc-martial-elder'),
 ws_cangshan:p('藏山公','八卦慕容氏 · 名不可考','从不入榜，三日无明胜负，闭门一月所思未知。','npc-robed-elder-b'),
 ws_guicang:p('陆归藏','华山退位旧剑宗','旧谱最高第四，退位五十余年；第19日见，六十余招先收非认输。不是陆栖真、陆清泉或孟归藏。','npc-martial-elder-b'),
 ws_gatekeeper:p('守谷弟子','祁玄岳归山 · 原典未名','雪中未认得归来的祁，不将此人补为知道昆仑全部秘密的角色。','npc-martial-adult'),
 ws_gu:p('顾寒声','六位随学者之一','模仿二十余年，三个月停剑后删，终身未返真。后段本人视角，不在自己对面站另一顾。','npc-martial-adult-b'),
 ws_qi:p('祁玄岳','玉虚真人 · 归山以后','归山授六弟子及顾本人视角时出现；问山时玩家即祁，不在自己对面站画像。可靠记录终止，不补确定寿命。','npc-robed-elder'),
 ws_guest:p('来客','公孙无我时代 · 对话来客','合并未名来访者，不将比较祖师当真有跨年代一战。','npc-martial-elder'),
 ws_presentelder:p('谷中老人','洛阳之后 · 普通交接','今日谷中接待，未名未判境界，不冒称就是某隐世老祖。','npc-robed-elder-b'),
};
const s=(name:string,time:string,art:string)=>({name,time,art});
export const whiteStoneScenes={ws_snow:s('雪山院落入口','院外 · 冬日','v6/reusable-snow-courtyard.webp'),ws_room:s('山中客舍与旧卷','客舍 · 旧卷在侧','v6/taihua-guest.webp'),ws_court:s('山中旧坪','山中 · 日间','v6/ws-snow-court.webp'),ws_monkgate:s('少林山门外','祁玄岳六十余 · 第十三日','v6/reusable-stone-inner-gate.webp'),ws_trial:s('门内较艺处','门内 · 问手','v6/longmen-backyard.webp'),ws_cliff:s('华山旧栈道旁','第十九日 · 六十余招','v5/ridge.webp')};
export const whiteStoneFacts={ws_snow_gap:{name:'白石 · 第二个人',text:'雪灾老人续命12日，3年后承认古步断一截；陆照寒不广收，第二人不必同路但须理解断处。白石之议是外名，准确位置不强证。'},ws_ninety_seven:{name:'白石 · 九十七手',text:'法晦97先止无胜负，祁未拔剑；不将后来只能等他先错变成当日认负。'},ws_old_people:{name:'白石 · 榜后旧人',text:'十余年11可靠战6明确胜5未定，无可确认负，非见完天下；洞玄日暮弃先认今日高无招数，藏山3日未定，陆19日60余先收非认输。'},ws_cannot_copy:{name:'白石 · 人活着也不能复制',text:'6人随祁，2后来入化，最强近返真仍无人学成；顾20余年像祁，停3月后删，终未返真。遗录可读不可照练。'},ws_no_lifespan:{name:'白石 · 最后可靠的记录',text:'祁回山数十年后尚有可靠见闻，此后未知。无生之乱时不出不等于确定死；玉虚崖名称亦据说。'},ws_two_crowns:{name:'白石 · 两次第一',text:'公孙无我第一次第一/退出/多年后再第一固定，年轻快与后来会剑是宁无极个人评语。没见祁，不补比较战。今夏千秋总谱5，山后人数与谁最强未知。'}};
export const whiteStoneEndings={ws_outside_after:'带回一个没懂的问题',ws_receiving_after:'等到来接班的人'};
export const whiteStoneWork={slug:'white-stone',file:'white-stone.html',title:'白石谷外',version:'white-stone-1.0.0',prefix:'jianghu:chronicle:white-stone:v1:',start:'翻开雪后未接完的一页',hook:'人可以少。<br>路不能只剩一个人。',intro:'雪灾之后，只剩十二日。<br>再高的祖师，也不能替下一代活。',viewpoint:'多代纪事 · 各有其人',note:'雪灾、问山与两度登首',coverArt:'v6/reusable-snow-courtyard.webp',chapters:[['ws_snow','一 · 十二日'],['ws_court','二 · 白石之议'],['ws_monkgate','三 · 问山'],['ws_cliff','四 · 足够的六十招'],['ws_room','五 · 不许照练']]};
