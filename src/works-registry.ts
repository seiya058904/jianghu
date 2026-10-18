// V7 works collection model.
//
// One place decides what the reader sees as a *work* (作品), which editions are
// its volumes, which are companions, and which are archives. The edition facts
// (file, save prefix, ending count) stay in `chronicle-catalog.ts` — this module
// only groups them, and `tests/library.test.ts` asserts the two never drift.
import {chronicleWorks} from './chronicle-catalog.ts';

export type WorkTheme='martial'|'sects'|'lives'|'mystery'|'sea'|'history';

export const themeLabels:Record<WorkTheme,string>={
  martial:'会武与成名',
  sects:'门派旧事',
  lives:'师门与人生',
  mystery:'江湖奇闻',
  sea:'远海行记',
  history:'旧史与人物谱',
};
export const themeOrder:WorkTheme[]=['martial','lives','mystery','sects','sea','history'];

export type EditionRef={slug:string;label:string};

export type WorkEntry={
  id:string;
  title:string;
  subtitle?:string;
  /** Current playable edition. Everything else hangs off it. */
  entry:string;
  theme:WorkTheme;
  era:string;
  viewpoint:string;
  /** One-line conflict hook shown on the card, not an encyclopaedia line. */
  hook:string;
  /** Who you are / where you start / what is in front of you / how it plays. */
  summary:string;
  fight:'斗嘴为主'|'斗武为主'|'斗嘴与斗武';
  art:string;
  artAlt:string;
  /** Beat count of the current edition, verified against `story/<slug>.ink`. */
  beats:number;
  canon:string[];
  recommended:boolean;
  /** Set when the reading lock in `chronicle-access.ts` refuses entry. */
  requires?:string;
  order:number;
  volumes:EditionRef[];
  companions:EditionRef[];
  archives:EditionRef[];
};

export const workEntries:WorkEntry[]=[
  {
    id:'taihua',title:'太华试序',subtitle:'六门旧会 · 青序与正序',entry:'taihua',theme:'martial',
    era:'当代 · 六门密会闭岭十七日',viewpoint:'武当替补弟子陆青珩',
    hook:'练了二十年，<br>你还想准备几日？',
    summary:'你是三十一岁的陆青珩，临时补进武当青序。棚前六门年轻高手彼此打量，你要经历真胜与真败，最后亲眼看见比自己高一层的人是怎么出手的。斗嘴与斗武各占一半。',
    fight:'斗嘴与斗武',art:'v6/cg-taihua-six.webp',artAlt:'太华后岭六门问剑',beats:485,
    canon:['原典06 六门旧会·太华试序（含青序/正序）'],recommended:true,order:1,
    volumes:[{slug:'taihua',label:'现行篇 · 三年之约'}],
    companions:[{slug:'white-stone',label:'昆仑旧史 · 白石谷外'}],
    archives:[{slug:'taihua-v2',label:'第二版旧稿'},{slug:'taihua-v1',label:'初版旧稿'}],
  },
  {
    id:'longmen',title:'龙门问刀',subtitle:'截浪刀 · 玄门客 · 武陵剑魁 · 龙门秋会',entry:'longmen',theme:'martial',
    era:'当代 · 河中问艺到龙门秋会',viewpoint:'镇河门随行门人',
    hook:'第七刀，<br>你到底想砍什么？',
    summary:'你跟着镇河门赴秋会，先看见许重山那把永远不砍到人的木刀，再看见武陵来客用一百一十九合教他认清距离。九剑之后，你要自己选一个去处。斗武为主，门人之间的斗嘴是调味。',
    fight:'斗武为主',art:'v6/cg-longmen-nine.webp',artAlt:'秋棚试剑',beats:376,
    canon:['原典02 河中旧事·截浪刀','原典03 玄门客过河中','原典04 武陵剑魁问河中','原典05 龙门秋会','原典07 洛阳龙虎风云会（续篇）','原典08 竹院夜论（续篇）'],
    recommended:true,order:2,
    volumes:[{slug:'longmen',label:'现行篇 · 龙门问刀'}],
    companions:[{slug:'luoyang',label:'五年后 · 洛阳龙虎风云会'},{slug:'bamboo',label:'当夜 · 竹院夜论（读完本卷一种归宿后解锁）'}],
    archives:[{slug:'longmen-v2',label:'第二版旧稿'},{slug:'longmen-v1',label:'初版旧稿'}],
  },
  {
    id:'twelfth-life',title:'第十二席',subtitle:'王府旧事 · 赵承晏半生',entry:'twelfth-life',theme:'lives',
    era:'近世 · 青溪荣王府到青溪榜房',viewpoint:'荣王赵承晏本人',
    hook:'他想听的，<br>是没人替他让的一场。',
    summary:'你是荣王赵承晏，十二岁那夜听见有人放水，之后用几十年去找一个真正肯教的人，和一场真正没有人让的较艺。喜剧与心酸并行，斗嘴为主，动手只在几处关键场。',
    fight:'斗嘴为主',art:'v6/cg-twelfth-name.webp',artAlt:'青溪榜前',beats:439,
    canon:['原典18 王府旧事·第十二席'],recommended:true,order:3,
    volumes:[{slug:'twelfth-life',label:'现行篇 · 赵承晏'}],
    companions:[{slug:'twelfth',label:'陪练篇 · 王府陪练与地方馆师'}],
    archives:[{slug:'twelfth-life-v2',label:'第二版旧稿'},{slug:'twelfth-life-v1',label:'初版旧稿'}],
  },
  {
    id:'jade',title:'山河璧',subtitle:'密库双贼 · 十三文',entry:'jade-thieves',theme:'mystery',
    era:'百年旧物 · 从富商密库到第七库粮仓',viewpoint:'第一卷沈玉娘／江十七；第二卷陆文简',
    hook:'都说它无价。<br>你先看看怎么出去。',
    summary:'你是第一卷的沈玉娘，也可以改为从江十七走。两个各藏身份的盗玉者会在同一间密库里撞个正着，外面守卫正在开门；第二卷你变成一个只有十三文的穷书生，用一张婚书换来一条通往九座粮库的线索。轻快悬疑接历史荒诞。',
    fight:'斗嘴与斗武',art:'v6/cg-empty-box.webp',artAlt:'匣中空盒',beats:324,
    canon:['原典17 百年旧物·山河璧（双卷）'],recommended:false,order:4,
    volumes:[{slug:'jade-thieves',label:'第一卷 · 密库双贼'},{slug:'jade',label:'第二卷 · 十三文'}],
    companions:[],
    archives:[{slug:'jade-thieves-v1',label:'第一卷 · 初版旧稿'},{slug:'jade-v1',label:'第二卷 · 初版旧稿'}],
  },
  {
    id:'qingshi',title:'青石五友',subtitle:'守一天 · 许长安一生',entry:'qingshi',theme:'lives',
    era:'近世 · 青石镇到定塞边城',viewpoint:'十七岁至九十二岁的许长安',
    hook:'先练厉害一点。<br>明日，还在这里见。',
    summary:'你是石门村出来的许长安。五个朋友在粮仓后谈起各自想去的江湖；从十七岁的青石镇到晚年的定塞，你要学会看清自己能做什么、该为谁留下。',
    fight:'斗嘴与斗武',art:'v6/cg-qingshi-old-knife.webp',artAlt:'箱底旧刀',beats:461,
    canon:['原典15 近世旧事·许长安'],recommended:true,order:5,
    volumes:[{slug:'qingshi',label:'现行篇 · 守一天'}],
    companions:[],
    archives:[{slug:'qingshi-v2',label:'第二版旧稿'},{slug:'qingshi-v1',label:'初版旧稿'}],
  },
  {
    id:'dead-ranking',title:'死人争榜',subtitle:'江汉旧案',entry:'dead-ranking',theme:'mystery',
    era:'当代 · 江汉榜房与白水渡旧案',viewpoint:'榜房周砚，中后段另有现场视角',
    hook:'死去十八年的人，<br>要把第七拿回来。',
    summary:'你是榜房周砚。一个死了十八年的名字开始一席一席赢回来，来的却不是同一个人。三名弟子各出不同的手眼，旧案要还清白，新战绩不能算在死人头上。悬疑与较艺轮流推进。',
    fight:'斗嘴与斗武',art:'v6/cg-working-books.webp',artAlt:'案头书卷',beats:428,
    canon:['原典16 江汉旧案·死人争榜'],recommended:true,order:6,
    volumes:[{slug:'dead-ranking',label:'现行篇 · 死人争榜'}],
    companions:[],
    archives:[],
  },
  {
    id:'luhua',title:'照水刀',subtitle:'芦花渡 · 梁照水一生',entry:'luhua',theme:'martial',
    era:'当代 · 洞庭水路到南榜末席',viewpoint:'梁照水 · 十一岁至百岁后',
    hook:'十一岁来还命，<br>七十三年才到榜前。',
    summary:'你十一岁背着包袱进门，想替父亲还一条命。此后是护船、问席、江陵黑潮与南榜最后一席：会打之外，还要学会替别人收拾什么。',
    fight:'斗武为主',art:'v6/cg-dongting-shoulder.webp',artAlt:'湖舟歇息',beats:306,
    canon:['原典21 洞庭旧事·照水刀梁照水'],recommended:false,order:7,
    volumes:[{slug:'luhua',label:'完整生涯 · 芦花渡'}],
    companions:[{slug:'dongting',label:'问席一篇 · 护船帮手视角'}],
    archives:[],
  },
  {
    id:'north',title:'北枪 · 三师一枪',subtitle:'秦天岳 第一卷',entry:'north',theme:'lives',
    era:'近世 · 北地河朔到终南',viewpoint:'秦天岳 · 十三岁至八十余岁',
    hook:'十三岁肯重练，<br>六十一岁，还肯么？',
    summary:'你是秦天岳，跟过三位老师：周定川教你站，楚怀锋教你赢，司马衡教你想清楚为什么能赢。五六十岁以后，你还要回去重学第一枪。跨年龄与跨师承是本篇的主线。',
    fight:'斗武为主',art:'v6/cg-plain-tea.webp',artAlt:'一桌茶与三件旧物',beats:384,
    canon:['原典20 北地旧事·擎天神枪秦天岳'],recommended:false,order:8,
    volumes:[{slug:'north',label:'第一卷 · 三师一枪'}],
    companions:[{slug:'qian-kun',label:'第二卷 · 不会算账'},{slug:'north-notes',label:'双卷附篇 · 师门夜话'}],
    archives:[{slug:'north-v2',label:'第二版旧稿'},{slug:'north-v1',label:'初版旧稿'}],
  },
  {
    id:'qian-kun',title:'乾坤 · 不会算账',subtitle:'司马天岳 第二卷',entry:'qian-kun',theme:'lives',
    era:'近世 · 终南与太极门',viewpoint:'司马天岳 · 十四岁到晚年',
    hook:'掌门不会算账。<br>可这一掌，他看见了。',
    summary:'你是司马天岳。十四岁看出别人脚短一寸，四十三岁入化，六十八岁返真，后来坐上总谱第一，仍然要面对比自己更旧的对手和没算清的账。入化与返真在这里是认知变化，不是升级数值。',
    fight:'斗武为主',art:'v6/cg-plain-tea.webp',artAlt:'一桌茶与旧观',beats:344,
    canon:['原典19 太极旧事·乾坤武圣司马天岳'],recommended:false,order:9,
    volumes:[{slug:'qian-kun',label:'第二卷 · 不会算账'}],
    companions:[{slug:'north',label:'第一卷 · 三师一枪'},{slug:'north-notes',label:'双卷附篇 · 师门夜话'}],
    archives:[{slug:'qian-kun-v2',label:'第二版旧稿'},{slug:'qian-kun-v1',label:'初版旧稿'}],
  },
  {
    id:'two-swords',title:'一剑两脉',subtitle:'旧本归还 · 门外七问',entry:'two-swords',theme:'sects',
    era:'百余年旧事 · 金陵与南岳',viewpoint:'沈照岳、林负山与后世录剑门人',
    hook:'改过的一剑，<br>还记不记得从哪里来？',
    summary:'你先是提出南行十五变的沈照岳，后来是替门中记账、也被同门怨过的后人。南岳山路走不通，金陵旧步要改十五变；有人辞门另传，有人留门慎改。后来一场火、七箱旧书，又让两边都承认对方留下了一部分根。第二册是青石驿七卷遭劫之后的十四家对峙。',
    fight:'斗嘴与斗武',art:'v6/cg-working-books.webp',artAlt:'案头旧录',beats:350,
    canon:['原典13 金陵南岳旧史·一剑两脉','原典14 十四门会·七问之乱'],recommended:false,order:10,
    volumes:[{slug:'two-swords',label:'第一册 · 旧本归还'},{slug:'seven-questions',label:'第二册 · 门外七问'}],
    companions:[],
    archives:[{slug:'two-swords-v1',label:'第一册 · 初版旧稿'},{slug:'seven-questions-v1',label:'第二册 · 初版旧稿'}],
  },
  {
    id:'xuanmen',title:'玄门旧史',subtitle:'九席与返真不绝',entry:'xuanmen',theme:'sects',
    era:'旧史 · 太和之变前后',viewpoint:'张守一 · 旧录生涯',
    hook:'九个人坐下来，<br>有人先问药从哪里走。',
    summary:'你是张守一。太和之变里九个人要分守山门、照伤、存传承；你自己的弟子会先走进那道门，而你没有。九席不是九个武功最高的人，一次选择也不能换来返真。',
    fight:'斗嘴为主',art:'v6/cg-kuhe-old.webp',artAlt:'来路上的旧人',beats:142,
    canon:['原典11 玄门旧史·九席与返真不绝'],recommended:false,order:11,
    volumes:[{slug:'xuanmen',label:'现行篇 · 九席与返真不绝'}],
    companions:[{slug:'beyond-ranking',label:'两座山之后 · 榜纸之外'}],
    archives:[],
  },
  {
    id:'white-stone',title:'白石谷外',subtitle:'昆仑四百年择要',entry:'white-stone',theme:'sects',
    era:'旧史 · 昆仑雪灾与两度登首',viewpoint:'多代纪事 · 各有其人',
    hook:'人可以少。<br>路不能只剩一个人。',
    summary:'你在雪灾后的昆仑，先是非白石谷人，再是谷中的一代。连日大雪让传承断在门口；此后几代人分别问山、问手、问自己像不像前人。不追所有祖师排名，只把每一代人当时的决定演出来。',
    fight:'斗武为主',art:'v6/reusable-snow-courtyard.webp',artAlt:'雪后白石谷',beats:168,
    canon:['原典12 昆仑旧史·白石谷外'],recommended:false,order:12,
    volumes:[{slug:'white-stone',label:'现行篇 · 白石谷外'}],
    companions:[{slug:'xuanmen',label:'另一座山 · 玄门旧史'},{slug:'taihua',label:'六门旧会 · 太华试序'}],
    archives:[],
  },
  {
    id:'sea',title:'海路两世',subtitle:'中原以外 · 归潮岛',entry:'sea',theme:'sea',
    era:'海外 · 相隔两百年的两代人',viewpoint:'陆玄都旧事 → 罗天海一生；第二册沈见潮',
    hook:'赢完以后，<br>你还要去哪？',
    summary:'你先是出海的陆玄都，两百余年后又是从蓬莱回到中原的罗天海；第二册你在归潮岛，十二岁选拔，六十三岁才坐上第九席。两册不是同一个门派，也不是同一代人，不能当成同一批对手。',
    fight:'斗嘴与斗武',art:'v6/cg-rigging.webp',artAlt:'绳与帆',beats:287,
    canon:['原典09 海外旧事·天外遗脉','原典10 海天门旧事·归潮岛'],recommended:false,order:13,
    volumes:[{slug:'sea',label:'第一册 · 中原以外'},{slug:'sea-tide',label:'第二册 · 归潮岛'}],
    companions:[],
    archives:[{slug:'sea-v1',label:'第一册 · 初版旧稿'},{slug:'sea-tide-v1',label:'第二册 · 初版旧稿'}],
  },
  {
    id:'kuhe',title:'枯河谷',subtitle:'前代史诗 · 无生之乱',entry:'kuhe',theme:'history',
    era:'上古旧事 · 两百余年前',viewpoint:'两百余年前的救护门人',
    hook:'他只是路过。<br>门里却再没有人答话。',
    summary:'三掌门入谷以后，外面只剩下要救的人和要记的名册。你手里没有能改变胜负的武功，只有一份残缺旧录和一条门后的路。可选前代史诗，不是新手主线。',
    fight:'斗嘴为主',art:'v6/cg-kuhe-old.webp',artAlt:'来路上的三位旧人',beats:336,
    canon:['原典01 上古旧事·无生之乱'],recommended:false,order:14,
    volumes:[{slug:'kuhe',label:'现行篇 · 门后有人'}],
    companions:[],
    archives:[{slug:'kuhe-v2',label:'第二版旧稿'},{slug:'kuhe-v1',label:'初版旧稿'}],
  },
  {
    id:'beyond-ranking',title:'榜纸之外',subtitle:'宁无极旧录 · 资料篇',entry:'beyond-ranking',theme:'history',
    era:'资料 · 私评十人',viewpoint:'太玄门侍读门人',
    hook:'十个名字，<br>没有一场预先写好的胜负。',
    summary:'你是太玄门的侍读门人，替宁无极抄一份私下评出的十人旧录。他有看不见的地方，你要动手核对、访谈与传述，而不是把十个人排成十连关卡——这里没有官方新榜，也没有十场战斗。读完《玄门旧史》与《白石谷外》后解锁。',
    fight:'斗嘴为主',art:'v6/taihua-guest.webp',artAlt:'客舍旧册',beats:130,
    canon:['原典22 太玄旧录·宁无极所评天下十人'],recommended:false,requires:'读完《玄门旧史》与《白石谷外》各一种归宿后解锁',order:15,
    volumes:[{slug:'beyond-ranking',label:'现行篇 · 榜纸之外'}],
    companions:[{slug:'xuanmen',label:'第一份旧录 · 玄门旧史'},{slug:'white-stone',label:'第二份旧录 · 白石谷外'}],
    archives:[],
  },
  {
    id:'north-notes',title:'师门夜话',subtitle:'双卷附篇 · 兼容访谈',entry:'north-notes',theme:'history',
    era:'附篇 · 两册之间的夹页',viewpoint:'整理笔记的门中记录者',
    hook:'同一个老师，<br>为什么教得不同？',
    summary:'你是整理笔记的门中记录者，翻到终南的一页旧笔录：同一个老师对不同的人，教法不一样。属于《北枪》与《乾坤》两卷之间的附录，不抢主篇的位置。',
    fight:'斗嘴为主',art:'v6/qingxi-veranda.webp',artAlt:'檐下旧笔录',beats:77,
    canon:['原典19/20 关联附篇'],recommended:false,requires:'读完《三师一枪》与《不会算账》各一种归宿后解锁',order:16,
    volumes:[{slug:'north-notes',label:'附篇 · 师门夜话'}],
    companions:[{slug:'north',label:'第一卷 · 三师一枪'},{slug:'qian-kun',label:'第二卷 · 不会算账'}],
    archives:[],
  },
];

/**
 * Every edition slug the collection can reach from a work card, in one list.
 * `tests/library.test.ts` asserts it covers `chronicleWorks` exactly once, so a
 * newly registered edition can never silently disappear from the library.
 */
export const groupedEditionSlugs:string[]=[...new Set(workEntries.flatMap(work=>[
  work.entry,
  ...work.volumes.map(volume=>volume.slug),
  ...work.companions.map(companion=>companion.slug),
  ...work.archives.map(archive=>archive.slug),
]))];

/** The original local work that is no longer the default face of the product. */
export const legacyOriginal=[
  {slug:'tide-v6',file:'tide-v6.html',title:'潮生有约 · V6',label:'原创地方篇 · 现行最后一版',prefix:'jianghu:campaign:tide:v2:'},
  {slug:'tide-v5',file:'tide-v5.html',title:'潮生有约 · V5',label:'原创地方篇 · 初版',prefix:'jianghu:campaign:tide:v1:'},
  {slug:'half-step',file:'half-step.html',title:'半步之约',label:'更早的原创短篇',prefix:'jianghu:vn:v2:'},
  {slug:'ferry',file:'legacy.html',title:'渡口无碑',label:'更早的原创短篇 · 带证词与渡船',prefix:'jianghu:v1:'},
];

export function editionsOf(slug:string){return chronicleWorks.filter(work=>work.slug===slug)}
export function resolveEdition(slug:string){return chronicleWorks.find(work=>work.slug===slug)}
export function editionFile(slug:string){return resolveEdition(slug)?.file??''}
export function editionPrefix(slug:string){return resolveEdition(slug)?.prefix??''}
export function editionEndings(slug:string){
  const edition=resolveEdition(slug) as (ReturnType<typeof resolveEdition>&{endingCount?:number})|undefined;
  return edition?.endingCount??2;
}

export type WorkProgress={state:'new'|'reading'|'finished';unlocked:number;total:number};
type Readable={getItem(key:string):string|null};

/** Progress is per work, never shared across works. */
export function readProgress(work:WorkEntry,storage:Readable|null):WorkProgress{
  const total=editionEndings(work.entry);
  if(!storage)return {state:'new',unlocked:0,total};
  const prefix=editionPrefix(work.entry);
  if(!prefix)return {state:'new',unlocked:0,total};
  let unlocked=0;
  try{
    const raw=storage.getItem(prefix+'endings');
    if(raw){const ids=JSON.parse(raw);if(Array.isArray(ids))unlocked=new Set(ids.filter(id=>typeof id==='string')).size}
  }catch{unlocked=0}
  if(unlocked>=total)return {state:'finished',unlocked,total};
  let started=unlocked>0;
  try{started=Boolean(storage.getItem(prefix+'auto'))||Boolean(storage.getItem(prefix+'readBeats'))||started}catch{}
  return {state:started?'reading':'new',unlocked,total};
}

/** Estimated reading time from the measured beat count — never a human stopwatch. */
export function estimateMinutes(beats:number){
  const low=Math.max(5,Math.round(beats*4/60));
  const high=Math.round(beats*8/60);
  return `${low}–${high} 分钟（按拍数估计）`;
}

export const workOrder=(a:WorkEntry,b:WorkEntry)=>a.order-b.order;
