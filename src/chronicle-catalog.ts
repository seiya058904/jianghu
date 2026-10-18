import {kuheV2Characters} from './kuhe-v2-catalog.ts';
import {beyondRankingCharacters,beyondRankingScenes,beyondRankingFacts,beyondRankingEndings,beyondRankingWork} from './beyond-ranking-catalog.ts';
import {whiteStoneCharacters,whiteStoneScenes,whiteStoneFacts,whiteStoneEndings,whiteStoneWork} from './white-stone-catalog.ts';
import {xuanmenCharacters,xuanmenScenes,xuanmenFacts,xuanmenEndings,xuanmenWork} from './xuanmen-catalog.ts';
import {luoyangCharacters,luoyangScenes,luoyangFacts,luoyangEndings,luoyangWork,bambooWork} from './luoyang-catalog.ts';
import {taihuaV2Characters,taihuaV2Scenes,taihuaV2Facts,taihuaV2Chapters} from './taihua-v2-catalog.ts';
import {twelfthLifeV2Characters,twelfthLifeV2Scenes} from './twelfth-life-v2-catalog.ts';
import {twelfthLifeCharacters,twelfthLifeScenes,twelfthLifeEndings,twelfthLifeWork,twelfthLifeV2Work,twelfthLifeV1Work} from './twelfth-life-catalog.ts';
import {luhuaCharacters,luhuaScenes,luhuaEndings,luhuaFacts,luhuaWork} from './luhua-catalog.ts';
import {deadRankingCharacters,deadRankingScenes,deadRankingEndings,deadRankingWork} from './dead-ranking-catalog.ts';
import {northNotesCharacters,northNotesScenes,northNotesEndings,northNotesFacts,northNotesWork} from './north-notes-catalog.ts';
import {qianKunCharacters,qianKunScenes,qianKunEndings,qianKunWork,qianKunV2Work,qianKunV1Work} from './qian-kun-catalog.ts';
import {northCharacters,northScenes,northEndings,northWork,northV2Work,northV1Work} from './north-catalog.ts';
import {seaTideCharacters,seaTideScenes,seaTideEndings,seaTideWork,seaTideV1Work} from './sea-tide-catalog.ts';
import {seaCharacters,seaScenes,seaEndings,seaWork,seaV1Work} from './sea-catalog.ts';
import {jadeCharacters,jadeScenes,jadeEndings,jadeWork,jadeV1Work} from './jade-catalog.ts';
import {jadeThievesCharacters,jadeThievesScenes,jadeThievesEndings,jadeThievesFacts,jadeThievesWork,jadeThievesV1Work} from './jade-thieves-catalog.ts';
import {sevenQuestionsCharacters,sevenQuestionsScenes,sevenQuestionsEndings,sevenQuestionsWork,sevenQuestionsV1Work} from './seven-questions-catalog.ts';
import {twoSwordsCharacters,twoSwordsScenes,twoSwordsEndings,twoSwordsWork,twoSwordsV1Work} from './two-swords-catalog.ts';
import type {Person} from './campaign-catalog.ts';
import {kuheCharacters,kuheScenes,kuheEndings,kuheFacts,kuheWork,kuheV1Work,kuheV2Work} from './kuhe-catalog.ts';
import {qingshiCharacters,qingshiScenes,qingshiEndings,qingshiWork,qingshiV1Work,qingshiV2Work} from './qingshi-catalog.ts';
// Borrowed portraits remain templates until dedicated images are produced and reviewed.
const person=(name:string,role:string,detail:string,file:string):Person=>({name,role,detail,portrait:{file:`v5/${file}.webp`,position:'center top',size:'contain',kind:'template',archetype:'v5-borrowed',variant:file}});
export const chronicleCharacters:Record<string,Person>={
 ...kuheCharacters,
 ...kuheV2Characters,
 ...qingshiCharacters,
 ...twoSwordsCharacters,
 ...sevenQuestionsCharacters,
 ...jadeThievesCharacters,
 ...jadeCharacters,
 ...seaCharacters,
 ...seaTideCharacters,
 ...northCharacters,
 ...qianKunCharacters,
 ...northNotesCharacters,
 ...deadRankingCharacters,
 ...luhuaCharacters,
 ...twelfthLifeCharacters,...twelfthLifeV2Characters,
 ...taihuaV2Characters,
 ...luoyangCharacters,
 ...xuanmenCharacters,
 ...whiteStoneCharacters,
 ...beyondRankingCharacters,
 lm_zhang_v2:{name:'章复生',role:'南榜第三十六 · 龙门问刀',detail:'七十二岁；V2专属形象，旧稿lm_zhang保留通用模板以保旧画面。夜谈与贺同席，未将差一点判为贺今日可进南榜。',portrait:{file:'v6/lm-zhang.webp',position:'center top',size:'contain',kind:'dedicated'}},
 th_shen:person('沈照微','八卦门青序弟子','三十岁，师从慕容季山。能坦然承认慢了半息，也会把下一场的账记上三年。','su'),
 th_xie:person('谢临川','华山剑宗弟子','二十八岁，剑快，也怕旁人把他输过的一剑说轻了。夜里的私试不是正式胜负。','xu'),
 th_ming:person('明澄','少林慧定弟子','三十七岁。端汤看同辈较劲时会笑，真正上场却不肯少出半分力。','npc-monk'),
 th_huo:person('霍停云','昆仑青序弟子','三十三岁，十四岁入白石谷，前师陆寒石。看着不显眼，剑放得很安静；会先看对手，才说自己想怎样打。','lu'),
 th_sima:person('司马承一','太极青序弟子','三十五岁。夜里不肯让话，正式场上也会输；愿意把没打完的较劲留到来年。','rong'),
 th_zhang:person('张玄岳','武当正序前辈','八十二岁，未入化。肯听年轻人问，也会先让他指出自己还想往哪里走。','han'),
 th_luqi:person('陆栖真','昆仑正序前辈','九十二岁，八十六岁入化。上场仍要认真问手，不因年长就只坐着评别人。','du'),
 th_ji:person('季闻鹤','华山正序前辈','八十六岁，八十一岁入化。左手复剑的细处，不是年轻人看一遍就能学会。','han'),
 th_murong:person('慕容怀真','八卦正序前辈','七十六岁，未入化。阴天腿痛，却不许别人拿旧伤解释正式败绩。','du'),
 th_chensima:person('司马沉岳','太极正序前辈','七十八岁。与慕容怀真是旧对手，打完仍能分栗糕；不是司马承一。','han'),
 th_mu:person('穆玄真','华山宗主','华山宗主，本届上座之一，已返真。话很少，问人看到了哪里，总要他先说自己的判断。','du'),
 th_bro:person('同门师兄','武当原定青序弟子','右膝受伤，只能让出青序的位置。多年准备忽然停在门口，不甘心也不愿拿同门出气。','pei'),
 th_leader:person('领队老人','武当随行领队','武当随行领队。临时补位的安排由他传下，行装和时辰也由他催，不能只管一句好好打。','han'),
 th_guestelder:person('嗑瓜子的前辈','华山正序人物','六十多岁的华山前辈，嗑着瓜子听晚辈斗嘴。夜院里动手太急，他会先问还有没有人记得明日的正式场。','du'),
 lm_xu:person('许重山','镇河门 · 截浪刀','宋九川再传，开馆教了两代门人。五十六岁与清和问手后，刀路渐简；少年时答不出的第七刀，他至今仍会拿来问人。','han'),
 lm_shi:person('石惊川','武陵回雁门 · 断云剑','赴河中问剑时六十三岁，曾坐辰州榜首十九年，携真剑问艺河中。想把自己还能走多远看清，不肯把对手的本事说轻。','pei'),
 lm_he:person('贺景庭','河中混元门 · 混元手','秋会时九十六岁，在河中首位坐了三十七年。旧相识敢当面骂他，他也不把所有话都当作对榜首失礼。','du'),
 lm_luo:person('罗天庆','河中 · 金背虎','曾三次问贺景庭皆败。别人替他数离首位还差多少，他更记得自己每回多走了几招。','han'),
 lm_zhang:person('章复生','南榜第三十六','七十二岁，刚列南榜末席的老剑客。赴会用木剑，愿意让人看，也不肯先以客气抹掉认真较艺。','du'),
 lm_fan:person('樊承业','潼关第一 · 锁岳刀','潼关名家，来秋会问刀，也想多看一位南榜剑客出手。替人邀约时嗓门很响，自己的刀却沉得住。','han'),
 lm_shenchang:person('沈长庚','洛西第一 · 玉碑掌','洛西名家，与贺景庭是能当面说难听话的旧相识。打到该停时自己停，不需要旁人替他圆成平手。','du'),
 lm_guang:person('广渡','晋南名宿 · 铜骨禅杖','晋南名宿，携禅杖赴龙门秋会。听场边的人说胜负，也看他们肯不肯照应刚退下的人。','npc-monk'),
 lm_qinghe:person('清和道人','当年的武当玄门客','来河中时八十四岁，玄门九席第九。访宋九川旧居，取三尺藤条问许重山木刀；不是来替镇河门做招牌。','npc-elder-male'),
 dt_liang:person('梁照水','听潮门 · 照水刀','十一岁拜孟守川，曾想替父亲还一条命。多年护船、问艺以后，才逐渐知道出刀之后还要谁来善后。','pei'),
 dt_meng:person('孟守川','听潮门 · 听潮刀','本篇八十四岁，旧洞庭路最高十二。教梁也替他善后，问席时回避自己徒弟的定席票。','du'),
 dt_chen:person('陈震','澧州榜首 · 翻江索','这一回问洞庭席的五人之一。护船和用索都有自己的办法，不愿先被当成别人成名路上的一段。','rong'),
 dt_jiang:person('蒋衡','五湖门护法 · 水龙手','五湖门护法，长期在水上行走。看候选者怎么站船、怎么转身，也要拿出自己的手段争席。','han'),
 dt_han:person('韩寿山','沅州名宿','沅州名宿，此回问洞庭路席的五名候选之一。看过别人前场的手段，自己上场仍要重新问。','du'),
 dt_zhuo:person('卓长河','洞庭老刀客','洞庭老刀客，也是这一席的候选。转刀和落脚积了多年工夫，不因一场没有分出胜负就少了分量。','han'),
 dt_zhao:person('赵崇山','洞庭 · 镇浪篙','在船上用了五十年的篙。看人站哪一处，比看刀尖伸得多远还快；空船也不是真的没有可用的东西。','du'),
 dt_weihu:person('魏虎','翻鳞鬼 · 水匪','人称翻鳞鬼的水匪，盯着货路的松处动手。刀逼近谁，船上其他人便也得想退路。','xu'),
 dt_weicang:person('魏苍','铁牙寨余部匪首','铁牙寨余部匪首，与魏虎同来劫船，用戟逼住船沿。陈震守的那一边，有他自己的危险。','pei'),
 dt_wang:person('汪苇','听潮门护船帮手','听潮门普通护船帮手，想挣一份实在工钱，也想学会在水上接人。家中米缸不会因为他说见了世面就自己装满。','npc-youth-blue'),
 qw_zhao:person('赵承晏','荣王 · 青溪问艺者','从小听惯夸奖，越想认真练，越怕旁人把结果先写好。会心急，会想换老师，也还想要一场没人替他让的较艺。','rong'),
 qw_chen:person('陈三平','青溪老馆师','开馆二十多年，两问正式小榜皆败。武功不及王爷以前请的名家，却肯先让他把自己真能用的东西练清。','han'),
 qw_lu:person('陆清婉','荣王妃','不习武，看得出谁把丈夫的急心当生意。名家拳谱能封起来，不必烧；该换的药，也不因今日输赢少一帖。','npc-merchant'),
 qw_gu:person('顾廷安','王府长史','王爷想去真打，他得把人平安带回。照应与干涉之间的分寸，不是被骂一句就能放下的职责。','npc-clerk-male'),
 qw_xue:person('薛直','开山拳 · 青溪第十二','有自己的武馆和家人，不愿凭空背上一场对王爷让或不让的传闻。敢打不是生来毫无顾虑。','han'),
 qw_shi:person('石横','铁肩 · 青溪榜末人物','认真问手，也要承认自己的旧膝什么时候碍了事；不肯因为对方尊贵，就让自己的一场胜负变轻。','npc-porter'),
 qw_pan:person('潘世荣','青溪地方名家','长期活跃于本地，战绩扎实。比谁的名号响，更在意榜房有没有把每一段履历看清。','npc-merchant-male'),
 qw_zhou:person('周伏生','返乡的青溪武人','在外多年，回青溪才一年多。正面本领与本地长期履历，是两件都不能凭一声不服删掉的事。','npc-traveler'),
 qw_wei:person('卫庆','青溪名宿','履历很长，近年也有失手。别人只想拿他的两败作一句话，他仍会把具体哪一场说清。','npc-elder-male'),
 qw_sun:person('孙毅','旧日宫中教习','晚年已百岁上下，耳背，仍认得那个早年问他要绝招的学生。手脚的位置，从来比别人夸得响不响实在。','du'),
 qw_fei:person('费春棠','与你共教的馆师','与你共教的馆师，有自己要教的学生和要付的屋钱。肯替你照看馆门，前提是你报明时日与工钱。','npc-merchant'),
};
chronicleCharacters.th_shen.portrait={file:'v6/th-shen.webp',position:'center top',size:'contain',kind:'dedicated',moods:{amused:'v6/th-shen-amused.webp',intent:'v6/th-shen-intent.webp',sharp:'v6/th-shen-intent.webp'}};
chronicleCharacters.th_huo.portrait={file:'v6/th-huo.webp',position:'center top',size:'contain',kind:'dedicated',moods:{intent:'v6/th-huo-intent.webp',uneasy:'v6/th-huo-uneasy.webp'}};
for(const [id,file] of [['lm_xu','lm-xu'],['lm_he','lm-he'],['lm_shi','lm-shi']])chronicleCharacters[id].portrait={file:`v6/${file}.webp`,position:'center top',size:'contain',kind:'dedicated'};
chronicleCharacters.lm_xu.portrait.moods={amused:'v6/lm-xu-amused.webp',intent:'v6/lm-xu-intent.webp',sharp:'v6/lm-xu-intent.webp'};
chronicleCharacters.lm_he.portrait.moods={amused:'v6/lm-he-amused.webp',sharp:'v6/lm-he-sharp.webp'};
chronicleCharacters.lm_shi.portrait.moods={intent:'v6/lm-shi-intent.webp',uneasy:'v6/lm-shi-uneasy.webp'};
for(const [id,file] of [['dt_liang','dt-liang'],['dt_chen','dt-chen']])chronicleCharacters[id].portrait={file:`v6/${file}.webp`,position:'center top',size:'contain',kind:'dedicated'};
chronicleCharacters.dt_liang.portrait.moods={amused:'v6/dt-liang-amused.webp',intent:'v6/dt-liang-intent.webp',sharp:'v6/dt-liang-intent.webp'};
chronicleCharacters.dt_chen.portrait.moods={intent:'v6/dt-chen-intent.webp',sharp:'v6/dt-chen-intent.webp',hurt:'v6/dt-chen-hurt.webp'};
chronicleCharacters.qw_zhao.portrait={file:'v6/qw-zhao-58.webp',position:'center top',size:'contain',kind:'dedicated',looks:{age44:{file:'v6/qw-zhao-44.webp'},age52:{file:'v6/qw-zhao-52.webp'},age58:{file:'v6/qw-zhao-58.webp'}}};
chronicleCharacters.qw_zhao.portrait.looks!.age58.moods={amused:'v6/qw-zhao-58-amused.webp',intent:'v6/qw-zhao-58-intent.webp',sharp:'v6/qw-zhao-58-intent.webp'};
// Generic templates may recur between works; dedicated hero faces never do.
const templates:Record<string,[string,string,string?]>={
 th_xie:['martialAdult','npc-martial-adult'],th_sima:['martialAdult','npc-martial-adult-b'],
 th_ming:['monk','npc-monk','v5'],th_zhang:['robedElder','npc-robed-elder'],
 th_luqi:['martialElder','npc-martial-elder-b'],th_ji:['robedElder','npc-robed-elder-b'],
 th_murong:['martialElder','npc-martial-elder'],th_chensima:['elder','npc-elder-male','v5'],
 th_mu:['robedElder','npc-robed-elder-b'],th_bro:['youth','npc-youth-blue','v5'],
 th_leader:['elder','npc-elder-male','v5'],th_guestelder:['martialElder','npc-martial-elder'],
 lm_luo:['elder','npc-elder-male','v5'],lm_zhang:['martialElder','npc-martial-elder'],
 lm_qinghe:['robedElder','npc-robed-elder-b'],
 lm_fan:['elder','npc-elder-male','v5'],lm_shenchang:['robedElder','npc-robed-elder-b'],lm_guang:['monk','npc-monk','v5'],
 dt_meng:['robedElder','npc-robed-elder-b'],dt_zhao:['robedElder','npc-robed-elder'],
 dt_jiang:['martialElder','npc-martial-elder'],dt_han:['elder','npc-elder-male','v5'],
 dt_zhuo:['robedElder','npc-robed-elder'],dt_weihu:['martialAdult','npc-martial-adult'],
 dt_weicang:['porter','npc-porter','v5'],dt_wang:['youth','npc-youth-blue','v5'],
 qw_chen:['robedElder','npc-robed-elder'],qw_lu:['matureWoman','npc-mature-woman'],
 qw_gu:['clerk','npc-clerk-male','v5'],qw_xue:['elder','npc-elder-male','v5'],
 qw_shi:['martialElder','npc-martial-elder'],qw_pan:['merchant','npc-merchant-male','v5'],
 qw_zhou:['traveler','npc-traveler','v5'],qw_wei:['elder','npc-elder-male','v5'],
 qw_sun:['martialElder','npc-martial-elder-b'],qw_fei:['matureWoman','npc-mature-woman-b'],
};
for(const [id,[archetype,file,folder='v6']] of Object.entries(templates))chronicleCharacters[id].portrait={file:`${folder}/${file}.webp`,position:'center top',size:'contain',kind:'template',archetype,variant:file};
// Only the expanded performance opts into this look; frozen v1 retains its default.
chronicleCharacters.th_mu.portrait.looks={v2:{file:'v6/npc-martial-elder.webp',size:'auto 150%'}};
export const chronicleScenes:Record<string,{name:string;time:string;art:string}>={
 ...kuheScenes,
 ...qingshiScenes,
 ...twoSwordsScenes,
 ...sevenQuestionsScenes,
 ...jadeThievesScenes,
 ...jadeScenes,
 ...seaScenes,
 ...seaTideScenes,
 ...northScenes,
 ...qianKunScenes,
 ...northNotesScenes,
 ...deadRankingScenes,
 ...luhuaScenes,
 ...twelfthLifeScenes,...twelfthLifeV2Scenes,
 ...taihuaV2Scenes,
 ...luoyangScenes,
 ...xuanmenScenes,
 ...whiteStoneScenes,
 ...beyondRankingScenes,
 lm_nightouter:{name:'龙门客舍 · 廊灯',time:'九剑之后 · 门人自己所见',art:'v6/taihua-night.webp'},
 lm_nightprivate:{name:'龙门内院 · 茶未凉',time:'同一夜 · 贺景庭九十六岁',art:'v6/taihua-night.webp'},
 lm_morning:{name:'客舍后院',time:'次晨 · 门人试自己的刀',art:'v6/longmen-backyard.webp'},
 th_guest:{name:'太华后岭 · 客舍',time:'太华试序 · 客舍',art:'v6/taihua-guest.webp'},
 th_stone:{name:'太华后岭 · 青序坪',time:'青序 · 第一轮',art:'v6/taihua-court.webp'},
 th_night:{name:'太华后岭 · 灯下小院',time:'青序 · 入夜',art:'v6/taihua-night.webp'},
 th_round:{name:'太华后岭 · 轮战坪',time:'青序 · 轮战',art:'v6/taihua-court.webp'},
 th_old:{name:'太华后岭 · 正序场',time:'正序 · 长辈上场',art:'v6/taihua-court.webp'},
 th_steps:{name:'太华后岭 · 石阶',time:'试序结束 · 散会后',art:'v6/taihua-steps.webp'},
 th_leavepractice:{name:'太华后岭 · 散会后的空坪',time:'下山前 · 半日私下复手',art:'v6/taihua-court.webp'},
 th_home:{name:'武当山 · 客舍',time:'回山后 · 各自的课业',art:'v6/taihua-guest.webp'},
 lm_hall:{name:'河中 · 镇河门',time:'洛阳会前五年 · 问剑之前',art:'v6/longmen-hall.webp'},
 lm_qingheyard:{name:'宋老旧居旁 · 演武场',time:'旧事 · 许重山五十六岁',art:'v6/longmen-backyard.webp'},
 lm_challenge:{name:'河中 · 问艺棚',time:'同年 · 武陵来客',art:'v6/longmen-fair.webp'},
 lm_backyard:{name:'混元门 · 后院',time:'同年 · 贺老在场',art:'v6/longmen-backyard.webp'},
 lm_autumn:{name:'龙门镇 · 秋会',time:'同年八月 · 秋会数日',art:'v6/longmen-fair.webp'},
 lm_nine:{name:'秋会坪 · 木剑与真剑',time:'秋会末日 · 九剑',art:'v6/longmen-fair.webp'},
 lm_road:{name:'龙门镇外 · 分路',time:'秋会结束 · 各有去处',art:'v5/ridge.webp'},
 lm_fiveyears:{name:'河中 · 又到秋天',time:'五年后 · 贺老退榜，罗继首位',art:'v5/inn.webp'},
 lm_returntrial:{name:'镇河门 · 约定的补试',time:'秋会散后第四日',art:'v6/longmen-hall.webp'},
  lm_afterhall:{name:'镇河门 · 回馆后的第一课',time:'同年 · 秋会散后',art:'v6/longmen-hall.webp'},
 dt_memory:{name:'洞庭 · 空货船',time:'两年前 · 梁照水四十五岁',art:'v6/dongting-deck.webp'},
 dt_dock:{name:'洞庭西岸 · 系舟处',time:'两年后 · 梁照水四十七岁',art:'v6/dongting-dock.webp'},
 dt_trial:{name:'洞庭水会 · 问席船',time:'问席 · 第三日',art:'v6/dongting-deck.webp'},
 dt_raid:{name:'洞庭 · 遭劫货道',time:'同日 · 问席停止',art:'v6/dongting-raid.webp'},
 dt_after:{name:'洞庭西岸 · 议席之后',time:'议席后 · 各认各的数',art:'v6/dongting-dock.webp'},
 dt_three:{name:'洞庭水会 · 再见',time:'三年后 · 陈震入第十五',art:'v6/dongting-dock.webp'},
 qw_private:{name:'青溪 · 王庄练场',time:'赵承晏四十四岁 · 私下问手',art:'v6/longmen-backyard.webp'},
 qw_public:{name:'青溪 · 公开较艺场',time:'四十多岁 · 公开身份以后',art:'v6/rl-public.webp'},
 qw_veranda:{name:'王府 · 廊下',time:'同一阶段 · 胜负之后',art:'v6/qingxi-veranda.webp'},
 qw_return:{name:'青溪 · 重练场',time:'赵承晏五十二岁 · 候看',art:'v6/longmen-backyard.webp'},
 qw_wound:{name:'青溪 · 再问石横',time:'赵承晏五十五岁 · 两件事都记',art:'v5/arena.webp'},
 qw_board:{name:'青溪 · 榜房外',time:'赵承晏五十八岁 · 大修',art:'v6/qingxi-board.webp'},
 qw_after:{name:'王府与馆门之间',time:'第十二席以后 · 各自的差事',art:'v6/qingxi-veranda.webp'},
 qw_late:{name:'青溪 · 后来的秋天',time:'在榜四年后退席 · 此后日子',art:'v5/dawn.webp'},
};
export const chronicleEndings:Record<string,string>={...kuheEndings,...qingshiEndings,...twoSwordsEndings,...sevenQuestionsEndings,...jadeThievesEndings,...jadeEndings,...seaEndings,...seaTideEndings,...northEndings,...qianKunEndings,...northNotesEndings,...deadRankingEndings,...luhuaEndings,...twelfthLifeEndings,...luoyangEndings,...xuanmenEndings,...whiteStoneEndings,...beyondRankingEndings,th_company:'结伴复手',th_letter:'独行回山',th_guidance:'一炷香的回身',lm_travel:'送剑同行',lm_home:'守馆改刀',dt_company:'护住同行',dt_cargo:'先成差事',qw_school:'堂前再约',qw_palace:'入府教习'};
export const chronicleFacts:Record<string,{name:string;text:string}>={
 ...kuheFacts,
 ...northNotesFacts,
 ...luhuaFacts,
 ...taihuaV2Facts,
 ...luoyangFacts,
 ...xuanmenFacts,
 ...whiteStoneFacts,
 ...beyondRankingFacts,
 ...jadeThievesFacts,
 th_closed:{name:'封岭十七日',text:'六门试序是内部旧会，青序六十、正序二十八；宗主上座不下正序。外榜和门内序次不是一回事。'},
 th_first:{name:'先了半息',text:'陆青珩第一战一百零二手胜沈照微；轮战沈再胜陆。一个胜场没有把人永远排在另一人前面。'},
 th_order:{name:'六个人的青序',text:'最终霍停云、明澄、谢临川、司马承一、陆青珩、沈照微。昆仑十八分、少林十七，不能从个人序次直接倒算门分。'},
 th_six:{name:'第六手才停',text:'霍停云问张玄岳六手而止，第四手已经失路。穆玄真指出前面半寸，不是传他一招就能越级。'},
 lm_seven:{name:'第七刀砍什么',text:'许重山回述少年时宋九川的问话；前一年清和三下藤条使他看见预定刀终点的局限。不是你亲历数十年前的练刀。'},
 lm_count:{name:'一百一十九与四十七',text:'石惊川一百一十九合胜许重山，与罗天庆记平，四十七招败贺景庭。不同胜负不把辰州榜变成野榜，也不把地方榜全说成一样强。'},
 lm_nine:{name:'九剑找第一剑',text:'章复生以木剑受真剑。石惊川九剑后认输，说第一剑已经错，后八剑在找原因；不能让看台门人凭这句话便懂得化解。'},
 lm_retire:{name:'升首不等于赢过',text:'五年后贺景庭百岁以后自请退榜，罗天庆继首。十九、三十二、四十一招的三次败绩没有因此改写。'},
 dt_106:{name:'整条船都是兵器',text:'四十五岁的梁一百零六合落水。船沿、桅柱、浪势、落脚都在赵崇山五十年的经验里；上岸也许多打几十招，不等于当时能赢。'},
 dt_recall:{name:'多半刀与袖弩',text:'梁回述二十七岁与焦定海结怨，后来并船剿匪，孟还险中鲁魁袖弩。旧仇不是全寨命令，师父也会失手。'},
 dt_vote:{name:'四比三与回避',text:'七名无直接利害的旧豪四推梁、三推陈。孟因师徒之嫌不投。梁四十七列十六，陈三年后列十五，玩家不能另加一张票。'},
 qw_public:{name:'输过之后，什么也不做',text:'薛直公开真胜后，王府既不报复也不送礼。真实胜负要能不改变对手日常的开馆、纳税和生意，不由一场恭喜证明。'},
 qw_55:{name:'胜与旧伤同时记',text:'五十五岁对石横，赵承晏胜，石横旧膝伤中发。两件事一起写，不把胜删去，也不把旧伤藏起。'},
 qw_seat:{name:'一版第十二',text:'五十八岁大修，潘世荣第十一，赵承晏四比三得第十二。榜上只写姓名；入席依长期履历，不是王府送来的名次。'},
};
export const taihuaChapters=[['th_guest','一 · 被叫到的名字'],['th_stone','二 · 先半息'],['th_night','三 · 汤要凉了'],['th_round','四 · 这次不一样'],['th_old','五 · 第六手'],['th_steps','六 · 下山的约']];
export const longmenChapters=[['lm_hall','一 · 第七刀'],['lm_qingheyard','旧事 · 三尺藤条'],['lm_challenge','二 · 武陵帖子'],['lm_backyard','三 · 贺老的后院'],['lm_autumn','四 · 秋会不小'],['lm_nine','五 · 九剑'],['lm_road','六 · 去处'],['lm_fiveyears','后日 · 五年以后']];
export const longmenV3Chapters=[...longmenChapters.slice(0,6),['lm_nightouter','六 · 自己看见了什么'],['lm_nightprivate','同夜 · 两位前辈'],['lm_morning','七 · 再试一回'],...longmenChapters.slice(6,-1),['lm_returntrial','八 · 第四日补试'],...longmenChapters.slice(-1)];
export const longmenV2Chapters=[...longmenChapters.slice(0,6),['lm_nightouter','六 · 自己看见了什么'],['lm_nightprivate','同夜 · 两位前辈'],['lm_morning','七 · 再试一回'],...longmenChapters.slice(6)];
export const dongtingChapters=[['dt_memory','序 · 第三步没站住'],['dt_dock','一 · 船比椅子多'],['dt_trial','二 · 五个人'],['dt_raid','三 · 不问输赢了'],['dt_after','四 · 四比三'],['dt_three','后日 · 三年以后']];
export const twelfthChapters=[['qw_private','一 · 你不敢打'],['qw_public','二 · 输给他的人'],['qw_veranda','三 · 什么也别送'],['qw_return','四 · 回来仍要站'],['qw_wound','五 · 两件事都写'],['qw_board','六 · 第十二'],['qw_after','七 · 你的去处'],['qw_late','后日 · 不是第十一']];
export const chronicleWorks=[
 kuheWork,
 kuheV2Work,
 kuheV1Work,
 qingshiWork,qingshiV2Work,qingshiV1Work,
 twoSwordsWork,twoSwordsV1Work,
 sevenQuestionsWork,sevenQuestionsV1Work,
 jadeThievesWork,jadeThievesV1Work,
 jadeWork,jadeV1Work,
 seaWork,seaV1Work,
 seaTideWork,seaTideV1Work,
 northWork,northV2Work,northV1Work,
 qianKunWork,qianKunV2Work,qianKunV1Work,
 northNotesWork,
 deadRankingWork,
 luhuaWork,
 twelfthLifeWork,twelfthLifeV2Work,twelfthLifeV1Work,
 luoyangWork,
 bambooWork,
 xuanmenWork,
 whiteStoneWork,
 beyondRankingWork,
 {slug:'taihua',file:'taihua.html',title:'太华试序 · 三年之约',version:'taihua-3.0.0',prefix:'jianghu:chronicle:taihua:v3:',start:'接过替补的护腕',hook:'练了二十年，<br>你还想准备几日？',intro:'三十一岁，你替受伤同门上场。<br>一场真胜之后，还有一场真败。',viewpoint:'三十一岁的陆青珩',note:'六门内部旧会',coverArt:'v6/taihua-night.webp',chapters:taihuaV2Chapters,endingCount:3},
 {slug:'taihua-v2',file:'taihua-v2.html',title:'太华试序 · 第二版旧稿',version:'taihua-2.0.0',prefix:'jianghu:chronicle:taihua:v2:',start:'接过替补的护腕',hook:'练了二十年，<br>你还想准备几日？',intro:'三十一岁，你替受伤同门上场。<br>一场真胜之后，还有一场真败。',viewpoint:'三十一岁的陆青珩',note:'冻结第二版 · 原三归宿与旧存档',coverArt:'v6/taihua-night.webp',chapters:taihuaV2Chapters,endingCount:3},
 {slug:'taihua-v1',file:'taihua-v1.html',title:'太华试序 · 旧稿',version:'taihua-1.0.0',prefix:'jianghu:chronicle:taihua:v1:',start:'接过替补的护腕',hook:'练了二十年，<br>你还想准备几日？',intro:'三十一岁，你替受伤同门上场。<br>一场真胜之后，还有一场真败。',viewpoint:'三十一岁的陆青珩',note:'扩写前的两种归宿，保留原存档',coverArt:'v6/taihua-night.webp',chapters:taihuaChapters},
 {slug:'longmen',file:'longmen.html',title:'龙门问刀',version:'longmen-3.0.0',prefix:'jianghu:chronicle:longmen:v3:',start:'去借那把木刀',hook:'第七刀，<br>你到底想砍什么？',intro:'跟着镇河门赴会，先认一次真败。<br>九剑以后，选自己的去处。',viewpoint:'镇河门随行门人',note:'两条门路 · 九剑与当夜私谈',coverArt:'v5/arena.webp',chapters:longmenV3Chapters},
 {slug:'longmen-v2',file:'longmen-v2.html',title:'龙门问刀 · 第二版旧稿',version:'longmen-2.0.0',prefix:'jianghu:chronicle:longmen:v2:',start:'去借那把木刀',hook:'第七刀，<br>你到底想砍什么？',intro:'跟着镇河门赴会，先认一次真败。<br>九剑以后，选自己的去处。',viewpoint:'镇河门随行门人',note:'冻结第二版 · 原夜谈与旧存档',coverArt:'v5/arena.webp',chapters:longmenV2Chapters},
 {slug:'longmen-v1',file:'longmen-v1.html',title:'龙门秋会 · 旧稿',version:'longmen-1.0.0',prefix:'jianghu:chronicle:longmen:v1:',start:'去借那把木刀',hook:'第七刀，<br>你到底想砍什么？',intro:'跟着镇河门赴会，先认一次真败。<br>九剑以后，选自己的去处。',viewpoint:'镇河门随行门人',note:'夜谈扩写前 · 原存档',coverArt:'v5/arena.webp',chapters:longmenChapters},
 {slug:'dongting',file:'dongting.html',title:'照水刀 · 问席',version:'dongting-1.0.0',prefix:'jianghu:chronicle:dongting:v1:',start:'接住船边那根绳',hook:'椅子只有一把，<br>船上的人却不止一个。',intro:'梁照水四十七岁，问洞庭第十六。<br>问席停下之后，你先接谁的绳？',viewpoint:'听潮门护船帮手',note:'梁照水四十五、四十七与五十岁',coverArt:'v5/reeds.webp',chapters:dongtingChapters},
 {slug:'twelfth',file:'twelfth.html',title:'第十二席',version:'twelfth-1.0.0',prefix:'jianghu:chronicle:twelfth:v1:',start:'领一份陪练差事',hook:'他想听的，<br>是没人替他让的一场。',intro:'王爷用了十几年，等一个真实的姓名。<br>你也有自己的馆，自己的去处。',viewpoint:'王府陪练与地方馆师',note:'四十四、五十二、五十八岁与退席以后',coverArt:'v5/hall.webp',chapters:twelfthChapters},
];

export const chronicleCompanions:Record<string,{slug:string;label:string}>={
 qingshi:{slug:'qingshi-v2',label:'上一版及旧存档'},'qingshi-v2':{slug:'qingshi',label:'修订篇 · 守一天'},'qingshi-v1':{slug:'qingshi-v2',label:'新演出 · 守一天'},
 kuhe:{slug:'kuhe-v2',label:'上一版及旧存档'},'kuhe-v2':{slug:'kuhe',label:'修订篇 · 门后有人'},'kuhe-v1':{slug:'kuhe-v2',label:'新演出 · 门后有人'},
 longmen:{slug:'longmen-v2',label:'上一版及旧存档'},'longmen-v2':{slug:'longmen',label:'修订篇 · 龙门问刀'},'longmen-v1':{slug:'longmen-v2',label:'扩写篇 · 龙门问刀'},
 taihua:{slug:'taihua-v2',label:'上一版及旧存档'},'taihua-v2':{slug:'taihua',label:'修订篇 · 三年之约'},'taihua-v1':{slug:'taihua-v2',label:'扩写篇 · 三年之约'},
 'twelfth-life':{slug:'twelfth',label:'陪练篇 · 馆师视角'},'twelfth-life-v2':{slug:'twelfth-life',label:'修订篇 · 赵承晏'},twelfth:{slug:'twelfth-life',label:'赵承晏 · 本人生涯'},
 luhua:{slug:'dongting',label:'问席 · 护船帮手视角'},dongting:{slug:'luhua',label:'芦花渡 · 梁照水完整生涯'},
 north:{slug:'qian-kun',label:'第二卷 · 不会算账'},'qian-kun':{slug:'north',label:'第一卷 · 三师一枪'},
 sea:{slug:'sea-tide',label:'第二册 · 归潮岛'},'sea-v1':{slug:'sea-tide',label:'第二册 · 归潮岛'},'sea-tide':{slug:'sea',label:'第一册 · 中原以外'},'sea-tide-v1':{slug:'sea',label:'第一册 · 中原以外'},
 'jade-thieves':{slug:'jade',label:'第二卷 · 十三文'},'jade-thieves-v1':{slug:'jade-thieves',label:'修订篇 · 密库双贼'},jade:{slug:'jade-thieves',label:'第一卷 · 密库双贼'},'jade-v1':{slug:'jade',label:'修订篇 · 十三文'},
 'two-swords':{slug:'seven-questions',label:'第二册 · 门外七问'},'seven-questions':{slug:'two-swords',label:'第一册 · 旧本归还'},
};

export const chronicleExtras:Record<string,{slug:string;label:string}[]>={jade:[{slug:'jade-v1',label:'旧稿及旧存档'}],'jade-v1':[{slug:'jade-thieves',label:'第一卷 · 密库双贼'}],'jade-thieves':[{slug:'jade-thieves-v1',label:'旧稿及旧存档'}],'jade-thieves-v1':[{slug:'jade',label:'第二卷 · 十三文'}],'taihua-v2':[{slug:'taihua-v1',label:'旧稿及旧存档'},{slug:'white-stone',label:'昆仑旧史 · 白石谷外'}],'taihua-v1':[{slug:'taihua',label:'修订篇 · 三年之约'}],longmen:[{slug:'longmen-v1',label:'旧稿及旧存档'},{slug:'luoyang',label:'五年后 · 洛阳龙虎风云会'}],'longmen-v2':[{slug:'longmen-v1',label:'旧稿及旧存档'}],'longmen-v1':[{slug:'longmen',label:'修订篇 · 龙门问刀'}],qingshi:[{slug:'qingshi-v1',label:'旧稿及旧存档'}],'qingshi-v2':[{slug:'qingshi-v1',label:'旧稿及旧存档'}],'qingshi-v1':[{slug:'qingshi',label:'修订篇 · 守一天'}],kuhe:[{slug:'kuhe-v1',label:'旧稿及旧存档'}],'kuhe-v2':[{slug:'kuhe-v1',label:'旧稿及旧存档'}],'kuhe-v1':[{slug:'kuhe',label:'修订篇 · 门后有人'}],'sea-tide':[{slug:'sea-tide-v1',label:'旧稿及旧存档'}],'sea-tide-v1':[{slug:'sea-tide',label:'修订篇 · 归潮岛'}],sea:[{slug:'sea-v1',label:'旧稿及旧存档'}],'sea-v1':[{slug:'sea',label:'修订篇 · 中原以外'}],north:[{slug:'north-v2',label:'上一版及旧存档'},{slug:'north-v1',label:'旧稿及旧存档'},{slug:'north-notes',label:'双卷附篇 · 师门夜话'}],'north-v2':[{slug:'north',label:'修订篇 · 三师一枪'},{slug:'north-v1',label:'旧稿及旧存档'},{slug:'qian-kun',label:'第二卷 · 不会算账'}],'north-v1':[{slug:'north',label:'新演出 · 三师一枪'}],'qian-kun-v1':[{slug:'qian-kun',label:'新演出 · 不会算账'}],'two-swords':[{slug:'two-swords-v1',label:'旧稿及旧存档'}],'two-swords-v1':[{slug:'two-swords',label:'修订篇 · 旧本归还'}],'seven-questions':[{slug:'seven-questions-v1',label:'旧稿及旧存档'}],'seven-questions-v1':[{slug:'seven-questions',label:'修订篇 · 门外七问'}],'twelfth-life':[{slug:'twelfth-life-v2',label:'上一版及旧存档'},{slug:'twelfth-life-v1',label:'旧稿及旧存档'}],'twelfth-life-v2':[{slug:'twelfth-life-v1',label:'旧稿及旧存档'},{slug:'twelfth',label:'陪练篇 · 馆师视角'}],'twelfth-life-v1':[{slug:'twelfth-life-v2',label:'新演出 · 赵承晏'},{slug:'twelfth-life',label:'修订篇 · 赵承晏'}],xuanmen:[{slug:'beyond-ranking',label:'两座山之后 · 榜纸之外'}],'beyond-ranking':[{slug:'xuanmen',label:'第一份旧录 · 玄门旧史'},{slug:'white-stone',label:'第二份旧录 · 白石谷外'}],taihua:[{slug:'taihua-v1',label:'旧稿及旧存档'},{slug:'white-stone',label:'昆仑旧史 · 白石谷外'}],'white-stone':[{slug:'beyond-ranking',label:'两座山之后 · 榜纸之外'},{slug:'taihua',label:'六门旧会 · 太华试序'},{slug:'xuanmen',label:'另一座山 · 玄门旧史'}],luoyang:[{slug:'longmen',label:'五年前 · 龙门秋会'},{slug:'bamboo',label:'当夜 · 竹院夜论'}],bamboo:[{slug:'luoyang',label:'白日 · 洛阳龙虎风云会'}],'qian-kun':[{slug:'north-notes',label:'双卷附篇 · 师门夜话'},{slug:'qian-kun-v2',label:'上一版及旧存档'},{slug:'qian-kun-v1',label:'旧稿及旧存档'}],'qian-kun-v2':[{slug:'qian-kun',label:'修订篇 · 不会算账'},{slug:'qian-kun-v1',label:'旧稿及旧存档'},{slug:'north',label:'第一卷 · 三师一枪'}],'north-notes':[{slug:'north',label:'第一卷 · 三师一枪'},{slug:'qian-kun',label:'第二卷 · 不会算账'}]};
