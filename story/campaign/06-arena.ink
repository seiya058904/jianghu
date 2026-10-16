
=== arena_open ===
青蒲水陆小会开试。不是天下第一，没有一场胜负能替你包下一世。 # beat:c_arena_open_1 # scene:arena # cast:yan,gao,rong # speaker:yan # mood:yan=neutral
木兵，出线止，三个短音全场停。护渡见习另记，不抵试艺胜负。 # beat:c_arena_open_2 # scene:arena # cast:yan,gao,rong # speaker:gao # mood:gao=neutral
听见没有？别打赢我以后去说自己破了米价。 # beat:c_arena_open_3 # scene:arena # cast:yan,gao,rong # speaker:rong # mood:rong=amused
米价你自己定，棍价我试试。 # beat:c_arena_open_4 # scene:arena # cast:yan,gao,rong # speaker:you
容既白把外袍交给邓苹，露出磨破的肘护。第一棍试探很短，落在你剑能接住的位置。 # beat:c_arena_open_5 # scene:arena # cast:yan,gao,rong # speaker:narrator
别因为我第一次出得轻，就以为后面也轻。 # beat:c_arena_open_6 # scene:arena # cast:yan,gao,rong # speaker:rong # mood:rong=intent
你看见他左手每次往回收，右脚才跟进。间隙在棍尾，不在脸上。 # beat:c_arena_open_7 # scene:arena # cast:yan,gao,rong # speaker:narrator
{
- rong_fair:
你昨夜要我真打。我就按说好的来，输了也不找棍子滑的借口。 # beat:c_arena_open_8 # scene:arena # cast:yan,gao,rong # speaker:rong # mood:rong=calm
- else:
你昨夜说只认判线。行，不用先交朋友，也能认真过这一场。 # beat:c_arena_open_9 # scene:arena # cast:yan,gao,rong # speaker:rong # mood:rong=neutral
}
{
- fair:
你在渡口问过敢不敢判出钱人输。我站在这里，今天仍是那个回答。 # beat:c_arena_open_10 # scene:arena # cast:su,yan,gao # speaker:su # mood:su=neutral
}
* [先守一手，看清棍尾回收的时机。 # cid:arena_read]
  ~ duel_read = true
  我看见了，但不急着进去。你也还在等我。 # beat:c_arena_open_11 # scene:arena # cast:su,yan,gao # speaker:you
  这句算实话。来，第二手。 # beat:c_arena_open_12 # scene:arena # cast:rong,su,yan # speaker:rong # mood:rong=intent
  -> arena_press
* [抢第一轮的短棍，逼他早出后手。 # cid:arena_rush]
  ~ duel_read = false
  你抢进中间，棍尾忽然翻上来。你只得侧身，剑势散了一半。 # beat:c_arena_open_13 # scene:arena # cast:rong,su,yan # speaker:narrator
  钱替不了我打，胆子也替不了你退。现在怎么办？ # beat:c_arena_open_14 # scene:arena # cast:rong,su,yan # speaker:rong # mood:rong=sharp
  -> arena_press

=== arena_press ===
第二轮，棍的压力突然变重。你听见衣袖擦过护手，场外的喊声像隔了一层水。 # beat:c_arena_press_1 # scene:arena # cast:rong,xu,qiao # speaker:narrator
他不是每一下都快！别被第一下赶着！ # beat:c_arena_press_2 # scene:arena # cast:rong,xu,qiao # speaker:qiao # mood:qiao=intent
你先把呼吸接回来！右边还有半步！ # beat:c_arena_press_3 # scene:arena # cast:rong,xu,qiao # speaker:xu # mood:xu=neutral
场外的人说得都对，可剑还在我手上。 # beat:c_arena_press_4 # scene:arena # cast:rong,xu,qiao # speaker:you
那就听你自己能做到的。我要再进了。 # beat:c_arena_press_5 # scene:arena # cast:rong,xu,qiao # speaker:rong # mood:rong=intent
棍头占住中线，你的伤处若再发力，就很难收住下一下。 # beat:c_arena_press_6 # scene:arena # cast:rong,xu,qiao # speaker:narrator
* {duel_read and wound < 2} [让出中线，贴棍尾绕到侧方。 # cid:duel_turn]
  ~ duel = 2
  你让出一条直路，把剑留在斜处。棍尾回收时，剑背终于轻碰到他肩衣。 # beat:c_arena_press_7 # scene:arena # cast:rong,xu,qiao # speaker:narrator
  ……这一手，确实到了。再来，我不会再让你这么走。 # beat:c_arena_press_8 # scene:arena # cast:rong,xu,qiao # speaker:rong # mood:rong=surprised
  -> arena_result
* [不求碰肩，只守住第三轮。 # cid:duel_three]
  ~ duel = 1
  我不抢你那条路。我只把自己这条留住。 # beat:c_arena_press_9 # scene:arena # cast:rong,xu,qiao # speaker:you
  第三棍震得手心发麻，你仍没越线。锣声后，你才把那口气吐出来。 # beat:c_arena_press_10 # scene:arena # cast:rong,xu,qiao # speaker:narrator
  守住了。这不是你碰到我，但也不是我打倒你。 # beat:c_arena_press_11 # scene:arena # cast:rong,xu,qiao # speaker:rong # mood:rong=calm
  -> arena_result
* [赌他收棍的半瞬，以伤换碰肩。 # cid:duel_risk]
  ~ duel = 0
  ~ wound = wound + 1
  剑背碰上衣肩，棍尾也点中你肋下。主事立即叫停，判同时中身。 # beat:c_arena_press_12 # scene:arena # cast:rong,xu,qiao # speaker:narrator
  别硬笑。你碰到了，我也到了，这笔账谁都没赢净。 # beat:c_arena_press_13 # scene:arena # cast:rong,xu,qiao # speaker:rong # mood:rong=uneasy
  -> arena_result

=== arena_result ===
到此，记一次清楚的问手。输了哪一手，自己也得记清楚。 # beat:c_arena_result_1 # scene:arena # cast:rong,yan,deng # speaker:yan # mood:yan=neutral
你比我想得难打。我本来以为，你会先问我输不输得起。 # beat:c_arena_result_2 # scene:arena # cast:rong,yan,deng # speaker:rong # mood:rong=neutral
你真输了会怎样？ # beat:c_arena_result_3 # scene:arena # cast:rong,yan,deng # speaker:you
先想怎么赢回来，再想午饭。顺序不能反，反了容易发脾气。 # beat:c_arena_result_4 # scene:arena # cast:rong,yan,deng # speaker:rong # mood:rong=amused
少东，午饭已经凉了。 # beat:c_arena_result_5 # scene:arena # cast:rong,yan,deng # speaker:deng # mood:deng=neutral
那就先吃。道理也得看时候。 # beat:c_arena_result_6 # scene:arena # cast:rong,yan,deng # speaker:rong # mood:rong=surprised
他把棍靠在坪边，没有叫伙计替他解释。你终于看见，比你家有钱的人也会认真懊恼。 # beat:c_arena_result_7 # scene:arena # cast:rong,yan,deng # speaker:narrator
* [约定养好伤以后再来，不要今日赌完。 # cid:rival_rematch]
  ~ rematch = true
  下一回我也练好了。今天先把手留着吃饭。 # beat:c_arena_result_8 # scene:arena # cast:rong,yan,deng # speaker:you
  好。输赢不预定，饭我可以先定。 # beat:c_arena_result_9 # scene:arena # cast:rong,yan,deng # speaker:rong # mood:rong=calm
  -> arena_pairs
* [只行礼承认这场，不许下未来的诺。 # cid:rival_distance2]
  ~ rematch = false
  这一次我认。下回的事，下回走到你面前再讲。 # beat:c_arena_result_10 # scene:arena # cast:rong,yan,deng # speaker:you
  也好。比随口说明年一定来，再让我多备一双筷子强。 # beat:c_arena_result_11 # scene:arena # cast:rong,yan,deng # speaker:rong # mood:rong=calm
  -> arena_pairs

=== arena_pairs ===
乔砚生与许竞川的场排在斜木板旁。试的不是倒人，是二人轮换守住一面小旗。 # beat:c_arena_pairs_1 # scene:arena # cast:qiao,xu,yan # speaker:narrator
怎么，我想跟你打，结果要跟你站一边？ # beat:c_arena_pairs_2 # scene:arena # cast:qiao,xu,yan # speaker:xu # mood:xu=amused
嫌我碍事，你去守另一边，看主事认不认。 # beat:c_arena_pairs_3 # scene:arena # cast:qiao,xu,yan # speaker:qiao # mood:qiao=neutral
轮换的时候互相报信。谁抢得自己风光，旗落了就都算失。 # beat:c_arena_pairs_4 # scene:arena # cast:qiao,xu,yan # speaker:yan # mood:yan=neutral
原来这场不是两个人都把别人打倒。 # beat:c_arena_pairs_5 # scene:arena # cast:qiao,xu,yan # speaker:you
我守左。手不行的时候会喊，不让你自己猜。 # beat:c_arena_pairs_6 # scene:arena # cast:qiao,xu,yan # speaker:qiao # mood:qiao=intent
另一组木杆横扫，旗脚在湿板上滑了一寸。 # beat:c_arena_pairs_7 # scene:arena # cast:qiao,xu,yan # speaker:narrator
* {team or qiao_rest} [按约定报位置，让同伴先换手。 # cid:pair_signal]
  ~ pair_win = true
  砚生，左边我接！你去旗后，别抬右腕！ # beat:c_arena_pairs_8 # scene:arena # cast:qiao,xu,yan # speaker:you
  乔砚生让出位置，许竞川的刀鞘钉住旗脚。旗没有倒，三个人也没抢成一团。 # beat:c_arena_pairs_9 # scene:arena # cast:qiao,xu,yan # speaker:narrator
  听见了。这次我没撑，你也没把我全拿走。 # beat:c_arena_pairs_10 # scene:arena # cast:qiao,xu,yan # speaker:qiao # mood:qiao=amused
  -> arena_pair_result
* [自己扑住旗脚，把守人的事交出去。 # cid:pair_flag]
  ~ pair_win = true
  旗我按着，你们守人！我不抬头，信你们这回。 # beat:c_arena_pairs_11 # scene:arena # cast:qiao,xu,yan # speaker:you
  别松！再一轮！ # beat:c_arena_pairs_12 # scene:arena # cast:qiao,xu,yan # speaker:xu # mood:xu=intent
  木杆停在你头顶半尺，刀鞘先接住了它。你连谁打来的都没看清。 # beat:c_arena_pairs_13 # scene:arena # cast:qiao,xu,yan # speaker:narrator
  -> arena_pair_result
* [先抢倒持杆人，用先手结束压力。 # cid:pair_attack]
  ~ pair_win = false
  你扑了出去。对方收杆让开，旗在你身后倒了。 # beat:c_arena_pairs_14 # scene:arena # cast:qiao,xu,yan # speaker:narrator
  我喊了。我不是要你救我，是要你换一下。 # beat:c_arena_pairs_15 # scene:arena # cast:qiao,xu,yan # speaker:qiao # mood:qiao=uneasy
  还能记清哪一下没听见，今天就没白来。 # beat:c_arena_pairs_16 # scene:arena # cast:qiao,xu,yan # speaker:xu # mood:xu=neutral
  -> arena_pair_result

=== arena_pair_result ===
这场我记三个人的手，不写谁替谁扛了全场。 # beat:c_arena_pair_result_1 # scene:arena # cast:su,lu,yan # speaker:su # mood:su=neutral
我刚才看见有人临时换了握法，不在旧式里，也没把旧式扔了。 # beat:c_arena_pair_result_2 # scene:arena # cast:su,lu,yan # speaker:lu # mood:lu=neutral
你若要拿来反驳我，最好写清楚为什么换。 # beat:c_arena_pair_result_3 # scene:arena # cast:su,lu,yan # speaker:su # mood:su=amused
你们还要争？ # beat:c_arena_pair_result_4 # scene:arena # cast:su,lu,yan # speaker:you
要。但晚上能坐一桌吃饭，不耽误争。 # beat:c_arena_pair_result_5 # scene:arena # cast:su,lu,yan # speaker:lu # mood:lu=neutral
忽然，东边的锣响了两个短音。严平章抬头，还没等第三声，便有人沿坪边跑来。 # beat:c_arena_pair_result_6 # scene:arena # cast:su,lu,yan # speaker:narrator
东堤漫水！最外那座雨棚开始进水，车堵着撤不下来！ # beat:c_arena_pair_result_7 # scene:arena # cast:tian,su,lu # speaker:tian # mood:tian=intent
* [提醒停试令，要求立即给东堤让路。 # cid:stop_public]
  ~ stop_clear = true
  第三声！别等人都听不见才敲！ # beat:c_arena_pair_result_8 # scene:arena # cast:tian,su,lu # speaker:you
  停试！旗手，把东出口放开。未完的场另记，不许堵在路上争！ # beat:c_arena_pair_result_9 # scene:arena # cast:yan,tian,su # speaker:yan # mood:yan=intent
  -> levee_call
* [先去东堤看人，不再等场上宣布。 # cid:go_direct]
  ~ stop_clear = false
  我先走，名字在册上，回来再说。 # beat:c_arena_pair_result_10 # scene:arena # cast:yan,tian,su # speaker:you
  我记着。你去的是急难，不是逃场。陆汀舟，跟我开侧门。 # beat:c_arena_pair_result_11 # scene:arena # cast:yan,tian,su # speaker:su # mood:su=intent
  -> levee_call
