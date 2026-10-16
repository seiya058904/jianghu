import type {Person} from './campaign-catalog.ts';
const p=(name:string,role:string,detail:string,file:string):Person=>({name,role,detail,portrait:{file:`v6/${file}.webp`,kind:'template',archetype:'v6-borrowed',variant:file,position:'center top',size:'auto 150%'}});
export const xuanmenCharacters:Record<string,Person>={
 xm_lu:p('陆松年','清虚道人 · 张守一之师','太和正脉，太和之变未返真，借石阶湿地旧伤与同伴位置才同止，不改成正面实力更强。百余岁终，临终嘱补席别只选最强。','npc-robed-elder'),
 xm_grey:p('灰衣老人','襄阳街头 · 原典未名','退榜二十余年的旧总谱最前列人物，百余招断俞剑、十四招败张守一。不补姓名、境界、年龄。','npc-martial-elder-b'),
 xm_shi:p('石苍','镇岳神手 · 太和之变来者','退谱十余，返真门外极深；陆仍比他浅半层。近两百招双向临身同时停，退去并非被正面击溃。','npc-martial-elder'),
 xm_wugou:p('张无垢','弟子调度 · 初代第九席','三十一时未必全山前二十，负责七院散弟子的山路伤药换班。后来九十余仍受询问。壮年与晚年各用不同通用模板，尚无年龄专属定稿。','npc-martial-adult-b'),
 xm_xuandu:p('张玄度','张守一弟子 · 武当返真重开者','六十八看许无尘说会进去；七十余后自己出现师父没有的东西。先师返真，不改张守一终生门外。早期与晚年各复用通用成人及老年模板，专属形象待完善。','npc-martial-adult'),
};
xuanmenCharacters.xm_wugou.portrait.looks={elder:{file:'v6/npc-martial-elder-b.webp'}};
xuanmenCharacters.xm_xuandu.portrait.looks={elder:{file:'v6/npc-robed-elder-b.webp'}};
const s=(name:string,time:string,art:string)=>({name,time,art});
export const xuanmenScenes={xm_night:s('客居夜院','襄阳武会后夜','v6/taihua-night.webp'),xm_street:s('襄阳街头','张守一二十三岁','v6/fair-eastgate.webp'),xm_gate:s('武当山道','太和之变 · 第三日至收尾','v5/ridge.webp'),xm_hall:s('太和宫','第四日 · 三年后立制','v6/longmen-hall.webp'),xm_steps:s('太和宫石阶','雨后 · 近两百招','v6/reusable-stone-inner-gate.webp'),xm_court:s('山中院落','师徒拆手 · 年代随文推进','v6/longmen-backyard.webp'),xm_lamp:s('山中旧室','临终与手录 · 不同时日','v6/taihua-guest.webp'),xm_archive:s('后世藏卷处','张守一身后 · 无玩家后见','v6/longmen-hall.webp')};
export const xuanmenFacts={xm_unlisted:{name:'玄门旧史 · 纸外的人',text:'二十三岁襄阳，退榜二十余灰衣老人百余断俞剑、十四败张。无名次不能判弱，未名年龄境界不补。'},xm_nine_jobs:{name:'玄门旧史 · 九件事',text:'守一统合/俞领剑/郑正门/赤脚诸峰/周经阁/宋伤药/葛外援/岳戒律/无垢调度。危局第四日分工，三年后才正式立制。'},xm_stone_stop:{name:'玄门旧史 · 湿阶同止',text:'俞29、郑19、张17败。陆石近200，陆右肩左臂伤，借地形旧伤同伴位置剑先胸半线、指亦临喉同时停；两人未返真，陆非平地更强。'},xm_seat:{name:'玄门旧史 · 第九的职责',text:'初代席序不以武力排名，无垢未必全山前20；不随世榜、不一战换席，掌门不自动第一。'},xm_first:{name:'玄门旧史 · 弟子先到',text:'张守一终身未返真；玄度68看许剑，70余后先师返真。许在那次看剑17年后入，非玄度返真17年后；两位同时在世。'},xm_empty:{name:'玄门旧史 · 空的一席',text:'守一141终，最后完整句算了你们自己看着办。空席宁可空，不乱放更强却不适任者；身后不由他再选择。'}};
export const xuanmenEndings={xm_handover_after:'旧图旁边的新路',xm_blank_after:'没有填满的一页'};
export const xuanmenWork={slug:'xuanmen',file:'xuanmen.html',title:'玄门旧史·九席与返真不绝',version:'xuanmen-1.0.0',prefix:'jianghu:chronicle:xuanmen:v1:',start:'从襄阳的泥地起身',hook:'九个人坐下来，<br>有人先问药从哪里走。',intro:'你是张守一。徒弟会先走进那道门。<br>留在门外的人，还能留下什么？',viewpoint:'张守一 · 旧录生涯',note:'太和之变、九席与师徒',coverArt:'v6/longmen-hall.webp',chapters:[['xm_street','一 · 山外第一课'],['xm_gate','二 · 第四日之前'],['xm_hall','三 · 九件事'],['xm_court','四 · 门前师徒'],['xm_archive','身后 · 山还在']]};
