// Source: 宋世江湖33333–34835; Qin stays Liuhe, fixed chronological old fights.
VAR nq_first_count = false
VAR nq_asked_more = false
VAR nq_night_rest = false
VAR nq_other_foot = false
VAR nq_stop_plain = false
VAR nq_next_honest = false
VAR nq_handoff = false
VAR nq_loss_trace = false
VAR nq_return_room = false
VAR nq_failure_open = false
VAR nq_yuan_reply = false
VAR nq_chu_limit = false
VAR nq_xue_stop = false
VAR nq_wood_share = false
VAR nq_mender_plain = false
VAR nq_relearn_plain = false
VAR nq_spear_listen = false
VAR nq_pupil_plain = false
VAR nq_han_step = false
VAR nq_ordinary_reply = false
VAR nq_han_witness = false
VAR nq_qinghe_place = false
VAR nq_gu_continue = false
VAR nq_gu_question = false
VAR nq_gu_notes = false
VAR nq_chair_keep = false
VAR nq_xue_method = 0
VAR nq_han_method = 0
VAR nq_qinghe_change = 0
VAR nq_gu_begin = 0
VAR nq_legacy = 0
-> hundred_twenty_seven

=== hundred_twenty_seven ===
第一百二十七下，你停住，把竹竿往下移半寸。草人的衣口已经被戳得翻起，方才九十多下却都落高了。 # beat:nq_hundred_twenty_seven_1 # scene:nq_home # cast:nq_zhou # speaker:narrator
你叫秦天岳，十三岁，河朔牲口行家的孩子。父亲替镖局、军铺买马，今日来的客人看过马，却先在你身后停了。 # beat:nq_hundred_twenty_seven_2 # scene:nq_home # cast:nq_zhou # speaker:narrator
为什么往下？ # beat:nq_hundred_twenty_seven_3 # scene:nq_home # cast:nq_zhou # speaker:nq_zhou # mood:nq_zhou=neutral
刚才一百二十七下，九十多下都高了。 # beat:nq_hundred_twenty_seven_4 # scene:nq_home # cast:nq_zhou # speaker:you
谁教你数？ # beat:nq_hundred_twenty_seven_5 # scene:nq_home # cast:nq_zhou # speaker:nq_zhou # mood:nq_zhou=intent
没人。不数，怎么知道有没有变好？ # beat:nq_hundred_twenty_seven_6 # scene:nq_home # cast:nq_zhou # speaker:you
老人没有立即说收徒，先把那根歪竹竿接到手里，给你看你每次怎样抬肩。 # beat:nq_hundred_twenty_seven_7 # scene:nq_home # cast:nq_zhou # speaker:narrator
* [先把那半寸重做一轮，看竹竿真到哪里，不拿数对了当已经改好。 # cid:nq_try_lower]
  ~ nq_first_count = true
  前几下仍高。你把脚也挪一点，竹竿才从肩下真正送出去。老人看你又数，没有催你快点叫他一声师父。 # beat:nq_hundred_twenty_seven_8 # scene:nq_home # cast:nq_zhou # speaker:narrator
  -> before_dawn
* [问肩为什么每次先抬，请老人看自己慢走一遍。 # cid:nq_ask_shoulder]
  ~ nq_first_count = false
  你慢下来，竹竿尖反比刚才晃。老人用两指在你肩前一点，你才察觉自己每次要证明能刺得远，先把这里顶了出去。 # beat:nq_hundred_twenty_seven_9 # scene:nq_home # cast:nq_zhou # speaker:narrator
  -> before_dawn

=== before_dawn ===
他叫周定川，定北枪，六十余岁，地方成名三十年，盛时十余年本地公开问艺未败。几个府榜首都问过他的枪，河朔人说北榜是天下的，周老是河朔自己的。 # beat:nq_before_dawn_1 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:narrator
他只给你白蜡枪，叫明日卯时到城西六合馆，晚一步别来。第二日寅时，你已站在门外。比你大两岁的阿原来开门，险些把你当昨夜没回家的。 # beat:nq_before_dawn_2 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:narrator
师父没说寅时加教。先进来，别让枪冻得比你还直。 # beat:nq_before_dawn_3 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:nq_yuan # mood:nq_yuan=amused
先扎、拦、拿。 # beat:nq_before_dawn_4 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:nq_zhou # mood:nq_zhou=intent
头一年，只有这三样。一月像样，三月能压住不少成年弟子，半年你终于问什么时候学后面。 # beat:nq_before_dawn_5 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:narrator
* [实说自己觉得会了，肯让师父用真枪来试。 # cid:nq_ask_more]
  ~ nq_asked_more = true
  我会了。 # beat:nq_before_dawn_6 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:you
  会了？来。 # beat:nq_before_dawn_7 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:nq_zhou # mood:nq_zhou=amused
  三招，你的枪飞出去。阿原去捡，你没敢先问师父是不是用了还没教的第四样。 # beat:nq_before_dawn_8 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:narrator
  -> three_basics
* [请师父拿这三样试，先看为什么熟了仍不是会。 # cid:nq_ask_test]
  ~ nq_asked_more = false
  我来接这三样，您别先给我留手。 # beat:nq_before_dawn_9 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:you
  三招，白蜡枪飞到场边。师父还在原处，你握空的手却先疼起来。 # beat:nq_before_dawn_10 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:narrator
  看见熟和会差哪儿了？先捡回来。 # beat:nq_before_dawn_11 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:nq_zhou # mood:nq_zhou=neutral
  -> three_basics

=== three_basics ===
第二年再问，十一招败；第三年二十七。第四年，只扎拦拿，终于七十余招。 # beat:nq_three_basics_1 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:narrator
现在可以学枪了。 # beat:nq_three_basics_2 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:nq_zhou # mood:nq_zhou=intent
十七岁的你已经会在纸前收枪。半寸、一分，不能破，只让纸动。有时阿原看你练到夜里，端灯来又端走，你还在原来那一线前。 # beat:nq_three_basics_3 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:narrator
这一下到底有什么用？ # beat:nq_three_basics_4 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:nq_yuan # mood:nq_yuan=uneasy
不知道。师父叫练。 # beat:nq_three_basics_5 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:you
我叫你练，也没叫你把睡觉全省了。明早扎歪，可别说纸困。 # beat:nq_three_basics_6 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:nq_zhou # mood:nq_zhou=amused
* [夜深收枪，把手抖前最后一轮记住，明早从真能稳的地方练。 # cid:nq_stop_before_shake]
  ~ nq_night_rest = true
  你把灯留给阿原，他还得补自己没走完的拦。早起时，纸没有因昨夜早睡便自己多动，你仍从第一下开始。 # beat:nq_three_basics_7 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:narrator
  -> reverse_return
* [再做一小轮，只看哪下开始抖，做完便收，不把越多越好当枪法。 # cid:nq_finish_small_set]
  ~ nq_night_rest = false
  到第七下，肩已先提。你把枪放回，师父从门里看见，没叫你为一个勤字再撑到下一百。 # beat:nq_three_basics_8 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:narrator
  记住自己从哪下没会。别只记一共做多少。 # beat:nq_three_basics_9 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:nq_zhou # mood:nq_zhou=neutral
  -> reverse_return

=== reverse_return ===
十八岁学六合回龙，七日后你问，为什么一定从右边回，若左脚在前呢。 # beat:nq_reverse_return_1 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:narrator
旧谱如此。你试。 # beat:nq_reverse_return_2 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:nq_zhou # mood:nq_zhou=neutral
你试一下午，改出反回枪。老人看完，真把这一下补进自己的谱，没有因为是晚辈改的就换一个只有自己知道的来历。 # beat:nq_reverse_return_3 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:narrator
* [请阿原站进去试，不只让谱留一个自己会走的姿势。 # cid:nq_show_other_foot]
  ~ nq_other_foot = true
  他左脚慢一点，回枪便接不上。你重走给他看，又让他自己来，才知道半日改出的路，也得逐个人走。 # beat:nq_reverse_return_4 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:narrator
  我不会，你可别把左脚也替我搬。 # beat:nq_reverse_return_5 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:nq_yuan # mood:nq_yuan=amused
  -> twenty
* [把起脚与回身的区别写在旁边，留师父下次教时能真正试。 # cid:nq_record_change]
  ~ nq_other_foot = false
  你写得细，师父叫你拿枪在旁等。阿原照着走仍卡住，你只得再站进去；纸没有因写全便替人把腰转过来。 # beat:nq_reverse_return_6 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:narrator
  写下了，好。下回也别只教纸。 # beat:nq_reverse_return_7 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:nq_zhou # mood:nq_zhou=neutral
  -> twenty

=== twenty ===
二十岁初替门中参加地方武会，二十一招胜、三十七招胜，第三场府榜人物六十四招也败。有人当场说，周定川之后又出一杆枪。 # beat:nq_twenty_1 # scene:nq_fair # cast:nq_zhou # speaker:narrator
放屁。他连我都没赢，叫什么下一杆？ # beat:nq_twenty_2 # scene:nq_fair # cast:nq_zhou # speaker:nq_zhou # mood:nq_zhou=sharp
你没不服，第二日照旧早起。二十二岁回馆，第一次正式问师，真枪相对。前百招老人仍稳，一百二十以后，你的气力、反应才渐渐有了优势。 # beat:nq_twenty_3 # scene:nq_fair # cast:nq_zhou # speaker:narrator
第一百四十六招，枪尖真正越过师父中线。他横枪封，你却自己收了。 # beat:nq_twenty_4 # scene:nq_fair # cast:nq_zhou # speaker:narrator
* [承认两人都可能赢，今日不必非分到底。 # cid:nq_leave_today_open]
  ~ nq_stop_plain = true
  为什么停？ # beat:nq_twenty_5 # scene:nq_fair # cast:nq_zhou # speaker:nq_zhou # mood:nq_zhou=intent
  再打，您可能赢。我也可能赢。今天不是非分不可。 # beat:nq_twenty_6 # scene:nq_fair # cast:nq_zhou # speaker:you
  老人盯着你一会，笑起来，没有把你收的那一下记成他又教了你一败。 # beat:nq_twenty_7 # scene:nq_fair # cast:nq_zhou # speaker:narrator
  -> leave_unfinished
* [把自己刚才真正看见的那条线说清，也不以一瞬越中就先讨一个赢。 # cid:nq_name_real_edge]
  ~ nq_stop_plain = false
  这里进得去，后面还要真接。今天不是非分不可。 # beat:nq_twenty_8 # scene:nq_fair # cast:nq_zhou # speaker:you
  你也可能赢。 # beat:nq_twenty_9 # scene:nq_fair # cast:nq_zhou # speaker:nq_zhou # mood:nq_zhou=intent
  嗯。 # beat:nq_twenty_10 # scene:nq_fair # cast:nq_zhou # speaker:you
  你没说自己是让师父。那两字才会把方才一百四十六招全说轻。 # beat:nq_twenty_11 # scene:nq_fair # cast:nq_zhou # speaker:narrator
  -> leave_unfinished

=== leave_unfinished ===
可以下山了。 # beat:nq_leave_unfinished_1 # scene:nq_school # cast:nq_zhou # speaker:nq_zhou # mood:nq_zhou=amused
二十三到二十八，河朔五年十九场正式问艺，十七胜、两平，无败。二十五府榜前位，二十七入河朔最高地方榜，二十八胜前位大宗师。 # beat:nq_leave_unfinished_2 # scene:nq_school # cast:nq_zhou # speaker:narrator
有人叫小定北，你不喜欢。周定川是周定川，你不是小周定川。后来才有天岳枪，再后来才叫擎天神枪，今天的名字不必替老师一生只作一个前字。 # beat:nq_leave_unfinished_3 # scene:nq_school # cast:nq_zhou # speaker:narrator
二十九再回六合馆，周已七十余。这次一百零九招，他先收枪。 # beat:nq_leave_unfinished_4 # scene:nq_school # cast:nq_zhou # speaker:narrator
现在我打不过你了。 # beat:nq_leave_unfinished_5 # scene:nq_school # cast:nq_zhou # speaker:nq_zhou # mood:nq_zhou=intent
他把用了四十多年的枪放回架上。你忽然空了一处，眼前不是一扇再打赢便能推开的门。 # beat:nq_leave_unfinished_6 # scene:nq_school # cast:nq_zhou # speaker:narrator
* [承认自己还不知道前路，请师父说他真见过什么。 # cid:nq_ask_next_honest]
  ~ nq_next_honest = true
  前面还有，我不知道该问谁。 # beat:nq_leave_unfinished_7 # scene:nq_school # cast:nq_zhou # speaker:you
  我也不是天下都见过。等着。 # beat:nq_leave_unfinished_8 # scene:nq_school # cast:nq_zhou # speaker:nq_zhou # mood:nq_zhou=neutral
  三个月后，他递来一封信，收信楚怀锋，你从未听过。 # beat:nq_leave_unfinished_9 # scene:nq_school # cast:nq_zhou # speaker:narrator
  -> letter
* [仍来馆里陪师父看下一班，不因再教不动自己就把旧门当已走完。 # cid:nq_keep_old_visit]
  ~ nq_next_honest = false
  你照旧来看他教年轻人，听他骂拦枪时手腕先歪。三个月后，他在散课时递来一封信：楚怀锋。 # beat:nq_leave_unfinished_10 # scene:nq_school # cast:nq_zhou # speaker:narrator
  前面有人。不是叫你守着我这根枪等。 # beat:nq_leave_unfinished_11 # scene:nq_school # cast:nq_zhou # speaker:nq_zhou # mood:nq_zhou=neutral
  -> letter

=== letter ===
年轻时我输过他，七十六招。你现在去，可能撑不到五十。 # beat:nq_letter_1 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:nq_zhou # mood:nq_zhou=neutral # look:nq_yuan=adult
你眼睛亮，老人看见便骂果然是疯子。阿原接住你兴冲冲差点落下的行李，问今晚还有没有空，把你留下的那班带他接一遍。 # beat:nq_letter_2 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:narrator
你要走，我知道。可这班不是拿着你的谱就会开口。 # beat:nq_letter_3 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:nq_yuan # mood:nq_yuan=intent
* [多留五日陪阿原真正带一班，晚到楚家，把耽误的远约自己去解释。 # cid:nq_teach_before_departure]
  ~ nq_handoff = true
  你错过原拟同行的车，另走一段路。阿原第一晚还等你接话，第五晚终于自己叫人站进去。 # beat:nq_letter_4 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:narrator
  走吧。他若教歪，我还没死，看得见。 # beat:nq_letter_5 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:nq_zhou # mood:nq_zhou=amused
  你笑着把信放好，向两个人道别。 # beat:nq_letter_6 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:narrator
  -> chu_first
* [先赴已经约好的远路，留下谱，请阿原与师父重新排课，承认自己这次没能陪。 # cid:nq_depart_with_letter]
  ~ nq_handoff = false
  这回我先走。那班缺的工，回信说给我，不能全算你们应该接。 # beat:nq_letter_7 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:you
  我先帮师父带。等我真能自己开，再说开我的夜班。 # beat:nq_letter_8 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:nq_yuan # mood:nq_yuan=intent
  你按时赶上车，回头时，馆门已为下一班打开。 # beat:nq_letter_9 # scene:nq_school # cast:nq_zhou,nq_yuan # speaker:narrator
  -> chu_first

=== chu_first ===
楚怀锋七十三，天门枪。二十多年前北榜前列，最高第四，后来因旧伤与门务退下。信到手，他先问周定川活着没有、枪废了没有，听完笑那老东西年轻就倔。 # beat:nq_chu_first_1 # scene:nq_chuyard # cast:nq_chu # speaker:narrator
你就是他最得意的？来。 # beat:nq_chu_first_2 # scene:nq_chuyard # cast:nq_chu # speaker:nq_chu # mood:nq_chu=intent
你以为撑不到五十是师父压你。第一场三十二招，枪脱手。第二场三十八，第三四十一，一日问五次，末场四十五。 # beat:nq_chu_first_3 # scene:nq_chuyard # cast:nq_chu # speaker:narrator
你不累？ # beat:nq_chu_first_4 # scene:nq_chuyard # cast:nq_chu # speaker:nq_chu # mood:nq_chu=uneasy
累。第五次比第一次多十三招。 # beat:nq_chu_first_5 # scene:nq_chuyard # cast:nq_chu # speaker:you
周定川没说错。确实是疯子。 # beat:nq_chu_first_6 # scene:nq_chuyard # cast:nq_chu # speaker:nq_chu # mood:nq_chu=amused
他没拿这十三招替你算一层新境界，叫你把枪放下，先喝水。 # beat:nq_chu_first_7 # scene:nq_chuyard # cast:nq_chu # speaker:narrator
* [先把三十二招最后如何脱手走回去，看自己何时已过了能回的地方。 # cid:nq_trace_first_loss]
  ~ nq_loss_trace = true
  你走到最后一枪，才发现肩前已满，没有能收的那半寸。楚怀锋站在你枪外，不用再破第二次也能让你看见。 # beat:nq_chu_first_8 # scene:nq_chuyard # cast:nq_chu # speaker:narrator
  别只问最后被我碰哪儿。从你先抢那一步看。 # beat:nq_chu_first_9 # scene:nq_chuyard # cast:nq_chu # speaker:nq_chu # mood:nq_chu=neutral
  -> gun_says
* [比较五次里真正多出来的十三招，不把撑长当已经找到原因。 # cid:nq_compare_thirteen]
  ~ nq_loss_trace = false
  第二次开始你肯多留一回枪，末场便真多走几步。可是要把势一口气全压出时，仍在同一处空了手。 # beat:nq_chu_first_10 # scene:nq_chuyard # cast:nq_chu # speaker:narrator
  十三招是多了。病没因为你多走十三招就换掉。 # beat:nq_chu_first_11 # scene:nq_chuyard # cast:nq_chu # speaker:nq_chu # mood:nq_chu=neutral
  -> gun_says

=== gun_says ===
第一年，他拆你的强。你抢，他退；你越抢，他越让。等你觉得枪势已铺满场，他才在最后一点破开。 # beat:nq_gun_says_1 # scene:nq_chuyard # cast:nq_chu # speaker:narrator
半年以后，你问为什么。他说因为你太想让别人知道自己强。你说没有，老人把枪在掌里一转。 # beat:nq_gun_says_2 # scene:nq_chuyard # cast:nq_chu # speaker:narrator
枪有。 # beat:nq_gun_says_3 # scene:nq_chuyard # cast:nq_chu # speaker:nq_chu # mood:nq_chu=intent
这一句，你练三年。不是把力气都藏起来便算懂，也不是听他说过就不再抢。 # beat:nq_gun_says_4 # scene:nq_chuyard # cast:nq_chu # speaker:narrator
* [每次抢入仍给自己留一条能回的路，不再用更响的一枪盖掉刚才。 # cid:nq_leave_return]
  ~ nq_return_room = true
  一开始你输得更快：留路成了迟疑，老人从空处进。你只得再试，直到那条路仍能让你接人，而不是只供自己退远。 # beat:nq_gun_says_5 # scene:nq_chuyard # cast:nq_chu # speaker:narrator
  这回再来，别收成胆小。 # beat:nq_gun_says_6 # scene:nq_chuyard # cast:nq_chu # speaker:nq_chu # mood:nq_chu=neutral
  -> first_north_loss
* [先随对方真让的距离走，不把整套枪势一并丢给一个早已换地方的人。 # cid:nq_follow_opponent]
  ~ nq_return_room = false
  老人一退，你也重新认眼前的远近。原来能连出的几枪少了，你觉得别扭，手却终于不再总赶在自己脚前面。 # beat:nq_gun_says_7 # scene:nq_chuyard # cast:nq_chu # speaker:narrator
  力还在，何必每下先给别人看你有多少。 # beat:nq_gun_says_8 # scene:nq_chuyard # cast:nq_chu # speaker:nq_chu # mood:nq_chu=neutral
  -> first_north_loss

=== first_north_loss ===
三十余再出山，六十八招胜昔日平过的地方榜首。初问北榜末席，一百六十余招，却败。十余年来第一场公开输，你回来反而很高兴。 # beat:nq_first_north_loss_1 # scene:nq_northfield # cast:nq_border # speaker:narrator
还问？ # beat:nq_first_north_loss_2 # scene:nq_northfield # cast:nq_border # speaker:nq_border # mood:nq_border=intent
会再来。今日先把这一场记明白。 # beat:nq_first_north_loss_3 # scene:nq_northfield # cast:nq_border # speaker:you
往后三个月只复盘这一战。阿原从六合馆来信，问你寄来的谱里那一下，到底是你自己试成的，还是对方逼得你没有别的地方走。 # beat:nq_first_north_loss_4 # scene:nq_northfield # cast:nq_border # speaker:narrator
他没在场，你不能随便一句只差一点就让他看懂。 # beat:nq_first_north_loss_5 # scene:nq_northfield # cast:nq_border # speaker:narrator
* [把怎样被逼住也写回去，不只寄自己后来想出的解法。 # cid:nq_send_real_failure]
  ~ nq_failure_open = true
  你重写两页，写到自己只顾枪尖的时候，脸仍热。阿原回信说拿到馆里试了，起先众人替你解释，走一遍才知道真走不过。 # beat:nq_first_north_loss_6 # scene:nq_northfield # cast:nq_border # speaker:narrator
  那封信没让他们忽然有北榜本事，却让下一次问不会不必先替师兄圆一场赢。 # beat:nq_first_north_loss_7 # scene:nq_northfield # cast:nq_border # speaker:narrator
  -> thirty_six
* [先寄一种尚未试成的解法，请阿原找人真接，标清没证过，不把推想当旧战事实。 # cid:nq_send_trial_first]
  ~ nq_failure_open = false
  阿原试后写回来，另一边不照你预备的走，解法便又堵了。你只得再把当日被逼住的前半截补寄，白多走一程信路。 # beat:nq_first_north_loss_8 # scene:nq_northfield # cast:nq_border # speaker:narrator
  他说下回先把哪里还不知写在上头，别等全馆帮你试完才又多一页。 # beat:nq_first_north_loss_9 # scene:nq_northfield # cast:nq_border # speaker:narrator
  -> thirty_six

=== thirty_six ===
数年后再问北榜末，平；又两年，胜当时三十余位，已有资格入。楚怀锋却叫再等：进去，你便开始想名次。你说不会，他只笑，人都会。 # beat:nq_thirty_six_1 # scene:nq_chuyard # cast:nq_chu # speaker:narrator
四十一，正式北榜第三十六。此后不是一路升：三十六、三十二、二十八，跌三十一，再二十四。一年连输两场，老师偏说很好。 # beat:nq_thirty_six_2 # scene:nq_chuyard # cast:nq_chu # speaker:narrator
你终于知道北榜不是河朔。 # beat:nq_thirty_six_3 # scene:nq_chuyard # cast:nq_chu # speaker:nq_chu # mood:nq_chu=amused
远信又来。阿原没有拿你的北榜名头替自己的夜班招一批不敢问的人，先讲馆里谁还接不住回枪。 # beat:nq_thirty_six_4 # scene:nq_chuyard # cast:nq_chu # speaker:narrator
{
- nq_handoff:
当年多留五日，他真接过那班，后来能另开自己的夜课。你不在，他也敢当众说这一手自己没会；周师父还教早班，没再为了替你填位置又多带半年。阿原信里添了一张自己改过的课，先问你看不看得明白。 # beat:nq_thirty_six_5 # scene:nq_chuyard # cast:nq_chu # speaker:narrator
- else:
当年你先走，阿原先帮周师父带旧班，自己的夜课推了半年。老人多带这半年，阿原也错过那年回乡探亲的空档。你补寄工钱，他说收，但半年和那一趟路不是收钱便没发生；后来自己终于开班，先立一条出门要当面交课。 # beat:nq_thirty_six_6 # scene:nq_chuyard # cast:nq_chu # speaker:narrator
}
* [认真接阿原自己改过的课，别只用北榜经验把同门讲回还得等你。 # cid:nq_answer_yuan_method]
  ~ nq_yuan_reply = true
  你试了一次，发现他留给慢脚学生的那半步真有用。回信没抄自己新学的大枪，只把有一处仍会卡肩的地方问清。 # beat:nq_thirty_six_7 # scene:nq_chuyard # cast:nq_chu # speaker:narrator
  这也该学。你赢过谁，不替你把他这张纸先看完。 # beat:nq_thirty_six_8 # scene:nq_chuyard # cast:nq_chu # speaker:nq_chu # mood:nq_chu=intent
  -> last_chu
* [回馆时亲看他教一班，把能替的活先替，再讲自己在外面的败。 # cid:nq_visit_yuan_class]
  ~ nq_yuan_reply = false
  你在门边听，原想补一句，先让他把话说完。学生走到真不会的地方，你才站进去接，发现那半步不是你当年留的样子。 # beat:nq_thirty_six_9 # scene:nq_chuyard # cast:nq_chu # speaker:narrator
  你没叫全班改回去，约阿原散课后真试一次。 # beat:nq_thirty_six_10 # scene:nq_chuyard # cast:nq_chu # speaker:narrator
  -> last_chu

=== last_chu ===
四十五以后，二十一、十八、十四、十一，五十列第八。与楚师最后一次正式交手，三百余招，未分胜负。停下，他握枪的手在抖，不是怕，是老。 # beat:nq_last_chu_1 # scene:nq_chuyard # cast:nq_chu # speaker:narrator
以后不要来了。 # beat:nq_last_chu_2 # scene:nq_chuyard # cast:nq_chu # speaker:nq_chu # mood:nq_chu=intent
为什么？ # beat:nq_last_chu_3 # scene:nq_chuyard # cast:nq_chu # speaker:you
我已经开始拖你。 # beat:nq_last_chu_4 # scene:nq_chuyard # cast:nq_chu # speaker:nq_chu # mood:nq_chu=neutral
没有。 # beat:nq_last_chu_5 # scene:nq_chuyard # cast:nq_chu # speaker:you
你懂枪还是我懂枪？ # beat:nq_last_chu_6 # scene:nq_chuyard # cast:nq_chu # speaker:nq_chu # mood:nq_chu=sharp
你闭嘴。他把枪横在腿上，说周定川送你来，不是让你给他养老。你枪里最难改的，他也改不动了：还是强。但这回，你已练到他能教的尽头，前面他不知道。 # beat:nq_last_chu_7 # scene:nq_chuyard # cast:nq_chu # speaker:narrator
* [听见他的不知道，不把自己留下陪伴说成老师必须再教。 # cid:nq_accept_teacher_limit]
  ~ nq_chu_limit = true
  我往前走。不是把你这里忘了。 # beat:nq_last_chu_8 # scene:nq_chuyard # cast:nq_chu # speaker:you
  忘了倒省心。下次来不是来逼我再打三百招。 # beat:nq_last_chu_9 # scene:nq_chuyard # cast:nq_chu # speaker:nq_chu # mood:nq_chu=amused
  你把那半截试枪留下的断杆收好，没拿他老了替这三百招私下改成自己已胜。 # beat:nq_last_chu_10 # scene:nq_chuyard # cast:nq_chu # speaker:narrator
  -> fifty_eight
* [问以后可否只来坐坐，习武前路自己去找，不再逼他证明还能教。 # cid:nq_ask_keep_visit]
  ~ nq_chu_limit = false
  不带一张几招几招的脸来，就给你茶。 # beat:nq_last_chu_11 # scene:nq_chuyard # cast:nq_chu # speaker:nq_chu # mood:nq_chu=amused
  他骂得不轻，你反而终于能坐下。那半截试枪留下的断杆搁在旁边，记录的是一起问过的路，不是一场他输了的牌。 # beat:nq_last_chu_12 # scene:nq_chuyard # cast:nq_chu # speaker:narrator
  -> fifty_eight

=== fifty_eight ===
此后多年独自练，没有人再替你点出该改哪里。五十五第六，五十八第五。你赴黄河北岸旧校场，问北榜第二，霸王神棍薛云山。 # beat:nq_fifty_eight_1 # scene:nq_riverfield # cast:nq_xue # speaker:narrator
七尺乌木棍，第一枪来，砸；第二，仍砸。二十余招你更繁、更快，真进得去时，棍却总连人带枪一起压回。第四十七招，退三步。 # beat:nq_fifty_eight_2 # scene:nq_riverfield # cast:nq_xue # speaker:narrator
从前别人正面顶不住你的枪，今日轮到你。七十以后换位引棍，第八十三，枪尖逼到他胸前，只差两寸，薛棍尾点地旋身，横棍扫腰，你竖枪硬接，横移五步。 # beat:nq_fifty_eight_3 # scene:nq_riverfield # cast:nq_xue # speaker:narrator
* [不再求正面一枪压过去，逼他失去能完整起棍的位置。 # cid:nq_force_lifting_room]
  ~ nq_xue_method = 1
  你把一条路放开，去迫另一处真要抬棍的地方。棍仍重，你却不必每次都把自己的肩一并递上去。 # beat:nq_fifty_eight_4 # scene:nq_riverfield # cast:nq_xue # speaker:narrator
  这回来。 # beat:nq_fifty_eight_5 # scene:nq_riverfield # cast:nq_xue # speaker:nq_xue # mood:nq_xue=intent
  -> one_seventy_two
* [看他每次落棍以后怎样再起，从能续的那一刻递枪，不只追着两寸再抢。 # cid:nq_follow_staff_end]
  ~ nq_xue_method = 2
  先前你总想补回胸前那两寸，这次肯多看棍尾落下以后的一步。枪不因此变轻，却终于不再只替他提供又一次正面相撞。 # beat:nq_fifty_eight_6 # scene:nq_riverfield # cast:nq_xue # speaker:narrator
  -> one_seventy_two

=== one_seventy_two ===
第一百七十二，枪擦破他左肩衣衫。他低头说好，棍势反而更少；你真从哪里进，棍便落哪里。第一百八十一撞，虎口裂；一百九十三，右臂麻。 # beat:nq_one_seventy_two_1 # scene:nq_riverfield # cast:nq_xue # speaker:narrator
第二百零七，你露左肋引横棍，忽缩枪抢近。楚师教二十余年的近枪，眼看枪尾到胸前，薛却松一只手。双手重棍成单手短棍，棍尾下沉压枪尾，另一手抓杆，肩撞进。 # beat:nq_one_seventy_two_2 # scene:nq_riverfield # cast:nq_xue # speaker:narrator
退六步，乌木棍已停额前。第二百零八，你败。 # beat:nq_one_seventy_two_3 # scene:nq_riverfield # cast:nq_xue # speaker:narrator
再来。 # beat:nq_one_seventy_two_4 # scene:nq_riverfield # cast:nq_xue # speaker:you
今天够了。 # beat:nq_one_seventy_two_5 # scene:nq_riverfield # cast:nq_xue # speaker:nq_xue # mood:nq_xue=intent
我还能打。 # beat:nq_one_seventy_two_6 # scene:nq_riverfield # cast:nq_xue # speaker:you
我知道，所以才不打。你现在不是想赢，是想把那一下抢回来。再三百招，只会更急。 # beat:nq_one_seventy_two_7 # scene:nq_riverfield # cast:nq_xue # speaker:nq_xue # mood:nq_xue=neutral
* [放下今天非抢回一招不可的念头，带真正输过的一场回去。 # cid:nq_let_loss_stand]
  ~ nq_xue_stop = true
  你让虎口松开，痛才一阵阵清楚起来。薛没因你肯收就把棍退半寸改成平，今天这一场仍是你败。 # beat:nq_one_seventy_two_8 # scene:nq_riverfield # cast:nq_xue # speaker:narrator
  -> after_staff
* [请他说明那只松开的手，听完也停，不借问话偷换成第二场。 # cid:nq_ask_loosened_hand]
  ~ nq_xue_stop = false
  你近枪要我还是双手重棍，我偏不替你拿着。 # beat:nq_one_seventy_two_9 # scene:nq_riverfield # cast:nq_xue # speaker:nq_xue # mood:nq_xue=neutral
  你低头看自己还想抓紧的手，终于把枪搁下。今天接不上的，不必靠再流一次血才有资格回去想。 # beat:nq_one_seventy_two_10 # scene:nq_riverfield # cast:nq_xue # speaker:narrator
  -> after_staff

=== after_staff ===
回去问楚师，他没接你最后一招未料松手的解释。 # beat:nq_after_staff_1 # scene:nq_chuyard # cast:nq_chu # speaker:narrator
你从第一招就在输。你一直想证明正面能过，薛云山一生最不怕这个。 # beat:nq_after_staff_2 # scene:nq_chuyard # cast:nq_chu # speaker:nq_chu # mood:nq_chu=intent
五十八到六十一，用三年才从第五到第四。外人说慢了，老师却知你第一次真开始拆自己。 # beat:nq_after_staff_3 # scene:nq_chuyard # cast:nq_chu # speaker:narrator
六十一，终南访友，路遇大雨，山道塌一段。你绕入山中一座废大半的旧观，檐下有人修木椅。你只想借宿一夜，明日照常练枪。 # beat:nq_after_staff_4 # scene:nq_chuyard # cast:nq_chu # speaker:narrator
-> wood_chair

=== wood_chair ===
老人不穿道袍，也不像江湖人，手里扶着一把木椅，正把松处拆开。你带枪进门，他抬眼，看见的好像只是今晚又多一人要烤湿衣。 # beat:nq_wood_chair_1 # scene:nq_rainporch # cast:nq2_mender # speaker:narrator
会劈柴么？ # beat:nq_wood_chair_2 # scene:nq_rainporch # cast:nq2_mender # speaker:nq2_mender # mood:nq2_mender=neutral
会。 # beat:nq_wood_chair_3 # scene:nq_rainporch # cast:nq2_mender # speaker:you
那边。 # beat:nq_wood_chair_4 # scene:nq_rainporch # cast:nq2_mender # speaker:nq2_mender # mood:nq2_mender=neutral
北榜第四秦天岳，把枪靠好，替陌生老人劈半个时辰柴。雨落在门外，老人仍慢慢对着那处椅脚，没有问你现在第几。 # beat:nq_wood_chair_5 # scene:nq_rainporch # cast:nq2_mender # speaker:narrator
* [把湿柴先分开，留自己今夜够用的一份，也给老人明早添得着。 # cid:nq_split_own_share]
  ~ nq_wood_share = true
  你劈惯了，却仍先剔出钉眼旁裂的一块，免得火里乱爆。老人叫放靠里，不夸北榜第四肯做小事，只问锅边还缺不缺。 # beat:nq_wood_chair_6 # scene:nq_rainporch # cast:nq2_mender # speaker:narrator
  够这一夜。明早我再看。 # beat:nq_wood_chair_7 # scene:nq_rainporch # cast:nq2_mender # speaker:you
  -> too_heavy
* [劈完先挪开挡手的木屑，请老人有地方放正椅子，不抢着替他修。 # cid:nq_help_chair_space]
  ~ nq_wood_share = false
  你伸手想扶，他叫先别压那边。木椅还没接好，你这一帮反倒会把新口又扯开。 # beat:nq_wood_chair_8 # scene:nq_rainporch # cast:nq2_mender # speaker:narrator
  放这里。会劈柴，就先把柴放稳。 # beat:nq_wood_chair_9 # scene:nq_rainporch # cast:nq2_mender # speaker:nq2_mender # mood:nq2_mender=intent
  你应一声，没在破观里同一把椅子争谁更强。 # beat:nq_wood_chair_10 # scene:nq_rainporch # cast:nq2_mender # speaker:narrator
  -> too_heavy

=== too_heavy ===
第二日雨没停，你在院里照常练枪。老人看一阵，说太重。你问枪重么，他摇头。 # beat:nq_too_heavy_1 # scene:nq_rainyard # cast:nq2_mender # speaker:narrator
你重。 # beat:nq_too_heavy_2 # scene:nq_rainyard # cast:nq2_mender # speaker:nq2_mender # mood:nq2_mender=intent # camera:portrait # action:修椅老人 · 你重
你眼神变了。这与楚师的强相近，却又不是同一句。你问哪里，老人起身，站到院里，叫刺他。 # beat:nq_too_heavy_3 # scene:nq_rainyard # cast:nq2_mender # speaker:narrator
会伤人。 # beat:nq_too_heavy_4 # scene:nq_rainyard # cast:nq2_mender # speaker:you
你若伤得了，算你的本事。 # beat:nq_too_heavy_5 # scene:nq_rainyard # cast:nq2_mender # speaker:nq2_mender # mood:nq2_mender=neutral
第一枪三成，他没躲，轻碰枪杆，偏。第二五成，再偏；第三七成，仍一步没动。你退三步，第一次真正行礼。 # beat:nq_too_heavy_6 # scene:nq_rainyard # cast:nq2_mender # speaker:narrator
* [收枪行礼，问前辈姓名，不再拿还没尽全力替三枪找退处。 # cid:nq_ask_mender_name]
  ~ nq_mender_plain = true
  敢问前辈姓名？ # beat:nq_too_heavy_7 # scene:nq_rainyard # cast:nq2_mender # speaker:you
  司马衡。 # beat:nq_too_heavy_8 # scene:nq_rainyard # cast:nq2_mender # speaker:nq2_mender # mood:nq2_mender=neutral
  你没听过，老人看你一眼，补上下一句。 # beat:nq_too_heavy_9 # scene:nq_rainyard # cast:nq2_mender # speaker:narrator
  司马天岳是我徒弟。 # beat:nq_too_heavy_10 # scene:nq_rainyard # cast:nq2_mender # speaker:nq2_mender # mood:nq2_mender=neutral
  -> third_teacher
* [先说三枪都不是偶然，再行礼问名，不逼老人再站着接第十成。 # cid:nq_admit_three_spears]
  ~ nq_mender_plain = false
  三枪，我没走进去。敢问前辈？ # beat:nq_too_heavy_11 # scene:nq_rainyard # cast:nq2_mender # speaker:you
  司马衡。司马天岳是我徒弟。 # beat:nq_too_heavy_12 # scene:nq_rainyard # cast:nq2_mender # speaker:nq2_mender # mood:nq2_mender=neutral
  雨声没变。你却知道自己刚才把怎样一个人当作不会武的修椅老人。 # beat:nq_too_heavy_13 # scene:nq_rainyard # cast:nq2_mender # speaker:narrator
  -> third_teacher

=== third_teacher ===
乾坤武圣的老师，退江湖已久，年过一百二十，返真中段旧人。你在他面前，如十三岁初站周师面前。他却不肯受你立即拜下去的一礼。 # beat:nq_third_teacher_1 # scene:nq_rainporch # cast:nq2_heng # speaker:narrator
你是六合门的人，已有两个师父，还拜什么？ # beat:nq_third_teacher_2 # scene:nq_rainporch # cast:nq2_heng # speaker:nq2_heng # mood:nq2_heng=intent
因为我还有不会的。 # beat:nq_third_teacher_3 # scene:nq_rainporch # cast:nq2_heng # speaker:you
多大？ # beat:nq_third_teacher_4 # scene:nq_rainporch # cast:nq2_heng # speaker:nq2_heng # mood:nq2_heng=neutral
六十一。 # beat:nq_third_teacher_5 # scene:nq_rainporch # cast:nq2_heng # speaker:you
六十一还想改？ # beat:nq_third_teacher_6 # scene:nq_rainporch # cast:nq2_heng # speaker:nq2_heng # mood:nq2_heng=amused # camera:portrait # action:司马衡 · 还想改
想。 # beat:nq_third_teacher_7 # scene:nq_rainporch # cast:nq2_heng # speaker:you
那就留下。你仍是六合门的人，我教你这一段。 # beat:nq_third_teacher_8 # scene:nq_rainporch # cast:nq2_heng # speaker:nq2_heng # mood:nq2_heng=neutral
他没有给你改太极辈序。收下之后第一件事，却叫三个月不许碰枪：你一拿，便变成秦天岳；他先要看看没有枪还剩什么。 # beat:nq_third_teacher_9 # scene:nq_rainporch # cast:nq2_heng # speaker:narrator
* [给六合馆说清自己留下重学、暂不碰枪，归期不定，别让他们替你撑一个还什么都会的名。 # cid:nq_write_relearn]
  ~ nq_relearn_plain = true
  信写到六十一还不会，你停了一阵，终于没划掉。你也写明老师不叫改门，让问艺别先替你订满。 # beat:nq_third_teacher_10 # scene:nq_rainporch # cast:nq2_heng # speaker:narrator
  阿原回信，没有问你伤哪儿，只说把未定的约暂缓。他让一名总不敢开口的晚辈也读了那句还有不会。 # beat:nq_third_teacher_11 # scene:nq_rainporch # cast:nq2_heng # speaker:narrator
  -> without_spear
* [先报平安与拜新师，不细说三月离枪，把不知怎样解释的放到回去当面讲。 # cid:nq_write_safe_only]
  ~ nq_relearn_plain = false
  你没说谎，只省了最难写的一段。馆里知道你学新功，却不知道回程要等多久，也替你留着几场问艺。 # beat:nq_third_teacher_12 # scene:nq_rainporch # cast:nq2_heng # speaker:narrator
  来山中的人看见枪总靠着不用，猜是不是右臂旧伤又重。话传得比你预备留到回去的解释快。 # beat:nq_third_teacher_13 # scene:nq_rainporch # cast:nq2_heng # speaker:narrator
  -> without_spear

=== without_spear ===
三个月，扫院、挑水、推磨、走山，下棋。你连输二十七盘，第二十八终于赢。老人问高兴什么，你说因为赢。 # beat:nq_without_spear_1 # scene:nq_oldyard # cast:nq2_heng # speaker:narrator
所以你还是很想赢。 # beat:nq_without_spear_2 # scene:nq_oldyard # cast:nq2_heng # speaker:nq2_heng # mood:nq2_heng=amused
三个月后重新拿枪，第一天只一个刺字。整日两千余枪，他仍摇头。第七日终于勉强可以，你问不同在哪。 # beat:nq_without_spear_3 # scene:nq_oldyard # cast:nq2_heng # speaker:narrator
前面的都是你刺出去的，刚才那一枪，是枪自己去了。 # beat:nq_without_spear_4 # scene:nq_oldyard # cast:nq2_heng # speaker:nq2_heng # mood:nq2_heng=intent
你完全没听懂。眼前没有天光，没有旧枪自己飞起来，只有一只照旧酸的手与下一次还要真做的动作。 # beat:nq_without_spear_5 # scene:nq_oldyard # cast:nq2_heng # speaker:narrator
* [先不把勉强可以的样子摆住，重新接老人眼前给的距离。 # cid:nq_try_no_display]
  ~ nq_spear_listen = true
  再刺，又不可以。你本想把上一枪认成终于拿到的一式，老人站位变了，昨日那个像便先把你留在原处。 # beat:nq_without_spear_6 # scene:nq_oldyard # cast:nq2_heng # speaker:narrator
  还得从这里来。 # beat:nq_without_spear_7 # scene:nq_oldyard # cast:nq2_heng # speaker:you
  不然从哪儿？ # beat:nq_without_spear_8 # scene:nq_oldyard # cast:nq2_heng # speaker:nq2_heng # mood:nq2_heng=neutral
  -> sixty_four
* [说自己还没懂，请他照样看下一枪，不用听懂两个字替自己盖章。 # cid:nq_admit_not_understood]
  ~ nq_spear_listen = false
  我还不懂。 # beat:nq_without_spear_9 # scene:nq_oldyard # cast:nq2_heng # speaker:you
  看得出。刺。 # beat:nq_without_spear_10 # scene:nq_oldyard # cast:nq2_heng # speaker:nq2_heng # mood:nq2_heng=amused
  他没为你肯认不会便少要求一点。你刺过去，自己也终于不再急着替刚才那一下取个能抄走的名。 # beat:nq_without_spear_11 # scene:nq_oldyard # cast:nq2_heng # speaker:narrator
  -> sixty_four

=== sixty_four ===
三年才开始懂一点。老人最不爱擎天神枪四字：天需要你擎？你总觉得什么都要由你来。六十四第一次真正试枪，他空手；三十、五十，枪未碰衣。第六十一招，终于逼退一步。 # beat:nq_sixty_four_1 # scene:nq_oldyard # cast:nq2_heng # speaker:narrator
你心才一动，老人已到身侧，轻压枪身。 # beat:nq_sixty_four_2 # scene:nq_oldyard # cast:nq2_heng # speaker:narrator
高兴什么？ # beat:nq_sixty_four_3 # scene:nq_oldyard # cast:nq2_heng # speaker:nq2_heng # mood:nq2_heng=intent
你这才知道，返真与你不是差几席，是完整另一层天地。此后不再天天问什么时候能到，却仍断续回六合、问艺、办门务，每年总留几月来终南。十年，并非把别人都扔下终年闭关。 # beat:nq_sixty_four_4 # scene:nq_oldyard # cast:nq2_heng # speaker:narrator
这一回返馆，阿原头发也已见白，等你看他身后新来问枪的人。 # beat:nq_sixty_four_5 # scene:nq_school # cast:nq_yuan # speaker:narrator # look:nq_yuan=late
{
- nq_relearn_plain:
回馆时，阿原没有替你留一排“新神枪”问艺，也没等你当场教一式三月秘传。他把那晚辈叫来，少年敢说自己拦不住，不先补一句只是还没尽力。你听完，照他实际脚下接一次，终于也能当众说这回我还得再试。 # beat:nq_sixty_four_6 # scene:nq_school # cast:nq_yuan # speaker:narrator
- else:
回馆先遇两封追问旧约的信，还有问你右臂是否已不能持枪的人。你花两日去撤、解释、赔已经订下的旅费；阿原也多请半月馆师接课。没有人因此再禁你拿枪，那晚辈却直到散课才敢问你他总拦不住是不是有伤，你得从头说自己真在重学。 # beat:nq_sixty_four_7 # scene:nq_school # cast:nq_yuan # speaker:narrator
}
* [亲手接晚辈的枪，准他问自己不会的地方，不把老师说过的话原封压给他。 # cid:nq_meet_pupil_plain]
  ~ nq_pupil_plain = true
  你在那一枪外站住，才发现他的腕转不过来。你让他换起手，他再试，问为什么这回能走。 # beat:nq_sixty_four_8 # scene:nq_school # cast:nq_yuan # speaker:narrator
  你先记自己这只手，别先记我说像哪一门。 # beat:nq_sixty_four_9 # scene:nq_school # cast:nq_yuan # speaker:you
  这一次你真在教他，不是重演自己在老人面前的三年。 # beat:nq_sixty_four_10 # scene:nq_school # cast:nq_yuan # speaker:narrator
  -> two_firsts
* [请阿原同看晚辈拦枪，把别人已见过的难处听完，再出手。 # cid:nq_meet_class_together]
  ~ nq_pupil_plain = false
  阿原说他换过两种握法，你先听完才试。少年又卡在旧处，这回你不急着报一个更高的字，让他慢走，自己看那只腕什么时候先拧。 # beat:nq_sixty_four_11 # scene:nq_school # cast:nq_yuan # speaker:narrator
  等他走通，阿原笑着叫你把这一回写给山里的老师，不要又只寄结果。 # beat:nq_sixty_four_12 # scene:nq_school # cast:nq_yuan # speaker:narrator
  -> two_firsts

=== two_firsts ===
六十五北榜第三，六十七第二，六十九初登第一，只一年又退第二。有人说你老，你自己知刚开始；七十一再登第一，此后很少再掉。 # beat:nq_two_firsts_1 # scene:nq_northfield # cast:nq_hanbei # speaker:narrator
与韩镇北三次问枪，先一百七十余你胜，再一百二十余他自收，第三约百招，他问现在每枪为何比从前少。你答师父也这么说。他猜周定川、楚怀锋，你都摇头，他便不再问。 # beat:nq_two_firsts_2 # scene:nq_northfield # cast:nq_hanbei # speaker:narrator
少的不是手里没了枪。来，把这半步接完。 # beat:nq_two_firsts_3 # scene:nq_northfield # cast:nq_hanbei # speaker:nq_hanbei # mood:nq_hanbei=intent
他没有为自己这回早收就把先前的问艺都略作一句不如。你也没让第三位师父的名字盖掉前两位。 # beat:nq_two_firsts_4 # scene:nq_northfield # cast:nq_hanbei # speaker:narrator
* [接完他指出的半步，让三次问艺都留着各自真正发生的事。 # cid:nq_take_han_step]
  ~ nq_han_step = true
  枪一搭，他仍能逼你挪脚。你把那一点接住再放开，不为第三次只百招便催对方早点停。 # beat:nq_two_firsts_5 # scene:nq_northfield # cast:nq_hanbei # speaker:narrator
  这回别数着想省我几招。 # beat:nq_two_firsts_6 # scene:nq_northfield # cast:nq_hanbei # speaker:nq_hanbei # mood:nq_hanbei=amused
  -> ordinary_day
* [请他再从原先那一路进，看少掉的力是否仍能接得住真正的来枪。 # cid:nq_show_less_gun]
  ~ nq_han_step = false
  他没替你留空，旧路也不再原样。你真接过才知道少了不等于把人放过去，枪在手里，下一步仍得走。 # beat:nq_two_firsts_7 # scene:nq_northfield # cast:nq_hanbei # speaker:narrator
  这回是少，不是散。 # beat:nq_two_firsts_8 # scene:nq_northfield # cast:nq_hanbei # speaker:nq_hanbei # mood:nq_hanbei=neutral
  -> ordinary_day

=== ordinary_day ===
七十多一日，六合年轻弟子来问。没有雷雨，没有绝境。他一枪刺来，你未想挡，也未想看破，身体自然站在那里，枪便进不来。 # beat:nq_ordinary_day_1 # scene:nq_school # cast:nq_young # speaker:narrator
我这一枪又错？ # beat:nq_ordinary_day_2 # scene:nq_school # cast:nq_young # speaker:nq_young # mood:nq_young=uneasy
你忽然想起多年前那句枪自己去了。这一瞬很短，弟子还在等你看他，院里下一班也还要照常开。 # beat:nq_ordinary_day_3 # scene:nq_school # cast:nq_young # speaker:narrator
次日腰仍疼，仍练。连你自己也说不清哪一天入化，几年后江湖才渐渐认，柳成章说已入化多年且深。回头也找不出一个能报明的确日。 # beat:nq_ordinary_day_4 # scene:nq_school # cast:nq_young # speaker:narrator
* [先答眼前弟子，看他怎样进，不急着把自己那一瞬说成全班都得会的道理。 # cid:nq_reply_to_pupil]
  ~ nq_ordinary_reply = true
  你再来。先看你自己的脚。 # beat:nq_ordinary_day_5 # scene:nq_school # cast:nq_young # speaker:you
  你让他重走，身体没有因知道刚才像什么便忽然不再腰痛。可他试第二遍时，你没有拿一个进字堵住他的问。 # beat:nq_ordinary_day_6 # scene:nq_school # cast:nq_young # speaker:narrator
  -> han_gate
* [请弟子照样再进，自己再接一次，不凭一瞬便给年月填上确定日子。 # cid:nq_try_once_again]
  ~ nq_ordinary_reply = false
  他再进，脚也变了。你接住的是眼前这一枪，不是重复一个能给后人抄成开悟时刻的姿势。 # beat:nq_ordinary_day_7 # scene:nq_school # cast:nq_young # speaker:narrator
  这回肩别先紧，再来。 # beat:nq_ordinary_day_8 # scene:nq_school # cast:nq_young # speaker:you
  -> han_gate

=== han_gate ===
后来再坐北榜第一，韩世雄已是总谱人物、门前一人，多年没有未入化者在公平正面交手中胜他。有人觉得你已经进，有人还说只是枪深。他愿打一场：自己也想知道。 # beat:nq_han_gate_1 # scene:nq_hanyard # cast:nq_hanshi # speaker:narrator
河洛韩家旧场，前三十招你未真进他三尺，他也不抢。第三十一，金刀横切。你不再像十余年前硬压刀背，枪头自然下沉，让刀沿枪滑过，尖已自下递入。韩第一次退。 # beat:nq_han_gate_2 # scene:nq_hanyard # cast:nq_hanshi # speaker:narrator
再近一些。 # beat:nq_han_gate_3 # scene:nq_hanyard # cast:nq_hanshi # speaker:nq_hanshi # mood:nq_hanshi=intent
第八十七，他忽用最短一路，连抢七步七刀。你退六步，第七步，没有退。 # beat:nq_han_gate_4 # scene:nq_hanyard # cast:nq_hanshi # speaker:narrator
* [枪柄落地竖杆，顺第八刀压弯的势转回枪尾，不以再退一步续旧局。 # cid:nq_stand_seventh]
  ~ nq_han_method = 1
  第八刀落在杆中，弯势传入掌。你顺它转杆，尾自另一侧扫来，韩只能退开。 # beat:nq_han_gate_5 # scene:nq_hanyard # cast:nq_hanshi # speaker:narrator
  第九十五，两人重新拉远，他忽然笑，说进了。你没问进什么，眼前下一刀却仍得真接。 # beat:nq_han_gate_6 # scene:nq_hanyard # cast:nq_hanshi # speaker:narrator
  -> one_thirty_two
* [先接住杆中弯起的力，让枪尾从侧面回，不在近处硬与刀比直。 # cid:nq_turn_bending_pole]
  ~ nq_han_method = 2
  枪柄点地，长枪竖起，接住第八刀。你没替那一下弯求一个永远不动的稳，顺着转，枪尾逼得韩退。 # beat:nq_han_gate_7 # scene:nq_hanyard # cast:nq_hanshi # speaker:narrator
  第九十五，他说进了，笑意却不替你挡随后更凶的刀。 # beat:nq_han_gate_8 # scene:nq_hanyard # cast:nq_hanshi # speaker:narrator
  -> one_thirty_two

=== one_thirty_two ===
百招后他更凶。一百一十九刀背点你左臂，见血；一百二十七枪挑开他衣襟。一百三十一，他三刀逼枪离中，第四直入。 # beat:nq_one_thirty_two_1 # scene:nq_hanyard # cast:nq_hanshi # speaker:narrator
你忽松右手。多年前薛云山正这样破你的近枪，今日长枪从双手间滑半尺，左手控尾，枪头像自己回来。刀进，枪却更早：尖停他胸前一寸，刀停你肩外四寸。 # beat:nq_one_thirty_two_2 # scene:nq_hanyard # cast:nq_hanshi # speaker:narrator
第一百三十二。韩看很久，收刀认输。江湖从此少再争你是否已入化，今日这一枪也未替你先走完返真的路。 # beat:nq_one_thirty_two_3 # scene:nq_hanyard # cast:nq_hanshi # speaker:narrator
差得多么？ # beat:nq_one_thirty_two_4 # scene:nq_hanyard # cast:nq_hanshi # speaker:you
你进去了，还问我门外？ # beat:nq_one_thirty_two_5 # scene:nq_hanyard # cast:nq_hanshi # speaker:nq_hanshi # mood:nq_hanshi=amused
你站得最近。 # beat:nq_one_thirty_two_6 # scene:nq_hanyard # cast:nq_hanshi # speaker:you
正因为近，才知里面多远。 # beat:nq_one_thirty_two_7 # scene:nq_hanyard # cast:nq_hanshi # speaker:nq_hanshi # mood:nq_hanshi=intent
* [认他的见闻，不以赢过门外一人就叫他从此不能再指自己的差。 # cid:nq_keep_gate_witness]
  ~ nq_han_witness = true
  你请他看刚才左臂被点的地方，那里仍有血。他没因认输便改口说本来让你，指了你肩前还可早换的一线。 # beat:nq_one_thirty_two_8 # scene:nq_hanyard # cast:nq_hanshi # speaker:narrator
  你听完，自己试一下，才去包臂。 # beat:nq_one_thirty_two_9 # scene:nq_hanyard # cast:nq_hanshi # speaker:narrator
  -> qinghe
* [把更深处留给以后真问，今日先承认这场若少半寸便仍会被他近刀逼住。 # cid:nq_ask_inside_later]
  ~ nq_han_witness = false
  你们把刀与枪从停处再慢移一次，胸前一寸与肩外四寸并没因赢输便变成整整一层轻重。 # beat:nq_one_thirty_two_10 # scene:nq_hanyard # cast:nq_hanshi # speaker:narrator
  往前走。别回来把今天说成你随手就赢。 # beat:nq_one_thirty_two_11 # scene:nq_hanyard # cast:nq_hanshi # speaker:nq_hanshi # mood:nq_hanshi=neutral
  -> qinghe

=== qinghe ===
坐稳北榜第一后上武当，你问的不是掌门、首席，是玄门第九清和。九席不是天下擂台榜，能入本身已是门里极深的一层。 # beat:nq_qinghe_1 # scene:nq_wudang # cast:nq_qinghe # speaker:narrator
他不取剑，拿藤条，说先不用，逼他拿再拿。你十余枪连进，他每退一步，偏让下一枪短半寸。第三十六变节奏三枪一枪，藤条一横，尖偏；再变线向肩，藤却点右腕，你只得撤手。 # beat:nq_qinghe_2 # scene:nq_wudang # cast:nq_qinghe # speaker:narrator
楚怀锋教得好。 # beat:nq_qinghe_3 # scene:nq_wudang # cast:nq_qinghe # speaker:nq_qinghe # mood:nq_qinghe=intent
真人认识家师？交过手？ # beat:nq_qinghe_4 # scene:nq_wudang # cast:nq_qinghe # speaker:you
年轻见过，没打。他觉我不会枪，我觉他不会剑，没什么好打。 # beat:nq_qinghe_5 # scene:nq_wudang # cast:nq_qinghe # speaker:nq_qinghe # mood:nq_qinghe=amused
五十以后你放开，清和却更少。一放藤条，你整路枪势便得重来。第八十三划他左袖一寸，他说好枪，你知他能避，只为看完后半枪晚退半刻。 # beat:nq_qinghe_6 # scene:nq_wudang # cast:nq_qinghe # speaker:narrator
* [看他让你走到哪里，不再把袖上一寸当自己已逼到用剑。 # cid:nq_read_chosen_place]
  ~ nq_qinghe_place = true
  百招后他向前，藤每进，你便退。你想从旧枪里换一条，才看见半数路都得先经过他已经站好的地方。 # beat:nq_qinghe_7 # scene:nq_wudang # cast:nq_qinghe # speaker:narrator
  -> one_forty_one
* [真试一遍完整架子还能否续出，不先为见袖破便催一场胜。 # cid:nq_save_whole_again]
  ~ nq_qinghe_place = false
  百招后他往前，完整架子看似仍在，下一枪却总要从已被他占住的一处起。你退过一百一十二、一百二十、一百三十，终于知道不能再照样走。 # beat:nq_qinghe_8 # scene:nq_wudang # cast:nq_qinghe # speaker:narrator
  -> one_forty_one

=== one_forty_one ===
第一百四十一，你自停：再这样三十招内要输。清和没替你判输，只说那便换。 # beat:nq_one_forty_one_1 # scene:nq_wudang # cast:nq_qinghe # speaker:narrator
你短握，左手前移，长枪打成半枪半棍。二十余招真拉回来，一百六十三枪尾撞藤，首次震开；枪头回转，直入胸前。 # beat:nq_one_forty_one_2 # scene:nq_wudang # cast:nq_qinghe # speaker:narrator
* [顺着半枪半棍真争这一线，承认变过仍未必越过眼前的人。 # cid:nq_continue_real_change]
  ~ nq_qinghe_change = 1
  清和松藤，右手两指搭杆，旁带半寸。你忽觉整杆没有可发的力，左手两指已停喉前。 # beat:nq_one_forty_one_3 # scene:nq_wudang # cast:nq_qinghe # speaker:narrator
  一百六十四，败。你行礼受教，没为自己确曾拉回来二十招便多添一场平。 # beat:nq_one_forty_one_4 # scene:nq_wudang # cast:nq_qinghe # speaker:narrator
  -> one_sixty_four
* [不追已经松掉的藤条，试着接他的手，仍被先占的那半寸带尽。 # cid:nq_follow_unheld_cane]
  ~ nq_qinghe_change = 2
  你看见他松手，已不算被旧动作骗住；可两指贴杆带半寸时，你的力仍落不到可续处。另手停喉前。 # beat:nq_one_forty_one_5 # scene:nq_wudang # cast:nq_qinghe # speaker:narrator
  一百六十四，败。看见与能接住，今日仍是两件事。你收枪行礼。 # beat:nq_one_forty_one_6 # scene:nq_wudang # cast:nq_qinghe # speaker:narrator
  -> one_sixty_four

=== one_sixty_four ===
受教。 # beat:nq_one_sixty_four_1 # scene:nq_wudang # cast:nq_qinghe # speaker:you
后来问北榜第一与玄门第九差多少，你只说玄门的第九不是天下第九。你没有把藤条算成一件能买来便胜过枪的神兵，也没有在一场问艺后替清和补全天下绝对名次。 # beat:nq_one_sixty_four_2 # scene:nq_wudang # cast:nq_qinghe # speaker:narrator
再后来，金陵城外旧园。顾长风总谱第九，你第十一；两人都入化多年。他年长十余岁，早练、早见、也早输过很多场。柳成章与几位够资格的旧人，在园边等真枪真剑。 # beat:nq_one_sixty_four_3 # scene:nq_wudang # cast:nq_qinghe # speaker:narrator
-> gu_garden

=== gu_garden ===
真枪？ # beat:nq_gu_garden_1 # scene:nq_garden # cast:nq_gu,nq_liu # speaker:nq_gu # mood:nq_gu=intent
真剑。 # beat:nq_gu_garden_2 # scene:nq_garden # cast:nq_gu,nq_liu # speaker:you
那便都别装。 # beat:nq_gu_garden_3 # scene:nq_garden # cast:nq_gu,nq_liu # speaker:nq_gu # mood:nq_gu=amused
前十招你没真碰他，他也没剑攻入。柳在旁看，你枪越走，地方越小，他剑越走，地方却像没边。第三十二，剑从杆外来，回枪时已不在那里，又从另一侧出现，尾恰迎上。 # beat:nq_gu_garden_4 # scene:nq_garden # cast:nq_gu,nq_liu # speaker:narrator
好整。 # beat:nq_gu_garden_5 # scene:nq_garden # cast:nq_gu,nq_liu # speaker:nq_gu # mood:nq_gu=neutral
好空。 # beat:nq_gu_garden_6 # scene:nq_garden # cast:nq_gu,nq_liu # speaker:you
五十、八十、百招，反而越慢。多走的一步，有时只是多送给对方一样。 # beat:nq_gu_garden_7 # scene:nq_garden # cast:nq_gu,nq_liu # speaker:narrator
* [继续把能走的路真收拢，不因对方空就自己先乱散。 # cid:nq_close_real_space]
  ~ nq_gu_begin = 1
  你前封中、后压侧，到第一百二十八，顾只剩半步退处。这里是你最会的局，枪并没因他名气大便自动错。 # beat:nq_gu_garden_8 # scene:nq_garden # cast:nq_gu,nq_liu # speaker:narrator
  -> one_twenty_eight
* [每收一处仍看他真实剑路，不用一套早想好的空字替他站位。 # cid:nq_wait_gu_change]
  ~ nq_gu_begin = 2
  你等他走到真够得着的地方才再收，第一百二十八，同样前封中、后压侧，压到半步退路。你做得完整，他却并未按那半步退走。 # beat:nq_gu_garden_9 # scene:nq_garden # cast:nq_gu,nq_liu # speaker:narrator
  -> one_twenty_eight

=== one_twenty_eight ===
顾忽停，不退不换，从枪势最不像路的地方出一剑。你主动撤，他没追。你问叫什么，他说没名字。你笑着再来。 # beat:nq_one_twenty_eight_1 # scene:nq_garden # cast:nq_gu # speaker:narrator
一百五十后真争胜。你枪越整，他剑越散，越难锁；二百一十四划你右袖，未入肉；二百二十一枪擦他左肩，见血。 # beat:nq_one_twenty_eight_2 # scene:nq_garden # cast:nq_gu # speaker:narrator
二百五十六，三枪逼剑、逼步、锁中，剑枪轻碰。你左手松、右手送，尖多半尺，剑也自枪下进。两件兵器各距胸喉三寸，同时停。 # beat:nq_one_twenty_eight_3 # scene:nq_garden # cast:nq_gu # speaker:narrator
平？ # beat:nq_one_twenty_eight_4 # scene:nq_garden # cast:nq_gu # speaker:nq_gu # mood:nq_gu=amused
还没有。 # beat:nq_one_twenty_eight_5 # scene:nq_garden # cast:nq_gu # speaker:you
那继续。 # beat:nq_one_twenty_eight_6 # scene:nq_garden # cast:nq_gu # speaker:nq_gu # mood:nq_gu=intent
* [继续真争，不用两边都是三寸就先领一场同高的名。 # cid:nq_continue_without_claim]
  ~ nq_gu_continue = true
  二百七十后，你枪反比先前更整，连续逼他退五步。不是因马上要输就先乱给人看，今天你已走到比来时更深的地方。 # beat:nq_one_twenty_eight_7 # scene:nq_garden # cast:nq_gu # speaker:narrator
  -> three_hundred_one
* [继续看他何时肯出剑，别把刚才同时停的那一瞬当后面也会同时。 # cid:nq_watch_next_timing]
  ~ nq_gu_continue = false
  你变过了，二百七十后更整，也逼他退五步。可一场里看见一次还不够，真正到毫厘时，身体仍会替你先作一个旧日最合理的准备。 # beat:nq_one_twenty_eight_8 # scene:nq_garden # cast:nq_gu # speaker:narrator
  -> three_hundred_one

=== three_hundred_one ===
第三百零一，你封死左路，顾只能从右出，枪已在等。剑却故意晚半拍，等你势先走才贴枪过。你连化五剑，第六才稳，想反压，他偏不出第七，先收半寸。 # beat:nq_three_hundred_one_1 # scene:nq_garden # cast:nq_gu # speaker:narrator
你枪已为那一剑先动。就这一点，他进，剑停左胸，枪回到他右肩外，仍差七寸。 # beat:nq_three_hundred_one_2 # scene:nq_garden # cast:nq_gu # speaker:narrator
第三百零八。你收枪认输，他说只一手，你答一手也是输。今日高半筹的是顾，不是境界差一层，更不是因玩家肯改便该把固定胜负还给玩家。 # beat:nq_three_hundred_one_3 # scene:nq_garden # cast:nq_gu # speaker:narrator
* [先重走三百零一的先动，不急着替未来会超过讨一份今日胜利。 # cid:nq_ask_three_oh_one]
  ~ nq_gu_question = true
  这里先换手，还是先撤？ # beat:nq_three_hundred_one_4 # scene:nq_garden # cast:nq_gu # speaker:you
  先把为什么已替第七剑动了走给自己看。 # beat:nq_three_hundred_one_5 # scene:nq_garden # cast:nq_gu # speaker:nq_gu # mood:nq_gu=intent
  你把枪移回原处。手仍有最后收回的热，今日那半拍却已值得再想。 # beat:nq_three_hundred_one_6 # scene:nq_garden # cast:nq_gu # speaker:narrator
  -> years_win
* [让他说明为何晚那一点，不用天赋高便不该输把他的岁月一并略掉。 # cid:nq_let_gu_explain]
  ~ nq_gu_question = false
  你等的是该从那里出的剑。我偏晚一点。 # beat:nq_three_hundred_one_7 # scene:nq_garden # cast:nq_gu # speaker:nq_gu # mood:nq_gu=neutral
  你并非没见过欺与变，今日输的也不是傻。到了最后，他在你刚开始想的地方确已多走一段。 # beat:nq_three_hundred_one_8 # scene:nq_garden # cast:nq_gu # speaker:narrator
  -> years_win

=== years_win ===
酒后，柳问赢在哪，顾答因为比你老。他早练十几年，早入榜、见人、也早输该输的仗；你四十才犯的，有些他三十已犯。天赋呢？他望向还在拆那一枪的你，说你更高。 # beat:nq_years_win_1 # scene:nq_garden # cast:nq_gu,nq_liu # speaker:narrator
今日是你赢。 # beat:nq_years_win_2 # scene:nq_garden # cast:nq_gu,nq_liu # speaker:nq_liu # mood:nq_liu=intent
赢他，和他天赋比我高，有什么冲突？ # beat:nq_years_win_3 # scene:nq_garden # cast:nq_gu,nq_liu # speaker:nq_gu # mood:nq_gu=amused
他觉得你改得快，敢扔，往后会超过。有人说客气，他问为何要同你客气。问到你，你只说先把今日这一剑想明白。往后并未写定的一场，不替今天赢输倒账。 # beat:nq_years_win_4 # scene:nq_garden # cast:nq_gu,nq_liu # speaker:narrator
后来人说当日顾高半筹，不是天资胜，是岁月胜。你也没让后来讲这场问艺的人少提顾。 # beat:nq_years_win_5 # scene:nq_garden # cast:nq_gu,nq_liu # speaker:narrator
* [把顾的晚半拍和自己的先动一起记，不把后来的赞许盖在输字上。 # cid:nq_keep_gu_in_notes]
  ~ nq_gu_notes = true
  你写到三百零八，仍写败。旁边留下第七剑没有出的那一下，给后来人真能试的地方，不替他们先写总有一天都能赢。 # beat:nq_years_win_6 # scene:nq_garden # cast:nq_gu,nq_liu # speaker:narrator
  -> last_tea
* [请柳从旁再试着指出自己先动的时刻，容一个旁观者也真有看见。 # cid:nq_try_with_liu]
  ~ nq_gu_notes = false
  柳拿一根细枝慢比，你试回枪，才发现方才只盯着自己的换手。他看见的不是全部，却也不是因为自己没拿枪就都不算。 # beat:nq_years_win_7 # scene:nq_garden # cast:nq_gu,nq_liu # speaker:narrator
  你肯先听完，我今日这盏酒才没白等。 # beat:nq_years_win_8 # scene:nq_garden # cast:nq_gu,nq_liu # speaker:nq_liu # mood:nq_liu=amused
  -> last_tea

=== last_tea ===
另一段记忆，要回到七十六岁。那是你最后一次见司马衡，不能把今日旧园的人都带进当年的终南茶席。老人极老，精神尚好。你问现在到哪，他说入化了。然后呢？继续练。 # beat:nq_last_tea_1 # scene:nq_oldyard # cast:nq2_heng # speaker:narrator # cg:plainTea # action:旧日茶席
你笑，又问返真。老人喝口茶，说远，远到现在最好别想。你沉默一阵，说那就先练。 # beat:nq_last_tea_2 # scene:nq_oldyard # cast:nq2_heng # speaker:narrator
对。 # beat:nq_last_tea_3 # scene:nq_oldyard # cast:nq2_heng # speaker:nq2_heng # mood:nq2_heng=amused # cg:none # camera:portrait
没有一场临别灌功，也没因你是第三个老师的得意门人就提前许下返真。茶喝完，院里仍有要扫的叶。 # beat:nq_last_tea_4 # scene:nq_oldyard # cast:nq2_heng # speaker:narrator
* [把旧观椅子换下的扶手收在行李里，记得这人先叫自己劈柴。 # cid:nq_take_chair_piece]
  ~ nq_chair_keep = true
  那块旧扶手，是当年离旧观时老人扔给你，叫留着烧火的。你没烧，后来也一直没烧。 # beat:nq_last_tea_5 # scene:nq_oldyard # cast:nq2_heng # speaker:narrator
  你摸过磨旧的边，不把一块木头另编成太极秘谱。 # beat:nq_last_tea_6 # scene:nq_oldyard # cast:nq2_heng # speaker:narrator
  -> three_objects
* [记住他今日仍只叫继续练，不替师徒最后见面补一段知道是诀别的大话。 # cid:nq_keep_ordinary_words]
  ~ nq_chair_keep = false
  你离去时不知道这会是最后一面。多年后仍能记住茶与一句先练，没必要让自己当年多会一层预知。 # beat:nq_last_tea_7 # scene:nq_oldyard # cast:nq2_heng # speaker:narrator
  旧观椅扶手早在行李里，老人曾叫烧火，你没烧，它也没有因此变成法器。 # beat:nq_last_tea_8 # scene:nq_oldyard # cast:nq2_heng # speaker:narrator
  -> three_objects

=== three_objects ===
八十余岁，北榜第一、总谱第十一。枪房挂三件：发黑旧白蜡枪，周定川给的；半截断杆，楚怀锋晚年试枪所留；一块旧木椅扶手，司马衡随手叫留着烧火。 # beat:nq_three_objects_1 # scene:nq_gunroom # cast:nq_yuan,nq_young # speaker:narrator
周老师一生没进北榜，是不是天赋还差一点？ # beat:nq_three_objects_2 # scene:nq_gunroom # cast:nq_yuan,nq_young # speaker:nq_young # mood:nq_young=uneasy
没有周定川，哪来的秦天岳？ # beat:nq_three_objects_3 # scene:nq_gunroom # cast:nq_yuan,nq_young # speaker:you
你声音沉下去。他没料你为一个地方宗师这样认真，阿原在旁把旧枪扶正，没替他说只是不懂事便略过那一句。 # beat:nq_three_objects_4 # scene:nq_gunroom # cast:nq_yuan,nq_young # speaker:narrator
* [带后辈真练一轮扎拦拿，再让他自己说三位老师各教过什么。 # cid:nq_end_teach]
  ~ nq_legacy = 1
  你少去一场外地的邀约，把旧枪从架上拿下。年轻人本以为听完三段传奇便能回去，你叫他先站到纸前，别破。 # beat:nq_three_objects_5 # scene:nq_gunroom # cast:nq_yuan,nq_young # speaker:narrator
  这一轮我也来。你别把他从第一下错就全替了。 # beat:nq_three_objects_6 # scene:nq_gunroom # cast:nq_yuan,nq_young # speaker:nq_yuan # mood:nq_yuan=amused
  你点头，先看那只还没稳的手。 # beat:nq_three_objects_7 # scene:nq_gunroom # cast:nq_yuan,nq_young # speaker:narrator
  -> what_to_leave
* [带后辈去问旧馆仍记得老师的人，把三件物旁的来处留给真正见过的人说。 # cid:nq_end_visits]
  ~ nq_legacy = 2
  你少亲带一班，交给阿原，自己带年轻人去旧馆里坐。他想先摆总谱第十一的名，你叫收回，让对方先讲周老师当年怎样骂人。 # beat:nq_three_objects_8 # scene:nq_gunroom # cast:nq_yuan,nq_young # speaker:narrator
  一趟不能同时到所有地方，楚师的旧门你另托人约，不把自己的三句话算成已替各家都见过。 # beat:nq_three_objects_9 # scene:nq_gunroom # cast:nq_yuan,nq_young # speaker:narrator
  -> what_to_leave

=== what_to_leave ===
他第一次不再只问三个老师分别排第几。你也没把司马衡的返真当作能把其他两位压到角落的秤。一个把枪练成，一个让练成以后还会输，最后一个肯让名震天下的人重新什么都不会。 # beat:nq_what_to_leave_1 # scene:nq_gunroom # cast:nq_yuan,nq_young # speaker:narrator
{
- nq_handoff:
阿原拿出当年那五日带课改的旧页，旁边又添自己几十年的注。他能记起你走前真让过他开口，不只记一个后来越来越高的师兄。 # beat:nq_what_to_leave_2 # scene:nq_gunroom # cast:nq_yuan,nq_young # speaker:narrator
这一页我来讲，后面你若另走了，不必叫他们以为我也全会。 # beat:nq_what_to_leave_3 # scene:nq_gunroom # cast:nq_yuan,nq_young # speaker:nq_yuan # mood:nq_yuan=intent
- else:
阿原把当年推迟半年开夜班、错过回乡那一程也讲出来。你没让后辈因自己成名就删去朋友的损失，补过的钱记着，没能同坐过的那顿饭也记着。 # beat:nq_what_to_leave_4 # scene:nq_gunroom # cast:nq_yuan,nq_young # speaker:narrator
后来班开起来了。我只是不想让他们以为，你一封信，别人的日子就自己接上。 # beat:nq_what_to_leave_5 # scene:nq_gunroom # cast:nq_yuan,nq_young # speaker:nq_yuan # mood:nq_yuan=intent
}
{
- nq_relearn_plain:
后来那位晚辈早已敢在堂前说不会。教更年轻的人时，他先讲秦师六十一仍写信认重学，没把一生只会越来越强当作拜师前必须装的样子。 # beat:nq_what_to_leave_6 # scene:nq_gunroom # cast:nq_yuan,nq_young # speaker:narrator
- else:
曾传的伤退说法，后辈如今能讲清。他仍记得那半月额外的馆师和两日撤约，也记得你真回来说明，不拿被误会就从此不必开口作结。 # beat:nq_what_to_leave_7 # scene:nq_gunroom # cast:nq_yuan,nq_young # speaker:narrator
}
-> one_more_spear

=== one_more_spear ===
少年问这三件究竟哪位师父最要紧，你只说师父的东西。不是分不清名字，是不肯用最后一位的高处把前面的路划没。 # beat:nq_one_more_spear_1 # scene:nq_gunroom # cast:nq_young # speaker:narrator
秦天岳到今日仍未返真。十三肯重新第一枪，六十一也肯，晚来的人不必先等你走到一个已经写好的尽头，才敢把自己的枪举起。 # beat:nq_one_more_spear_2 # scene:nq_gunroom # cast:nq_young # speaker:narrator
{
- nq_legacy == 1:
纸轻轻动，没破。你没有替他把这一枪叫作天赋，只叫他再来一回，自己也重新站好。 # beat:nq_one_more_spear_3 # scene:nq_gunroom # cast:nq_young # speaker:narrator # ending:nq_first_again
-> END
- else:
回程的年轻人会说三个人的名字，也会说自己没亲眼见过哪一段。枪房仍留三处，后来人的问话终于不必只从最高那一席开始。 # beat:nq_one_more_spear_4 # scene:nq_gunroom # cast:nq_young # speaker:narrator # ending:nq_three_names
-> END
}
