// 太华试序：原典锁定历史，玩家改变承诺与相处
VAR guidance_repeated = false
VAR layout_fast = false
VAR layout_draw = false
VAR ming_distance = false
VAR xie_room = false
VAR huo_feet = false
VAR read_stop = false
VAR old_unknown = false
VAR half_distance = false
VAR four_breaths = false
VAR old_stop_plain = false
VAR front_page = false
VAR meal_question = false
VAR care = false
VAR promise = false
VAR shen_open = false
VAR strain = false
VAR honest = false
VAR shared = false
VAR soup = false
VAR night_honest = false
VAR rematch = false
VAR measured = false
VAR respect_shen = false
VAR kept_promise = false
VAR huo_question = false
VAR ask_limit = false
VAR plain = false
VAR open_question = false
VAR future = 0
VAR carried = false
-> called

=== called ===
你含着一口水，听见领队老人说：明日青序，你补。 # beat:th_called_1 # scene:th_guest # cast:th_leader,th_bro # speaker:narrator
……我？ # beat:th_called_2 # scene:th_guest # cast:th_leader,th_bro # speaker:you
这屋里还有第二个陆青珩？ # beat:th_called_3 # scene:th_guest # cast:th_leader,th_bro # speaker:th_leader # mood:th_leader=sharp
你咳得袖口都湿了。床边师兄的右膝肿起，绑腿搁在盆沿，他看着自己的鞋，没有看你。 # beat:th_called_4 # scene:th_guest # cast:th_leader,th_bro # speaker:narrator
可是我没准备。 # beat:th_called_5 # scene:th_guest # cast:th_leader,th_bro # speaker:you
练了二十年，你想再准备几日？ # beat:th_called_6 # scene:th_guest # cast:th_leader,th_bro # speaker:th_leader # mood:th_leader=neutral
我的护腕在箱里。合用便拿，不合用别硬戴。 # beat:th_called_7 # scene:th_guest # cast:th_leader,th_bro # speaker:th_bro # mood:th_bro=uneasy
那只箱子刚收好。他为这十七日封岭，备了远不止十七日。 # beat:th_called_8 # scene:th_guest # cast:th_leader,th_bro # speaker:narrator
* [先把水盆移到师兄够得着的地方。 # cid:th_care]
  ~ care = true
  护腕先放着。水凉了，我去换。药什么时候敷？ # beat:th_called_9 # scene:th_guest # cast:th_leader,th_bro # speaker:you
  你明日上场，别围着我转。 # beat:th_called_10 # scene:th_guest # cast:th_leader,th_bro # speaker:th_bro # mood:th_bro=neutral
  我只问什么时候敷，又没说替你疼。 # beat:th_called_11 # scene:th_guest # cast:th_leader,th_bro # speaker:you
  他用没伤的脚，把挡路的鞋往床下一拨。 # beat:th_called_12 # scene:th_guest # cast:th_leader,th_bro # speaker:narrator
  -> packing
* [接过护腕，直说我怕拖武当的后腿。 # cid:th_ask]
  ~ care = false
  我怕补进去，反而让人觉得你该硬撑上去。 # beat:th_called_13 # scene:th_guest # cast:th_leader,th_bro # speaker:you
  我的膝盖不是拿你输赢治的。 # beat:th_called_14 # scene:th_guest # cast:th_leader,th_bro # speaker:th_bro # mood:th_bro=sharp
  他把护腕塞进你手里，却没有替你绑好。 # beat:th_called_15 # scene:th_guest # cast:th_leader,th_bro # speaker:narrator
  你打你的。我退了，就是退了。 # beat:th_called_16 # scene:th_guest # cast:th_leader,th_bro # speaker:th_bro # mood:th_bro=neutral
  -> packing

=== packing ===
明早认席位，别认成对面太极的。他们也有人姓司马，不是人人都一样。 # beat:th_packing_1 # scene:th_guest # cast:th_bro,th_leader # speaker:th_leader # mood:th_leader=neutral
我还不至于连衣服都认错。 # beat:th_packing_2 # scene:th_guest # cast:th_bro,th_leader # speaker:you
你刚才把我的护腕套反了。 # beat:th_packing_3 # scene:th_guest # cast:th_bro,th_leader # speaker:th_bro # mood:th_bro=amused
你低头，把系带从掌心翻到手背。师兄笑了一下，笑完又按住右膝。 # beat:th_packing_4 # scene:th_guest # cast:th_bro,th_leader # speaker:narrator
青序六十人，正序二十八。五位返真上座，不下场抢他们的序。 # beat:th_packing_5 # scene:th_guest # cast:th_bro,th_leader # speaker:th_leader # mood:th_leader=neutral
榜上那些人…… # beat:th_packing_6 # scene:th_guest # cast:th_bro,th_leader # speaker:you
这是六门内的旧会。你先把明日叫到的名字听清。 # beat:th_packing_7 # scene:th_guest # cast:th_bro,th_leader # speaker:th_leader # mood:th_leader=neutral # fact:th_closed
* [答应回来把每一场亲眼看到的讲给师兄。 # cid:th_promise]
  ~ promise = true
  你不能到场，我回来讲。看不懂的，也照实讲。 # beat:th_packing_8 # scene:th_guest # cast:th_bro,th_leader # speaker:you
  别只讲高手。说说你第一场，哪只脚先乱。 # beat:th_packing_9 # scene:th_guest # cast:th_bro,th_leader # speaker:th_bro # mood:th_bro=intent
  还没打就咒我？ # beat:th_packing_10 # scene:th_guest # cast:th_bro,th_leader # speaker:you
  不乱也讲。那我更要听。 # beat:th_packing_11 # scene:th_guest # cast:th_bro,th_leader # speaker:th_bro # mood:th_bro=neutral
  -> first_morning
* [今晚先睡，不许自己临时多练。 # cid:th_quiet]
  ~ promise = false
  我再练到天亮，明日只会多个打哈欠的人。 # beat:th_packing_12 # scene:th_guest # cast:th_bro,th_leader # speaker:you
  总算有一句像练过二十年的。 # beat:th_packing_13 # scene:th_guest # cast:th_bro,th_leader # speaker:th_leader # mood:th_leader=amused
  你吹了灯，黑暗里仍听见师兄解开又绑紧药布的声音。 # beat:th_packing_14 # scene:th_guest # cast:th_bro,th_leader # speaker:narrator
  有事叫我。我睡得未必着。 # beat:th_packing_15 # scene:th_guest # cast:th_bro,th_leader # speaker:you
  -> first_morning

=== first_morning ===
藏云台三面石壁、一面临谷，云往上涌。长棚前旧木牌很小，没有山外大会的旗阵；报帖声从石坪另一边传来。 # beat:th_first_morning_1 # scene:th_stone # cast:th_shen,th_huo # speaker:narrator
你坐进武当青序十人的席里。太极认得四个，八卦三个；昆仑一张脸也叫不出名字。 # beat:th_first_morning_2 # scene:th_stone # cast:th_shen,th_huo # speaker:narrator
偏瘦的人靠昆仑边坐，旧剑鞘放得很静。武当白发老人掰核桃，叫出霍停云，三十三，十四入白石谷，最早跟陆寒石。 # beat:th_first_morning_3 # scene:th_stone # cast:th_shen,th_huo # speaker:narrator
六年前见过，不一样了。现在多强？不知道。 # beat:th_first_morning_4 # scene:th_stone # cast:th_walnut,th_shen,th_huo # speaker:th_walnut # mood:th_walnut=amused
您不是见过？ # beat:th_first_morning_5 # scene:th_stone # cast:th_walnut,th_shen,th_huo # speaker:you
六年前的你，同今日一样？ # beat:th_first_morning_6 # scene:th_stone # cast:th_walnut,th_shen,th_huo # speaker:th_walnut # mood:th_walnut=neutral
你闭嘴，掌中汗却松了些。正要再看，八卦棚那边有人先笑了。 # beat:th_first_morning_7 # scene:th_stone # cast:th_walnut,th_shen,th_huo # speaker:narrator
看他没用，第一场跟你打的是我。 # beat:th_first_morning_8 # scene:th_stone # cast:th_walnut,th_shen,th_huo # speaker:th_shen # mood:th_shen=amused
陆青珩。刚补进来。 # beat:th_first_morning_9 # scene:th_stone # cast:th_walnut,th_shen,th_huo # speaker:you
沈照微。补进来的人也要占一个位置，你别先替我让。 # beat:th_first_morning_10 # scene:th_stone # cast:th_walnut,th_shen,th_huo # speaker:th_shen # mood:th_shen=neutral
八卦棚里有人剥胡桃，说起她二十二岁改师父旧步的事，笑声连成一片。 # beat:th_first_morning_11 # scene:th_stone # cast:th_walnut,th_shen,th_huo # speaker:narrator
师叔。 # beat:th_first_morning_12 # scene:th_stone # cast:th_walnut,th_shen,th_huo # speaker:th_shen # mood:th_shen=sharp
剥胡桃的老人立刻埋头。你掌心的汗忽然没那么凉了。 # beat:th_first_morning_13 # scene:th_stone # cast:th_walnut,th_shen,th_huo # speaker:narrator
* [低声问她：胡桃好吃，还是改步好玩？ # cid:th_tease]
  ~ shen_open = true
  他们笑得这样热闹，你改步的时候也笑？ # beat:th_first_morning_14 # scene:th_stone # cast:th_walnut,th_shen,th_huo # speaker:you
  我师父追着打我的时候，我可忙着跑。 # beat:th_first_morning_15 # scene:th_stone # cast:th_walnut,th_shen,th_huo # speaker:th_shen # mood:th_shen=amused
  所以练成了这套？ # beat:th_first_morning_16 # scene:th_stone # cast:th_walnut,th_shen,th_huo # speaker:you
  你上来试试，就知道是不是光会跑。 # beat:th_first_morning_17 # scene:th_stone # cast:th_walnut,th_shen,th_huo # speaker:th_shen # mood:th_shen=neutral
  -> fache_open
* [认真行礼，请她不必顾及替补的面子。 # cid:th_bow]
  ~ shen_open = false
  既然进了场，按真本事来。 # beat:th_first_morning_18 # scene:th_stone # cast:th_walnut,th_shen,th_huo # speaker:you
  好。待会儿你若被绕晕了，也不算我欺负你。 # beat:th_first_morning_19 # scene:th_stone # cast:th_walnut,th_shen,th_huo # speaker:th_shen # mood:th_shen=intent
  她把袖口收齐，脚跟却没有停在你预想的那条线上。 # beat:th_first_morning_20 # scene:th_stone # cast:th_walnut,th_shen,th_huo # speaker:narrator
  -> fache_open

=== fache_open ===
第一日上午第一场，少林法彻三十六，对八卦慕容景生三十二。你尚未被叫上场，先把刚捏紧的护腕放松。 # beat:th_fache_open_1 # scene:th_firstwatch # cast:th_fache,th_jingsheng,th_walnut # speaker:narrator
二十招，慕容两次绕进左侧，身法明快。三十以后又进一次，旁边有人说八卦占着。白发老人捏着炒豆，只问你看了几次。 # beat:th_fache_open_2 # scene:th_firstwatch # cast:th_fache,th_jingsheng,th_walnut # speaker:narrator
别先数谁好看。刚才从哪儿进？ # beat:th_fache_open_3 # scene:th_firstwatch # cast:th_fache,th_jingsheng,th_walnut # speaker:th_walnut # mood:th_walnut=neutral
法彻的左门还开着。慕容下一步已要再落，你得在结果出来以前给自己一个判断。 # beat:th_fache_open_4 # scene:th_firstwatch # cast:th_fache,th_jingsheng,th_walnut # speaker:narrator
* [判断慕容已三次进左，下次也有机会；先把自己看到的优势说清。 # cid:th_predict_fast]
  ~ layout_fast = true
  左边进过三次，法彻还没封。他再进去，也许还能逼和尚退。 # beat:th_fache_open_5 # scene:th_firstwatch # cast:th_fache,th_jingsheng,th_walnut # speaker:you
  记住你这句，等下一回。 # beat:th_fache_open_6 # scene:th_firstwatch # cast:th_fache,th_jingsheng,th_walnut # speaker:th_walnut # mood:th_walnut=intent
  你把这句写在纸边，刚落笔，慕容的左脚又抬起来。 # beat:th_fache_open_7 # scene:th_firstwatch # cast:th_fache,th_jingsheng,th_walnut # speaker:narrator
  -> fache_close
* [怀疑同一处三次都开着是在等，先看慕容落脚后还能不能变。 # cid:th_predict_wait]
  ~ layout_fast = false
  他一直留左，我想看慕容进去以后脚还能不能换。 # beat:th_fache_open_8 # scene:th_firstwatch # cast:th_fache,th_jingsheng,th_walnut # speaker:you
  看。也别因为猜着一个等字，便以为后头全知道。 # beat:th_fache_open_9 # scene:th_firstwatch # cast:th_fache,th_jingsheng,th_walnut # speaker:th_walnut # mood:th_walnut=neutral
  你将目光移向真正要落地的那只脚。 # beat:th_fache_open_10 # scene:th_firstwatch # cast:th_fache,th_jingsheng,th_walnut # speaker:narrator
  -> fache_close

=== fache_close ===
第四次仍左。法彻向里错半步，原来开着的门忽然没了。慕容脚已落，想换，晚；第四十八招，掌根停胸，少林胜。 # beat:th_fache_close_1 # scene:th_firstwatch # cast:th_fache,th_jingsheng,th_walnut # speaker:narrator
这场我负。 # beat:th_fache_close_2 # scene:th_firstwatch # cast:th_fache,th_jingsheng,th_walnut # speaker:th_jingsheng # mood:th_jingsheng=intent
他收脚，法彻也收掌。三次进去的事实没有被删，只是你原来还没算到第四次怎样收回来。 # beat:th_fache_close_3 # scene:th_firstwatch # cast:th_fache,th_jingsheng,th_walnut # speaker:narrator
有人前三十招打，有人等第三十一招。不是每个退都同一个意思。 # beat:th_fache_close_4 # scene:th_firstwatch # cast:th_fache,th_jingsheng,th_walnut # speaker:th_walnut # mood:th_walnut=neutral # fact:th_48
{
- layout_fast:
我刚才说还能进，没看落脚以后。不是慕容先前没占到，是那处占过也要回。 # beat:th_fache_close_5 # scene:th_firstwatch # cast:th_fache,th_jingsheng,th_walnut # speaker:you
能把错说清，比忙着改成自己猜对强。 # beat:th_fache_close_6 # scene:th_firstwatch # cast:th_fache,th_jingsheng,th_walnut # speaker:th_walnut # mood:th_walnut=amused
- else:
我只猜他等，还没看出半步怎样封住。 # beat:th_fache_close_7 # scene:th_firstwatch # cast:th_fache,th_jingsheng,th_walnut # speaker:you
那就记半步，不要只拿一句算得早回去夸。 # beat:th_fache_close_8 # scene:th_firstwatch # cast:th_fache,th_jingsheng,th_walnut # speaker:th_walnut # mood:th_walnut=intent
}
* [在纸边画三次入口与第四次落脚，待自己败过一场后还留着对照。 # cid:th_draw_left]
  ~ layout_draw = true
  只画完左脚与半步，叫名已近。你少看了下一场开头，仍将这页折进护腕旁，不添自己尚没看见的手。 # beat:th_fache_close_9 # scene:th_firstwatch # cast:th_fache,th_jingsheng,th_walnut # speaker:narrator
  -> chase
* [先看下一场不同对手，记住自己的判断；不将法彻这一门套到每一个退步里。 # cid:th_watch_next]
  ~ layout_draw = false
  下一场真有人退着退着被逼住，你没有立刻喊他也在等。纸边只留一行，第四回左门没了。 # beat:th_fache_close_10 # scene:th_firstwatch # cast:th_fache,th_jingsheng,th_walnut # speaker:narrator
  -> chase

=== chase ===
第一掌落空。你跟上半步，她已经切到右外；你转肩，她又从原先的空处穿走。 # beat:th_chase_1 # scene:th_stone # cast:th_shen # speaker:narrator
几次相接，手里竟一下也没真碰到她。你想快，她的影子就更像水。 # beat:th_chase_2 # scene:th_stone # cast:th_shen # speaker:narrator
刚才说不让，你追得倒客气。 # beat:th_chase_3 # scene:th_stone # cast:th_shen # speaker:th_shen # mood:th_shen=intent
右肩发紧，你还有一口力。追人还是守路，已不能同时做。 # beat:th_chase_4 # scene:th_stone # cast:th_shen # speaker:narrator
* [再追一个身位，逼她露出停步。 # cid:th_rush]
  ~ strain = true
  总得有落地的时候！ # beat:th_chase_5 # scene:th_stone # cast:th_shen # speaker:you
  你探手，她忽然不绕，掌心已到胸前。你急收半步，肩背绷得发疼。 # beat:th_chase_6 # scene:th_stone # cast:th_shen # speaker:narrator
  有。你没站在那儿。 # beat:th_chase_7 # scene:th_stone # cast:th_shen # speaker:th_shen # mood:th_shen=sharp
  这一下没把你打倒，却把那口急气打散了。 # beat:th_chase_8 # scene:th_stone # cast:th_shen # speaker:narrator
  -> centre
* [停下追人，先占住中间。 # cid:th_hold]
  ~ strain = false
  不跟你跑了。 # beat:th_chase_9 # scene:th_stone # cast:th_shen # speaker:you
  现在才想起站住？ # beat:th_chase_10 # scene:th_stone # cast:th_shen # speaker:th_shen # mood:th_shen=amused
  你没有答，肩沉下去，让她下一步要经过的地方先变窄。 # beat:th_chase_11 # scene:th_stone # cast:th_shen # speaker:narrator
  她第一次稍顿，随即直进。胸口仍挨了一下，能感觉到距离了。 # beat:th_chase_12 # scene:th_stone # cast:th_shen # speaker:narrator
  -> centre

=== centre ===
你揉了一下胸口，重新占中。她仍比你快，你便不再抢着碰到她的人。 # beat:th_centre_1 # scene:th_stone # cast:th_shen # speaker:narrator
第一百零二手，她封你肩，你脚下一错，以肩抵入；她的手也停在你颈侧。 # beat:th_centre_2 # scene:th_stone # cast:th_shen # speaker:narrator
你先。 # beat:th_centre_3 # scene:th_stone # cast:th_shen # speaker:th_shen # mood:th_shen=calm
先了多少？ # beat:th_centre_4 # scene:th_stone # cast:th_shen # speaker:you
半息。够记这一场。 # beat:th_centre_5 # scene:th_stone # cast:th_shen # speaker:th_shen # mood:th_shen=neutral
判手报胜，你才发现自己的手在抖。沈照微没有摊手争，她只是把刚才那条路又走了一遍。 # beat:th_centre_6 # scene:th_stone # cast:th_shen # speaker:narrator # fact:th_first
* [承认自己仍在抖，不把胜场说得轻松。 # cid:th_admit]
  ~ honest = true
  我以为赢了会稳一点。 # beat:th_centre_7 # scene:th_stone # cast:th_shen # speaker:you
  等你抖完，我还要问那一下肩。 # beat:th_centre_8 # scene:th_stone # cast:th_shen # speaker:th_shen # mood:th_shen=amused
  现在问也行，反正我手暂时没别的用。 # beat:th_centre_9 # scene:th_stone # cast:th_shen # speaker:you
  她笑出声，伸手指你仍在抖的袖口，随后把自己的脚又摆回第一步。 # beat:th_centre_10 # scene:th_stone # cast:th_shen # speaker:narrator
  -> after_first
* [把手藏在袖里，说下次再打过。 # cid:th_shield]
  ~ honest = false
  下一场再见。 # beat:th_centre_11 # scene:th_stone # cast:th_shen # speaker:you
  好。袖里那只手也一起带来。 # beat:th_centre_12 # scene:th_stone # cast:th_shen # speaker:th_shen # mood:th_shen=sharp
  你脸热了一下。她没再追问，转身去看别人的场。 # beat:th_centre_13 # scene:th_stone # cast:th_shen # speaker:narrator
  -> after_first

=== after_first ===
你回客舍，门槛上摆着一双朝外的鞋。师兄已把药换过，护腕留下了汗的颜色。 # beat:th_after_first_1 # scene:th_guest # cast:th_bro # speaker:narrator
哪只脚先乱？ # beat:th_after_first_2 # scene:th_guest # cast:th_bro # speaker:th_bro # mood:th_bro=neutral
{
- promise:
答应回来讲的。先说丢人的：我追她追得什么也没碰着。 # beat:th_after_first_3 # scene:th_guest # cast:th_bro # speaker:you
然后呢？别从赢的那手开始倒着吹。 # beat:th_after_first_4 # scene:th_guest # cast:th_bro # speaker:th_bro # mood:th_bro=intent
- else:
我赢了一场。 # beat:th_after_first_5 # scene:th_guest # cast:th_bro # speaker:you
我听说了。没听说你怎样赢。 # beat:th_after_first_6 # scene:th_guest # cast:th_bro # speaker:th_bro # mood:th_bro=neutral
他将饭碗往床边挪了挪，等你坐下。你张了两次嘴，还是先从追着她转的第一掌说起。 # beat:th_after_first_7 # scene:th_guest # cast:th_bro # speaker:narrator
}
* [拿护腕摆出双方的脚位，把失败也讲全。 # cid:th_demonstrate]
  ~ shared = true
  这块是我。这块是她，先别动——不，她已经不在这儿了。 # beat:th_after_first_8 # scene:th_guest # cast:th_bro # speaker:you
  那你该摆六块。 # beat:th_after_first_9 # scene:th_guest # cast:th_bro # speaker:th_bro # mood:th_bro=amused
  他伸手挪了一寸布角。膝上不能做的步子，在床沿一点点摆出来。 # beat:th_after_first_10 # scene:th_guest # cast:th_bro # speaker:narrator
  -> ming_open
* [说胸前挨了掌，今晚先养气，不复盘。 # cid:th_limit]
  ~ shared = false
  我怕讲着讲着，又忍不住去院里试。 # beat:th_after_first_11 # scene:th_guest # cast:th_bro # speaker:you
  那就先吃。你不能把每一场都压到今晚。 # beat:th_after_first_12 # scene:th_guest # cast:th_bro # speaker:th_bro # mood:th_bro=calm
  他把一碗尚温的饭推过来。你捧着碗，没再起身比那一下，先吃了一口。 # beat:th_after_first_13 # scene:th_guest # cast:th_bro # speaker:narrator
  -> ming_open

=== ming_open ===
谢临川前两战五十二招、四十一招连胜，第三问明澄。少林这位三十七，前两战一胜一平；华山想前三的剑，遇上看着不显眼的和尚。 # beat:th_ming_open_1 # scene:th_mingtrial # cast:th_xie,th_ming # speaker:narrator
第三十七，明澄右袖破；四十九，肩口又破线。六十，已逼坪边，再退两步便出界。 # beat:th_ming_open_2 # scene:th_mingtrial # cast:th_xie,th_ming # speaker:narrator
谢忽然更快，一剑压肩，一剑封侧，第三剑要入中。你看见破袖，又看见明澄的脚没有往后抬。 # beat:th_ming_open_3 # scene:th_mingtrial # cast:th_xie,th_ming # speaker:narrator
* [先认自己以为破袖便快分胜负，再看明澄为什么没退最后两步。 # cid:th_watch_torn_sleeve]
  ~ ming_distance = true
  第一剑擦肩，第二剑被手背带偏。明澄已经迎进，你刚才以为应当后退的地方，变成短掌能到的位置。 # beat:th_ming_open_4 # scene:th_mingtrial # cast:th_xie,th_ming # speaker:narrator
  -> ming_close
* [看谢第三剑还需多少距离，不先替明澄叫险，也不先认他必有后招。 # cid:th_watch_last_distance]
  ~ ming_distance = false
  前两剑将人逼近坪边，第三剑尚未走足，明澄反从那一段没长成的距离里进来了。你看见肩、肘与掌同到。 # beat:th_ming_open_5 # scene:th_mingtrial # cast:th_xie,th_ming # speaker:narrator
  -> ming_close

=== ming_close ===
长剑失去距离。谢几乎不犹豫弃剑，剑未落地，右手并指向喉；明澄左掌停心口，两人同时止。 # beat:th_ming_close_1 # scene:th_mingtrial # cast:th_xie,th_ming # speaker:narrator
主座上穆玄真已看清先后。 # beat:th_ming_close_2 # scene:th_mingtrial # cast:th_mu # speaker:narrator
和尚先。 # beat:th_ming_close_3 # scene:th_mingtrial # cast:th_mu # speaker:th_mu # mood:th_mu=neutral
谢低头看掌，亲口认输。明澄合掌说剑很好，他回再晚半息便不是这句，和尚笑说早半息也一样。 # beat:th_ming_close_4 # scene:th_mingtrial # cast:th_xie,th_ming # speaker:narrator
我输。刚才那三剑，我还要想。 # beat:th_ming_close_5 # scene:th_mingtrial # cast:th_xie,th_ming # speaker:th_xie # mood:th_xie=uneasy
你想。我先补一碗饭。 # beat:th_ming_close_6 # scene:th_mingtrial # cast:th_xie,th_ming # speaker:th_ming # mood:th_ming=amused
那晚谢只吃半碗。你路过侧院，他正在重走，司马承一也到了。 # beat:th_ming_close_7 # scene:th_mingtrial # cast:th_xie,th_ming # speaker:narrator
* [不拿看见他弃剑便来劝已经尽力，留他先走完，再到门口看。 # cid:th_leave_xie_room]
  ~ xie_room = true
  你退到门外。谢把你刚才站的那一处也走进去，剑到中途，自己停下来重摆。 # beat:th_ming_close_8 # scene:th_mingtrial # cast:th_xie,th_ming # speaker:narrator
  -> supper
* [问他愿不愿夜后再讲第三剑的距离，今晚先不围着一场真负判他哪句该服。 # cid:th_ask_xie_later]
  ~ xie_room = false
  等我自己走过。你想问，先别说我明明占着。 # beat:th_ming_close_9 # scene:th_mingtrial # cast:th_xie,th_ming # speaker:th_xie # mood:th_xie=sharp
  好。 # beat:th_ming_close_10 # scene:th_mingtrial # cast:th_xie,th_ming # speaker:you
  你站远些，将刚才想问的留到他肯讲的时候。 # beat:th_ming_close_11 # scene:th_mingtrial # cast:th_xie,th_ming # speaker:narrator
  -> supper

=== supper ===
夜里，谢临川在侧院重走白日那三剑。司马承一路过，站住看了一回。 # beat:th_supper_1 # scene:th_night # cast:th_xie,th_sima,th_ming # speaker:narrator
你第六十招以后太想收。 # beat:th_supper_2 # scene:th_night # cast:th_xie,th_sima,th_ming # speaker:th_sima # mood:th_sima=calm
你打过他？ # beat:th_supper_3 # scene:th_night # cast:th_xie,th_sima,th_ming # speaker:th_xie # mood:th_xie=sharp
没有。看得出来。 # beat:th_supper_4 # scene:th_night # cast:th_xie,th_sima,th_ming # speaker:th_sima # mood:th_sima=neutral
那来。 # beat:th_supper_5 # scene:th_night # cast:th_xie,th_sima,th_ming # speaker:th_xie # mood:th_xie=neutral
原说只试两手。到二十余招，院门已经围上人，谁也没先收。 # beat:th_supper_6 # scene:th_night # cast:th_xie,th_sima,th_ming # speaker:narrator
让一让，汤端不进去了。 # beat:th_supper_7 # scene:th_night # cast:th_xie,th_sima,th_ming # speaker:th_ming # mood:th_ming=amused
明澄端着碗站在门边，并没有急着喝。沈照微已蹲到墙上，冲你腾出一点位置。 # beat:th_supper_8 # scene:th_night # cast:th_xie,th_sima,th_ming # speaker:narrator
你白天追我，晚上看人追。划算。 # beat:th_supper_9 # scene:th_night # cast:th_shen,th_xie,th_sima # speaker:th_shen # mood:th_shen=amused
院中脚步越来越密，你看见一片竹叶被剑风切下来。 # beat:th_supper_10 # scene:th_night # cast:th_shen,th_xie,th_sima # speaker:narrator
* [替明澄拿住汤碗，留门口一条退路。 # cid:th_tray]
  ~ soup = true
  我端着。你站门边，剑再过来，至少别烫着人。 # beat:th_supper_11 # scene:th_night # cast:th_shen,th_xie,th_sima # speaker:you
  你这理由听着，比我想看完要像样。 # beat:th_supper_12 # scene:th_night # cast:th_ming,th_shen,th_xie # speaker:th_ming # mood:th_ming=amused
  你把汤放到背风的矮台，顺手挪开门前的小凳。 # beat:th_supper_13 # scene:th_night # cast:th_ming,th_shen,th_xie # speaker:narrator
  只是别指望他们领情。现在谁也不肯先停。 # beat:th_supper_14 # scene:th_night # cast:th_ming,th_shen,th_xie # speaker:th_ming # mood:th_ming=neutral
  -> sixty
* [留在墙边，看谢临川越来越快的剑。 # cid:th_watch]
  ~ soup = false
  刚才败的那一剑，他还在找？ # beat:th_supper_15 # scene:th_night # cast:th_ming,th_shen,th_xie # speaker:you
  你问他去。我只看今晚这一场。 # beat:th_supper_16 # scene:th_night # cast:th_ming,th_shen,th_xie # speaker:th_shen # mood:th_shen=intent
  你险些把白天听来的评语套上去，又咽了回去。 # beat:th_supper_17 # scene:th_night # cast:th_ming,th_shen,th_xie # speaker:narrator
  看不懂可以慢慢看，别急着替他们判。 # beat:th_supper_18 # scene:th_night # cast:th_ming,th_shen,th_xie # speaker:th_shen # mood:th_shen=neutral
  -> sixty

=== sixty ===
六十招，谢临川更快，司马承一更稳。屋檐下嗑瓜子的前辈终于出了声。 # beat:th_sixty_1 # scene:th_night # cast:th_xie,th_sima,th_guestelder # speaker:narrator
再打下去，想不想让我给你们记一场？ # beat:th_sixty_2 # scene:th_night # cast:th_xie,th_sima,th_guestelder # speaker:th_guestelder # mood:th_guestelder=sharp
两人同时收住，剑尖离开对方的衣襟。 # beat:th_sixty_3 # scene:th_night # cast:th_xie,th_sima,th_guestelder # speaker:narrator
明天还上场。真想在这儿分生死，我替你们找块远点的地。 # beat:th_sixty_4 # scene:th_night # cast:th_xie,th_sima,th_guestelder # speaker:th_guestelder # mood:th_guestelder=neutral
不劳您搬椅子。 # beat:th_sixty_5 # scene:th_night # cast:th_xie,th_sima,th_guestelder # speaker:th_sima # mood:th_sima=amused
没到那一步。 # beat:th_sixty_6 # scene:th_night # cast:th_xie,th_sima,th_guestelder # speaker:th_xie # mood:th_xie=uneasy
那谁赢？ # beat:th_sixty_7 # scene:th_night # cast:th_shen,th_xie,th_sima # speaker:th_shen # mood:th_shen=amused
汤凉了，谁也没赢。 # beat:th_sixty_8 # scene:th_night # cast:th_guestelder,th_shen,th_xie # speaker:th_guestelder # mood:th_guestelder=neutral
* [承认自己也想看，别把停手全推给他们。 # cid:th_no_result]
  ~ night_honest = true
  我也没叫停。刚才还嫌墙头不够高。 # beat:th_sixty_9 # scene:th_night # cast:th_guestelder,th_shen,th_xie # speaker:you
  你们倒看得开心。 # beat:th_sixty_10 # scene:th_night # cast:th_guestelder,th_shen,th_xie # speaker:th_xie # mood:th_xie=sharp
  开心。后来见竹叶下来，才想起明天还要见你们上场。 # beat:th_sixty_11 # scene:th_night # cast:th_guestelder,th_shen,th_xie # speaker:you
  谢临川将剑鞘靠上墙，接碗时碰得沿口一响。他低头喝了一口，仍盯着院里刚才站过的位置。 # beat:th_sixty_12 # scene:th_night # cast:th_guestelder,th_shen,th_xie # speaker:narrator
  -> after_night
* [笑问明日正式场能不能也留一口汤的工夫。 # cid:th_challenge]
  ~ night_honest = false
  明日打完再争，先把这碗喝了？ # beat:th_sixty_13 # scene:th_night # cast:th_guestelder,th_shen,th_xie # speaker:you
  你是怕没热闹看，还是怕碗砸了？ # beat:th_sixty_14 # scene:th_night # cast:th_sima,th_guestelder,th_shen # speaker:th_sima # mood:th_sima=amused
  碗是借的。热闹不收钱。 # beat:th_sixty_15 # scene:th_night # cast:th_sima,th_guestelder,th_shen # speaker:you
  谢临川哼了一声，还是接过碗。 # beat:th_sixty_16 # scene:th_night # cast:th_sima,th_guestelder,th_shen # speaker:narrator
  -> after_night

=== after_night ===
白日我赢了他，刚才也有点想看他在别人手里吃亏。 # beat:th_after_night_1 # scene:th_night # cast:th_ming,th_shen,th_xie # speaker:th_ming # mood:th_ming=neutral
你倒肯说。 # beat:th_after_night_2 # scene:th_night # cast:th_ming,th_shen,th_xie # speaker:th_xie # mood:th_xie=sharp
不说，你也看出来了。 # beat:th_after_night_3 # scene:th_night # cast:th_ming,th_shen,th_xie # speaker:th_ming # mood:th_ming=amused
明澄把碗里的葱拨到一边。谢伸手指他破开的袖口，和尚把那只袖子往身后一藏，又笑了。 # beat:th_after_night_4 # scene:th_night # cast:th_ming,th_shen,th_xie # speaker:narrator
{
- soup:
多谢替我守碗。下回你若想试，我也替你端。 # beat:th_after_night_5 # scene:th_night # cast:th_ming,th_shen,th_xie # speaker:th_ming # mood:th_ming=neutral
听见没有？赢明澄还太远，先赢到有人端汤。 # beat:th_after_night_6 # scene:th_night # cast:th_ming,th_shen,th_xie # speaker:th_shen # mood:th_shen=amused
- else:
墙头坐得舒服？下回换你在下头，我带汤来。 # beat:th_after_night_7 # scene:th_night # cast:th_ming,th_shen,th_xie # speaker:th_shen # mood:th_shen=neutral
至少今晚没替谁算胜场。 # beat:th_after_night_8 # scene:th_night # cast:th_ming,th_shen,th_xie # speaker:you
那就好。真要记，我自己打。 # beat:th_after_night_9 # scene:th_night # cast:th_ming,th_shen,th_xie # speaker:th_xie # mood:th_xie=neutral
}
{
- not xie_room:
你要问第三剑？先站远点。 # beat:th_after_night_10 # scene:th_night # cast:th_ming,th_shen,th_xie # speaker:th_xie # mood:th_xie=intent
他把剑停在尚未伸足的地方，用空手指给你看明澄已贴近的位置。你原想追问怎样补赢，见他还在重摆，便只按自己看见的距离问了一回。 # beat:th_after_night_11 # scene:th_night # cast:th_ming,th_shen,th_xie # speaker:narrator
我还没想好怎么接。你先让一让，我把第三剑再走一次。 # beat:th_after_night_12 # scene:th_night # cast:th_ming,th_shen,th_xie # speaker:th_xie # mood:th_xie=neutral
}
* [约沈照微轮战后再拆那半息，不约让招。 # cid:th_practice]
  ~ rematch = true
  正式的归正式。打完你若还愿意，我们再摆一遍。 # beat:th_after_night_13 # scene:th_night # cast:th_ming,th_shen,th_xie # speaker:you
  愿意。你别因为先赢一场，就怕下一场没了脸。 # beat:th_after_night_14 # scene:th_night # cast:th_ming,th_shen,th_xie # speaker:th_shen # mood:th_shen=intent
  现在就知道丢脸，比届时强。 # beat:th_after_night_15 # scene:th_night # cast:th_ming,th_shen,th_xie # speaker:you
  明日见。 # beat:th_after_night_16 # scene:th_night # cast:th_ming,th_shen,th_xie # speaker:th_shen # mood:th_shen=neutral
  -> huo_open
* [不另约私试，回去练自己的起手。 # cid:th_ownwork]
  ~ rematch = false
  我得先把今日看清的练稳。不能见谁都欠一场。 # beat:th_after_night_17 # scene:th_night # cast:th_ming,th_shen,th_xie # speaker:you
  也好。正式场上我仍找你。 # beat:th_after_night_18 # scene:th_night # cast:th_ming,th_shen,th_xie # speaker:th_shen # mood:th_shen=calm
  她跳下墙，没有因为你拒了私约而收起明日的认真。 # beat:th_after_night_19 # scene:th_night # cast:th_ming,th_shen,th_xie # speaker:narrator
  -> huo_open

=== huo_open ===
第二轮霍停云对谢临川。十招、二十，谢剑正、清、快，霍的前两剑都普通，看去一直在退。 # beat:th_huo_open_1 # scene:th_huotrial # cast:th_huo,th_xie # speaker:narrator
第三十七谢走左肩，第四十一又左，第四十八忽换右肋，霍都退。谢第一次停半息，原本紧接的一剑没有立刻出来。 # beat:th_huo_open_2 # scene:th_huotrial # cast:th_huo,th_xie # speaker:narrator
第五十三将至，你正盯着那一截空。慢，究竟是来不及，还是对方要去的位置已早被看见？ # beat:th_huo_open_3 # scene:th_huotrial # cast:th_huo,th_xie # speaker:narrator
* [并看三十七、四十一、四十八次退法，判断他是否每回都在让出同一个地方。 # cid:th_read_retreats]
  ~ huo_feet = true
  你在膝上比出三处，看似都退，肩与脚却没留在同样的线。谢再换时，霍仍有一脚能先落。 # beat:th_huo_open_4 # scene:th_huotrial # cast:th_huo,th_xie # speaker:narrator
  -> huo_fifty_three
* [先追谢下一剑原想落的位置，承认自己尚看不清霍的脚，不用一句不是快是早包住空白。 # cid:th_read_next_sword]
  ~ huo_feet = false
  你看见谢剑已起，想象下一剑应从哪里接。就在那一处，霍的剑先占住了空。 # beat:th_huo_open_5 # scene:th_huotrial # cast:th_huo,th_xie # speaker:narrator
  -> huo_fifty_three

=== huo_fifty_three ===
第五十三，霍不退。剑从很怪的位置出来，不快，甚至慢，谢的下一剑却忽然接不上。立即换，再三招又换，霍仍在那里。 # beat:th_huo_fifty_three_1 # scene:th_huotrial # cast:th_huo,th_xie # speaker:narrator
七十以后场面翻转。一百零七，谢剑真被压到外；一百二十二，他强抢中。你现在连霍的脚也看得吃力，不能因方才猜中一回就替后面每一回下断语。 # beat:th_huo_fifty_three_2 # scene:th_huotrial # cast:th_huo,th_xie # speaker:narrator
一百四十，两剑轻碰，霍忽弃剑空手进，谢退。霍却停，弯腰拾剑。谢脸色变了。 # beat:th_huo_fifty_three_3 # scene:th_huotrial # cast:th_huo,th_xie # speaker:narrator
为什么不进？ # beat:th_huo_fifty_three_4 # scene:th_huotrial # cast:th_huo,th_xie # speaker:th_xie # mood:th_xie=sharp
刚才那一步不稳。 # beat:th_huo_fifty_three_5 # scene:th_huotrial # cast:th_huo,th_xie # speaker:th_huo # mood:th_huo=intent
谢知道不是让。对方真认为那半步不能进，没为看见一个能赢的样子便抢到底。 # beat:th_huo_fifty_three_6 # scene:th_huotrial # cast:th_huo,th_xie # speaker:narrator # fact:th_53
* [看他拾剑后的落脚，不把未追写成慈悲；先问自己若在那一步会不会停。 # cid:th_read_unstable]
  ~ read_stop = true
  你想起追沈时那一口急气。若只图眼前得手，停下原来比再进难。你没拿这个感触替霍先断胜。 # beat:th_huo_fifty_three_7 # scene:th_huotrial # cast:th_huo,th_xie # speaker:narrator
  -> huo_close
* [仍看谢怎样重接，不因被人说不稳就把他后面几十招一并当成无用。 # cid:th_keep_both_swords]
  ~ read_stop = false
  谢重新站定，剑仍认真。霍没追的那一下，不等于他可以从这一场真较艺里先退出去。 # beat:th_huo_fifty_three_8 # scene:th_huotrial # cast:th_huo,th_xie # speaker:narrator
  -> huo_close

=== huo_close ===
一百七十余招，剑尖停胸，谢败。下场坐很久，明澄过来问想什么，他说第五十三，尚没想出。 # beat:th_huo_close_1 # scene:th_huotrial # cast:th_xie,th_huo,th_ming # speaker:narrator
慢慢想。 # beat:th_huo_close_2 # scene:th_huotrial # cast:th_xie,th_huo,th_ming # speaker:th_ming # mood:th_ming=amused
你幸灾乐祸？ # beat:th_huo_close_3 # scene:th_huotrial # cast:th_xie,th_huo,th_ming # speaker:th_xie # mood:th_xie=sharp
有一点。 # beat:th_huo_close_4 # scene:th_huotrial # cast:th_xie,th_huo,th_ming # speaker:th_ming # mood:th_ming=neutral
谢抬起眼。明澄仍笑着，手里捏住破袖的一头。过了一会儿，谢把剑往膝上横稳，又从第五十三招说起。 # beat:th_huo_close_5 # scene:th_huotrial # cast:th_xie,th_huo,th_ming # speaker:narrator
{
- layout_draw:
法彻那页仍在。你添上第五十三，但没将两场画作一模一样：一个等第四次左入，一个把下一剑的去处逐步占走。第一日少看的下一场，没给你补回来，这页如今有了真能对照的两场。 # beat:th_huo_close_6 # scene:th_huotrial # cast:th_xie,th_huo,th_ming # speaker:narrator
- else:
你在“第四回左门没了”下面添一行：霍没退时，谢下一剑没了。只有两句话，细处还得重问；你没有为没画便从别人纸上补出一幅亲眼看全的图。 # beat:th_huo_close_7 # scene:th_huotrial # cast:th_xie,th_huo,th_ming # speaker:narrator
}
-> round_open

=== round_open ===
三轮六十取二十四，再取十二，后来取六。你已输过一场，司马承一前面四战全胜。 # beat:th_round_open_1 # scene:th_round # cast:th_sima # speaker:narrator
轮到你对司马承一。你还记得夜里他越打越稳的样子，站进场时，背上先绷了起来。 # beat:th_round_open_2 # scene:th_round # cast:th_sima # speaker:narrator
{soup:我今日没碗在你手里，别客气。|今日不用坐墙头。过来，我也想看看你那一下。} # beat:th_round_open_3 # scene:th_round # cast:th_sima # speaker:th_sima # mood:th_sima=amused
* [不催自己抢胜，守过前几十手再找机会。 # cid:th_patience]
  ~ measured = true
  那我慢一点，不算客气。 # beat:th_round_open_4 # scene:th_round # cast:th_sima # speaker:you
  你压住追人的冲动，挨过他几次牵引；机会没有马上来，呼吸却还在自己身上。 # beat:th_round_open_5 # scene:th_round # cast:th_sima # speaker:narrator
  一百手以后，你才敢让步幅略大一点。 # beat:th_round_open_6 # scene:th_round # cast:th_sima # speaker:narrator
  -> sima_result
* [想起夜里那阵剑声，主动抢他半步。 # cid:th_force]
  ~ measured = false
  看了一夜，总得试点真东西。 # beat:th_round_open_7 # scene:th_round # cast:th_sima # speaker:you
  你抢进去，没能把他带乱。右肩的紧又浮上来，只好一寸寸收回那半步。 # beat:th_round_open_8 # scene:th_round # cast:th_sima # speaker:narrator
  你看见我稳，也别以为我不会先动。 # beat:th_round_open_9 # scene:th_round # cast:th_sima # speaker:th_sima # mood:th_sima=intent
  这一场比你想的长。 # beat:th_round_open_10 # scene:th_round # cast:th_sima # speaker:narrator
  -> sima_result

=== sima_result ===
第二百一十八手后，你终于赢过司马承一。两个人喘得都没空接夜里的玩笑。 # beat:th_sima_result_1 # scene:th_round # cast:th_sima,th_shen # speaker:narrator
这回归你。先容我喘匀，刚才你等的那一下，我还要问。 # beat:th_sima_result_2 # scene:th_round # cast:th_sima,th_shen # speaker:th_sima # mood:th_sima=calm
轮战再对沈照微，她没有沿用第一天的退路。 # beat:th_sima_result_3 # scene:th_round # cast:th_sima,th_shen # speaker:narrator
你以为我还站在原来的半息里？ # beat:th_sima_result_4 # scene:th_round # cast:th_sima,th_shen # speaker:th_shen # mood:th_shen=intent
你想守住中间，她先把你要占的那一点引开。等你觉出脚底空了，她已到你另一侧。 # beat:th_sima_result_5 # scene:th_round # cast:th_sima,th_shen # speaker:narrator
这一回，你败。 # beat:th_sima_result_6 # scene:th_round # cast:th_sima,th_shen # speaker:narrator
{
- shen_open:
胡桃和改步，你现在觉得哪样好玩？ # beat:th_sima_result_7 # scene:th_round # cast:th_sima,th_shen # speaker:th_shen # mood:th_shen=amused
胡桃至少不用我追。 # beat:th_sima_result_8 # scene:th_round # cast:th_sima,th_shen # speaker:you
下回借你一袋。今天这一步可别拿它抵。 # beat:th_sima_result_9 # scene:th_round # cast:th_sima,th_shen # speaker:th_shen # mood:th_shen=neutral
}
* [认她这次改了路，问她从哪里看出你的习惯。 # cid:th_credit_shen]
  ~ respect_shen = true
  不是我第一场赢得侥幸，也不是你这一场占便宜。你看出我下一步了。 # beat:th_sima_result_10 # scene:th_round # cast:th_sima,th_shen # speaker:you
  你肯这么问，我才能答。你守中之后，眼睛总往右外看。 # beat:th_sima_result_11 # scene:th_round # cast:th_sima,th_shen # speaker:th_shen # mood:th_shen=calm
  我以为自己藏得挺好。 # beat:th_sima_result_12 # scene:th_round # cast:th_sima,th_shen # speaker:you
  嗯，藏在眼睛里。 # beat:th_sima_result_13 # scene:th_round # cast:th_sima,th_shen # speaker:th_shen # mood:th_shen=amused
  -> after_loss
* [承认不服，先离场，留一点冷静的工夫。 # cid:th_sulk]
  ~ respect_shen = false
  我知道这回输了。现在不想立刻听自己哪里错。 # beat:th_sima_result_14 # scene:th_round # cast:th_sima,th_shen # speaker:you
  那就等你想听。别回去把我的那一下改成你自己滑倒。 # beat:th_sima_result_15 # scene:th_round # cast:th_sima,th_shen # speaker:th_shen # mood:th_shen=sharp
  你点头，把到嘴边的理由咽下去。她也没追过来替你高兴。 # beat:th_sima_result_16 # scene:th_round # cast:th_sima,th_shen # speaker:narrator
  -> after_loss

=== after_loss ===
你回到客舍，护腕放在掌心，输了那场反而比赢时更难讲。 # beat:th_after_loss_1 # scene:th_guest # cast:th_bro # speaker:narrator
你今天坐了多久？ # beat:th_after_loss_2 # scene:th_guest # cast:th_bro # speaker:th_bro # mood:th_bro=neutral
你怎么不问输赢？ # beat:th_after_loss_3 # scene:th_guest # cast:th_bro # speaker:you
别人报得响，我在这里也听得到。 # beat:th_after_loss_4 # scene:th_guest # cast:th_bro # speaker:th_bro # mood:th_bro=neutral
窗外正报霍停云一百七十一手先明澄。你听见“先”字，胸口又缩了一下。 # beat:th_after_loss_5 # scene:th_guest # cast:th_bro # speaker:narrator
{
- care:
你给我换过的那盆水，今日我自己够到了。下山不用你背。 # beat:th_after_loss_6 # scene:th_guest # cast:th_bro # speaker:th_bro # mood:th_bro=neutral
还没问你要不要背。 # beat:th_after_loss_7 # scene:th_guest # cast:th_bro # speaker:you
那就当我先赢你一句。 # beat:th_after_loss_8 # scene:th_guest # cast:th_bro # speaker:th_bro # mood:th_bro=amused
- else:
护腕用得还合适？ # beat:th_after_loss_9 # scene:th_guest # cast:th_bro # speaker:th_bro # mood:th_bro=neutral
系带有点磨。 # beat:th_after_loss_10 # scene:th_guest # cast:th_bro # speaker:you
你一直绑得太紧。它不是替你把输赢攥住的。 # beat:th_after_loss_11 # scene:th_guest # cast:th_bro # speaker:th_bro # mood:th_bro=neutral
他伸手替你把结松了一扣。 # beat:th_after_loss_12 # scene:th_guest # cast:th_bro # speaker:narrator
}
* [把输了的一场也从第一步讲给他。 # cid:th_keep_promise]
  ~ kept_promise = true
  {promise:我前一回答应讲，是还不知道自己会输得这样难受。|这回我想从头讲，自己也还没想清。} # beat:th_after_loss_13 # scene:th_guest # cast:th_bro # speaker:you
  鞋给我。先摆第一步。 # beat:th_after_loss_14 # scene:th_guest # cast:th_bro # speaker:th_bro # mood:th_bro=intent
  你把两只鞋摆到床前。这次没有跳过被引开的那一步。 # beat:th_after_loss_15 # scene:th_guest # cast:th_bro # speaker:narrator
  -> order
* [先问他的膝伤，今晚不复盘，明日留一张图。 # cid:th_tomorrow]
  ~ kept_promise = false
  今晚说不清。我画在纸上，明日你挑错。 # beat:th_after_loss_16 # scene:th_guest # cast:th_bro # speaker:you
  可以。但别把纸留在枕下，自己走了。 # beat:th_after_loss_17 # scene:th_guest # cast:th_bro # speaker:th_bro # mood:th_bro=intent
  你从行囊取出纸，压到最上面，没有说一句很远的保证。 # beat:th_after_loss_18 # scene:th_guest # cast:th_bro # speaker:narrator
  -> order

=== order ===
青序最后列出六人：霍停云、明澄、谢临川、司马承一、陆青珩、沈照微。 # beat:th_order_1 # scene:th_youngorder # cast:th_shen,th_ming,th_huo # speaker:narrator
你赢我一场，我赢你一场。册子还让你在前。 # beat:th_order_2 # scene:th_youngorder # cast:th_shen,th_ming,th_huo # speaker:th_shen # mood:th_shen=sharp
你不是要找写册的人算账吧？ # beat:th_order_3 # scene:th_youngorder # cast:th_shen,th_ming,th_huo # speaker:you
找你。三年，先记着。 # beat:th_order_4 # scene:th_youngorder # cast:th_shen,th_ming,th_huo # speaker:th_shen # mood:th_shen=amused
记得饭也约上。再端汤，我想要一碗热的。 # beat:th_order_5 # scene:th_youngorder # cast:th_shen,th_ming,th_huo # speaker:th_ming # mood:th_ming=neutral
门分不是这六人的排法：昆仑十八，少林十七。你若只数眼前几个人，便把别的场都抹去了。 # beat:th_order_6 # scene:th_youngorder # cast:th_shen,th_ming,th_huo # speaker:narrator # fact:th_order
* [问霍停云：你想赢到哪里才算够？ # cid:th_ask_huo]
  ~ huo_question = true
  青序第一拿到了，你会松口气么？ # beat:th_order_7 # scene:th_youngorder # cast:th_shen,th_ming,th_huo # speaker:you
  会。也还想看正序。 # beat:th_order_8 # scene:th_youngorder # cast:th_shen,th_ming,th_huo # speaker:th_huo # mood:th_huo=uneasy
  看完更想打？ # beat:th_order_9 # scene:th_youngorder # cast:th_shen,th_ming,th_huo # speaker:you
  看完再说。我如今说的，多半不准。 # beat:th_order_10 # scene:th_youngorder # cast:th_shen,th_ming,th_huo # speaker:th_huo # mood:th_huo=neutral
  -> old_watch
* [问明澄：只差一个先字，会不会不甘心？ # cid:th_ask_ming]
  ~ huo_question = false
  你刚才还笑，现在呢？ # beat:th_order_11 # scene:th_youngorder # cast:th_shen,th_ming,th_huo # speaker:you
  不甘心。笑又不耽误不甘心。 # beat:th_order_12 # scene:th_youngorder # cast:th_shen,th_ming,th_huo # speaker:th_ming # mood:th_ming=calm
  他把空碗放稳，指了指正序那边。 # beat:th_order_13 # scene:th_youngorder # cast:th_shen,th_ming,th_huo # speaker:narrator
  先看。那边有些人，连不甘心都比我们练得久。 # beat:th_order_14 # scene:th_youngorder # cast:th_shen,th_ming,th_huo # speaker:th_ming # mood:th_ming=neutral
  -> old_watch

=== old_watch ===
青序结束的次晨，正序还未叫名。你到客舍门口，师兄已将鞋挪在床前。 # beat:th_old_watch_1 # scene:th_guest # cast:th_bro # speaker:narrator
{
- not kept_promise:
昨晚答应今晨交的图还没画完。你坐到床沿，先画沈引开中路、自己脚底落空的位置，再请师兄挪鞋来对。外头报正序入席，你把没标清的那只脚补上，才将纸交给他。 # beat:th_old_watch_2 # scene:th_guest # cast:th_bro # speaker:narrator
这里同你刚才讲的不一样。 # beat:th_old_watch_3 # scene:th_guest # cast:th_bro # speaker:th_bro # mood:th_bro=intent
是。我把想走的画成已经走到了，改这里。 # beat:th_old_watch_4 # scene:th_guest # cast:th_bro # speaker:you
出门时同门已排到前头。你赶去入席，没有再找人讲路上没看见的热闹。 # beat:th_old_watch_5 # scene:th_guest # cast:th_bro # speaker:narrator
}
青序热闹过，次日正序。前十招你尚懂，二十以后得想，三十以后有人忽然同停，你也不知道为何。 # beat:th_old_watch_6 # scene:th_oldfirst # cast:th_shen,th_xie,th_ming # speaker:narrator
看懂多少？ # beat:th_old_watch_7 # scene:th_oldfirst # cast:th_shen,th_xie,th_ming # speaker:th_shen # mood:th_shen=uneasy
一点。 # beat:th_old_watch_8 # scene:th_oldfirst # cast:th_shen,th_xie,th_ming # speaker:you
我也一点。 # beat:th_old_watch_9 # scene:th_oldfirst # cast:th_shen,th_xie,th_ming # speaker:th_xie # mood:th_xie=neutral
比你们，多一点点。 # beat:th_old_watch_10 # scene:th_oldfirst # cast:th_shen,th_xie,th_ming # speaker:th_ming # mood:th_ming=amused
你们昨天才争过前六，今日仍须坐在同一排承认看不清。二十八正序，可靠坐实入化只有慧觉八十九、季闻鹤八十六、陆栖真九十二；活老了，不会自动送一个境界。 # beat:th_old_watch_11 # scene:th_oldfirst # cast:th_shen,th_xie,th_ming # speaker:narrator
* [将看不明的三处各记下来，不因只懂一点就把余下全写成深不可测。 # cid:th_name_unknown]
  ~ old_unknown = true
  你记手停何处、脚是否已落、距离剩多少，有两格仍空。谢挪来一点，看下一场会不会又在同一处漏。 # beat:th_old_watch_12 # scene:th_oldfirst # cast:th_shen,th_xie,th_ming # speaker:narrator
  -> ji_hui
* [只请明澄说他多看懂的那一点，不叫他替自己先讲完所有正序。 # cid:th_ask_ming_one]
  ~ old_unknown = false
  我认得少林一段起手。后面为什么停，也还没看清。 # beat:th_old_watch_13 # scene:th_oldfirst # cast:th_shen,th_xie,th_ming # speaker:th_ming # mood:th_ming=intent
  那先从起手看。 # beat:th_old_watch_14 # scene:th_oldfirst # cast:th_shen,th_xie,th_ming # speaker:you
  明澄把拇指搭在膝上，比出自己认得的起手；到后来一停，拇指也停了。你在那一格旁点了个空圈。 # beat:th_old_watch_15 # scene:th_oldfirst # cast:th_shen,th_xie,th_ming # speaker:narrator
  -> ji_hui

=== ji_hui ===
季闻鹤持剑，慧觉空手。第三剑以后，前剑停处便生后剑，起收不再像你平日分得那么开。慧觉少主动攻，剑若走尽，却总到他手能到之处。 # beat:th_ji_hui_1 # scene:th_jihui # cast:th_ji,th_huijue # speaker:narrator
第五十一，剑临胸，你以为中了；慧觉后移半寸，两指在剑脊，剑便偏了。谢坐旁边，额头汗出得像自己也在场。 # beat:th_ji_hui_2 # scene:th_jihui # cast:th_ji,th_huijue # speaker:narrator
还是进不去。 # beat:th_ji_hui_3 # scene:th_jihui # cast:th_ji,th_huijue # speaker:th_ji # mood:th_ji=intent
一百零三，两人同时停。 # beat:th_ji_hui_4 # scene:th_jihui # cast:th_ji,th_huijue # speaker:narrator
比九年前深。 # beat:th_ji_hui_5 # scene:th_jihui # cast:th_ji,th_huijue # speaker:th_huijue # mood:th_huijue=neutral
九年前我尚未入化。 # beat:th_ji_hui_6 # scene:th_jihui # cast:th_ji,th_huijue # speaker:th_ji # mood:th_ji=neutral
所以才说深。 # beat:th_ji_hui_7 # scene:th_jihui # cast:th_ji,th_huijue # speaker:th_huijue # mood:th_huijue=amused
最终记平，不把旁观者猜的半线另写成胜负。 # beat:th_ji_hui_8 # scene:th_jihui # cast:th_ji,th_huijue # speaker:narrator
* [记剑真到与身体后移的先后，先不把半寸当作只需背熟的量。 # cid:th_draw_half_distance]
  ~ half_distance = true
  纸上少画一条，留慧觉如何知道该退的那一格。谢看了一眼，说自己正卡在那里。 # beat:th_ji_hui_9 # scene:th_jihui # cast:th_ji,th_huijue # speaker:narrator
  -> zhang_lu
* [向谢承认眼睛看见剑偏，仍不知道那两指如何到了剑脊。 # cid:th_admit_eye_only]
  ~ half_distance = false
  我看见了，也没懂。 # beat:th_ji_hui_10 # scene:th_jihui # cast:th_xie,th_ji,th_huijue # speaker:th_xie # mood:th_xie=uneasy
  那先别互相装会。 # beat:th_ji_hui_11 # scene:th_jihui # cast:th_xie,th_ji,th_huijue # speaker:you
  谢的目光仍追着慧觉收回的手。你们都没添下一句，纸上那两指旁边，墨迹已经干了。 # beat:th_ji_hui_12 # scene:th_jihui # cast:th_xie,th_ji,th_huijue # speaker:narrator
  -> zhang_lu

=== zhang_lu ===
张玄岳八十二，门前极深；陆栖真九十二，八十六入化。前十、二十，张都好，三十还有人低说真能打。 # beat:th_zhang_lu_1 # scene:th_old # cast:th_zhang,th_luqi # speaker:narrator
四十七，陆第一次拍剑侧。剑势未散，下一剑照出；再拍，第三、第四、第五次，下一剑都还在，却越来越不像原先准备的那一剑。 # beat:th_zhang_lu_2 # scene:th_old # cast:th_zhang,th_luqi # speaker:narrator
第六十四，张自己停，说够了。没有剑落与人倒，你尚看不清他已失去哪些去处。 # beat:th_zhang_lu_3 # scene:th_old # cast:th_zhang,th_luqi # speaker:narrator
到这里。 # beat:th_zhang_lu_4 # scene:th_old # cast:th_zhang,th_luqi # speaker:th_zhang # mood:th_zhang=intent
承让。 # beat:th_zhang_lu_5 # scene:th_old # cast:th_zhang,th_luqi # speaker:th_luqi # mood:th_luqi=neutral
两人收剑，场下那句快入化，原来已说九年。张回头问今日还快么，老人答仍快，他笑，那就再九年。老人这回没笑，只说好。 # beat:th_zhang_lu_6 # scene:th_old # cast:th_zhang,th_luqi # speaker:narrator
* [等行礼后请张指自己还想走的方向，承认不懂，不求把门槛一句讲完。 # cid:th_ask_stop]
  ~ ask_limit = true
  晚辈以为还能进这一处，可以问么？ # beat:th_zhang_lu_7 # scene:th_old # cast:th_zhang,th_luqi # speaker:you
  你先走给我看。 # beat:th_zhang_lu_8 # scene:th_old # cast:th_zhang,th_luqi # speaker:th_zhang # mood:th_zhang=neutral
  你比三处，他都不许只用手指。站到真能落脚的地方，才发现自己刚才随口说的那一处，还缺一个回身。 # beat:th_zhang_lu_9 # scene:th_old # cast:th_zhang,th_luqi # speaker:narrator
  先记这里。看不见，不用添神秘。 # beat:th_zhang_lu_10 # scene:th_old # cast:th_zhang,th_luqi # speaker:th_zhang # mood:th_zhang=neutral
  -> chestnut
* [不挤到长辈身前，先画看不清的脚位，留空，不以想象补一条最后的路。 # cid:th_note_stop]
  ~ ask_limit = false
  季闻鹤路过，叫空着也好，下回未必同一条线。你本想立刻照他的话又添一句，想了想，仍留那一格白。 # beat:th_zhang_lu_11 # scene:th_old # cast:th_zhang,th_luqi # speaker:narrator
  看见拍剑，不等于知道每一剑如何变了。 # beat:th_zhang_lu_12 # scene:th_old # cast:th_zhang,th_luqi # speaker:you
  -> chestnut

=== chestnut ===
腿又不舒服？ # beat:th_chestnut_1 # scene:th_old # cast:th_murong,th_chensima # speaker:th_chensima # mood:th_chensima=neutral
不许把刚才那一场往腿上算。 # beat:th_chestnut_2 # scene:th_old # cast:th_murong,th_chensima # speaker:th_murong # mood:th_murong=sharp
一百四十九招，司马沉岳胜。现在两人坐得很近，栗糕只剩一块。 # beat:th_chestnut_3 # scene:th_old # cast:th_murong,th_chensima # speaker:narrator
我还没说。 # beat:th_chestnut_4 # scene:th_old # cast:th_murong,th_chensima # speaker:th_chensima # mood:th_chensima=amused
你一张嘴，我就知道你要说什么。 # beat:th_chestnut_5 # scene:th_old # cast:th_murong,th_chensima # speaker:th_murong # mood:th_murong=neutral
慕容怀真把那块糕掰开，较大的半块塞到对方手里。你忽然不想拿“胜者让着败者”解释这一下。 # beat:th_chestnut_6 # scene:th_old # cast:th_murong,th_chensima # speaker:narrator
* [只问糕还有没有，不替任何人解释旧伤。 # cid:th_plain]
  ~ plain = true
  两位前辈，弟子只问一件：后厨还有糕么？ # beat:th_chestnut_7 # scene:th_old # cast:th_murong,th_chensima # speaker:you
  有。你若说来看剑，其实来问糕，倒很诚实。 # beat:th_chestnut_8 # scene:th_old # cast:th_murong,th_chensima # speaker:th_murong # mood:th_murong=amused
  拿两块，别又替我们掰。 # beat:th_chestnut_9 # scene:th_old # cast:th_murong,th_chensima # speaker:th_chensima # mood:th_chensima=neutral
  你记住后厨的方向，也记住别人的伤不一定等着你的宽解。 # beat:th_chestnut_10 # scene:th_old # cast:th_murong,th_chensima # speaker:narrator
  -> old_final
* [把青序和正序的败场并排记，不写旧伤借口。 # cid:th_compare]
  ~ plain = false
  我也输了给沈照微。她换了路，不是我忽然变成另一个人。 # beat:th_chestnut_11 # scene:th_old # cast:th_murong,th_chensima # speaker:you
  那就写她换了路。写别人，也照这样。 # beat:th_chestnut_12 # scene:th_old # cast:th_murong,th_chensima # speaker:th_murong # mood:th_murong=neutral
  你把纸上一个“或因腿伤”划掉，保留第一百四十九招。 # beat:th_chestnut_13 # scene:th_old # cast:th_murong,th_chensima # speaker:narrator
  -> old_final

=== old_final ===
正序六席轮战后，决定首席只剩季与陆。慧觉同陆一百四十余平，季同慧觉一百零三平，都不因最后谁第一便改记成输。 # beat:th_old_final_1 # scene:th_oldfinal # cast:th_ji,th_luqi # speaker:narrator
午后云散，季前三十剑峻直高，四十后华山痕迹渐淡。第六十三，剑到陆左肩，手从剑下穿，季收：若不收，自己的剑也许能伤，陆手却先入胸。 # beat:th_old_final_2 # scene:th_oldfinal # cast:th_ji,th_luqi # speaker:narrator
又一回，两人整整四息不动。第五息陆退、季出，你才发觉静候中也早有彼此不能随便去的路。 # beat:th_old_final_3 # scene:th_oldfinal # cast:th_ji,th_luqi # speaker:narrator
* [将四息也记入这一场，不把没挥剑的一段当作两人都在歇。 # cid:th_keep_four_breaths]
  ~ four_breaths = true
  你原来数的全是看得见的出手，这四息让纸上的空处也有了必须问的缘由。 # beat:th_old_final_4 # scene:th_oldfinal # cast:th_ji,th_luqi # speaker:narrator
  -> left_thirteen
* [试着判断自己若站季的位置还能往哪里，承认未动也会被对方的去处约住。 # cid:th_watch_can_move]
  ~ four_breaths = false
  你刚想到一处，场中第五息已过去。不能把自己慢想四息的一点，算成真能同他们换下一剑。 # beat:th_old_final_5 # scene:th_oldfinal # cast:th_ji,th_luqi # speaker:narrator
  -> left_thirteen

=== left_thirteen ===
第一百三十二，季换左手。十一年未见的剑，一连十三剑展开，到第十四，陆已近坪边。 # beat:th_left_thirteen_1 # scene:th_oldfinal # cast:th_ji,th_luqi # speaker:narrator
陆忽迎前，两人都没先收。最后一刻同时换，季剑滑开，陆手穿剑柄边，一掌轻停肩头；剑停陆腰外。 # beat:th_left_thirteen_2 # scene:th_oldfinal # cast:th_ji,th_luqi # speaker:narrator
你先。 # beat:th_left_thirteen_3 # scene:th_oldfinal # cast:th_ji,th_luqi # speaker:th_ji # mood:th_ji=intent
季自己收，陆行礼。报席声从坪边传来，昆仑青正双首。谢在膝上握紧手指，直到季走回席前，才让出身边的位置。 # beat:th_left_thirteen_4 # scene:th_oldfinal # cast:th_ji,th_luqi # speaker:narrator
* [将季亲口认先记下，别以两人俱能伤为由擅改平。 # cid:th_keep_true_stop]
  ~ old_stop_plain = true
  谢看着长辈收剑，没为盼他首席便先替那一掌说轻。你也没有替谢解释他此刻该怎样自豪。 # beat:th_left_thirteen_5 # scene:th_oldfinal # cast:th_ji,th_luqi # speaker:narrator
  -> six_open
* [看行礼后的两人还在指哪一处，记住正式胜负之外，他们也还会继续问。 # cid:th_watch_after_bow]
  ~ old_stop_plain = false
  季指左手那一路，陆点头。两人仍有不同意见，认输没有叫后一段疑问一同止住。 # beat:th_left_thirteen_6 # scene:th_oldfinal # cast:th_ji,th_luqi # speaker:narrator
  -> six_open

=== six_open ===
正序最后陆栖真居首，季闻鹤、慧觉、张玄岳、法舟、司马沉岳依次列后。 # beat:th_six_open_1 # scene:th_old # cast:th_huo,th_zhang # speaker:narrator
临散前，霍停云走到张玄岳面前，问一场手。他不是要把青序第一换进正序，只想亲自知道。 # beat:th_six_open_2 # scene:th_old # cast:th_huo,th_zhang # speaker:narrator
请前辈十手。 # beat:th_six_open_3 # scene:th_old # cast:th_huo,th_zhang # speaker:th_huo # mood:th_huo=intent
第一手你还能跟上。第四手，霍的剑忽然像离自己远了半步；第六手，他停。 # beat:th_six_open_4 # scene:th_old # cast:th_huo,th_zhang # speaker:narrator
第四手已经没有原先那条路。 # beat:th_six_open_5 # scene:th_old # cast:th_huo,th_zhang # speaker:th_zhang # mood:th_zhang=neutral
弟子到了第六手才知道。 # beat:th_six_open_6 # scene:th_old # cast:th_huo,th_zhang # speaker:th_huo # mood:th_huo=uneasy
霍没有把剑再抬起来。你听见半寸，却说不出是哪一个半寸。 # beat:th_six_open_7 # scene:th_old # cast:th_huo,th_zhang # speaker:narrator # fact:th_six
* [承认自己更早便看不懂，请霍说第一手在找什么。 # cid:th_public_question]
  ~ open_question = true
  你第四手失路。我第一手就在追剑尖，能先从那里问么？ # beat:th_six_open_8 # scene:th_old # cast:th_huo,th_zhang # speaker:you
  我想先把他带到右边。他没过去。 # beat:th_six_open_9 # scene:th_old # cast:th_huo,th_zhang # speaker:th_huo # mood:th_huo=calm
  我当时以为他退了。 # beat:th_six_open_10 # scene:th_old # cast:th_huo,th_zhang # speaker:you
  我当时也这样以为。 # beat:th_six_open_11 # scene:th_old # cast:th_huo,th_zhang # speaker:th_huo # mood:th_huo=neutral
  这句话让问题落到一只脚上，却没有让你忽然懂完那六手。 # beat:th_six_open_12 # scene:th_old # cast:th_huo,th_zhang # speaker:narrator
  -> mu_front
* [不围住霍追问，把疑问留给自己和同门。 # cid:th_private_question]
  ~ open_question = false
  我先记着。不把刚听见的“半寸”当成已经会了。 # beat:th_six_open_13 # scene:th_old # cast:th_huo,th_zhang # speaker:you
  我也要记。 # beat:th_six_open_14 # scene:th_old # cast:th_huo,th_zhang # speaker:th_huo # mood:th_huo=calm
  他蹲下，把场边一块被踩歪的小石放回。你留给他的安静，比再一句佩服具体。 # beat:th_six_open_15 # scene:th_old # cast:th_huo,th_zhang # speaker:narrator
  -> mu_front

=== mu_front ===
闭会前，季与陆坐石栏谈左手第十一剑，争若多进半寸能否换。谈不拢，又起身复走，不记胜负。 # beat:th_mu_front_1 # scene:th_mufront # cast:th_ji,th_luqi # speaker:narrator
季站原位左手持剑，陆也站原位。才到第十一的位置，上座传来不用。穆玄真走下，伸手要剑。 # beat:th_mu_front_2 # scene:th_mufront # cast:th_ji,th_luqi # speaker:narrator
哪里不用？ # beat:th_mu_front_3 # scene:th_mufront # cast:th_ji,th_luqi # speaker:th_ji # mood:th_ji=neutral
穆接剑，却不站陆那边，站季原来的位置。第一步一样，第二步一样，走到刚才那一点，忽然少半寸。 # beat:th_mu_front_4 # scene:th_mufront # cast:th_ji,th_luqi # speaker:narrator
不是多半寸。是前面多了半寸。 # beat:th_mu_front_5 # scene:th_mufront # cast:th_mu,th_ji,th_luqi # speaker:th_mu # mood:th_mu=intent
剑递回，穆转身回上座。没有击退人，没借这一剑再改一张正式序。 # beat:th_mu_front_6 # scene:th_mufront # cast:th_mu,th_ji,th_luqi # speaker:narrator
季持剑久站，陆终于笑说原来是这里。你刚看霍六手停，以为已见够高的墙，眼前两位入化之人也仍有一剑要重新认。 # beat:th_mu_front_7 # scene:th_mufront # cast:th_ji,th_luqi # speaker:narrator # fact:th_mu_front
* [将自己仍看不清的早一步摆给张问，不急求穆的那一剑，肯只从自己的回身走起。 # cid:th_show_front_page]
  ~ front_page = true
  张看你那张{ask_limit:还缺回身的图|留空的脚位图}，问散席后能否留一炷香。不是学宗主一剑，是将你自己画错的这一脚真放下。 # beat:th_mu_front_8 # scene:th_mufront # cast:none # speaker:narrator
  只这一处。想听全，今日没有。 # beat:th_mu_front_9 # scene:th_mufront # cast:th_zhang # speaker:th_zhang # mood:th_zhang=intent
  这一处也好。 # beat:th_mu_front_10 # scene:th_mufront # cast:th_zhang # speaker:you
  -> mu_question
* [把穆改的地方先留白，不挤入季、陆的复手；带着自己的前三十招问题找同辈。 # cid:th_keep_mu_blank]
  ~ front_page = false
  张还有要收完的事，你没来约，他也没凭你看得认真便替你另留一场。谢在另一侧摆第五十三招，你到他身旁，等他自己开口。 # beat:th_mu_front_11 # scene:th_mufront # cast:th_zhang # speaker:narrator
  -> mu_question

=== mu_question ===
最后一夜不大宴，六家后院一顿饭。谢端碗向霍讲第五十三，讲半天，霍说不对，沈笑得最开心。 # beat:th_mu_question_1 # scene:th_lastmeal # cast:th_xie,th_huo,th_shen # speaker:narrator
我还没讲完。 # beat:th_mu_question_2 # scene:th_lastmeal # cast:th_xie,th_huo,th_shen # speaker:th_xie # mood:th_xie=sharp
前面就不对。 # beat:th_mu_question_3 # scene:th_lastmeal # cast:th_xie,th_huo,th_shen # speaker:th_huo # mood:th_huo=neutral
你先让他重讲，饭还没吃完。 # beat:th_mu_question_4 # scene:th_lastmeal # cast:th_xie,th_huo,th_shen # speaker:th_shen # mood:th_shen=amused
司马来问三年后再打，抽不到便私下。你问太极不许私斗？他反问武当会告状？你们笑，明澄端汤过来说叫上自己。 # beat:th_mu_question_5 # scene:th_lastmeal # cast:th_xie,th_huo,th_shen # speaker:narrator
{
- front_page:
张留一炷香的话尚在。复手、问前辈与陪师兄下山，都要用同一个半日；没有哪场因为你全想去便肯再多留一次。 # beat:th_mu_question_6 # scene:th_lastmeal # cast:th_xie,th_huo,th_shen # speaker:narrator
- else:
你没向张约短问，散席后他已有别的安排。错过的指点不影响青序第五，只少了一回能当面放下那只脚的机会。 # beat:th_mu_question_7 # scene:th_lastmeal # cast:th_xie,th_huo,th_shen # speaker:narrator
}
* [向谢问他哪里以为已明白，肯听霍先拆掉开头，不拿自己也旁观过便替他说懂。 # cid:th_tell_meal_question]
  ~ meal_question = true
  我以为他第五十三才开始。现在还得从前头想。 # beat:th_mu_question_8 # scene:th_lastmeal # cast:th_xie,th_huo,th_shen # speaker:th_xie # mood:th_xie=uneasy
  你把自己看过的三次退放旁边，先不替霍画最后那一步。 # beat:th_mu_question_9 # scene:th_lastmeal # cast:th_xie,th_huo,th_shen # speaker:narrator
  -> after_six
* [先陪众人把饭吃完，记自己那页要回去问；不因能听一句高人评语便夺过别人的碗。 # cid:th_leave_meal_joke]
  ~ meal_question = false
  沈问霍三年后来不来，他说师父尚没说。她将一碟菜推过去，说那先多吃一口，下回别拿不认得当借口。霍低头夹了菜，一桌人笑。 # beat:th_mu_question_10 # scene:th_lastmeal # cast:th_xie,th_huo,th_shen # speaker:narrator
  -> after_six

=== after_six ===
封岭十七日将尽，客舍门口全是绳结、箱子和没吃完的干粮。你从人堆里听见有人争下回谁先请饭。 # beat:th_after_six_1 # scene:th_steps # cast:th_shen,th_ming,th_sima # speaker:narrator
三年后，别又说没准备。 # beat:th_after_six_2 # scene:th_steps # cast:th_shen,th_ming,th_sima # speaker:th_sima # mood:th_sima=amused
是跟我说，还是跟青珩说？ # beat:th_after_six_3 # scene:th_steps # cast:th_shen,th_ming,th_sima # speaker:th_shen # mood:th_shen=sharp
先说饭。我不想三年后还端着凉汤。 # beat:th_after_six_4 # scene:th_steps # cast:th_shen,th_ming,th_sima # speaker:th_ming # mood:th_ming=neutral
你手里的纸有第一场脚位，也有正序看不懂的空白。师兄的行李尚在屋内，你自己的路也还没定。 # beat:th_after_six_5 # scene:th_steps # cast:th_shen,th_ming,th_sima # speaker:narrator
{
- rematch:
你约的复手，我记得。回山前先说来不来，不占你的正式序次。 # beat:th_after_six_6 # scene:th_steps # cast:th_shen,th_ming,th_sima # speaker:th_shen # mood:th_shen=neutral
{respect_shen:也不拿第五第六堵你。|上回说暂时不想听，不等于把先前的约算没了。} # beat:th_after_six_7 # scene:th_steps # cast:th_shen,th_ming,th_sima # speaker:you
{respect_shen:堵不住。你已经试过。|那就当面说。我今日也有自己要找的人。} # beat:th_after_six_8 # scene:th_steps # cast:th_shen,th_ming,th_sima # speaker:th_shen # mood:th_shen=intent
- else:
你没欠我一场私打。正式的账，三年后再说。 # beat:th_after_six_9 # scene:th_steps # cast:th_shen,th_ming,th_sima # speaker:th_shen # mood:th_shen=neutral
那我也别欠一封没地址的信。写哪里？ # beat:th_after_six_10 # scene:th_steps # cast:th_shen,th_ming,th_sima # speaker:you
她接过纸，在留白的边上写下能收到信的地方。 # beat:th_after_six_11 # scene:th_steps # cast:th_shen,th_ming,th_sima # speaker:narrator
}
{
- huo_question:
回山以后，你第一场的起手，画一页寄我。 # beat:th_after_six_12 # scene:th_steps # cast:th_huo,th_shen,th_ming # speaker:th_huo # mood:th_huo=intent
我追着沈照微跑那一场？你看过了。 # beat:th_after_six_13 # scene:th_steps # cast:th_huo,th_shen,th_ming # speaker:you
有一面没看见。一页，多了先不看。 # beat:th_after_six_14 # scene:th_steps # cast:th_huo,th_shen,th_ming # speaker:th_huo # mood:th_huo=neutral
他把自己起手的两步画在纸背，画到第二步停了很久，才把能收信的门人名字写上。 # beat:th_after_six_15 # scene:th_steps # cast:th_huo,th_shen,th_ming # speaker:narrator
- else:
你问我甘不甘，我还是不甘。回去前再找霍试半晌，不记青序。 # beat:th_after_six_16 # scene:th_steps # cast:th_huo,th_shen,th_ming # speaker:th_ming # mood:th_ming=intent
还打一百七十一手？ # beat:th_after_six_17 # scene:th_steps # cast:th_huo,th_shen,th_ming # speaker:you
不数。数到一百，我又只顾着想能不能撑过上一回了。 # beat:th_after_six_18 # scene:th_steps # cast:th_huo,th_shen,th_ming # speaker:th_ming # mood:th_ming=amused
}
* [留下半日，与同辈复手，再陪受伤师兄下山。 # cid:th_together]
  ~ future = 1
  今日不抢早路。我还有半日，够把两件答应的事做完。 # beat:th_after_six_19 # scene:th_steps # cast:th_huo,th_shen,th_ming # speaker:you
  那我把汤先放下，省得又没人端。 # beat:th_after_six_20 # scene:th_steps # cast:th_huo,th_shen,th_ming # speaker:th_ming # mood:th_ming=amused
  我来。你们先把昨日那一下摆出来。 # beat:th_after_six_21 # scene:th_steps # cast:th_sima,th_huo,th_shen # speaker:th_sima # mood:th_sima=neutral
  -> last_pack
* [先陪师兄回山，把不懂的留作自己的课业，并写明回信之期。 # cid:th_letter]
  ~ future = 2
  这次不留下。我想先练清自己看见的，也该把师兄带回去。 # beat:th_after_six_22 # scene:th_steps # cast:th_sima,th_huo,th_shen # speaker:you
  {rematch:那今晨这一次取消，我另找人。改约也写清，别把先约过的略掉。|不来就写不来。别等三年才让人猜。} # beat:th_after_six_23 # scene:th_steps # cast:th_sima,th_huo,th_shen # speaker:th_shen # mood:th_shen=calm
  回山一个月内写第一封。没练明白，也写没明白。 # beat:th_after_six_24 # scene:th_steps # cast:th_sima,th_huo,th_shen # speaker:you
  -> last_pack
* {front_page} [将半日留给张玄岳的一炷香指点，请同门先整理行李，午后仍同师兄下山。 # cid:th_guidance]
  ~ future = 3
  同辈这一回我不在。问前辈也只问眼前这一脚，不求替我补完穆宗主的剑。 # beat:th_after_six_25 # scene:th_steps # cast:th_sima,th_huo,th_shen # speaker:you
  好。三年后另约，我可不因你听过前辈就少问一场。 # beat:th_after_six_26 # scene:th_steps # cast:th_sima,th_huo,th_shen # speaker:th_sima # mood:th_sima=intent
  你把时辰与地点写在纸上。半日只有一回，错过的复手不再另算自己也到过。 # beat:th_after_six_27 # scene:th_steps # cast:th_sima,th_huo,th_shen # speaker:narrator
  {rematch:你当面将原约改去问张。沈没说无妨，只答自己先走；那半息今天不拆了，你得在信里把改约也说清。|你没另约成沈这一回，也不拿一句同辈再见替她许下今天会等。} # beat:th_after_six_28 # scene:th_steps # cast:th_sima,th_huo,th_shen # speaker:narrator
  -> last_pack

=== last_pack ===
回客舍之前，你先把今日去处与答应的人交代清。 # beat:th_last_pack_1 # scene:th_steps # cast:none # speaker:narrator
{
- front_page and future != 3:
前辈留的一炷香，我今日不来了。{future == 1:改去同辈那里复手。|先陪师兄回山。} # beat:th_last_pack_2 # scene:th_steps # cast:th_zhang # speaker:you
知道了。我照自己的时辰走。 # beat:th_last_pack_3 # scene:th_steps # cast:th_zhang # speaker:th_zhang # mood:th_zhang=calm
张收好那页排过时辰的纸，没有把这一回说成往后随时可补。 # beat:th_last_pack_4 # scene:th_steps # cast:th_zhang # speaker:narrator
}
你推开屋门，师兄已把衣物扎好，护腕压在最上头。同门答应在第一处宽石阶接箱；师兄只提药包，伤膝不替你接重的。 # beat:th_last_pack_5 # scene:th_guest # cast:th_bro # speaker:narrator
还我？还是再借一程？ # beat:th_last_pack_6 # scene:th_guest # cast:th_bro # speaker:th_bro # mood:th_bro=neutral
{
- kept_promise:
先还。{promise:答应讲的讲了。|输了那场，我也从头讲过了。}一起回去的事，还得把行李交清。 # beat:th_last_pack_7 # scene:th_guest # cast:th_bro # speaker:you
谁答应让你背了？你先把门槛边的箱子抬开。 # beat:th_last_pack_8 # scene:th_guest # cast:th_bro # speaker:th_bro # mood:th_bro=amused
- else:
先还。那张补过的图收好，回去再把改的那一脚真走给你看。 # beat:th_last_pack_9 # scene:th_guest # cast:th_bro # speaker:you
纸我收着。先把今日的行李交清。 # beat:th_last_pack_10 # scene:th_guest # cast:th_bro # speaker:th_bro # mood:th_bro=calm
}
{
- strain and not measured:
你抬箱时右肩一紧，只好放下换手。早两场的急，没因为说了几句明白话便消失。 # beat:th_last_pack_11 # scene:th_guest # cast:th_bro # speaker:narrator
你拿轻的。我腿伤，不是连眼也坏了。 # beat:th_last_pack_12 # scene:th_guest # cast:th_bro # speaker:th_bro # mood:th_bro=sharp
- else:
箱底离开地面，你先试了试肩背才站直。师兄把自己的药包拎起，没有把所有重量都交给你。 # beat:th_last_pack_13 # scene:th_guest # cast:th_bro # speaker:narrator
}
* [{strain and not measured:右肩已经发紧，仍接重箱抬到第一处交接再换人。|先接重箱到第一处交接，只把药包留给师兄。} # cid:th_carry]
  ~ carried = true
  我先到宽石阶。同门在那里接，不让你拿伤腿替我换。 # beat:th_last_pack_14 # scene:th_guest # cast:th_bro # speaker:you
  累了就原地放，别非要撑到他说好的地方。 # beat:th_last_pack_15 # scene:th_guest # cast:th_bro # speaker:th_bro # mood:th_bro=calm
  你把箱带松了一格。{strain and not measured:右肩仍紧，这一段也得用它承重。|箱子提起，肩背暂时还能稳住。} # beat:th_last_pack_16 # scene:th_guest # cast:th_bro # speaker:narrator
  -> ending
* [叫来同门轮换抬箱，自己先去认石阶。 # cid:th_share_load]
  ~ carried = false
  让同门从屋门就接。我去认石阶，不等走到宽处才换。 # beat:th_last_pack_17 # scene:th_guest # cast:th_bro # speaker:you
  我先跨门槛，你别只顾看石阶，把门替我关了。 # beat:th_last_pack_18 # scene:th_guest # cast:th_bro # speaker:th_bro # mood:th_bro=amused
  门外同门应声进屋，先接住重箱。你空出手开门，沿石阶查看哪处能落箱，再回来扶师兄过门槛。 # beat:th_last_pack_19 # scene:th_guest # cast:th_bro # speaker:narrator
  -> ending

=== ending ===
六份旧录归各门，没有给你单独多开第七份。下山之前，你把自己写过的纸重新折好。 # beat:th_ending_1 # scene:th_steps # cast:th_shen,th_bro # speaker:narrator
{
- future == 1:
{
- rematch and respect_shen:
复手那半日没有报胜负。沈照微先摆第一场，你摆第二场，各自指认自己没看见的那一步。 # beat:th_ending_2 # scene:th_leavepractice # cast:th_shen,th_sima # speaker:narrator
你看我的脚，我看你的眼。别又同时抢着证明自己。 # beat:th_ending_3 # scene:th_leavepractice # cast:th_shen,th_sima # speaker:th_shen # mood:th_shen=intent
那先只走步。 # beat:th_ending_4 # scene:th_leavepractice # cast:th_shen,th_sima # speaker:you
你们把剑放下。{strain and not measured:右肩仍紧，沈只让你把那只脚摆回去，手不追她。|沈把第一场收掌的位置再摆给你，这次先停在那里，等你看清两个人谁先到。} # beat:th_ending_5 # scene:th_leavepractice # cast:th_shen,th_sima # speaker:narrator
- else:
{
- rematch:
你今天不拆那半息了？ # beat:th_ending_6 # scene:th_leavepractice # cast:th_shen # speaker:th_shen # mood:th_shen=intent
先同司马摆那半步。早先约了你，是我改；不让你等在这里。 # beat:th_ending_7 # scene:th_leavepractice # cast:th_shen # speaker:you
好。我找明澄，三年后的正式场仍记着。 # beat:th_ending_8 # scene:th_leavepractice # cast:th_shen # speaker:th_shen # mood:th_shen=neutral
- else:
你先前没另约沈照微，也不临到散席就叫她把半日腾给你。 # beat:th_ending_9 # scene:th_leavepractice # cast:th_shen # speaker:narrator
}
我可以。不过先说好，还是不记场。 # beat:th_ending_10 # scene:th_leavepractice # cast:th_sima # speaker:th_sima # mood:th_sima=amused
好。{measured:先拆你带我转出去时，我哪只脚没能收回。|先拆我对你时抢的那半步。} # beat:th_ending_11 # scene:th_leavepractice # cast:th_sima # speaker:you
司马承一把箱子挪到墙根，留出刚好两个人的地方。{rematch:沈照微去找明澄，不在这里等你；三年后的正式场仍是另一回事。|沈照微已先行下山，告别时约的是三年后的正式场。} # beat:th_ending_12 # scene:th_leavepractice # cast:th_sima # speaker:narrator
}
{
- honest and night_honest:
这回抖不抖？ # beat:th_ending_13 # scene:th_leavepractice # cast:th_ming,th_sima # speaker:th_ming # mood:th_ming=amused
抖。端汤和端剑，看来得分开练。 # beat:th_ending_14 # scene:th_leavepractice # cast:th_ming,th_sima # speaker:you
院里有人笑，明澄把新端来的热汤往外移了移。 # beat:th_ending_15 # scene:th_leavepractice # cast:th_ming,th_sima # speaker:narrator
- else:
你这回问得比第一日慢。 # beat:th_ending_16 # scene:th_leavepractice # cast:th_ming,th_sima # speaker:th_sima # mood:th_sima=intent
第一日急着赢。今天也想，但先问清楚。 # beat:th_ending_17 # scene:th_leavepractice # cast:th_ming,th_sima # speaker:you
司马承一让你再走一遍，停在你刚才想省略的地方。 # beat:th_ending_18 # scene:th_leavepractice # cast:th_ming,th_sima # speaker:narrator
}
{
- strain and not measured and carried:
还没到交接的宽石阶，右肩的紧已变成刺痛。你就地放箱，叫同门来接；这次没有再撑，前一段承重却已经压在两场急用的肩上。回山后，你有一个月不能抬剑。 # beat:th_ending_19 # scene:th_steps # cast:th_bro # speaker:narrator
我坐着看，你练脚下。两个人的伤都别假装好了。 # beat:th_ending_20 # scene:th_steps # cast:th_bro # speaker:th_bro # mood:th_bro=sharp
没好。那今天不抬剑。 # beat:th_ending_21 # scene:th_steps # cast:th_bro # speaker:you
- else:
{carried:到第一处宽石阶，同门接过重箱。|同门从屋门接去的重箱先到宽石阶，你过去查看下一段。}师兄拎着自己的药包，慢慢走来，没有拿伤膝替谁接班。 # beat:th_ending_22 # scene:th_steps # cast:th_bro # speaker:narrator
}
{
- huo_question:
回山第七日，你寄出霍要的那一页，写明哪一步还不能试。他寄来的纸上也有一处留白，回函没替谁把路补全。 # beat:th_ending_23 # scene:th_home # cast:th_bro # speaker:narrator
}
回山后，你和师兄把这半日续成两个人能做的练习。下一届的约不保证再赢，却有具体的人、有收信的地址，也有需要你真正到场的一天。 # beat:th_ending_24 # scene:th_home # cast:th_bro # speaker:narrator # ending:th_company
-> END
- future == 3:
-> guidance_trial
- else:
你没有参加那半日复手。到山下时，院里那一场大约才开始；你确实错过了，不能靠一封信把自己也写成在场。 # beat:th_ending_25 # scene:th_steps # cast:th_bro # speaker:narrator
{
- strain and not measured and carried:
还没到交接的宽石阶，右肩的紧已变成刺痛。你就地放箱，叫同门来接；这次没有再撑，前一段承重却已经压在两场急用的肩上。回山后，你有一个月不能抬剑。 # beat:th_ending_26 # scene:th_steps # cast:th_bro # speaker:narrator
我坐着看，你练脚下。两个人的伤都别假装好了。 # beat:th_ending_27 # scene:th_steps # cast:th_bro # speaker:th_bro # mood:th_bro=sharp
没好。那今天不抬剑。 # beat:th_ending_28 # scene:th_steps # cast:th_bro # speaker:you
- else:
{carried:到第一处宽石阶，同门接过重箱。|同门从屋门接去的重箱先到宽石阶，你过去查看下一段。}师兄拎着自己的药包，慢慢走来，没有拿伤膝替谁接班。 # beat:th_ending_29 # scene:th_steps # cast:th_bro # speaker:narrator
}
{
- open_question:
信先写第一手。我问过他，也还是没看全。 # beat:th_ending_30 # scene:th_home # cast:th_bro # speaker:you
那空着。回去我们试。 # beat:th_ending_31 # scene:th_home # cast:th_bro # speaker:th_bro # mood:th_bro=neutral
你把“六手”写在纸边，下面留了六处不同的空。 # beat:th_ending_32 # scene:th_home # cast:th_bro # speaker:narrator
- else:
我给沈照微写信，也给自己留一张。不懂的地方，不从别人的评语里抄。 # beat:th_ending_33 # scene:th_home # cast:th_bro # speaker:you
记得落款。屋里如今只有一个陆青珩，信可未必。 # beat:th_ending_34 # scene:th_home # cast:th_bro # speaker:th_bro # mood:th_bro=amused
你把名字写正，没有把第五名添在后面。 # beat:th_ending_35 # scene:th_home # cast:th_bro # speaker:narrator
}
{
- huo_question:
给霍的信另夹了一页，画的是你追人的起手，不是那一百零二手的最后一下。 # beat:th_ending_36 # scene:th_home # cast:th_bro # speaker:narrator
}
一个月内，你寄出第一封信，写清练到哪里、哪里仍错，也写这半日为何先走。信封上是沈留下的地址，三年后的再会仍需到时再问。回信到的那天，师兄将它放在你练脚的空地旁，等你先收住这一步。 # beat:th_ending_37 # scene:th_home # cast:th_bro # speaker:narrator # ending:th_letter
-> END
}

=== guidance_trial ===
一炷香，张没问你第五，先叫你把纸上那只脚真放到地上。你一转，原想用来回身的地方，恰被自己前一步挤住。 # beat:th_guidance_trial_1 # scene:th_guidanceyard # cast:th_zhang # speaker:narrator
图上能挪，脚下先得让得出。 # beat:th_guidance_trial_2 # scene:th_guidanceyard # cast:th_zhang # speaker:th_zhang # mood:th_zhang=intent
张让你停在将转未转的地方。香还在烧，你得先选怎样用这一小段工夫。 # beat:th_guidance_trial_3 # scene:th_guidanceyard # cast:th_zhang # speaker:narrator
* [请张仍站原处，自己退回起手，再真走一次。 # cid:th_guidance_repeat]
  ~ guidance_repeated = true
  您别替我让。我从前一步重走。 # beat:th_guidance_trial_4 # scene:th_guidanceyard # cast:th_zhang # speaker:you
  你少进一点，再回身，脚后终于空出原先挤住的地方；手却还追旧图里的落点。 # beat:th_guidance_trial_5 # scene:th_guidanceyard # cast:th_zhang # speaker:narrator
  脚有路了。手还要自己找，今日不替你接完。 # beat:th_guidance_trial_6 # scene:th_guidanceyard # cast:th_zhang # speaker:th_zhang # mood:th_zhang=neutral
  -> guidance_continue
* [先把脚下两处位置画准，不急着连第二次，留下能回山验证的图。 # cid:th_guidance_mark]
  ~ guidance_repeated = false
  我先认清是哪一步挤住，不连着走给您看好看。 # beat:th_guidance_trial_7 # scene:th_guidanceyard # cast:th_zhang # speaker:you
  你将两脚落处画到纸边，请张只认自己刚才真实站过的位置。第二次没走，不在旁边写已经会了。 # beat:th_guidance_trial_8 # scene:th_guidanceyard # cast:th_zhang # speaker:narrator
  带回去，照这个先试。纸上留得出，脚下还不算。 # beat:th_guidance_trial_9 # scene:th_guidanceyard # cast:th_zhang # speaker:th_zhang # mood:th_zhang=neutral
  -> guidance_continue

=== guidance_continue ===
你收起纸，不再把穆那一剑添到自己的动作后头。 # beat:th_guidance_continue_1 # scene:th_guidanceyard # cast:th_zhang # speaker:narrator
{
- ask_limit:
正式场后你向他比过三处，这一回他还记得你那一下。先前真站过的半步，如今才有了能接着问的一点。 # beat:th_guidance_continue_2 # scene:th_guidanceyard # cast:th_zhang # speaker:narrator
那时以为手还能去，没想到脚已经把自己封住。 # beat:th_guidance_continue_3 # scene:th_guidanceyard # cast:th_zhang # speaker:you
今日看见这里。下次不一定同一处。 # beat:th_guidance_continue_4 # scene:th_guidanceyard # cast:th_zhang # speaker:th_zhang # mood:th_zhang=neutral
- else:
你没在第六十四手后当场试过，张从最普通的回身问。纸上空白还多，先补这一处，其余留待你回去试。 # beat:th_guidance_continue_5 # scene:th_guidanceyard # cast:th_zhang # speaker:narrator
原来先问自己站不站得进去。 # beat:th_guidance_continue_6 # scene:th_guidanceyard # cast:th_zhang # speaker:you
还得真试。问明白不等于已经能走。 # beat:th_guidance_continue_7 # scene:th_guidanceyard # cast:th_zhang # speaker:th_zhang # mood:th_zhang=neutral
}
香尽，张还有自己的事，准时收问。你没有多求两招，也没有从这一炷香拿回一场同辈复手。 # beat:th_guidance_continue_8 # scene:th_guidanceyard # cast:th_zhang # speaker:narrator
{
- strain and not measured and carried:
还没到交接的宽石阶，右肩的紧已变成刺痛。你就地放箱，叫同门来接；这次没有再撑，前一段承重却已经压在两场急用的肩上。回山后，你有一个月不能抬剑。 # beat:th_guidance_continue_9 # scene:th_steps # cast:th_bro # speaker:narrator
我坐着看，你练脚下。两个人的伤都别假装好了。 # beat:th_guidance_continue_10 # scene:th_steps # cast:th_bro # speaker:th_bro # mood:th_bro=sharp
没好。那今天不抬剑。 # beat:th_guidance_continue_11 # scene:th_steps # cast:th_bro # speaker:you
- else:
{carried:到第一处宽石阶，同门接过重箱。|同门从屋门接去的重箱先到宽石阶，你过去查看下一段。}师兄拎着自己的药包，慢慢走来，没有拿伤膝替谁接班。 # beat:th_guidance_continue_12 # scene:th_steps # cast:th_bro # speaker:narrator
}
回山后，你给司马的信写明那半日不在，另画了试给张看的回身。后来回信到了，他只圈出你图上的落脚处，约再见时真接一次。 # beat:th_guidance_continue_13 # scene:th_home # cast:th_bro # speaker:narrator
有人肯问，也有人不肯凭一张图夸你。挺好。 # beat:th_guidance_continue_14 # scene:th_home # cast:th_bro # speaker:th_bro # mood:th_bro=amused
{guidance_repeated:先前在张面前真走的那回，手还在追旧落点。{strain and not measured and carried:手还要歇，今日先看脚下。|你先看手与脚接在何处。}|第二次还没走，图在这里。我先只试脚下，你看哪只脚又挤住。} # beat:th_guidance_continue_15 # scene:th_home # cast:th_bro # speaker:you
{
- huo_question:
第七日，霍要的那页也寄出，仍是追沈时的起手，不拿张刚指过的回身替换他要看的那一面。{rematch:给沈的信另写原约怎样取消，不把改约藏在听指点的热闹后面。|给沈的信只说今晨去了短问，不虚写她原本在等。} # beat:th_guidance_continue_16 # scene:th_home # cast:th_bro # speaker:narrator
}
得到一炷香，错过同辈一场。你带回的不是一招越级的剑，而是一处可以由自己反复验证的回身；下一次见面，仍要将脚真放到别人来手之前。 # beat:th_guidance_continue_17 # scene:th_home # cast:th_bro # speaker:narrator # ending:th_guidance
-> END
