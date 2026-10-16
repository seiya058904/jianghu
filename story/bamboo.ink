// Source 6166–6361. Player is Yan Zhongshan, an invited top-ten master. No young listener and no public lecture record. Liu impressions remain attributed.
VAR bb_own_place = false
VAR bb_less_question = false
VAR bb_han_record = false
VAR bb_compare = false
VAR bb_unseen = false
VAR bb_fought = false
VAR bb_final = 0
-> closed_gate

=== closed_gate ===
此刻你是严仲山。龙虎会当夜，洛阳南郊旧园关门，无帖子，也无年轻弟子。今日你和宁的旧账已记平，左腕没有废半年，回想那第八十一招时却仍有些凉。 # beat:bb_closed_gate_1 # scene:bb_gate # cast:ly_liu,ly_ning,bb_ro # speaker:narrator
罗继祖、吴成海、宁文昭、沈元声、谢青云、周敬之，另有一南一北两位前十名宿都在。座中人能来，不是因为替谁递过一封帖。 # beat:bb_closed_gate_2 # scene:bb_gate # cast:ly_liu,ly_ning,bb_ro # speaker:narrator
柳老若晚一步，我右肩就更久？ # beat:bb_closed_gate_3 # scene:bb_gate # cast:ly_liu,ly_ning,bb_ro # speaker:ly_ning # mood:ly_ning=sharp
你还记得比我更久。 # beat:bb_closed_gate_4 # scene:bb_gate # cast:ly_liu,ly_ning,bb_ro # speaker:you
你也没松手。 # beat:bb_closed_gate_5 # scene:bb_gate # cast:ly_liu,ly_ning,bb_ro # speaker:ly_ning # mood:ly_ning=neutral
柳最后到，听见两句，先将自己的椅摆正。 # beat:bb_closed_gate_6 # scene:bb_gate # cast:ly_liu,ly_ning,bb_ro # speaker:narrator
不是我教你们，只说见过什么。有用便拿，没用就当我老了话多。 # beat:bb_closed_gate_7 # scene:bb_gate # cast:ly_liu,ly_ning,bb_ro # speaker:ly_liu # mood:ly_liu=intent
* [先问入化究竟是什么，承认自己今日懂得该停，手却仍往里走。 # cid:bb_ask_own_place]
  ~ bb_own_place = true
  我知道下一手会伤，还是走了。错在那掌，还是我看这一场的地方？ # beat:bb_closed_gate_8 # scene:bb_gate # cast:ly_liu,ly_ning,bb_ro # speaker:you
  先别替我答。说一段我年轻时追人的事。 # beat:bb_closed_gate_9 # scene:bb_gate # cast:ly_liu,ly_ning,bb_ro # speaker:ly_liu # mood:ly_liu=neutral
  宁没再接更重两个字，扇子合在膝头，等他说。 # beat:bb_closed_gate_10 # scene:bb_gate # cast:ly_liu,ly_ning,bb_ro # speaker:narrator
  -> three_steps
* [先问见闻能否替眼前的人解难，不想只听一晚人人都说好的高话。 # cid:bb_challenge_old_story]
  ~ bb_own_place = false
  听过别人的路，明日仍得我自己出掌。柳老，能说一段您当年真不明白的么？ # beat:bb_closed_gate_11 # scene:bb_gate # cast:ly_liu,ly_ning,bb_ro # speaker:you
  有。追不上我师父那一段，够不够丢人？ # beat:bb_closed_gate_12 # scene:bb_gate # cast:ly_liu,ly_ning,bb_ro # speaker:ly_liu # mood:ly_liu=amused
  罗笑了一声，柳却先叫他别急着猜成轻功更快。 # beat:bb_closed_gate_13 # scene:bb_gate # cast:ly_liu,ly_ning,bb_ro # speaker:narrator
  -> three_steps

=== three_steps ===
柳年轻时轻功高，师父带一段山路，无论他快慢，始终前三步。一路都在追，老人却根本没躲。 # beat:bb_three_steps_1 # scene:bb_table # cast:ly_liu,bb_ro,ly_ning # speaker:narrator
总想着自己怎样快，便总慢一步。后来才知道，有时错的不是招，是看事情的地方。 # beat:bb_three_steps_2 # scene:bb_table # cast:ly_liu,bb_ro,ly_ning # speaker:ly_liu # mood:ly_liu=neutral
到后面，都在求少？ # beat:bb_three_steps_3 # scene:bb_table # cast:ly_liu,bb_ro,ly_ning # speaker:bb_ro # mood:bb_ro=intent
不练到多，怎知道什么能少？年轻人十路枪只会三路，叫不会。练五十年、千招见过，才剩三路，才是少。 # beat:bb_three_steps_4 # scene:bb_table # cast:ly_liu,bb_ro,ly_ning # speaker:ly_liu # mood:ly_liu=neutral
你低头看掌，不准备今夜便删去只因难练而还没练成的东西。宁手里十二骨扇，也没为听懂一句少就当场折掉三根。 # beat:bb_three_steps_5 # scene:bb_table # cast:ly_liu,bb_ro,ly_ning # speaker:narrator
* [追问怎样分少与不会，把自己仍不敢用的一掌也算进去，不拿今夜一句话替自己省功。 # cid:bb_ask_which_less]
  ~ bb_less_question = true
  若我嫌一掌碍事，却其实还没练到能用，删了也不能算少。 # beat:bb_three_steps_6 # scene:bb_table # cast:ly_liu,bb_ro,ly_ning # speaker:you
  那先问自己为什么用不出。别借我的话替你把没做过的事改了名字。 # beat:bb_three_steps_7 # scene:bb_table # cast:ly_liu,bb_ro,ly_ning # speaker:ly_liu # mood:ly_liu=intent
  罗伸手在桌边比了自己惯用的一式，停一停，没有接着演成一整路。 # beat:bb_three_steps_8 # scene:bb_table # cast:ly_liu,bb_ro,ly_ning # speaker:narrator
  -> thirty_six
* [请罗说他哪些枪还留着只因教了多年，让少先落到一个人手里，不只当境界口号。 # cid:bb_ask_ro_habit]
  ~ bb_less_question = false
  有些教顺嘴，自己一用，反而得先替它找地方。 # beat:bb_three_steps_9 # scene:bb_table # cast:ly_liu,bb_ro,ly_ning # speaker:bb_ro # mood:bb_ro=uneasy
  我也有。 # beat:bb_three_steps_10 # scene:bb_table # cast:ly_liu,bb_ro,ly_ning # speaker:you
  你没把这一句当作已经找齐所有多余，柳也没替罗当场点出该删哪十一式。 # beat:bb_three_steps_11 # scene:bb_table # cast:ly_liu,bb_ro,ly_ning # speaker:narrator
  -> thirty_six

=== thirty_six ===
柳说现行总谱前头三十五已入化或更高，第三十六还在门外。宁扇柄一动，问那岂不是一进门便该有位？ # beat:bb_thirty_six_1 # scene:bb_table # cast:ly_liu,ly_ning # speaker:narrator
别倒过来。就三十六席。六门山里、百岁退谱以后，还有纸外的人。 # beat:bb_thirty_six_2 # scene:bb_table # cast:ly_liu,ly_ning # speaker:ly_liu # mood:ly_liu=sharp
门外能留在最后，谁？ # beat:bb_thirty_six_3 # scene:bb_table # cast:ly_liu,ly_ning # speaker:you
虎啸金刀，韩世雄。河洛韩氏，八十九。 # beat:bb_thirty_six_4 # scene:bb_table # cast:ly_liu,ly_ning # speaker:ly_liu # mood:ly_liu=neutral
三十还只是河洛十一，六十地方第一；六十一胜南北末席、六十八胜北二十二、七十一胜当时北十五。后来总谱重校，没经过南北榜，直接列三十六。 # beat:bb_thirty_six_5 # scene:bb_table # cast:ly_liu,ly_ning # speaker:narrator # fact:bb_paper
* [问那张纸以外真正打过什么，不把未入化便列总谱当一条谁都可走的捷径。 # cid:bb_ask_han_record]
  ~ bb_han_record = true
  只叫门前一人，仍不知道旁人怎样知道他站在那里。 # beat:bb_thirty_six_6 # scene:bb_table # cast:ly_liu,ly_ning # speaker:you
  二十年，够分量十二场。八胜两平两负，两负的对手都坐实入化。 # beat:bb_thirty_six_7 # scene:bb_table # cast:ly_liu,ly_ning # speaker:ly_liu # mood:ly_liu=neutral
  你没有替另外八胜补成八位入化，也没有把未遇过的人一并写成他必胜。 # beat:bb_thirty_six_8 # scene:bb_table # cast:ly_liu,ly_ning # speaker:narrator
  -> han_twelve
* [质疑不入化莫问韩刀是否太满，要求分清亲见战绩与江湖替他说的话。 # cid:bb_ask_han_rumor]
  ~ bb_han_record = false
  无人正面赢过，不等于所有没来的人都已输。 # beat:bb_thirty_six_9 # scene:bb_table # cast:ly_liu,ly_ning # speaker:you
  是。到今日，尚未坐实入化的人，没有在公平正面赢过他的实据；别替没见过的战添结局。 # beat:bb_thirty_six_10 # scene:bb_table # cast:ly_liu,ly_ning # speaker:ly_liu # mood:ly_liu=intent
  他仍将二十年十二场八胜两平两负说清，两败都归真正门里的人。 # beat:bb_thirty_six_11 # scene:bb_table # cast:ly_liu,ly_ning # speaker:narrator
  -> han_twelve

=== han_twelve ===
六年前薛云山二百四十余平韩；七年前陆清泉一百九十余负韩。柳自己十二年前一百零九招胜，才说若没真入化，未必赢得下来。 # beat:bb_han_twelve_1 # scene:bb_table # cast:ly_liu,bb_ro # speaker:narrator
所以只差一步？ # beat:bb_han_twelve_2 # scene:bb_table # cast:ly_liu,bb_ro # speaker:bb_ro # mood:bb_ro=intent
有人当面问韩，他说谁说只差一步。那些人又不是他。 # beat:bb_han_twelve_3 # scene:bb_table # cast:ly_liu,bb_ro # speaker:ly_liu # mood:ly_liu=neutral
可能明日，可能此生到不了，韩说完仍磨刀。今夜韩不在园里，你听的是柳所说的见闻，不是替韩又认了一场输。 # beat:bb_han_twelve_4 # scene:bb_table # cast:ly_liu,bb_ro # speaker:narrator
那一步，也不能由听的人替他量好。 # beat:bb_han_twelve_5 # scene:bb_table # cast:ly_liu,bb_ro # speaker:you
你自己的，也一样。 # beat:bb_han_twelve_6 # scene:bb_table # cast:ly_liu,bb_ro # speaker:ly_liu # mood:ly_liu=neutral # fact:bb_han
* [问秦与顾各是什么样的高，不强索一句谁必胜谁。 # cid:bb_ask_both_heads]
  ~ bb_compare = true
  两个榜首，若只想问排在谁前，恐怕又少听一半。 # beat:bb_han_twelve_7 # scene:bb_table # cast:ly_liu,bb_ro # speaker:you
  秦更整，顾更空。这是我的所见，不是一场他们刚打完的判词。 # beat:bb_han_twelve_8 # scene:bb_table # cast:ly_liu,bb_ro # speaker:ly_liu # mood:ly_liu=intent
  -> north_south
* [问柳肯认顾比自己强的根据，不让前十席上的客气替代真比较。 # cid:bb_ask_liu_weaker]
  ~ bb_compare = false
  同是能坐进总谱的人，柳老为何肯说他强过自己？ # beat:bb_han_twelve_9 # scene:bb_table # cast:ly_liu,bb_ro # speaker:you
  他剑早年漂亮，二十年前还看得出哪剑最好，十年前渐看不出。如今先看人，不只看剑。 # beat:bb_han_twelve_10 # scene:bb_table # cast:ly_liu,bb_ro # speaker:ly_liu # mood:ly_liu=neutral
  -> north_south

=== north_south ===
秦天岳入化多年而深。九年前同北第三韩镇北闭门论枪，百招后韩自收；每枪都对，秦却比那对还多一点。韩也已入化，军枪渐从压人到等人。 # beat:bb_north_south_1 # scene:bb_tea # cast:ly_liu,bb_xie,ly_ning # speaker:narrator
薛云山尚在门外极近，太相信那根确实解决过大多数事的棍，反而难放。岳青河七年没见，柳不敢断；七年前尚未入化，五十后主动废半硬掌，说太满。 # beat:bb_north_south_2 # scene:bb_tea # cast:ly_liu,bb_xie,ly_ning # speaker:narrator
如今仍按七年前说？ # beat:bb_north_south_3 # scene:bb_tea # cast:ly_liu,bb_xie,ly_ning # speaker:bb_xie # mood:bb_xie=intent
说七年前。如今我没见。 # beat:bb_north_south_4 # scene:bb_tea # cast:ly_liu,bb_xie,ly_ning # speaker:ly_liu # mood:ly_liu=sharp
顾长风入化久，柳亲认比自己强。陆清泉尚未入化，几无可改的仍是陆家剑；负韩后三年不赴剑会，回家用朱笔圈多余。 # beat:bb_north_south_5 # scene:bb_tea # cast:ly_liu,bb_xie,ly_ning # speaker:narrator
那我们这两掌一扇？ # beat:bb_north_south_6 # scene:bb_tea # cast:ly_liu,bb_xie,ly_ning # speaker:ly_ning # mood:ly_ning=amused
看你们自己。 # beat:bb_north_south_7 # scene:bb_tea # cast:ly_liu,bb_xie,ly_ning # speaker:ly_liu # mood:ly_liu=neutral
你没从这句话讨出一个柳没说过的境界，宁也没能替自己讨到今日本该先赢。 # beat:bb_north_south_8 # scene:bb_tea # cast:ly_liu,bb_xie,ly_ning # speaker:narrator # fact:bb_seen
* [追问柳为何不替七年未见的人留一个大概，听他愿意把不知道放在席间。 # cid:bb_press_unseen]
  ~ bb_unseen = true
  我留个大概，你们出去就有人说我已看过。他若变了，是我替他停在七年前。 # beat:bb_north_south_9 # scene:bb_tea # cast:ly_liu,bb_xie,ly_ning # speaker:ly_liu # mood:ly_liu=neutral
  谢把原想问的如今二字收住，改问七年前哪一处还满。柳这回能答。 # beat:bb_north_south_10 # scene:bb_tea # cast:ly_liu,bb_xie,ly_ning # speaker:narrator
  -> waist_next_day
* [回到自己的第八十一招，问明知会伤为何仍拿输赢当必须接的手，不借别人的榜位躲开。 # cid:bb_return_own_palm]
  ~ bb_unseen = false
  我知道那一手严与宁是谁，也知道会伤。知道得这样多，还是没肯收。 # beat:bb_north_south_11 # scene:bb_tea # cast:ly_liu,bb_xie,ly_ning # speaker:you
  我也没有。 # beat:bb_north_south_12 # scene:bb_tea # cast:ly_liu,bb_xie,ly_ning # speaker:ly_ning # mood:ly_ning=uneasy
  柳没在两人之间再判谁错得更多，只等你们将各自那一截说完。 # beat:bb_north_south_13 # scene:bb_tea # cast:ly_liu,bb_xie,ly_ning # speaker:narrator
  -> waist_next_day

=== waist_next_day ===
问柳何时入化，他想很久，说七十前后。次日怎样？照样腰疼。众人笑，他自己也笑，没把笑声当作不再有门槛。 # beat:bb_waist_next_day_1 # scene:bb_tea # cast:ly_liu,bb_ro # speaker:narrator
真正变处，是三十年前百余招难分的旧敌再来，十七招便败。肩动知人去哪，脚落知下一步，不是硬猜，也不是只练得更快。 # beat:bb_waist_next_day_2 # scene:bb_tea # cast:ly_liu,bb_ro # speaker:narrator
真正返真的，见过么？ # beat:bb_waist_next_day_3 # scene:bb_tea # cast:ly_liu,bb_ro # speaker:bb_ro # mood:bb_ro=neutral
柳沉默很久，只认能确定两个。席上无人追姓名，你也没把那阵安静当作他已默许哪个传说。 # beat:bb_waist_next_day_4 # scene:bb_tea # cast:ly_liu,bb_ro # speaker:narrator
* [问是否交手；肯接受他不以挑战过才准承认所见。 # cid:bb_ask_if_fought]
  ~ bb_fought = true
  你会跑到悬崖下，问山能不能同你打一架？ # beat:bb_waist_next_day_5 # scene:bb_tea # cast:ly_liu,bb_ro # speaker:ly_liu # mood:ly_liu=amused
  你想起自己今日还想在两掌之间抢一个先。笑过，没再追着问能撑几招才算真见。 # beat:bb_waist_next_day_6 # scene:bb_tea # cast:ly_liu,bb_ro # speaker:narrator
  -> tea_cup
* [问如何只敢说能确定两个，而不逼他报姓名作一张更大的榜。 # cid:bb_ask_how_confirm]
  ~ bb_fought = false
  入化的人，还能看出身法剑掌高在哪儿。有些人，却连为何这样做也未必看明白。 # beat:bb_waist_next_day_7 # scene:bb_tea # cast:ly_liu,bb_ro # speaker:ly_liu # mood:ly_liu=intent
  他没有拿未看懂的每个人都称返真，只讲其中一回。 # beat:bb_waist_next_day_8 # scene:bb_tea # cast:ly_liu,bb_ro # speaker:narrator
  -> tea_cup

=== tea_cup ===
仍在竹院，柳说当年所见。那位老人随手推茶盏，滑到石桌边，恰停。柳全没懂，旁一位总谱前十却起身看许久，行礼，当夜再未问拳。 # beat:bb_tea_cup_1 # scene:bb_recollection # cast:ly_liu # speaker:narrator
我想十三年，才觉得明白一点。 # beat:bb_tea_cup_2 # scene:bb_recollection # cast:ly_liu # speaker:ly_liu # mood:ly_liu=intent
那一点？ # beat:bb_tea_cup_3 # scene:bb_recollection # cast:ly_liu # speaker:you
柳没说。你也没从杯沿替他猜出一套谁照做便入化的法。 # beat:bb_tea_cup_4 # scene:bb_recollection # cast:ly_liu # speaker:narrator
茶是今夜的茶，故事里那个人与总谱前十未具名，也没有被请进这座园替你再走一遍。 # beat:bb_tea_cup_5 # scene:bb_recollection # cast:ly_liu # speaker:narrator # fact:bb_cup
* [不再追名字，将没得到的那一问留着，明日先真试自己还多出的掌。 # cid:bb_leave_question_open]
  ~ bb_final = 1
  我先试自己的。杯边那一处，我今夜没明白。 # beat:bb_tea_cup_6 # scene:bb_recollection # cast:ly_liu # speaker:you
  不明白，先不替它添一个响名字。 # beat:bb_tea_cup_7 # scene:bb_recollection # cast:ly_liu # speaker:ly_liu # mood:ly_liu=neutral
  你将掌收回膝上，宁的扇也合起。今晚没有谁被教成另一个柳成章。 # beat:bb_tea_cup_8 # scene:bb_recollection # cast:ly_liu # speaker:narrator
  -> night_ends
* [先同宁约明日说清那一个平，别急着把仍想赢的手改称已经超脱。 # cid:bb_talk_ning_after]
  ~ bb_final = 2
  说可以。不趁柳老不在，又接第八十二招。 # beat:bb_tea_cup_9 # scene:bb_recollection # cast:ly_ning,ly_liu # speaker:ly_ning # mood:ly_ning=intent
  我还想赢。正因为还想，先不拿这一句藏着再试。 # beat:bb_tea_cup_10 # scene:bb_recollection # cast:ly_ning,ly_liu # speaker:you
  宁点头。这不是下一场约斗，至少明日两个人都知道该来谈什么。 # beat:bb_tea_cup_11 # scene:bb_recollection # cast:ly_ning,ly_liu # speaker:narrator
  -> night_ends

=== night_ends ===
夜尽，各自出园，没有留一本柳成章讲武录。你的少一掌、宁的十二骨换九骨、谢青云三月后去白石谷，都是各人的后日，不是柳今晚替天下统一排的功课。 # beat:bb_night_ends_1 # scene:bb_gate # cast:bb_ro,bb_xie # speaker:narrator
我那十一式，回去重看。 # beat:bb_night_ends_2 # scene:bb_gate # cast:bb_ro,bb_xie # speaker:bb_ro # mood:bb_ro=intent
后来真删去三十年教过的十一式，人问谁教，他仍答没人教，只是有一夜听些旧事。 # beat:bb_night_ends_3 # scene:bb_gate # cast:bb_ro,bb_xie # speaker:narrator
{
- bb_final == 1:
次日你少练一掌，真走到原本会硬接的那一处，再停。没有柳替你按腕，才知道停也得由自己做到。宁来时见你还在试，没拿昨夜那句看自己笑你。 # beat:bb_night_ends_4 # scene:bb_after # cast:none # speaker:narrator
你让出场中的空处，请他坐。两人没有续打第八十二招。 # beat:bb_night_ends_5 # scene:bb_after # cast:none # speaker:narrator
- else:
次日你仍少练一掌，然后按约找宁。他将拆下的扇骨放旁边，先说自己当时还想怎样赢。你听完，再讲自己早等二十三年的锁轴，不把一个平字当作谁从此永远想开。 # beat:bb_night_ends_6 # scene:bb_after # cast:none # speaker:narrator
这一回没人替你们按住手，两个人都坐到茶凉才起。 # beat:bb_night_ends_7 # scene:bb_after # cast:none # speaker:narrator
}
{
- bb_final == 1:
少掉的那一掌，不由一句高话自动消失。你留着今日还须亲自停下的一处，下一回遇见对手，也仍要真接他的来手。 # beat:bb_night_ends_8 # scene:bb_after # cast:none # speaker:narrator # ending:bb_palm_after
-> END
- else:
一个平字不能替你们过完以后。你与宁多了一次不必先问谁赢的相见，仍有未解的那一截，肯各自带回去。 # beat:bb_night_ends_9 # scene:bb_after # cast:none # speaker:narrator # ending:bb_tea_after
-> END
}
