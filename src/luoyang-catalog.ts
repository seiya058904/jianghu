import type {Person} from './campaign-catalog.ts';
const p=(name:string,role:string,detail:string,file:string):Person=>({name,role,detail,portrait:{file,kind:'template',archetype:'v6-borrowed',variant:file,position:'center top',size:'auto 150%'}});
export const luoyangCharacters:Record<string,Person>={
 ly_shi:p('史天魁','北榜第二十九 · 断门刀','沈长庚五十七招负于他，前四十的真本事与最终真负都留着。','v6/npc-robed-elder.webp'),
 ly_xing:p('邢万里','河朔二十四雄第四 · 铁枪镇河','前三十余占优，九十四合负夏镇南；不因认负就改枪为一生走错。','v6/npc-martial-elder-b.webp'),
 ly_xia:p('夏镇南','南榜第三十四 · 断水刀','先看五十招再抢入，九十四刀先右肩；看的时候也仍须真接枪。','v6/npc-martial-elder.webp'),
 ly_lu:p('陆怀秋','江宁二十四剑第二 · 照水剑','一百三十七合负石惊川半剑，仍愿再约；不是梁照水或陆清泉。','v6/npc-martial-adult-b.webp'),
 ly_liu:p('柳成章','九天追风 · 南榜第三 / 总谱第二十七','洛阳侧席观战，后段双手止旧怨。竹院只说个人所见，入化约七十前后、此刻确切年龄未定，不为问答补作全知判官。','v6/npc-robed-elder-b.webp'),
 ly_guo:p('郭洪','双鞭镇北 · 北榜第十四','七十余，双鞭与叶潮生棍一百零六同时停；不是秦天岳故事里的韩镇北。','v6/npc-martial-elder.webp'),
 ly_ye:p('叶观澜','海天门内院第四席 · 潮生棍','与郭年岁相若，无中原榜籍；59松一手滑半尺锁腕，106平手收，内院第四不等于天下第四。','v6/npc-martial-elder-b.webp'),
 ly_steward:p('主事老人','中央青石台 · 原典未名','郭叶一百零六合同有可到处，他只喊止，不替门内席次排一张新北榜。','v6/npc-robed-elder.webp'),
 ly_yan:p('严仲山','铁掌开天 · 北榜第五','二十三年前旧战未决，洛阳81与宁同求胜，被柳搭腕止；竹院玩家即本人，未受的半年废臂不补成真伤。入化与否柳未替他判定。','v6/npc-martial-elder-b.webp'),
 ly_ning:p('宁文昭','铁扇镇江南 · 南榜第四','十二骨铁扇，81旧式再问，柳止后仍问为何自己伤会更重；竹院夜后改九骨，不是宁无极。','v6/npc-robed-elder.webp'),
 bb_ro:p('罗继祖','竹院邀请的前十名宿之一','原典未给本夜具体南北名次，不擅补第几。夜后删教过三十年的十一式枪；不是河中榜首罗天庆。','v6/npc-martial-elder.webp'),
 bb_xie:p('谢青云','南榜第七 · 竹院来客','柳谈七年未见时肯追问；三月后亲赴昆仑白石谷，非太华青年谢临川。','v6/npc-martial-adult-b.webp'),
};
const s=(name:string,time:string,art:string)=>({name,time,art});
export const luoyangScenes={ly_arrival:s('洛阳南郊 · 入会十里','龙门秋会五年后','v6/longmen-fair.webp'),ly_smallground:s('龙虎会 · 较艺坪','沈57 / 邢94 · 不同来场','v5/arena.webp'),ly_records:s('主事席边 · 回帖处','石惊川137 · 半剑','v6/longmen-hall.webp'),ly_sideseat:s('会场侧席','第三日柳到 · 此后问话','v6/qingxi-veranda.webp'),ly_central:s('中央青石台','第六日 · 双鞭与潮生棍','v6/taihua-court.webp'),ly_latefight:s('会后段 · 旧怨坪','二十三年前未决 · 第81','v5/arena.webp'),ly_return:s('洛阳客舍 · 散场路','各有要回去的一处','v5/inn.webp'),bb_gate:s('旧园院门','龙虎会当夜 · 无年轻弟子','v6/taihua-night.webp'),bb_table:s('竹院席间','只有南北前十来客 · 严本人','v6/taihua-night.webp'),bb_tea:s('竹院席间 · 茶未凉','柳的亲见与未见','v6/taihua-night.webp'),bb_recollection:s('竹院听旧事','仍在今夜 · 柳回述茶盏','v6/taihua-night.webp'),bb_after:s('次日 · 洛阳客舍院','无柳代按双腕','v6/longmen-backyard.webp')};
export const luoyangFacts={ly_two_scales:{name:'洛阳 · 两种位置',text:'郭北14、叶海天内院4无中原榜籍，第106同时收，不能据此把四与十四换成绝对等价位置。'},ly_stop:{name:'洛阳 · 两只停下的手',text:'第81柳左搭严腕、右按宁扇骨，无人震飞、兵器未断。严左臂半年/宁右肩更久是若晚一步的假设，实际未受；旧账以平了结。'},bb_paper:{name:'竹院 · 席位与门槛',text:'柳说当时现行总谱前35已入化或更高，36韩在门外；入化不保证有席，六门禁榜、退谱与百岁以后都还有纸外的人。'},bb_han:{name:'竹院 · 韩刀的实据',text:'柳所述韩89、河洛韩氏，20年12场8胜2平2负，两败皆入化者；6年前薛240余平、7年前陆190余负、12年前柳109胜。未知对手不补判；不是人人都可按韩的例子越级入谱。'},bb_seen:{name:'竹院 · 所见有日期',text:'柳七年未见岳，不判如今；秦更整顾更空只是个人见闻。严与宁的境界未由一句看自己判定，席位也不等于谁必胜谁。'},bb_cup:{name:'竹院 · 十三年的一点',text:'柳可靠认见返真两位，不报姓名。老人推盏、总谱前十看许久，十三年只明白一点未说内容；此夜无公开讲武录，不把未知编成秘招。'}};
export const luoyangEndings={ly_trial_after:'客舍试那一步',ly_post_after:'等一封能再来的帖',bb_palm_after:'没有人替你按腕',bb_tea_after:'茶凉以后仍可谈'};
export const luoyangWork={slug:'luoyang',file:'luoyang.html',title:'洛阳龙虎风云会',version:'luoyang-1.0.0',prefix:'jianghu:chronicle:luoyang:v1:',start:'随河中来客入洛阳',hook:'五年前最尊贵的客人，<br>如今只是三十六席之一。',intro:'双鞭与潮生棍。两只停下的手。<br>再看一场，会不会仍只问谁赢？',viewpoint:'河中随行门人',note:'龙门秋会五年后 · 会场与会后',coverArt:'v6/longmen-fair.webp',chapters:[['ly_arrival','一 · 天下武会'],['ly_central','二 · 双鞭与潮生棍'],['ly_latefight','三 · 两只手']]};
export const bambooWork={slug:'bamboo',file:'bamboo.html',title:'竹院夜论',version:'bamboo-1.0.0',prefix:'jianghu:chronicle:bamboo:v1:',start:'推开旧园的门',hook:'今夜不教天下，<br>只说亲眼见过什么。',intro:'你是严仲山，白日才肯收手。<br>这次坐下来，还想问什么？',viewpoint:'北榜第五严仲山',note:'读完《龙门问刀》一种归宿后解锁',coverArt:'v6/taihua-night.webp',chapters:[['bb_gate','一 · 席中的人'],['bb_table','二 · 门前韩刀'],['bb_tea','三 · 所见有日期'],['bb_recollection','四 · 十三年的一点'],['bb_after','后日 · 自己那一掌']]};
