export function writeSix(w){
 const {part,choose,go}=w;
 part('shaolin','rl_shaolin','rl_monk',`n|少林老僧听你报学过什么，报到半截就抬手。
rl_monk|够了。不是缺功，缺十年。
y|哪十年？
rl_monk~intent|十年不换。
n|你原想请一门真正少林功夫，老人先叫你把今日站过的再站一回。你觉得玄，脚下却是很明白的累。`);
 choose('wudang',[
  ['rl_finish_standing','先真站完这一回，再问十年中遇见更高明的人怎么办。','rl_ten_years = true',`rl_monk|可以看见。看见与明日便全部重练，不是一件事。
n|他没有因为你多站一回便少要那十年。`],
  ['rl_ask_one_base','先请他指今天哪一步还未稳，把没得新功的气留到下山后再生。','rl_ten_years = false',`n|他轻推你肘，你的脚先换。你自己摆回来，老僧等你再站，不用一句禅语替这一寸作答。`],
 ]);
 part('wudang','rl_wudang','rl_innerelder',`n|武当内院老人陪看剑、走山。玄门高席没有因王爷爱剑便出来授艺。走到第七步，他忽然问为什么换脚。
y|习惯。
rl_innerelder|谁教？
n|你想很久，不记得。回去翻了两天旧笔记，也找不出这一脚从谁那里来。
rl_innerelder~intent|先认清身上哪些是谁的，再谈自己的。
n|山路上你再走，想改，另一处又接不上。老人站旁边，让你亲自试完那一整段。`);
 choose('taiji',[
  ['rl_mark_unknown_step','将这一脚先标未记清，不随手填一位最出名的老师；带着疑处去问下一处。','rl_unknown_step = true',`n|你写未记清三个字，笔尖停在下面。本想添一个最熟的姓名，翻过两页旧记，还是将笔收回去了。`],
  ['rl_walk_both_versions','把记得的两种前步各走一回，承认自己还分不清，再把当日感到的差处记下。','rl_unknown_step = false',`n|两回都绊，绊得却不同。老人叫慢点，你没再为同是名家教法就硬把它们接作一套。`],
 ]);
 part('taiji','rl_taiji','rl_taijielder',`n|太极退位老人看一遍，说都对。你刚高兴，他说合起来全错。
rl_taijielder|七个人的答案，拿来解一道题。
y|那选哪一个最好？
rl_taijielder~sharp|还问这个。
n|他让你只用刚才最普通的那一段应一掌。你半途想换别家起手，自己先卡住。老人没叫你信太极天下第一，只让这次别忽然换脚。`);
 go('bagua');
 part('bagua','rl_bagua','rl_circleelder',`n|八卦走圈半日，不教掌。老人说腰硬，你问怎么改，他指你脚下继续走。
y|高人怎么总叫我练最简单的？
rl_circleelder~amused|你总去问太难的人。他们先看见的，正是简单的没好。
n|走到太阳移过半个院，腰仍硬。你停下来喝水，没得到一个花钱便能缩短的日数。`);
 choose('huashan',[
  ['rl_circle_one_more','再走一圈，让对方指出哪一转还在拿肩带腰，回去也照这个问题练。','rl_circle_again = true',`n|老人点中一处，你这回不问几月能好，先把那一圈走完。`],
  ['rl_ask_rest_and_return','先认今日累了，请他看自己歇后再走，不拿疲了便硬撑当学得更快。','rl_circle_again = false',`n|歇一阵回来，那一处还在。老人笑，你也只好承认，方才不能全算累的。`],
 ]);
 part('huashan','rl_huashan','rl_swordelder',`n|华山高层剑师请用最熟的一套。三手，木剑落；再拿，两手又落；第三次，你脸已挂不住。
rl_swordelder|为何来学华山剑？
y|强。
rl_swordelder~intent|强的是人。
n|你弯腰拾剑，指尖沾土。此次问剑没有因你第三次捡起便凭空多撑百招。`);
 go('white_valley');
 part('white_valley','rl_whitevalley','rl_kunlun',`n|白石谷，你没进内山，也没见掌门。昆仑一个中年人陪半日，看你练完，把剑放回你手边。
rl_kunlun|明年以前，别学新的。
y|这算指点？我走这么远。
rl_kunlun~intent|所以更该记住。
n|你回京气一月，却真一年没添新功。陆听说腰太硬那一段，特意将门边箱子移开，留出够你走圈的地方。
rl_lu~amused|高人只说最简单的没好。我没添一个字。
n|你不服，又知道她没添错。`);
 w.iff('rl_unknown_step',
`n|你把武当没记清的那一步也写进册里，带给中年人看。他翻到未记清三个字那一行，点了点头，没替你补一个名字。`,
`n|两处记不清的脚你都各走了一遍，把差处原样记下。中年人看了一眼，仍不替你判哪个对。`);
 choose('fair_seat',[
  ['rl_thank_space','认她留下的空处真能用，先练完，再抱怨昆仑半日路费贵。','rl_lu_space = true',`rl_lu|我又没收路费。
n|你走过那半圈，才发现早先几只箱真被自己越堆越近。`],
  ['rl_offer_show_step','请她看这回腰究竟还僵不僵，不要求她忽然懂哪门掌法。','rl_lu_space = false',`rl_lu~intent|我看得见你一转便皱眉。先歇一下，不用连疼也叫我相信是秘传。
n|你终于笑出来，停在门边喝水。`],
 ]);
 go('fair_seat');
}
