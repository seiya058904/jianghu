import type {Person} from './campaign-catalog.ts';
const p=(name:string,role:string,detail:string,file:string):Person=>({name,role,detail,portrait:{file,kind:'template',archetype:file.startsWith('v5/')?'v5-borrowed':'martialAdult',variant:file,position:'center top',size:file.startsWith('v6/')?'auto 150%':'auto 100%'}});
export const luhuaCharacters:Record<string,Person>={
 lh_meng:p('孟守川','听潮门 · 听潮刀','梁十一拜师时四十八，相差三十七年。最高前代洞庭十二，梁六十三时百岁冬逝。','v6/npc-martial-adult-b.webp'),
 lh_peddler:p('卖药老人','长沙码头 · 原典未名','领情，也要把受阻的货送到；梁打完那一下以后，他还有日子要过。','v5/npc-elder-male.webp'),
 lh_apo:p('阿泊','船上帮手与后来船匠 · 兼容补写','想学修新船，有自己的工期、伤手和后来能做成的桨托，不以永远跟梁出头为毕生所求。','v6/npc-young-laborer.webp'),
 lh_jiao:p('焦定海','黑鱼寨 · 水会旧敌','梁二十七多出的半刀生怨，私派截杀，不是全寨授意；后来又同船剿赤蛇。','v6/npc-martial-adult.webp'),
 lh_oar:p('五湖铁桨高手','赤蛇一役救孟者 · 原典未名','袖弩忽来时救孟，功归本人；梁在另一条船上有自己的职责。','v6/npc-martial-adult-b.webp'),
 lh_duqing:p('杜庆山','白石三雄之一 · 口传小名','能胜梁年轻弟子，不出镇争榜。练武不必先以出镇为终点。','v5/npc-elder-male.webp'),
 lh_oldboat:p('沈老七','西平艄公','黑瘦的老艄公，断缆盐船上半尺篙点能借桥墩与水势。','v6/npc-martial-elder.webp'),
 lh_shen:p('沈鹤汀','江州沧浪门 · 一苇横江','揭名后的沈老七，四十余年前旧南十九，右腿重伤主动退。只教一段，不正式收梁；黑潮时仍未入化。','v6/npc-martial-elder.webp'),
 lh_child:p('偷药的孩子','岳阳 · 原典未名','沈让梁找，不许抓。肯不肯说话，也要由他自己来。','v5/npc-youth.webp'),
 lh_boxer:p('乡间拳师','只许守的一场 · 原典未名','不替名刀客演示本可赢的体面，真向站在眼前的人出拳。','v6/npc-martial-adult-b.webp'),
 lh_wei:p('魏隆','江陵府榜首','梁五十四时四十余招负，仍有自己想再问的一段。','v6/npc-martial-adult.webp'),
 lh_fang:p('方天螯','旧闽海十八雄第二','梁海上三战，七十四胜梁、一百七十余平、二百二十六负，不合成一场大捷。','v6/npc-martial-elder-b.webp'),
 lh_ahang:p('阿航','海上船手 · 兼容补写','熟潮，不会因为看过梁如何救舟便自动会接替；肯承认接不到，也要自己练。','v6/npc-martial-adult-b.webp'),
 lh_ye:p('叶孤舟','海天门 · 海战教者','第二阶段教梁海战，主船先被厉逼退，后来向梁说另一边亲见的一战。','v6/npc-robed-elder.webp'),
 lh_luo:p('罗百仞','旧沿海路前位','青屿左翼与梁交手一百二十余招负。','v6/npc-robed-elder.webp'),
 lh_xu:p('许玄谷','青城 · 梁上山时九十九','五年教梁从水上能站到自己也能上岸；年龄不自动说明境界。','v6/npc-robed-elder-b.webp'),
 lh_carrier:p('成都送货人','第二年下山所见 · 兼容补写','有自己的担子、路与等着过车的人，不为名家的领悟停下整条街。','v5/npc-porter.webp'),
 lh_yue:p('岳天彪','西川第十','黑竹寨药路一役百余招负，药路的事仍要同运药人说。','v6/npc-martial-elder-b.webp'),
 lh_du:p('杜清崖','青城教习','梁上山第五年，两百余招负半手。','v6/npc-martial-elder.webp'),
 lh_lu:p('卢百川','当年南榜第三十五','梁八十时一百七十九招胜，已在席二十余年。','v6/npc-robed-elder.webp'),
 lh_tang:p('唐九龄','当年南榜第三十六','梁八十三时七十四，比梁小九，入榜七年。第二百三十五慢刀被先停右肋，亲口认负。','v6/npc-martial-elder-b.webp'),
 lh_newstudent:p('小荻','梁百岁后的晚来弟子 · 兼容补写','不是阿泊换一个年代仍年轻。肯认自己有两处教不全，也会自己带下一班。','v5/npc-youth-blue.webp'),
};
luhuaCharacters.lh_meng.portrait.looks={mid:{file:'v6/npc-martial-elder.webp'},late:{file:'v6/npc-robed-elder-b.webp'}};
luhuaCharacters.lh_apo.portrait.looks={adult:{file:'v6/npc-martial-adult.webp'}};
const s=(name:string,time:string,art:string)=>({name,time,art});
export const luhuaScenes={
 lh_school:s('听潮门 · 门里','十一岁起 · 后来六十三冬','v6/longmen-backyard.webp'),lh_market:s('长沙码头','二十余 · 出刀以后','v6/dongting-dock.webp'),lh_youthmeet:s('洞庭青年水会','二十七 · 多半刀','v5/arena.webp'),lh_redbank:s('赤蛇滩 · 并船','旧仇同船','v6/dongting-raid.webp'),lh_townyard:s('镇中刀馆','三十余开馆 · 四十余前十','v6/longmen-backyard.webp'),lh_emptyboat:s('空货船','四十五 · 赵一百零六','v6/dongting-deck.webp'),lh_watermeet:s('洞庭水会','四十七 · 五人问一席','v6/dongting-dock.webp'),lh_trialboat:s('试船水面','第三日 · 再问蒋衡','v6/dongting-deck.webp'),lh_raid:s('劫船水面','问席暂停','v6/dongting-raid.webp'),lh_xiping:s('西平 · 断缆盐船','五十 · 半尺与两丈','v5/bridge.webp'),lh_yueyang:s('岳阳街口','找孩子 · 不许抓','v5/quay.webp'),lh_townpractice:s('乡间拳场','只守 · 不准赢','v6/longmen-backyard.webp'),lh_reedboat:s('芦苇水边','五十试手 · 后来七十二与七十三','v5/reeds.webp'),lh_ancestral:s('听潮门 · 祭祖较艺','五十一 · 自己那一刀','v6/longmen-backyard.webp'),lh_jiangling:s('江陵水陆会','五十四 · 各有一场','v5/arena.webp'),lh_blackreef:s('黑礁海面','五十六 · 七十四与十一船','v5/storm.webp'),lh_seatraining:s('海天门船边','剿海第二阶段 · 一百七十余平','v6/dongting-deck.webp'),lh_qingyu:s('青屿左翼','五十九 · 方二百二十六与罗一百二十余','v5/storm.webp'),lh_seaafter:s('回岸船边','主船战后 · 另一边的口述','v6/dongting-dock.webp'),lh_winter:s('听潮门冬院','六十三 · 孟百岁逝','v6/longmen-backyard.webp'),lh_latermeet:s('洞庭旧约处','六十五至七十一','v6/dongting-dock.webp'),lh_qingcheng:s('青城 · 山院','七十四起五年 · 许九十九','v6/taihua-steps.webp'),lh_blackbamboo:s('黑竹寨药路','上山第三年','v5/ridge.webp'),lh_southground:s('南榜问艺处','八十至八十三 · 不是同一场','v5/arena.webp'),lh_grave:s('孟墓前 · 两碗酒','八十四 · 七十三年','v5/ridge.webp'),lh_latehall:s('听潮门 · 晚来刀班','九十七退席 · 百岁以后','v6/longmen-hall.webp'),
};
export const luhuaFacts={lh_shen_name:{name:'芦花渡 · 沈老七的旧名',text:'沈鹤汀，江州沧浪门一苇横江，旧南十九，右腿重伤主动退。此后只教梁一段，不正式收徒；黑潮时仍未入化。'}};
export const luhuaEndings={lh_hall_after:'留堂的一月',lh_coast_after:'沿岸归来'};
export const luhuaWork={slug:'luhua',file:'luhua.html',title:'照水刀 · 芦花渡',version:'luhua-1.0.0',prefix:'jianghu:chronicle:luhua:v1:',start:'背着包袱进门',hook:'十一岁来还命，<br>七十三年才到榜前。',intro:'从洞庭的一条船，到南榜最后一席。<br>刀之外，还要学怎样走出去。',viewpoint:'梁照水 · 十一岁至百岁后',note:'制作中 · 六事件单元与两种晚来教法',coverArt:'v5/reeds.webp',chapters:[['lh_school','一 · 半刀以后'],['lh_emptyboat','二 · 五人一席'],['lh_xiping','三 · 沈老七'],['lh_jiangling','四 · 黑潮三年'],['lh_winter','五 · 去青城学走路'],['lh_southground','六 · 最末也是南榜']]};
