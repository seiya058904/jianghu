// Concrete canonical scenes and early route split, using the existing tag writer.
export function writeQingheMemory(w){
 const {part,choose,say,iff,fact}=w;
 part('qinghe','lm_hall','lm_xu',`lm_xu|去年清和道人来，看宋老旧居，不是来替我出名。
y|他特地来问刀？
lm_xu|他先问宋老晚年还使不使刀。我说七十八以后，几乎只教弟子。
n|许重山把木刀搁在膝上。那一回与他交手的，不是宋老，也不是今日的你。`);
 choose('qinghe_yard',[
  ['lm_ask_qinghe_friend','先问一个武当道人为何还认得宋老的旧刀。','',`y|他认得这刀，是以前也到过镇河门？
lm_xu~calm|四十余年前，宋老护药过伏牛山，和他一位师兄同行。清和这趟先访旧，才碰见我这把没放稳的刀。
n|他说到护药时，先把刀鞘边一块旧皮扶平，没有先报老人排第几。`],
  ['lm_ask_qinghe_ninth','问玄门九席第九，为什么连贺老也不能拿来直接比。','',`y|第九和河中第一，总不是一张纸上两个数？
lm_xu~intent|不是。我拿木刀，他只取藤条；我那时只想接住，哪先知道差多少。
n|他转过木刀。你要听的是他亲自接过的三下。`],
 ]);
 part('qinghe_yard','lm_qingheyard','lm_xu,lm_qinghe',`n|旧事 · 许重山五十六岁这一年。眼下的判断，属于站在旧院里的许重山。
n|清和八十四，看过一炷香的刀。他没有取剑，伸手从架上抽一根三尺藤条。
lm_qinghe|左脚压势，少了半寸。
y|二十六岁那一处伤，确实一直带着。
lm_qinghe~intent|你怎样带，先走一刀。
n|许重山换了木刀。刀背还没完全抬起，他已想好了落点。`);
 choose('qinghe_first',[
  ['lm_old_watch_foot','先看左脚，试着把落点压回旧谱的位置。','lm_memory_foot = true',`y|先把脚下补回去。
n|左脚重新压低，肩却随之绷紧。清和没有趁他挪脚就先点过来，等那把木刀真正起了势。`],
  ['lm_old_finish_blade','先走自己惯熟的刀，想看三尺藤条怎样接。','lm_memory_foot = false',`y|脚下先照旧。若连自己的刀也不敢走，便只剩摆样子。
n|许重山沿熟路出刀，肩稍让开一点。清和没有评价，藤条搭来。`],
 ]);
 part('qinghe_first','lm_qingheyard','lm_xu,lm_qinghe',`n|第一刀，藤条搭在刀侧，没有把木刀震飞。许重山的右肘忽然无处可落。
y|我把他留在刀外，自己的肘却没地方收。
n|清和并不等他解释完。藤条沿刀背一滑，第二刀走到一半，胸前已空。`);
 choose('qinghe_third',[
  ['lm_old_close_elbow','先收右肘，不强追先前定好的刀头。','lm_memory_elbow = true',`n|他把肘收回来，原先想追的地方便到不了。清和的藤条却仍没离开那一道空门。
lm_qinghe|你想改这一刀的末尾？
y|是。可是前半截已经走出去了。`],
  ['lm_old_press_end','仍把第二刀送到原定处，亲自试这条路是否真走死。','lm_memory_elbow = false',`n|木刀继续向原来定好的地方走。胸前空着，清和不必追刀，只把藤条留在那里。
y|我若补第三刀……
lm_qinghe|请。`],
 ]);
 part('qinghe_third','lm_qingheyard','lm_qinghe,lm_xu',`n|第三刀尚未真正走完，藤条已停在喉前两寸。没有点上，更没有因为停住便变成许重山接住了。
lm_qinghe|你的刀很好。
y|真人不必宽慰。
lm_qinghe|你一出刀，便先想好了这一刀要到哪里。到了以后，刀就停了。
n|许重山垂下木刀。这句话没有把宋老第七刀的问题抹掉，却让他重新听见一个原先没问过的后半句。`);
 choose('qinghe_return',[
  ['lm_old_ask_twenty','承认三下都没接住，再问自己还能怎么练。','',`y|若我再练二十年，可接住第三下？
lm_qinghe~calm|二十年后，何必还是今日这一刀？
n|许重山看了看手中木刀，没有请他先说二十年后必定能赢。`],
  ['lm_old_try_words','先说出自己为何想把刀送到底，再问二十年。','',`y|若不知道要到哪儿，怕刀从一开始便乱。若我再练二十年，可接住第三下？
lm_qinghe~calm|二十年后，何必还是今日这一刀？
n|许重山把那句怕也留着，没有拿三下失利换一段忽然无所畏惧的领悟。`],
 ]);
 part('qinghe_return','lm_hall','lm_xu',`n|这三下是许重山今日亲口回述的旧事。院里的木刀又在你手边。眼下仍是清和到河中的次年，你是来借刀的门人，不是当年的许重山。
lm_xu|我后来少了一些刀。罗天庆先前知道我下一刀在哪，如今有时也不知道。
y|您现在知道自己的下一刀么？
lm_xu~amused|有时知道。有时得先看你这一步怎么走。`);fact('lm_seven');
 iff('lm_memory_elbow',`lm_xu~intent|刚才说收肘，那不是末尾忽然缩一下便行。你出刀之前，留一处还能走的地方。
n|他推你的刀背，等你自己试哪只脚还能动。`,`lm_xu~intent|你想先把整刀试完，可以。试到胸前空了，就停在那里看，别急着补第三刀遮过去。
n|他把木刀从你手里托高一点，让那处空门显出来。`);
}
export function writeEarlyLongmenRoutes(w){
 const {part,choose,say,stage,iff,out}=w;
 part('choose_path','lm_hall','lm_xu',`n|正式问艺之前，馆里缺人带新门人；武陵来的帖子也要送到混元门。许重山把两件事放到你面前。
lm_xu|留下教起手，或替外来人带路。先说你今日能交清哪一件。
y|不能两个都先答应，回头再让别人补？
lm_xu~amused|你已经想得到这一步，还问我许不许。`);
 choose('route_first_day',[
  ['lm_route_school','留在镇河门，带初入门的人试起手，走传承一线。','lm_early_route = 1',`y|我留下。借了刀，总得先知道自己会不会把人教到柱上。
lm_xu~intent|那就让他真动。你站旁边背刀诀，他学到的还是背刀诀。`],
  ['lm_route_guest','去接武陵问剑的来客，带他认河中门庭，走外来一线。','lm_early_route = 2',`y|我送帖。谁收，谁不肯收，照原话回报。
lm_xu~calm|带路，不替他求每一家说好话。他递这封帖，自己知道要问什么。`],
 ]);
 part('route_first_day','lm_hall','lm_xu',`n|早饭以后，你把答应的第一件事接到手里。`);
 out.push('{\n- lm_early_route == 1:');stage('lm_hall','lm_xu');
 say(`n|新门人照你示范走到第六刀，刀还没碰柱，脚先挤到一处。他看你一眼，等一个能照着做的答复。
lm_xu|你说第七刀砍什么，他现在也答不出。换一句。`);
 choose('outsider',[
  ['lm_show_lane','把木刀放低，与他一同走退线，先让身体知道哪儿能停。','lm_early_practice = true',`y|先别追我的刀。你往这边走，我让开，看看咱们会不会撞。
n|你们真的撞了一次，重摆脚。到第三遍，新门人才在窄处停得住。
lm_xu~amused|柱子倒省得再挨两下。线留着，问艺时场边也用。`],
  ['lm_copy_lane','先在纸上画起手与退线，逐一讲完，练习留到问艺后。','lm_early_practice = false',`y|先记这一步怎么退。今日我要去问艺，回来再陪你走。
lm_xu~intent|那就是没走过。纸上写清回来再试，别告诉别人你今日教会了。
n|你把练习时辰添上去，没有把一张画好的退线说成已经走熟。`],
 ]);
 out.push('- else:');stage('lm_challenge','lm_shi');
 say(`n|石惊川把帖子递给你，纸角压得很平。路边有人说辰州府榜到河中来，何必把自二十四起写得这么大。
lm_shi~intent|你若领我去，请先照字递。若不愿，我自己去问路。`);
 choose('outsider',[
  ['lm_deliver_exact','照原帖递到收帖人手里，等对方亲口答复。','lm_early_practice = true',`y|这封是问艺，不是请替他改一封好听的。我等回话。
n|你在门口等到收帖的人出来，石惊川也没有在身后催。
lm_shi~calm|写的便是我想问的。你不用先替我少问一场。`],
  ['lm_smooth_post','担心对方不收，先把话说成只想与同道随便试手。','lm_early_practice = false',`y|石先生远来，只想同诸位随便试几手……
lm_shi~sharp|不是随便。自二十四起，愿一路问至第一。
n|他当面重新递帖，随后自己问了下一家的路。你还可以跟，却不能替他说那句不敢问。`],
 ]);
 out.push('}');
}
