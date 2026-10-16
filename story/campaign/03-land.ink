
=== ridge_load ===
往前不远，再翻一个坡就是。 # beat:c_ridge_load_1 # scene:ridge # cast:pei,fan,ming # speaker:fan # mood:fan=neutral
你从渡口开始，已经说了五次一个坡。 # beat:c_ridge_load_2 # scene:ridge # cast:pei,fan,ming # speaker:ming # mood:ming=uneasy
他每次都没说错。错的是你每次都信最后一个。 # beat:c_ridge_load_3 # scene:ridge # cast:pei,fan,ming # speaker:pei # mood:pei=neutral
药车陷进湿泥，范遇把扁担垫在轮下，明栓护着新木剑，不知先放哪只手。 # beat:c_ridge_load_4 # scene:ridge # cast:pei,fan,ming # speaker:narrator
药箱不能淋，车也不能丢。先别一起往一边抬。 # beat:c_ridge_load_5 # scene:ridge # cast:pei,fan,ming # speaker:you
听你的。定谁发口令，别三个人各喊一二三。 # beat:c_ridge_load_6 # scene:ridge # cast:pei,fan,ming # speaker:pei # mood:pei=neutral
能喊慢一点最好。我气还没喘匀。 # beat:c_ridge_load_7 # scene:ridge # cast:pei,fan,ming # speaker:fan # mood:fan=neutral
* [卸下重箱，两人守药，两人推车。 # cid:load_unload]
  ~ supplies = true
  人多不是力就齐。先卸这一箱，我守着，谁也别单独离队。 # beat:c_ridge_load_8 # scene:ridge # cast:pei,fan,ming # speaker:you
  慢了一刻，手脚都还好。记住，赶路最怕把人赶散。 # beat:c_ridge_load_9 # scene:ridge # cast:pei,fan,ming # speaker:pei # mood:pei=calm
  -> ridge_toll
* [直接肩抬过坑，抢回赶路的时间。 # cid:load_shoulder]
  ~ wound = wound + 1
  我在这边，等范师傅喘匀。起—— # beat:c_ridge_load_10 # scene:ridge # cast:pei,fan,ming # speaker:you
  车轮抬过泥坑，你肩上也被压得发疼。一小段快路换来半路沉重。 # beat:c_ridge_load_11 # scene:ridge # cast:pei,fan,ming # speaker:narrator
  快了，但下个坡换人扛。别让一个人把队伍的力气先用完。 # beat:c_ridge_load_12 # scene:ridge # cast:pei,fan,ming # speaker:pei # mood:pei=neutral
  -> ridge_toll

=== ridge_toll ===
坡口有人拦道。许竞川用刀鞘压着一根横木，身后两名脚夫正吵谁踩坏了谁的竹筐。 # beat:c_ridge_toll_1 # scene:ridge # cast:xu,fan,pei # speaker:narrator
别笑，我不是收过路钱。横木下面有辆翻车，先别往前。 # beat:c_ridge_toll_2 # scene:ridge # cast:xu,fan,pei # speaker:xu # mood:xu=sharp
他们说我们车轮宽，压了路沿，得赔。 # beat:c_ridge_toll_3 # scene:ridge # cast:xu,fan,pei # speaker:fan # mood:fan=neutral
赔多少先看东西，不能一句有药就让所有人让路。 # beat:c_ridge_toll_4 # scene:ridge # cast:xu,fan,pei # speaker:pei # mood:pei=neutral
另一家也得靠路吃饭。 # beat:c_ridge_toll_5 # scene:ridge # cast:xu,fan,pei # speaker:you
我在这儿站半刻了。你们谁能先让他们把嗓门收回去？ # beat:c_ridge_toll_6 # scene:ridge # cast:xu,fan,pei # speaker:xu # mood:xu=neutral
* [先借扁担抬翻车，赔偿留姓名回头算。 # cid:toll_share]
  ~ bridge_help = true
  谁的东西谁记着。先把车抬正，别让下一辆也翻。 # beat:c_ridge_toll_7 # scene:ridge # cast:xu,fan,pei # speaker:you
  这句他们听得进。刀鞘借你撑底，我来抬。 # beat:c_ridge_toll_8 # scene:ridge # cast:xu,fan,pei # speaker:xu # mood:xu=calm
  -> ridge_lesson
* [请镖行出面定赔偿，自己守药车。 # cid:toll_road]
  ~ bridge_help = false
  我不懂路钱，裴领队谈。我守药，别谈到一半把正事忘了。 # beat:c_ridge_toll_9 # scene:ridge # cast:xu,fan,pei # speaker:you
  好。谁擅长什么，今天就先做什么。范遇，记下破筐的数。 # beat:c_ridge_toll_10 # scene:ridge # cast:xu,fan,pei # speaker:pei # mood:pei=neutral
  -> ridge_lesson

=== ridge_lesson ===
许兄，你这刀在平地逼得快，上斜坡也这么逼？ # beat:c_ridge_lesson_1 # scene:ridge # cast:lu,su,xu # speaker:lu # mood:lu=neutral
你要试，等我喘完。 # beat:c_ridge_lesson_2 # scene:ridge # cast:lu,su,xu # speaker:xu # mood:xu=neutral
你左脚踩在浮石上。陆汀舟问的不是你敢不敢。 # beat:c_ridge_lesson_3 # scene:ridge # cast:lu,su,xu # speaker:su # mood:su=neutral
金陵剑喜欢先把后来两手留住，我在山里得先问这一脚落不落得下。 # beat:c_ridge_lesson_4 # scene:ridge # cast:lu,su,xu # speaker:lu # mood:lu=neutral
你别替金陵下结论。留后手也不等于照着平地走。 # beat:c_ridge_lesson_5 # scene:ridge # cast:lu,su,xu # speaker:su # mood:su=sharp
那就把石头当石头，别先当门派。 # beat:c_ridge_lesson_6 # scene:ridge # cast:lu,su,xu # speaker:you
陆汀舟把浮石拨开，下面是一片雨水泡开的空土。 # beat:c_ridge_lesson_7 # scene:ridge # cast:lu,su,xu # speaker:narrator
* [照两人的说法各走一次，问清适用处。 # cid:terrain_study]
  ~ terrain = true
  平处留剑路，斜处先落脚。我想知道什么时候该换。 # beat:c_ridge_lesson_8 # scene:ridge # cast:lu,su,xu # speaker:you
  好问题。记的不是谁对，而是什么地方还能用。 # beat:c_ridge_lesson_9 # scene:ridge # cast:lu,su,xu # speaker:su # mood:su=calm
  这回我没话可抢，终于能吃口饼了。 # beat:c_ridge_lesson_10 # scene:ridge # cast:lu,su,xu # speaker:lu # mood:lu=amused
  -> ridge_rival
* [跟陆汀舟学斜坡抢位，放弃这次细记。 # cid:terrain_speed]
  ~ terrain = false
  ~ read = true
  先教我眼前这一下。下雨前要赶到桥头。 # beat:c_ridge_lesson_11 # scene:ridge # cast:lu,su,xu # speaker:you
  右肩别先转。人到稳处，再让剑跟上来。 # beat:c_ridge_lesson_12 # scene:ridge # cast:lu,su,xu # speaker:lu # mood:lu=neutral
  我把另一种写给你。赶路可以，别回来时说它没用。 # beat:c_ridge_lesson_13 # scene:ridge # cast:lu,su,xu # speaker:su # mood:su=neutral
  -> ridge_rival

=== ridge_rival ===
师兄，你护腕落下了。 # beat:c_ridge_rival_1 # scene:ridge # cast:xu,yu,lu # speaker:yu # mood:yu=neutral
不是落，是不要了。总往下滑。 # beat:c_ridge_rival_2 # scene:ridge # cast:xu,yu,lu # speaker:xu # mood:xu=sharp
那我扔了？ # beat:c_ridge_rival_3 # scene:ridge # cast:xu,yu,lu # speaker:yu # mood:yu=neutral
……先给我。 # beat:c_ridge_rival_4 # scene:ridge # cast:xu,yu,lu # speaker:xu # mood:xu=uneasy
好像也没那么不要。 # beat:c_ridge_rival_5 # scene:ridge # cast:xu,yu,lu # speaker:lu # mood:lu=amused
余枫退到树后。许竞川把护腕塞回去，半天才问你乔砚生的手怎么样。 # beat:c_ridge_rival_6 # scene:ridge # cast:xu,yu,lu # speaker:narrator
他不肯说，我也不追着问。可要是我上场把他打伤了，不算我占便宜？ # beat:c_ridge_rival_7 # scene:ridge # cast:xu,yu,lu # speaker:xu # mood:xu=neutral
* [告诉他腕伤事实，也说砚生有自己的打法。 # cid:rival_honest]
  ~ rival_trust = true
  有伤是真的。他会守，会挪，不会平白把胜场送你。 # beat:c_ridge_rival_8 # scene:ridge # cast:xu,yu,lu # speaker:you
  那就好。我也不会送他。他要我认真，就让他自己来讲。 # beat:c_ridge_rival_9 # scene:ridge # cast:xu,yu,lu # speaker:xu # mood:xu=calm
  -> road_shoes
* [保留同伴隐私，要求当面约定停手。 # cid:rival_private]
  ~ rival_trust = false
  那是他的事。你当面问他能不能打，别问我能不能替他输。 # beat:c_ridge_rival_10 # scene:ridge # cast:xu,yu,lu # speaker:you
  行。你倒护得明白，比一味说没事好。 # beat:c_ridge_rival_11 # scene:ridge # cast:xu,yu,lu # speaker:xu # mood:xu=intent
  -> road_shoes

=== ridge_supper ===
你们药箱里有退热的么？前村小孩昨夜烧起来了。 # beat:c_ridge_supper_1 # scene:ridge # cast:wei,ling,pei # speaker:wei # mood:wei=neutral
有。可原定送另一村的数也不能少，我得留单。 # beat:c_ridge_supper_2 # scene:ridge # cast:wei,ling,pei # speaker:pei # mood:pei=neutral
我先看人。你们别听一个烧字就把药倒出去。 # beat:c_ridge_supper_3 # scene:ridge # cast:wei,ling,pei # speaker:ling # mood:ling=neutral
魏葭想帮你搬箱，又缩回手。她指甲里都是赶路留下的黑泥。 # beat:c_ridge_supper_4 # scene:ridge # cast:wei,ling,pei # speaker:narrator
你走哪条路来的？ # beat:c_ridge_supper_5 # scene:ridge # cast:wei,ling,pei # speaker:you
旧桥。桥板空了两块，我趴着爬过来的。车过不去。 # beat:c_ridge_supper_6 # scene:ridge # cast:wei,ling,pei # speaker:wei # mood:wei=neutral
先停。问清楚，再动。 # beat:c_ridge_supper_7 # scene:ridge # cast:wei,ling,pei # speaker:pei # mood:pei=intent
* [请凌苇分诊，匀药并留下补送记录。 # cid:medicine_share]
  ~ medicine = true
  先救能救的，不让另一村被悄悄欠下。差的数我去报。 # beat:c_ridge_supper_8 # scene:ridge # cast:wei,ling,pei # speaker:you
  好。我要的是有人记着，不是逼孩子等册子写完。 # beat:c_ridge_supper_9 # scene:ridge # cast:wei,ling,pei # speaker:ling # mood:ling=calm
  -> bridge_arrive
* [派一人带凌苇先行，自己护住整车。 # cid:medicine_send]
  ~ medicine = false
  药由你用，余数回来对。我留在车边，不让第二头也出岔。 # beat:c_ridge_supper_10 # scene:ridge # cast:wei,ling,pei # speaker:you
  可以。不是所有人都得冲到人前。守得住这车，也是护送。 # beat:c_ridge_supper_11 # scene:ridge # cast:wei,ling,pei # speaker:pei # mood:pei=neutral
  -> bridge_arrive
