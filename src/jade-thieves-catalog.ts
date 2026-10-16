import type {Person} from './campaign-catalog.ts';
// First-meeting descriptions never reveal the other viewpoint's hidden order.
// Both identities are added only by the actually reached temple fact.
const p=(name:string,role:string,detail:string,file:string,archetype:string):Person=>({name,role,detail,portrait:{file,kind:'template',archetype,variant:file,position:'center top',size:file.startsWith('v6/')?'auto 150%':'auto 100%'}});
export const jadeThievesCharacters:Record<string,Person>={
 jt_shen:p('沈玉娘','自称药材商遗孀','三十五岁，识旧物，出入商会，声称取物为卖钱。丈夫已亡也是她的说法；其余来历须由本次行路亲自问出。','v6/npc-mature-woman.webp','matureWoman'),
 jt_jiang:p('江十七','声称来找家传旧物的同行','十七是家中排行，不是年龄。屋顶入库、身手轻快，常拿真话的一半接一句玩笑。背后是谁，不在初见时替他揭开。','v6/npc-martial-adult-b.webp','martialAdult'),
 jt_broker:p('招客人','庄园地下拍卖','给练武的人讲秘笈，给贵客讲正统。同一件东西，能向两种客人开两副价。','v5/npc-merchant-male.webp','merchant'),
 jt_craftsman:p('离内府的老匠','沈认识的旧手艺人','能做仿物，不会今夜就做完数月的活；先看见的是银补、火熏和细裂，不替玉添灵气。','v6/npc-robed-elder-b.webp','robedElder'),
 jt_apprentice:p('匠徒','准备南去学艺的人 · 原典留白人物','愿跑一回，也要知道风险。自己的下一程不是永远给两个同行者送箱；对外接头与否影响后来被卷入的伤损。','v6/npc-young-laborer.webp','porter'),
 jt_pawnbroker:p('当铺掌柜','南方小城','见黑青破角便压低当价，后来以玉压账。他没有被玩家变成亲历内廷旧案的鉴宝大师。','v5/npc-clerk-male.webp','clerk'),
};
const s=(name:string,time:string,art:string)=>({name,time,art});
export const jadeThievesScenes={
 jt2_temple_reveal:s('破庙 · 对面的人','各自带来的命令','v5/hall.webp'),
 jt_vault:s('庄园 · 密库','拍卖前一夜 · 两条来路','v6/longmen-hall.webp'),jt_wall:s('庄园 · 外墙','空盒之后','v6/longmen-backyard.webp'),jt_market:s('江南 · 地下席外','次日 · 传闻开价','v5/inn.webp'),jt_auction:s('庄园 · 拍卖场','当夜 · 四次换手','v6/longmen-hall.webp'),
 jt_kitchen:s('庄园 · 膳房退路','各自留的路没有接上','v5/inn.webp'),jt_sidehall:s('庄园 · 侧廊','认过的门闩','v6/qingxi-veranda.webp'),jt_road:s('三百里 · 途中','不同追兵与不同谎话','v5/ridge.webp'),jt_bridge:s('旧木桥 · 河岸','第二次拉回','v5/reeds.webp'),jt_temple:s('废庙 · 避雨','真物仍不答人','v5/hall.webp'),
 jt_lodging:s('暂住处 · 夜与晨','第三个月及数日后','v5/inn.webp'),jt_temple_reveal:s('破庙 · 对面的人','身份与命令已明','v5/hall.webp'),jt_workshop:s('旧匠住处','做得更漂亮的数月','v6/longmen-backyard.webp'),jt_exchange:s('城外 · 假消息','第一次真假互换','v5/ridge.webp'),jt_mountainpass:s('南行山道 · 窄口','半年以后','v6/reusable-stone-valley.webp'),jt_afterpass:s('山道 · 此后的路','江十七死后 · 视角归沈','v6/reusable-stone-valley.webp'),jt_pawn:s('南方小城 · 当铺','后来 · 药钱用尽','v5/inn.webp'),jt_hidden:s('南方 · 无名岁月','沈玉娘隐居及后人所见','v5/dawn.webp'),
};
export const jadeThievesEndings={jt_unmarked_life:'没有招牌的日子',jt_private_account:'留给自己的账纸'};
export const jadeThievesFacts={jt_roles_v2:{name:'破庙确认的身份',text:'沈玉娘来自内廷，江十七来自盗门。两人已核实彼此来路，卖钱与家传都不是全部；仍各握兵器，尚未把命令原话当面说清。'},jt_roles:{name:'破庙才揭开的两份命令',text:'沈玉娘来自内廷，得璧绝旁知者；江十七来自盗门，璧归门且不留外人。两人全力戒备而未出手。真玉没有武学或天命，名字与真实死者不替其他谎话作保证。'}};
export const jadeThievesChapters=[['jt_vault','一 · 空盒'],['jt_auction','二 · 先礼貌坐一会儿'],['jt_road','三 · 三百里并非一口气'],['jt_lodging','四 · 最普通的一天'],['jt_temple_reveal','五 · 名字'],['jt_workshop','六 · 做这么丑难'],['jt_exchange','七 · 两块山河璧'],['jt_mountainpass','八 · 也还行'],['jt_pawn','九 · 赎']];
export const jadeThievesV1Work={slug:'jade-thieves-v1',file:'jade-thieves-v1.html',title:'山河璧 · 密库双贼旧稿',version:'jade-thieves-1.0.0',prefix:'jianghu:chronicle:jade-thieves:v1:',start:'听清密库门外的脚步',hook:'都说它无价。<br>你先看看怎么出去。',intro:'一只空盒，两种来路。<br>假的比真的漂亮，名字却还是真的。',viewpoint:'沈玉娘首程；通关后可从江十七再走',note:'制作中 · 第一卷双视角草稿',coverArt:'v6/longmen-hall.webp',chapters:jadeThievesChapters,replayChoices:{jt_be_jiang:'通关一次后，解锁江十七视角'}};

export const jadeThievesWork={...jadeThievesV1Work,slug:'jade-thieves',file:'jade-thieves.html',title:'山河璧 · 密库双贼',version:'jade-thieves-2.0.0',prefix:'jianghu:chronicle:jade-thieves:v2:',note:'两条来路 · 一路同行',chapters:jadeThievesChapters.map(([id,title])=>[id==='jt_temple_reveal'?'jt2_temple_reveal':id,title])};
