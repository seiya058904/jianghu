export type Portrait = {file:string; position:string; size:string; kind?:'dedicated'|'template'; archetype?:string; variant?:string; moods?:Record<string,string>;looks?:Record<string,{file:string;size?:string;position?:string;moods?:Record<string,string>}>};
export type Person = {name:string;role:string;detail:string;portrait:Portrait;canonicalIdentity?:string};
const portrait=(id:string):Portrait=>({file:`v5/${id}.webp`,position:'center top',size:'contain',kind:'dedicated'});
const core=(id:string,name:string,role:string,detail:string):Person=>({name,role,detail,portrait:portrait(id)});
export const campaignCharacters:Record<string,Person>={
  zhaoli:core('zhaoli','江照鲤','青蒲渡领船人','二十二岁，认水比认字快。怕同伴逞英雄，也常把自己留在最后一条船上。红绳是给人抓的，不是护身符。'),
  qiao:core('qiao','乔砚生','石梁馆学徒','二十三岁，与你一同长大。想拿一次堂堂正正的胜场替师父撑门面；嘴上最嫌欠人情，借来的盘缠却记得一文不差。'),
  su:core('su','苏晚澄','金陵剑门外务记录人','二十七岁，奉门中差遣记录地方试艺，并非内席。相信写清楚前因后果才能保护后来的人，讨厌旁人把认真说成刻板。'),
  lu:core('lu','陆汀舟','南岳剑派行走弟子','二十六岁，来江边办一件寻常外务。笑话很多，自己的伤很少提。与苏晚澄争的是怎样让年轻人的剑继续使下去。'),
  han:core('han','韩鹭石','石梁馆教习','六十一岁，未入正式榜册。教过好些离乡的孩子，没有替他们决定归期。左手藏着自己年轻时留下的旧伤。'),
  ling:core('ling','凌苇','行脚医者','二十八岁，开药之前先问病人明天要做什么。与裴雁秋有过没说开的旧事，救治时却不计那笔账。'),
  xu:core('xu','许竞川','回汀馆青年刀客','二十五岁，家中武馆与石梁馆争了多年渡口教习的位置。要的不是别人让招，也不想靠别人的伤赢。'),
  pei:core('pei','裴雁秋','雁回镖行领队','三十六岁，地方镖师，与河东裴氏无亲缘。宁可被骂胆小，也要让交到手中的人平安到岸。'),
  yan:core('yan','严平章','青蒲水陆小会主事','五十三岁，主持的是地方公开小会，并非六门会武。怕失信，也怕自己坚持的规矩救不了眼前的人。'),
  rong:core('rong','容既白','米行少东、试艺对手','三十岁，出钱修会场，也真练了十几年棍。他最恼别人先看衣服再决定敢不敢赢他。'),
  du:core('du','杜汀叟','青蒲渡老舵师','六十七岁，眼睛已不好，认水声却没人比得上。没有榜位，也不装世外高手；一篙能做的事，绝不许孩子拿命去填。'),
  he:core('he','何铆','青蒲渡木匠','四十二岁，修船、修桥，脾气跟钉子一样硬。不会剑，手里却量着所有人将要踏上的那块木板。'),
};
export const npcArchetypes:Record<string,{file:string;description:string}>={
  porter:{file:'v5/npc-porter.webp',description:'壮年搬运工、深褐短衣、布巾'},
  merchant:{file:'v5/npc-merchant.webp',description:'中年女商旅、青灰衣、算盘'},
  elder:{file:'v5/npc-elder.webp',description:'老年乡人、白发、竹篮'},
  youth:{file:'v5/npc-youth.webp',description:'年轻学徒、朴素棕衣、木杆'},
  monk:{file:'v5/npc-monk.webp',description:'行脚僧人、灰袍、行囊'},
  clerk:{file:'v5/npc-clerk.webp',description:'地方差役、深蓝公服、文簿'},
  traveler:{file:'v5/npc-traveler.webp',description:'风霜旅客、斗笠、旧披风'},
  boatwoman:{file:'v5/npc-boatwoman.webp',description:'中年女船工、靛蓝窄袖、船桨'},
};
const supports:[string,string,string,string,string][]=[
 ['bao','包小满','渡口搬运学徒','youth','搬米时总偷换最重的那袋，嘴上说是好练腿。'],
 ['aunt','汤二娘','渡口食摊掌柜','merchant','账要算，人也要吃。每个赊账的人都有一个她记得的口味。'],
 ['gao','高秉','会场书吏','clerk','字写得比话快，愿意把模糊的规矩重新读给所有人听。'],
 ['shao','邵七','领船副手','porter','以前失过一只船，不会再为一句快点松开查绳的手。'],
 ['po','罗婆','河堤菜农','elder','不认江湖名号，认得一季菜苗能不能活。'],
 ['an','安福','雨棚卖饼人','merchant','糊了一炉饼仍坚持收半价，因为饼心还软。'],
 ['jue','觉茂','行脚僧','monk','替附近村子送药，不代表少林达摩内席。饭量很大，手很稳。'],
 ['cheng','程阿笠','跑船女伙计','boatwoman','会听鱼碰船底的声音。最不喜欢别人把她当要照顾的孩子。'],
 ['fan','范遇','山道脚夫','porter','每一次说路不远，指的都是自己走过，不是别人走得完。'],
 ['zeng','曾补','桥头补鞋人','elder','只收补鞋的钱，不收指路的钱；一双鞋能告诉他来者走了多远。'],
 ['ming','明栓','新入门弟子','youth','总把木剑擦得太亮，真正上桥却肯把剑垫在滑动的车轮下。'],
 ['wei','魏葭','山村送药人','traveler','熟悉旧山道，不习惯对着一群持剑的人提高声音。'],
 ['jing','荆灶','镖行炊事','merchant','知道受伤的人先藏什么，也知道给那碗汤多放一点盐。'],
 ['ren','任耕','会场旗手','youth','怕高，还是每天爬上旗杆查横索。'],
 ['deng','邓苹','米行伙计','boatwoman','押着米袋进会场，想让雇主知道一袋米从田里出来有多重。'],
 ['tian','田雁','堤头差役','clerk','喊声很凶，自己先下泥里。她手里的册子记的是尚未过堤的人。'],
 ['yu','余枫','回汀馆弟子','youth','许竞川的师弟，把师兄丢掉的护腕悄悄收着。'],
 ['lan','兰老实','篾匠','elder','扎的篮子总多一圈竹篾，怕买篮的人舍不得换新的。'],
 ['bo','薄远','堤边钓客','traveler','钓不到鱼便说自己在量水位，有时还真量得准。'],
 ['liu','刘篙','渡船掌桨','porter','听杜汀叟一句口令，比听会场三面锣还快。'],
];
for(const [id,name,role,archetype,detail] of supports) campaignCharacters[id]={name,role,detail,portrait:{file:npcArchetypes[archetype].file,position:'center top',size:'contain',kind:'template',archetype,variant:'default'}};
for(const id of ['zeng','lan'])campaignCharacters[id].portrait={...campaignCharacters[id].portrait,file:'v5/npc-elder-male.webp',variant:'male-craftsman'};
campaignCharacters.an.portrait={...campaignCharacters.an.portrait,file:'v5/npc-merchant-male.webp',variant:'male-vendor'};
campaignCharacters.gao.portrait={...campaignCharacters.gao.portrait,file:'v5/npc-clerk-male.webp',variant:'male-scribe'};
for(const id of ['ren','yu'])campaignCharacters[id].portrait={...campaignCharacters[id].portrait,file:'v5/npc-youth-blue.webp',variant:'blue-flagbearer'};
campaignCharacters.zhaoli.portrait.moods={intent:'v5/zhaoli-intent.webp',uneasy:'v5/zhaoli-intent.webp',sharp:'v5/zhaoli-intent.webp'};
campaignCharacters.qiao.portrait.moods={uneasy:'v5/qiao-uneasy.webp',intent:'v5/qiao-uneasy.webp'};
campaignCharacters.su.portrait.moods={amused:'v5/su-amused.webp'};
campaignCharacters.lu.portrait.moods={calm:'v5/lu-intent.webp',intent:'v5/lu-intent.webp',uneasy:'v5/lu-intent.webp'};
export const campaignScenes:Record<string,{name:string;time:string;art:string}>={
 quay:{name:'青蒲渡 · 米袋与木剑',time:'序 · 潮声催人',art:'v5/quay.webp'},
 hall:{name:'石梁馆 · 借来的盘缠',time:'第一章 · 各有难处',art:'v5/hall.webp'},
 inn:{name:'临水客舍 · 一桌不够',time:'第二章 · 约好同去',art:'v5/inn.webp'},
 ridge:{name:'枫岭 · 雁回镖道',time:'第三章 · 陆路',art:'v5/ridge.webp'},
 bridge:{name:'断雨桥 · 板下有人',time:'第四章 · 陆路',art:'v5/bridge.webp'},
 reeds:{name:'白苇汊 · 风向有变',time:'第三章 · 水路',art:'v5/reeds.webp'},
 rainboat:{name:'旧桩湾 · 夜航',time:'第四章 · 水路',art:'v5/rainboat.webp'},
 workshop:{name:'修船坞 · 一锅热汤',time:'第五章 · 未说完的话',art:'v5/workshop.webp'},
 arena:{name:'青蒲坪 · 真打不让',time:'第六章 · 公平的价钱',art:'v5/arena.webp'},
 levee:{name:'东堤 · 锣声与雨',time:'第七章 · 现在就走',art:'v5/levee.webp'},
 storm:{name:'回水口 · 绳的另一头',time:'终章 · 潮生',art:'v5/storm.webp'},
 dawn:{name:'青蒲渡 · 天亮以后',time:'后日 · 有约',art:'v5/dawn.webp'},
};
export const campaignEndings:Record<string,string>={harbor:'众人之岸',name:'一场真胜',together5:'同行不散',teacher:'把剑教下去',captain:'潮来有舟',apart:'各赴前程',scar:'带伤归来',lost:'缺席的人'};
export const campaignFacts:Record<string,{name:string;text:string}>={
 knots:{name:'活结与双套',text:'承重的主绳用双套，救人的末端留活结。绳子太紧也会把人拖进水里。'},
 bank:{name:'回水先低后涨',text:'码头主流看似平缓时，旧堤脚的回水可能先退半尺。那是绕过上游沙洲的水正在回来。'},
 wrist:{name:'不肯握碗的手',text:'乔砚生的手腕并非小酸痛。继续强攻会失去握剑的力气，休息或换执法才能保留后面的选择。'},
 cross:{name:'斜板不争中线',text:'桥上退路和坪上不同，先看板的受力，再决定在哪一侧出剑。'},
 bell:{name:'锣声有三个短音',text:'青蒲会的停试令是三个短音；急难与胜负分别记，错过一场不会抹去已经做过的事。'},
 grain:{name:'米与脸面',text:'容既白肯拿出存米，却不肯让别人替他安排一场假胜。帮他保住这点自尊，会改变他怎样出手。'},
 debt:{name:'记在账外',text:'汤二娘、何铆、渡口脚夫的本事不在榜上，却各自决定一条船能不能出发。'},
};
export const chapters=[['quay','序 · 米袋与木剑'],['hall','一 · 借来的盘缠'],['inn','二 · 一桌不够'],['ridge','三 · 枫岭陆路'],['reeds','三 · 白苇水路'],['bridge','四 · 断雨桥'],['rainboat','四 · 夜航旧桩湾'],['workshop','五 · 一锅热汤'],['arena','六 · 真打不让'],['levee','七 · 锣声与雨'],['storm','终 · 绳的另一头'],['dawn','后日 · 有约']];
