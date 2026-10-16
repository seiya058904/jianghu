// 原创旁支：华阴地方剑馆，不是六门会武，不改变正录胜负。
VAR stance = 0
VAR friend = 0
VAR observation = 0
VAR first_result = 0
VAR honest = false
VAR learned = false
VAR route = 0
VAR promise = false
-> opening

=== opening ===
你陪谢行舟从临湘来问剑。一柄木剑横住院门，剑尖点在你这位小馆学徒的包袱上。 # beat:gate # scene:courtyard # cast:lin # speaker:narrator # mood:lin=sharp # action:木剑拦路
你朋友一路说要来问剑。怎么，人到了，话倒丢在门外了？ # beat:challenge # speaker:lin # prompt:你怎样接她的话？
* [送行也能试剑。你先让半步。 # cid:bold]
    ~ stance = 1
    口气挺大。半步可以让——你打算怎么要？ # beat:bold_react # speaker:lin # mood:lin=amused
    -> arrival
* [先报姓名。我不跟院门打架。 # cid:courteous]
    ~ stance = 2
    林见微。院门不打架，我打。现在，你肯进来了？ # beat:courteous_react # speaker:lin # mood:lin=calm
    -> arrival
* [他的话没丢。我怕你接不住。 # cid:tease]
    ~ stance = 3
    那你拿稳。别等他输了，连话也要替他往回捡。 # beat:tease_react # speaker:lin # mood:lin=sharp
    -> arrival

=== arrival ===
谢行舟挤进院门。他一路攥着的剑柄，此刻反倒松开了。 # beat:xie_enter # cast:lin,xie # speaker:narrator # mood:xie=uneasy # action:同行人入场
我只是问剑。怎么让你一说，倒像来踢馆的？ # beat:xie_protest # speaker:xie
{
- stance == 1:
    她肯让半步。你总不会连我都不敢陪吧？ # beat:you_bold # speaker:you
- stance == 2:
    先把名字报明白。总不能输了还喊人家院门。 # beat:you_courteous # speaker:you
- else:
    我替你把话接住了。后面可得你自己来。 # beat:you_tease # speaker:you
}
松风剑馆，点到为止。受不住便说，别把明天的手也赌进去。 # beat:lin_rules # speaker:lin # mood:lin=calm
我是来看看自己的剑。手，你不必替我操心。 # beat:xie_pride # speaker:xie # mood:xie=sharp
他要抽剑，右肩却先抬了一下。林见微没接这句话。 # beat:shoulder # speaker:narrator # action:剑未动，肩先抬
* [先喝口水。我们不是赶来输的。 # cid:protect]
    ~ friend = 1
    谢了。可你越替我圆，我越像真有事瞒着她。 # beat:protect_react # speaker:xie # mood:xie=uneasy
    -> watch
* [你昨夜说手不酸。现在还算数吗？ # cid:ask_shoulder]
    ~ friend = 2
    ……不算。赶了一夜路，刚才还想撑过去。别笑。 # beat:shoulder_react # speaker:xie # mood:xie=uneasy # fact:breath
    -> watch
* [肩都抬起来了，还要硬撑？ # cid:call_out]
    ~ friend = 3
    当着她也这么说？行，那你先上。我看着。 # beat:call_out_react # speaker:xie # mood:xie=sharp
    -> watch

=== watch ===
谁先上都行。只是别看我剑花好看，就当自己看懂了。 # beat:lin_watch # speaker:lin # mood:lin=amused
木剑转了一个轻巧的圈。她脚下的石缝，始终没有被鞋尖越过。 # beat:circle # speaker:narrator # action:剑花落下，脚未移
说得跟藏了什么宝贝似的。你看出什么了？ # beat:xie_ask # speaker:xie # mood:xie=intent # prompt:你把目光落在哪里？
* [看她的脚。那半寸空着做什么？ # cid:watch_foot]
    ~ observation = 1
    你倒不贪漂亮。等会儿试试——空着，未必是留给你的。 # beat:foot_react # speaker:lin # mood:lin=intent # fact:foot
    她把后脚往石缝旁轻轻一扣，又松开。你记住了那个落点。 # beat:foot_detail # speaker:narrator # action:后脚扣住石缝
    -> first_exchange
* [看呼吸。行舟，你别再抢那一口气。 # cid:watch_breath]
    ~ observation = 2
    ……你看我，不看她？好。我慢下来，你替我记着。 # beat:breath_react # speaker:xie # mood:xie=calm # fact:breath
    他终于把肩放低。林见微也收了剑花，等你上前。 # beat:breath_detail # speaker:narrator # action:同行人放低右肩
    -> first_exchange
* [看剑尖。最后那一圈，再来一次。 # cid:watch_blade]
    ~ observation = 3
    可以。不过你学会画这个圈，未必学会走到这里。 # beat:blade_react # speaker:lin # mood:lin=sharp # fact:blade
    木剑再转一圈。这回你看清了，剑尖比脚步晚到一瞬。 # beat:blade_detail # speaker:narrator # action:剑尖晚了一瞬
    -> first_exchange

=== first_exchange ===
林见微把另一柄木剑递给你。你们各自站上青石坪。 # beat:onto_stones # scene:stones # cast:lin,xie # speaker:narrator # action:接木剑，入场
三招。碰到我袖上红绳，就算你今日有所得。 # beat:three_moves # speaker:lin # mood:lin=intent
只碰红绳？那我可要当真了。 # beat:you_check # speaker:you
当然当真。可你得分清，我让了什么，你又拿到了什么。 # beat:lin_warning # speaker:lin
{
- friend == 1:
    刚才你替我护了面子。这会儿别为了护它，硬往她剑上撞。 # beat:friend_protect_callback # speaker:xie # mood:xie=intent
- friend == 2:
    我听你的，先把气缓下来。你也别一开场就把力用尽。 # beat:friend_breath_callback # speaker:xie # mood:xie=calm
- else:
    我还看着呢。你说我硬撑，总得先做给我看。 # beat:friend_sharp_callback # speaker:xie # mood:xie=sharp
}
林见微轻点鞋尖，木剑斜指你的腕。她等你先动。 # beat:first_question # speaker:narrator # prompt:你先出哪一步？ # action:剑尖指腕，等你先动
* [抢中线，先把她的剑压下去。 # cid:rush_center]
    ~ first_result = 0
    你剑还没压住，她的木剑已经贴上手背。指节一麻，你险些松手。 # beat:center_react # speaker:narrator # mood:lin=calm # action:剑背一叩，指节发麻
    你抢的是剑。可把剑送过来的，是我的脚。 # beat:center_lesson # speaker:lin
    -> elder
* [退半步，先把自己的剑尖稳住。 # cid:yield_half]
    ~ first_result = 1
    林见微追上一步，又忽然收剑。你没有碰到红绳，也没有丢掉木剑。 # beat:yield_react # speaker:narrator # mood:lin=amused # action:退半步，木剑仍在
    退得有数。再退可就出坪了，不是每一步都能借。 # beat:yield_lesson # speaker:lin
    -> elder
* [先不出剑。你刚才为什么松后脚？ # cid:ask_step]
    ~ first_result = 1
    因为你盯着它。我总得看看，你是不是只会盯着。 # beat:ask_step_react # speaker:lin # mood:lin=amused
    她停下剑尖，把一线空处留给你。问话没有换来胜负，却换来了一次重看。 # beat:ask_step_action # speaker:narrator # action:剑停半寸，容你重看
    -> elder
* {observation == 1} [绕开石缝，等她换重心再碰红绳。 # cid:use_foot]
    ~ first_result = 2
    你没有抢剑。等她换脚，才把剑尖送过去。红绳被挑起一线。 # beat:use_foot_react # speaker:narrator # mood:lin=surprised # action:红绳轻轻一扬
    ……这一回，算你看准了。可别忙着把半寸说成半个江湖。 # beat:use_foot_lesson # speaker:lin # mood:lin=amused
    -> elder

=== elder ===
看准了什么？我在廊下听半天，倒还没听明白。 # beat:wen_enter # cast:lin,xie,wen # speaker:wen # mood:wen=calm # action:老馆师从廊下走来
师父，你先别接剑。他才刚进门。 # beat:lin_teacher # speaker:lin # mood:lin=uneasy
我不接。他自己说说：这半步，是她让的，还是他挣的？ # beat:wen_question # speaker:wen # prompt:你怎样说刚才的交锋？
* [看懂了，便是我的。她总不能白让。 # cid:claim_win]
    可她若不让呢？你把一个时机认成自己的本事，吃亏可没人替。 # beat:claim_react # speaker:wen # mood:wen=sharp
    -> changed_step
* [我只懂这一处。换个站位，未必还能用。 # cid:admit_limit]
    ~ honest = true
    这句话站得住。会说“只懂这一处”，才能往别处走。 # beat:admit_react # speaker:wen # mood:wen=amused
    -> changed_step
* [您照她的位置站。我再试一次。 # cid:challenge_wen]
    行。我站。只是输了别说，老头子连半步也不肯让。 # beat:challenge_wen_react # speaker:wen # mood:wen=amused
    -> changed_step

=== changed_step ===
闻铮接过木剑，只把鞋尖朝外挪了半寸。剑尖仍停在同一个地方。 # beat:wen_shift # speaker:narrator # mood:wen=intent # action:同一剑尖，半寸新站位
{
- first_result == 2:
    红绳还在。你刚才碰得到，现在怎么不出剑了？ # beat:wen_result_callback # speaker:wen
- first_result == 0:
    刚才手背挨了一下。如今记住疼了，还是记住脚了？ # beat:wen_pain_callback # speaker:wen
- else:
    方才你肯留一步。现在你留的，是退路，还是想明白的余地？ # beat:wen_pause_callback # speaker:wen
}
行舟，你看。他的剑没动，可我们能走的地方，已经变了。 # beat:lin_shift # speaker:lin # mood:lin=intent
木剑还是木剑。怎么一挪脚，倒像换了一道院门？ # beat:xie_shift # speaker:xie # mood:xie=surprised
{honest:
    你刚才说换站位未必能用。如今换了，你还肯不肯承认？ # beat:wen_honest_callback # speaker:wen # prompt:这一回你怎样试？
- else:
    还是这柄剑，这块坪。你想按刚才的办法来，还是另想一步？ # beat:wen_proud_callback # speaker:wen # prompt:这一回你怎样试？
}
* [仍按刚才那一步出剑，试个明白。 # cid:repeat_move]
    你照原路出剑。闻铮没追，剑背却拦住了你的腕。脚下那一步早被他占了。 # beat:repeat_react # speaker:narrator # mood:wen=calm # action:旧路被占，腕上受阻 # fact:limit
    疼可以记。别把这次疼，练成下次还走同一条路。 # beat:repeat_lesson # speaker:wen
    -> after_lesson
* [不急着出剑。您这一挪，我看不明白了。 # cid:pause_and_ask]
    ~ honest = true
    ~ learned = true
    那就看。不是每一口气都该往剑上送，有时该留给一句问话。 # beat:pause_react # speaker:wen # mood:wen=amused # fact:limit
    闻铮把剑轻放下，让你站到他方才的落点。你才发现，前脚从没真正踩稳。 # beat:pause_lesson # speaker:narrator # action:放下木剑，先站稳
    -> after_lesson
* {observation == 1 && honest} [我不去碰剑。先试能否逼您换脚。 # cid:test_new_step]
    ~ learned = true
    你绕到另一侧。闻铮换脚，你赶忙收剑——一线空处已经擦过衣袖。 # beat:test_step_react # speaker:narrator # mood:wen=amused # action:逼出换脚，立刻收剑 # fact:limit
    肯收剑，好。这次你看见了变化；至于接得住，另算。 # beat:test_step_lesson # speaker:wen
    -> after_lesson

=== after_lesson ===
他把木剑还给你。没有谁给这一剑报榜位，也没有谁说你忽然开悟了。 # beat:return_sword # speaker:narrator # action:收剑，仍是原来的你
你是不是比林姑娘强很多？ # beat:xie_rank # speaker:xie # mood:xie=intent
她这年纪，有她能做的事。我教她站十几年，至少这半寸还得讲明白。 # beat:wen_rank # speaker:wen # mood:wen=calm
别急着排我们。你肩又抬起来了。 # beat:lin_stop # speaker:lin # mood:lin=sharp
{
- friend == 1:
    你替我圆过一次，不必再圆。是我累了，却拿不肯认输装精神。 # beat:xie_protect_memory # speaker:xie # mood:xie=calm
- friend == 2:
    你早问过我了。我偏要到剑背碰上腕子，才肯听进去。 # beat:xie_ask_memory # speaker:xie # mood:xie=uneasy
- else:
    你刚才当着她说我硬撑……难听归难听，你没说错。 # beat:xie_sharp_memory # speaker:xie # mood:xie=calm
}
可我一路赶来，总不能摸了一柄木剑，就这么走了。 # beat:xie_more # speaker:xie # mood:xie=uneasy
不走也可以。把“再打一次”，换成“再学一次”。这回能不能不抢？ # beat:lin_more # speaker:lin # mood:lin=calm
日光落到石坪。你手背还留着一道浅红印，身旁的人等着你开口。 # beat:route_question # speaker:narrator # prompt:这半日，你打算怎样过？ # action:日光落坪，等你作答
* [我陪他练慢招。今天不争谁的面子。 # cid:stay_together]
    ~ route = 1
    你真肯陪？我可得先说好，下次别又替我把话接完。 # beat:together_react # speaker:xie # mood:xie=amused
    我记住了。下次让你先开口，剑也由你自己收。 # beat:together_reply # speaker:you
    两个人，先学怎么轮流。一个站，一个看，谁肩抬起来就换。 # beat:together_teacher # speaker:wen # mood:wen=calm
    林见微把两柄木剑并放在石上。你和谢行舟，一起把包袱放下。 # beat:together_action # speaker:narrator # action:并放木剑，两人留下
    -> veranda
* [行舟先歇。我留下，把没看懂的半步练过。 # cid:stay_practice]
    ~ route = 2
    这次你不替我接剑了？……也好。回去记得教我，别只说自己懂了。 # beat:practice_react # speaker:xie # mood:xie=calm
    教不敢说。我先把自己站稳，再告诉你哪儿站错了。 # beat:practice_reply # speaker:you
    肯说错在哪儿，便能留下。先不用剑，就站刚才那块石。 # beat:practice_teacher # speaker:wen # mood:wen=intent
    谢行舟去廊下坐定。林见微收走你的木剑，把那条石缝指给你。 # beat:practice_action # speaker:narrator # action:收木剑，留一处落点
    -> veranda
* [今天到此。我们带着这半步继续走。 # cid:take_road]
    ~ route = 3
    肯收住，也算一次本事。只是出了院门，别把我让的半步说成你赢了我。 # beat:road_react # speaker:lin # mood:lin=amused
    {
    - stance == 1:
        我记得一进门就说要你让半步。现在知道，该要的是自己能走的半步。 # beat:road_bold_memory # speaker:you
    - else:
        只说来过，挨过一下，也学过一句。不替这一剑报更大的名号。 # beat:road_reply # speaker:you
    }
    路上再累，你就直接说。我也不拿同伴的脸面赌明天的手。 # beat:road_xie # speaker:xie # mood:xie=calm
    你把木剑交还。谢行舟系好包袱，这一回没有急着抢到你前头。 # beat:road_action # speaker:narrator # action:交还木剑，并肩向门
    -> veranda

=== veranda ===
廊下茶已经温了。林见微把杯推到你手边，自己坐在门边晒那条红绳。 # beat:tea # scene:veranda # cast:lin,xie,wen # speaker:narrator # mood:lin=calm,wen=calm # action:木剑归架，茶落手边
{
- observation == 1:
    你一开始看的不是剑，是脚。我记着。下回来，可别只盯那一条缝。 # beat:lin_foot_memory # speaker:lin
- observation == 2:
    你先看同伴喘不喘气。剑能不能使好，有时先看人还撑不撑得住。 # beat:lin_breath_memory # speaker:lin
- else:
    剑花还想看？等你站稳了再看。那时同一个圈，会是另一回事。 # beat:lin_blade_memory # speaker:lin
}
{learned:
    今天没白来。可你看见的只是一次变化，别急着替天下的剑都下断语。 # beat:wen_learned_memory # speaker:wen
- else:
    今天这一下可以记在手上。回去再想，它从哪里来，别只记谁打了你。 # beat:wen_unlearned_memory # speaker:wen
}
{
- route == 1:
    下次再来，我先说话。你替我看肩，怎么样？ # beat:together_promise # speaker:xie # mood:xie=amused # prompt:你给他怎样的回答？
    * [好。你看我的脚，我看你的肩。 # cid:promise_mutual]
        ~ promise = true
        这才公平。总不能一路都只有你教训我。 # beat:mutual_react # speaker:xie # mood:xie=amused # fact:promise
        -> ending_together
    * [先练过今天这一步，再谈下次。 # cid:practice_before_return]
        对，下次不能又空着剑来。今天你说，我听。 # beat:before_return_react # speaker:xie # mood:xie=calm
        -> ending_together
- route == 2:
    留了半日，你先练哪一处？别把“留下”当成已经会了。 # beat:practice_promise # speaker:wen # prompt:你想先把哪一步做对？
    * [请您再指一次，我第一步错在哪里。 # cid:ask_first_error]
        ~ promise = true
        前脚。把脚掌落完整，别让肩替脚先到了。现在，慢慢来。 # beat:first_error_react # speaker:wen # mood:wen=calm # fact:promise
        -> ending_practice
    * [我先站这块石，站到能自己说出哪里不稳。 # cid:stand_patiently]
        林见微，陪他看着。等他能说出一句自己的话，再把木剑给他。 # beat:patient_react # speaker:wen # mood:wen=amused
        -> ending_practice
- else:
    若下次路过，进门前想好第一句话。别总让包袱替你开口。 # beat:road_promise # speaker:lin # mood:lin=amused # prompt:临走，你留哪一句话？
    * [下次带一句练过的话，也带一步练过的脚。 # cid:return_with_practice]
        ~ promise = true
        那我留半壶茶。剑可不会照今天这样等你。 # beat:return_react # speaker:lin # mood:lin=amused # fact:promise
        -> ending_road
    * [先不许愿。等真走稳了，再回来。 # cid:no_empty_promise]
        好。不许空愿的人，我倒愿意等。路上慢一点。 # beat:no_promise_react # speaker:lin # mood:lin=calm
        -> ending_road
}

=== ending_together ===
谢行舟先站好，你蹲下看他的落脚。 # beat:together_close_action # speaker:narrator # action:一人站，一人看
你肩也抬了。换你，我看。 # beat:together_last_reply # speaker:xie # mood:xie=amused
两柄木剑还没再碰，你们已经各自让了一步。院门开着，这半日不再是谁替谁撑场。 # beat:ending_together # speaker:narrator # ending:together
-> END

=== ending_practice ===
木剑仍在架上。你把脚掌一寸一寸落实，谢行舟从廊下替你数呼吸。 # beat:practice_close_action # speaker:narrator # action:剑归架，脚落实
红绳先收着。等你自己看得懂了，再拿它试剑。 # beat:practice_last_reply # speaker:lin # mood:lin=amused
你留下的半日，没有换来榜上一个字。石坪上却多了一道你能认出的足印；这已是这一趟真正带走的东西。 # beat:ending_practice # speaker:narrator # ending:practice
-> END

=== ending_road ===
走出院门，谢行舟问你要不要赶路。你摇头，他便把步子放慢了。 # beat:road_close_action # cast:xie # speaker:narrator # mood:xie=calm # action:离开小院，步子放慢
她最后没拦你的包袱。大概真肯认你这句了。 # beat:road_last_reply # speaker:xie
红绳留在院里，手背那一下跟你上路。你没有赢过什么大人物，却终于知道，下一剑之前还可以先问一句话。 # beat:ending_road # speaker:narrator # ending:road
-> END
