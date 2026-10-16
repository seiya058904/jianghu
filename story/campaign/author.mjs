// Human-authored dialogue. This small emitter only supplies tags and stable knot-local IDs.
// Production Ink is written by chapter; do not use this file to generate filler dialogue.
import {mkdirSync,writeFileSync} from 'node:fs';
import {addInterludes} from './interludes.mjs';
const chapters=new Map(); let current,scene,cast,partId,count,metaIndex;
const echoes={
 bridge_guard:[['bridge_help',`fan|坡口你帮我把车扶正，这会儿扁担也借你。放心，新的，我试过受力。`,`fan|你在坡口没抢着谈路钱，现在也别抢着跟所有人讲理。守住这头，我去叫车停。`]],
 workshop_night:[['medicine',`ling|药棚的人还问起你。你肯听他们说完，省下的不只我一口气。
y|我也才知道，同一种发热，后面可能是不同的日子。`,`ling|床和药车有人守着，我才能在里面看人。你不站在最前面，也没少帮忙。`],['supplies',`pei|药箱是干的，村里能用到最后一包。出门时肯挪那半刻，到地方就不用追着湿纸捡药。`,`pei|有箱角沾了水，药没全坏。何铆在修底，下回装货不能只想着多一袋。`]],
 arena_open:[['rong_fair',`rong~calm|你昨夜要我真打。我就按说好的来，输了也不找棍子滑的借口。`,`rong|你昨夜说只认判线。行，不用先交朋友，也能认真过这一场。`],['fair',`su|你在渡口问过敢不敢判出钱人输。我站在这里，今天仍是那个回答。`,null]],
 levee_call:[['stop_clear',`gao|停试令已报全，东出口放开了。你在坪上喊的那句，现在后面的人也听见了。`,`gao|东出口还有人争刚才算不算输。我先去报清，不让你们这边还要等。`],['repair',`he|在馆里帮过我那位，过来拿钉。先试后抬，你见过我怎么查。
y|先查木底，不拿表面那一层当整块。`,`he|今天没空从头教。不会就讲，别看别人拿锤，你也抢一把。`]],
 levee_grain:[['grain_help',`deng|昨天搬米的人我都叫来了。不是报恩，是大家认得哪袋能压，哪袋不能再沾水。`,`deng|按你说的，数和用途都写在这儿。今天谁拿了米，先做事，回来也得讲清。`]],
 levee_wrist:[['qiao_rest',`ling|昨天肯歇，手就还没坏到拿不住轻物。现在换下来，等养好还能握。
qiao~calm|知道。比以前少练一天，也不等于一辈子再不能练。`,`ling~sharp|昨天没肯休，今天这一下不能再商量。疼不是你不够勇敢，是手已经在说不能。`]],
 storm_choice:[['route == 2 and night_safe',`zhaoli|旧桩湾那次，我们先把绳角定清。今天照样先定，别因为有人看着，就忽然又改成拼命。`,null],['route == 1 and bridge_safe',`he|桥头你知道先清哪条路。水里一样，先留退路，不是一脚下去才问怎么回来。`,null]],
 after_choice:[['credit',`gao|昨日每个人报过的名字，都在新册里。不是一句某某率众就把后头省掉。`,`gao|损失的数也留着。该赔的还在，不能因为有人夸，就当没人要过明天。`]],
 after_friends:[['rematch',`rong~amused|我把下一次的饭记下了。你们谁来得晚，先给我写信，别叫邓苹多摆一双筷子。`,null]],
 after_master:[['bao_help',`bao~amused|你说过先教我站稳。我等到了。今天不收米袋，先收我这盆没洒的水行不行？
y|行。上回我让你敢来，这回你让我知道你真来了。`,`bao~calm|你说自己也是学徒，我记着。今天有不懂的，我们一起问师父。
han~amused|那我可忙。一个不知道，带来第二个不知道。`]],
 after_route:[['pair_win',`qiao~calm|守旗那一场我记着，你喊得清，我也听见。补试还按那个来，不临场抢着逞强。`,`qiao|旗倒的那一下，我们别装忘了。补试先把口令说清，再上去。`]],
};
function chapter(file){current=[];chapters.set(file,current)}
function part(id,where,people,lines){partId=id;count=0;scene=where;cast=people.split(',');current.push(`\n=== ${id} ===`);say(lines);metaIndex=current.length-1;for(const [expr,yes,no] of echoes[id]??[])iff(expr,yes,no)}
function say(lines){for(const raw of lines.trim().split('\n')){if(!raw.trim())continue;let [who,text]=raw.split('|');let [speaker,mood='neutral']=who.trim().split('~');speaker=({n:'narrator',y:'you'})[speaker]??speaker;if(!['narrator','you'].includes(speaker)&&!cast.includes(speaker))cast=[speaker,...cast].slice(0,3);const id=`c_${partId}_${++count}`;current.push(`${text.trim()} # beat:${id} # scene:${scene} # cast:${cast.join(',')||'none'} # speaker:${speaker}${!['narrator','you'].includes(speaker)?` # mood:${speaker}=${mood}`:''}`)}}
function action(text){current[metaIndex]+=` # action:${text}`}
function fact(id){current[metaIndex]+=` # fact:${id}`}
function cg(id){current[metaIndex]+=` # cg:${id}`}
function iff(expr,yes,no){current.push(`{\n- ${expr}:`);say(yes);if(no){current.push('- else:');say(no)}current.push('}')}
function go(id){current.push(`-> ${id}`)}
function choice(next,items){for(const [id,text,effect,lines,condition] of items){current.push(`* ${condition?`{${condition}} `:''}[${text} # cid:${id}]`);if(effect)for(const e of effect.split(';'))current.push(`  ~ ${e.trim()}`);const start=current.length;say(lines);for(let i=start;i<current.length;i++)current[i]='  '+current[i];current.push(`  -> ${next}`)}}

chapter('00-quay');
part('cargo','quay','zhaoli,qiao,bao',`n|你刚踏上青蒲渡，一袋米便从高处砸下来。乔砚生的剑出了半寸，袋口先泼了他一头白。
qiao~surprised|……哪位高手，暗器里还掺糠？
zhaoli~sharp|上头那位搬米的高手！别拔剑，右边绳要断了！
bao~uneasy|我没偷懒！下面有人把车推歪了——
n|吊杆嘎地一响。米袋下是你的盘缠，车轮旁蹲着个捡散米的孩子。
zhaoli~intent|我拉主绳。你只能赶上一边，先说抓哪边！`);action('吊杆倾斜 · 米袋下有人');
choice('quay_people',[
 ['save_rope','抓住副绳，把整袋米拖离车轮。','rope = true',`y|砚生，别顾头发！把孩子抱走，我拉绳！
zhaoli~intent|别往身上缠！绕木桩，两圈——对，就是这样！
n|麻绳烧过掌心，米袋落进浅水。你的钱袋还在，掌心却多了道红印。`],
 ['save_child','先把孩子抱出来，盘缠以后再说。','mercy = true; purse = false',`y|过来，先松开那把米。袋子压下来可不认人。
n|你抱着孩子滚开，车轮碾过钱袋，几枚铜钱叮叮落进水里。
zhaoli~intent|人出来就好！包小满，别找钱，先把吊杆顶住！`],
]);
part('quay_people','quay','zhaoli,qiao,bao',`bao|一袋三十斤，不是暗器。我赔你洗头的钱，成不成？
qiao~sharp|这是头发，不是淘米箩。你先赔我一口气。
zhaoli~amused|那可贵了。他刚才喊了半条河。
y|你们这里待客，都先给客人开光？
zhaoli|江照鲤，领船的。刚才那车歪了我也有份，待会儿请你们吃饼。
qiao|乔砚生。今日先记账，我还得替石梁馆去报名。
bao~uneasy|那正好……你们馆还收不收像我这么笨的？`);
choice('price',[
 ['bao_yes','先教你站稳，米袋就算学费。','bao_help = true',`y|收不收得师父说。今晚你来，我先教你怎么不跟着车倒。
bao~amused|那我先把米晾好！练坏的米不能交学费吧？`],
 ['bao_plain','我也只是学徒。一起去问，别把我当师父。','bao_help = false',`y|我上月还把自己绊进水沟。你要不嫌丢人，跟我一起问。
bao~amused|原来你们也会摔！那我敢去了。`],
]);
part('price','quay','aunt,zhaoli,qiao',`aunt|两个饼，一碗米汤。乔家小子，你头上那点米，回头记你账上。
qiao~surprised|汤二娘！我这是替你拦住了一袋，不能算护镖？
aunt|护镖有镖钱。往米里掉头发，有筛米钱。
zhaoli~amused|她认钱，不认剑。你赢不了。
n|饼摊后贴着水陆小会的木牌：年轻人试艺，优胜者可领一年护渡差事。
qiao~intent|一年。馆里的屋顶就有着落了，不用再拿脸盆接雨。
aunt|差事有船工、守堤、教小孩。不是只看谁把谁打趴下。`);
iff('purse',`aunt|你那钱袋还完整，别又学你师父替全桌付账。`,`aunt|我看见铜钱落水了。饼先拿着，你的账写在后头。`);
choice('rules',[
 ['pay_breakfast','把这一顿记在自己名下，改日来还。','debt = true',`y|人是她请，账记我。今天帮忙的人也得吃热的。
aunt~amused|记住了。赊账可以，别起个假名叫天下第一。`],
 ['split_breakfast','让照鲤请饼，我来洗碗。','debt = false',`y|钱让她出，碗我洗。别让她以后说我们白吃。
zhaoli~amused|才见一面，就想把人情洗干净？行，抹布在那儿。`],
]);
part('rules','quay','su,gao,qiao',`gao|报名过午就关。师承、姓名、住处，照实写。
qiao|石梁馆，乔砚生。这位是——
y|我自己说。我也是石梁馆学徒，不顶任何人的名额。
su|很好。苏晚澄，替主事记录。你们报的是青蒲地方小会，不是榜谱大会。
qiao~uneasy|赢了也不会进榜？
su|不会。会得到差事、工钱，还有今后教人时说得清的一场经历。
gao|去年头名回来撑渡船了。比他没拿头名的师弟，早还清两年债。`);fact('bell');
choice('ticket',[
 ['ask_fair','若有人出钱办会，你们敢判他输吗？','fair = true',`y|我想知道，写在你册上的输赢，是谁说了算。
su~sharp|有钱的人也按同一条线判。你若看见不同，现在就问我。`],
 ['ask_task','先让我看看护渡差事到底要做什么。','fair = false',`y|剑可以慢慢试。接了一年，不能干三天就说不适合。
su~calm|这句话比报名册上的豪言有用。明日会有守船试，你别缺席。`],
]);
part('ticket','quay','zhaoli,qiao,su',`zhaoli|我明早送药去白苇汊。后日会场见，你们别只顾找对手。
qiao|我还不至于见个人就拔剑。
zhaoli~amused|是，见米袋才拔。包小满已经学会了。
su|石梁馆的韩教习托我带句话：日落前回馆，没饭也要回来。
n|乔砚生的笑收了一点。他把剑往身后藏，露出补过的护腕。
qiao~uneasy|师父要是问起盘缠……你先别说我们吃饼。
y|吃两个饼还能把屋顶吃没？
qiao|他今天没吃早饭。`);
choice('hall_gate',[
 ['bring_bread','把剩下的半张饼包起来带回去。','bread = true',`y|那就别藏。二娘，借张干净荷叶。
qiao~calm|他会说不饿。你到时候别让他把饼又塞回我们手里。`],
 ['speak_purse','盘缠的事当面说清，不替你瞒。','bread = false',`y|没钱是没钱，我们别一人瞒一点，瞒到谁也不知道。
qiao~uneasy|我没说不告诉他。就是……你先开口，行不行？`],
]);

chapter('01-hall');
part('hall_gate','hall','han,qiao,xu',`n|馆门外的雨盆排成一行，韩鹭石蹲在屋檐下削木楔，许竞川提着一把伞站在门边。
xu~amused|来晚了。你师父连你小时候摔断门牙都讲完了。
qiao~sharp|那是被你推的。
xu|我是推门，谁让你用牙顶？
han|有得笑就先笑。笑完把门顶住，木楔还没削好。
y|师父，屋顶的事，我们在渡口看到了那个差事。
han|先关门。屋顶还没塌，别把心先漏出去。`);
iff('bread',`n|你把半张饼放在木楔旁。韩鹭石伸手要推，乔砚生先按住了他的手。
qiao|凉了就硬了。先吃，我们不看。
han~amused|不看你还把眼瞪这么大？`, `han|你们早饭吃了？别学我拿茶灌饱，练剑会抖。
y|吃了。钱的事现在说。
han|好。说清楚比替我撑脸面强。`);
choice('hall_debt',[
 ['repair_now','先帮木匠修漏处，报名不差这半日。','repair = true',`y|试艺要用手，手也能递瓦。先修最漏的那一块。
han~calm|何铆在后院等梯子。别逞能上梁，你们的脚还不值一块新瓦。`],
 ['practice_now','先把明日的试艺练好，承认馆里缺钱。','repair = false',`y|我们想拿差事，但不保证拿得到。今天先把本事练足。
han|这话听着顺耳。缺钱不丢人，瞒着没本事去拿钱才要命。`],
]);
part('hall_debt','hall','he,han,qiao',`he|修最漏的地方不贵。贵的是你们上次拿剑把瓦挑裂了。
qiao~uneasy|那是为了够风筝。
he|风筝两文，瓦一百。你这剑飞得不便宜。
n|何铆把一条旧绳挂上梁，另一头放进你手里。
he|拉紧试试。别光看绳粗，先看结。
han|我年轻时也这么绑，松过一次。后来左腕就不敢再拿重物。
y|你从来没说过。
han|你们从来只问我打赢过谁。`);fact('knots');
choice('hall_trial',[
 ['learn_knots','请何铆重教一遍，自己绑一个。','rope = true',`y|我会拉，不会保住别人。你先看我绑对没有。
he|主绳双套，救人末端活结。好，拆了再绑。能闭眼绑才算记住。`],
 ['carry_timber','把结交给何铆，自己去搬木料。','labor = true',`y|不装会。你绑，我扛，今天先把漏补住。
he|这句也值钱。两个人做事，不用两个人都抢那把锤子。`],
]);
part('hall_trial','hall','xu,qiao,han',`xu|小会抽签前，借你们一块干地。三次碰袖，不拿胜负出门说。
qiao~sharp|怕输给我，被人听见？
xu|怕你赢一次，说到我孙子都听见。
han|木刀木剑。碰伤了各自的师父骂各自的，不许来我这里躲。
n|许竞川左脚落地很沉，右脚总留半鞋空处。乔砚生眼里只有他袖口。
xu~intent|你也来一回？明日有的人不会先告诉你准备好了。
qiao|他右手快，别跟着刀尖转。`);
choice('hall_exchange',[
 ['read_weight','看他腰带和承重脚，先不抢攻。','read = true',`y|你右脚不着实，是等我往你那边挤？
xu~intent|看出来了，就试着别让我挤到。光看不算接住。`],
 ['force_trial','先抢袖口，试试自己到底差多远。','read = false',`y|明知道你等着，我也得试一次。
n|刀背敲上腕骨。你没丢剑，却知道这只手今晚会肿。
xu~calm|胆子我看见了。明天还得用的手，别每次都拿来证明。`],
]);
part('hall_exchange','hall','xu,qiao,han',`n|木刀压住剑背，你忽然发现许竞川没往前。他只要再推一寸，你就得松手。
xu~intent|换你。要退，还是还想挤？
qiao~sharp|他在骗你先动，别——
han|闭嘴。替别人出剑的时候，你自己的脚也会停。
n|雨盆叮了一声，许竞川的视线往门边偏了半瞬。
y|这时候说话，也算出招？
xu~amused|你要能让我信，我认。`);
choice('hall_wrist',[
 ['yield_side','顺着刀背侧开，让他先落步。','respect = true',`y|你要中间，给你。我从旁边走。
n|你退过一条木缝，刀尖擦过衣袖。他也及时收住，没有顺势逼倒你。
xu~calm|接住了。不过我没输，别抢着替我起绰号。`,'read'],
 ['call_stop','认这一手输，留下明日再用的手。','respect = true',`y|停。我腕子受不住，今天到这里。
xu~calm|好。自己能喊停，明天就不用靠别人替你喊。`],
 ['press_again','硬挤一下，宁可碰伤也要碰袖。','wound = 1; respect = false',`n|你碰到一寸布，腕骨也被木刀压得发麻。许竞川皱眉松开了刀。
xu~sharp|你要一寸布，我给你。可别把这叫赢。
han|冷水在门外。今天这只手不许再练。`],
]);
part('hall_wrist','hall','qiao,ling,han',`ling|谁把跌打药当饭吃？上回剩的药，还没到该用完的时候。
qiao~uneasy|我拿了一点擦剑鞘。
ling~sharp|剑鞘会喊疼？把碗端起来。
n|乔砚生伸左手，右腕缩进袖里。韩鹭石没有逼他，只把自己的左手放在桌上。
han|我以前也说不疼。后来连拿碗都要挑轻的。
qiao|我能撑到后日。拿了差事再养，不耽误。
ling|伤不会看你报名册。现在讲明白，才能替你留个办法。`);fact('wrist');
choice('hall_leave',[
 ['wrist_rest','替他把训练停下，明日用另一种打法。','qiao_rest = true',`y|你当年替我背过一段山路。今天轮到我拿剑，轮到你少用一只手。
qiao~uneasy|别把我的比赛也拿走。我能守，能动，别把我晾着。
ling~calm|不晾。改握法，留一段能使的力气。这才叫养。`],
 ['wrist_private','把选择留给他，约定一疼就当众叫停。','qiao_rest = false',`y|我不替你报退。可你一旦松手，我们就停，脸面我陪你丢。
qiao~calm|说好了。别到时候也跟我一样嘴硬。
ling|我听见了。谁反悔，谁替我捣三天药。`],
]);
part('hall_leave','hall','han,xu,qiao',`han|差事只有一份，去的人不只你们。有人替你说好话，也有人真会比你强。
xu|我就不说好话了。会场见，我要赢你们一场。
qiao~amused|你小时候输的弹子，还没还我。
xu|你要我带刀去还，还是带弹弓？
n|许竞川把伞留下，自己冲进雨里。韩鹭石没拦，把削好的木楔收进小布包。
han|师父没什么大名，替不了你们撑门。包里这个，船上也能用。
y|那我们带着。不是护身符，有东西松了才敲进去。`);
choice('inn_table',[
 ['promise_home','答应会后回来把屋顶修完。','home_promise = true',`y|差事拿不拿得到，我们都回来。瓦还差一边。
han~calm|好。我留着梯子。别把回来也当一种认输。`],
 ['promise_road','说清楚想继续走远，留下自己的那份工钱。','home_promise = false',`y|我们可能还要走。若有工钱，先托二娘捎回来。
han~amused|想走就走。别把师父说得像只等钱的破瓦罐。`],
]);

chapter('02-inn');
part('inn_table','inn','lu,su,qiao',`n|临水客舍只剩一张空桌。苏晚澄刚放下册子，陆汀舟已把饼摊开，占了半边。
su~sharp|陆汀舟，我留的不是饭桌，是记录席。
lu~amused|记录我先饿了，不违事实。
qiao|你们两位是一路来的？
su|不是。
lu|一条路，两个方向。她在找我师伯的外务回函，我在替师伯送回函。
y|所以她为什么还没拿到？
lu|因为我把它放在饼下面压平了。`);
choice('inn_sword',[
 ['sit_su','先替苏晚澄挪开油纸。','su_trust = true',`y|要说笑，先别拿别人的事垫着。
lu~uneasy|这句对。苏姑娘，是我欠妥，纸没沾油，我另换一张垫。
su~calm|多谢。饭可以一起吃，回函不能吃进去。`],
 ['sit_lu','借一角坐下，把自己的干布垫上。','su_trust = false',`y|我也饿。回函垫干布，咱们各让一只碗的位置。
su|行。别把桌子说成剑道之争，就只是桌子不够大。
lu~amused|我本来准备说的。你怎么连这个都知道？`],
]);
part('inn_sword','inn','lu,su,jue',`jue|还有一碗面？我替白苇村送药，明早要早行。
lu|师父坐这儿。我去端。面大碗还是小碗？
jue~calm|大碗。行脚不能吃虚的。
su|明日有水陆两队。陆队护药车过枫岭，水队带药米去白苇汊，后日会场汇合。
lu|她带陆队走外务，我看山路。水路听江照鲤的，别听我的。
y|小会为什么还管这些？
su|差事叫护渡，不能光在干地上打一场。两队都记见习，误了试艺不抹掉已做的事。`);
choice('inn_rival',[
 ['read_rules','请书吏把停试与急难的规矩当众读清。','rule_known = true',`y|三个短音停试。去帮忙的人回来，不许被说成怯战。
gao|我给每队抄一份。写清楚，是省得事后各说各的。`],
 ['ask_routes','先问路上的人手和缺口。','rule_known = false',`y|哪队少会抬担架的人？哪队少能在岸上守绳的人？
su~intent|这才是我正要问的。两队各缺一个愿意在别人忙的时候留住手的人。`],
]);
part('inn_rival','inn','rong,xu,qiao',`rong|刚才问敢不敢判出钱人输的，是你？
n|容既白穿着干净长衫，背后伙计扛着两袋米。他手里却是一根磨白的棍。
xu|他问得没错。你的名字排在头一场，谁知道是不是挑了软的。
rong~sharp|头场最早，打完我还得开仓。你若想换，现在就换。
qiao|那你为什么捐米？
rong|仓门也是木头。水来了，我的米不会因为姓容就不湿。
y|你想我们怎么跟你打？
rong~intent|想赢就真赢。别打到一半突然替我留脸。`);fact('grain');
choice('inn_rain',[
 ['rong_true','约定真打，也要求他受伤就停。','rong_fair = true',`y|我不让，你也别把输了说成我们不识抬举。
rong~amused|成交。邓苹，听见了？我输了不许先说棍子滑。`],
 ['rong_distance','暂不交好，只认同一条判线。','rong_fair = false',`y|你有钱修坪，我没有。好坏都让场上的线说。
rong~calm|可以。至少你肯把我算成对手，没有只算成一袋银子。`],
]);
part('inn_rain','inn','zhaoli,du,he',`n|夜雨敲着窗。杜汀叟一只耳朵贴在木柱上，何铆把酒碗从他肘下救开。
he|听河也别压我的桌子。桌腿刚补好。
du|桥脚回水先退后涨，今年比前几年早。
zhaoli~uneasy|会场的人还在加棚。东堤要是真涨，他们来得及撤？
du|提前告诉他们。别到水上来了，才问要不要信老头。
y|你也报了水队？
zhaoli|我领船，就得把人带回来。可这次我想让他们也记一次我的名字，不只写某船。`);fact('bank');
choice('inn_depart',[
 ['warn_water','把回水的征兆先报给主事。','warning = true',`y|谁嫌多事就让他嫌。写在会前，事后才没人装没听过。
zhaoli~calm|我陪你去。老杜说的话，也得有人把它送到听得见的地方。`],
 ['prepare_water','先帮何铆把撤棚用的绳和木楔备好。','warning = false; labor = true',`y|他们听不听，绳子都先备着。你量，我裁。
he|那就动手。别把每条绳都剪短，留两根能跨沟的。`],
]);
part('inn_depart','inn','zhaoli,pei,qiao',`pei|枫岭一路要赶两处村子。药箱到了，不意味着护送完，人也得进屋。
zhaoli|白苇汊河道窄，药米都走船。谁晕船现在说，别拿脸色证明勇敢。
qiao|我想走陆路。不能握剑，也还有肩膀能抬东西。
zhaoli~amused|我也缺肩膀。就是这肩膀得会跟船一起歪。
n|两队各留着一个空位。你们的名字都在后日试艺的册上，去路却只能选一条。
y|分开的人，也会到会场？
pei|会。只是路上有些事，错过就不是你亲眼见过。`);
choice('departure',[
 ['route_land','走枫岭陆路，随镖队护药车。','route = 1',`y|我走山路。照鲤，会场见，不许拿我们怕水编笑话。
zhaoli~amused|那得看你们回来时，有没有比晕船更好笑的事。`],
 ['route_water','走白苇水路，跟照鲤和老杜上船。','route = 2',`y|我上船。砚生，你的肩膀留着，到会场帮我扛赢来的东西。
qiao~amused|要是赢一身伤，我也扛。但你最好轻一点。`],
]);
part('departure','quay','su,zhaoli,qiao',`n|天没亮，陆队推车出镇，水队解缆离岸。两盏灯在雾里越隔越远。
su|各自记得报平安。没有亲眼见过的事，回来慢慢问。
y|好。今天先把手里这段路走完。`);
current.push('{ route == 1:');go('ridge_load');current.push('- else:');go('water_load');current.push('}');

chapter('03-land');
part('ridge_load','ridge','pei,fan,ming',`fan|往前不远，再翻一个坡就是。
ming~uneasy|你从渡口开始，已经说了五次一个坡。
pei|他每次都没说错。错的是你每次都信最后一个。
n|药车陷进湿泥，范遇把扁担垫在轮下，明栓护着新木剑，不知先放哪只手。
y|药箱不能淋，车也不能丢。先别一起往一边抬。
pei|听你的。定谁发口令，别三个人各喊一二三。
fan|能喊慢一点最好。我气还没喘匀。`);
choice('ridge_toll',[
 ['load_unload','卸下重箱，两人守药，两人推车。','supplies = true',`y|人多不是力就齐。先卸这一箱，我守着，谁也别单独离队。
pei~calm|慢了一刻，手脚都还好。记住，赶路最怕把人赶散。`],
 ['load_shoulder','直接肩抬过坑，抢回赶路的时间。','wound = wound + 1',`y|我在这边，等范师傅喘匀。起——
n|车轮抬过泥坑，你肩上也被压得发疼。一小段快路换来半路沉重。
pei|快了，但下个坡换人扛。别让一个人把队伍的力气先用完。`],
]);
part('ridge_toll','ridge','xu,fan,pei',`n|坡口有人拦道。许竞川用刀鞘压着一根横木，身后两名脚夫正吵谁踩坏了谁的竹筐。
xu~sharp|别笑，我不是收过路钱。横木下面有辆翻车，先别往前。
fan|他们说我们车轮宽，压了路沿，得赔。
pei|赔多少先看东西，不能一句有药就让所有人让路。
y|另一家也得靠路吃饭。
xu|我在这儿站半刻了。你们谁能先让他们把嗓门收回去？`);
choice('ridge_lesson',[
 ['toll_share','先借扁担抬翻车，赔偿留姓名回头算。','bridge_help = true',`y|谁的东西谁记着。先把车抬正，别让下一辆也翻。
xu~calm|这句他们听得进。刀鞘借你撑底，我来抬。`],
 ['toll_road','请镖行出面定赔偿，自己守药车。','bridge_help = false',`y|我不懂路钱，裴领队谈。我守药，别谈到一半把正事忘了。
pei|好。谁擅长什么，今天就先做什么。范遇，记下破筐的数。`],
]);
part('ridge_lesson','ridge','lu,su,xu',`lu|许兄，你这刀在平地逼得快，上斜坡也这么逼？
xu|你要试，等我喘完。
su|你左脚踩在浮石上。陆汀舟问的不是你敢不敢。
lu|金陵剑喜欢先把后来两手留住，我在山里得先问这一脚落不落得下。
su~sharp|你别替金陵下结论。留后手也不等于照着平地走。
y|那就把石头当石头，别先当门派。
n|陆汀舟把浮石拨开，下面是一片雨水泡开的空土。`);
choice('ridge_rival',[
 ['terrain_study','照两人的说法各走一次，问清适用处。','terrain = true',`y|平处留剑路，斜处先落脚。我想知道什么时候该换。
su~calm|好问题。记的不是谁对，而是什么地方还能用。
lu~amused|这回我没话可抢，终于能吃口饼了。`],
 ['terrain_speed','跟陆汀舟学斜坡抢位，放弃这次细记。','terrain = false; read = true',`y|先教我眼前这一下。下雨前要赶到桥头。
lu|右肩别先转。人到稳处，再让剑跟上来。
su|我把另一种写给你。赶路可以，别回来时说它没用。`],
]);
part('ridge_rival','ridge','xu,yu,lu',`yu|师兄，你护腕落下了。
xu~sharp|不是落，是不要了。总往下滑。
yu|那我扔了？
xu~uneasy|……先给我。
lu~amused|好像也没那么不要。
n|余枫退到树后。许竞川把护腕塞回去，半天才问你乔砚生的手怎么样。
xu|他不肯说，我也不追着问。可要是我上场把他打伤了，不算我占便宜？`);
choice('ridge_supper',[
 ['rival_honest','告诉他腕伤事实，也说砚生有自己的打法。','rival_trust = true',`y|有伤是真的。他会守，会挪，不会平白把胜场送你。
xu~calm|那就好。我也不会送他。他要我认真，就让他自己来讲。`],
 ['rival_private','保留同伴隐私，要求当面约定停手。','rival_trust = false',`y|那是他的事。你当面问他能不能打，别问我能不能替他输。
xu~intent|行。你倒护得明白，比一味说没事好。`],
]);
part('ridge_supper','ridge','wei,ling,pei',`wei|你们药箱里有退热的么？前村小孩昨夜烧起来了。
pei|有。可原定送另一村的数也不能少，我得留单。
ling|我先看人。你们别听一个烧字就把药倒出去。
n|魏葭想帮你搬箱，又缩回手。她指甲里都是赶路留下的黑泥。
y|你走哪条路来的？
wei|旧桥。桥板空了两块，我趴着爬过来的。车过不去。
pei~intent|先停。问清楚，再动。`);
choice('bridge_arrive',[
 ['medicine_share','请凌苇分诊，匀药并留下补送记录。','medicine = true',`y|先救能救的，不让另一村被悄悄欠下。差的数我去报。
ling~calm|好。我要的是有人记着，不是逼孩子等册子写完。`],
 ['medicine_send','派一人带凌苇先行，自己护住整车。','medicine = false',`y|药由你用，余数回来对。我留在车边，不让第二头也出岔。
pei|可以。不是所有人都得冲到人前。守得住这车，也是护送。`],
]);

chapter('04-land');
part('bridge_arrive','bridge','pei,he,ming',`n|断雨桥只有半边能走。何铆踩着桥桩敲木板，桥下传来一个孩子的哭声。
he|不是塌了，是有人拿旧板补新洞，底下的撑木烂透了。
ming~surprised|那我们刚才站的——
he~sharp|别跳！慢慢退！
pei|桥下是拾柴的，卡在横梁边。水还没到胸，雨再来就难说。
y|你为什么先上桥？
he|因为你们会看剑，不会看木头。我也得来一趟。`);fact('cross');
choice('bridge_guard',[
 ['bridge_anchor','把绳固定在活树，先试受力再下人。','bridge_safe = true',`y|桥本身不稳，不能再把人的命系桥上。树根在这边。
he~intent|这个位置对。我看结，你们一人试拉，别一起上。`,'rope'],
 ['bridge_expert','请何铆掌绳，自己清桥头围观的人。','bridge_safe = true',`y|你来管绳。我让上头空出路，不再有人踩坏下一块。
he|好。不是说不会就算完了，站住你会的那个位置。`],
 ['bridge_jump','抢先踩梁下去，省去等绳的工夫。','bridge_safe = false; wound = wound + 1',`n|湿木往下沉了一截，你撞上桥桩，肋边一疼。何铆及时把绳抛过来。
he~sharp|抓住！省下的工夫现在得两个人来赔！`],
]);
part('bridge_guard','bridge','xu,fan,pei',`fan|后面的车催着过，说药车能等，他们的菜不能等。
xu~sharp|再推一次，我就——
pei|你就怎样？把他们砍倒，车自己往回走？
n|带头的脚夫抬起扁担。桥头只有两步宽，你不用赢他，得让后面的人停下来。
y|先叫车轮别动。许竞川，刀别出鞘。
xu~intent|我守右边。你别往桥洞里退。
n|扁担从斜上扫下，打的不是你，是顶住车轮的木楔。`);
choice('bridge_endure',[
 ['guard_wedge','贴近车轴，护木楔而不抢扁担。','guard = true',`n|你贴车轴蹲低，扁担落在实木上，震得对方虎口发麻。车轮没有越线。
xu~intent|就这样！撑三息，裴领队已经过去了。`,'terrain or read'],
 ['guard_talk','认下延期的损失，让脚夫先看桥下。','guard = true; debt = true',`y|菜坏了记我账。先看下面，那个人比你这筐菜先落水。
n|对方低头，扁担终于垂下。你没赢一招，桥头却空了出来。`],
 ['guard_meet','正面接扁担，硬守三息。','guard = false; wound = wound + 1',`n|扁担压得你手臂发颤。第三息将尽，许竞川用刀鞘撑住你的肘。
xu~sharp|别跟木头比硬！我顶住了，松半分！`],
]);
part('bridge_endure','bridge','he,ming,pei',`n|桥下的小孩顺绳爬上来，怀里还抱着一捆湿柴。明栓想接，先被他躲开。
ming~uneasy|我不抢你的。你松手，我给你捆紧。
he|过桥的人少一半，桥的命就长一半。先抬药，人分开走。
pei|我们迟了大半日。赶回去也许就错过第一轮。
y|那还赶么？
pei|赶。但不拿第二个孩子的命换。你想选什么，现在说。
n|雨打在刚补好的木板上，每一块都能听见不同的空响。`);
choice('bridge_letter',[
 ['escort_finish','把最后一箱送入村，接受迟到。','escort = true',`y|人没进屋就还没送完。迟到写在我名下。
pei~calm|写全队。不要一个人抢着做欠账的人。`],
 ['escort_split','自己先回报信，由镖队完成最后一程。','escort = false',`y|我回去报桥坏和迟到，你们送药。会场不能只看见我们缺席。
pei|好。回程别抄近路。你带的是消息，不是逃跑的理由。`],
]);
part('bridge_letter','bridge','su,lu,pei',`su|我会记：桥头停争、护车、救人。这不是替迟到找借口。
lu|也别把你挨了一扁担，记成胜十名壮汉。
y|你再说，我就把你藏了两块饼写进去。
lu~surprised|那可是救急的饼。
pei~amused|救你的急，还是救我们看你挨饿的急？
n|笑声里，你才发现人人都湿透了。苏晚澄把册子藏进油布，自己的袖子却滴着水。
su|回去以后，谁问陆路容易，你自己讲。别把他们那条河也讲完。`);
choice('workshop_gate',[
 ['record_people','要求记录里加上木匠和脚夫的姓名。','credit = true',`y|没有何铆的结、范遇的扁担，我们这几柄剑有什么用？
su~calm|已经写了。不过你提醒得对，下次由他们自己说名字。`],
 ['record_cost','先记延误与损失，免得两村互相埋怨。','credit = false',`y|好事不急着领。药少了多少、菜坏了多少，先说清楚。
pei|我回去对账。你没把这事只当一场好看的救人。`],
]);

chapter('03-water');
part('water_load','reeds','zhaoli,du,cheng',`cheng|你是昨晚说自己肩膀能扛的？上船先把肩膀放松。
zhaoli|程阿笠，管桨。别看她比你小，船上你得听她。
du|绳解哪一根，先问。最显眼的那根，往往不是最该解的。
n|船头药箱放得高，米袋压在一边。船离岸半尺，便往左沉了一点。
y|这样装一路，会不会越来越偏？
zhaoli~intent|会。现在改，还是到汊口再改？岸上等着咱们的还有两袋。`);
choice('water_oars',[
 ['balance_load','重排药米，让最怕湿的箱子居中。','supplies = true',`y|药先居中，重米分两边。后上的两袋另找低位。
cheng~calm|我帮你挪。慢一会儿，总比在河心追箱子强。`],
 ['load_more','多带两袋，自己一路负责压住偏重。','supplies = false; labor = true',`y|带上。我坐右边压着，到了汊口再搬。
zhaoli|可以，但这不是你坐到最后的保证。水变了，得听口令换位。`],
]);
part('water_oars','reeds','du,cheng,zhaoli',`n|程阿笠的桨划得不快，每次入水却都留一点斜角。你一用力，船头反而横了。
cheng~sharp|先停！你划得有力，我改方向就得多一倍力。
y|我以为快一点就不耽误你。
du~amused|你要是往灶里倒一缸水，也不能说是帮着煮饭。
zhaoli|老杜一开口，船都饿了。阿笠教他，我看前头。
cheng|桨不是棍。你感觉一下，水往哪边带，不用先赢它。
n|芦苇扫过船舷，水里没有坪上那种固定的中线。`);
choice('water_net',[
 ['oar_listen','收力跟阿笠的节奏，学控制方向。','water_read = true',`y|你喊一次，我走一次。别为了给我面子说对了。
cheng~calm|第二下对了，第一下没有。你肯听，已经少走半个圈。`],
 ['oar_rope','把桨还给熟手，自己守住货绳。','water_read = false; rope = true',`y|我今天划不好，先不添乱。哪根绳要留活口？
du|人手够就不用人人会划。来，指给我看，哪根不能死勒。`],
]);
part('water_net','reeds','zhaoli,po,du',`po|姑娘，前头网兜里卡了一根大枝，水越冲越紧，我一个人提不起来。
zhaoli~uneasy|这张网挡着副汊，我们不拆就得绕到主流。
po|拆了，我这半月的菜钱就没了。
y|不是鱼钱？
po|鱼也吃菜呀？是拿鱼换菜。你们年轻人别笑，我算得清。
du|水还没大，能慢慢解。可会误到白苇村送药的时辰。
n|网绳已绷出细响，断在水里，比割在手上更难捞。`);
choice('water_healer',[
 ['net_cut','割开一角保船，留下赔网的承诺。','net_cut = true; debt = true',`y|网我赔。先开一角，断绳别放进水里。
po~uneasy|你记得回来。说赔网的人，往往游得比鱼还远。
zhaoli|我作证。青蒲渡找我，不让你只追一个路过的人。`],
 ['net_untie','靠岸慢慢解，不把老人的生计扔掉。','net_cut = false',`y|药怕晚，网也不能说没就没。我们一起解，能省一点是一点。
du|我稳住船。阿笠递刀，别割，先挑那处结。`],
]);
part('water_healer','reeds','ling,jue,zhaoli',`n|白苇村的药棚比你想得小。觉茂正用门板搭床，凌苇卷着袖子在水里洗手。
ling|药到了？先放干处，别一进门都问我有没有救。
jue|有个老人不肯吃，说省给孩子。
ling~sharp|他的病不是孩子那一种。药省错了，两个都耽误。
y|我帮什么？
ling|坐下听他们说完。别把所有人都听成同一种病。
zhaoli|她忙的时候最凶，等会儿她记不得自己没喝水，你得凶回去。`);
choice('water_change',[
 ['medicine_listen','留在药棚帮分诊记人，听凌苇安排。','medicine = true',`y|一个一个说。我写得慢，别替旁边那位抢话。
ling~calm|这样好。人不是药箱上一个数，问清楚才能往下做。`],
 ['medicine_boat','帮觉茂加固门板床，照鲤去问诊。','medicine = false; labor = true',`y|名字你们问。我把床抬高，夜里涨水别让人睡水上。
jue|劳烦。木楔放那儿，不用剑来削，削歪了还得补。`],
]);
part('water_change','reeds','du,zhaoli,cheng',`n|回程时，来路的苇根露出更多。杜汀叟忽然叫住了准备解缆的照鲤。
du~intent|不是退潮。回水在借低处走，等前头一满，这里就会涨得更快。
zhaoli|去旧桩湾等一夜？那就耽误头场。
cheng|我听杜师傅的。水声不对，船底都空。
y|你想回去试艺，不只是想领船的工钱吧？
zhaoli~uneasy|我想他们写江照鲤。不是某人带来的一条船。可我也不能拿阿笠替我赌。`);
choice('night_moor',[
 ['water_wait','进旧桩湾等水，接受错过头场。','wait_tide = true',`y|晚一点到，名字还在。人少一个，写再大也没用。
zhaoli~calm|好。我去报晚，不让你替我背。阿笠，转桨。`],
 ['water_probe','沿岸试探一段，发现不对立即入湾。','wait_tide = false',`y|不进主流，探到第三根桩就停。你定什么叫不对，现在说清。
du|船尾先空，桨声两下不接，就退。不是等看见浪才说不对。`],
]);

chapter('04-water');
part('night_moor','rainboat','zhaoli,du,cheng',`n|旧桩湾黑得只剩船灯。一艘小渔船被回流顶上旧桩，船上有人举着空盆敲。
cheng~surprised|那桩有半截在水里，船一转就穿底！
zhaoli|我们过去也会被顶住。得先把他们的人转出来。
du|主绳别直牵，直牵两条船就会一起横。
y|你叫我守哪边？
zhaoli~intent|岸绳。可我要过去接人，你要能说不行，不许只会说小心。
n|她把红绳的另一端交进你手心，没有回头。`);cg('rescue');
choice('night_decide',[
 ['night_angle','用斜牵线靠活树，让船头有转向余地。','night_safe = true',`y|你先等等。树到船尾，绳留这个角，别直撞过去。
du~intent|对。我压船尾，照鲤走绳内侧，别给绳勒住脚。`,'rope or water_read'],
 ['night_order','请老杜定绳角，自己照口令逐次放绳。','night_safe = true',`y|我不猜。杜师傅，你喊放多少，我放多少。
du|一臂。停。再半臂。别怕慢，怕的就是你忽然替我快一下。`],
 ['night_pull','先拉紧绳，尽快把照鲤送到对船。','night_safe = false; wound = wound + 1',`n|绳猛地压住手腕，两船一起偏转。照鲤伏倒在舷边，杜汀叟的篙抵住旧桩。
du~sharp|松！半臂！你是在救人，不是在拔河！`],
]);
part('night_decide','rainboat','zhaoli,liu,cheng',`liu|船上还有个大箱子！里头是我娘攒的布，不拿就都没了！
zhaoli~sharp|人先过来，箱子我替你拴住！
liu|你们走了，谁还记得一箱布？
n|船底开始进水。照鲤伸出的手悬在半途，阿笠咬牙把空盆递给船上另一个人。
cheng|盆拿去舀水。布箱不能挡门！
y|他说的不是价钱，是以后怎么办。
zhaoli|那你替我告诉他，以后还有人来。现在先把手给我。`);
choice('night_fire',[
 ['cloth_promise','答应回来捞布，明确写下船号与地点。','cloth = true',`y|我记住这根断桩。天亮以后我们一起回来，不让你一个人找。
liu~uneasy|……船号叫小蓬。你别只记船号，记我叫刘篙。
zhaoli~intent|刘篙，抓住！`],
 ['cloth_truth','不许救不了的诺，直说只保得住人。','cloth = false',`y|我不能保证布还在。但你娘要等回去的人，是你。
n|刘篙低头看了一眼，终于跨过船舷。照鲤没替你说一句好听的，只把他的手抓牢。`],
]);
part('night_fire','rainboat','zhaoli,du,bo',`bo|火别靠帆，帆浸过油。你们要烤衣，到这边来。
n|钓客薄远掀开岸棚。小火上架着一只黑锅，里面只有几片老姜。
zhaoli~uneasy|我刚才是不是太急？老杜明明让我等。
du|急得对不对，要看你急的时候有没有听见别人。不是今天救到了，就每回都这么救。
y|你刚才听见我了。
zhaoli|听见了。平时别人只说船上的事你作主，作坏了也你自己认。
n|她把红绳解开，手腕上也留着一道深痕。`);
choice('night_watch',[
 ['zhaoli_share','以后由她看水、你看人，互相叫停。','zhaoli_trust = true',`y|你有看不见的岸，我有听不懂的水。别谁全包，谁也不问。
zhaoli~calm|好。下次我又一口气往前冲，你就喊江照鲤，别喊姑娘小心。`],
 ['zhaoli_space','让她独坐一会儿，自己去补救生绳。','zhaoli_trust = false; rope = true',`y|我不替你把这件事说圆。绳子我先补好，你想说再叫我。
zhaoli~calm|嗯。姜汤给我留半碗，别把话也全留在肚子里。`],
]);
part('night_watch','rainboat','cheng,jue,du',`jue|我守上半夜。你们先睡，明早还得用眼。
cheng|我不困，刚才都没出多少力。
du~sharp|你把人从舷边背过来三趟，没出力是船自己背的？
n|阿笠终于低头，看见自己两只手在抖。觉茂没有说她胆小，只把锅往她那边挪。
y|会怕也能掌桨。今天没有人因为你怕就落水。
cheng~uneasy|明早别跟渡口的人讲我抖。
jue~calm|只讲你背了几个人。手抖是你自己知道的事。`);
choice('night_return',[
 ['watch_second','接下半夜，给阿笠留下整段睡觉的时间。','escort = true',`y|下半夜我来。你睡足，明天别让我划得满船转圈。
cheng~amused|你那也不是转圈，是找不到岸。行，我明天看着你。`],
 ['watch_tools','和薄远修好警铃，让疲惫的人都能轮休。','escort = false; labor = true',`y|水一到这根钉，铃先响。醒着的人查铃，别硬撑眼皮。
du|先试响，再睡。管用的东西不能只看着像管用。`],
]);
part('night_return','reeds','su,zhaoli,du',`n|天亮后，主事派的接船停在湾外。苏晚澄先问人数，再看册子。
su|都在？好。误了的那场，我会按急难记，不记弃试。
zhaoli|我想写所有人的名字。阿笠、刘篙、薄远，不只领船人。
su~calm|让他们自己说，我来记。
du|别把我写成隐居的神仙。昨晚要是没那棵树，神仙也得湿。
y|没有人拿剑把水劈开。倒是这条绳，大家都碰过。
zhaoli~amused|行，先回去。夸绳子也得让绳子歇口气。`);
choice('workshop_gate',[
 ['water_credit','让每人说自己的部分，不替他们领功。','credit = true',`y|我只讲岸上那段。水里发生的，让阿笠讲。
su|这样才是记录。一个人站在最亮处，不等于全场都是他做的。`],
 ['water_cost','先核对失去的东西与未兑现的承诺。','credit = false',`y|船、布、网，各有谁的名字。回去不能只报人齐了就算完。
zhaoli~calm|我跟你一起对。救回来之后的日子，也要有人过。`],
]);

chapter('05-workshop');
part('workshop_gate','workshop','he,aunt,qiao',`n|修船坞里一锅汤滚得很响。何铆把门板架成桌，汤二娘还在嫌碗不够大。
aunt|你们出趟门，回来个个像晒坏的腌菜。先喝，喝完再吹牛。
qiao~amused|我没吹。刚才只说他们怎么还没到。
he|问了十九次。第十次以后，门都快被他看穿了。
y|你怎么不来接？
qiao~uneasy|师父叫我等在这儿。说有人回来，总得看见一个没乱跑的。
n|他抬了抬右腕，又很快放下。你们的两条路，终于落在同一锅热汤边。`);
iff('route == 1',`zhaoli|听说你们桥边耽搁了。河上也是，没谁特别轻松。
y|我只知道回来的人还在。你的那段，吃完慢慢说。`,`pei|你们的船灯整夜没出现。砚生最后把碗都端凉了。
y|我们在等水。你们桥上那段，等下从头讲。`);
choice('workshop_people',[
 ['reunion_honest','先讲自己做错的那一下。','honest = true',`y|我不是每步都做对。最想省工夫的时候，差点让别人替我付。
qiao~calm|你肯回来讲，我就敢告诉你我也有没做好的。先吃，别抢着认罪。`],
 ['reunion_light','先讲最好笑的一件，让大家喘口气。','honest = false',`y|先说不疼的。陆汀舟能把回函压在饼下面，江湖上还有什么不能发生？
lu~amused|我已赔礼，怎么这桩旧事比师门三百年还难翻篇？`],
]);
part('workshop_people','workshop','pei,ling,he',`ling|雁秋，你肩上的旧伤还发不发？
pei|你现在问，是按朋友问，还是按大夫问？
ling~sharp|按有眼睛的人问。你抬箱子时，把左边先让给别人了。
n|裴雁秋伸手去端汤，何铆把重碗换成一只小的。
pei|当年我让你走，是怕车队再误，不是觉得你只会添乱。
ling|我知道。但你替我决定了。我那时候已经能自己说走不走。
y|你们还一起护药？
pei|正因为一起，才不能永远绕着这句。`);
choice('workshop_qiao',[
 ['healer_speak','让两人自己讲完，接下眼前的杂活。','ally = true',`y|汤我去添，你们别拿谁的碗空了当话头躲过去。
ling~amused|听见了？今天连躲的地方都被你的人堵上了。
pei~calm|那就讲完。下回我先问你，再定车队怎么走。`],
 ['healer_question','问一次以后该怎样分工，不替谁判对错。','ally = false',`y|下次又有人受伤，你们先问什么？
pei|先问她需要几个人、多久。我报清车队能等多久。
ling~calm|再一起决定。别拿体谅当成不必开口。`],
]);
part('workshop_qiao','workshop','qiao,xu,ling',`xu|明日我跟你同组。你手要是没好，现在告诉我。
qiao~sharp|好没好，你上场不就知道？
ling|他要的是能不能打，不是你会不会顶嘴。
n|乔砚生盯着许竞川的刀鞘，过了片刻，终于把右腕放在桌上。
qiao~uneasy|不能连抢三次。两次以后，我得换。
xu|够了。我知道你留什么，也告诉你，我右脚转身慢。别说我没给你看。
y|你这算让招？
xu~intent|算把丑话讲在前面。真打的时候，各自想办法。`);
choice('workshop_rong',[
 ['qiao_team','约定明日协作试，由他守你攻。','team = true',`y|守的时候喊我。我不把你的剑拿走，也不假装你的手没伤。
qiao~calm|行。你别把攻全吞了，该我走的时候，我自己会走。`],
 ['qiao_single','支持他独立完成有限目标，你去自己的场。','team = false',`y|你自己选能做到的那一段。我在自己的场上，也不会拿你当借口。
qiao~calm|这回听着舒服。谁先完事，谁去看另一场。`],
]);
part('workshop_rong','workshop','rong,deng,aunt',`deng|东仓能多拿十袋，再多就得动雇工的口粮。
rong~uneasy|我知道。不是我一句送米，后面的人就不用吃。
aunt|你爹年轻时也这样。想做一桩大善事，把洗锅的米都捐了。
rong|后来呢？
aunt~amused|后来在我这儿赊了七顿。
y|那明日怎么办？
rong~intent|我出十袋，工钱照付。有人说我拿钱买好名声，你若真这么想，就当面说。`);
choice('workshop_night',[
 ['grain_work','出自己的劳力，把十袋的用处做足。','grain_help = true',`y|你出米，我们来搬。谁干过活，册上写谁，不拿你名字盖过去。
rong~calm|好。也别把我的名字擦掉。出了力的人，没必要假装没出。`],
 ['grain_terms','要求公开米数和用途，免得善意变成人情债。','grain_help = false',`y|账公开，少了谁能问，多了别拿来逼谁让招。
rong~sharp|可以。我也要你们以后别用家财两个字，抹掉我练棍的十几年。`],
]);
part('workshop_night','workshop','zhaoli,lu,su',`n|饭后，苏晚澄在灯下誊记，陆汀舟把干净回函放到她面前，压纸的是一块洗过的卵石。
su~amused|终于不是饼了。
lu|石头不能吃，我少一个能送的人情。
zhaoli|明日会前都有点心慌？我刚才连平时走惯的踏板，都多看了一眼。
y|有。最怕别人说我今天做的，只是碰巧。
su|碰巧也有前因。你明天不用把过去都证明一遍。
lu~calm|你想试的那一手，只要到场，真试过就行。别顺便试着替一生争个结论。`);
choice('arena_open',[
 ['night_friend','找照鲤核对明日的停手信号。','zhaoli_trust = true',`y|你喊我名字，我停。也请你听我喊，别最后还嫌我多嘴。
zhaoli~calm|说定了。明天不管在岸上还是船上，都算。`],
 ['night_record','找苏晚澄把自己的失误补进记录。','su_trust = true',`y|好听的写了，难听的也得在。别让下个学徒照着我错的那一步学。
su~calm|我不删。你也别只记错的，把真正做到的那一段留住。`],
]);

chapter('06-arena');
part('arena_open','arena','yan,gao,rong',`yan|青蒲水陆小会开试。不是天下第一，没有一场胜负能替你包下一世。
gao|木兵，出线止，三个短音全场停。护渡见习另记，不抵试艺胜负。
rong~amused|听见没有？别打赢我以后去说自己破了米价。
y|米价你自己定，棍价我试试。
n|容既白把外袍交给邓苹，露出磨破的肘护。第一棍试探很短，落在你剑能接住的位置。
rong~intent|别因为我第一次出得轻，就以为后面也轻。
n|你看见他左手每次往回收，右脚才跟进。间隙在棍尾，不在脸上。`);
choice('arena_press',[
 ['arena_read','先守一手，看清棍尾回收的时机。','duel_read = true',`y|我看见了，但不急着进去。你也还在等我。
rong~intent|这句算实话。来，第二手。`],
 ['arena_rush','抢第一轮的短棍，逼他早出后手。','duel_read = false',`n|你抢进中间，棍尾忽然翻上来。你只得侧身，剑势散了一半。
rong~sharp|钱替不了我打，胆子也替不了你退。现在怎么办？`],
]);
part('arena_press','arena','rong,xu,qiao',`n|第二轮，棍的压力突然变重。你听见衣袖擦过护手，场外的喊声像隔了一层水。
qiao~intent|他不是每一下都快！别被第一下赶着！
xu|你先把呼吸接回来！右边还有半步！
y|场外的人说得都对，可剑还在我手上。
rong~intent|那就听你自己能做到的。我要再进了。
n|棍头占住中线，你的伤处若再发力，就很难收住下一下。`);
choice('arena_result',[
 ['duel_turn','让出中线，贴棍尾绕到侧方。','duel = 2',`n|你让出一条直路，把剑留在斜处。棍尾回收时，剑背终于轻碰到他肩衣。
rong~surprised|……这一手，确实到了。再来，我不会再让你这么走。`,'duel_read and wound < 2'],
 ['duel_three','不求碰肩，只守住第三轮。','duel = 1',`y|我不抢你那条路。我只把自己这条留住。
n|第三棍震得手心发麻，你仍没越线。锣声后，你才把那口气吐出来。
rong~calm|守住了。这不是你碰到我，但也不是我打倒你。`],
 ['duel_risk','赌他收棍的半瞬，以伤换碰肩。','duel = 0; wound = wound + 1',`n|剑背碰上衣肩，棍尾也点中你肋下。主事立即叫停，判同时中身。
rong~uneasy|别硬笑。你碰到了，我也到了，这笔账谁都没赢净。`],
]);
part('arena_result','arena','rong,yan,deng',`yan|到此，记一次清楚的问手。输了哪一手，自己也得记清楚。
rong|你比我想得难打。我本来以为，你会先问我输不输得起。
y|你真输了会怎样？
rong~amused|先想怎么赢回来，再想午饭。顺序不能反，反了容易发脾气。
deng|少东，午饭已经凉了。
rong~surprised|那就先吃。道理也得看时候。
n|他把棍靠在坪边，没有叫伙计替他解释。你终于看见，比你家有钱的人也会认真懊恼。`);
choice('arena_pairs',[
 ['rival_rematch','约定养好伤以后再来，不要今日赌完。','rematch = true',`y|下一回我也练好了。今天先把手留着吃饭。
rong~calm|好。输赢不预定，饭我可以先定。`],
 ['rival_distance2','只行礼承认这场，不许下未来的诺。','rematch = false',`y|这一次我认。下回的事，下回走到你面前再讲。
rong~calm|也好。比随口说明年一定来，再让我多备一双筷子强。`],
]);
part('arena_pairs','arena','qiao,xu,yan',`n|乔砚生与许竞川的场排在斜木板旁。试的不是倒人，是二人轮换守住一面小旗。
xu~amused|怎么，我想跟你打，结果要跟你站一边？
qiao|嫌我碍事，你去守另一边，看主事认不认。
yan|轮换的时候互相报信。谁抢得自己风光，旗落了就都算失。
y|原来这场不是两个人都把别人打倒。
qiao~intent|我守左。手不行的时候会喊，不让你自己猜。
n|另一组木杆横扫，旗脚在湿板上滑了一寸。`);
choice('arena_pair_result',[
 ['pair_signal','按约定报位置，让同伴先换手。','pair_win = true',`y|砚生，左边我接！你去旗后，别抬右腕！
n|乔砚生让出位置，许竞川的刀鞘钉住旗脚。旗没有倒，三个人也没抢成一团。
qiao~amused|听见了。这次我没撑，你也没把我全拿走。`,'team or qiao_rest'],
 ['pair_flag','自己扑住旗脚，把守人的事交出去。','pair_win = true',`y|旗我按着，你们守人！我不抬头，信你们这回。
xu~intent|别松！再一轮！
n|木杆停在你头顶半尺，刀鞘先接住了它。你连谁打来的都没看清。`],
 ['pair_attack','先抢倒持杆人，用先手结束压力。','pair_win = false',`n|你扑了出去。对方收杆让开，旗在你身后倒了。
qiao~uneasy|我喊了。我不是要你救我，是要你换一下。
xu|还能记清哪一下没听见，今天就没白来。`],
]);
part('arena_pair_result','arena','su,lu,yan',`su|这场我记三个人的手，不写谁替谁扛了全场。
lu|我刚才看见有人临时换了握法，不在旧式里，也没把旧式扔了。
su~amused|你若要拿来反驳我，最好写清楚为什么换。
y|你们还要争？
lu|要。但晚上能坐一桌吃饭，不耽误争。
n|忽然，东边的锣响了两个短音。严平章抬头，还没等第三声，便有人沿坪边跑来。
tian~intent|东堤漫水！最外那座雨棚开始进水，车堵着撤不下来！`);
choice('levee_call',[
 ['stop_public','提醒停试令，要求立即给东堤让路。','stop_clear = true',`y|第三声！别等人都听不见才敲！
yan~intent|停试！旗手，把东出口放开。未完的场另记，不许堵在路上争！`],
 ['go_direct','先去东堤看人，不再等场上宣布。','stop_clear = false',`y|我先走，名字在册上，回来再说。
su~intent|我记着。你去的是急难，不是逃场。陆汀舟，跟我开侧门。`],
]);

chapter('07-levee');
part('levee_call','levee','yan,tian,he',`n|东堤的水不高，却已把车轮底下的土掏空。棚里还有老人，出口卡着运米的车。
tian|一个个过！别推！推倒的人，前面就走不了了！
he~sharp|别把车硬拉，轴会折！卸这一排米，先把车身抬正！
yan~uneasy|我昨晚该拆这座棚。
y|现在后悔用得上手吗？
yan|用不上。你说现在先做什么，我来喊。
n|这位一直坐上席的主事，卷起下摆，踩进与你同样深的泥里。`);
iff('warning',`yan|你们昨夜报过回水。我把棚往内挪了两丈，还少做了一步。
y|那两丈让人还来得及走。先把剩下的一步做完。`,`he|幸亏昨晚多留了两根长绳。谁绑的先别领功，先把那头拉过来。
y|我来。现在不是说谁早知道的时候。`);
choice('levee_grain',[
 ['evacuate_elders','先把老人分成短队，逐段送出。','evac = true',`y|不许一口气全挤。田雁报人，明栓扶脚，我站中间接。
tian~calm|好。册上的人一个个划，没过去的绝不先打勾。`],
 ['evacuate_cart','先卸车开路，让会走的人自己走。','evac = false; labor = true',`y|米先放高处，人从车边过。别把所有人都当不能走。
he|我数一二三，你们抬。车只要正半尺，不用抬上天！`],
]);
part('levee_grain','levee','rong,deng,aunt',`rong|剩下的米，进外棚垫脚。今天别再问能不能脏。
deng~uneasy|这就不够给雇工过冬了。
rong|仓里还有，先记我该赔他们的数。不能用他们的钱替我做好人。
aunt|这句像个人话。我把摊棚拆了，木板也能走。
y|你拿米垫脚，自己家的名声也要受损。
rong~sharp|我宁愿明天被骂糟蹋米，也不想今晚站在干处数还有几个人。
n|邓苹没有再争，自己先扛起一袋。`);
choice('levee_wrist',[
 ['grain_allow','帮他们把米铺在确实能承重的地方。','grain_rescue = true',`y|何铆先看底，不往空泥里倒。你捐出去的不是一句话，是每人脚底这一寸。
rong~intent|好。邓苹，听木匠的，不听我着急的。`],
 ['grain_save','用拆棚板替代一部分米，保住雇工口粮。','grain_rescue = false',`y|木板架这里能接上，米只用最湿的两袋。别救完人，又让你的人断炊。
deng~calm|我来拆。少东，你先去领人，账我会记清楚。`],
]);
part('levee_wrist','levee','qiao,xu,ling',`n|乔砚生想抬担架，右手忽然松了。许竞川一步顶住，担架没有落地。
xu~sharp|你说疼就停，讲过的！
qiao~uneasy|我以为这一回还能——
ling|每个以为都在用同一只手。换到后边，报路，不要再抬。
y|看着我。你能不能握住？
qiao|现在不能。可我不想去一边等，像个被保护得没事的人。
xu|那就别等。你记人，我搬人，谁说只有抬得动才算来过？`);
choice('levee_exit',[
 ['qiao_dispatch','让他负责报人和接应，不再冒险握剑。','qiao_saved = true',`y|你认得回馆的每条巷。把他们送到不会再进水的地方，我信你这件事。
qiao~calm|好。许竞川，别把担架往窄巷里扛，先听我喊。`],
 ['qiao_choose','让他决定保哪段力气，给出明确停手信号。','qiao_saved = qiao_rest',`y|你选。但我喊你名字，就必须放手。你要还我这一个答应。
qiao~uneasy|答应。不是想让我走，是想让我还能留下，对吧？
y|是。`],
]);
part('levee_exit','levee','su,lu,pei',`n|回水撞上堤脚，一段木栅倾倒。陆汀舟拔剑只切缠绳，苏晚澄却先把册子塞进裴雁秋怀里。
su|别误会，不是比人要紧。我腾手。
lu~amused|我没说。你今天倒比我先乱猜。
pei|三条撤路，南巷到高地，东桥到船坞，原路回会坪。桥边已有人在清板。
y|我们缺哪头？
su|缺一个肯留下报清人数的人，也缺一个能去渡口帮照鲤的人。
lu~intent|不是谁更像英雄。两头都不能空。`);
choice('levee_split',[
 ['leave_signal','留下把撤离数核清，再赶去渡口。','signal = true',`y|我记完这一队再走。没见到的人，不能在册上当他已经到了。
su~calm|我和你核。你不是一个人耽误，你在让那头知道还有几个人。`],
 ['leave_boat','立刻去渡口，让苏晚澄负责记录。','signal = false',`y|记录交你。我不再回头猜这边，去把船那头接住。
su~intent|好。到岸举两次灯，我看见就送下一队。`],
]);
part('levee_split','levee','zhaoli,du,he',`zhaoli|最后一条船还没进。刘篙在掌桨，后面有个从棚里出来的老人。
du|旧堤后头开了个回水口。篙能顶一时，顶不住一夜。
he|这根主绳能承船，但岸桩撑不住。得换到仓前的石墩。
y|多远？
zhaoli~intent|过没膝的水，再跨一段断板。可以两人协作，也可以等主事调大船来。
du|大船来得慢，却稳。你们要抢这一刻，就得说清楚拿什么抢。`);
choice('storm_choice',[
 ['final_prepare','先将绳锚换到石墩，再决定接船方式。','anchor = true',`y|不把第一步赌了。你看船，我去石墩，何铆查绳。
he~intent|我跟着。你有伤就说，别等我从水里把你捞出来才知道。`],
 ['final_hurry','先让照鲤接近船，自己守住现有岸桩。','anchor = false',`y|岸桩若动我就喊停。我们先让船上知道有人在这儿。
du~intent|桩动一寸就喊。别自作主张替它多撑半寸。`],
]);

chapter('08-storm');
part('storm_choice','storm','zhaoli,du,he',`n|雨把两盏灯连成模糊的一线。船尾在回水里摆动，刘篙举起空盆，又缓慢放下。
zhaoli~intent|我们要保的是船上的人，不一定保得住船。
du|记得：船离桩，人先离绳。没谁能拿身子替一整条船压水。
y|我知道。今天不是碰一寸衣袖。
he|也不是谁在看。你要用的东西，在手上，你要叫的人，在旁边。
n|照鲤把红绳系在腰侧，留出能一手解开的活口。她看你，等你真正开口。
zhaoli|你定哪一段，我就接哪一段。不许临时把我也替了。`);cg('storm');
choice('storm_act',[
 ['end_rescue','与照鲤协作接船，把最后一队人带到岸上。','final = 1',`y|你接人，我守绳。要松的时候，我一定松，不跟船赌力气。
zhaoli~calm|好。我听你喊，也请你听我。`],
 ['end_lead','回高处组织大船，宁可慢也不再添险。','final = 2',`y|我们的小船不够稳。我回高处举灯，叫大船沿石墩进。
du~calm|我顶住这一段。跑的时候别想着快，把该说的信号先说全。`],
 ['end_honor','留给熟手救援，回坪争取重开正式试艺。','final = 3',`y|我不装能掌船。这里交给你们，另一头答应过的公平，我去要。
zhaoli~uneasy|去吧。记得你说的是交给我们，别回头再说自己一个人救了这条河。`],
 ['end_home','陪腕伤的砚生护送最后一队回馆。','final = 4',`y|我先带砚生把人送进屋。船上交给真正懂的人。
du|去。屋里有人等，也得有人让等的人看见灯。`],
]);
part('storm_act','storm','zhaoli,du,he',`n|选择落下之后，没人再问哪条路最好。每个人都去做自己接住的那一段。
he|先看脚下。断板第二块不能踩！
zhaoli~intent|刘篙，把老人移到舱中！不要站船头替我们照灯！
y|听得见！你也听我——
n|一道浪从旧桩后绕回来，岸绳绷紧。你这一路学到的，并不会替你多长一双手。`);
current.push('{\n- final == 1:');
iff('anchor and (rope or water_read or terrain) and wound < 3',`n|石墩把绳的力接住，你按口令松出半臂。照鲤借船身的转向靠拢，刘篙把老人送进她臂间。
zhaoli~intent|松！现在！
n|你松了。那条被旧桩卡住的空船在浪里翻转，人却已经越过了最险的地方。`,`n|岸绳突然震动，你试图多撑一瞬，伤处先替你松了力。何铆把你往后扯，自己也跪进水里。
du~sharp|小船退！刘篙，留在舱中！等大船，不许跳！
n|照鲤退回岸侧。没有人抛下他们，可刚才还能赶上的窗口已经合拢。`);
current.push('- final == 2:');
say(`n|你跑上仓前高处，先举两次灯，再指石墩外的来路。主事的大船终于看见你。
yan~intent|沿右侧进，听篙声！别把岸边人当成挡路的！
n|救援比你想得慢，也比小船稳。你站在雨里数灯，第一次盼着自己什么都不必出剑。`);
current.push('- final == 3:');say(`n|你回到空了一半的会坪。锣被雨打得沉闷，高秉还守着没写完的名册。
gao|还有人在渡口。现在要求开试，你得让回来的人也有机会。
y|我来求的正是这个。不是趁他们缺席先拿走一场。`);
current.push('- else:');say(`n|你接过乔砚生左肩的重量。最后一队人经过汤二娘摊前时，她把整扇门板搭进泥里。
qiao~uneasy|我没拿到差事。还把手弄成这样。
y|先把他们送进屋。回去以后，你可以坐着骂我多管闲事。`);current.push('}');
go('storm_return');
part('storm_return','storm','su,lu,ling',`n|临时药棚里，凌苇把每一块湿布换成干的。苏晚澄的册子放在梁上，陆汀舟没有碰。
ling|先喘气，再说自己还能干什么。喘不上气的人，我一律不听大话。
su|各处人数正在核，不说一个都不少，直到最后一个真的进门。
lu~calm|你可以坐一会儿。人不是一直站着，才算没退。
y|等人回来，比在场上等下一招还难。
ling|因为这回你没有一柄剑能插进每一处。学会把手从不该抢的地方拿开，也难。
n|门外传来三次篙声。有人提灯，沿着泥路走近。`);
choice('storm_resolution',[
 ['account_all','先问是否有人未到，不急着说赢了。','account = true',`y|慢慢数。还缺谁，我们就先说那个人的名字。
su~calm|我和你数。不拿一句大功告成，盖住还没坐到这里的人。`],
 ['help_wounded','先接回受伤的人，把清点交给主事。','account = false',`y|凌苇要干布，给我一叠。姓名你们数，我先把人接进来。
ling~intent|好。先扶肩，不要拉伤处。没查明的伤，不用一句没事替他定了。`],
]);
part('storm_resolution','dawn','zhaoli,qiao,yan',`n|雨停在将亮未亮的时候。会坪还在，东棚只剩木架，米袋上全是鞋印。
yan|急难记急难，试艺记试艺。不能因为救人，就把谁原本没赢的那场改成赢。
qiao|也不能因为迟到，就把送到药的人写成没来。
yan~calm|是。以后这两册分开，谁都能来看。
zhaoli|那船上的人呢？
yan|每个人都来自己报一声。该赔的、该修的，今日起一桩桩认。
n|你看见严平章先在损失那一栏，写下了自己的名字。`);
current.push('{\n- final == 1 and anchor and (rope or water_read or terrain) and wound < 3:');say(`zhaoli~calm|船没了，刘篙和老人都到了。这一次不是我们把水赢了，是最后那一下终于肯松手。
y|我手里那段，也没只靠我。
n|照鲤解下红绳，放进你掌心。这回没有急着说下次。`);current.push('  ~ rescued = true');
current.push('- final == 1 and wound >= 3:');say(`ling~intent|你肋伤不能再扛重。人靠大船接回来了，你这口气还得慢慢养。
qiao~uneasy|这次我扶你。你不许说自己不重，我也不会信。`);current.push('  ~ rescued = false');
current.push('- final == 1:');say(`du|刘篙最后才离船，老人被先送出来。他替船挡的一下，左腿没保住原来的利落。
zhaoli~uneasy|我答应要把人带回来。人回来了，可我不能说一切都跟以前一样。
y|那我们也不那么说。往后的事，不能因为故事到这里就算了。`);current.push('  ~ rescued = false');
current.push('- else:');say(`du~calm|大船接到了。最后一程很慢，没人少，船损还要慢慢赔。
zhaoli|我们也有不能一口气解决的事。这回至少都能坐下说。`);current.push('  ~ rescued = true');current.push('}');
choice('after_choice',[
 ['aftermath_stay','留下修渡、还债，把未完的事做完。','future = 1',`y|屋顶、破网、坏船，先做看得见的一件。欠的名字，一个个去找。
he~calm|那就从拆这架棚开始。回来了，还得干活。`],
 ['aftermath_road','准备远行，先把承诺交代清楚。','future = 2',`y|我想继续走。但不拿一句江湖再见，替自己还没还的账。
su~calm|去每个人面前说。留下地址，比留一句漂亮话难，也有用。`],
 ['aftermath_teach','回馆休养，把学来的教给后来者。','future = 3',`y|包小满还等着学站稳。我先教他别怎么摔，再和师父一起补瓦。
qiao~amused|别一进门就说你什么都懂了。那半间房，还装不下你这么多道理。`],
]);

chapter('09-after');
part('after_choice','dawn','aunt,po,he',`n|天亮后，汤二娘重新支起小灶。她没有挂义举的牌子，只把赊账簿晾在竹竿上。
aunt|谁欠了我的，别以为落过水就冲掉了。
y|活着回来就得还，是吧？
aunt~amused|懂事。死人我不追，活人别想跑。
n|笑声比昨天轻一些，却终于有人接得住。你依次去见答应过的人，不把他们留给一页总账。
he|先说能做到哪天。不能说一定就别说，一句实话也能等。
y|好。不是拿过锣声就算完。`);
iff('net_cut',`po|网缺的那一角，我先补了。你若肯来，就替我重新系一遍绳。
y|我来。这次我先问你怎样绑，不替你把东西割了。
po~calm|那就够了。鱼少两日，人还能吃别的。`);
iff('cloth',`liu|布捞回来一半。我娘说还能裁短衫，让我带一件来给你。
y|我答应捞一箱，只捞回半箱。
liu~calm|我知道。不是让你拿这件衣服当账清，是她也想做一件能做的事。`);
iff('debt',`aunt|你的名字在第三页。字没被雨冲掉，人也没跑，我就还肯赊下一碗。
y|这碗先付。之前那碗，我一笔一笔还。`);
go('after_friends');
part('after_friends','dawn','su,lu,xu',`su|我得继续办外务。回去的记录，既写你们，也写我当时没听进去的地方。
lu~calm|我的回函也得送完。这回不放饼下，不让人追着我跑。
xu|我没那么多文书，只留一句：明年有空，再试。
y|还是那两面小旗？
xu~amused|先一人一场，再一起守旗。省得你说不知我自己几斤几两。
n|陆汀舟拆开最后一块饼，四个人分，每人只得一小角。
su~amused|你这次算得很清楚。
lu|饿了几回以后，总得学会。`);
iff('su_trust',`su|你提醒我别把别人的事垫着，也肯把自己错的一手记进去。我会把原稿给你留一份。
y|我只改错字，不改那天发生的事。
su~calm|这就够了。`);
iff('respect or rival_trust',`xu~calm|下回腕子不好，先讲。我也讲。不是让，是咱们知道在跟什么打。
y|好。你师弟那只护腕，别再说不要了。
xu~uneasy|你怎么也记这件事？`);
go('after_master');
part('after_master','hall','han,qiao,bao',`n|石梁馆门前的雨盆已经空了。韩鹭石看见你们，先问吃没吃，再问手还疼不疼。
han|倒没急着告诉我赢了谁。看来这趟没白走。
qiao~amused|你想听，我们也能编得很响。
han|那把瓦先搬上来，屋顶高，编给天听。
bao~intent|师父，我今天站了半个时辰，车倒了我没跟着倒！
han~amused|好，下回先别让车倒。
y|这句倒是我们一整路都没学完。
n|乔砚生坐在门边，用左手给新弟子削剑柄，削得慢，自己也不再着急。`);
iff('home_promise',`han|你说过回来，梯子给你留着。拿没拿差事，我都没让别人搬走。
y|我看见了。先补东边那片，还是先垫脚？
han~calm|先垫脚。急着兑现承诺，也别把自己摔下来。`,`han|你说过还想走，屋里给你留的床也没拆。路远不远，你到了再写。
y|钱会先捎回来，人不保证什么时候。
han~calm|说清楚就好。能回来吃饭的时候，别站在门外等我请。`);
go('after_route');
part('after_route','dawn','zhaoli,qiao,yan',`n|三日后，青蒲坪补试。没人把撤下的旧棚重新撑到水边，圈线也往里退了。
yan|护渡差事拆成两班，试艺另领工钱。不是多造一个头名，是原来只给一人，根本做不完。
qiao|那教小孩的人，也能写自己的名字？
yan|能。也得真正教，不是借个名拿钱。
zhaoli~amused|听见了？从今往后，哪班没干好，知道找谁。
y|挺好。名号短一点，喊起来省事。
n|锣又响了。这次没人急着把所有结果塞进同一个赢字里。`);
current.push('{\n- final == 1 and not rescued and wound >= 3:');go('ending_scar');
current.push('- final == 1 and not rescued:');go('ending_lost');
current.push('- final == 3 and duel == 2:');go('ending_name');
current.push('- future == 3:');go('ending_teacher');
current.push('- future == 2 and team and qiao_saved:');go('ending_together5');
current.push('- future == 2:');go('ending_apart');
current.push('- route == 2 and zhaoli_trust and rescued:');go('ending_captain');
current.push('- else:');go('ending_harbor');current.push('}');

function ending(id,people,lines,closing){part('ending_'+id,'dawn',people,lines);cg(id==='lost'||id==='scar'?'quiet':'dawn');say('n|'+closing);current[current.length-1]+=` # ending:${id}`;go('END')}
ending('harbor','zhaoli,he,aunt',`n|你留在青蒲渡。护渡的差事没有让谁一夜成名，却让修桥、开仓、教人的工钱都有了着落。
he|新板别急着上漆，里头还潮。今天要是不装样子，明年就不用重修。
aunt~amused|我这儿也是。账慢慢还，别拿一阵子风光抵一年的饭。
y|我先把这根钉敲直。
zhaoli~calm|下午有一条船，过来搭手？不是有危险，就是缺人。
y|来。普通的那一条，也有人要回家。`, '潮又涨起来。你们没有把江湖变小，只让它在这一处，多留了一段能安稳走过的岸。');
ending('name','rong,xu,su',`n|补试那日，容既白主动来约同一块坪。棍尾换了走法，你也没把上次那一剑当成万能的解。
rong~intent|再来。今天你不用让，也别以为昨天的我还站在原地。
n|你们交手到最后一轮，各退半步。你凭新的一手先碰到肩衣，这一次，没有同时中身。
su|记下了。只记这场，不替你写进任何大榜。
y|这场就够了。
xu~amused|够今天的。明年的你还得自己来。
n|后来米行的人照样催工钱，馆里的瓦照样要修。可你知道自己赢过一场，也知道对手没有替你输。`, '没有人叫你宗师。有人叫你的名字，问下一回什么时候来。你认真给了一个能赴的日期。');
ending('together5','qiao,pei,zhaoli',`n|你和乔砚生随镖队再上路。他的腕子还没能任意使剑，裴雁秋给他换了押尾报路的差事。
qiao~amused|以前总觉得得拿剑站最前。现在最后一个走，也能把人叫齐。
y|我若走快了，你就喊。不许只在心里骂我。
qiao|那我能一边喊一边骂吗？
pei~amused|看前头的坡。有力气斗嘴，留一点抬车。
zhaoli|渡口这头我守着。你们回来，别再拿米袋当刺客。
n|你们各自背一半行李，谁也没有替另一人写完前程。`, '路还会分岔，伤也不会因为同行就消失。这回你们学会的，是分开之前先开口，重逢时仍肯听。');
ending('teacher','han,qiao,bao',`n|你回石梁馆，先养手，再教刚入门的孩子。包小满第一日就问，学多久能打赢许竞川。
y|我不知道。今天先学车歪了，怎样不跟着倒。
bao~uneasy|那不是回到搬米吗？
qiao~amused|我出门一圈，也才知道原来搬米有这么多事。
han|教人之前，把你那一回做错的也讲给他听。
n|你照做了，没有把伤说成英雄的勋章。孩子听完，还敢问你第二遍。
y|再来。今天没有谁必须先证明自己特别。`, '新瓦盖住了最漏的地方。雨盆没有扔，放在门边养了一株小草。你仍在学，也开始让别人敢于学。');
ending('captain','zhaoli,du,cheng',`n|你留在青蒲渡，与江照鲤分领两段水路。旧船没有凭空回来，赔船的账压在第一年的工钱里。
zhaoli~amused|当领船的人，先学会每月少买两条新腰带。
du|你哪月买过？别拿笑话把该算的藏了。
y|他这句我同意。今天还差谁的船钱，先报清。
cheng~intent|我报。还有，明天那段我想自己掌桨，你们在岸上看一次。
zhaoli~calm|好。我先看你准备，不替你把每个险处都走掉。
n|红绳挂在新船头，末端还是能一手解开的活结。`, '后来有人问，那年是谁救了渡口。照鲤把船册翻开，指给他看许多个名字。你的名字在其中，有自己的那一段。');
ending('apart','su,lu,qiao',`n|你离开青蒲，没有把一路相识都装进同行的承诺。乔砚生留馆养腕，照鲤守船，你向下一处城走。
qiao~calm|你想走，就走。别替我留，也别把我没走说成不敢。
y|知道。写信给你，说我亲眼见的，不抄别人吹的。
su|欠的事我替你留着记，不替你去还。下回路过，自己一一敲门。
lu~amused|要是记不得名字，就说明你走太急。先回来吃顿饭。
n|你没有拿到所有人的认可。有人送到路口，有人只在窗边点头，都是真实给出的分量。`, '远行的代价，是不能同时在每一盏灯下坐着。你把能到的地址写好，才把第一步踏到无人替你保证的路上。');
ending('scar','ling,qiao,he',`n|你休养了整个秋天。肋伤让你不能像从前一样猛转，第一次试着抬木料时，疼得蹲了下去。
ling~sharp|不是说了三个月？你想把三个月养成三年？
qiao~uneasy|这回轮到我说你嘴硬了。木料放下，不会自己跑。
y|我以为只试一下。
he|我年轻时也这么想。你的手不是坏了就换一根的木头。
n|人最终由大船接回，代价没有被一句好结局抵掉。你改了练法，也学着接受同伴替你搬那根梁。
y|明天还来。但不抬这一头，先量尺寸。`, '你没能按原定的日子上路。窗外有人来，有人走；你仍能把能做的一件事做完，慢慢重新约下一次。');
ending('lost','zhaoli,liu,han',`n|刘篙保住了命，左腿却再不能长久站在晃船上。之后的每次点名，他都在岸上答应。
liu~uneasy|别每次看我都先问疼不疼。我还认船号，能管发船。
y|好。哪条先走，你报，我听。
zhaoli|我把领船的钱分出一份赔他，不算替你洗清，也不算替我。
n|你回到旧桩湾看过许多次。那一刻没学会的松手，不能靠后来再说一百遍补回去。
han~calm|记住不等于永远跪在那里。你以后握的是别人要用的绳，不是自己的惩罚。
n|你开始每次先试结，每次把没回来做原来那份活的人，也写进报平安的信里。`, '江湖里少了一位掌桨的人，多了一位在岸上报船的人。你们继续过日子，连同那场没有被好话遮住的失去。');

addInterludes({chapters,chapter,part,choice,say,go});
mkdirSync('story/campaign',{recursive:true});
for(const [name,lines] of chapters)writeFileSync(`story/campaign/${name}.ink`,lines.join('\n')+'\n');
const vars={rope:false,mercy:false,purse:true,bao_help:false,debt:false,bread:false,repair:false,labor:false,read:false,respect:false,wound:0,qiao_rest:false,home_promise:false,su_trust:false,rule_known:false,fair:false,rong_fair:false,warning:false,route:0,supplies:false,bridge_help:false,terrain:false,rival_trust:false,medicine:false,bridge_safe:false,guard:false,escort:false,credit:false,water_read:false,net_cut:false,wait_tide:false,night_safe:false,cloth:false,zhaoli_trust:false,honest:false,ally:false,team:false,grain_help:false,duel_read:false,duel:0,rematch:false,pair_win:false,stop_clear:false,evac:false,grain_rescue:false,qiao_saved:false,signal:false,anchor:false,final:0,account:false,rescued:false,future:0};
writeFileSync('story/campaign.ink','// 潮生有约 · 原创地方江湖篇，不改写原作名家历史\n'+Object.entries(vars).map(([k,v])=>`VAR ${k} = ${v}`).join('\n')+'\n-> cargo\n'+[...chapters.values()].map(x=>x.join('\n')).join('\n')+'\n');
console.log(`Authored ${chapters.size} chapter files; ${[...chapters.values()].flat().filter(l=>l.includes('# beat:')).length} unique source beats.`);

