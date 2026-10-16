import type {Person} from './campaign-catalog.ts';
// Stable reusable templates for this production draft; dedicated elder art is not yet accepted.
const p=(name:string,role:string,detail:string,file:string,archetype:string):Person=>({name,role,detail,portrait:{file,kind:'template',archetype,variant:file,position:'center top',size:'contain'}});
export const kuheCharacters:Record<string,Person>={
 kh_healer:p('随行药师','三门救护 · 原典留白人物','负责救护分工与伤后照护。不代替掌门作战，也不预知谁必定能醒。','v6/npc-mature-woman.webp','matureWoman'),
 kh_peer:p('同门','救护门人 · 原典留白人物','会害怕，能承担明确分工。别人说一句勇敢，不会使他不再恐惧。','v5/npc-youth-blue.webp','youth'),
 kh_hui:p('慧明','当时少林方丈','已经返真，与两位掌门合手仍制不住无生客。空劫是他的师叔。','v5/npc-monk.webp','monk'),
 kh_sima:p('司马元正','当时太极掌门','入化极深，返真门前；与慧明、孟天枢共同联帖，不与司马玄极混为一人。','v6/npc-robed-elder.webp','robedElder'),
 kh_meng:p('孟天枢','当时八卦门主','入化极深，返真门前。三家共议时先关心谷口的接应，而非门派用药的不同叫法。','v5/npc-elder-male.webp','elder'),
 kh_kong:p('空劫','少林退位旧人','上一代达摩院首座，退位四十余年。慧明称他师叔；旧僧衣洗得发白，赤足来谷。','v6/npc-aged-monk.webp','monk'),
 kh_xuan:p('司马玄极','太极镇门旧人','灰袍白发，手持普通竹杖。司马元正称他师伯。','v6/npc-robed-elder-b.webp','robedElder'),
 kh_gui:p('孟归藏','八卦镇门旧人','身材矮，微驼，入谷需年轻弟子相扶。孟天枢亲自迎过去，扶另一边。','v6/npc-martial-elder.webp','martialElder'),
 kh_wusheng:p('无生客','来历不明的黑刀客','外貌四十余岁、实际年岁与师门不明。兵器极窄，说话带一点古怪口音，不因一个地方榜位就停步。','v6/npc-seasoned-traveler.webp','martialAdult'),
};
export const kuheScenes={
 kh_shelter:{name:'凉州收容处',time:'首起商队死难半年后 · 乱事初年',art:'v5/inn.webp'},
 kh_ward:{name:'枯河谷外 · 借屋养伤',time:'大战之后 · 第七日',art:'v5/inn.webp'},
 kh_camp:{name:'枯河谷外 · 三门借院',time:'数年后 · 联帖备战及谷后救护',art:'v6/longmen-hall.webp'},
 kh_path:{name:'谷外山道 · 接应石后',time:'枯河谷之战 · 外沿',art:'v5/ridge.webp'},
 kh_valley:{name:'枯河谷 · 远处候接',time:'两百余年前 · 三门联手',art:'v6/reusable-stone-valley.webp'},
 kh_after:{name:'谷口 · 重新走过的路',time:'大战之后 · 归途',art:'v6/reusable-stone-valley.webp'},
};
export const kuheEndings={kh_care:'灯下接更',kh_record:'带着缺页'};
export const kuheFacts={kh_after:{name:'三门之后还有一代',text:'空劫与无生客死亡，孟归藏重伤七日醒来，此后不正式交手；司马玄极左臂终身不复，三十年不出山。三大掌门日后境界推进不改变当日制不住的事实。'}};
export const kuheChapters=[['kh_shelter','序 · 他只是路过'],['kh_camp','一 · 三家同帖'],['kh_path','二 · 担架的宽处'],['kh_valley','三 · 门前与门后'],['kh_after','后日 · 谁接下一更']];
export const kuheV1Work={slug:'kuhe-v1',file:'kuhe-v1.html',title:'枯河谷 · 旧稿',version:'kuhe-1.0.0',prefix:'jianghu:chronicle:kuhe:v1:',start:'把药盆放稳',hook:'他只是路过。<br>门里却再没有人答话。',intro:'掌门入谷以后，谁把伤者带回来？<br>救护门人的一份残缺旧录。',viewpoint:'两百余年前的救护门人',note:'制作中 · 正典路线草稿',coverArt:'v5/ridge.webp',chapters:kuheChapters};

export const kuheV2Work={...kuheV1Work,slug:'kuhe-v2',file:'kuhe-v2.html',title:'枯河谷 · 第二版旧稿',version:'kuhe-2.0.0',prefix:'jianghu:chronicle:kuhe:v2:',note:'冻结第二版 · 保留当时演出与原存档'};
export const kuheWork={...kuheV2Work,slug:'kuhe',file:'kuhe.html',title:'枯河谷 · 门后有人',version:'kuhe-3.0.0',prefix:'jianghu:chronicle:kuhe:v3:',note:'三位旧人 · 救护门人的残卷'};
