import {campaignScenes,campaignCharacters,type Person} from './campaign-catalog.ts';
// Freeze v5 presentation mappings as well as its compiled story. New expressions
// belong to v6 actor IDs; the original named person remains the same in fiction.
export const campaignV6Characters:Record<string,Person>=Object.fromEntries(Object.entries(campaignCharacters).map(([id,person])=>['v6_'+id,{...person,portrait:{...person.portrait,moods:{...person.portrait.moods}}}]));
campaignV6Characters.v6_zhaoli.portrait.moods={...campaignV6Characters.v6_zhaoli.portrait.moods,amused:'v6/zhaoli-amused.webp'};
campaignV6Characters.v6_qiao.portrait.moods={...campaignV6Characters.v6_qiao.portrait.moods,amused:'v6/qiao-amused-v2.webp'};
campaignV6Characters.v6_su.portrait.moods={...campaignV6Characters.v6_su.portrait.moods,intent:'v6/su-intent.webp',sharp:'v6/su-intent.webp'};
const v6Moods:Record<string,Record<string,string>>={
 han:{amused:'v6/han-amused.webp',intent:'v6/han-intent.webp',sharp:'v6/han-intent.webp'},
 ling:{intent:'v6/ling-intent.webp',sharp:'v6/ling-intent.webp',uneasy:'v6/ling-uneasy.webp'},
 pei:{amused:'v6/pei-amused-v2.webp',intent:'v6/pei-intent-v2.webp',sharp:'v6/pei-intent-v2.webp'},
 rong:{amused:'v6/rong-amused-v2.webp',uneasy:'v6/rong-uneasy-v2.webp'},
 he:{amused:'v6/he-amused.webp',intent:'v6/he-intent.webp',sharp:'v6/he-intent.webp'},
};
for(const [id,moods] of Object.entries(v6Moods))campaignV6Characters['v6_'+id].portrait.moods={...campaignV6Characters['v6_'+id].portrait.moods,...moods};
const times:Record<string,string>={quay:'序 · 米袋与木剑',hall:'第一章 · 借来的盘缠',inn:'第二章 · 一桌不够',ridge:'第四章 · 枫岭陆路',reeds:'第四章 · 白苇水路',bridge:'第五章 · 断雨桥',rainboat:'第五章 · 夜航旧桩湾',workshop:'第六章 · 一锅热汤',arena:'第八章 · 真打不让',levee:'第十章 · 锣声与雨',storm:'终章 · 绳的另一头',dawn:'后日 · 有约'};
export const campaignV6Scenes:Record<string,{name:string;time:string;art:string}>=Object.fromEntries(Object.entries(campaignScenes).map(([id,scene])=>['v6_'+id,{...scene,time:times[id]}]));
Object.assign(campaignV6Scenes,{
 v6_end_harbor:{name:'青蒲渡 · 修船开班',time:'后日 · 认下的一班',art:'v5/quay.webp'},
 v6_end_name:{name:'青蒲坪 · 补试以后',time:'后日 · 一场真胜',art:'v5/arena.webp'},
 v6_end_departure:{name:'青蒲渡 · 送行处',time:'后日 · 临行的话',art:'v5/quay.webp'},
 v6_end_together5:{name:'枫岭古道 · 同行起步',time:'后日 · 各背一半行李',art:'v5/ridge.webp'},
 v6_end_teacher:{name:'石梁馆 · 第一堂课',time:'后日 · 先学这一小步',art:'v5/hall.webp'},
 v6_end_captain:{name:'青蒲渡 · 新船的班册',time:'后日 · 岸上先看准备',art:'v5/quay.webp'},
 v6_end_apart:{name:'青蒲外道 · 各自启程',time:'后日 · 写下能到的地址',art:'v5/ridge.webp'},
 v6_end_scar:{name:'临水客舍 · 秋日复工',time:'后日 · 养伤之后再约',art:'v5/inn.webp'},
 v6_end_lost:{name:'青蒲渡 · 岸上报船',time:'后日 · 换一份能做的差事',art:'v5/quay.webp'},
 v6_depart:{name:'青蒲渡 · 留下的空位',time:'第三章 · 留位的人',art:'v5/quay.webp'},
 v6_stay:{name:'青蒲坪 · 两条界线',time:'第四章 · 留守',art:'v5/arena.webp'},
 v6_staycare:{name:'临水客舍 · 散场以后',time:'第五章 · 留守',art:'v5/inn.webp'},
 v6_contract:{name:'米行院口 · 一年的差事',time:'第七章 · 谁的差事',art:'v6/grain-yard.webp'},
 v6_wind:{name:'青蒲坪东口 · 风先到',time:'第九章 · 风先到门口',art:'v6/fair-eastgate.webp'},
 v6_afterhall:{name:'石梁馆 · 各自的明日',time:'后日 · 有约',art:'v5/hall.webp'},
});
export const campaignV6Chapters=[['v6_quay','序 · 米袋与木剑'],['v6_hall','一 · 借来的盘缠'],['v6_inn','二 · 一桌不够'],['v6_depart','三 · 留位的人'],['v6_ridge','四 · 陆路护药'],['v6_reeds','四 · 白苇水路'],['v6_stay','四 · 两条界线'],['v6_bridge','五 · 断雨桥'],['v6_rainboat','五 · 夜航旧桩湾'],['v6_staycare','五 · 散场以后'],['v6_workshop','六 · 一锅热汤'],['v6_contract','七 · 谁的差事'],['v6_arena','八 · 真打不让'],['v6_wind','九 · 风先到门口'],['v6_levee','十 · 锣声与雨'],['v6_storm','终 · 绳的另一头'],['v6_dawn','后日 · 有约']];
