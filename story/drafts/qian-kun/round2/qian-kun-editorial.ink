// Source: 宋世江湖32538–33332. Sima is Taiji; public first is not an absolute universe ranking.
VAR qk_first_waist = false
VAR qk_weapon_return = false
VAR qk_letter_check = false
VAR qk_false_step = false
VAR qk_plain_question = false
VAR qk_xue_praise = false
VAR qk_natural_test = false
VAR qk_half_cup = false
VAR qk_refusal = false
VAR qk_office_plain = false
VAR qk_watch_slow = false
VAR qk_boy_try = false
VAR qk_head_clear = false
VAR qk_unwon = false
VAR qk_teacher_honest = false
VAR qk_mountain_handoff = false
VAR qk_outside = false
VAR qk_named_unknown = false
VAR qk_cloud = false
VAR qk_rumor_plain = false
VAR qk_rope = false
VAR qk_missing_plain = false
VAR qk_zhou_change = 0
VAR qk_legacy = 0
-> short_inch

=== short_inch ===
第三步，左脚短一寸。你看那掌第五次回到身前，腰果然要多转一点，忍不住在三十余名记招的弟子里开口。 # beat:qk_short_inch_1 # scene:qk_training # cast:qk_tutor,qk_xu # speaker:narrator
你叫司马天岳，十四岁，太极门人。九岁仍常算错小账，十一买盐多花钱少半斤，十二被锈剑骗走压岁钱；挨训时还想那柄假古剑重心做得真好。 # beat:qk_short_inch_2 # scene:qk_training # cast:qk_tutor,qk_xu # speaker:narrator
你上来走。 # beat:qk_short_inch_3 # scene:qk_training # cast:qk_tutor,qk_xu # speaker:qk_tutor # mood:qk_tutor=sharp
你只看过几遍，脚真补过去，腰便少绕那半分。教习没把这次失误藏起来，叫你再走给后面的人看，自己也站到那一步试。 # beat:qk_short_inch_4 # scene:qk_training # cast:qk_tutor,qk_xu # speaker:narrator
那半斤盐，你也肯再看一眼就好了。 # beat:qk_short_inch_5 # scene:qk_training # cast:qk_tutor,qk_xu # speaker:qk_xu # mood:qk_xu=amused
明日我再去。 # beat:qk_short_inch_6 # scene:qk_training # cast:qk_tutor,qk_xu # speaker:you
明日先找我拿钱。上回钱也少找了，你别又空着手去讲脚短一寸。 # beat:qk_short_inch_7 # scene:qk_training # cast:qk_tutor,qk_xu # speaker:qk_xu # mood:qk_xu=neutral
* [先把第五掌怎样回来走清，不因当众指出一寸便以为整套都对。 # cid:qk_show_waist]
  ~ qk_first_waist = true
  你慢走，教习从旁托你的肘。脚补上，肘却抬高了，你看一眼他的手，又走一次。 # beat:qk_short_inch_8 # scene:qk_training # cast:qk_tutor,qk_xu # speaker:narrator
  别光看我。看你的肘。 # beat:qk_short_inch_9 # scene:qk_training # cast:qk_tutor,qk_xu # speaker:qk_tutor # mood:qk_tutor=intent
  后排有人笑，你把手臂摆平，等教习真从那一侧进。 # beat:qk_short_inch_10 # scene:qk_training # cast:qk_tutor,qk_xu # speaker:narrator
  -> four_weapons
* [请教习从另一侧进，看看这一步换人接还会怎样。 # cid:qk_test_same_step]
  ~ qk_first_waist = false
  来掌不同，你得再让半步。原来第五掌少转那半分，也不是从此永远留给自己的空处。 # beat:qk_short_inch_11 # scene:qk_training # cast:qk_tutor,qk_xu # speaker:narrator
  先练，别等会又忘了吃饭。那也是你自己一张嘴。 # beat:qk_short_inch_12 # scene:qk_training # cast:qk_tutor,qk_xu # speaker:qk_xu # mood:qk_xu=amused
  -> four_weapons

=== four_weapons ===
三日后，多年不收徒的司马衡来。不让打太极，先丢棍、刀、枪、剑，每样半个时辰。你都不会，拿到手却先找重心、最难回的地方，手脚怎样少绕。 # beat:qk_four_weapons_1 # scene:qk_oldyard # cast:qk2_heng_earlier # speaker:narrator
最喜欢哪样？ # beat:qk_four_weapons_2 # scene:qk_oldyard # cast:qk2_heng_earlier # speaker:qk2_heng_earlier # mood:qk2_heng_earlier=intent
都喜欢。我只是喜欢怎么打比较对。 # beat:qk_four_weapons_3 # scene:qk_oldyard # cast:qk2_heng_earlier # speaker:you
老人当天收徒。后来有人说你学招快，他说不是，看武功时，你的脑子和别人不是同一个东西。 # beat:qk_four_weapons_4 # scene:qk_oldyard # cast:qk2_heng_earlier # speaker:narrator
可出了院门，你仍是那个会把假剑翻过来算重心、把真零钱算错的少年。 # beat:qk_four_weapons_5 # scene:qk_oldyard # cast:qk2_heng_earlier # speaker:narrator
* [挑一件自己最难收回的再问，不只记老人今日愿意收徒。 # cid:qk_ask_return]
  ~ qk_weapon_return = true
  枪收太满，你看半天，先把前手挪了一点。老人不给一套立刻完整的法，叫你明日还拿这件。 # beat:qk_four_weapons_6 # scene:qk_oldyard # cast:qk2_heng_earlier # speaker:narrator
  明日还拿枪。其余三件别跟着滚到我脚边，先收回架上。 # beat:qk_four_weapons_7 # scene:qk_oldyard # cast:qk2_heng_earlier # speaker:qk2_heng_earlier # mood:qk2_heng_earlier=amused
  你才看见刀背挤在棍底下。挪开时又看起它的重心，老人咳一声，你赶紧把它放稳。 # beat:qk_four_weapons_8 # scene:qk_oldyard # cast:qk2_heng_earlier # speaker:narrator
  -> forgot_letter
* [换握法试四件的重心，愿意从完全不会的地方再开始。 # cid:qk_try_balance]
  ~ qk_weapon_return = false
  刀与棍回到同一处，手却不能用一样的拧法。你试得起劲，老人先把枪收起来，问今天还有没有别的事。 # beat:qk_four_weapons_9 # scene:qk_oldyard # cast:qk2_heng_earlier # speaker:narrator
  吃饭？ # beat:qk_four_weapons_10 # scene:qk_oldyard # cast:qk2_heng_earlier # speaker:you
  总算还记一件。 # beat:qk_four_weapons_11 # scene:qk_oldyard # cast:qk2_heng_earlier # speaker:qk2_heng_earlier # mood:qk2_heng_earlier=amused
  -> forgot_letter

=== forgot_letter ===
师父叫送信。你半路看两名弟子练剑，站一下午，回去竟问什么信。许师姐提灯拦住你，照见你怀里露出的信封角。信还没送，她已经等到收灯的时候。 # beat:qk_forgot_letter_1 # scene:qk_path # cast:qk_xu # speaker:narrator
不是剑给你送信。信在你怀里，人等你一下午。 # beat:qk_forgot_letter_2 # scene:qk_path # cast:qk_xu # speaker:qk_xu # mood:qk_xu=intent
我真忘了。 # beat:qk_forgot_letter_3 # scene:qk_path # cast:qk_xu # speaker:you
我知道你不是故意。等的人也照样等了。 # beat:qk_forgot_letter_4 # scene:qk_path # cast:qk_xu # speaker:qk_xu # mood:qk_xu=neutral
* [以后送前说给同门听、送到请对方回一句，不只靠自己答应记住。 # cid:qk_leave_plain_receipt]
  ~ qk_letter_check = true
  下回出门，我先把去哪、送谁说给你。到了再来回话。 # beat:qk_forgot_letter_5 # scene:qk_path # cast:qk_xu # speaker:you
  出门前来找我，别等明日又叫我问你往哪儿去。 # beat:qk_forgot_letter_6 # scene:qk_path # cast:qk_xu # speaker:qk_xu # mood:qk_xu=amused
  你不在呢？ # beat:qk_forgot_letter_7 # scene:qk_path # cast:qk_xu # speaker:you
  找当值的。总有人在，可不是总有人跟着你。 # beat:qk_forgot_letter_8 # scene:qk_path # cast:qk_xu # speaker:qk_xu # mood:qk_xu=neutral
  你次日补送，没因定下办法就把今日的等算成没有。 # beat:qk_forgot_letter_9 # scene:qk_path # cast:qk_xu # speaker:narrator
  -> eighteen
* [承认今日耽误，先答应自己送完再看剑，暂不请旁人提醒。 # cid:qk_trust_own_memory]
  ~ qk_letter_check = false
  我下次先送，再看。 # beat:qk_forgot_letter_10 # scene:qk_path # cast:qk_xu # speaker:you
  那你得真的先送。我也有自己的课，不能跟在你后面数走了几步。 # beat:qk_forgot_letter_11 # scene:qk_path # cast:qk_xu # speaker:qk_xu # mood:qk_xu=intent
  你补送时真没停下，却还不知道很多年以后同一条路也会换一种使你分心的东西。 # beat:qk_forgot_letter_12 # scene:qk_path # cast:qk_xu # speaker:narrator
  -> eighteen

=== eighteen ===
十八岁，同龄少有敌手，你以为山外也不过如此。地方武会前两场轻胜，第三个三十余岁的刀客看起来并没比你武功更高。 # beat:qk_eighteen_1 # scene:qk_fair # cast:qk_knifeman,qk2_heng_earlier # speaker:narrator
二十余招，他脚下一滑，肋前敞开。你见空便进，下一瞬，袖里短尺点在自己肋下。 # beat:qk_eighteen_2 # scene:qk_fair # cast:qk_knifeman,qk2_heng_earlier # speaker:narrator
输了。肋下那点还疼，你再看他的脚，鞋底稳稳贴着地。刀客收尺，等你把抢进来的半步退回去。 # beat:qk_eighteen_3 # scene:qk_fair # cast:qk_knifeman,qk2_heng_earlier # speaker:narrator
没摔。等你进。 # beat:qk_eighteen_4 # scene:qk_fair # cast:qk_knifeman,qk2_heng_earlier # speaker:qk_knifeman # mood:qk_knifeman=amused
* [请他再走那一步，看假滑怎样骗过自己，不先骂不该这样打。 # cid:qk_ask_false_step]
  ~ qk_false_step = true
  他慢走，肩先作一下来不及收的样子，脚却仍有可转处。你只盯那点空，就替他把剩下那步摔完了。 # beat:qk_eighteen_5 # scene:qk_fair # cast:qk_knifeman,qk2_heng_earlier # speaker:narrator
  你以为是我站不住，便站进我等的地方。 # beat:qk_eighteen_6 # scene:qk_fair # cast:qk_knifeman,qk2_heng_earlier # speaker:qk_knifeman # mood:qk_knifeman=intent
  -> people_lie
* [重走自己见空便进的一刻，承认急着取胜也参与了这一骗。 # cid:qk_retrace_own_entry]
  ~ qk_false_step = false
  师父站在旁边不动，你只走自己的脚，走到一半便停。那一刻你已经替对方决定他只能倒下。 # beat:qk_eighteen_7 # scene:qk_fair # cast:qk_knifeman,qk2_heng_earlier # speaker:narrator
  他的脚还没说完，你先替他答了。 # beat:qk_eighteen_8 # scene:qk_fair # cast:qk_knifeman,qk2_heng_earlier # speaker:qk2_heng_earlier # mood:qk2_heng_earlier=intent
  -> people_lie

=== people_lie ===
想一夜，第二日你说，比武不只身体。师父问还有什么，你又想很久。 # beat:qk_people_lie_1 # scene:qk_oldyard # cast:qk2_heng_earlier # speaker:narrator
人会撒谎。 # beat:qk_people_lie_2 # scene:qk_oldyard # cast:qk2_heng_earlier # speaker:you
现在才知道？ # beat:qk_people_lie_3 # scene:qk_oldyard # cast:qk2_heng_earlier # speaker:qk2_heng_earlier # mood:qk2_heng_earlier=amused
他差点笑出声。奇怪的是交手越来越难骗，日常仍常吃亏。客人夸天资，你认真指出右膝旧伤、向左逼好打；有人问喜欢哪位师姐，你答许师姐转腰最好，真说的是掌。 # beat:qk_people_lie_4 # scene:qk_oldyard # cast:qk2_heng_earlier # speaker:narrator
门里后来都说别同你讲暗话。 # beat:qk_people_lie_5 # scene:qk_oldyard # cast:qk2_heng_earlier # speaker:narrator
又一日许师姐来还借过的谱，正听见你向人说她转腰最好。她停在门边。 # beat:qk_people_lie_6 # scene:qk_oldyard # cast:qk_xu # speaker:narrator
只说转腰？ # beat:qk_people_lie_7 # scene:qk_oldyard # cast:qk_xu # speaker:qk_xu # mood:qk_xu=intent
还有肘。上回我没说完。 # beat:qk_people_lie_8 # scene:qk_oldyard # cast:qk_xu # speaker:you
她把书塞进你手里，自己走一遍掌。你刚要叫好，她先停手。 # beat:qk_people_lie_9 # scene:qk_oldyard # cast:qk_xu # speaker:narrator
先把书放好。折了页，你可得给我展平。 # beat:qk_people_lie_10 # scene:qk_oldyard # cast:qk_xu # speaker:qk_xu # mood:qk_xu=amused
* [没听懂便直问，不把别人的笑自动当自己说得全对。 # cid:qk_keep_plain_question]
  ~ qk_plain_question = true
  你这回问得倒好。还有，今天借的灯，记得还。 # beat:qk_people_lie_11 # scene:qk_oldyard # cast:qk_xu # speaker:qk_xu # mood:qk_xu=amused
  灯也要暗话？ # beat:qk_people_lie_12 # scene:qk_oldyard # cast:qk_xu # speaker:you
  不用。你拿回来，我就知道你懂了。 # beat:qk_people_lie_13 # scene:qk_oldyard # cast:qk_xu # speaker:qk_xu # mood:qk_xu=neutral
  -> twenty_nine
* [请她再接一掌，把自己真正赞好的地方走出来，也把借物当面还。 # cid:qk_return_to_hand]
  ~ qk_plain_question = false
  她接完，问灯。你从怀里摸出灯油单，才想起灯还在另一院。 # beat:qk_people_lie_14 # scene:qk_oldyard # cast:qk_xu # speaker:narrator
  好掌我认。灯你自己去拿，别叫它也跟着一块入门。 # beat:qk_people_lie_15 # scene:qk_oldyard # cast:qk_xu # speaker:qk_xu # mood:qk_xu=amused
  -> twenty_nine

=== twenty_nine ===
二十以后，师父大量让下山。军中长兵、水战、山地、硬功，只要值得看。起先你只会说剑快，后来已能说不是手快，是每次只收七成。 # beat:qk_twenty_nine_1 # scene:qk_swordyard # cast:qk_xue # speaker:narrator
二十九遇华山薛百川，一百六十余招平。又问四次：平、你胜半手、薛胜、你再胜。几次来去之间，你带回去的每一剑都要花日子想，想过还得请人真接。 # beat:qk_twenty_nine_2 # scene:qk_swordyard # cast:qk_xue # speaker:narrator
你为什么每次变得这么快？ # beat:qk_twenty_nine_3 # scene:qk_swordyard # cast:qk_xue # speaker:qk_xue # mood:qk_xue=intent
上次第三十七剑很好。我想了半年。 # beat:qk_twenty_nine_4 # scene:qk_swordyard # cast:qk_xue # speaker:you
那一剑，我练十二年。 # beat:qk_twenty_nine_5 # scene:qk_swordyard # cast:qk_xue # speaker:qk_xue # mood:qk_xue=uneasy
你认真点头，真觉得这句话更说明它好。 # beat:qk_twenty_nine_6 # scene:qk_swordyard # cast:qk_xue # speaker:narrator
* [把十二年也认真听进去，称好不是说自己半年便替他走完。 # cid:qk_praise_twelve_years]
  ~ qk_xue_praise = true
  所以很好。 # beat:qk_twenty_nine_7 # scene:qk_swordyard # cast:qk_xue # speaker:you
  你这人……算了。下次来，别只盯第三十七剑。 # beat:qk_twenty_nine_8 # scene:qk_swordyard # cast:qk_xue # speaker:qk_xue # mood:qk_xue=amused
  你答应，又问眼前这一剑的回处，他只得把剑重新拿起。 # beat:qk_twenty_nine_9 # scene:qk_swordyard # cast:qk_xue # speaker:narrator
  -> forty_three
* [请他真接自己想半年的那一下，让赞许落在能问能改的地方。 # cid:qk_show_half_year]
  ~ qk_xue_praise = false
  他没照你脑里的三十七剑来，你那一手便又变。你退半步，他先笑，叫你还有得想。 # beat:qk_twenty_nine_10 # scene:qk_swordyard # cast:qk_xue # speaker:narrator
  好。下回还能打么？ # beat:qk_twenty_nine_11 # scene:qk_swordyard # cast:qk_xue # speaker:you
  你先把今日这一句听完。 # beat:qk_twenty_nine_12 # scene:qk_swordyard # cast:qk_xue # speaker:qk_xue # mood:qk_xue=amused
  -> forty_three

=== forty_three ===
三十五后稳定胜地方绝顶，四十上下正式问南北榜，有胜有败，也一再找同一人。四十三，问一位旧总谱末段老宗师，第七十余掌来，你原备几种应法，却一式都不必用。 # beat:qk_forty_three_1 # scene:qk_oldtrial # cast:qk_oldmaster # speaker:narrator
身体自然让半步，掌从肋下穿出，老人连退五步，自停。 # beat:qk_forty_three_2 # scene:qk_oldtrial # cast:qk_oldmaster # speaker:narrator
方才想什么？ # beat:qk_forty_three_3 # scene:qk_oldtrial # cast:qk_oldmaster # speaker:qk_oldmaster # mood:qk_oldmaster=intent
什么也没想。 # beat:qk_forty_three_4 # scene:qk_oldtrial # cast:qk_oldmaster # speaker:you
老者看你一会，抹开袖口，指了指方才掌从哪里穿过。你低头去找，自己腰间也一层汗，脚仍停在那半步上。 # beat:qk_forty_three_5 # scene:qk_oldtrial # cast:qk_oldmaster # speaker:narrator
* [再慢接刚才来掌，看看真从哪里穿出去，不急着给这一掌找一部新谱。 # cid:qk_test_current_hand]
  ~ qk_natural_test = true
  他换一点方向，你也得跟着变。刚才那半步没变成可以不看眼前人、逢掌便用的绝招。 # beat:qk_forty_three_6 # scene:qk_oldtrial # cast:qk_oldmaster # speaker:narrator
  这回也看见了，再来。 # beat:qk_forty_three_7 # scene:qk_oldtrial # cast:qk_oldmaster # speaker:qk_oldmaster # mood:qk_oldmaster=neutral
  -> tomorrow
* [问他为什么停，肯听一个被自己逼退的人怎样看这一掌。 # cid:qk_ask_old_master]
  ~ qk_natural_test = false
  你没再把那几种都拿出来，来得却不晚。 # beat:qk_forty_three_8 # scene:qk_oldtrial # cast:qk_oldmaster # speaker:qk_oldmaster # mood:qk_oldmaster=intent
  你又试，发现要把刚才的自然摆给人看时，自己反多添一点。老人叫你别忙着解释，先走。 # beat:qk_forty_three_9 # scene:qk_oldtrial # cast:qk_oldmaster # speaker:narrator
  -> tomorrow

=== tomorrow ===
当夜师父亲自试，百余招先停，说进了。你问进什么，他说入化。你愣一下，便问明日练什么。 # beat:qk_tomorrow_1 # scene:qk_oldyard # cast:qk2_heng_later # speaker:narrator
正常人多少该高兴半日。 # beat:qk_tomorrow_2 # scene:qk_oldyard # cast:qk2_heng_later # speaker:qk2_heng_later # mood:qk2_heng_later=amused
高兴也能练么？ # beat:qk_tomorrow_3 # scene:qk_oldyard # cast:qk2_heng_later # speaker:you
能。先坐一会！ # beat:qk_tomorrow_4 # scene:qk_oldyard # cast:qk2_heng_later # speaker:qk2_heng_later # mood:qk2_heng_later=neutral
他骂完，自己也笑。你坐下，茶还没凉，又盯着杯子被推过来时手腕怎样松。 # beat:qk_tomorrow_5 # scene:qk_oldyard # cast:qk2_heng_later # speaker:narrator
* [喝完这杯，承认今天不是非拿出下一件功课才算没有浪费。 # cid:qk_sit_half_cup]
  ~ qk_half_cup = true
  你真喝完，没有边喝边比一掌。师父看你终于空着双手，问茶好不好，你说有点苦，他说泡久了。 # beat:qk_tomorrow_6 # scene:qk_oldyard # cast:qk2_heng_later # speaker:narrator
  下次短些。 # beat:qk_tomorrow_7 # scene:qk_oldyard # cast:qk2_heng_later # speaker:you
  这件你倒知道。 # beat:qk_tomorrow_8 # scene:qk_oldyard # cast:qk2_heng_later # speaker:qk2_heng_later # mood:qk2_heng_later=amused
  -> seventeen_days
* [说自己也高兴，只是还想知道往后，不让师父把笑等成半日差事。 # cid:qk_tell_real_joy]
  ~ qk_half_cup = false
  我高兴。也想练。 # beat:qk_tomorrow_9 # scene:qk_oldyard # cast:qk2_heng_later # speaker:you
  看见了。喝完再想，别把茶也练凉了。 # beat:qk_tomorrow_10 # scene:qk_oldyard # cast:qk2_heng_later # speaker:qk2_heng_later # mood:qk2_heng_later=amused
  你端起，热得又放回。他说慢些，这回是在说真茶。 # beat:qk_tomorrow_11 # scene:qk_oldyard # cast:qk2_heng_later # speaker:narrator
  -> seventeen_days

=== seventeen_days ===
入化以后，四十五到五十五，反成最迷惘的十年。过去更快更准、少招早步都看得见，现在越来越不像问题。你去少林、武当、华山、昆仑、八卦、峨眉，也去海上，找真值得看的人。 # beat:qk_seventeen_days_1 # scene:qk_mountain # cast:qk_huashan # speaker:narrator
华山老宿不见，你等十七日。第十八，他出来骂到底要等多久。 # beat:qk_seventeen_days_2 # scene:qk_mountain # cast:qk_huashan # speaker:narrator
您什么时候有空？ # beat:qk_seventeen_days_3 # scene:qk_mountain # cast:qk_huashan # speaker:you
你这不是答了还没答！ # beat:qk_seventeen_days_4 # scene:qk_mountain # cast:qk_huashan # speaker:qk_huashan # mood:qk_huashan=sharp
他气得发笑，开门先叫你起身。你坐久了，腿麻，站到一半又扶住门框。老人等你缓过来，才把袖口扎紧。 # beat:qk_seventeen_days_5 # scene:qk_mountain # cast:qk_huashan # speaker:narrator
站稳了再来，别叫我一掌把你送回门外坐着。 # beat:qk_seventeen_days_6 # scene:qk_mountain # cast:qk_huashan # speaker:qk_huashan # mood:qk_huashan=sharp
* [能问就认真接，不能问的以后仍不替别人改成欠自己一场。 # cid:qk_receive_real_refusal]
  ~ qk_refusal = true
  他终于起手，你没因等够日子便先赢半招。第一下就得回身去接，门外那十七日没有替你多长一只手。 # beat:qk_seventeen_days_7 # scene:qk_mountain # cast:qk_huashan # speaker:narrator
  -> accounts
* [先说自己进了以后不知该问哪里，肯把十年迷惘也放在这场里。 # cid:qk_name_what_seeking]
  ~ qk_refusal = false
  那先别拿一套已会的把我的手堵死。 # beat:qk_seventeen_days_8 # scene:qk_mountain # cast:qk_huashan # speaker:qk_huashan # mood:qk_huashan=intent
  你收住要先展示的掌，眼前那人真来，才觉得自己等的是这一步还没见过。 # beat:qk_seventeen_days_9 # scene:qk_mountain # cast:qk_huashan # speaker:narrator
  -> accounts

=== accounts ===
同一时期，门务也越来越清楚你不适合什么。田庄争水，你问为何不一起挖沟；商号账送来，第二日封还没开，旁边却添十几页掌法；镖路两边哭，你分不清谎，提议打一场看。 # beat:qk_accounts_1 # scene:qk_office # cast:qk_xu,qk_manager # speaker:narrator # look:qk_xu=late
这页谁先垫的路钱，还没认清。你让他们打，赢的便是先垫的？ # beat:qk_accounts_2 # scene:qk_office # cast:qk_xu,qk_manager # speaker:qk_manager # mood:qk_manager=uneasy
不是。 # beat:qk_accounts_3 # scene:qk_office # cast:qk_xu,qk_manager # speaker:you
那先别叫他们到院里去。人已经站起来了。 # beat:qk_accounts_4 # scene:qk_office # cast:qk_xu,qk_manager # speaker:qk_manager # mood:qk_manager=neutral
你向门边叫等一等。许师姐把两张凳子往里挪，让人坐回来。 # beat:qk_accounts_5 # scene:qk_office # cast:qk_xu,qk_manager # speaker:narrator
先听完。跟那封信一样，有人真在等一句话。 # beat:qk_accounts_6 # scene:qk_office # cast:qk_xu,qk_manager # speaker:qk_xu # mood:qk_xu=intent
{
- qk_letter_check:
送信后来你会先报去处、回来回一句。这回同门一日没收到回话，便照约到院里找，账还在原封，你也真还在看掌。许师姐取回交管事，来人当日还能赶回下一程，没有把等你一掌想通当作唯一办法。 # beat:qk_accounts_7 # scene:qk_office # cast:qk_xu,qk_manager # speaker:narrator
- else:
你仍常想自己记着，偏这回半路遇一柄值得看的剑，又把送账忘了。商号来人多等两日，管事得另请车送回，许师姐也两晚重问一遍原来的路款。你补了车钱，别人没因此少等那两天。 # beat:qk_accounts_8 # scene:qk_office # cast:qk_xu,qk_manager # speaker:narrator
}
* [请管事把自己不懂的事直接叫停，不让人因你入化便不敢说这一句不管用。 # cid:qk_let_manager_speak]
  ~ qk_office_plain = true
  这一页你讲。我若又说打，先叫我别打。 # beat:qk_accounts_9 # scene:qk_office # cast:qk_xu,qk_manager # speaker:you
  这句我记。请先把纸上的杯子挪开，不然我也看不见。 # beat:qk_accounts_10 # scene:qk_office # cast:qk_xu,qk_manager # speaker:qk_manager # mood:qk_manager=amused
  你忙挪，水还是洒了一点，只得一起按住晾干。 # beat:qk_accounts_11 # scene:qk_office # cast:qk_xu,qk_manager # speaker:narrator
  -> slow_questions
* [把能亲自担的问武时辰说清，账与路款交懂的人，别用一句全辛苦你们便消失。 # cid:qk_offer_real_time]
  ~ qk_office_plain = false
  你三日后回来，真有一事要你判门里学哪一路。 # beat:qk_accounts_12 # scene:qk_office # cast:qk_xu,qk_manager # speaker:qk_xu # mood:qk_xu=intent
  这件我来。 # beat:qk_accounts_13 # scene:qk_office # cast:qk_xu,qk_manager # speaker:you
  她叫你当面再说一遍哪日。你说了，管事才把其他几页收回去。 # beat:qk_accounts_14 # scene:qk_office # cast:qk_xu,qk_manager # speaker:narrator
  -> slow_questions

=== slow_questions ===
五十余岁以后，师父才交最深一段，不再多给拳谱，却不断问为何先准备、少就是省么、看得快真看见了么。聪明也能挡住眼前那人。 # beat:qk_slow_questions_1 # scene:qk_oldyard # cast:qk2_heng_later # speaker:narrator
你撑到两百、三百、四百，师父认真，最后仍是你先乱。你想快看懂他这一回为何慢，他偏叫你把刚才先猜的那一下停住。 # beat:qk_slow_questions_2 # scene:qk_oldyard # cast:qk2_heng_later # speaker:narrator
有的东西看太快，反而看不见。 # beat:qk_slow_questions_3 # scene:qk_oldyard # cast:qk2_heng_later # speaker:qk2_heng_later # mood:qk2_heng_later=intent
* [每回先接别人真走完的一步，再给自己的答，不拿看一眼便会替他做完。 # cid:qk_watch_before_answer]
  ~ qk_watch_slow = true
  你仍会很快想到几种，可先让来的人把脚放下。有一回他说难在肩，你原想教腕，便得收回那句已经到嘴边的话。 # beat:qk_slow_questions_4 # scene:qk_oldyard # cast:qk2_heng_later # speaker:narrator
  这回先看见人了。还没全看见。 # beat:qk_slow_questions_5 # scene:qk_oldyard # cast:qk2_heng_later # speaker:qk2_heng_later # mood:qk2_heng_later=amused
  -> sixty_eight
* [把心里抢着来的几套应法逐一试掉，肯让一段原来熟的空着，不急着补另一套。 # cid:qk_try_fewer_answers]
  ~ qk_watch_slow = false
  少了以后，一时反而手足没地方。老人也没替你把空出来的都填上，让你真接一次、真败一次，再看哪里本来不必由你先安排。 # beat:qk_slow_questions_6 # scene:qk_oldyard # cast:qk2_heng_later # speaker:narrator
  -> sixty_eight

=== sixty_eight ===
六十八，年轻弟子在同一处错半年。今日你看他练，忽然发现不是招错，是肩骨本与别人不同，旧谱那样走根本不合。 # beat:qk_sixty_eight_1 # scene:qk_youngyard # cast:qk_boy # speaker:narrator
你替他换起手，一遍便顺。他先愣住，回头看你，不敢立刻笑成自己终于听话。 # beat:qk_sixty_eight_2 # scene:qk_youngyard # cast:qk_boy # speaker:narrator
原来不是我还得再撑一点？ # beat:qk_sixty_eight_3 # scene:qk_youngyard # cast:qk_boy # speaker:qk_boy # mood:qk_boy=uneasy
不是。是我先前没看见。 # beat:qk_sixty_eight_4 # scene:qk_youngyard # cast:qk_boy # speaker:you
几十年里祖师的对、师父的对、总谱名宿的对，都被你当自己的对。到了这里，哪有永远不变的一种，只有这个人、此刻、这一手。 # beat:qk_sixty_eight_5 # scene:qk_youngyard # cast:qk_boy # speaker:narrator
* [让他照自己的肩再走，问哪里仍紧，不把今天一遍顺又变成不能再问的正确。 # cid:qk_let_boy_try]
  ~ qk_boy_try = true
  第二遍，他敢指出另一处仍卡。你没有为自己刚想通就说不可能，陪他把脚下再松一点。 # beat:qk_sixty_eight_6 # scene:qk_youngyard # cast:qk_boy # speaker:narrator
  这回能从这里回来。 # beat:qk_sixty_eight_7 # scene:qk_youngyard # cast:qk_boy # speaker:qk_boy # mood:qk_boy=amused
  我看见了。 # beat:qk_sixty_eight_8 # scene:qk_youngyard # cast:qk_boy # speaker:you
  -> enter_return
* [当着同门说是自己原先看错，再让他练，别叫半年的错全留在孩子名下。 # cid:qk_admit_before_class]
  ~ qk_boy_try = false
  同门听完，先把旁边那句又错了收回。少年仍得自己练，却终于不用先向整院解释为何总不能同别人一样。 # beat:qk_sixty_eight_9 # scene:qk_youngyard # cast:qk_boy # speaker:narrator
  这回你自己走，我接。 # beat:qk_sixty_eight_10 # scene:qk_youngyard # cast:qk_boy # speaker:you
  -> enter_return

=== enter_return ===
当夜找师父，你说打一场。一百二十余招，他先停，看你很久，说终于进来。这次你真笑了，不只为返真两字，是终于听懂他问二十年的东西。 # beat:qk_enter_return_1 # scene:qk_oldyard # cast:qk2_heng_later # speaker:narrator
你坐回师父对面，手还悬在方才停掌的地方。老人自己把凉茶倒掉，等你先笑完，再把热水推过来。 # beat:qk_enter_return_2 # scene:qk_oldyard # cast:qk2_heng_later # speaker:narrator
这回还问明日练什么？ # beat:qk_enter_return_3 # scene:qk_oldyard # cast:qk2_heng_later # speaker:qk2_heng_later # mood:qk2_heng_later=amused
问。也想先笑一会。 # beat:qk_enter_return_4 # scene:qk_oldyard # cast:qk2_heng_later # speaker:you
他让你坐，终于没再骂正常人该高兴半日。 # beat:qk_enter_return_5 # scene:qk_oldyard # cast:qk2_heng_later # speaker:narrator
-> trouble

=== trouble ===
返真后三年，七十一，让你接掌太极，你先反对。理由麻烦。管事把普通账册、礼单、田庄与一般纠纷分出去，最高武学、传承、真正大争与下一代去处，留给你。 # beat:qk_trouble_1 # scene:qk_headroom # cast:qk_xu,qk_manager # speaker:narrator # look:qk_manager=late
账你不用看。这四件，可得真有人找得着你。 # beat:qk_trouble_2 # scene:qk_headroom # cast:qk_xu,qk_manager # speaker:qk_manager # mood:qk_manager=intent
这四件可以。 # beat:qk_trouble_3 # scene:qk_headroom # cast:qk_xu,qk_manager # speaker:you
印先别塞进袖里。你带走了，我还得去寻你盖。 # beat:qk_trouble_4 # scene:qk_headroom # cast:qk_xu,qk_manager # speaker:qk_manager # mood:qk_manager=neutral
你把印放回桌上，手却仍留在门边。 # beat:qk_trouble_5 # scene:qk_headroom # cast:qk_xu,qk_manager # speaker:narrator
先别急着走。你答应的这四件，到时谁能来敲你门？ # beat:qk_trouble_6 # scene:qk_headroom # cast:qk_xu,qk_manager # speaker:qk_xu # mood:qk_xu=amused
你想了一会，已经开始讲未来三十年的武学，能讲三日。她把你拦在门边，让这三日先有一个别人真能找到的头。 # beat:qk_trouble_7 # scene:qk_headroom # cast:qk_xu,qk_manager # speaker:narrator
* [就今天把四类事谁来问、出门前谁接说清，宁肯晚一天动身，不留人对着掌门名头等。 # cid:qk_name_who_can_ask]
  ~ qk_head_clear = true
  你把出访往后推一日，管事叫来真正会接的人，不由你报四个不记得的堂口名。他们试着提一件，你也当面说自己若不在先问谁。 # beat:qk_trouble_8 # scene:qk_headroom # cast:qk_xu,qk_manager # speaker:narrator
  这样可以。你刚才那个这样可以，少了这一日。 # beat:qk_trouble_9 # scene:qk_headroom # cast:qk_xu,qk_manager # speaker:qk_xu # mood:qk_xu=amused
  -> first_for_two_years
* [先把近期弟子与传功约定当面排好，其他四类事务请管事整理后再定。 # cid:qk_keep_teaching_promise]
  ~ qk_head_clear = false
  你怕原约学生又多等，先去看他们。管事接下其他项，却还得一一问你没有说明的边界；有些事不是拿到掌门印便敢替你答。 # beat:qk_trouble_10 # scene:qk_headroom # cast:qk_xu,qk_manager # speaker:narrator
  晚课后我再来。这回别出门，又叫我沿路问剑。 # beat:qk_trouble_11 # scene:qk_headroom # cast:qk_xu,qk_manager # speaker:qk_manager # mood:qk_manager=intent
  -> first_for_two_years

=== first_for_two_years ===
七十余进总谱最前。初列第一，只坐两年，退隐老人物重出，真把你打到第二。江湖议新旧第一，你当日已追问何时再打。 # beat:qk_first_for_two_years_1 # scene:qk_rankyard # cast:qk_retired # speaker:narrator
此后三年又问三次，败、败、平。第四年老人不肯再来，说你已经学完，你很失望，还没赢。 # beat:qk_first_for_two_years_2 # scene:qk_rankyard # cast:qk_retired # speaker:narrator
你找我是学，还是赢？ # beat:qk_first_for_two_years_3 # scene:qk_rankyard # cast:qk_retired # speaker:qk_retired # mood:qk_retired=intent
都要。 # beat:qk_first_for_two_years_4 # scene:qk_rankyard # cast:qk_retired # speaker:you
老人看你答得认真，反倒笑。这次他没再给你一场，不能把愿意再学变成旁人必须永远肯教。 # beat:qk_first_for_two_years_5 # scene:qk_rankyard # cast:qk_retired # speaker:narrator
* [让没赢仍是没赢，不替老人不再打便给自己补一个榜外胜场。 # cid:qk_keep_unwon]
  ~ qk_unwon = true
  那我先想今日的。 # beat:qk_first_for_two_years_6 # scene:qk_rankyard # cast:qk_retired # speaker:you
  这句比什么时候再打容易答。 # beat:qk_first_for_two_years_7 # scene:qk_rankyard # cast:qk_retired # speaker:qk_retired # mood:qk_retired=amused
  你临走仍看一眼他方才转身的脚，没把那一平换成早已超过。 # beat:qk_first_for_two_years_8 # scene:qk_rankyard # cast:qk_retired # speaker:narrator
  -> eighty_teacher
* [请他指出自己学到哪，不因没能再约一场便把这些年都说成白来。 # cid:qk_ask_what_finished]
  ~ qk_unwon = false
  我能让你从我这里看见的，就这些。以后未必还从我身上找。 # beat:qk_first_for_two_years_9 # scene:qk_rankyard # cast:qk_retired # speaker:qk_retired # mood:qk_retired=neutral
  你收回要问的下一日，先把这句听完。想赢仍在，也不必把旁人不肯当作欠你。 # beat:qk_first_for_two_years_10 # scene:qk_rankyard # cast:qk_retired # speaker:narrator
  -> eighty_teacher

=== eighty_teacher ===
八十余，再找师父。他一百四十上下，身子自然衰老，武道反更深。空手一百、两百不分，三百后老人少动，三百七十余，你首次把他逼进自己真能掌握的局。 # beat:qk_eighty_teacher_1 # scene:qk_oldyard # cast:qk2_heng_later # speaker:narrator
师父停，你也立刻停。他问为何不继续，你说再打应会赢。他问因为老，你难得知道这句话得仔细答。 # beat:qk_eighty_teacher_2 # scene:qk_oldyard # cast:qk2_heng_later # speaker:narrator
有多少因为我老？ # beat:qk_eighty_teacher_3 # scene:qk_oldyard # cast:qk2_heng_later # speaker:qk2_heng_later # mood:qk2_heng_later=intent
* [承认有一部分，却不把自己多年真走过的也谦让成只有老师老。 # cid:qk_admit_age_part]
  ~ qk_teacher_honest = true
  有一部分。但换回二十年前，我觉得也能赢。 # beat:qk_eighty_teacher_4 # scene:qk_oldyard # cast:qk2_heng_later # speaker:you
  这句才像话。 # beat:qk_eighty_teacher_5 # scene:qk_oldyard # cast:qk2_heng_later # speaker:qk2_heng_later # mood:qk2_heng_later=amused
  你松一口气，没替他年轻时编一个永远不能被弟子越过的自己。 # beat:qk_eighty_teacher_6 # scene:qk_oldyard # cast:qk2_heng_later # speaker:narrator
  -> already_exceeded
* [说出刚才哪一处已能掌握，再承认老师老是因素之一，不拿两句好听话绕过去。 # cid:qk_name_real_position]
  ~ qk_teacher_honest = false
  身子老，是一部分。可刚才那里，换您二十年前，我也觉得能走进去。 # beat:qk_eighty_teacher_7 # scene:qk_oldyard # cast:qk2_heng_later # speaker:you
  这句才像话。你若只替我留面子，我还得再教你问的是什么。 # beat:qk_eighty_teacher_8 # scene:qk_oldyard # cast:qk2_heng_later # speaker:qk2_heng_later # mood:qk2_heng_later=amused
  -> already_exceeded

=== already_exceeded ===
弟子真的超过了？ # beat:qk_already_exceeded_1 # scene:qk_oldyard # cast:qk2_heng_later # speaker:you
早几年就超过。 # beat:qk_already_exceeded_2 # scene:qk_oldyard # cast:qk2_heng_later # speaker:qk2_heng_later # mood:qk2_heng_later=neutral
那为何不说？ # beat:qk_already_exceeded_3 # scene:qk_oldyard # cast:qk2_heng_later # speaker:you
你又没问。 # beat:qk_already_exceeded_4 # scene:qk_oldyard # cast:qk2_heng_later # speaker:qk2_heng_later # mood:qk2_heng_later=amused
你愣半天，师父才说总谱第一与天下无人更高不是一回事。百岁退谱、未入谱、门里深处、海外，都不会因纸上没写便消失。 # beat:qk_already_exceeded_5 # scene:qk_oldyard # cast:qk2_heng_later # speaker:narrator
你眼又亮，老人立刻后悔，叫别马上跑。你已站起，问他知道谁。 # beat:qk_already_exceeded_6 # scene:qk_oldyard # cast:qk2_heng_later # speaker:narrator
坐。茶喝了一口就剩半壶给我，你倒跑得快。 # beat:qk_already_exceeded_7 # scene:qk_oldyard # cast:qk2_heng_later # speaker:qk2_heng_later # mood:qk2_heng_later=uneasy
你站住，看看茶，再看看老人。他没指路，先指你刚空出来的座。 # beat:qk_already_exceeded_8 # scene:qk_oldyard # cast:qk2_heng_later # speaker:narrator
师父把你叫回去坐完这盏茶。又过些时日，真正坐稳总谱第一，你翻太极旧册，向门中老人问周祖可还活着。 # beat:qk_already_exceeded_9 # scene:qk_oldyard # cast:qk2_heng_later # speaker:narrator
周道玄，太极旧掌，居终南混元院。宁无极晚年私评十人以他居首，那不是另一张公开总谱；旧册也没有替你约下一场问武。 # beat:qk_already_exceeded_10 # scene:qk_oldyard # cast:qk2_heng_later # speaker:narrator
* [先把要出门的日子与待问事项交清，再去终南，不把管事留在找人的路上。 # cid:qk_clear_before_mountain]
  ~ qk_mountain_handoff = true
  你肯慢半日，出门时还是忍不住快。管事叫你回头，最后只确认你走哪条山路、回话送哪处驿，不再问你能不能顺手看账。 # beat:qk_already_exceeded_11 # scene:qk_oldyard # cast:qk2_heng_later # speaker:narrator
  -> nine_days
* [先赶这一程山路，将去处与未答的事托驿回报，承担不能当面说清的来回。 # cid:qk_send_route_back]
  ~ qk_mountain_handoff = false
  你没消失，却一到路上又给一柄剑多留半日。回报迟了一班驿，管事得重排会面；你回来还有一下午要补，不能用正在问更高处将它省掉。 # beat:qk_already_exceeded_12 # scene:qk_oldyard # cast:qk2_heng_later # speaker:narrator
  -> nine_days

=== nine_days ===
到了混元院，童子不认这个总谱第一。问找祖师做什么，你答打架。祖师不见，你便等。第九日，院门终于开了。 # beat:qk_nine_days_1 # scene:qk_gate # cast:qk_gatechild # speaker:narrator
还是那个人。每天都说等有空。 # beat:qk_nine_days_2 # scene:qk_gate # cast:qk_gatechild # speaker:qk_gatechild # mood:qk_gatechild=uneasy
你没借掌门印叫童子先证明自己认得太极，站起时只拍去衣上的尘。 # beat:qk_nine_days_3 # scene:qk_gate # cast:qk_gatechild # speaker:narrator
周道玄慢慢走下门槛。童子抱茶站到一边，先等老人看完你。 # beat:qk_nine_days_4 # scene:qk_gate # cast:qk_zhou,qk_gatechild # speaker:narrator
你现在总谱第一，还找我做什么？ # beat:qk_nine_days_5 # scene:qk_gate # cast:qk_zhou,qk_gatechild # speaker:qk_zhou # mood:qk_zhou=intent
* [说谱上第一见得差不多，榜外还没，不把旧祖的门当自己升榜的手续。 # cid:qk_ask_outside_rank]
  ~ qk_outside = true
  总谱上的第一，我见得差不多。榜外还没有。 # beat:qk_nine_days_6 # scene:qk_gate # cast:qk_zhou,qk_gatechild # speaker:you
  周看你一会，答应看百招。门童把茶放到一旁，你先让出他走过去的地方。 # beat:qk_nine_days_7 # scene:qk_gate # cast:qk_zhou,qk_gatechild # speaker:narrator
  -> zhou_field
* [请看一百招，不因等了九日便先替自己讨一个该教多少的价。 # cid:qk_ask_real_hand]
  ~ qk_outside = false
  我想真接一回，看看还没见的地方。 # beat:qk_nine_days_8 # scene:qk_gate # cast:qk_zhou,qk_gatechild # speaker:you
  周问不是已经第一么，你答谱上第一，不是都见完。他终于应看百招，没先替你说会是怎样的百招。 # beat:qk_nine_days_9 # scene:qk_gate # cast:qk_zhou,qk_gatechild # speaker:narrator
  -> zhou_field

=== zhou_field ===
老人领你进院，童子将茶留在门边。第一轮，你一直觉得自己主动。五十余招以后，每种最合理的变化，却渐渐都指向周道玄所站的同一个地方。第七十二，好不容易逼出真机会，肘间被轻搭，下一瞬手已停后颈。 # beat:qk_zhou_field_1 # scene:qk_mixedyard # cast:qk_zhou # speaker:narrator
多少？ # beat:qk_zhou_field_2 # scene:qk_mixedyard # cast:qk_zhou # speaker:you
七十三。 # beat:qk_zhou_field_3 # scene:qk_mixedyard # cast:qk_zhou # speaker:qk_zhou # mood:qk_zhou=neutral
说好一百。 # beat:qk_zhou_field_4 # scene:qk_mixedyard # cast:qk_zhou # speaker:you
老人想想，居然觉得有理。茶刚被童子往前挪，便又得先放回。 # beat:qk_zhou_field_5 # scene:qk_mixedyard # cast:qk_zhou # speaker:narrator
* [再接，不急着把第一轮七十三换成另一套更合理的旧应法。 # cid:qk_try_changed_choice]
  ~ qk_zhou_change = 1
  你这回肯少先安排一手，眼前空间却仍逐处变窄。第二轮二十九招，周的手再次停胸前。两轮一百零二，答应的百招真打了，你也真输清楚。 # beat:qk_zhou_field_6 # scene:qk_mixedyard # cast:qk_zhou # speaker:narrator
  -> one_oh_two
* [仍从刚才被带来的位置去问，试自己能否在那一处换出去。 # cid:qk_ask_same_pressure]
  ~ qk_zhou_change = 2
  你换得更细，老人也没照上一轮等你。二十九招，手停胸前。合一百零二，你不能因第二回比前回短就说第一回本来只在试探。 # beat:qk_zhou_field_7 # scene:qk_mixedyard # cast:qk_zhou # speaker:narrator
  -> one_oh_two

=== one_oh_two ===
你坐院里想一下午。周回屋睡一觉，出来还见你，问想明白没。你说一半，知道为什么输；另一半，不知他为何能让你只能这样输。 # beat:qk_one_oh_two_1 # scene:qk_mixedyard # cast:qk_zhou # speaker:narrator
那就慢慢想。 # beat:qk_one_oh_two_2 # scene:qk_mixedyard # cast:qk_zhou # speaker:qk_zhou # mood:qk_zhou=intent
他这回认真看你。你却没因被看重便觉得自己立刻又走进一层，先问另一个一直没肯放下的问题。 # beat:qk_one_oh_two_3 # scene:qk_mixedyard # cast:qk_zhou # speaker:narrator
祖师是不是天下第一？ # beat:qk_one_oh_two_4 # scene:qk_mixedyard # cast:qk_zhou # speaker:you
不知道。 # beat:qk_one_oh_two_5 # scene:qk_mixedyard # cast:qk_zhou # speaker:qk_zhou # mood:qk_zhou=neutral
您也不知道？ # beat:qk_one_oh_two_6 # scene:qk_mixedyard # cast:qk_zhou # speaker:you
我为什么会知道？ # beat:qk_one_oh_two_7 # scene:qk_mixedyard # cast:qk_zhou # speaker:qk_zhou # mood:qk_zhou=amused
* [把陆天行、张玄衡、慧空逐个问，听他每一个不知道的范围。 # cid:qk_ask_named_people]
  ~ qk_named_unknown = true
  你问一个，他多半答不知道。你终于忍不住说怎么什么都不知道。 # beat:qk_one_oh_two_8 # scene:qk_mixedyard # cast:qk_zhou # speaker:narrator
  因为我没把他们一个个杀了。 # beat:qk_one_oh_two_9 # scene:qk_mixedyard # cast:qk_zhou # speaker:qk_zhou # mood:qk_zhou=intent
  你认真想，觉得有理。这不是说每个较艺都得杀人，而是不能把不同人不同日的问手磨成永不变的一条线。 # beat:qk_one_oh_two_10 # scene:qk_mixedyard # cast:qk_zhou # speaker:narrator
  -> many_unknowns
* [问他怎样才肯下一个已知的断语，不让不知道也变成绝对高深。 # cid:qk_ask_what_known]
  ~ qk_named_unknown = false
  我没把那些人一个个杀了，何来每样情形都知道。 # beat:qk_one_oh_two_11 # scene:qk_mixedyard # cast:qk_zhou # speaker:qk_zhou # mood:qk_zhou=neutral
  你想起自己在海上、平地也会不同，点头。老人肯说没见过，不等于他藏着一张全知的榜只不肯给你。 # beat:qk_one_oh_two_12 # scene:qk_mixedyard # cast:qk_zhou # speaker:narrator
  -> many_unknowns

=== many_unknowns ===
你又问两百余年前无生客。那个为杀人练，换命废手都肯，逼三掌门仍制不住，最终空劫死、司马玄极与孟归藏重伤才留住的返真尾段人物。 # beat:qk_many_unknowns_1 # scene:qk_mixedyard # cast:qk_zhou # speaker:narrator
祖师与他打一场谁赢？ # beat:qk_many_unknowns_2 # scene:qk_mixedyard # cast:qk_zhou # speaker:you
周想很久，杯子在手里，没喝。 # beat:qk_many_unknowns_3 # scene:qk_mixedyard # cast:qk_zhou # speaker:narrator
很难。 # beat:qk_many_unknowns_4 # scene:qk_mixedyard # cast:qk_zhou # speaker:qk_zhou # mood:qk_zhou=intent
谁难？ # beat:qk_many_unknowns_5 # scene:qk_mixedyard # cast:qk_zhou # speaker:you
我。 # beat:qk_many_unknowns_6 # scene:qk_mixedyard # cast:qk_zhou # speaker:qk_zhou # mood:qk_zhou=neutral
你不再伸手催那盏茶。他才说，无生客肯换命、废手，问艺时会收的地方，那人未必收。 # beat:qk_many_unknowns_7 # scene:qk_mixedyard # cast:qk_zhou # speaker:narrator
你眼更亮，仍问谁才真第一。他指山，一峰外还有一峰，到了自以最高处，周围全是云，只能说没看见更高。 # beat:qk_many_unknowns_8 # scene:qk_mixedyard # cast:qk_zhou # speaker:narrator
那把云扒开看看？ # beat:qk_many_unknowns_9 # scene:qk_mixedyard # cast:qk_zhou # speaker:you
这句倒不像蠢话。 # beat:qk_many_unknowns_10 # scene:qk_mixedyard # cast:qk_zhou # speaker:qk_zhou # mood:qk_zhou=amused
* [把没看见留成还可继续问的地方，不替云里每一座山先排好。 # cid:qk_keep_unseen]
  ~ qk_cloud = true
  你没有就此不想争胜，只是下次真碰见谁，还得把眼前一掌走完。周把童子方才挪回去的茶叫来，自己也坐。 # beat:qk_many_unknowns_11 # scene:qk_mixedyard # cast:qk_zhou # speaker:narrator
  -> overseas_sword
* [还想去看，却先问哪里确有见闻，别把一句也许当已定的地名。 # cid:qk_ask_next_path]
  ~ qk_cloud = false
  你收回要马上指图的手。周看见，反而在临别时叫住，说有一段旧见闻，或许值得听，但他也没有全看见。 # beat:qk_many_unknowns_12 # scene:qk_mixedyard # cast:qk_zhou # speaker:narrator
  -> overseas_sword

=== overseas_sword ===
周一百出头、尚返真中段时，门中高两代的老祖已在后段。那老人独自出海四十余年，回来一眼盲、指残、满身旧伤，武道却更深。 # beat:qk_overseas_sword_1 # scene:qk_mixedyard # cast:qk_zhou # speaker:narrator
只说海外遇过一个更强的使剑人，不知姓名、门派。对方说真取命三剑足，第一剑后便信；第二剑发生什么再不肯讲。 # beat:qk_overseas_sword_2 # scene:qk_mixedyard # cast:qk_zhou # speaker:narrator
祖师现在能三剑斩一位返真后段么？ # beat:qk_overseas_sword_3 # scene:qk_mixedyard # cast:qk_zhou # speaker:you
不能。若那句话是真的，他做到的，我现在还做不到。 # beat:qk_overseas_sword_4 # scene:qk_mixedyard # cast:qk_zhou # speaker:qk_zhou # mood:qk_zhou=intent
周没有宣布必强于自己，也不知性别、来处、存活。天外仙只是后来人口耳称呼，近两百岁、大宗出身或夸言，都是无证的猜。旧册真留的，不过海外剑者言三剑可取命。 # beat:qk_overseas_sword_5 # scene:qk_mixedyard # cast:qk_zhou # speaker:narrator
* [把来源与不知道的一并记，别把一个三剑传成已经核定的顶点。 # cid:qk_record_rumor_bounds]
  ~ qk_rumor_plain = true
  说过三剑，是老人留下的话，不是我见过三剑。 # beat:qk_overseas_sword_6 # scene:qk_mixedyard # cast:qk_zhou # speaker:you
  这句记着。别明日出门就有人听成我替你指了一个名字。 # beat:qk_overseas_sword_7 # scene:qk_mixedyard # cast:qk_zhou # speaker:qk_zhou # mood:qk_zhou=intent
  你问往哪，他指远处，说先有海，再往后，不知道。 # beat:qk_overseas_sword_8 # scene:qk_mixedyard # cast:qk_zhou # speaker:narrator
  -> other_old_people
* [先问真能走的方向，承认海后未定，不用猜一个门派补全故事。 # cid:qk_ask_first_sea]
  ~ qk_rumor_plain = false
  那边。先有海，再往后不知道。 # beat:qk_overseas_sword_9 # scene:qk_mixedyard # cast:qk_zhou # speaker:qk_zhou # mood:qk_zhou=neutral
  你看着那个方向，没当他已经交一条走到某个最终对手门前的路。想去仍想，没见也仍没见。 # beat:qk_overseas_sword_10 # scene:qk_mixedyard # cast:qk_zhou # speaker:narrator
  -> other_old_people

=== other_old_people ===
榜外旧人，你并非只碰周。武当张玄衡闭门问过，一百四十余，你承认还有力、招未尽，却已没有第二条路。 # beat:qk_other_old_people_1 # scene:qk_wudang # cast:qk_zhang # speaker:narrator
还有力，也能先看见到这里。 # beat:qk_other_old_people_2 # scene:qk_wudang # cast:qk_zhang # speaker:qk_zhang # mood:qk_zhang=intent
你没有为总谱第一的脸面再硬拖一个整数。那一场留下的是当日真实所及，不是替这几位老人做一张你已经试全的隐榜。 # beat:qk_other_old_people_3 # scene:qk_wudang # cast:qk_zhang # speaker:narrator
东海上一代门主叶无涯，也真见过。船一摇，你又把岸上最会的那一步带过去。 # beat:qk_other_old_people_4 # scene:qk_boat # cast:qk_ye # speaker:narrator
-> boat_fifty_one

=== boat_fifty_one ===
海船上试五十余。第四十余，你已觉得脚下没处值得站稳，越要稳，那一处越不在原来脚下。 # beat:qk_boat_fifty_one_1 # scene:qk_boat # cast:qk_ye # speaker:narrator
第五十一，直接掉进海。水没因你总谱第一便矮一点，冒头时，叶无涯正在船边看。 # beat:qk_boat_fifty_one_2 # scene:qk_boat # cast:qk_ye # speaker:narrator
会游水么？ # beat:qk_boat_fifty_one_3 # scene:qk_boat # cast:qk_ye # speaker:qk_ye # mood:qk_ye=amused
会。 # beat:qk_boat_fifty_one_4 # scene:qk_boat # cast:qk_ye # speaker:you
那怕什么？ # beat:qk_boat_fifty_one_5 # scene:qk_boat # cast:qk_ye # speaker:qk_ye # mood:qk_ye=neutral
你想想，觉得有理。船边抛来一根绳，绳也没因对方刚赢你便该被你拒掉。 # beat:qk_boat_fifty_one_6 # scene:qk_boat # cast:qk_ye # speaker:narrator
* [接绳爬回，先把这口水吐掉，再真问下一次。 # cid:qk_take_rope_then_again]
  ~ qk_rope = true
  再来。 # beat:qk_boat_fifty_one_7 # scene:qk_boat # cast:qk_ye # speaker:you
  先擦脸。没叫你把海全喝了。 # beat:qk_boat_fifty_one_8 # scene:qk_boat # cast:qk_ye # speaker:qk_ye # mood:qk_ye=amused
  你抹一把，又想看他脚往哪移，衣摆却先滴得甲板更湿，只得再让开半步。 # beat:qk_boat_fifty_one_9 # scene:qk_boat # cast:qk_ye # speaker:narrator
  -> wet_again
* [先游离贴船的险处，依他的指点接绳，不为再来两个字硬贴船身。 # cid:qk_swim_clear_of_side]
  ~ qk_rope = false
  你退开才接，喘匀第一句仍是再来。 # beat:qk_boat_fifty_one_10 # scene:qk_boat # cast:qk_ye # speaker:narrator
  会游，也记得船会动。你刚才在上头忘，这回在下面别忘。 # beat:qk_boat_fifty_one_11 # scene:qk_boat # cast:qk_ye # speaker:qk_ye # mood:qk_ye=amused
  你点头，先让能踩的一脚真落稳，再上船。 # beat:qk_boat_fifty_one_12 # scene:qk_boat # cast:qk_ye # speaker:narrator
  -> wet_again

=== wet_again ===
后来评叶无涯，你说陆地不知道，海上打不过。不是把海上五十一偷算成岸上也有一场已定结果，更没把这次掉水写成装作摔下去试他。 # beat:qk_wet_again_1 # scene:qk_boat # cast:qk_ye # speaker:narrator
-> other_inquiries

=== other_inquiries ===
回山以后，记录者把别几场旧问也摊到桌上，请你逐处说亲见。八卦孟沧海，一百九十余败。问服不服，你服；问差多少，你反问这些老人为何都爱问这个。 # beat:qk_other_inquiries_1 # scene:qk_headroom # cast:qk_youngscribe # speaker:narrator
少林慧空只试两掌，第三未出便停。陆天行、公孙无我、妙真、燕九霄，有失踪、有闭门、有不肯见，终究没逐一碰上。 # beat:qk_other_inquiries_2 # scene:qk_headroom # cast:qk_youngscribe # speaker:narrator
没见到的，旁边还留一行么？ # beat:qk_other_inquiries_3 # scene:qk_headroom # cast:qk_youngscribe # speaker:qk_youngscribe # mood:qk_youngscribe=intent
留着。我还想问。 # beat:qk_other_inquiries_4 # scene:qk_headroom # cast:qk_youngscribe # speaker:you
他把墨移开，等你说完才写。 # beat:qk_other_inquiries_5 # scene:qk_headroom # cast:qk_youngscribe # speaker:narrator
* [未见的就未见，等到有机会再问，不拿第一当已替所有门敲过。 # cid:qk_keep_missing_bouts]
  ~ qk_missing_plain = true
  你把空着的几行留空。想问没有少，可他们今天不在眼前，不能叫写谱的人先替你打一回。 # beat:qk_other_inquiries_6 # scene:qk_headroom # cast:qk_youngscribe # speaker:narrator
  -> first_in_line
* [请同门只问对方是否愿见，有答复再约，别为自己遗憾给每家添一群等门人。 # cid:qk_plan_real_visit]
  ~ qk_missing_plain = false
  你仍想出门，同门也真得去递话。他要你把可改的日期讲明，不能一个新见闻来就忘了原约，你答应让他当面催。 # beat:qk_other_inquiries_7 # scene:qk_headroom # cast:qk_youngscribe # speaker:narrator
  -> first_in_line

=== first_in_line ===
记录者写到总谱第一，停笔问：这些旧败都列着，第一又是什么意思？你觉得奇怪，他们不在谱里。年轻打不过师父，后来超过；现在打不过别人，便练。若他们死前仍没超过，那就是没超过。 # beat:qk_first_in_line_1 # scene:qk_headroom # cast:qk_manager,qk_youngscribe # speaker:narrator
不觉得丢脸？ # beat:qk_first_in_line_2 # scene:qk_headroom # cast:qk_manager,qk_youngscribe # speaker:qk_youngscribe # mood:qk_youngscribe=uneasy
为什么？第一不是没人更强，只是站在还愿排队的人最前面。 # beat:qk_first_in_line_3 # scene:qk_headroom # cast:qk_manager,qk_youngscribe # speaker:you
你还不会许多堂口的名字。账递来，仍先翻出一张掌法，管事把真账又推回另一边，让你只看今日那件传承争论。 # beat:qk_first_in_line_4 # scene:qk_headroom # cast:qk_manager,qk_youngscribe # speaker:narrator
这边给我。你答应看的是那边，不是我今天也会打一掌。 # beat:qk_first_in_line_5 # scene:qk_headroom # cast:qk_manager,qk_youngscribe # speaker:qk_manager # mood:qk_manager=amused
{
- qk_head_clear:
接掌那日你晚一天出门，四类事真让接手人试问过。此次访旧人，普通事务没因你不在停；传承一案循说定的来信法问到，你留一夜把要看的逐一接过，翌日才继续。你少了一夜随兴看剑，同门却没等一个月掌门何时有空。 # beat:qk_first_in_line_6 # scene:qk_headroom # cast:qk_manager,qk_youngscribe # speaker:narrator
- else:
接掌时先排传功，其他边界迟迟才说清。这次出门，一项传承争论被当作普通馆务压下，两边不敢越权，课停了一月。管事后来补问，你得留三日逐个试学徒的功，别人也少了一月原课；你不能拿自己正问榜外更深作不用回来的理由。 # beat:qk_first_in_line_7 # scene:qk_headroom # cast:qk_manager,qk_youngscribe # speaker:narrator
}
* [晚年多留可问的课，让后来人把自己不合旧式的那一处也带进来。 # cid:qk_leave_open_school]
  ~ qk_legacy = 1
  一封远访邀约在桌上，你请管事回说这回先不去。不是那边没有值得看的人，是今日这班已约好，不能永远因你想见更高处便往后让。 # beat:qk_first_in_line_8 # scene:qk_headroom # cast:qk_manager,qk_youngscribe # speaker:narrator
  那这封我真回。明日看见一柄剑，也不算没说过。 # beat:qk_first_in_line_9 # scene:qk_headroom # cast:qk_manager,qk_youngscribe # speaker:qk_youngscribe # mood:qk_youngscribe=amused
  -> late_way
* [晚年仍去问未见的人，把这趟留谁、哪天回报讲清，留给同门真正能接的空处。 # cid:qk_leave_open_road]
  ~ qk_legacy = 2
  你少亲看一班，先问同门肯不肯接；他要你把那位弟子刚换过的起手当面走一遍，才答应。 # beat:qk_first_in_line_10 # scene:qk_headroom # cast:qk_manager,qk_youngscribe # speaker:narrator
  你去问你的。回来的日子若改，信先到，别只带一柄新剑到。 # beat:qk_first_in_line_11 # scene:qk_headroom # cast:qk_manager,qk_youngscribe # speaker:qk_manager # mood:qk_manager=intent
  你把这句也写在行李最上。 # beat:qk_first_in_line_12 # scene:qk_headroom # cast:qk_manager,qk_youngscribe # speaker:narrator
  -> late_way

=== late_way ===
晚来好茶，你仍泡得难喝。记录者尝一口，先看你，又看杯，终于决定直说。 # beat:qk_late_way_1 # scene:qk_lateyard # cast:qk_youngscribe # speaker:narrator
真苦。 # beat:qk_late_way_2 # scene:qk_lateyard # cast:qk_youngscribe # speaker:qk_youngscribe # mood:qk_youngscribe=uneasy
我泡久了？ # beat:qk_late_way_3 # scene:qk_lateyard # cast:qk_youngscribe # speaker:you
你又看剑看久了。 # beat:qk_late_way_4 # scene:qk_lateyard # cast:qk_youngscribe # speaker:qk_youngscribe # mood:qk_youngscribe=amused
你拿起旁边剑，说重心后移半寸很好，问要不要打。他捧茶，两手都没空，先问能否等放下。 # beat:qk_late_way_5 # scene:qk_lateyard # cast:qk_youngscribe # speaker:narrator
能。 # beat:qk_late_way_6 # scene:qk_lateyard # cast:qk_youngscribe # speaker:you
你等他把杯放好。他尝过的茶还烫，你拿另一只杯想兑淡些，又把热水添满了沿。 # beat:qk_late_way_7 # scene:qk_lateyard # cast:qk_youngscribe # speaker:narrator
别端。放这里晾一会，我不急。 # beat:qk_late_way_8 # scene:qk_lateyard # cast:qk_youngscribe # speaker:qk_youngscribe # mood:qk_youngscribe=uneasy
你停住，终于先问他刚才要说什么。 # beat:qk_late_way_9 # scene:qk_lateyard # cast:qk_youngscribe # speaker:narrator
{
- qk_letter_check:
记录者先请你说送回哪一院，自己送到又来回一句。你认得这个旧办法，没把半生仍需提醒当成别人不可写的丑事。 # beat:qk_late_way_10 # scene:qk_lateyard # cast:qk_youngscribe # speaker:narrator
剑留这里，信送完。回来再问这一剑？ # beat:qk_late_way_11 # scene:qk_lateyard # cast:qk_youngscribe # speaker:qk_youngscribe # mood:qk_youngscribe=amused
好。 # beat:qk_late_way_12 # scene:qk_lateyard # cast:qk_youngscribe # speaker:you
- else:
记录者问你为何又把一封旧约夹在剑旁。你想起多等的两日与两晚重问，亲自把该送的交给眼前这个会回来回话的人。这回仍不靠你一边看剑一边记住三桩事。 # beat:qk_late_way_13 # scene:qk_lateyard # cast:qk_youngscribe # speaker:narrator
他回来，你叫我一声。 # beat:qk_late_way_14 # scene:qk_lateyard # cast:qk_youngscribe # speaker:you
我还要写这杯茶。你也得真听见。 # beat:qk_late_way_15 # scene:qk_lateyard # cast:qk_youngscribe # speaker:qk_youngscribe # mood:qk_youngscribe=amused
}
-> best_no_end

=== best_no_end ===
有人又称天下第一，你认真纠正总谱第一。有区别么，很大。山后、海后、旧谱里、连姓名也没留下的人，都不会因为自己今天走在队伍前头便退成一片空白。 # beat:qk_best_no_end_1 # scene:qk_lateyard # cast:qk_youngscribe # speaker:narrator
你最喜欢的，仍是师父那句别太早觉得自己懂了。有人问武道有尽头么，你先笑，说不知道，停一停，又说最好没有。 # beat:qk_best_no_end_2 # scene:qk_lateyard # cast:qk_youngscribe # speaker:narrator
{
- qk_legacy == 1:
院里后来人换起手，一回比一回顺。你没有替他宣布已经走完，只把茶放远一些，真坐到他问得着的地方。 # beat:qk_best_no_end_3 # scene:qk_lateyard # cast:qk_youngscribe # speaker:narrator # ending:qk_open_lesson
-> END
- else:
门外云还在，未见的人仍未见。你不把空处抹平，先交清今天这一程，再带着还想问的一掌上路。 # beat:qk_best_no_end_4 # scene:qk_lateyard # cast:qk_youngscribe # speaker:narrator # ending:qk_open_mountain
-> END
}
