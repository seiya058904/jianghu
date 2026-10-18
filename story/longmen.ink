// 龙门秋会：1804–2021，明确去年回述、当年秋会、五年后；史实不改
VAR lm_night_read = 0
VAR lm_he_night = false
VAR lm_morning_try = false
VAR lm_memory_foot = false
VAR lm_memory_elbow = false
VAR lm_early_route = 0
VAR lm_early_practice = false
VAR lm_asked = false
VAR lm_wound_known = false
VAR lm_stopped = false
VAR lm_courtesy = false
VAR lm_record_true = false
VAR lm_share_load = false
VAR lm_guarded = false
VAR lm_sword_respect = false
VAR lm_read_careful = false
VAR lm_attended = false
VAR lm_nine_help = false
VAR lm_linked = false
VAR lm_future = 0
-> borrow

=== borrow ===
你想借镇河门一把木刀，到秋会上换人试手。许重山没把刀递过来，先问你第七刀砍谁。 # beat:lm_borrow_1 # scene:lm_hall # cast:lm_xu # speaker:narrator
第七刀……接在第六刀后面。 # beat:lm_borrow_2 # scene:lm_hall # cast:lm_xu # speaker:you
我看得出七在六后面。 # beat:lm_borrow_3 # scene:lm_hall # cast:lm_xu # speaker:lm_xu # mood:lm_xu=sharp
你伸出去的手停在半空。他没有把刀收回，只等你把这句话自己想完。 # beat:lm_borrow_4 # scene:lm_hall # cast:lm_xu # speaker:narrator
* [承认只记了次序，请他先让我摆出这一刀。 # cid:lm_ask_use]
  ~ lm_asked = true
  我没想过。让我摆出来，您看我到底想打哪儿。 # beat:lm_borrow_5 # scene:lm_hall # cast:lm_xu # speaker:you
  别摆给我好看。对着这根柱，先站稳。 # beat:lm_borrow_6 # scene:lm_hall # cast:lm_xu # speaker:lm_xu # mood:lm_xu=calm
  你举刀，才发现刀落完，下一步没有地方接。 # beat:lm_borrow_7 # scene:lm_hall # cast:lm_xu # speaker:narrator
  -> old_blade
* [不急着求指点，先试给他看自己的用法。 # cid:lm_try_first]
  ~ lm_asked = false
  我说不清，先试。若柱子是个人，我想逼他退。 # beat:lm_borrow_8 # scene:lm_hall # cast:lm_xu # speaker:you
  你连着劈出，木刀收不住，差点带着右脚撞柱。 # beat:lm_borrow_9 # scene:lm_hall # cast:lm_xu # speaker:narrator
  人会走。柱子今日倒让你省了一场输。 # beat:lm_borrow_10 # scene:lm_hall # cast:lm_xu # speaker:lm_xu # mood:lm_xu=sharp
  -> old_blade

=== old_blade ===
许重山把你刀背按低，目光转向墙上那把旧刀。他说自己十四岁，也只会把十七刀接得响。 # beat:lm_old_blade_1 # scene:lm_hall # cast:lm_xu # speaker:narrator
宋老当年问我，我一样答不出。 # beat:lm_old_blade_2 # scene:lm_hall # cast:lm_xu # speaker:lm_xu # mood:lm_xu=neutral
那我是不是…… # beat:lm_old_blade_3 # scene:lm_hall # cast:lm_xu # speaker:you
别急着找一样。你没走过我的路，也不用替我再撞一次柱。 # beat:lm_old_blade_4 # scene:lm_hall # cast:lm_xu # speaker:lm_xu # mood:lm_xu=amused
他是伏河刀宋九川的再传。你听过镇河门护盐船、走镖路，却第一次见他说起少年时，笑得这样不留面子。 # beat:lm_old_blade_5 # scene:lm_hall # cast:lm_xu # speaker:narrator
二十六岁霍岭口，我第四十二刀撞脱彭四海兵刃。名号留下了，左肩也留下了。 # beat:lm_old_blade_6 # scene:lm_hall # cast:lm_xu # speaker:lm_xu # mood:lm_xu=neutral
{
- lm_asked:
你举过刀，才知道落完没有地方接。此刻听他讲少年时撞柱的旧事，你听得比谁都仔细——同一处亏，不必再吃第二回。 # beat:lm_old_blade_7 # scene:lm_hall # cast:lm_xu # speaker:narrator
- else:
柱子今日替你省了一场输。此刻他讲少年时撞脱别人兵刃的旧事，你先想的是自己方才那几下撞得像不像。 # beat:lm_old_blade_8 # scene:lm_hall # cast:lm_xu # speaker:narrator
}
* [问旧伤现在怎样影响他，不把战绩当没受过伤。 # cid:lm_ask_wound]
  ~ lm_wound_known = true
  您刚才按刀，左脚先让了半寸，也是因为肩？ # beat:lm_old_blade_9 # scene:lm_hall # cast:lm_xu # speaker:you
  肩与脚不是两件无关的东西。但看出半寸，不等于你知道怎样改。 # beat:lm_old_blade_10 # scene:lm_hall # cast:lm_xu # speaker:lm_xu # mood:lm_xu=intent
  那我先别替您扶。 # beat:lm_old_blade_11 # scene:lm_hall # cast:lm_xu # speaker:you
  该扶的时候会叫你。 # beat:lm_old_blade_12 # scene:lm_hall # cast:lm_xu # speaker:lm_xu # mood:lm_xu=neutral
  -> qinghe
* [问四十岁左手换刀，为何没从此每回都换。 # cid:lm_ask_left]
  ~ lm_wound_known = false
  第六十一合胜杜平川那一下，我想学。 # beat:lm_old_blade_13 # scene:lm_hall # cast:lm_xu # speaker:you
  你想学换左手，还是想学临时还能怎么走？ # beat:lm_old_blade_14 # scene:lm_hall # cast:lm_xu # speaker:lm_xu # mood:lm_xu=sharp
  他把木刀交到你左手。你连第一刀都走不顺，那一下胜场忽然离得很远。 # beat:lm_old_blade_15 # scene:lm_hall # cast:lm_xu # speaker:narrator
  -> qinghe

=== qinghe ===
去年清和道人来，看宋老旧居，不是来替我出名。 # beat:lm_qinghe_1 # scene:lm_hall # cast:lm_xu # speaker:lm_xu # mood:lm_xu=neutral
他特地来问刀？ # beat:lm_qinghe_2 # scene:lm_hall # cast:lm_xu # speaker:you
他先问宋老晚年还使不使刀。我说七十八以后，几乎只教弟子。 # beat:lm_qinghe_3 # scene:lm_hall # cast:lm_xu # speaker:lm_xu # mood:lm_xu=neutral
许重山把木刀搁在膝上。那一回与他交手的，不是宋老，也不是今日的你。 # beat:lm_qinghe_4 # scene:lm_hall # cast:lm_xu # speaker:narrator
{
- lm_wound_known:
肩与脚不是两件无关的东西——这句话你记住了。听他回述清和看破左脚那半寸，你先想的不是名字，是那半寸怎样带了一辈子。 # beat:lm_qinghe_5 # scene:lm_hall # cast:lm_xu # speaker:narrator
- else:
换左手为何没每回都换——他自己答过你。旧事里这一刀走的仍是右手，你如今听得出：那不是没改，是改过以后还要活着打。 # beat:lm_qinghe_6 # scene:lm_hall # cast:lm_xu # speaker:narrator
}
* [先问一个武当道人为何还认得宋老的旧刀。 # cid:lm_ask_qinghe_friend]
  他认得这刀，是以前也到过镇河门？ # beat:lm_qinghe_7 # scene:lm_hall # cast:lm_xu # speaker:you
  四十余年前，宋老护药过伏牛山，和他一位师兄同行。清和这趟先访旧，才碰见我这把没放稳的刀。 # beat:lm_qinghe_8 # scene:lm_hall # cast:lm_xu # speaker:lm_xu # mood:lm_xu=calm
  他说到护药时，先把刀鞘边一块旧皮扶平，没有先报老人排第几。 # beat:lm_qinghe_9 # scene:lm_hall # cast:lm_xu # speaker:narrator
  -> qinghe_yard
* [问玄门九席第九，为什么连贺老也不能拿来直接比。 # cid:lm_ask_qinghe_ninth]
  第九和河中第一，总不是一张纸上两个数？ # beat:lm_qinghe_10 # scene:lm_hall # cast:lm_xu # speaker:you
  不是。我拿木刀，他只取藤条；我那时只想接住，哪先知道差多少。 # beat:lm_qinghe_11 # scene:lm_hall # cast:lm_xu # speaker:lm_xu # mood:lm_xu=intent
  他转过木刀。你要听的是他亲自接过的三下。 # beat:lm_qinghe_12 # scene:lm_hall # cast:lm_xu # speaker:narrator
  -> qinghe_yard

=== qinghe_yard ===
旧事 · 许重山五十六岁这一年。眼下的判断，属于站在旧院里的许重山。 # beat:lm_qinghe_yard_1 # scene:lm_qingheyard # cast:lm_xu,lm_qinghe # speaker:narrator # action:旧事视角 · 许重山
清和八十四，看过一炷香的刀。他没有取剑，伸手从架上抽一根三尺藤条。 # beat:lm_qinghe_yard_2 # scene:lm_qingheyard # cast:lm_xu,lm_qinghe # speaker:narrator
左脚压势，少了半寸。 # beat:lm_qinghe_yard_3 # scene:lm_qingheyard # cast:lm_xu,lm_qinghe # speaker:lm_qinghe # mood:lm_qinghe=neutral
二十六岁那一处伤，确实一直带着。 # beat:lm_qinghe_yard_4 # scene:lm_qingheyard # cast:lm_xu,lm_qinghe # speaker:you
你怎样带，先走一刀。 # beat:lm_qinghe_yard_5 # scene:lm_qingheyard # cast:lm_xu,lm_qinghe # speaker:lm_qinghe # mood:lm_qinghe=intent
许重山换了木刀。刀背还没完全抬起，他已想好了落点。 # beat:lm_qinghe_yard_6 # scene:lm_qingheyard # cast:lm_xu,lm_qinghe # speaker:narrator
* [先看左脚，试着把落点压回旧谱的位置。 # cid:lm_old_watch_foot]
  ~ lm_memory_foot = true
  先把脚下补回去。 # beat:lm_qinghe_yard_7 # scene:lm_qingheyard # cast:lm_xu,lm_qinghe # speaker:you
  左脚重新压低，肩却随之绷紧。清和没有趁他挪脚就先点过来，等那把木刀真正起了势。 # beat:lm_qinghe_yard_8 # scene:lm_qingheyard # cast:lm_xu,lm_qinghe # speaker:narrator
  -> qinghe_first
* [先走自己惯熟的刀，想看三尺藤条怎样接。 # cid:lm_old_finish_blade]
  ~ lm_memory_foot = false
  脚下先照旧。若连自己的刀也不敢走，便只剩摆样子。 # beat:lm_qinghe_yard_9 # scene:lm_qingheyard # cast:lm_xu,lm_qinghe # speaker:you
  许重山沿熟路出刀，肩稍让开一点。清和没有评价，藤条搭来。 # beat:lm_qinghe_yard_10 # scene:lm_qingheyard # cast:lm_xu,lm_qinghe # speaker:narrator
  -> qinghe_first

=== qinghe_first ===
第一刀，藤条搭在刀侧，没有把木刀震飞。许重山的右肘忽然无处可落。 # beat:lm_qinghe_first_1 # scene:lm_qingheyard # cast:lm_xu,lm_qinghe # speaker:narrator # action:第一刀 · 右肘无处落
我把他留在刀外，自己的肘却没地方收。 # beat:lm_qinghe_first_2 # scene:lm_qingheyard # cast:lm_xu,lm_qinghe # speaker:you
清和并不等他解释完。藤条沿刀背一滑，第二刀走到一半，胸前已空。 # beat:lm_qinghe_first_3 # scene:lm_qingheyard # cast:lm_xu,lm_qinghe # speaker:narrator
{
- lm_memory_foot:
左脚压回旧谱位置、肩跟着绷紧——这一换的代价，许重山自己付过。清和的藤条等它起势，等的就是这一寸换来的紧。 # beat:lm_qinghe_first_4 # scene:lm_qingheyard # cast:lm_xu,lm_qinghe # speaker:narrator
- else:
先走自己惯熟的刀——藤条搭来时他才发现肘无处落。不是脚下错了，是熟路走到一半，人才问出下一处。 # beat:lm_qinghe_first_5 # scene:lm_qingheyard # cast:lm_xu,lm_qinghe # speaker:narrator
}
* [先收右肘，不强追先前定好的刀头。 # cid:lm_old_close_elbow]
  ~ lm_memory_elbow = true
  他把肘收回来，原先想追的地方便到不了。清和的藤条却仍没离开那一道空门。 # beat:lm_qinghe_first_6 # scene:lm_qingheyard # cast:lm_xu,lm_qinghe # speaker:narrator
  你想改这一刀的末尾？ # beat:lm_qinghe_first_7 # scene:lm_qingheyard # cast:lm_xu,lm_qinghe # speaker:lm_qinghe # mood:lm_qinghe=neutral
  是。可是前半截已经走出去了。 # beat:lm_qinghe_first_8 # scene:lm_qingheyard # cast:lm_xu,lm_qinghe # speaker:you
  -> qinghe_third
* [仍把第二刀送到原定处，亲自试这条路是否真走死。 # cid:lm_old_press_end]
  ~ lm_memory_elbow = false
  木刀继续向原来定好的地方走。胸前空着，清和不必追刀，只把藤条留在那里。 # beat:lm_qinghe_first_9 # scene:lm_qingheyard # cast:lm_xu,lm_qinghe # speaker:narrator
  我若补第三刀…… # beat:lm_qinghe_first_10 # scene:lm_qingheyard # cast:lm_xu,lm_qinghe # speaker:you
  请。 # beat:lm_qinghe_first_11 # scene:lm_qingheyard # cast:lm_xu,lm_qinghe # speaker:lm_qinghe # mood:lm_qinghe=neutral
  -> qinghe_third

=== qinghe_third ===
第三刀尚未真正走完，藤条已停在喉前两寸。没有点上，更没有因为停住便变成许重山接住了。 # beat:lm_qinghe_third_1 # scene:lm_qingheyard # cast:lm_qinghe,lm_xu # speaker:narrator # action:第三刀未完 · 喉前两寸
你的刀很好。 # beat:lm_qinghe_third_2 # scene:lm_qingheyard # cast:lm_qinghe,lm_xu # speaker:lm_qinghe # mood:lm_qinghe=neutral
真人不必宽慰。 # beat:lm_qinghe_third_3 # scene:lm_qingheyard # cast:lm_qinghe,lm_xu # speaker:you
你一出刀，便先想好了这一刀要到哪里。到了以后，刀就停了。 # beat:lm_qinghe_third_4 # scene:lm_qingheyard # cast:lm_qinghe,lm_xu # speaker:lm_qinghe # mood:lm_qinghe=neutral
许重山垂下木刀。这句话没有把宋老第七刀的问题抹掉，却让他重新听见一个原先没问过的后半句。 # beat:lm_qinghe_third_5 # scene:lm_qingheyard # cast:lm_qinghe,lm_xu # speaker:narrator
* [承认三下都没接住，再问自己还能怎么练。 # cid:lm_old_ask_twenty]
  若我再练二十年，可接住第三下？ # beat:lm_qinghe_third_6 # scene:lm_qingheyard # cast:lm_qinghe,lm_xu # speaker:you
  二十年后，何必还是今日这一刀？ # beat:lm_qinghe_third_7 # scene:lm_qingheyard # cast:lm_qinghe,lm_xu # speaker:lm_qinghe # mood:lm_qinghe=calm
  许重山看了看手中木刀，没有请他先说二十年后必定能赢。 # beat:lm_qinghe_third_8 # scene:lm_qingheyard # cast:lm_qinghe,lm_xu # speaker:narrator
  -> qinghe_return
* [先说出自己为何想把刀送到底，再问二十年。 # cid:lm_old_try_words]
  若不知道要到哪儿，怕刀从一开始便乱。若我再练二十年，可接住第三下？ # beat:lm_qinghe_third_9 # scene:lm_qingheyard # cast:lm_qinghe,lm_xu # speaker:you
  二十年后，何必还是今日这一刀？ # beat:lm_qinghe_third_10 # scene:lm_qingheyard # cast:lm_qinghe,lm_xu # speaker:lm_qinghe # mood:lm_qinghe=calm
  许重山把那句怕也留着，没有拿三下失利换一段忽然无所畏惧的领悟。 # beat:lm_qinghe_third_11 # scene:lm_qingheyard # cast:lm_qinghe,lm_xu # speaker:narrator
  -> qinghe_return

=== qinghe_return ===
这三下是许重山今日亲口回述的旧事。院里的木刀又在你手边。眼下仍是清和到河中的次年，你是来借刀的门人，不是当年的许重山。 # beat:lm_qinghe_return_1 # scene:lm_hall # cast:lm_xu # speaker:narrator
我后来少了一些刀。罗天庆先前知道我下一刀在哪，如今有时也不知道。 # beat:lm_qinghe_return_2 # scene:lm_hall # cast:lm_xu # speaker:lm_xu # mood:lm_xu=neutral
您现在知道自己的下一刀么？ # beat:lm_qinghe_return_3 # scene:lm_hall # cast:lm_xu # speaker:you
有时知道。有时得先看你这一步怎么走。 # beat:lm_qinghe_return_4 # scene:lm_hall # cast:lm_xu # speaker:lm_xu # mood:lm_xu=amused # fact:lm_seven
{
- lm_memory_elbow:
刚才说收肘，那不是末尾忽然缩一下便行。你出刀之前，留一处还能走的地方。 # beat:lm_qinghe_return_5 # scene:lm_hall # cast:lm_xu # speaker:lm_xu # mood:lm_xu=intent
他推你的刀背，等你自己试哪只脚还能动。 # beat:lm_qinghe_return_6 # scene:lm_hall # cast:lm_xu # speaker:narrator
- else:
你想先把整刀试完，可以。试到胸前空了，就停在那里看，别急着补第三刀遮过去。 # beat:lm_qinghe_return_7 # scene:lm_hall # cast:lm_xu # speaker:lm_xu # mood:lm_xu=intent
他把木刀从你手里托高一点，让那处空门显出来。 # beat:lm_qinghe_return_8 # scene:lm_hall # cast:lm_xu # speaker:narrator
}
* [借刀以后，先练停住一步，不赶着连完十七刀。 # cid:lm_practice_slow]
  ~ lm_stopped = true
  那我先练走完还能停。没法连着好看，也先不连。 # beat:lm_qinghe_return_9 # scene:lm_hall # cast:lm_xu # speaker:you
  停下来不是全身僵住。我推你一下，别跟柱子一样。 # beat:lm_qinghe_return_10 # scene:lm_hall # cast:lm_xu # speaker:lm_xu # mood:lm_xu=intent
  他只推肩，你已挪了两步。秋会借刀的事，忽然没那么像拿了刀就能去。 # beat:lm_qinghe_return_11 # scene:lm_hall # cast:lm_xu # speaker:narrator
  -> choose_path
* [仍想多试几轮连刀，自己承担练过头的酸痛。 # cid:lm_practice_more]
  ~ lm_stopped = false
  我还想试。刚才拧住的那一下，不能只听过便算了。 # beat:lm_qinghe_return_12 # scene:lm_hall # cast:lm_xu # speaker:you
  可以。晚饭前停，手酸要讲。 # beat:lm_qinghe_return_13 # scene:lm_hall # cast:lm_xu # speaker:lm_xu # mood:lm_xu=neutral
  你又练了几轮，最后一刀开始沉。你知道不是木头忽然变重了。 # beat:lm_qinghe_return_14 # scene:lm_hall # cast:lm_xu # speaker:narrator
  -> choose_path

=== choose_path ===
正式问艺之前，馆里缺人带新门人；武陵来的帖子也要送到混元门。许重山把两件事放到你面前。 # beat:lm_choose_path_1 # scene:lm_hall # cast:lm_xu # speaker:narrator
留下教起手，或替外来人带路。先说你今日能交清哪一件。 # beat:lm_choose_path_2 # scene:lm_hall # cast:lm_xu # speaker:lm_xu # mood:lm_xu=neutral
不能两个都先答应，回头再让别人补？ # beat:lm_choose_path_3 # scene:lm_hall # cast:lm_xu # speaker:you
你已经想得到这一步，还问我许不许。 # beat:lm_choose_path_4 # scene:lm_hall # cast:lm_xu # speaker:lm_xu # mood:lm_xu=amused
* [留在镇河门，带初入门的人试起手，走传承一线。 # cid:lm_route_school]
  ~ lm_early_route = 1
  我留下。借了刀，总得先知道自己会不会把人教到柱上。 # beat:lm_choose_path_5 # scene:lm_hall # cast:lm_xu # speaker:you
  那就让他真动。你站旁边背刀诀，他学到的还是背刀诀。 # beat:lm_choose_path_6 # scene:lm_hall # cast:lm_xu # speaker:lm_xu # mood:lm_xu=intent
  -> route_first_day
* [去接武陵问剑的来客，带他认河中门庭，走外来一线。 # cid:lm_route_guest]
  ~ lm_early_route = 2
  我送帖。谁收，谁不肯收，照原话回报。 # beat:lm_choose_path_7 # scene:lm_hall # cast:lm_xu # speaker:you
  带路，不替他求每一家说好话。他递这封帖，自己知道要问什么。 # beat:lm_choose_path_8 # scene:lm_hall # cast:lm_xu # speaker:lm_xu # mood:lm_xu=calm
  -> route_first_day

=== route_first_day ===
早饭以后，你把答应的第一件事接到手里。 # beat:lm_route_first_day_1 # scene:lm_hall # cast:lm_xu # speaker:narrator
{
- lm_early_route == 1:
新门人照你示范走到第六刀，刀还没碰柱，脚先挤到一处。他看你一眼，等一个能照着做的答复。 # beat:lm_route_first_day_2 # scene:lm_hall # cast:lm_xu # speaker:narrator
你说第七刀砍什么，他现在也答不出。换一句。 # beat:lm_route_first_day_3 # scene:lm_hall # cast:lm_xu # speaker:lm_xu # mood:lm_xu=neutral
* [把木刀放低，与他一同走退线，先让身体知道哪儿能停。 # cid:lm_show_lane]
  ~ lm_early_practice = true
  先别追我的刀。你往这边走，我让开，看看咱们会不会撞。 # beat:lm_route_first_day_4 # scene:lm_hall # cast:lm_xu # speaker:you
  你们真的撞了一次，重摆脚。到第三遍，新门人才在窄处停得住。 # beat:lm_route_first_day_5 # scene:lm_hall # cast:lm_xu # speaker:narrator
  柱子倒省得再挨两下。线留着，问艺时场边也用。 # beat:lm_route_first_day_6 # scene:lm_hall # cast:lm_xu # speaker:lm_xu # mood:lm_xu=amused
  -> outsider
* [先在纸上画起手与退线，逐一讲完，练习留到问艺后。 # cid:lm_copy_lane]
  ~ lm_early_practice = false
  先记这一步怎么退。今日我要去问艺，回来再陪你走。 # beat:lm_route_first_day_7 # scene:lm_hall # cast:lm_xu # speaker:you
  那就是没走过。纸上写清回来再试，别告诉别人你今日教会了。 # beat:lm_route_first_day_8 # scene:lm_hall # cast:lm_xu # speaker:lm_xu # mood:lm_xu=intent
  你把练习时辰添上去，没有把一张画好的退线说成已经走熟。 # beat:lm_route_first_day_9 # scene:lm_hall # cast:lm_xu # speaker:narrator
  -> outsider
- else:
石惊川把帖子递给你，纸角压得很平。路边有人说辰州府榜到河中来，何必把自二十四起写得这么大。 # beat:lm_route_first_day_10 # scene:lm_challenge # cast:lm_shi # speaker:narrator
你若领我去，请先照字递。若不愿，我自己去问路。 # beat:lm_route_first_day_11 # scene:lm_challenge # cast:lm_shi # speaker:lm_shi # mood:lm_shi=intent
* [照原帖递到收帖人手里，等对方亲口答复。 # cid:lm_deliver_exact]
  ~ lm_early_practice = true
  这封是问艺，不是请替他改一封好听的。我等回话。 # beat:lm_route_first_day_12 # scene:lm_challenge # cast:lm_shi # speaker:you
  你在门口等到收帖的人出来，石惊川也没有在身后催。 # beat:lm_route_first_day_13 # scene:lm_challenge # cast:lm_shi # speaker:narrator
  写的便是我想问的。你不用先替我少问一场。 # beat:lm_route_first_day_14 # scene:lm_challenge # cast:lm_shi # speaker:lm_shi # mood:lm_shi=calm
  -> outsider
* [担心对方不收，先把话说成只想与同道随便试手。 # cid:lm_smooth_post]
  ~ lm_early_practice = false
  石先生远来，只想同诸位随便试几手…… # beat:lm_route_first_day_15 # scene:lm_challenge # cast:lm_shi # speaker:you
  不是随便。自二十四起，愿一路问至第一。 # beat:lm_route_first_day_16 # scene:lm_challenge # cast:lm_shi # speaker:lm_shi # mood:lm_shi=sharp
  他当面重新递帖，随后自己问了下一家的路。你还可以跟，却不能替他说那句不敢问。 # beat:lm_route_first_day_17 # scene:lm_challenge # cast:lm_shi # speaker:narrator
  -> outsider
}

=== outsider ===
武陵来的帖子在棚前传了一圈。石惊川说从河中第二十四问起，棚下先有人笑辰州地方偏。 # beat:lm_outsider_1 # scene:lm_challenge # cast:lm_xu,lm_shi # speaker:narrator
石惊川，武陵回雁门。先请写帖的人把名字读完。 # beat:lm_outsider_2 # scene:lm_challenge # cast:lm_xu,lm_shi # speaker:lm_shi # mood:lm_shi=calm
他不是来跟你们争路远路近。把空地清出来。 # beat:lm_outsider_3 # scene:lm_challenge # cast:lm_xu,lm_shi # speaker:lm_xu # mood:lm_xu=intent
第一个七招，第二个十一招，后面二十余招。到金钩手薛伯庸第四十七合收钩时，原先的笑声已经找不到人认。 # beat:lm_outsider_4 # scene:lm_challenge # cast:lm_xu,lm_shi # speaker:narrator
地方小，不是人一定小。 # beat:lm_outsider_5 # scene:lm_challenge # cast:lm_xu,lm_shi # speaker:you
下一场他若真把我送下来，你也照这样喊。 # beat:lm_outsider_6 # scene:lm_challenge # cast:lm_xu,lm_shi # speaker:lm_xu # mood:lm_xu=sharp
* [让同门别再喊野榜，输了也照样行礼。 # cid:lm_stop_mock]
  ~ lm_courtesy = true
  他若下一场输了，也不轮到我们把前面几场笑回去。 # beat:lm_outsider_7 # scene:lm_challenge # cast:lm_xu,lm_shi # speaker:you
  你这句话，我记下。不用先替我担心输。 # beat:lm_outsider_8 # scene:lm_challenge # cast:lm_xu,lm_shi # speaker:lm_shi # mood:lm_shi=intent
  他把剑鞘交给随行人，先看棚下留出的空地。你退到外沿，等他走过去，场边才又有人开口报名字。 # beat:lm_outsider_9 # scene:lm_challenge # cast:lm_xu,lm_shi # speaker:narrator
  -> xu_bout
* [不替别人说话，只把场地让开，认真看剑。 # cid:lm_watch_only]
  ~ lm_courtesy = false
  我不晓得他还会打到哪里。先别挡住后排的人。 # beat:lm_outsider_10 # scene:lm_challenge # cast:lm_xu,lm_shi # speaker:you
  你把借刀靠稳。笑声停了，并不等于笑过的人已经愿意认。 # beat:lm_outsider_11 # scene:lm_challenge # cast:lm_xu,lm_shi # speaker:narrator
  -> xu_bout

=== xu_bout ===
到了许重山，石惊川的断云剑不再那样快结束。你见许的刀几次留了空，石的剑也没有立刻追进去。 # beat:lm_xu_bout_1 # scene:lm_challenge # cast:lm_xu,lm_shi # speaker:narrator
第一百一十九合，剑越过刀背半寸，停在肋下；许的刀几乎同时到石右肩。 # beat:lm_xu_bout_2 # scene:lm_challenge # cast:lm_xu,lm_shi # speaker:narrator
我慢了半分。 # beat:lm_xu_bout_3 # scene:lm_challenge # cast:lm_xu,lm_shi # speaker:lm_xu # mood:lm_xu=calm
只有半分。 # beat:lm_xu_bout_4 # scene:lm_challenge # cast:lm_xu,lm_shi # speaker:lm_shi # mood:lm_shi=neutral
许先收刀。你站在棚外，最想听见的那声胜没有来，他却比你稳得多。 # beat:lm_xu_bout_5 # scene:lm_challenge # cast:lm_xu,lm_shi # speaker:narrator
{
- lm_courtesy:
他若输了也照样行礼——这一句石惊川记下了。到许重山这一场，两人收招时都是先按礼，再论那半分。 # beat:lm_xu_bout_6 # scene:lm_challenge # cast:lm_xu,lm_shi # speaker:narrator
- else:
你只把场地让开，没有替谁圆过一句。笑声停了以后人该站的地方，此刻就摆在眼前。 # beat:lm_xu_bout_7 # scene:lm_challenge # cast:lm_xu,lm_shi # speaker:narrator
}
* [照实报一百一十九合，不拿旧伤替许解释。 # cid:lm_name_loss]
  ~ lm_record_true = true
  许先生慢半分。记这一场。 # beat:lm_xu_bout_8 # scene:lm_challenge # cast:lm_xu,lm_shi # speaker:you
  嗯。我的肩没拦着我出来，就别等输了才忽然替它说话。 # beat:lm_xu_bout_9 # scene:lm_challenge # cast:lm_xu,lm_shi # speaker:lm_xu # mood:lm_xu=calm
  他的后手我有几回没看清。也记着。 # beat:lm_xu_bout_10 # scene:lm_challenge # cast:lm_xu,lm_shi # speaker:lm_shi # mood:lm_shi=intent
  -> sore
* [先不在众人前评说，问许是否要水和座位。 # cid:lm_ask_private]
  ~ lm_record_true = false
  水在这里。您要坐，我搬过来；不要我就放边上。 # beat:lm_xu_bout_11 # scene:lm_challenge # cast:lm_xu,lm_shi # speaker:you
  放边上。你脸倒比我白。 # beat:lm_xu_bout_12 # scene:lm_challenge # cast:lm_xu,lm_shi # speaker:lm_xu # mood:lm_xu=amused
  他没有让你改记录。你也没把没说出口的旧伤当成众人该默认的理由。 # beat:lm_xu_bout_13 # scene:lm_challenge # cast:lm_xu,lm_shi # speaker:narrator
  -> sore

=== sore ===
此后石惊川又胜第七、险胜第五，与罗天庆百余合后同时收招，记平。 # beat:lm_sore_1 # scene:lm_hall # cast:lm_xu,lm_luo # speaker:narrator
他有一手能伤我，我也有。再走下去，不是问艺。 # beat:lm_sore_2 # scene:lm_hall # cast:lm_xu,lm_luo # speaker:lm_luo # mood:lm_luo=intent
你如今知道下一剑在哪儿？ # beat:lm_sore_3 # scene:lm_hall # cast:lm_xu,lm_luo # speaker:lm_xu # mood:lm_xu=neutral
你刀改过以后，我有时也不知道。问我的工夫，先把自己那只肩放下。 # beat:lm_sore_4 # scene:lm_hall # cast:lm_xu,lm_luo # speaker:lm_luo # mood:lm_luo=amused
你要将院里的重木架搬到混元门。木刀练过的手一握绳，就知道今日还有没有余力。 # beat:lm_sore_5 # scene:lm_hall # cast:lm_xu,lm_luo # speaker:narrator
{
- lm_record_true:
一百一十九合照实记了，没拿旧伤垫一句。后来罗天庆记贺老的十九、三十二、四十一，也都这样一招一合记着。 # beat:lm_sore_6 # scene:lm_hall # cast:lm_xu,lm_luo # speaker:narrator
- else:
水放在边上，记录一个字没改。此后你在场边只做两件事：递水，和等本人自己开口。 # beat:lm_sore_7 # scene:lm_hall # cast:lm_xu,lm_luo # speaker:narrator
}
{
- lm_early_route == 1:
{
- lm_early_practice:
你早先带着走过退线的新门人已站到侧门，先让后排的人退一步，再转身给抬架的留道。 # beat:lm_sore_8 # scene:lm_hall # cast:lm_xu # speaker:narrator
刚才那一步你还记得？ # beat:lm_sore_9 # scene:lm_hall # cast:lm_xu # speaker:you
他真走过，不是背出了纸。你去接架，他能守这一小段。 # beat:lm_sore_10 # scene:lm_hall # cast:lm_xu # speaker:lm_xu # mood:lm_xu=calm
- else:
新门人拿着早饭后那张图，脚仍挤在门边。他没真走过，纸没能替他把人群让开。 # beat:lm_sore_11 # scene:lm_hall # cast:lm_xu # speaker:narrator
先跟我走。今日答应回来试，得从现在抽出工夫。 # beat:lm_sore_12 # scene:lm_hall # cast:lm_xu # speaker:you
你先陪他走过侧门，抬架那头的同门多等了一会。 # beat:lm_sore_13 # scene:lm_hall # cast:lm_xu # speaker:narrator
}
- else:
{
- lm_early_practice:
下一封帖，也请你送。看见我只同罗先生打平，还肯照原话递么？ # beat:lm_sore_14 # scene:lm_challenge # cast:lm_shi # speaker:lm_shi # mood:lm_shi=intent
照字递。没人答，我就回来说没人答。 # beat:lm_sore_15 # scene:lm_challenge # cast:lm_shi # speaker:you
他把未封的下一帖放到你面前，仍写愿请第一赐教。你亲眼看见那句话在一场险胜、一场平局以后没有被划掉。 # beat:lm_sore_16 # scene:lm_challenge # cast:lm_shi # speaker:narrator
- else:
下一封帖已由石惊川亲手封好。他问了馆里的老门人去混元门的路，没再请你替他递。 # beat:lm_sore_17 # scene:lm_challenge # cast:lm_shi # speaker:narrator
你不必替我把问第一改成随便试手。今日这场也不替我说轻。 # beat:lm_sore_18 # scene:lm_challenge # cast:lm_shi # speaker:lm_shi # mood:lm_shi=calm
你替他把门让开，没有去拆那封已不交给你的帖。 # beat:lm_sore_19 # scene:lm_challenge # cast:lm_shi # speaker:narrator
}
}
* [请同门分抬，自己只接绳的一头。 # cid:lm_share_frame]
  ~ lm_share_load = true
  这头我来。另一头请个人，不拿一个人抬完证明我刀练得好。 # beat:lm_sore_20 # scene:lm_hall # cast:lm_xu,lm_luo # speaker:you
  知道还要搬东西，练刀也能早停一回。 # beat:lm_sore_21 # scene:lm_hall # cast:lm_xu,lm_luo # speaker:lm_xu # mood:lm_xu=neutral
  你没有反驳，换了不酸的那一只手。 # beat:lm_sore_22 # scene:lm_hall # cast:lm_xu,lm_luo # speaker:narrator
  -> he_gate
* [坚持自己抬到门口，过后承认肩臂已经疼。 # cid:lm_take_frame]
  ~ lm_share_load = false
  我送到门口，再请人接。 # beat:lm_sore_23 # scene:lm_hall # cast:lm_xu,lm_luo # speaker:you
  路不长，重架却把酸处一点点压出来。到门口你才叫人，许重山接过时皱了眉。 # beat:lm_sore_24 # scene:lm_hall # cast:lm_xu,lm_luo # speaker:narrator
  以后你说到门口，我得先问多远。 # beat:lm_sore_25 # scene:lm_hall # cast:lm_xu,lm_luo # speaker:lm_xu # mood:lm_xu=sharp
  -> he_gate

=== he_gate ===
后院里木架落稳，你按吩咐留在侧门，随时把围近的人请回白线。贺景庭九十六岁，手里没有兵刃。 # beat:lm_he_gate_1 # scene:lm_backyard # cast:lm_he,lm_luo,lm_shi # speaker:narrator
石先生用真剑。不必因为我手空着，就把自己的剑也变轻。 # beat:lm_he_gate_2 # scene:lm_backyard # cast:lm_he,lm_luo,lm_shi # speaker:lm_he # mood:lm_he=neutral
请指教。 # beat:lm_he_gate_3 # scene:lm_backyard # cast:lm_he,lm_luo,lm_shi # speaker:lm_shi # mood:lm_shi=intent
前三十余招，剑路几乎铺满眼前。第三十八招，贺老第一次真正出掌，剑势偏开两寸。 # beat:lm_he_gate_4 # scene:lm_backyard # cast:lm_he,lm_luo,lm_shi # speaker:narrator
你正想看脚，身旁有人把头挤过侧门线。剑还在走，不能让后头的人跟着挪进去。 # beat:lm_he_gate_5 # scene:lm_backyard # cast:lm_he,lm_luo,lm_shi # speaker:narrator
* [守住侧门，把人退回去，错过中间几招也认。 # cid:lm_guard_line]
  ~ lm_guarded = true
  先退。里头看不清，往前挤也不是你的招。 # beat:lm_he_gate_6 # scene:lm_backyard # cast:lm_he,lm_luo,lm_shi # speaker:you
  你转身时，第四十七招的轻铮已经响了。长剑飞出两丈，贺掌停在石胸前。 # beat:lm_he_gate_7 # scene:lm_backyard # cast:lm_he,lm_luo,lm_shi # speaker:narrator
  你没看全那一下，只看清人还在原先的白线后。 # beat:lm_he_gate_8 # scene:lm_backyard # cast:lm_he,lm_luo,lm_shi # speaker:narrator
  -> fortyseven
* [请旁人接住侧门，等听见应声才回头看。 # cid:lm_call_help]
  ~ lm_guarded = false
  罗先生，侧门这一位想往前，您帮我挡一下。 # beat:lm_he_gate_9 # scene:lm_backyard # cast:lm_he,lm_luo,lm_shi # speaker:you
  听见了。退回去。 # beat:lm_he_gate_10 # scene:lm_backyard # cast:lm_he,lm_luo,lm_shi # speaker:lm_luo # mood:lm_luo=sharp
  你回头时正到第四十七招，长剑旋飞。你看见剑离手，仍说不出贺老那一下怎样越过去。 # beat:lm_he_gate_11 # scene:lm_backyard # cast:lm_he,lm_luo,lm_shi # speaker:narrator
  -> fortyseven

=== fortyseven ===
石惊川退后三步，按晚辈礼行下去。你以为他要解释，先听见的是认输。 # beat:lm_fortyseven_1 # scene:lm_backyard # cast:lm_he,lm_shi,lm_luo # speaker:narrator
晚辈输了。只是没有料到差这样远。 # beat:lm_fortyseven_2 # scene:lm_backyard # cast:lm_he,lm_shi,lm_luo # speaker:lm_shi # mood:lm_shi=uneasy
一路打到这里，难道还输不起？ # beat:lm_fortyseven_3 # scene:lm_backyard # cast:lm_he,lm_shi,lm_luo # speaker:lm_he # mood:lm_he=sharp
石站直，没把那四十七招推回前面几场真胜里去抵。 # beat:lm_fortyseven_4 # scene:lm_backyard # cast:lm_he,lm_shi,lm_luo # speaker:narrator
我三十一问他，十九招；四十六，三十二；六十，四十一。你今日知道的，我也没少问。 # beat:lm_fortyseven_5 # scene:lm_backyard # cast:lm_he,lm_shi,lm_luo # speaker:lm_luo # mood:lm_luo=calm
你记得倒清楚。下回带笔，别让旁人替你少报。 # beat:lm_fortyseven_6 # scene:lm_backyard # cast:lm_he,lm_shi,lm_luo # speaker:lm_he # mood:lm_he=amused
罗没有说等他老了便好。你替石把剑捡回，剑柄还带着掌心的热。 # beat:lm_fortyseven_7 # scene:lm_backyard # cast:lm_he,lm_shi,lm_luo # speaker:narrator # fact:lm_count
{
- lm_guarded:
你守住了白线，错过的那几招也没再从别人嘴里补全。贺老那一下怎样越过去，与你没看清的地方，都各自留着。 # beat:lm_fortyseven_8 # scene:lm_backyard # cast:lm_he,lm_shi,lm_luo # speaker:narrator
- else:
罗先生替你挡住侧门那一声，你还记得。所以此刻剑柄上的热，是你在看得见的地方捡回来的，不是挤进去换的。 # beat:lm_fortyseven_9 # scene:lm_backyard # cast:lm_he,lm_shi,lm_luo # speaker:narrator
}
* [把剑原样递还，不先说败得光荣之类宽慰。 # cid:lm_return_sword]
  ~ lm_sword_respect = true
  您的剑。 # beat:lm_fortyseven_10 # scene:lm_backyard # cast:lm_he,lm_shi,lm_luo # speaker:you
  多谢。刚才那一下，我得自己再想。 # beat:lm_fortyseven_11 # scene:lm_backyard # cast:lm_he,lm_shi,lm_luo # speaker:lm_shi # mood:lm_shi=calm
  有要搬的物件叫我，不懂剑的地方我先不说。 # beat:lm_fortyseven_12 # scene:lm_backyard # cast:lm_he,lm_shi,lm_luo # speaker:you
  他点头，把剑收进鞘里，没有请你替他说懂了。 # beat:lm_fortyseven_13 # scene:lm_backyard # cast:lm_he,lm_shi,lm_luo # speaker:narrator
  -> autumn
* [先问有没有磕坏，想看清木架上能留下什么痕。 # cid:lm_ask_sword]
  ~ lm_sword_respect = false
  剑口可有损？我没敢拿布乱擦。 # beat:lm_fortyseven_14 # scene:lm_backyard # cast:lm_he,lm_shi,lm_luo # speaker:you
  没有。这一场不是把我的剑打坏，是人没接住。 # beat:lm_fortyseven_15 # scene:lm_backyard # cast:lm_he,lm_shi,lm_luo # speaker:lm_shi # mood:lm_shi=intent
  你把布收起，没再从兵刃上替人找一个容易改的缺口。 # beat:lm_fortyseven_16 # scene:lm_backyard # cast:lm_he,lm_shi,lm_luo # speaker:narrator
  -> autumn

=== autumn ===
八月龙门秋会，来的人比问艺那几日更多。潼关樊承业找刀架，洛西沈长庚先嫌茶淡，广渡和尚拿着请帖找能坐下的地方。 # beat:lm_autumn_1 # scene:lm_autumn # cast:lm_fan,lm_shenchang,lm_guang # speaker:narrator
先把刀架稳。待会儿打倒了，人还说我们潼关连放刀都不会。 # beat:lm_autumn_2 # scene:lm_autumn # cast:lm_fan,lm_shenchang,lm_guang # speaker:lm_fan # mood:lm_fan=intent
你是怕刀架倒，还是怕自己倒？ # beat:lm_autumn_3 # scene:lm_autumn # cast:lm_fan,lm_shenchang,lm_guang # speaker:lm_shenchang # mood:lm_shenchang=amused
先让我坐。你们若要在门口打，贫僧把茶端远些。 # beat:lm_autumn_4 # scene:lm_autumn # cast:lm_fan,lm_shenchang,lm_guang # speaker:lm_guang # mood:lm_guang=calm
最重的请帖只有一句八月廿七章某当至。有人听见南榜末席，仍想拿末席两字开笑。 # beat:lm_autumn_5 # scene:lm_autumn # cast:lm_fan,lm_shenchang,lm_guang # speaker:narrator
* [把第三十六照实读，不借末席恭维地方前辈。 # cid:lm_correct_label]
  ~ lm_read_careful = true
  写的是南榜第三十六，不是河中第三十六。请帖也没替谁说稳胜。 # beat:lm_autumn_6 # scene:lm_autumn # cast:lm_fan,lm_shenchang,lm_guang # speaker:you
  没人请你先替我判。我倒愿看看差多少。 # beat:lm_autumn_7 # scene:lm_autumn # cast:lm_fan,lm_shenchang,lm_guang # speaker:lm_fan # mood:lm_fan=calm
  你把帖放正，后面再来人，也照这一行读。 # beat:lm_autumn_8 # scene:lm_autumn # cast:lm_fan,lm_shenchang,lm_guang # speaker:narrator
  -> fan_bout
* [不给传闻添话，先为长者和远客排好座位。 # cid:lm_offer_seat]
  ~ lm_read_careful = false
  我先认各位到场的名字。章先生来了，也得有地方放行李。 # beat:lm_autumn_9 # scene:lm_autumn # cast:lm_fan,lm_shenchang,lm_guang # speaker:you
  这话好。谁再来，也别把我的茶桌抬走。 # beat:lm_autumn_10 # scene:lm_autumn # cast:lm_fan,lm_shenchang,lm_guang # speaker:lm_guang # mood:lm_guang=amused
  你不跟着笑，却也没有指望沉默能让每个人都分清两张榜。 # beat:lm_autumn_11 # scene:lm_autumn # cast:lm_fan,lm_shenchang,lm_guang # speaker:narrator
  -> fan_bout

=== fan_bout ===
石惊川与樊承业打到一百六十余合，剑先刀半线。樊收刀，回到刀架旁先查有没有松。 # beat:lm_fan_bout_1 # scene:lm_autumn # cast:lm_fan,lm_shi,lm_shenchang # speaker:narrator
我输了，架没倒。别看了，下一场。 # beat:lm_fan_bout_2 # scene:lm_autumn # cast:lm_fan,lm_shi,lm_shenchang # speaker:lm_fan # mood:lm_fan=sharp
你还真给架子争口气。 # beat:lm_fan_bout_3 # scene:lm_autumn # cast:lm_fan,lm_shi,lm_shenchang # speaker:lm_shenchang # mood:lm_shenchang=amused
轮到沈长庚与贺景庭，四十二合沈自行罢手，回来一句话便把凑近的人都逗笑了。 # beat:lm_fan_bout_4 # scene:lm_autumn # cast:lm_fan,lm_shi,lm_shenchang # speaker:narrator
四十年没打，还是这副鬼样子！ # beat:lm_fan_bout_5 # scene:lm_autumn # cast:lm_fan,lm_shi,lm_shenchang # speaker:lm_shenchang # mood:lm_shenchang=sharp
骂的是贺，认输的也是他。贺在那头笑，没有请人替自己维护榜首体面。 # beat:lm_fan_bout_6 # scene:lm_autumn # cast:lm_fan,lm_shi,lm_shenchang # speaker:narrator
{
- lm_read_careful:
南榜第三十六照实读出，没人再拿末席两个字开笑。樊承业的刀架稳了，沈长庚的茶也照淡。 # beat:lm_fan_bout_7 # scene:lm_autumn # cast:lm_fan,lm_shi,lm_shenchang # speaker:narrator
- else:
你先认名字、排座位，没有替传闻添话。两场下来，末席与第三十六的分别，倒由场上自己打分明了。 # beat:lm_fan_bout_8 # scene:lm_autumn # cast:lm_fan,lm_shi,lm_shenchang # speaker:narrator
}
* [把水给刚下场的两位，各问一次要不要帮忙。 # cid:lm_offer_water]
  ~ lm_attended = true
  樊先生，沈先生，水都在这里。需要就叫，不需要我先不围着。 # beat:lm_fan_bout_9 # scene:lm_autumn # cast:lm_fan,lm_shi,lm_shenchang # speaker:you
  放下。你这小刀借来了，倒一直没去试。 # beat:lm_fan_bout_10 # scene:lm_autumn # cast:lm_fan,lm_shi,lm_shenchang # speaker:lm_fan # mood:lm_fan=calm
  我先守这边。外围那回还没试，等交清这里的事再去问。 # beat:lm_fan_bout_11 # scene:lm_autumn # cast:lm_fan,lm_shi,lm_shenchang # speaker:you
  沈长庚端过碗，嫌的还是茶淡，不是你没替他夸四十二合。 # beat:lm_fan_bout_12 # scene:lm_autumn # cast:lm_fan,lm_shi,lm_shenchang # speaker:narrator
  -> wooden
* [空下来便去外围试借来的木刀，承认自己也想上场。 # cid:lm_try_own]
  ~ lm_attended = false
  我去外围找同辈试一回，不占这边正式场。 # beat:lm_fan_bout_13 # scene:lm_autumn # cast:lm_fan,lm_shi,lm_shenchang # speaker:you
  去。别因为看见我们输，就觉得自己那一手不值得问。 # beat:lm_fan_bout_14 # scene:lm_autumn # cast:lm_fan,lm_shi,lm_shenchang # speaker:lm_fan # mood:lm_fan=intent
  你只练到自己还能停住的地方。没有人给这场记正式榜次，却有人认真指出你脚下挤了。 # beat:lm_fan_bout_15 # scene:lm_autumn # cast:lm_fan,lm_shi,lm_shenchang # speaker:narrator
  -> wooden

=== wooden ===
章复生到了，七十二岁，刚在南榜第三十六坐下不久。樊承业等人联名请他留手观艺，石惊川出面接剑。 # beat:lm_wooden_1 # scene:lm_nine # cast:lm_zhang_v2,lm_shi,lm_fan # speaker:narrator # action:秋会来客
我用木剑，石先生照用断云剑。 # beat:lm_wooden_2 # scene:lm_nine # cast:lm_zhang_v2,lm_shi,lm_fan # speaker:lm_zhang_v2 # mood:lm_zhang_v2=calm
好。 # beat:lm_wooden_3 # scene:lm_nine # cast:lm_zhang_v2,lm_shi,lm_fan # speaker:lm_shi # mood:lm_shi=intent
木剑没有锋，真剑有。你在白线外知道两件兵刃不一样，却不能因此预先说谁让到哪里。 # beat:lm_wooden_4 # scene:lm_nine # cast:lm_zhang_v2,lm_shi,lm_fan # speaker:narrator
第一剑，石的剑尖像追上一条已经过去的路。你刚要往前，旁边一位小弟子抱着剑鞘踉跄了一下。 # beat:lm_wooden_5 # scene:lm_nine # cast:lm_zhang_v2,lm_shi,lm_fan # speaker:narrator # cg:woodenInquiry # action:木剑与真剑
{
- lm_attended:
两碗水都问过，两位都自己端。此刻白线外，你守的还是这一套：不打扰，也不走远。 # beat:lm_wooden_6 # scene:lm_nine # cast:lm_zhang_v2,lm_shi,lm_fan # speaker:narrator # cg:none
- else:
外围那一试你自己也去了。此刻看章复生与石惊川，你知道站在线外的人手痒是什么滋味，也不催他们。 # beat:lm_wooden_7 # scene:lm_nine # cast:lm_zhang_v2,lm_shi,lm_fan # speaker:narrator
}
* [先接住弟子和剑鞘，错过后几剑也不挤回去。 # cid:lm_help_sheath]
  ~ lm_nine_help = true
  先站稳，鞘口朝下。别一摔把后面的人也戳着。 # beat:lm_wooden_8 # scene:lm_nine # cast:lm_zhang_v2,lm_shi,lm_fan # speaker:you
  你把剑鞘接住，转回头时已听见石惊川认输。 # beat:lm_wooden_9 # scene:lm_nine # cast:lm_zhang_v2,lm_shi,lm_fan # speaker:narrator # cg:none
  你看见第一剑，没有看全后八剑。后来不能替自己说成九剑全懂。 # beat:lm_wooden_10 # scene:lm_nine # cast:lm_zhang_v2,lm_shi,lm_fan # speaker:narrator
  -> nine
* [请身后同门照应，自己留在白线外看完九剑。 # cid:lm_keep_view]
  ~ lm_nine_help = false
  后面接一下。别让他靠到线里。 # beat:lm_wooden_11 # scene:lm_nine # cast:lm_zhang_v2,lm_shi,lm_fan # speaker:you
  身后有人应了，你才回头。第二剑到第九剑，石仍在找同一个地方，章手里木剑没有急着往前抢。 # beat:lm_wooden_12 # scene:lm_nine # cast:lm_zhang_v2,lm_shi,lm_fan # speaker:narrator
  九剑，你都看见了。问起为何第一剑便错，你仍没有一句能站得住的解。 # beat:lm_wooden_13 # scene:lm_nine # cast:lm_zhang_v2,lm_shi,lm_fan # speaker:narrator
  -> nine

=== nine ===
第几剑？ # beat:lm_nine_1 # scene:lm_nine # cast:lm_shi,lm_xu,lm_zhang_v2 # speaker:lm_xu # mood:lm_xu=neutral # action:剑停以后
第一剑。 # beat:lm_nine_2 # scene:lm_nine # cast:lm_shi,lm_xu,lm_zhang_v2 # speaker:lm_shi # mood:lm_shi=uneasy
后面八剑？ # beat:lm_nine_3 # scene:lm_nine # cast:lm_shi,lm_xu,lm_zhang_v2 # speaker:lm_xu # mood:lm_xu=neutral
在找第一剑为什么错。 # beat:lm_nine_4 # scene:lm_nine # cast:lm_shi,lm_xu,lm_zhang_v2 # speaker:lm_shi # mood:lm_shi=intent
你握了握借来的木刀，手心有汗。刀头才举半寸，手腕又先绷紧。许看过来，你把它放低，没抢着接石那句第一剑。 # beat:lm_nine_5 # scene:lm_nine # cast:lm_shi,lm_xu,lm_zhang_v2 # speaker:narrator
石先生，剑先收好。自己亲自试过，比从别人嘴里听差多少，难得些。 # beat:lm_nine_6 # scene:lm_nine # cast:lm_shi,lm_xu,lm_zhang_v2 # speaker:lm_zhang_v2 # mood:lm_zhang_v2=calm
他没有替石报一个新榜位。场边写的是这次问艺，不是一次看客投票的升榜。 # beat:lm_nine_7 # scene:lm_nine # cast:lm_shi,lm_xu,lm_zhang_v2 # speaker:narrator # fact:lm_nine
* [问许重山，我借刀时那一刀也在先定终点么？ # cid:lm_ask_first]
  ~ lm_linked = true
  我不是说自己懂章先生。我只是想起门里那根柱。 # beat:lm_nine_8 # scene:lm_nine # cast:lm_shi,lm_xu,lm_zhang_v2 # speaker:you
  是两场不同的手。能想起自己就好，别急着把别人的错也套进你的句子。 # beat:lm_nine_9 # scene:lm_nine # cast:lm_shi,lm_xu,lm_zhang_v2 # speaker:lm_xu # mood:lm_xu=intent
  他把木刀轻轻按回鞘里，答应回馆再让你试一次。 # beat:lm_nine_10 # scene:lm_nine # cast:lm_shi,lm_xu,lm_zhang_v2 # speaker:narrator
  -> night_outer
* [承认今天只看见结果，先把不懂的留着。 # cid:lm_leave_blank]
  ~ lm_linked = false
  我不懂。今天回去，不给人讲那九剑是什么秘法。 # beat:lm_nine_11 # scene:lm_nine # cast:lm_shi,lm_xu,lm_zhang_v2 # speaker:you
  讲你看见的，也讲哪几剑没看见。你不是来替他们做传说的。 # beat:lm_nine_12 # scene:lm_nine # cast:lm_shi,lm_xu,lm_zhang_v2 # speaker:lm_xu # mood:lm_xu=calm
  你松开握得太紧的手，没从那句第一剑里硬抠出一套口诀。 # beat:lm_nine_13 # scene:lm_nine # cast:lm_shi,lm_xu,lm_zhang_v2 # speaker:narrator
  -> night_outer

=== night_outer ===
秋会的灯渐少。你把借来的木刀倚好，石惊川还在廊边看自己的手，许重山从另一头提来半壶热水。 # beat:lm_night_outer_1 # scene:lm_nightouter # cast:lm_xu,lm_shi # speaker:narrator
壶是借的。你们今日若还要把什么练飞，别挑它。 # beat:lm_night_outer_2 # scene:lm_nightouter # cast:lm_xu,lm_shi # speaker:lm_xu # mood:lm_xu=amused
剑没坏。我只想再记一次第一剑。 # beat:lm_night_outer_3 # scene:lm_nightouter # cast:lm_xu,lm_shi # speaker:lm_shi # mood:lm_shi=intent
你也想说一句九剑如何，话到口边才想起，自己究竟亲眼看了几下。 # beat:lm_night_outer_4 # scene:lm_nightouter # cast:lm_xu,lm_shi # speaker:narrator
{
- lm_nine_help:
我只看见第一剑。后八剑转身接人去了，不敢替自己补全。 # beat:lm_night_outer_5 # scene:lm_nightouter # cast:lm_xu,lm_shi # speaker:you
第一剑够我想了。你看见哪一处？ # beat:lm_night_outer_6 # scene:lm_nightouter # cast:lm_xu,lm_shi # speaker:lm_shi # mood:lm_shi=neutral
- else:
我看见九剑，却还说不清第一剑为何错。 # beat:lm_night_outer_7 # scene:lm_nightouter # cast:lm_xu,lm_shi # speaker:you
我也在找。你先说你真看见的，不必凑一个替我解剑的人。 # beat:lm_night_outer_8 # scene:lm_nightouter # cast:lm_xu,lm_shi # speaker:lm_shi # mood:lm_shi=neutral
}
* [从脚说起：想起自己出刀后两脚挤住，明早请许推一推。 # cid:lm_night_foot]
  ~ lm_night_read = 1
  我只会拿自己的脚来比。刚才那一步，若前头不肯退，我脚下还有没有地方？ # beat:lm_night_outer_9 # scene:lm_nightouter # cast:lm_xu,lm_shi # speaker:you
  明早推一下便知道。别今夜先替自己站稳。 # beat:lm_night_outer_10 # scene:lm_nightouter # cast:lm_xu,lm_shi # speaker:lm_xu # mood:lm_xu=neutral
  石没答章该怎样动。他也没有让你的脚先替自己的剑认一个错处。 # beat:lm_night_outer_11 # scene:lm_nightouter # cast:lm_xu,lm_shi # speaker:narrator
  -> night_prepare
* [从手说起：把攥紧的刀柄放松，明早请许看出刀以后肘还能往哪落。 # cid:lm_night_hand]
  ~ lm_night_read = 2
  我看您剑停以后，还一直握着。换成我，手大概又要先攥死。 # beat:lm_night_outer_12 # scene:lm_nightouter # cast:lm_xu,lm_shi # speaker:you
  现在攥着，是怕你们拿去替我再打。 # beat:lm_night_outer_13 # scene:lm_nightouter # cast:lm_xu,lm_shi # speaker:lm_shi # mood:lm_shi=amused
  他的玩笑听见就好。你的肘，明早自己摆出来。 # beat:lm_night_outer_14 # scene:lm_nightouter # cast:lm_xu,lm_shi # speaker:lm_xu # mood:lm_xu=neutral
  -> night_prepare
* [从剑线说起：只认第一剑追去的地方，明早用木刀试那里是否真还空着。 # cid:lm_night_line]
  ~ lm_night_read = 3
  我以为那一条路空着，才发现剑尖像在追已经过去的地方。 # beat:lm_night_outer_15 # scene:lm_nightouter # cast:lm_xu,lm_shi # speaker:you
  我当时也以为在。你别一知道输了，就说起初从没该问。 # beat:lm_night_outer_16 # scene:lm_nightouter # cast:lm_xu,lm_shi # speaker:lm_shi # mood:lm_shi=neutral
  你把原先想写的“无用”划掉，只留下自己看错的一条线。 # beat:lm_night_outer_17 # scene:lm_nightouter # cast:lm_xu,lm_shi # speaker:narrator
  -> night_prepare
* [从求胜的心说起：承认自己也想借一刀赢人，明早试能否在想赢时仍看对手。 # cid:lm_night_want]
  ~ lm_night_read = 4
  我借刀时也想赢一场。看您输了，忽然连自己那一下都不敢问。 # beat:lm_night_outer_18 # scene:lm_nightouter # cast:lm_xu,lm_shi # speaker:you
  我这九剑已经出完了。你那一刀还举在手里，怎么先要替我收起来？ # beat:lm_night_outer_19 # scene:lm_nightouter # cast:lm_xu,lm_shi # speaker:lm_shi # mood:lm_shi=intent
  明早别先说不怕。真有人走到面前，再看你还记不记得他会动。 # beat:lm_night_outer_20 # scene:lm_nightouter # cast:lm_xu,lm_shi # speaker:lm_xu # mood:lm_xu=neutral
  -> night_prepare

=== night_prepare ===
你记好明早要试的那一处。许说到时只许讲自己的脚与手，不许借两位名家的输赢将一句话讲大。 # beat:lm_night_prepare_1 # scene:lm_nightouter # cast:lm_xu,lm_shi # speaker:narrator
先去睡。练到这里不懂，睡醒也未必懂，至少不欠一宿觉。 # beat:lm_night_prepare_2 # scene:lm_nightouter # cast:lm_xu,lm_shi # speaker:lm_xu # mood:lm_xu=neutral
石将剑收好，各自散去。你回客舍，没有跟着送入贺老的内院。 # beat:lm_night_prepare_3 # scene:lm_nightouter # cast:lm_xu,lm_shi # speaker:narrator
-> night_private

=== night_private ===
同一夜，视角转为九十六岁的贺景庭。你与章复生在内院坐下，门人已退，杯里只添了寻常热茶。 # beat:lm_night_private_1 # scene:lm_nightprivate # cast:lm_zhang_v2 # speaker:narrator # action:同夜 · 贺景庭视角
石先生的剑，已经有资格让路榜和大武会认真看了。再往前，才是南北榜。 # beat:lm_night_private_2 # scene:lm_nightprivate # cast:lm_zhang_v2 # speaker:lm_zhang_v2 # mood:lm_zhang_v2=neutral # cg:longmenNight # action:灯下 · 两位来客
白日他只接九剑，话里却没有把那个肯连问的人轻轻略过去。你将杯端近一点，问起自己。 # beat:lm_night_private_3 # scene:lm_nightprivate # cast:lm_zhang_v2 # speaker:narrator
我呢？ # beat:lm_night_private_4 # scene:lm_nightprivate # cast:lm_zhang_v2 # speaker:you # cg:none
章沉默片刻。 # beat:lm_night_private_5 # scene:lm_nightprivate # cast:lm_zhang_v2 # speaker:narrator
贺老若年轻二十年，会有人来请你试榜。 # beat:lm_night_private_6 # scene:lm_nightprivate # cast:lm_zhang_v2 # speaker:lm_zhang_v2 # mood:lm_zhang_v2=intent
那就是差一点。 # beat:lm_night_private_7 # scene:lm_nightprivate # cast:lm_zhang_v2 # speaker:you
你笑。章没有否认。 # beat:lm_night_private_8 # scene:lm_nightprivate # cast:lm_zhang_v2 # speaker:narrator
差的那一点，有时候就是一辈子。 # beat:lm_night_private_9 # scene:lm_nightprivate # cast:lm_zhang_v2 # speaker:lm_zhang_v2 # mood:lm_zhang_v2=neutral
* [不讨一个今日必能进榜的改口，问余下还愿怎样练。 # cid:lm_he_ask_remaining]
  ~ lm_he_night = true
  年轻二十年不成了。明日那一掌，我还想再走。 # beat:lm_night_private_10 # scene:lm_nightprivate # cast:lm_zhang_v2 # speaker:you
  那便走。旁人说到哪里，也不能替您把手抬起来。 # beat:lm_night_private_11 # scene:lm_nightprivate # cast:lm_zhang_v2 # speaker:lm_zhang_v2 # mood:lm_zhang_v2=neutral
  你试着把白日那一掌走到半途，停住。章仍坐着等，没有替这一下另记胜负。 # beat:lm_night_private_12 # scene:lm_nightprivate # cast:lm_zhang_v2 # speaker:narrator
  -> night_last_cup
* [先替下一位问路的人留句实话，不把差一辈子讲成从此都不必试。 # cid:lm_he_ask_next_people]
  ~ lm_he_night = false
  以后石先生再来，我总不能只让他听我也差一点。 # beat:lm_night_private_13 # scene:lm_nightprivate # cast:lm_zhang_v2 # speaker:you
  他今日问过您，才会有下一问。晚辈那九剑也只答了今日。 # beat:lm_night_private_14 # scene:lm_nightprivate # cast:lm_zhang_v2 # speaker:lm_zhang_v2 # mood:lm_zhang_v2=neutral
  你点头，仍记得他承认的一点，没有让他再添一句其实已经够了。 # beat:lm_night_private_15 # scene:lm_nightprivate # cast:lm_zhang_v2 # speaker:narrator
  -> night_last_cup

=== night_last_cup ===
茶可以再添，年岁添不得。你没有叫人将今晚的话写成请你试南榜的邀帖。 # beat:lm_night_last_cup_1 # scene:lm_nightprivate # cast:lm_zhang_v2 # speaker:narrator
壶里还有。别叫年轻人半夜又跑。 # beat:lm_night_last_cup_2 # scene:lm_nightprivate # cast:lm_zhang_v2 # speaker:you
那就再坐一会儿。 # beat:lm_night_last_cup_3 # scene:lm_nightprivate # cast:lm_zhang_v2 # speaker:lm_zhang_v2 # mood:lm_zhang_v2=amused
院里风进来，灯芯偏到一边。你把灯罩转了半面，章续上茶，两个人就又坐了一会儿。 # beat:lm_night_last_cup_4 # scene:lm_nightprivate # cast:lm_zhang_v2 # speaker:narrator
-> morning_trial

=== morning_trial ===
次晨，视角回到镇河门门人。贺与章的私谈没有人为你复述；你仍只知道自己昨夜答应要试的那一处。 # beat:lm_morning_trial_1 # scene:lm_morning # cast:lm_xu # speaker:narrator # action:次晨 · 回到门人视角
来。昨晚怎么说的？ # beat:lm_morning_trial_2 # scene:lm_morning # cast:lm_xu # speaker:lm_xu # mood:lm_xu=neutral
你举木刀，没有先说两位老人已经替你讲明白了。 # beat:lm_morning_trial_3 # scene:lm_morning # cast:lm_xu # speaker:narrator
{
- not lm_stopped and not lm_share_load:
你抬刀时肩臂还疼。许先托住刀背，只让你试起手的一小段，不许用伤臂硬顶；他说要看的仍是你怎样留路，不是今日能举多重。 # beat:lm_morning_trial_4 # scene:lm_morning # cast:lm_xu # speaker:narrator
}
{
- lm_night_read == 1:
你将后脚腾开，自认这回留够了。许用两指轻引袖口，前脚先转进来，后脚那一点空仍被自己挤掉。 # beat:lm_morning_trial_5 # scene:lm_morning # cast:lm_xu # speaker:narrator
知道有地方，还要走得到。 # beat:lm_morning_trial_6 # scene:lm_morning # cast:lm_xu # speaker:lm_xu # mood:lm_xu=neutral
你重新摆，第二遍只求自己真能退半步，不替石说章的脚下必是这样。 # beat:lm_morning_trial_7 # scene:lm_morning # cast:lm_xu # speaker:narrator
- lm_night_read == 2:
你先松握柄的手，许托一下刀背，右肘却仍往原想落的地方赶。手松了，肘还在等那个早已定好的末尾。 # beat:lm_morning_trial_8 # scene:lm_morning # cast:lm_xu # speaker:narrator
松手不是不用管这只手。 # beat:lm_morning_trial_9 # scene:lm_morning # cast:lm_xu # speaker:lm_xu # mood:lm_xu=neutral
你从起手重走，不再只在刀停后把五指放松给人看。 # beat:lm_morning_trial_10 # scene:lm_morning # cast:lm_xu # speaker:narrator
- lm_night_read == 3:
许给你留一条空线，等你出刀，自己转开半步。你刀头仍追那条原来空着的线，眼睛比人慢回来。 # beat:lm_morning_trial_11 # scene:lm_morning # cast:lm_xu # speaker:narrator
路空着，也得问现在是谁站在那里。 # beat:lm_morning_trial_12 # scene:lm_morning # cast:lm_xu # speaker:lm_xu # mood:lm_xu=neutral
你将那条记过的线放下，第二遍先看许，不拿画对一条线说成已看懂九剑。 # beat:lm_morning_trial_13 # scene:lm_morning # cast:lm_xu # speaker:narrator
- else:
你说这回先看人。许只往前走，你想赢的一下已经先追出去，自己刚才那句等不得半息。 # beat:lm_morning_trial_14 # scene:lm_morning # cast:lm_xu # speaker:narrator
人来了。还看见么？ # beat:lm_morning_trial_15 # scene:lm_morning # cast:lm_xu # speaker:lm_xu # mood:lm_xu=neutral
你笑不出来，又重新摆。想赢仍在，这回先让它和眼前那个人一起留着，不靠闭上眼说自己不争。 # beat:lm_morning_trial_16 # scene:lm_morning # cast:lm_xu # speaker:narrator
}
* [请许再推一回，自己从刚才没接上的地方重做，耽误一些收拾行装的时辰。 # cid:lm_repeat_with_push]
  ~ lm_morning_try = true
  这一处再试一遍。别替我摆稳了，才让我说会。 # beat:lm_morning_trial_17 # scene:lm_morning # cast:lm_xu # speaker:you
  这回倒知道差事要多做一遍。 # beat:lm_morning_trial_18 # scene:lm_morning # cast:lm_xu # speaker:lm_xu # mood:lm_xu=amused
  又试两回，许才叫停。行李已经搬到院门，外头先后喊过你两声，你收刀以后还得过去交接。 # beat:lm_morning_trial_19 # scene:lm_morning # cast:lm_xu # speaker:narrator
  -> morning_return
* [把未接上的一处说清，约定回门再试，先去交清答应的行装与馆务。 # cid:lm_mark_not_yet]
  ~ lm_morning_try = false
  还没做到。我先交差，第四日回馆，再请您看这一处。 # beat:lm_morning_trial_20 # scene:lm_morning # cast:lm_xu # speaker:you
  写在借刀册上。第四日若还举不动，先说；别拿替别人教过课当你自己试过。 # beat:lm_morning_trial_21 # scene:lm_morning # cast:lm_xu # speaker:lm_xu # mood:lm_xu=neutral
  你把木刀放下，去接原定差事。那一次练习没有因说清还不会就自动还完。 # beat:lm_morning_trial_22 # scene:lm_morning # cast:lm_xu # speaker:narrator
  -> morning_return

=== morning_return ===
收拾去处之前，石来取自己的行装。你把记下的脚与肘向他摆了一回，只说今晨哪一处又挤住，还没接上。 # beat:lm_morning_return_1 # scene:lm_road # cast:lm_xu,lm_shi # speaker:narrator
我今日也还没找到第一剑。没找到，也能先去问下一处肯不肯见。 # beat:lm_morning_return_2 # scene:lm_road # cast:lm_xu,lm_shi # speaker:lm_shi # mood:lm_shi=intent
许将借刀处空出来，等你把今日答应的事办完。 # beat:lm_morning_return_3 # scene:lm_road # cast:lm_xu,lm_shi # speaker:narrator
{
- lm_morning_try:
同门替你扎好半包干粮，自己还没吃早饭。你把热粥端回来，等他吃完才交接；原定早走的那半刻，已经补不回来了。 # beat:lm_morning_return_4 # scene:lm_road # cast:lm_xu,lm_shi # speaker:narrator
- else:
木刀架旁留着你自己写的回试日子。许没有替你改成已教会，石也没有替你把那次练习算进今天行程里。 # beat:lm_morning_return_5 # scene:lm_road # cast:lm_xu,lm_shi # speaker:narrator
}
-> where

=== where ===
秋会散时，木刀要还，路也要分。石惊川还想继续看更大的会，许重山已把馆里的练刀时辰重新排过。 # beat:lm_where_1 # scene:lm_road # cast:lm_xu,lm_shi,lm_fan # speaker:narrator
我还往前走。你若想同行一段，先问清门里的差事，不要到半路才说替谁告过假。 # beat:lm_where_2 # scene:lm_road # cast:lm_xu,lm_shi,lm_fan # speaker:lm_shi # mood:lm_shi=neutral
馆里缺人教起手，我也缺个人试新刀。你留下，不是要替我守住输不起的门面。 # beat:lm_where_3 # scene:lm_road # cast:lm_xu,lm_shi,lm_fan # speaker:lm_xu # mood:lm_xu=neutral
这会倒像还有一场。你选完别叫我们判胜负。 # beat:lm_where_4 # scene:lm_road # cast:lm_xu,lm_shi,lm_fan # speaker:lm_fan # mood:lm_fan=amused
{
- lm_linked:
门里那根柱与第一剑是两场不同的手——许重山这样说，还是让你回了馆再试一次。此刻分路，你仍带着那一问。 # beat:lm_where_5 # scene:lm_road # cast:lm_xu,lm_shi,lm_fan # speaker:narrator
- else:
不懂的留着，你没把九剑讲成秘法。此刻分路，你带走的不是答案，是那句还没能说清的话。 # beat:lm_where_6 # scene:lm_road # cast:lm_xu,lm_shi,lm_fan # speaker:narrator
}
{
- lm_he_night:
那夜内院灯下的话无人向你复述。你只记得次日清晨，贺老照旧一招一掌走得认真，像还想再走许多年。 # beat:lm_where_7 # scene:lm_road # cast:lm_xu,lm_shi,lm_fan # speaker:narrator
- else:
那夜内院灯下的话无人向你复述。你后来只听说，有人替下一位问路的人留了一句实话。 # beat:lm_where_8 # scene:lm_road # cast:lm_xu,lm_shi,lm_fan # speaker:narrator
}
{
- not lm_stopped and not lm_share_load:
你抬包时肩臂一痛。练刀和搬架的两回逞强，没在九剑之后忽然变成懂事。 # beat:lm_where_9 # scene:lm_road # cast:lm_xu,lm_shi,lm_fan # speaker:narrator
这几日别出力试手。去哪条路，也先认这只手。 # beat:lm_where_10 # scene:lm_road # cast:lm_xu,lm_shi,lm_fan # speaker:lm_xu # mood:lm_xu=sharp
- else:
你把行囊从肩头换到手里，先试了一下重量。路和练刀都不必一次把力花尽。 # beat:lm_where_11 # scene:lm_road # cast:lm_xu,lm_shi,lm_fan # speaker:narrator
}
* [还刀，办完门里的交代，再随石惊川走一段。 # cid:lm_travel_choice]
  ~ lm_future = 1
  我先还刀，交清借的物件和这月的事。能走哪段，今夜写明，不写追随一生。 # beat:lm_where_12 # scene:lm_road # cast:lm_xu,lm_shi,lm_fan # speaker:you
  好。我也不是走到哪里都能替你安排一场胜。 # beat:lm_where_13 # scene:lm_road # cast:lm_xu,lm_shi,lm_fan # speaker:lm_shi # mood:lm_shi=calm
  能这样想，倒不怕你把门里的门匾背出去。 # beat:lm_where_14 # scene:lm_road # cast:lm_xu,lm_shi,lm_fan # speaker:lm_xu # mood:lm_xu=amused
  -> leave
* [留馆试新刀，也照顾比自己更晚来的门人。 # cid:lm_home_choice]
  ~ lm_future = 2
  我留下。借刀时问不出的那一句，先练到能自己说清。 # beat:lm_where_15 # scene:lm_road # cast:lm_xu,lm_shi,lm_fan # speaker:you
  那明日开门。你教起手，我看你教，不许把学生当不会走的柱。 # beat:lm_where_16 # scene:lm_road # cast:lm_xu,lm_shi,lm_fan # speaker:lm_xu # mood:lm_xu=intent
  路过河中，我再来问。不是问你现在该到哪个榜。 # beat:lm_where_17 # scene:lm_road # cast:lm_xu,lm_shi,lm_fan # speaker:lm_shi # mood:lm_shi=neutral
  -> leave

=== leave ===
你把木刀交还，刀背朝外，刃口不对人。离开的路与留下的门，终于各有一件明日要做的事。 # beat:lm_leave_1 # scene:lm_road # cast:lm_xu,lm_shi # speaker:narrator
{
- lm_future == 1 and lm_sword_respect:
到镇外那一段，你可替我带着剑。不是替我拿败的证据，是我有手腾出来买干粮。 # beat:lm_leave_2 # scene:lm_road # cast:lm_xu,lm_shi # speaker:lm_shi # mood:lm_shi=calm
您要取时说。我不替您拔。 # beat:lm_leave_3 # scene:lm_road # cast:lm_xu,lm_shi # speaker:you
他把剑鞘交来，你认得那一回捡起的温度。 # beat:lm_leave_4 # scene:lm_road # cast:lm_xu,lm_shi # speaker:narrator
- else:
木刀放原处。下次借，先告诉我拿去做什么。 # beat:lm_leave_5 # scene:lm_road # cast:lm_xu,lm_shi # speaker:lm_xu # mood:lm_xu=neutral
会说。不是只说去看看江湖。 # beat:lm_leave_6 # scene:lm_road # cast:lm_xu,lm_shi # speaker:you
}
{
- lm_future == 1 and not lm_morning_try:
你先只陪石走河中近处三日，第四日回镇河补试。石把前一镇的会面处写给你，他先去问自己的剑，不等你办完每一件事才动身。 # beat:lm_leave_7 # scene:lm_road # cast:lm_xu,lm_shi # speaker:narrator
}
{
- lm_future == 1:
{
- not lm_stopped and not lm_share_load:
上路头三日，你替石惊川认帖、记客舍，却没能如借刀那日所想，再找人试手。刀柄一举到肩上，酸痛便先把手拉低。 # beat:lm_leave_8 # scene:lm_road # cast:lm_shi # speaker:narrator
我去问我的剑，你养你的手。别跟到场边，便算两件都做完了。 # beat:lm_leave_9 # scene:lm_road # cast:lm_shi # speaker:lm_shi # mood:lm_shi=intent
那三日没打过的，我不记成已经试过。 # beat:lm_leave_10 # scene:lm_road # cast:lm_shi # speaker:you
借刀钱仍留在袋里。等能把那只手抬稳，才再问人肯不肯借刀；没做成的三日练习不算补过了。 # beat:lm_leave_11 # scene:lm_road # cast:lm_shi # speaker:narrator
- else:
到第一处歇脚地，你按约办完认帖的事，又借到一把木刀试起手。石惊川看你走完，没有替你把人家的第二刀挡开。 # beat:lm_leave_12 # scene:lm_road # cast:lm_shi # speaker:narrator
丢了自己捡，我还赶着吃饭。 # beat:lm_leave_13 # scene:lm_road # cast:lm_shi # speaker:lm_shi # mood:lm_shi=amused
还在我手里，先让我收好。 # beat:lm_leave_14 # scene:lm_road # cast:lm_shi # speaker:you
你收刀比出刀慢一点。这回走出去的不是整套十七刀，却确是你自己接住的一步。 # beat:lm_leave_15 # scene:lm_road # cast:lm_shi # speaker:narrator
}
- else:
{
- not lm_stopped and not lm_share_load:
留馆第一回课，你想把起手举给新门人看，肩臂却抬不到原处。许重山接过刀，让你说，他来走。 # beat:lm_leave_16 # scene:lm_afterhall # cast:lm_xu # speaker:narrator
话在这里，脚怎么到了那边？先教这一句，别抢下一刀。 # beat:lm_leave_17 # scene:lm_afterhall # cast:lm_xu # speaker:lm_xu # mood:lm_xu=sharp
我说早了。这里先站住。 # beat:lm_leave_18 # scene:lm_afterhall # cast:lm_xu # speaker:you
这三日你只排步位、改自己说不清的指令，等肩能举起，才补那次没做成的示范。 # beat:lm_leave_19 # scene:lm_afterhall # cast:lm_xu # speaker:narrator
- else:
留馆第一回课，学生把第七刀走得很响，停下却先问你下一步在哪儿。你没学许重山压刀，先让他自己转过去试一回。 # beat:lm_leave_20 # scene:lm_afterhall # cast:lm_xu # speaker:narrator
他今日倒比你借刀那日问得快。 # beat:lm_leave_21 # scene:lm_afterhall # cast:lm_xu # speaker:lm_xu # mood:lm_xu=amused
那得让他留到能自己答。别一夸，又只顾着劈响。 # beat:lm_leave_22 # scene:lm_afterhall # cast:lm_xu # speaker:you
他第二遍仍撞了半步，至少这回肯自己停住。 # beat:lm_leave_23 # scene:lm_afterhall # cast:lm_xu # speaker:narrator
}
}
{
- not lm_morning_try:
秋会散后第四日，你按借刀册上的日期到许面前。写着自己名字的那页先放在架上，拿刀时许按住刀背，等你说这一回要试哪一处。 # beat:lm_leave_24 # scene:lm_returntrial # cast:lm_xu # speaker:narrator
{
- not lm_stopped and not lm_share_load:
肩臂还没全好，许仍托着刀背。你先报上回卡的是哪一处，只试那一小段，刀不硬举过肩，痛了便停。 # beat:lm_leave_25 # scene:lm_returntrial # cast:lm_xu # speaker:narrator
- else:
许让你先说原先没接上的那一处，再起刀。这一次不赶着给学生看，你先把自己的问题摆在他面前。 # beat:lm_leave_26 # scene:lm_returntrial # cast:lm_xu # speaker:narrator
}
{
- lm_night_read == 1:
补试这一回，你先腾后脚。许轻引袖口，前脚又挤了进去；你停在两脚将撞的地方，问那一步应从哪儿让。 # beat:lm_leave_27 # scene:lm_returntrial # cast:lm_xu # speaker:narrator
}
{
- lm_night_read == 2:
补试这一回，你松了柄，右肘却仍追原来的末尾。许托住刀，你将肘退回一点，才发现刀头到不了旧画的位置。 # beat:lm_leave_28 # scene:lm_returntrial # cast:lm_xu # speaker:narrator
}
{
- lm_night_read == 3:
补试这一回，许从刀线旁移开。你没有继续追那条空线，眼睛转回人身上时仍慢了半拍，便请他照样再走一次。 # beat:lm_leave_29 # scene:lm_returntrial # cast:lm_xu # speaker:narrator
}
{
- lm_night_read == 4:
补试这一回，许一近身，你想赢的那一下又先抢了出去。你自己叫停，没有说想赢已错，只重看他走来时你漏掉的半步。 # beat:lm_leave_30 # scene:lm_returntrial # cast:lm_xu # speaker:narrator
}
{
- lm_future == 1:
补试占去半日，石已到了前一镇。你照着他写的会面处赶路，晚饭时才到；他已把自己的问帖递过，不替你再排一次场。 # beat:lm_leave_31 # scene:lm_returntrial # cast:lm_xu # speaker:narrator
- else:
这半日许留给你的脚步，学生的示范请同门先接。你课后再去把没带完的那一段交清，不把留馆说成从此有空同时做完所有事。 # beat:lm_leave_32 # scene:lm_returntrial # cast:lm_xu # speaker:narrator
}
}
-> fiveyears

=== fiveyears ===
五年以后。贺景庭百岁后自请退榜，河中第一终于换成罗天庆。你到席前时，门人已经摆过一轮酒碗。 # beat:lm_fiveyears_1 # scene:lm_fiveyears # cast:lm_luo,lm_xu # speaker:narrator
酒撤了。 # beat:lm_fiveyears_2 # scene:lm_fiveyears # cast:lm_luo,lm_xu # speaker:lm_luo # mood:lm_luo=uneasy
门人都来贺，你至少同他们讲清。 # beat:lm_fiveyears_3 # scene:lm_fiveyears # cast:lm_luo,lm_xu # speaker:lm_xu # mood:lm_xu=neutral
我等的是赢他，不是等他走。 # beat:lm_fiveyears_4 # scene:lm_fiveyears # cast:lm_luo,lm_xu # speaker:lm_luo # mood:lm_luo=sharp
他没有改旧录里十九、三十二、四十一招的三次败。贺的退，也没有把他这一辈子的认真变成笑话。 # beat:lm_fiveyears_5 # scene:lm_fiveyears # cast:lm_luo,lm_xu # speaker:narrator # fact:lm_retire
* [回门里照实讲撤酒缘故，不替罗老编一场没打过的胜。 # cid:lm_keep_record]
  我会照这句讲。不写您赢了贺老，只写他自请退榜。 # beat:lm_fiveyears_6 # scene:lm_fiveyears # cast:lm_luo,lm_xu # speaker:you
  就这些。别替我加一句其实早该赢。 # beat:lm_fiveyears_7 # scene:lm_fiveyears # cast:lm_luo,lm_xu # speaker:lm_luo # mood:lm_luo=calm
  你收起回帖，没有把榜位和最后一场较艺混成一笔。 # beat:lm_fiveyears_8 # scene:lm_fiveyears # cast:lm_luo,lm_xu # speaker:narrator
  -> ending
* [问罗老还会不会继续练，不拿榜首当终点。 # cid:lm_ask_next]
  明日还开馆么？ # beat:lm_fiveyears_9 # scene:lm_fiveyears # cast:lm_luo,lm_xu # speaker:you
  开。榜位先让他们记，明日那一课照旧。 # beat:lm_fiveyears_10 # scene:lm_fiveyears # cast:lm_luo,lm_xu # speaker:lm_luo # mood:lm_luo=intent
  他拿起茶碗，酒没回来，席上也终于有人坐下说起明日。 # beat:lm_fiveyears_11 # scene:lm_fiveyears # cast:lm_luo,lm_xu # speaker:narrator
  -> ending

=== ending ===
今年洛阳大会的消息也传到河中。章复生仍是南榜三十六人之一；石惊川走到那儿，才得到更大的会真正记住他的机会。 # beat:lm_ending_1 # scene:lm_fiveyears # cast:none # speaker:narrator
{
- lm_future == 1:
你将席上听见的撤酒缘故另写一行，和沿路应过的回帖分开收，哪封去镇河、哪封交石，封面都写清。 # beat:lm_ending_2 # scene:lm_fiveyears # cast:none # speaker:narrator
{
- lm_early_route == 2 and lm_early_practice:
石交来的下一封帖只夹了会面处。你按原字递出，拿到回话再去找他，他先去问自己的剑。 # beat:lm_ending_3 # scene:lm_fiveyears # cast:none # speaker:narrator
}
{
- lm_early_route == 2 and not lm_early_practice:
再接石的问帖，你先当面读完原字。石听你读准，才把帖封好交来；这回没有替你补愿问第一。你拿到答复以后，再报哪个门人收过。 # beat:lm_ending_4 # scene:lm_fiveyears # cast:none # speaker:narrator
}
{
- lm_early_route == 1:
临走前，新门人到院门送你，你先问下一班由谁接。他真叫来接班的人，你才带着自己的行包出门。 # beat:lm_ending_5 # scene:lm_fiveyears # cast:none # speaker:narrator
}
后来回镇河门，你先把沿途答应的杂事办完，再问能不能借一把出门用的木刀。许让你取出借刀册，你在旧名字下写了新的归期。 # beat:lm_ending_6 # scene:lm_fiveyears # cast:none # speaker:narrator # ending:lm_travel
-> END
- else:
{
- lm_early_route == 1:
{
- lm_early_practice:
最初与你撞过退线的门人，如今能接下一班。你把课册交给他，先到许面前试自己改过的起手；院里没有因为你走开半刻便停课。 # beat:lm_ending_7 # scene:lm_fiveyears # cast:none # speaker:narrator
- else:
你记得那张画完却没走过的纸，曾让抬架的人在门口多等。如今有人来借课册，你先陪他走窄处，回来再把未交完的那一班接上。 # beat:lm_ending_8 # scene:lm_fiveyears # cast:none # speaker:narrator
}
- else:
{
- lm_early_practice:
有远来的问帖到馆，你让送帖人自己把愿问哪一场说完，再把名字记下。弟子在旁学着收话，不替客人先缩成随便试手。 # beat:lm_ending_9 # scene:lm_fiveyears # cast:none # speaker:narrator
- else:
有人替外客把问帖改成客套话，你叫他停住，请来客重新读原字。你先前说轻过石的那一帖，今日不让学生再替别人改掉要问的东西。 # beat:lm_ending_10 # scene:lm_fiveyears # cast:none # speaker:narrator
}
}
五年过去，你没靠留守换一个小榜名次。有人把木刀递回来，肯承认自己说不清；这次轮到你留在门口，让他先试。 # beat:lm_ending_11 # scene:lm_fiveyears # cast:none # speaker:narrator # ending:lm_home
-> END
}
