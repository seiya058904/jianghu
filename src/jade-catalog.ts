import type {Person} from './campaign-catalog.ts';
const p=(name:string,role:string,detail:string,file:string,archetype:string):Person=>({name,role,detail,portrait:{file,kind:'template',archetype,variant:file,position:'center top',size:file.startsWith('v6/')?'auto 150%':'auto 100%'}});
export const jadeCharacters:Record<string,Person>={
 jd_he:p('何老板','何记酱菜铺','卖菜先问二十文，压缸看重猫掀不掀盖。陆的钱与婚书，是他真能同意的一宗买卖。','v5/npc-merchant-male.webp','merchant'),
 jd_cousin:p('陆堂兄','官府旧档整理者','无大权，能看没人关心的老纸，也有家人在等。肯帮陆，不等于所有夜里都能陪。','v5/npc-clerk-male.webp','clerk'),
 jd_attendant:p('御前当值内官','上报与核件的当值者','转告查库与核粮的实问，不因等着总谱人物说高深话，就将酱味解释成古香。','v6/npc-martial-adult.webp','martialAdult'),
 jd_sima:p('司马天岳','当世总谱第一 · 太极人物','看玉先要旧档，问酱味；不把别人从旧物上想出的武学算成玉自己会教。不是司马归元或司马衡。','v6/npc-martial-elder-b.webp','martialElder'),
 jd_craftheir:p('工匠后人','旧工艺的继承者','用细刃剥错金，亲手拆前人留的工。能问陆舍不舍，不会替信息再生一层完好的原面。','v6/npc-mature-woman-b.webp','matureWoman'),
 jd_fieldclerk:p('随队县吏','勘库与护档 · 原典留白人物','在泥里真走，能提醒陆出库、接手近处档匣。自己没见的那一地，也不替别人说全。','v6/npc-martial-adult-b.webp','martialAdult'),
 jd_relief:p('灾务官','第七库粮务','看见可用粮，先问验、车、棚布和接班。不是专等书生给天下一个漂亮解释。','v6/npc-robed-elder.webp','robedElder'),
 jd_qiao:p('阿荞','带孩子领粮的人 · 原典留白人物','有未到场的父亲，也想找能回去照应家人的有酬活；不因领粥便替别人认一份从此都好的功。','v6/npc-mature-woman.webp','matureWoman'),
 jd_red:p('红叶少主','四代旧仇中的年轻人','忘不了师兄的伤，也得认清今夜车从谁门前过；不由一句问话就忘掉四代。','v5/npc-youth-blue.webp','youth'),
 jd_kite:p('铁鹞门弟子','四代旧仇中的年轻人','会追问哪一代先伤人，挪轴时仍肯搭另一头。自己的东口，要真站到有人来接。','v6/npc-young-laborer.webp','porter'),
 jd_thief:p('盗门老人','江十七旧门中人','仍懂偷有主之物的道理，守这一车则看见粮有太多主；不是被一块玉洗成无私圣人。','v6/npc-robed-elder-b.webp','robedElder'),
 jd_retired:p('退谱老人物','原典未名的守粮旧人','不肯单替朝廷看仓，得知给灾民与前线便留下；境界与旧席数未定，不擅自升作返真。','v5/npc-elder-male.webp','elder'),
 jd_blade:p('来敌刀客','原典未名的两名顶尖高手之一','试着从近线调开守粮老人，不另编官方榜名或硬定境界。','v6/npc-martial-adult.webp','martialAdult'),
 jd_sword:p('来敌剑客','原典未名的两名顶尖高手之一','压退处、试绕行，要与同伴配合，不能以一招被秒代替近百招拦截。','v6/npc-seasoned-traveler.webp','martialAdult'),
};
jadeCharacters.jd_he.portrait.looks={late:{file:'v6/npc-robed-elder-b.webp'}};
const s=(name:string,time:string,art:string)=>({name,time,art});
export const jadeScenes={
 jd_pickle:s('何记酱菜铺','旧玉压缸十三年后','v5/inn.webp'),jd_luroom:s('陆家 · 桌边','洗玉三日','v6/longmen-hall.webp'),jd_archive:s('旧档房','半年寻册','v6/longmen-hall.webp'),jd_inner:s('宫中 · 核验处','旧册与酱味','v6/longmen-hall.webp'),
 jd_council:s('御前 · 末席','能换多少粮','v6/longmen-hall.webp'),jd_cutting:s('核验处 · 细刃旁','错金剥开','v6/longmen-hall.webp'),jd_first:s('前三旧库','塌、酒窖、黑泥','v6/reusable-stone-valley.webp'),jd_road:s('勘队 · 分行处','留过的表层与欠过的旧注','v5/ridge.webp'),jd_fourth:s('第四至第五库','随队亲入','v6/longmen-hall.webp'),jd_returnarchive:s('旧档房 · 补核','回程两夜 · 另两库听报','v6/longmen-hall.webp'),jd_sixth:s('第六库 · 车具与弓材','命令仍是继续','v6/grain-yard.webp'),
 jd_seventh:s('第七库 · 两道石门','旧河改道处 · 粮','v6/reusable-stone-inner-gate.webp'),jd_roadside:s('粮路 · 粥棚外','一碗要送到谁手里','v6/grain-yard.webp'),jd_eighth:s('第八库 · 军械','边境转运线附近','v6/grain-yard.webp'),jd_ninth:s('第九库 · 旧档','用途与最初的批字','v6/longmen-hall.webp'),jd_muster:s('两库往来 · 分岗处','今夜各认一班','v6/longmen-backyard.webp'),
 jd_grainnight:s('第七库 · 粮门与车路','守粮这一路','v6/reusable-stone-inner-gate.webp'),jd_grainfight:s('第七库 · 门外','退谱老人拦两人近百招','v6/reusable-stone-inner-gate.webp'),jd_grainafter:s('第七库 · 灶棚外','车路与护病车分行','v6/grain-yard.webp'),jd_recordsnight:s('第九库 · 旧档门','护档这一路','v6/longmen-hall.webp'),jd_ninthfire:s('第九库 · 石阶','三次冲撞 · 真物碎','v6/reusable-stone-inner-gate.webp'),jd_ninthafter:s('第九库 · 外廊','图与原档已经接出','v6/qingxi-veranda.webp'),jd_return:s('两路 · 汇报处','亲见与后闻','v6/qingxi-veranda.webp'),
 jd_work:s('普通官署 · 新差','没有靠买物飞黄腾达','v6/longmen-hall.webp'),jd_pickle_late:s('何记酱菜铺','多年以后','v5/inn.webp'),jd_inner_late:s('宫中 · 残片核记','多年以后 · 再问柳观河','v6/longmen-hall.webp'),jd_after:s('后来的旧录','残片与仍在拍卖的完整假货','v5/dawn.webp'),
};
export const jadeEndings={jd_storework:'下一车给谁吃',jd_archivework:'另一张婚书'};
export const jadeChapters=[['jd_pickle','一 · 二十文没卖成'],['jd_archive','二 · 璧半册半'],['jd_council','三 · 刮'],['jd_first','四 · 前六处'],['jd_seventh','五 · 粮'],['jd_ninth','六 · 库丢才算'],['jd_muster','七 · 各认一班'],['jd_grainnight','八甲 · 第七库守粮'],['jd_recordsnight','八乙 · 第九库碎玉'],['jd_work','九 · 不是买物封官']];
export const jadeV1Work={slug:'jade-v1',file:'jade-v1.html',title:'山河璧 · 十三文旧稿',version:'jade-1.0.0',prefix:'jianghu:chronicle:jade:v1:',start:'先替何老板按住缸盖',hook:'二十文。<br>可你只有十三文。',intro:'加一封婚书，换回一块旧玉。<br>后来真正要找的，是还能给人吃的粮。',viewpoint:'陆文简 · 穷书生至普通官员',note:'制作中 · 第二卷九库全链草稿',coverArt:'v5/inn.webp',chapters:jadeChapters};

export const jadeWork={...jadeV1Work,slug:'jade',file:'jade.html',title:'山河璧 · 十三文',version:'jade-2.0.0',prefix:'jianghu:chronicle:jade:v2:',note:'九库与两夜 · 给谁吃的粮'};
