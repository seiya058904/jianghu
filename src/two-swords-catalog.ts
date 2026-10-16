import type {Person} from './campaign-catalog.ts';
// Shared-template staging is a production draft; age and fire-state art remain
// subject to visual acceptance. No dedicated face is borrowed from another hero.
const p=(name:string,role:string,detail:string,file:string,archetype:string):Person=>({name,role,detail,portrait:{file,kind:'template',archetype,variant:file,position:'center top',size:'contain'}});
export const twoSwordsCharacters:Record<string,Person>={
 ss_pupil:p('山中学徒','沈照岳的年轻弟子','原典留白人物。山路险滑后仍会追问旧步为何要练，不是后来的掌门林负山。','v6/npc-young-laborer.webp','porter'),
 ss_xiezhibai:p('谢知白','金陵七十余岁长辈','与沈的师父同辈，看新式三个月。忧虑弟子代代改完以后还会留下什么，不否认新剑确有用处。','v6/npc-robed-elder.webp','robedElder'),
 ss_recorder:p('录剑门人','金陵议剑者','亲记演剑，也追问只学新剑的弟子该怎样理解来路。','v5/npc-clerk-male.webp','clerk'),
 ss_olderpupil:p('山中老弟子','当年险滑学徒的晚年','带自己的学生来请教，同沈继续讨论旧步与下一剑。','v5/npc-elder-male.webp','elder'),
 ss_foundelder:p('剑庐老人','立派时的门人','关心新旧辈序怎样传到山外，不代替林负山作决定。','v6/npc-martial-elder.webp','martialElder'),
 ss_xietingsong:p('谢庭松','金陵第五代掌门','带三人访南岳，第三日与林负山问剑三百余合。承认南岳是另一门。','v6/npc-robed-elder-b.webp','robedElder'),
 ss_tang:p('阿棠','金陵录剑门人 · 原典留白人物','同伴而非附从者，想走山路，也须交清自己的课。救卷后的受伤和分工由此前具体行动决定。','v6/npc-mature-woman-b.webp','matureWoman'),
 ss_librarian:p('守楼先生','金陵录剑门人','守课、核录，也承认亲批原笔失去以后不能重造。','v6/npc-robed-elder.webp','robedElder'),
 ss_nyelder:p('送书长老','南岳归还旧录者','随七车七箱而来。南岳已另抄一套，归还不等于重作金陵支派。','v6/npc-martial-elder-b.webp','martialElder'),
 ss_nyteacher:p('山下授课长者','南岳讲剑人','先让学生学会旧步，再问怎样改；会真等来客走完山路。','v6/npc-seasoned-traveler.webp','martialAdult'),
 ss_lateteacher:p('后来的讲剑老人','三十年后的南岳课堂','读前代讲剑录给新学生听，把两派的书信带回真实课堂。','v5/npc-elder-male.webp','elder'),
 ss_nextrecorder:p('新一代录剑人','三十年后接课的门人','愿意核查难听原话由谁说出，也提醒分册可能让借阅者错过分歧。','v5/npc-clerk-male.webp','clerk'),
 ss_jlold:p('金陵老人','归鸿问剑者','重视原式结构，也承认结构不能让对手按预定路径走。','v6/npc-robed-elder.webp','robedElder'),
 ss_nyold:p('南岳老人','归鸿问剑者','剑式数变，仍须照顾下一口气。与金陵老人争一整日旧谱。','v6/npc-martial-elder-b.webp','martialElder'),
 ss_newpupil:p('年轻门人','七十岁录剑人的学生','肯指出老师读错的旧页，也必须自己持剑验证。','v5/npc-youth-blue.webp','youth'),
};
for(const person of Object.values(twoSwordsCharacters))if(person.portrait.file.startsWith('v6/'))person.portrait.size='auto 150%';
const xieMoods={intent:'v6/ss-xie-intent.webp',sharp:'v6/ss-xie-intent.webp',uneasy:'v6/ss-xie-uneasy.webp'};
twoSwordsCharacters.ss_xiezhibai.portrait={file:'v6/ss-xie.webp',kind:'dedicated',position:'center top',size:'auto 150%',moods:xieMoods};
const s=(name:string,time:string,art:string)=>({name,time,art});
export const twoSwordsScenes={
 ss_ridge:s('南岳 · 雨后山路','沈照岳四十三岁','v5/ridge.webp'),ss_mountain:s('山中平坪','南来之初','v6/longmen-backyard.webp'),
 ss_hall:s('金陵 · 议剑堂','六年南行以后','v6/longmen-hall.webp'),ss_ancestral:s('金陵 · 祖堂外','自请辞门','v5/hall.webp'),
 ss_cottage:s('南岳 · 旧观剑庐','尚未正式立派','v6/longmen-backyard.webp'),ss_lateshen:s('剑庐 · 檐下','沈照岳晚年','v6/qingxi-veranda.webp'),
 ss_founding:s('南岳 · 新立祖堂','林负山六十余岁','v5/hall.webp'),ss_tea:s('南岳 · 迎客处','约二百八十年前','v6/qingxi-veranda.webp'),ss_duel:s('南岳 · 剑坪','谢庭松来访第三日','v5/arena.webp'),
 ss_librain:s('金陵 · 藏录楼外','约一百六十年前 · 新视角','v6/qingxi-veranda.webp'),ss_library:s('金陵 · 核录处','原卷与抄本','v6/longmen-hall.webp'),ss_corridor:s('金陵 · 长廊','当日课后','v6/qingxi-veranda.webp'),
 ss_fire:s('金陵 · 楼口','夜间救人救卷','v5/hall.webp'),ss_afterfire:s('金陵 · 楼外','整夜救火以后','v6/longmen-backyard.webp'),ss_cart:s('金陵 · 门前','三个月后 · 七车七箱','v6/longmen-backyard.webp'),
 ss_newwork:s('回赠书卷 · 核毕','各接一路','v6/longmen-hall.webp'),ss_mountainwork:s('南岳 · 山下课堂','随回赠书车入山','v5/ridge.webp'),ss_librarywork:s('金陵 · 新人课堂','留楼核录','v6/longmen-backyard.webp'),
 ss_thirtyyears:s('两地 · 新一代议录','三十年后 · 约一百三十年前','v6/longmen-hall.webp'),ss_twoschools:s('南岳 · 讲剑课','改式与基础','v6/qingxi-veranda.webp'),ss_guiboard:s('江南 · 两式归鸿','再二十年 · 约一百一十年前','v5/arena.webp'),ss_afterward:s('两地 · 后日','各自接下的课','v5/dawn.webp'),
};
export const twoSwordsEndings={ss_mountain_lesson:'山下还有一课',ss_library_lesson:'两本一同借'};
export const twoSwordsChapters=[['ss_ridge','一 · 山路不是平地'],['ss_hall','二 · 十五变'],['ss_cottage','三 · 剑庐'],['ss_founding','四 · 另一门'],['ss_librain','五 · 新一代守楼人'],['ss_fire','六 · 不能重造的原笔'],['ss_cart','七 · 旧本归还'],['ss_thirtyyears','八 · 不是祖师'],['ss_guiboard','九 · 两式归鸿']];
export const twoSwordsV1Work={slug:'two-swords-v1',file:'two-swords-v1.html',title:'一剑两脉 · 旧本归还旧稿',version:'two-swords-1.0.0',prefix:'jianghu:chronicle:two-swords:v1:',start:'抓住山路上的那只手',hook:'改过的一剑，<br>还记不记得从哪里来？',intro:'辞门、立派、归卷。<br>三代视角，接各自能做的下一件事。',viewpoint:'沈照岳、林负山与后世录剑门人',note:'制作中 · 第一册正典草稿',coverArt:'v5/ridge.webp',chapters:twoSwordsChapters};

export const twoSwordsWork={...twoSwordsV1Work,slug:'two-swords',file:'two-swords.html',title:'一剑两脉 · 旧本归还',version:'two-swords-2.0.0',prefix:'jianghu:chronicle:two-swords:v2:',note:'三代归卷 · 课堂、回信与各自的差事'};
