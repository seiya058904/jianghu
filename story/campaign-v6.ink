// V6 preview: isolated from v5 and still undergoing editorial/art production.
// 潮生有约 · 原创地方江湖篇，不改写原作名家历史
VAR rope = false
VAR mercy = false
VAR purse = true
VAR bao_help = false
VAR debt = false
VAR bread = false
VAR repair = false
VAR labor = false
VAR read = false
VAR respect = false
VAR wound = 0
VAR qiao_rest = false
VAR home_promise = false
VAR su_trust = false
VAR rule_known = false
VAR fair = false
VAR rong_fair = false
VAR warning = false
VAR route = 0
VAR supplies = false
VAR bridge_help = false
VAR terrain = false
VAR rival_trust = false
VAR medicine = false
VAR bridge_safe = false
VAR guard = false
VAR escort = false
VAR credit = false
VAR water_read = false
VAR net_cut = false
VAR wait_tide = false
VAR night_safe = false
VAR cloth = false
VAR zhaoli_trust = false
VAR honest = false
VAR ally = false
VAR team = false
VAR grain_help = false
VAR duel_read = false
VAR duel = 0
VAR rematch = false
VAR pair_win = false
VAR stop_clear = false
VAR evac = false
VAR grain_rescue = false
VAR qiao_saved = false
VAR signal = false
VAR anchor = false
VAR final = 0
VAR account = false
VAR rescued = false
VAR future = 0
VAR v6_qiao_asked = false
VAR v6_stopped = false
VAR v6_labor_first = false
VAR v6_advance = false
VAR v6_flag_safe = false
VAR v6_escort = false
VAR v6_ledger = false
VAR v6_public_cost = false
VAR v6_one_shift = true
VAR v6_qiao_agency = false
VAR v6_gate_clear = false
VAR v6_roles_clear = false
VAR v6_after_shift = 0
VAR v6_book_dry = false
VAR v6_handover = false
VAR v6_exit_drill = false
VAR v6_stock_checked = false
VAR v6_witness_signed = false
-> cargo

=== cargo ===
你刚踏上青蒲渡，一袋米便从高处砸下来。乔砚生的剑出了半寸，袋口先泼了他一头白。 # beat:c_cargo_1 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_bao # speaker:narrator # action:米袋坠下
……哪位高手，暗器里还掺糠？ # beat:c_cargo_2 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_bao # speaker:v6_qiao # mood:v6_qiao=surprised
上头那位搬米的高手！别拔剑，右边绳要断了！ # beat:c_cargo_3 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_bao # speaker:v6_zhaoli # mood:v6_zhaoli=sharp
我没偷懒！下面有人把车推歪了—— # beat:c_cargo_4 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_bao # speaker:v6_bao # mood:v6_bao=uneasy
吊杆嘎地一响。米袋下是你的盘缠，车轮旁蹲着个捡散米的孩子。 # beat:c_cargo_5 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_bao # speaker:narrator
我拉主绳。你只能赶上一边，先说抓哪边！ # beat:c_cargo_6 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_bao # speaker:v6_zhaoli # mood:v6_zhaoli=intent # action:吊杆倾斜 · 米袋下有人
* [抓住副绳，把整袋米拖离车轮。 # cid:save_rope]
  ~ rope = true
  砚生，别顾头发！把孩子抱走，我拉绳！ # beat:c_cargo_7 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_bao # speaker:you
  别往身上缠！绕木桩，两圈——对，就是这样！ # beat:c_cargo_8 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_bao # speaker:v6_zhaoli # mood:v6_zhaoli=intent
  麻绳烧过掌心，米袋落进浅水。你的钱袋还在，掌心却多了道红印。 # beat:c_cargo_9 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_bao # speaker:narrator
  -> quay_people
* [先把孩子抱出来，盘缠以后再说。 # cid:save_child]
  ~ mercy = true
  ~ purse = false
  过来，先松开那把米。袋子压下来可不认人。 # beat:c_cargo_10 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_bao # speaker:you
  你抱着孩子滚开，车轮碾过钱袋，几枚铜钱叮叮落进水里。 # beat:c_cargo_11 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_bao # speaker:narrator
  人出来就好！包小满，别找钱，先把吊杆顶住！ # beat:c_cargo_12 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_bao # speaker:v6_zhaoli # mood:v6_zhaoli=intent
  -> quay_people


=== quay_people ===
一袋三十斤，不是暗器。我赔你洗头的钱，成不成？ # beat:c_quay_people_1 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_bao # speaker:v6_bao # mood:v6_bao=neutral
这是头发，不是淘米箩。你先赔我一口气。 # beat:c_quay_people_2 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_bao # speaker:v6_qiao # mood:v6_qiao=sharp
那可贵了。他刚才喊了半条河。 # beat:c_quay_people_3 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_bao # speaker:v6_zhaoli # mood:v6_zhaoli=amused
你们这里待客，都先给客人开光？ # beat:c_quay_people_4 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_bao # speaker:you
江照鲤，领船的。刚才那车歪了我也有份，待会儿请你们吃饼。 # beat:c_quay_people_5 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_bao # speaker:v6_zhaoli # mood:v6_zhaoli=neutral
乔砚生。今日先记账，我还得替石梁馆去报名。 # beat:c_quay_people_6 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_bao # speaker:v6_qiao # mood:v6_qiao=neutral
那正好……你们馆还收不收像我这么笨的？ # beat:c_quay_people_7 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_bao # speaker:v6_bao # mood:v6_bao=uneasy
* [先教你站稳，米袋就算学费。 # cid:bao_yes]
  ~ bao_help = true
  收不收得师父说。今晚你来，我先教你怎么不跟着车倒。 # beat:c_quay_people_8 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_bao # speaker:you
  那我先把米晾好！练坏的米不能交学费吧？ # beat:c_quay_people_9 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_bao # speaker:v6_bao # mood:v6_bao=amused
  -> price
* [我也只是学徒。一起去问，别把我当师父。 # cid:bao_plain]
  ~ bao_help = false
  我上月还把自己绊进水沟。你要不嫌丢人，跟我一起问。 # beat:c_quay_people_10 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_bao # speaker:you
  原来你们也会摔！那我敢去了。 # beat:c_quay_people_11 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_bao # speaker:v6_bao # mood:v6_bao=amused
  -> price


=== price ===
两个饼，一碗米汤。乔家小子，你头上那点米，回头记你账上。 # beat:c_price_1 # scene:v6_quay # cast:v6_aunt,v6_zhaoli,v6_qiao # speaker:v6_aunt # mood:v6_aunt=neutral
汤二娘！我这是替你拦住了一袋，不能算护镖？ # beat:c_price_2 # scene:v6_quay # cast:v6_aunt,v6_zhaoli,v6_qiao # speaker:v6_qiao # mood:v6_qiao=surprised
护镖有镖钱。往米里掉头发，有筛米钱。 # beat:c_price_3 # scene:v6_quay # cast:v6_aunt,v6_zhaoli,v6_qiao # speaker:v6_aunt # mood:v6_aunt=neutral
她认钱，不认剑。你赢不了。 # beat:c_price_4 # scene:v6_quay # cast:v6_aunt,v6_zhaoli,v6_qiao # speaker:v6_zhaoli # mood:v6_zhaoli=amused
饼摊后贴着水陆小会的木牌：年轻人试艺，优胜者可领一年护渡差事。 # beat:c_price_5 # scene:v6_quay # cast:v6_aunt,v6_zhaoli,v6_qiao # speaker:narrator
一年。馆里的屋顶就有着落了，不用再拿脸盆接雨。 # beat:c_price_6 # scene:v6_quay # cast:v6_aunt,v6_zhaoli,v6_qiao # speaker:v6_qiao # mood:v6_qiao=intent
差事有船工、守堤、教小孩。不是只看谁把谁打趴下。 # beat:c_price_7 # scene:v6_quay # cast:v6_aunt,v6_zhaoli,v6_qiao # speaker:v6_aunt # mood:v6_aunt=neutral
{
- purse:
你那钱袋还完整，别又学你师父替全桌付账。 # beat:c_price_8 # scene:v6_quay # cast:v6_aunt,v6_zhaoli,v6_qiao # speaker:v6_aunt # mood:v6_aunt=neutral
- else:
我看见铜钱落水了。饼先拿着，你的账写在后头。 # beat:c_price_9 # scene:v6_quay # cast:v6_aunt,v6_zhaoli,v6_qiao # speaker:v6_aunt # mood:v6_aunt=neutral
}
* [把这一顿记在自己名下，改日来还。 # cid:pay_breakfast]
  ~ debt = true
  人是她请，账记我。今天帮忙的人也得吃热的。 # beat:c_price_10 # scene:v6_quay # cast:v6_aunt,v6_zhaoli,v6_qiao # speaker:you
  记住了。赊账可以，别起个假名叫天下第一。 # beat:c_price_11 # scene:v6_quay # cast:v6_aunt,v6_zhaoli,v6_qiao # speaker:v6_aunt # mood:v6_aunt=amused
  -> rules
* [让照鲤请饼，我来洗碗。 # cid:split_breakfast]
  ~ debt = false
  钱让她出，碗我洗。别让她以后说我们白吃。 # beat:c_price_12 # scene:v6_quay # cast:v6_aunt,v6_zhaoli,v6_qiao # speaker:you
  才见一面，就想把人情洗干净？行，抹布在那儿。 # beat:c_price_13 # scene:v6_quay # cast:v6_aunt,v6_zhaoli,v6_qiao # speaker:v6_zhaoli # mood:v6_zhaoli=amused
  -> rules


=== rules ===
报名过午就关。师承、姓名、住处，照实写。 # beat:c_rules_1 # scene:v6_quay # cast:v6_su,v6_gao,v6_qiao # speaker:v6_gao # mood:v6_gao=neutral
石梁馆，乔砚生。这位是—— # beat:c_rules_2 # scene:v6_quay # cast:v6_su,v6_gao,v6_qiao # speaker:v6_qiao # mood:v6_qiao=neutral
我自己说。我也是石梁馆学徒，不顶任何人的名额。 # beat:c_rules_3 # scene:v6_quay # cast:v6_su,v6_gao,v6_qiao # speaker:you
很好。苏晚澄，替主事记录。你们报的是青蒲地方小会，不是榜谱大会。 # beat:c_rules_4 # scene:v6_quay # cast:v6_su,v6_gao,v6_qiao # speaker:v6_su # mood:v6_su=neutral
赢了也不会进榜？ # beat:c_rules_5 # scene:v6_quay # cast:v6_su,v6_gao,v6_qiao # speaker:v6_qiao # mood:v6_qiao=uneasy
不会。会得到差事、工钱，还有今后教人时说得清的一场经历。 # beat:c_rules_6 # scene:v6_quay # cast:v6_su,v6_gao,v6_qiao # speaker:v6_su # mood:v6_su=neutral
去年头名回来撑渡船了。比他没拿头名的师弟，早还清两年债。 # beat:c_rules_7 # scene:v6_quay # cast:v6_su,v6_gao,v6_qiao # speaker:v6_gao # mood:v6_gao=neutral # fact:bell
* [若有人出钱办会，你们敢判他输吗？ # cid:ask_fair]
  ~ fair = true
  我想知道，写在你册上的输赢，是谁说了算。 # beat:c_rules_8 # scene:v6_quay # cast:v6_su,v6_gao,v6_qiao # speaker:you
  有钱的人也按同一条线判。你若看见不同，现在就问我。 # beat:c_rules_9 # scene:v6_quay # cast:v6_su,v6_gao,v6_qiao # speaker:v6_su # mood:v6_su=sharp
  -> ticket
* [先让我看看护渡差事到底要做什么。 # cid:ask_task]
  ~ fair = false
  剑可以慢慢试。接了一年，不能干三天就说不适合。 # beat:c_rules_10 # scene:v6_quay # cast:v6_su,v6_gao,v6_qiao # speaker:you
  这句话比报名册上的豪言有用。明日会有守船试，你别缺席。 # beat:c_rules_11 # scene:v6_quay # cast:v6_su,v6_gao,v6_qiao # speaker:v6_su # mood:v6_su=calm
  -> ticket


=== ticket ===
我明早送药去白苇汊。后日会场见，你们别只顾找对手。 # beat:c_ticket_1 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_su # speaker:v6_zhaoli # mood:v6_zhaoli=neutral
我还不至于见个人就拔剑。 # beat:c_ticket_2 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_su # speaker:v6_qiao # mood:v6_qiao=neutral
是，见米袋才拔。包小满已经学会了。 # beat:c_ticket_3 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_su # speaker:v6_zhaoli # mood:v6_zhaoli=amused
石梁馆的韩教习托我带句话：日落前回馆，没饭也要回来。 # beat:c_ticket_4 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_su # speaker:v6_su # mood:v6_su=neutral
乔砚生的笑收了一点。他把剑往身后藏，露出补过的护腕。 # beat:c_ticket_5 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_su # speaker:narrator
师父要是问起盘缠……你先别说我们吃饼。 # beat:c_ticket_6 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_su # speaker:v6_qiao # mood:v6_qiao=uneasy
吃两个饼还能把屋顶吃没？ # beat:c_ticket_7 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_su # speaker:you
他今天没吃早饭。 # beat:c_ticket_8 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_su # speaker:v6_qiao # mood:v6_qiao=neutral
* [把剩下的半张饼包起来带回去。 # cid:bring_bread]
  ~ bread = true
  那就别藏。二娘，借张干净荷叶。 # beat:c_ticket_9 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_su # speaker:you
  他会说不饿。你到时候别让他把饼又塞回我们手里。 # beat:c_ticket_10 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_su # speaker:v6_qiao # mood:v6_qiao=calm
  -> hall_gate
* [盘缠的事当面说清，不替你瞒。 # cid:speak_purse]
  ~ bread = false
  没钱是没钱，我们别一人瞒一点，瞒到谁也不知道。 # beat:c_ticket_11 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_su # speaker:you
  我没说不告诉他。就是……你先开口，行不行？ # beat:c_ticket_12 # scene:v6_quay # cast:v6_zhaoli,v6_qiao,v6_su # speaker:v6_qiao # mood:v6_qiao=uneasy
  -> hall_gate


=== hall_gate ===
馆门外的雨盆排成一行，韩鹭石蹲在屋檐下削木楔，许竞川提着一把伞站在门边。 # beat:c_hall_gate_1 # scene:v6_hall # cast:v6_han,v6_qiao,v6_xu # speaker:narrator
来晚了。你师父连你小时候摔断门牙都讲完了。 # beat:c_hall_gate_2 # scene:v6_hall # cast:v6_han,v6_qiao,v6_xu # speaker:v6_xu # mood:v6_xu=amused
那是被你推的。 # beat:c_hall_gate_3 # scene:v6_hall # cast:v6_han,v6_qiao,v6_xu # speaker:v6_qiao # mood:v6_qiao=sharp
我是推门，谁让你用牙顶？ # beat:c_hall_gate_4 # scene:v6_hall # cast:v6_han,v6_qiao,v6_xu # speaker:v6_xu # mood:v6_xu=neutral
有得笑就先笑。笑完把门顶住，木楔还没削好。 # beat:c_hall_gate_5 # scene:v6_hall # cast:v6_han,v6_qiao,v6_xu # speaker:v6_han # mood:v6_han=neutral
师父，屋顶的事，我们在渡口看到了那个差事。 # beat:c_hall_gate_6 # scene:v6_hall # cast:v6_han,v6_qiao,v6_xu # speaker:you
先关门。屋顶还没塌，别把心先漏出去。 # beat:c_hall_gate_7 # scene:v6_hall # cast:v6_han,v6_qiao,v6_xu # speaker:v6_han # mood:v6_han=neutral
{
- bread:
你把半张饼放在木楔旁。韩鹭石伸手要推，乔砚生先按住了他的手。 # beat:c_hall_gate_8 # scene:v6_hall # cast:v6_han,v6_qiao,v6_xu # speaker:narrator
凉了就硬了。先吃，我们不看。 # beat:c_hall_gate_9 # scene:v6_hall # cast:v6_han,v6_qiao,v6_xu # speaker:v6_qiao # mood:v6_qiao=neutral
不看你还把眼瞪这么大？ # beat:c_hall_gate_10 # scene:v6_hall # cast:v6_han,v6_qiao,v6_xu # speaker:v6_han # mood:v6_han=amused
- else:
你们早饭吃了？别学我拿茶灌饱，练剑会抖。 # beat:c_hall_gate_11 # scene:v6_hall # cast:v6_han,v6_qiao,v6_xu # speaker:v6_han # mood:v6_han=neutral
吃了。钱的事现在说。 # beat:c_hall_gate_12 # scene:v6_hall # cast:v6_han,v6_qiao,v6_xu # speaker:you
好。说清楚比替我撑脸面强。 # beat:c_hall_gate_13 # scene:v6_hall # cast:v6_han,v6_qiao,v6_xu # speaker:v6_han # mood:v6_han=neutral
}
* [先帮木匠修漏处，报名不差这半日。 # cid:repair_now]
  ~ repair = true
  试艺要用手，手也能递瓦。先修最漏的那一块。 # beat:c_hall_gate_14 # scene:v6_hall # cast:v6_han,v6_qiao,v6_xu # speaker:you
  何铆在后院等梯子。别逞能上梁，你们的脚还不值一块新瓦。 # beat:c_hall_gate_15 # scene:v6_hall # cast:v6_han,v6_qiao,v6_xu # speaker:v6_han # mood:v6_han=calm
  -> hall_debt
* [先把明日的试艺练好，承认馆里缺钱。 # cid:practice_now]
  ~ repair = false
  我们想拿差事，但不保证拿得到。今天先把本事练足。 # beat:c_hall_gate_16 # scene:v6_hall # cast:v6_han,v6_qiao,v6_xu # speaker:you
  这话听着顺耳。缺钱不丢人，瞒着没本事去拿钱才要命。 # beat:c_hall_gate_17 # scene:v6_hall # cast:v6_han,v6_qiao,v6_xu # speaker:v6_han # mood:v6_han=neutral
  -> hall_debt


=== hall_debt ===
修最漏的地方不贵。贵的是你们上次拿剑把瓦挑裂了。 # beat:c_hall_debt_1 # scene:v6_hall # cast:v6_he,v6_han,v6_qiao # speaker:v6_he # mood:v6_he=neutral
那是为了够风筝。 # beat:c_hall_debt_2 # scene:v6_hall # cast:v6_he,v6_han,v6_qiao # speaker:v6_qiao # mood:v6_qiao=uneasy
风筝两文，瓦一百。你这剑飞得不便宜。 # beat:c_hall_debt_3 # scene:v6_hall # cast:v6_he,v6_han,v6_qiao # speaker:v6_he # mood:v6_he=neutral
何铆把一条旧绳挂上梁，另一头放进你手里。 # beat:c_hall_debt_4 # scene:v6_hall # cast:v6_he,v6_han,v6_qiao # speaker:narrator
拉紧试试。别光看绳粗，先看结。 # beat:c_hall_debt_5 # scene:v6_hall # cast:v6_he,v6_han,v6_qiao # speaker:v6_he # mood:v6_he=neutral
我年轻时也这么绑，松过一次。后来左腕就不敢再拿重物。 # beat:c_hall_debt_6 # scene:v6_hall # cast:v6_he,v6_han,v6_qiao # speaker:v6_han # mood:v6_han=neutral
你从来没说过。 # beat:c_hall_debt_7 # scene:v6_hall # cast:v6_he,v6_han,v6_qiao # speaker:you
你们从来只问我打赢过谁。 # beat:c_hall_debt_8 # scene:v6_hall # cast:v6_he,v6_han,v6_qiao # speaker:v6_han # mood:v6_han=neutral # fact:knots
* [请何铆重教一遍，自己绑一个。 # cid:learn_knots]
  ~ rope = true
  我会拉，不会保住别人。你先看我绑对没有。 # beat:c_hall_debt_9 # scene:v6_hall # cast:v6_he,v6_han,v6_qiao # speaker:you
  主绳双套，救人末端活结。好，拆了再绑。能闭眼绑才算记住。 # beat:c_hall_debt_10 # scene:v6_hall # cast:v6_he,v6_han,v6_qiao # speaker:v6_he # mood:v6_he=neutral
  -> hall_trial
* [把结交给何铆，自己去搬木料。 # cid:carry_timber]
  ~ labor = true
  不装会。你绑，我扛，今天先把漏补住。 # beat:c_hall_debt_11 # scene:v6_hall # cast:v6_he,v6_han,v6_qiao # speaker:you
  这句也值钱。两个人做事，不用两个人都抢那把锤子。 # beat:c_hall_debt_12 # scene:v6_hall # cast:v6_he,v6_han,v6_qiao # speaker:v6_he # mood:v6_he=neutral
  -> hall_trial


=== hall_trial ===
小会抽签前，借你们一块干地。三次碰袖，不拿胜负出门说。 # beat:c_hall_trial_1 # scene:v6_hall # cast:v6_xu,v6_qiao,v6_han # speaker:v6_xu # mood:v6_xu=neutral
怕输给我，被人听见？ # beat:c_hall_trial_2 # scene:v6_hall # cast:v6_xu,v6_qiao,v6_han # speaker:v6_qiao # mood:v6_qiao=sharp
怕你赢一次，说到我孙子都听见。 # beat:c_hall_trial_3 # scene:v6_hall # cast:v6_xu,v6_qiao,v6_han # speaker:v6_xu # mood:v6_xu=neutral
木刀木剑。碰伤了各自的师父骂各自的，不许来我这里躲。 # beat:c_hall_trial_4 # scene:v6_hall # cast:v6_xu,v6_qiao,v6_han # speaker:v6_han # mood:v6_han=neutral
许竞川左脚落地很沉，右脚总留半鞋空处。乔砚生眼里只有他袖口。 # beat:c_hall_trial_5 # scene:v6_hall # cast:v6_xu,v6_qiao,v6_han # speaker:narrator
你也来一回？明日有的人不会先告诉你准备好了。 # beat:c_hall_trial_6 # scene:v6_hall # cast:v6_xu,v6_qiao,v6_han # speaker:v6_xu # mood:v6_xu=intent
他右手快，别跟着刀尖转。 # beat:c_hall_trial_7 # scene:v6_hall # cast:v6_xu,v6_qiao,v6_han # speaker:v6_qiao # mood:v6_qiao=neutral
* [看他腰带和承重脚，先不抢攻。 # cid:read_weight]
  ~ read = true
  你右脚不着实，是等我往你那边挤？ # beat:c_hall_trial_8 # scene:v6_hall # cast:v6_xu,v6_qiao,v6_han # speaker:you
  看出来了，就试着别让我挤到。光看不算接住。 # beat:c_hall_trial_9 # scene:v6_hall # cast:v6_xu,v6_qiao,v6_han # speaker:v6_xu # mood:v6_xu=intent
  -> hall_exchange
* [先抢袖口，试试自己到底差多远。 # cid:force_trial]
  ~ read = false
  明知道你等着，我也得试一次。 # beat:c_hall_trial_10 # scene:v6_hall # cast:v6_xu,v6_qiao,v6_han # speaker:you
  刀背敲上腕骨。你没丢剑，却知道这只手今晚会肿。 # beat:c_hall_trial_11 # scene:v6_hall # cast:v6_xu,v6_qiao,v6_han # speaker:narrator
  胆子我看见了。明天还得用的手，别每次都拿来证明。 # beat:c_hall_trial_12 # scene:v6_hall # cast:v6_xu,v6_qiao,v6_han # speaker:v6_xu # mood:v6_xu=calm
  -> hall_exchange


=== hall_exchange ===
木刀压住剑背，你忽然发现许竞川没往前。他只要再推一寸，你就得松手。 # beat:c_hall_exchange_1 # scene:v6_hall # cast:v6_xu,v6_qiao,v6_han # speaker:narrator
换你。要退，还是还想挤？ # beat:c_hall_exchange_2 # scene:v6_hall # cast:v6_xu,v6_qiao,v6_han # speaker:v6_xu # mood:v6_xu=intent
他在骗你先动，别—— # beat:c_hall_exchange_3 # scene:v6_hall # cast:v6_xu,v6_qiao,v6_han # speaker:v6_qiao # mood:v6_qiao=sharp
闭嘴。替别人出剑的时候，你自己的脚也会停。 # beat:c_hall_exchange_4 # scene:v6_hall # cast:v6_xu,v6_qiao,v6_han # speaker:v6_han # mood:v6_han=neutral
雨盆叮了一声，许竞川的视线往门边偏了半瞬。 # beat:c_hall_exchange_5 # scene:v6_hall # cast:v6_xu,v6_qiao,v6_han # speaker:narrator
这时候说话，也算出招？ # beat:c_hall_exchange_6 # scene:v6_hall # cast:v6_xu,v6_qiao,v6_han # speaker:you
你要能让我信，我认。 # beat:c_hall_exchange_7 # scene:v6_hall # cast:v6_xu,v6_qiao,v6_han # speaker:v6_xu # mood:v6_xu=amused
* {read} [顺着刀背侧开，让他先落步。 # cid:yield_side]
  ~ respect = true
  你要中间，给你。我从旁边走。 # beat:c_hall_exchange_8 # scene:v6_hall # cast:v6_xu,v6_qiao,v6_han # speaker:you
  你退过一条木缝，刀尖擦过衣袖。他也及时收住，没有顺势逼倒你。 # beat:c_hall_exchange_9 # scene:v6_hall # cast:v6_xu,v6_qiao,v6_han # speaker:narrator
  接住了。不过我没输，别抢着替我起绰号。 # beat:c_hall_exchange_10 # scene:v6_hall # cast:v6_xu,v6_qiao,v6_han # speaker:v6_xu # mood:v6_xu=calm
  -> hall_wrist
* [认这一手输，留下明日再用的手。 # cid:call_stop]
  ~ respect = true
  停。我腕子受不住，今天到这里。 # beat:c_hall_exchange_11 # scene:v6_hall # cast:v6_xu,v6_qiao,v6_han # speaker:you
  好。自己能喊停，明天就不用靠别人替你喊。 # beat:c_hall_exchange_12 # scene:v6_hall # cast:v6_xu,v6_qiao,v6_han # speaker:v6_xu # mood:v6_xu=calm
  -> hall_wrist
* [硬挤一下，宁可碰伤也要碰袖。 # cid:press_again]
  ~ wound = 1
  ~ respect = false
  你碰到一寸布，腕骨也被木刀压得发麻。许竞川皱眉松开了刀。 # beat:c_hall_exchange_13 # scene:v6_hall # cast:v6_xu,v6_qiao,v6_han # speaker:narrator
  你要一寸布，我给你。可别把这叫赢。 # beat:c_hall_exchange_14 # scene:v6_hall # cast:v6_xu,v6_qiao,v6_han # speaker:v6_xu # mood:v6_xu=sharp
  冷水在门外。今天这只手不许再练。 # beat:c_hall_exchange_15 # scene:v6_hall # cast:v6_xu,v6_qiao,v6_han # speaker:v6_han # mood:v6_han=neutral
  -> hall_wrist


=== hall_wrist ===
谁把跌打药当饭吃？上回剩的药，还没到该用完的时候。 # beat:c_hall_wrist_1 # scene:v6_hall # cast:v6_qiao,v6_ling,v6_han # speaker:v6_ling # mood:v6_ling=neutral
我拿了一点擦剑鞘。 # beat:c_hall_wrist_2 # scene:v6_hall # cast:v6_qiao,v6_ling,v6_han # speaker:v6_qiao # mood:v6_qiao=uneasy
剑鞘会喊疼？把碗端起来。 # beat:c_hall_wrist_3 # scene:v6_hall # cast:v6_qiao,v6_ling,v6_han # speaker:v6_ling # mood:v6_ling=sharp
乔砚生伸左手，右腕缩进袖里。韩鹭石没有逼他，只把自己的左手放在桌上。 # beat:c_hall_wrist_4 # scene:v6_hall # cast:v6_qiao,v6_ling,v6_han # speaker:narrator
我以前也说不疼。后来连拿碗都要挑轻的。 # beat:c_hall_wrist_5 # scene:v6_hall # cast:v6_qiao,v6_ling,v6_han # speaker:v6_han # mood:v6_han=neutral
我能撑到后日。拿了差事再养，不耽误。 # beat:c_hall_wrist_6 # scene:v6_hall # cast:v6_qiao,v6_ling,v6_han # speaker:v6_qiao # mood:v6_qiao=neutral
伤不会看你报名册。现在讲明白，才能替你留个办法。 # beat:c_hall_wrist_7 # scene:v6_hall # cast:v6_qiao,v6_ling,v6_han # speaker:v6_ling # mood:v6_ling=neutral # fact:wrist
* [替他把训练停下，明日用另一种打法。 # cid:wrist_rest]
  ~ qiao_rest = true
  你当年替我背过一段山路。今天轮到我拿剑，轮到你少用一只手。 # beat:c_hall_wrist_8 # scene:v6_hall # cast:v6_qiao,v6_ling,v6_han # speaker:you
  别把我的比赛也拿走。我能守，能动，别把我晾着。 # beat:c_hall_wrist_9 # scene:v6_hall # cast:v6_qiao,v6_ling,v6_han # speaker:v6_qiao # mood:v6_qiao=uneasy
  不晾。改握法，留一段能使的力气。这才叫养。 # beat:c_hall_wrist_10 # scene:v6_hall # cast:v6_qiao,v6_ling,v6_han # speaker:v6_ling # mood:v6_ling=calm
  -> last_lesson
* [把选择留给他，约定一疼就当众叫停。 # cid:wrist_private]
  ~ qiao_rest = false
  我不替你报退。可你一旦松手，我们就停，脸面我陪你丢。 # beat:c_hall_wrist_11 # scene:v6_hall # cast:v6_qiao,v6_ling,v6_han # speaker:you
  说好了。别到时候也跟我一样嘴硬。 # beat:c_hall_wrist_12 # scene:v6_hall # cast:v6_qiao,v6_ling,v6_han # speaker:v6_qiao # mood:v6_qiao=calm
  我听见了。谁反悔，谁替我捣三天药。 # beat:c_hall_wrist_13 # scene:v6_hall # cast:v6_qiao,v6_ling,v6_han # speaker:v6_ling # mood:v6_ling=neutral
  -> last_lesson


=== hall_leave ===
差事只有一份，去的人不只你们。有人替你说好话，也有人真会比你强。 # beat:c_hall_leave_1 # scene:v6_hall # cast:v6_han,v6_xu,v6_qiao # speaker:v6_han # mood:v6_han=neutral
我就不说好话了。会场见，我要赢你们一场。 # beat:c_hall_leave_2 # scene:v6_hall # cast:v6_han,v6_xu,v6_qiao # speaker:v6_xu # mood:v6_xu=neutral
你小时候输的弹子，还没还我。 # beat:c_hall_leave_3 # scene:v6_hall # cast:v6_han,v6_xu,v6_qiao # speaker:v6_qiao # mood:v6_qiao=amused
你要我带刀去还，还是带弹弓？ # beat:c_hall_leave_4 # scene:v6_hall # cast:v6_han,v6_xu,v6_qiao # speaker:v6_xu # mood:v6_xu=neutral
许竞川把伞留下，自己冲进雨里。韩鹭石没拦，把削好的木楔收进小布包。 # beat:c_hall_leave_5 # scene:v6_hall # cast:v6_han,v6_xu,v6_qiao # speaker:narrator
师父没什么大名，替不了你们撑门。包里这个，船上也能用。 # beat:c_hall_leave_6 # scene:v6_hall # cast:v6_han,v6_xu,v6_qiao # speaker:v6_han # mood:v6_han=neutral
那我们带着。不是护身符，有东西松了才敲进去。 # beat:c_hall_leave_7 # scene:v6_hall # cast:v6_han,v6_xu,v6_qiao # speaker:you
* [答应会后回来把屋顶修完。 # cid:promise_home]
  ~ home_promise = true
  差事拿不拿得到，我们都回来。瓦还差一边。 # beat:c_hall_leave_8 # scene:v6_hall # cast:v6_han,v6_xu,v6_qiao # speaker:you
  好。我留着梯子。别把回来也当一种认输。 # beat:c_hall_leave_9 # scene:v6_hall # cast:v6_han,v6_xu,v6_qiao # speaker:v6_han # mood:v6_han=calm
  -> inn_table
* [说清楚想继续走远，留下自己的那份工钱。 # cid:promise_road]
  ~ home_promise = false
  我们可能还要走。若有工钱，先托二娘捎回来。 # beat:c_hall_leave_10 # scene:v6_hall # cast:v6_han,v6_xu,v6_qiao # speaker:you
  想走就走。别把师父说得像只等钱的破瓦罐。 # beat:c_hall_leave_11 # scene:v6_hall # cast:v6_han,v6_xu,v6_qiao # speaker:v6_han # mood:v6_han=amused
  -> inn_table


=== inn_table ===
临水客舍只剩一张空桌。苏晚澄刚放下册子，陆汀舟已把饼摊开，占了半边。 # beat:c_inn_table_1 # scene:v6_inn # cast:v6_lu,v6_su,v6_qiao # speaker:narrator
陆汀舟，我留的不是饭桌，是记录席。 # beat:c_inn_table_2 # scene:v6_inn # cast:v6_lu,v6_su,v6_qiao # speaker:v6_su # mood:v6_su=sharp
记录我先饿了，不违事实。 # beat:c_inn_table_3 # scene:v6_inn # cast:v6_lu,v6_su,v6_qiao # speaker:v6_lu # mood:v6_lu=amused
你们两位是一路来的？ # beat:c_inn_table_4 # scene:v6_inn # cast:v6_lu,v6_su,v6_qiao # speaker:v6_qiao # mood:v6_qiao=neutral
不是。 # beat:c_inn_table_5 # scene:v6_inn # cast:v6_lu,v6_su,v6_qiao # speaker:v6_su # mood:v6_su=neutral
一条路，两个方向。她在找我师伯的外务回函，我在替师伯送回函。 # beat:c_inn_table_6 # scene:v6_inn # cast:v6_lu,v6_su,v6_qiao # speaker:v6_lu # mood:v6_lu=neutral
所以她为什么还没拿到？ # beat:c_inn_table_7 # scene:v6_inn # cast:v6_lu,v6_su,v6_qiao # speaker:you
因为我把它放在饼下面压平了。 # beat:c_inn_table_8 # scene:v6_inn # cast:v6_lu,v6_su,v6_qiao # speaker:v6_lu # mood:v6_lu=neutral
* [先替苏晚澄挪开油纸。 # cid:sit_su]
  ~ su_trust = true
  要说笑，先别拿别人的事垫着。 # beat:c_inn_table_9 # scene:v6_inn # cast:v6_lu,v6_su,v6_qiao # speaker:you
  这句对。苏姑娘，是我欠妥，纸没沾油，我另换一张垫。 # beat:c_inn_table_10 # scene:v6_inn # cast:v6_lu,v6_su,v6_qiao # speaker:v6_lu # mood:v6_lu=uneasy
  多谢。饭可以一起吃，回函不能吃进去。 # beat:c_inn_table_11 # scene:v6_inn # cast:v6_lu,v6_su,v6_qiao # speaker:v6_su # mood:v6_su=calm
  -> inn_sword
* [借一角坐下，把自己的干布垫上。 # cid:sit_lu]
  ~ su_trust = false
  我也饿。回函垫干布，咱们各让一只碗的位置。 # beat:c_inn_table_12 # scene:v6_inn # cast:v6_lu,v6_su,v6_qiao # speaker:you
  行。别把桌子说成剑道之争，就只是桌子不够大。 # beat:c_inn_table_13 # scene:v6_inn # cast:v6_lu,v6_su,v6_qiao # speaker:v6_su # mood:v6_su=neutral
  我本来准备说的。你怎么连这个都知道？ # beat:c_inn_table_14 # scene:v6_inn # cast:v6_lu,v6_su,v6_qiao # speaker:v6_lu # mood:v6_lu=amused
  -> inn_sword


=== inn_sword ===
还有一碗面？我替白苇村送药，明早要早行。 # beat:c_inn_sword_1 # scene:v6_inn # cast:v6_lu,v6_su,v6_jue # speaker:v6_jue # mood:v6_jue=neutral
师父坐这儿。我去端。面大碗还是小碗？ # beat:c_inn_sword_2 # scene:v6_inn # cast:v6_lu,v6_su,v6_jue # speaker:v6_lu # mood:v6_lu=neutral
大碗。行脚不能吃虚的。 # beat:c_inn_sword_3 # scene:v6_inn # cast:v6_lu,v6_su,v6_jue # speaker:v6_jue # mood:v6_jue=calm
明日有水陆两队。陆队护药车过枫岭，水队带药米去白苇汊，后日会场汇合。 # beat:c_inn_sword_4 # scene:v6_inn # cast:v6_lu,v6_su,v6_jue # speaker:v6_su # mood:v6_su=neutral
她带陆队走外务，我看山路。水路听江照鲤的，别听我的。 # beat:c_inn_sword_5 # scene:v6_inn # cast:v6_lu,v6_su,v6_jue # speaker:v6_lu # mood:v6_lu=neutral
小会为什么还管这些？ # beat:c_inn_sword_6 # scene:v6_inn # cast:v6_lu,v6_su,v6_jue # speaker:you
差事叫护渡，不能光在干地上打一场。两队都记见习，误了试艺不抹掉已做的事。 # beat:c_inn_sword_7 # scene:v6_inn # cast:v6_lu,v6_su,v6_jue # speaker:v6_su # mood:v6_su=neutral
* [请书吏把停试与急难的规矩当众读清。 # cid:read_rules]
  ~ rule_known = true
  三个短音停试。去帮忙的人回来，不许被说成怯战。 # beat:c_inn_sword_8 # scene:v6_inn # cast:v6_lu,v6_su,v6_jue # speaker:you
  我给每队抄一份。写清楚，是省得事后各说各的。 # beat:c_inn_sword_9 # scene:v6_inn # cast:v6_gao,v6_lu,v6_su # speaker:v6_gao # mood:v6_gao=neutral
  -> charred_cake
* [先问路上的人手和缺口。 # cid:ask_routes]
  ~ rule_known = false
  哪队少会抬担架的人？哪队少能在岸上守绳的人？ # beat:c_inn_sword_10 # scene:v6_inn # cast:v6_gao,v6_lu,v6_su # speaker:you
  这才是我正要问的。两队各缺一个愿意在别人忙的时候留住手的人。 # beat:c_inn_sword_11 # scene:v6_inn # cast:v6_gao,v6_lu,v6_su # speaker:v6_su # mood:v6_su=intent
  -> charred_cake


=== inn_rival ===
刚才问敢不敢判出钱人输的，是你？ # beat:c_inn_rival_1 # scene:v6_inn # cast:v6_rong,v6_xu,v6_qiao # speaker:v6_rong # mood:v6_rong=neutral
容既白穿着干净长衫，背后伙计扛着两袋米。他手里却是一根磨白的棍。 # beat:c_inn_rival_2 # scene:v6_inn # cast:v6_rong,v6_xu,v6_qiao # speaker:narrator
他问得没错。你的名字排在头一场，谁知道是不是挑了软的。 # beat:c_inn_rival_3 # scene:v6_inn # cast:v6_rong,v6_xu,v6_qiao # speaker:v6_xu # mood:v6_xu=neutral
头场最早，打完我还得开仓。你若想换，现在就换。 # beat:c_inn_rival_4 # scene:v6_inn # cast:v6_rong,v6_xu,v6_qiao # speaker:v6_rong # mood:v6_rong=sharp
那你为什么捐米？ # beat:c_inn_rival_5 # scene:v6_inn # cast:v6_rong,v6_xu,v6_qiao # speaker:v6_qiao # mood:v6_qiao=neutral
仓门也是木头。水来了，我的米不会因为姓容就不湿。 # beat:c_inn_rival_6 # scene:v6_inn # cast:v6_rong,v6_xu,v6_qiao # speaker:v6_rong # mood:v6_rong=neutral
你想我们怎么跟你打？ # beat:c_inn_rival_7 # scene:v6_inn # cast:v6_rong,v6_xu,v6_qiao # speaker:you
想赢就真赢。别打到一半突然替我留脸。 # beat:c_inn_rival_8 # scene:v6_inn # cast:v6_rong,v6_xu,v6_qiao # speaker:v6_rong # mood:v6_rong=intent # fact:grain
* [约定真打，也要求他受伤就停。 # cid:rong_true]
  ~ rong_fair = true
  我不让，你也别把输了说成我们不识抬举。 # beat:c_inn_rival_9 # scene:v6_inn # cast:v6_rong,v6_xu,v6_qiao # speaker:you
  成交。邓苹，听见了？我输了不许先说棍子滑。 # beat:c_inn_rival_10 # scene:v6_inn # cast:v6_rong,v6_xu,v6_qiao # speaker:v6_rong # mood:v6_rong=amused
  -> inn_rain
* [暂不交好，只认同一条判线。 # cid:rong_distance]
  ~ rong_fair = false
  你有钱修坪，我没有。好坏都让场上的线说。 # beat:c_inn_rival_11 # scene:v6_inn # cast:v6_rong,v6_xu,v6_qiao # speaker:you
  可以。至少你肯把我算成对手，没有只算成一袋银子。 # beat:c_inn_rival_12 # scene:v6_inn # cast:v6_rong,v6_xu,v6_qiao # speaker:v6_rong # mood:v6_rong=calm
  -> inn_rain


=== inn_rain ===
夜雨敲着窗。杜汀叟一只耳朵贴在木柱上，何铆把酒碗从他肘下救开。 # beat:c_inn_rain_1 # scene:v6_inn # cast:v6_zhaoli,v6_du,v6_he # speaker:narrator
听河也别压我的桌子。桌腿刚补好。 # beat:c_inn_rain_2 # scene:v6_inn # cast:v6_zhaoli,v6_du,v6_he # speaker:v6_he # mood:v6_he=neutral
桥脚回水先退后涨，今年比前几年早。 # beat:c_inn_rain_3 # scene:v6_inn # cast:v6_zhaoli,v6_du,v6_he # speaker:v6_du # mood:v6_du=neutral
会场的人还在加棚。东堤要是真涨，他们来得及撤？ # beat:c_inn_rain_4 # scene:v6_inn # cast:v6_zhaoli,v6_du,v6_he # speaker:v6_zhaoli # mood:v6_zhaoli=uneasy
提前告诉他们。别到水上来了，才问要不要信老头。 # beat:c_inn_rain_5 # scene:v6_inn # cast:v6_zhaoli,v6_du,v6_he # speaker:v6_du # mood:v6_du=neutral
你也报了水队？ # beat:c_inn_rain_6 # scene:v6_inn # cast:v6_zhaoli,v6_du,v6_he # speaker:you
我领船，就得把人带回来。可这次我想让他们也记一次我的名字，不只写某船。 # beat:c_inn_rain_7 # scene:v6_inn # cast:v6_zhaoli,v6_du,v6_he # speaker:v6_zhaoli # mood:v6_zhaoli=neutral # fact:bank
* [把回水的征兆先报给主事。 # cid:warn_water]
  ~ warning = true
  谁嫌多事就让他嫌。写在会前，事后才没人装没听过。 # beat:c_inn_rain_8 # scene:v6_inn # cast:v6_zhaoli,v6_du,v6_he # speaker:you
  我陪你去。老杜说的话，也得有人把它送到听得见的地方。 # beat:c_inn_rain_9 # scene:v6_inn # cast:v6_zhaoli,v6_du,v6_he # speaker:v6_zhaoli # mood:v6_zhaoli=calm
  -> v6_books
* [先帮何铆把撤棚用的绳和木楔备好。 # cid:prepare_water]
  ~ warning = false
  ~ labor = true
  他们听不听，绳子都先备着。你量，我裁。 # beat:c_inn_rain_10 # scene:v6_inn # cast:v6_zhaoli,v6_du,v6_he # speaker:you
  那就动手。别把每条绳都剪短，留两根能跨沟的。 # beat:c_inn_rain_11 # scene:v6_inn # cast:v6_zhaoli,v6_du,v6_he # speaker:v6_he # mood:v6_he=neutral
  -> v6_books


=== departure ===
天没亮，陆队推车出镇，水队解缆离岸。两盏灯在雾里越隔越远。 # beat:c_departure_1 # scene:v6_depart # cast:v6_su,v6_zhaoli,v6_qiao # speaker:narrator
各自记得报平安。没有亲眼见过的事，回来慢慢问。 # beat:c_departure_2 # scene:v6_depart # cast:v6_su,v6_zhaoli,v6_qiao # speaker:v6_su # mood:v6_su=neutral
好。今天先把手里这段路走完。 # beat:c_departure_3 # scene:v6_depart # cast:v6_su,v6_zhaoli,v6_qiao # speaker:you
{
- route == 1:
-> ridge_load
- route == 2:
-> water_load
- else:
-> v6_stay_open
}


=== ridge_load ===
往前不远，再翻一个坡就是。 # beat:c_ridge_load_1 # scene:v6_ridge # cast:v6_pei,v6_fan,v6_ming # speaker:v6_fan # mood:v6_fan=neutral
你从渡口开始，已经说了五次一个坡。 # beat:c_ridge_load_2 # scene:v6_ridge # cast:v6_pei,v6_fan,v6_ming # speaker:v6_ming # mood:v6_ming=uneasy
他每次都没说错。错的是你每次都信最后一个。 # beat:c_ridge_load_3 # scene:v6_ridge # cast:v6_pei,v6_fan,v6_ming # speaker:v6_pei # mood:v6_pei=neutral
药车陷进湿泥，范遇把扁担垫在轮下，明栓护着新木剑，不知先放哪只手。 # beat:c_ridge_load_4 # scene:v6_ridge # cast:v6_pei,v6_fan,v6_ming # speaker:narrator
药箱不能淋，车也不能丢。先别一起往一边抬。 # beat:c_ridge_load_5 # scene:v6_ridge # cast:v6_pei,v6_fan,v6_ming # speaker:you
听你的。定谁发口令，别三个人各喊一二三。 # beat:c_ridge_load_6 # scene:v6_ridge # cast:v6_pei,v6_fan,v6_ming # speaker:v6_pei # mood:v6_pei=neutral
能喊慢一点最好。我气还没喘匀。 # beat:c_ridge_load_7 # scene:v6_ridge # cast:v6_pei,v6_fan,v6_ming # speaker:v6_fan # mood:v6_fan=neutral
* [卸下重箱，两人守药，两人推车。 # cid:load_unload]
  ~ supplies = true
  人多不是力就齐。先卸这一箱，我守着，谁也别单独离队。 # beat:c_ridge_load_8 # scene:v6_ridge # cast:v6_pei,v6_fan,v6_ming # speaker:you
  慢了一刻，手脚都还好。记住，赶路最怕把人赶散。 # beat:c_ridge_load_9 # scene:v6_ridge # cast:v6_pei,v6_fan,v6_ming # speaker:v6_pei # mood:v6_pei=calm
  -> ridge_toll
* [直接肩抬过坑，抢回赶路的时间。 # cid:load_shoulder]
  ~ wound = wound + 1
  我在这边，等范师傅喘匀。起—— # beat:c_ridge_load_10 # scene:v6_ridge # cast:v6_pei,v6_fan,v6_ming # speaker:you
  车轮抬过泥坑，你肩上也被压得发疼。一小段快路换来半路沉重。 # beat:c_ridge_load_11 # scene:v6_ridge # cast:v6_pei,v6_fan,v6_ming # speaker:narrator
  快了，但下个坡换人扛。别让一个人把队伍的力气先用完。 # beat:c_ridge_load_12 # scene:v6_ridge # cast:v6_pei,v6_fan,v6_ming # speaker:v6_pei # mood:v6_pei=neutral
  -> ridge_toll


=== ridge_toll ===
坡口有人拦道。许竞川用刀鞘压着一根横木，身后两名脚夫正吵谁踩坏了谁的竹筐。 # beat:c_ridge_toll_1 # scene:v6_ridge # cast:v6_xu,v6_fan,v6_pei # speaker:narrator
别笑，我不是收过路钱。横木下面有辆翻车，先别往前。 # beat:c_ridge_toll_2 # scene:v6_ridge # cast:v6_xu,v6_fan,v6_pei # speaker:v6_xu # mood:v6_xu=sharp
他们说我们车轮宽，压了路沿，得赔。 # beat:c_ridge_toll_3 # scene:v6_ridge # cast:v6_xu,v6_fan,v6_pei # speaker:v6_fan # mood:v6_fan=neutral
赔多少先看东西，不能一句有药就让所有人让路。 # beat:c_ridge_toll_4 # scene:v6_ridge # cast:v6_xu,v6_fan,v6_pei # speaker:v6_pei # mood:v6_pei=neutral
另一家也得靠路吃饭。 # beat:c_ridge_toll_5 # scene:v6_ridge # cast:v6_xu,v6_fan,v6_pei # speaker:you
我在这儿站半刻了。你们谁能先让他们把嗓门收回去？ # beat:c_ridge_toll_6 # scene:v6_ridge # cast:v6_xu,v6_fan,v6_pei # speaker:v6_xu # mood:v6_xu=neutral
* [先借扁担抬翻车，赔偿留姓名回头算。 # cid:toll_share]
  ~ bridge_help = true
  谁的东西谁记着。先把车抬正，别让下一辆也翻。 # beat:c_ridge_toll_7 # scene:v6_ridge # cast:v6_xu,v6_fan,v6_pei # speaker:you
  这句他们听得进。刀鞘借你撑底，我来抬。 # beat:c_ridge_toll_8 # scene:v6_ridge # cast:v6_xu,v6_fan,v6_pei # speaker:v6_xu # mood:v6_xu=calm
  -> ridge_lesson
* [请镖行出面定赔偿，自己守药车。 # cid:toll_road]
  ~ bridge_help = false
  我不懂路钱，裴领队谈。我守药，别谈到一半把正事忘了。 # beat:c_ridge_toll_9 # scene:v6_ridge # cast:v6_xu,v6_fan,v6_pei # speaker:you
  好。谁擅长什么，今天就先做什么。范遇，记下破筐的数。 # beat:c_ridge_toll_10 # scene:v6_ridge # cast:v6_xu,v6_fan,v6_pei # speaker:v6_pei # mood:v6_pei=neutral
  -> ridge_lesson


=== ridge_lesson ===
许兄，你这刀在平地逼得快，上斜坡也这么逼？ # beat:c_ridge_lesson_1 # scene:v6_ridge # cast:v6_lu,v6_su,v6_xu # speaker:v6_lu # mood:v6_lu=neutral
你要试，等我喘完。 # beat:c_ridge_lesson_2 # scene:v6_ridge # cast:v6_lu,v6_su,v6_xu # speaker:v6_xu # mood:v6_xu=neutral
你左脚踩在浮石上。陆汀舟问的不是你敢不敢。 # beat:c_ridge_lesson_3 # scene:v6_ridge # cast:v6_lu,v6_su,v6_xu # speaker:v6_su # mood:v6_su=neutral
金陵剑喜欢先把后来两手留住，我在山里得先问这一脚落不落得下。 # beat:c_ridge_lesson_4 # scene:v6_ridge # cast:v6_lu,v6_su,v6_xu # speaker:v6_lu # mood:v6_lu=neutral
你别替金陵下结论。留后手也不等于照着平地走。 # beat:c_ridge_lesson_5 # scene:v6_ridge # cast:v6_lu,v6_su,v6_xu # speaker:v6_su # mood:v6_su=sharp
那就把石头当石头，别先当门派。 # beat:c_ridge_lesson_6 # scene:v6_ridge # cast:v6_lu,v6_su,v6_xu # speaker:you
陆汀舟把浮石拨开，下面是一片雨水泡开的空土。 # beat:c_ridge_lesson_7 # scene:v6_ridge # cast:v6_lu,v6_su,v6_xu # speaker:narrator
* [照两人的说法各走一次，问清适用处。 # cid:terrain_study]
  ~ terrain = true
  平处留剑路，斜处先落脚。我想知道什么时候该换。 # beat:c_ridge_lesson_8 # scene:v6_ridge # cast:v6_lu,v6_su,v6_xu # speaker:you
  好问题。记的不是谁对，而是什么地方还能用。 # beat:c_ridge_lesson_9 # scene:v6_ridge # cast:v6_lu,v6_su,v6_xu # speaker:v6_su # mood:v6_su=calm
  这回我没话可抢，终于能吃口饼了。 # beat:c_ridge_lesson_10 # scene:v6_ridge # cast:v6_lu,v6_su,v6_xu # speaker:v6_lu # mood:v6_lu=amused
  -> ridge_rival
* [跟陆汀舟学斜坡抢位，放弃这次细记。 # cid:terrain_speed]
  ~ terrain = false
  ~ read = true
  先教我眼前这一下。下雨前要赶到桥头。 # beat:c_ridge_lesson_11 # scene:v6_ridge # cast:v6_lu,v6_su,v6_xu # speaker:you
  右肩别先转。人到稳处，再让剑跟上来。 # beat:c_ridge_lesson_12 # scene:v6_ridge # cast:v6_lu,v6_su,v6_xu # speaker:v6_lu # mood:v6_lu=neutral
  我把另一种写给你。赶路可以，别回来时说它没用。 # beat:c_ridge_lesson_13 # scene:v6_ridge # cast:v6_lu,v6_su,v6_xu # speaker:v6_su # mood:v6_su=neutral
  -> ridge_rival


=== ridge_rival ===
师兄，你护腕落下了。 # beat:c_ridge_rival_1 # scene:v6_ridge # cast:v6_xu,v6_yu,v6_lu # speaker:v6_yu # mood:v6_yu=neutral
不是落，是不要了。总往下滑。 # beat:c_ridge_rival_2 # scene:v6_ridge # cast:v6_xu,v6_yu,v6_lu # speaker:v6_xu # mood:v6_xu=sharp
那我扔了？ # beat:c_ridge_rival_3 # scene:v6_ridge # cast:v6_xu,v6_yu,v6_lu # speaker:v6_yu # mood:v6_yu=neutral
……先给我。 # beat:c_ridge_rival_4 # scene:v6_ridge # cast:v6_xu,v6_yu,v6_lu # speaker:v6_xu # mood:v6_xu=uneasy
好像也没那么不要。 # beat:c_ridge_rival_5 # scene:v6_ridge # cast:v6_xu,v6_yu,v6_lu # speaker:v6_lu # mood:v6_lu=amused
余枫退到树后。许竞川把护腕塞回去，半天才问你乔砚生的手怎么样。 # beat:c_ridge_rival_6 # scene:v6_ridge # cast:v6_xu,v6_yu,v6_lu # speaker:narrator
他不肯说，我也不追着问。可要是我上场把他打伤了，不算我占便宜？ # beat:c_ridge_rival_7 # scene:v6_ridge # cast:v6_xu,v6_yu,v6_lu # speaker:v6_xu # mood:v6_xu=neutral
* [告诉他腕伤事实，也说砚生有自己的打法。 # cid:rival_honest]
  ~ rival_trust = true
  有伤是真的。他会守，会挪，不会平白把胜场送你。 # beat:c_ridge_rival_8 # scene:v6_ridge # cast:v6_xu,v6_yu,v6_lu # speaker:you
  那就好。我也不会送他。他要我认真，就让他自己来讲。 # beat:c_ridge_rival_9 # scene:v6_ridge # cast:v6_xu,v6_yu,v6_lu # speaker:v6_xu # mood:v6_xu=calm
  -> road_shoes
* [保留同伴隐私，要求当面约定停手。 # cid:rival_private]
  ~ rival_trust = false
  那是他的事。你当面问他能不能打，别问我能不能替他输。 # beat:c_ridge_rival_10 # scene:v6_ridge # cast:v6_xu,v6_yu,v6_lu # speaker:you
  行。你倒护得明白，比一味说没事好。 # beat:c_ridge_rival_11 # scene:v6_ridge # cast:v6_xu,v6_yu,v6_lu # speaker:v6_xu # mood:v6_xu=intent
  -> road_shoes


=== ridge_supper ===
你们药箱里有退热的么？前村小孩昨夜烧起来了。 # beat:c_ridge_supper_1 # scene:v6_ridge # cast:v6_wei,v6_ling,v6_pei # speaker:v6_wei # mood:v6_wei=neutral
有。可原定送另一村的数也不能少，我得留单。 # beat:c_ridge_supper_2 # scene:v6_ridge # cast:v6_wei,v6_ling,v6_pei # speaker:v6_pei # mood:v6_pei=neutral
我先看人。你们别听一个烧字就把药倒出去。 # beat:c_ridge_supper_3 # scene:v6_ridge # cast:v6_wei,v6_ling,v6_pei # speaker:v6_ling # mood:v6_ling=neutral
魏葭想帮你搬箱，又缩回手。她指甲里都是赶路留下的黑泥。 # beat:c_ridge_supper_4 # scene:v6_ridge # cast:v6_wei,v6_ling,v6_pei # speaker:narrator
你走哪条路来的？ # beat:c_ridge_supper_5 # scene:v6_ridge # cast:v6_wei,v6_ling,v6_pei # speaker:you
旧桥。桥板空了两块，我趴着爬过来的。车过不去。 # beat:c_ridge_supper_6 # scene:v6_ridge # cast:v6_wei,v6_ling,v6_pei # speaker:v6_wei # mood:v6_wei=neutral
先停。问清楚，再动。 # beat:c_ridge_supper_7 # scene:v6_ridge # cast:v6_wei,v6_ling,v6_pei # speaker:v6_pei # mood:v6_pei=intent
* [请凌苇分诊，匀药并留下补送记录。 # cid:medicine_share]
  ~ medicine = true
  先救能救的，不让另一村被悄悄欠下。差的数我去报。 # beat:c_ridge_supper_8 # scene:v6_ridge # cast:v6_wei,v6_ling,v6_pei # speaker:you
  好。我要的是有人记着，不是逼孩子等册子写完。 # beat:c_ridge_supper_9 # scene:v6_ridge # cast:v6_wei,v6_ling,v6_pei # speaker:v6_ling # mood:v6_ling=calm
  -> bridge_arrive
* [派一人带凌苇先行，自己护住整车。 # cid:medicine_send]
  ~ medicine = false
  药由你用，余数回来对。我留在车边，不让第二头也出岔。 # beat:c_ridge_supper_10 # scene:v6_ridge # cast:v6_wei,v6_ling,v6_pei # speaker:you
  可以。不是所有人都得冲到人前。守得住这车，也是护送。 # beat:c_ridge_supper_11 # scene:v6_ridge # cast:v6_wei,v6_ling,v6_pei # speaker:v6_pei # mood:v6_pei=neutral
  -> bridge_arrive


=== bridge_arrive ===
断雨桥只有半边能走。何铆踩着桥桩敲木板，桥下传来一个孩子的哭声。 # beat:c_bridge_arrive_1 # scene:v6_bridge # cast:v6_pei,v6_he,v6_ming # speaker:narrator
不是塌了，是有人拿旧板补新洞，底下的撑木烂透了。 # beat:c_bridge_arrive_2 # scene:v6_bridge # cast:v6_pei,v6_he,v6_ming # speaker:v6_he # mood:v6_he=neutral
那我们刚才站的—— # beat:c_bridge_arrive_3 # scene:v6_bridge # cast:v6_pei,v6_he,v6_ming # speaker:v6_ming # mood:v6_ming=surprised
别跳！慢慢退！ # beat:c_bridge_arrive_4 # scene:v6_bridge # cast:v6_pei,v6_he,v6_ming # speaker:v6_he # mood:v6_he=sharp
桥下是拾柴的，卡在横梁边。水还没到胸，雨再来就难说。 # beat:c_bridge_arrive_5 # scene:v6_bridge # cast:v6_pei,v6_he,v6_ming # speaker:v6_pei # mood:v6_pei=neutral
你为什么先上桥？ # beat:c_bridge_arrive_6 # scene:v6_bridge # cast:v6_pei,v6_he,v6_ming # speaker:you
因为你们会看剑，不会看木头。我也得来一趟。 # beat:c_bridge_arrive_7 # scene:v6_bridge # cast:v6_pei,v6_he,v6_ming # speaker:v6_he # mood:v6_he=neutral # fact:cross
* {rope} [把绳固定在活树，先试受力再下人。 # cid:bridge_anchor]
  ~ bridge_safe = true
  桥本身不稳，不能再把人的命系桥上。树根在这边。 # beat:c_bridge_arrive_8 # scene:v6_bridge # cast:v6_pei,v6_he,v6_ming # speaker:you
  这个位置对。我看结，你们一人试拉，别一起上。 # beat:c_bridge_arrive_9 # scene:v6_bridge # cast:v6_pei,v6_he,v6_ming # speaker:v6_he # mood:v6_he=intent
  -> bridge_guard
* [请何铆掌绳，自己清桥头围观的人。 # cid:bridge_expert]
  ~ bridge_safe = true
  你来管绳。我让上头空出路，不再有人踩坏下一块。 # beat:c_bridge_arrive_10 # scene:v6_bridge # cast:v6_pei,v6_he,v6_ming # speaker:you
  好。不是说不会就算完了，站住你会的那个位置。 # beat:c_bridge_arrive_11 # scene:v6_bridge # cast:v6_pei,v6_he,v6_ming # speaker:v6_he # mood:v6_he=neutral
  -> bridge_guard
* [抢先踩梁下去，省去等绳的工夫。 # cid:bridge_jump]
  ~ bridge_safe = false
  ~ wound = wound + 1
  湿木往下沉了一截，你撞上桥桩，肋边一疼。何铆及时把绳抛过来。 # beat:c_bridge_arrive_12 # scene:v6_bridge # cast:v6_pei,v6_he,v6_ming # speaker:narrator
  抓住！省下的工夫现在得两个人来赔！ # beat:c_bridge_arrive_13 # scene:v6_bridge # cast:v6_pei,v6_he,v6_ming # speaker:v6_he # mood:v6_he=sharp
  -> bridge_guard


=== bridge_guard ===
后面的车催着过，说药车能等，他们的菜不能等。 # beat:c_bridge_guard_1 # scene:v6_bridge # cast:v6_xu,v6_fan,v6_pei # speaker:v6_fan # mood:v6_fan=neutral
再推一次，我就—— # beat:c_bridge_guard_2 # scene:v6_bridge # cast:v6_xu,v6_fan,v6_pei # speaker:v6_xu # mood:v6_xu=sharp
你就怎样？把他们砍倒，车自己往回走？ # beat:c_bridge_guard_3 # scene:v6_bridge # cast:v6_xu,v6_fan,v6_pei # speaker:v6_pei # mood:v6_pei=neutral
带头的脚夫抬起扁担。桥头只有两步宽，你不用赢他，得让后面的人停下来。 # beat:c_bridge_guard_4 # scene:v6_bridge # cast:v6_xu,v6_fan,v6_pei # speaker:narrator
先叫车轮别动。许竞川，刀别出鞘。 # beat:c_bridge_guard_5 # scene:v6_bridge # cast:v6_xu,v6_fan,v6_pei # speaker:you
我守右边。你别往桥洞里退。 # beat:c_bridge_guard_6 # scene:v6_bridge # cast:v6_xu,v6_fan,v6_pei # speaker:v6_xu # mood:v6_xu=intent
扁担从斜上扫下，打的不是你，是顶住车轮的木楔。 # beat:c_bridge_guard_7 # scene:v6_bridge # cast:v6_xu,v6_fan,v6_pei # speaker:narrator
{
- bridge_help:
坡口你帮我把车扶正，这会儿扁担也借你。放心，新的，我试过受力。 # beat:c_bridge_guard_8 # scene:v6_bridge # cast:v6_xu,v6_fan,v6_pei # speaker:v6_fan # mood:v6_fan=neutral
- else:
你在坡口没抢着谈路钱，现在也别抢着跟所有人讲理。守住这头，我去叫车停。 # beat:c_bridge_guard_9 # scene:v6_bridge # cast:v6_xu,v6_fan,v6_pei # speaker:v6_fan # mood:v6_fan=neutral
}
* {terrain or read} [贴近车轴，护木楔而不抢扁担。 # cid:guard_wedge]
  ~ guard = true
  你贴车轴蹲低，扁担落在实木上，震得对方虎口发麻。车轮没有越线。 # beat:c_bridge_guard_10 # scene:v6_bridge # cast:v6_xu,v6_fan,v6_pei # speaker:narrator
  就这样！撑三息，裴领队已经过去了。 # beat:c_bridge_guard_11 # scene:v6_bridge # cast:v6_xu,v6_fan,v6_pei # speaker:v6_xu # mood:v6_xu=intent
  -> bridge_endure
* [认下延期的损失，让脚夫先看桥下。 # cid:guard_talk]
  ~ guard = true
  ~ debt = true
  菜坏了记我账。先看下面，那个人比你这筐菜先落水。 # beat:c_bridge_guard_12 # scene:v6_bridge # cast:v6_xu,v6_fan,v6_pei # speaker:you
  对方低头，扁担终于垂下。你没赢一招，桥头却空了出来。 # beat:c_bridge_guard_13 # scene:v6_bridge # cast:v6_xu,v6_fan,v6_pei # speaker:narrator
  -> bridge_endure
* [正面接扁担，硬守三息。 # cid:guard_meet]
  ~ guard = false
  ~ wound = wound + 1
  扁担压得你手臂发颤。第三息将尽，许竞川用刀鞘撑住你的肘。 # beat:c_bridge_guard_14 # scene:v6_bridge # cast:v6_xu,v6_fan,v6_pei # speaker:narrator
  别跟木头比硬！我顶住了，松半分！ # beat:c_bridge_guard_15 # scene:v6_bridge # cast:v6_xu,v6_fan,v6_pei # speaker:v6_xu # mood:v6_xu=sharp
  -> bridge_endure


=== bridge_endure ===
桥下的小孩顺绳爬上来，怀里还抱着一捆湿柴。明栓想接，先被他躲开。 # beat:c_bridge_endure_1 # scene:v6_bridge # cast:v6_he,v6_ming,v6_pei # speaker:narrator
我不抢你的。你松手，我给你捆紧。 # beat:c_bridge_endure_2 # scene:v6_bridge # cast:v6_he,v6_ming,v6_pei # speaker:v6_ming # mood:v6_ming=uneasy
过桥的人少一半，桥的命就长一半。先抬药，人分开走。 # beat:c_bridge_endure_3 # scene:v6_bridge # cast:v6_he,v6_ming,v6_pei # speaker:v6_he # mood:v6_he=neutral
我们迟了大半日。赶回去也许就错过第一轮。 # beat:c_bridge_endure_4 # scene:v6_bridge # cast:v6_he,v6_ming,v6_pei # speaker:v6_pei # mood:v6_pei=neutral
那还赶么？ # beat:c_bridge_endure_5 # scene:v6_bridge # cast:v6_he,v6_ming,v6_pei # speaker:you
赶。但不拿第二个孩子的命换。你想选什么，现在说。 # beat:c_bridge_endure_6 # scene:v6_bridge # cast:v6_he,v6_ming,v6_pei # speaker:v6_pei # mood:v6_pei=neutral
雨打在刚补好的木板上，每一块都能听见不同的空响。 # beat:c_bridge_endure_7 # scene:v6_bridge # cast:v6_he,v6_ming,v6_pei # speaker:narrator
* [把最后一箱送入村，接受迟到。 # cid:escort_finish]
  ~ escort = true
  人没进屋就还没送完。迟到写在我名下。 # beat:c_bridge_endure_8 # scene:v6_bridge # cast:v6_he,v6_ming,v6_pei # speaker:you
  写全队。不要一个人抢着做欠账的人。 # beat:c_bridge_endure_9 # scene:v6_bridge # cast:v6_he,v6_ming,v6_pei # speaker:v6_pei # mood:v6_pei=calm
  -> bridge_letter
* [自己先回报信，由镖队完成最后一程。 # cid:escort_split]
  ~ escort = false
  我回去报桥坏和迟到，你们送药。会场不能只看见我们缺席。 # beat:c_bridge_endure_10 # scene:v6_bridge # cast:v6_he,v6_ming,v6_pei # speaker:you
  好。回程别抄近路。你带的是消息，不是逃跑的理由。 # beat:c_bridge_endure_11 # scene:v6_bridge # cast:v6_he,v6_ming,v6_pei # speaker:v6_pei # mood:v6_pei=neutral
  -> bridge_letter


=== bridge_letter ===
我会记：桥头停争、护车、救人。这不是替迟到找借口。 # beat:c_bridge_letter_1 # scene:v6_bridge # cast:v6_su,v6_lu,v6_pei # speaker:v6_su # mood:v6_su=neutral
也别把你挨了一扁担，记成胜十名壮汉。 # beat:c_bridge_letter_2 # scene:v6_bridge # cast:v6_su,v6_lu,v6_pei # speaker:v6_lu # mood:v6_lu=neutral
你再说，我就把你藏了两块饼写进去。 # beat:c_bridge_letter_3 # scene:v6_bridge # cast:v6_su,v6_lu,v6_pei # speaker:you
那可是救急的饼。 # beat:c_bridge_letter_4 # scene:v6_bridge # cast:v6_su,v6_lu,v6_pei # speaker:v6_lu # mood:v6_lu=surprised
救你的急，还是救我们看你挨饿的急？ # beat:c_bridge_letter_5 # scene:v6_bridge # cast:v6_su,v6_lu,v6_pei # speaker:v6_pei # mood:v6_pei=amused
笑声里，你才发现人人都湿透了。苏晚澄把册子藏进油布，自己的袖子却滴着水。 # beat:c_bridge_letter_6 # scene:v6_bridge # cast:v6_su,v6_lu,v6_pei # speaker:narrator
回去以后，谁问陆路容易，你自己讲。别把他们那条河也讲完。 # beat:c_bridge_letter_7 # scene:v6_bridge # cast:v6_su,v6_lu,v6_pei # speaker:v6_su # mood:v6_su=neutral
* [要求记录里加上木匠和脚夫的姓名。 # cid:record_people]
  ~ credit = true
  没有何铆的结、范遇的扁担，我们这几柄剑有什么用？ # beat:c_bridge_letter_8 # scene:v6_bridge # cast:v6_su,v6_lu,v6_pei # speaker:you
  已经写了。不过你提醒得对，下次由他们自己说名字。 # beat:c_bridge_letter_9 # scene:v6_bridge # cast:v6_su,v6_lu,v6_pei # speaker:v6_su # mood:v6_su=calm
  -> workshop_gate
* [先记延误与损失，免得两村互相埋怨。 # cid:record_cost]
  ~ credit = false
  好事不急着领。药少了多少、菜坏了多少，先说清楚。 # beat:c_bridge_letter_10 # scene:v6_bridge # cast:v6_su,v6_lu,v6_pei # speaker:you
  我回去对账。你没把这事只当一场好看的救人。 # beat:c_bridge_letter_11 # scene:v6_bridge # cast:v6_su,v6_lu,v6_pei # speaker:v6_pei # mood:v6_pei=neutral
  -> workshop_gate


=== water_load ===
你是昨晚说自己肩膀能扛的？上船先把肩膀放松。 # beat:c_water_load_1 # scene:v6_reeds # cast:v6_zhaoli,v6_du,v6_cheng # speaker:v6_cheng # mood:v6_cheng=neutral
程阿笠，管桨。别看她比你小，船上你得听她。 # beat:c_water_load_2 # scene:v6_reeds # cast:v6_zhaoli,v6_du,v6_cheng # speaker:v6_zhaoli # mood:v6_zhaoli=neutral
绳解哪一根，先问。最显眼的那根，往往不是最该解的。 # beat:c_water_load_3 # scene:v6_reeds # cast:v6_zhaoli,v6_du,v6_cheng # speaker:v6_du # mood:v6_du=neutral
船头药箱放得高，米袋压在一边。船离岸半尺，便往左沉了一点。 # beat:c_water_load_4 # scene:v6_reeds # cast:v6_zhaoli,v6_du,v6_cheng # speaker:narrator
这样装一路，会不会越来越偏？ # beat:c_water_load_5 # scene:v6_reeds # cast:v6_zhaoli,v6_du,v6_cheng # speaker:you
会。现在改，还是到汊口再改？岸上等着咱们的还有两袋。 # beat:c_water_load_6 # scene:v6_reeds # cast:v6_zhaoli,v6_du,v6_cheng # speaker:v6_zhaoli # mood:v6_zhaoli=intent
* [重排药米，让最怕湿的箱子居中。 # cid:balance_load]
  ~ supplies = true
  药先居中，重米分两边。后上的两袋另找低位。 # beat:c_water_load_7 # scene:v6_reeds # cast:v6_zhaoli,v6_du,v6_cheng # speaker:you
  我帮你挪。慢一会儿，总比在河心追箱子强。 # beat:c_water_load_8 # scene:v6_reeds # cast:v6_zhaoli,v6_du,v6_cheng # speaker:v6_cheng # mood:v6_cheng=calm
  -> water_oars
* [多带两袋，自己一路负责压住偏重。 # cid:load_more]
  ~ supplies = false
  ~ labor = true
  带上。我坐右边压着，到了汊口再搬。 # beat:c_water_load_9 # scene:v6_reeds # cast:v6_zhaoli,v6_du,v6_cheng # speaker:you
  可以，但这不是你坐到最后的保证。水变了，得听口令换位。 # beat:c_water_load_10 # scene:v6_reeds # cast:v6_zhaoli,v6_du,v6_cheng # speaker:v6_zhaoli # mood:v6_zhaoli=neutral
  -> water_oars


=== water_oars ===
程阿笠的桨划得不快，每次入水却都留一点斜角。你一用力，船头反而横了。 # beat:c_water_oars_1 # scene:v6_reeds # cast:v6_du,v6_cheng,v6_zhaoli # speaker:narrator
先停！你划得有力，我改方向就得多一倍力。 # beat:c_water_oars_2 # scene:v6_reeds # cast:v6_du,v6_cheng,v6_zhaoli # speaker:v6_cheng # mood:v6_cheng=sharp
我以为快一点就不耽误你。 # beat:c_water_oars_3 # scene:v6_reeds # cast:v6_du,v6_cheng,v6_zhaoli # speaker:you
你要是往灶里倒一缸水，也不能说是帮着煮饭。 # beat:c_water_oars_4 # scene:v6_reeds # cast:v6_du,v6_cheng,v6_zhaoli # speaker:v6_du # mood:v6_du=amused
老杜一开口，船都饿了。阿笠教他，我看前头。 # beat:c_water_oars_5 # scene:v6_reeds # cast:v6_du,v6_cheng,v6_zhaoli # speaker:v6_zhaoli # mood:v6_zhaoli=neutral
桨不是棍。你感觉一下，水往哪边带，不用先赢它。 # beat:c_water_oars_6 # scene:v6_reeds # cast:v6_du,v6_cheng,v6_zhaoli # speaker:v6_cheng # mood:v6_cheng=neutral
芦苇扫过船舷，水里没有坪上那种固定的中线。 # beat:c_water_oars_7 # scene:v6_reeds # cast:v6_du,v6_cheng,v6_zhaoli # speaker:narrator
* [收力跟阿笠的节奏，学控制方向。 # cid:oar_listen]
  ~ water_read = true
  你喊一次，我走一次。别为了给我面子说对了。 # beat:c_water_oars_8 # scene:v6_reeds # cast:v6_du,v6_cheng,v6_zhaoli # speaker:you
  第二下对了，第一下没有。你肯听，已经少走半个圈。 # beat:c_water_oars_9 # scene:v6_reeds # cast:v6_du,v6_cheng,v6_zhaoli # speaker:v6_cheng # mood:v6_cheng=calm
  -> water_net
* [把桨还给熟手，自己守住货绳。 # cid:oar_rope]
  ~ water_read = false
  ~ rope = true
  我今天划不好，先不添乱。哪根绳要留活口？ # beat:c_water_oars_10 # scene:v6_reeds # cast:v6_du,v6_cheng,v6_zhaoli # speaker:you
  人手够就不用人人会划。来，指给我看，哪根不能死勒。 # beat:c_water_oars_11 # scene:v6_reeds # cast:v6_du,v6_cheng,v6_zhaoli # speaker:v6_du # mood:v6_du=neutral
  -> water_net


=== water_net ===
姑娘，前头网兜里卡了一根大枝，水越冲越紧，我一个人提不起来。 # beat:c_water_net_1 # scene:v6_reeds # cast:v6_zhaoli,v6_po,v6_du # speaker:v6_po # mood:v6_po=neutral
这张网挡着副汊，我们不拆就得绕到主流。 # beat:c_water_net_2 # scene:v6_reeds # cast:v6_zhaoli,v6_po,v6_du # speaker:v6_zhaoli # mood:v6_zhaoli=uneasy
拆了，我这半月的菜钱就没了。 # beat:c_water_net_3 # scene:v6_reeds # cast:v6_zhaoli,v6_po,v6_du # speaker:v6_po # mood:v6_po=neutral
不是鱼钱？ # beat:c_water_net_4 # scene:v6_reeds # cast:v6_zhaoli,v6_po,v6_du # speaker:you
鱼也吃菜呀？是拿鱼换菜。你们年轻人别笑，我算得清。 # beat:c_water_net_5 # scene:v6_reeds # cast:v6_zhaoli,v6_po,v6_du # speaker:v6_po # mood:v6_po=neutral
水还没大，能慢慢解。可会误到白苇村送药的时辰。 # beat:c_water_net_6 # scene:v6_reeds # cast:v6_zhaoli,v6_po,v6_du # speaker:v6_du # mood:v6_du=neutral
网绳已绷出细响，断在水里，比割在手上更难捞。 # beat:c_water_net_7 # scene:v6_reeds # cast:v6_zhaoli,v6_po,v6_du # speaker:narrator
* [割开一角保船，留下赔网的承诺。 # cid:net_cut]
  ~ net_cut = true
  ~ debt = true
  网我赔。先开一角，断绳别放进水里。 # beat:c_water_net_8 # scene:v6_reeds # cast:v6_zhaoli,v6_po,v6_du # speaker:you
  你记得回来。说赔网的人，往往游得比鱼还远。 # beat:c_water_net_9 # scene:v6_reeds # cast:v6_zhaoli,v6_po,v6_du # speaker:v6_po # mood:v6_po=uneasy
  我作证。青蒲渡找我，不让你只追一个路过的人。 # beat:c_water_net_10 # scene:v6_reeds # cast:v6_zhaoli,v6_po,v6_du # speaker:v6_zhaoli # mood:v6_zhaoli=neutral
  -> marsh_lantern
* [靠岸慢慢解，不把老人的生计扔掉。 # cid:net_untie]
  ~ net_cut = false
  药怕晚，网也不能说没就没。我们一起解，能省一点是一点。 # beat:c_water_net_11 # scene:v6_reeds # cast:v6_zhaoli,v6_po,v6_du # speaker:you
  我稳住船。阿笠递刀，别割，先挑那处结。 # beat:c_water_net_12 # scene:v6_reeds # cast:v6_zhaoli,v6_po,v6_du # speaker:v6_du # mood:v6_du=neutral
  -> marsh_lantern


=== water_healer ===
白苇村的药棚比你想得小。觉茂正用门板搭床，凌苇卷着袖子在水里洗手。 # beat:c_water_healer_1 # scene:v6_reeds # cast:v6_ling,v6_jue,v6_zhaoli # speaker:narrator
药到了？先放干处，别一进门都问我有没有救。 # beat:c_water_healer_2 # scene:v6_reeds # cast:v6_ling,v6_jue,v6_zhaoli # speaker:v6_ling # mood:v6_ling=neutral
有个老人不肯吃，说省给孩子。 # beat:c_water_healer_3 # scene:v6_reeds # cast:v6_ling,v6_jue,v6_zhaoli # speaker:v6_jue # mood:v6_jue=neutral
他的病不是孩子那一种。药省错了，两个都耽误。 # beat:c_water_healer_4 # scene:v6_reeds # cast:v6_ling,v6_jue,v6_zhaoli # speaker:v6_ling # mood:v6_ling=sharp
我帮什么？ # beat:c_water_healer_5 # scene:v6_reeds # cast:v6_ling,v6_jue,v6_zhaoli # speaker:you
坐下听他们说完。别把所有人都听成同一种病。 # beat:c_water_healer_6 # scene:v6_reeds # cast:v6_ling,v6_jue,v6_zhaoli # speaker:v6_ling # mood:v6_ling=neutral
她忙的时候最凶，等会儿她记不得自己没喝水，你得凶回去。 # beat:c_water_healer_7 # scene:v6_reeds # cast:v6_ling,v6_jue,v6_zhaoli # speaker:v6_zhaoli # mood:v6_zhaoli=neutral
* [留在药棚帮分诊记人，听凌苇安排。 # cid:medicine_listen]
  ~ medicine = true
  一个一个说。我写得慢，别替旁边那位抢话。 # beat:c_water_healer_8 # scene:v6_reeds # cast:v6_ling,v6_jue,v6_zhaoli # speaker:you
  这样好。人不是药箱上一个数，问清楚才能往下做。 # beat:c_water_healer_9 # scene:v6_reeds # cast:v6_ling,v6_jue,v6_zhaoli # speaker:v6_ling # mood:v6_ling=calm
  -> water_change
* [帮觉茂加固门板床，照鲤去问诊。 # cid:medicine_boat]
  ~ medicine = false
  ~ labor = true
  名字你们问。我把床抬高，夜里涨水别让人睡水上。 # beat:c_water_healer_10 # scene:v6_reeds # cast:v6_ling,v6_jue,v6_zhaoli # speaker:you
  劳烦。木楔放那儿，不用剑来削，削歪了还得补。 # beat:c_water_healer_11 # scene:v6_reeds # cast:v6_ling,v6_jue,v6_zhaoli # speaker:v6_jue # mood:v6_jue=neutral
  -> water_change


=== water_change ===
回程时，来路的苇根露出更多。杜汀叟忽然叫住了准备解缆的照鲤。 # beat:c_water_change_1 # scene:v6_reeds # cast:v6_du,v6_zhaoli,v6_cheng # speaker:narrator
不是退潮。回水在借低处走，等前头一满，这里就会涨得更快。 # beat:c_water_change_2 # scene:v6_reeds # cast:v6_du,v6_zhaoli,v6_cheng # speaker:v6_du # mood:v6_du=intent
去旧桩湾等一夜？那就耽误头场。 # beat:c_water_change_3 # scene:v6_reeds # cast:v6_du,v6_zhaoli,v6_cheng # speaker:v6_zhaoli # mood:v6_zhaoli=neutral
我听杜师傅的。水声不对，船底都空。 # beat:c_water_change_4 # scene:v6_reeds # cast:v6_du,v6_zhaoli,v6_cheng # speaker:v6_cheng # mood:v6_cheng=neutral
你想回去试艺，不只是想领船的工钱吧？ # beat:c_water_change_5 # scene:v6_reeds # cast:v6_du,v6_zhaoli,v6_cheng # speaker:you
我想他们写江照鲤。不是某人带来的一条船。可我也不能拿阿笠替我赌。 # beat:c_water_change_6 # scene:v6_reeds # cast:v6_du,v6_zhaoli,v6_cheng # speaker:v6_zhaoli # mood:v6_zhaoli=uneasy
* [进旧桩湾等水，接受错过头场。 # cid:water_wait]
  ~ wait_tide = true
  晚一点到，名字还在。人少一个，写再大也没用。 # beat:c_water_change_7 # scene:v6_reeds # cast:v6_du,v6_zhaoli,v6_cheng # speaker:you
  好。我去报晚，不让你替我背。阿笠，转桨。 # beat:c_water_change_8 # scene:v6_reeds # cast:v6_du,v6_zhaoli,v6_cheng # speaker:v6_zhaoli # mood:v6_zhaoli=calm
  -> night_moor
* [沿岸试探一段，发现不对立即入湾。 # cid:water_probe]
  ~ wait_tide = false
  不进主流，探到第三根桩就停。你定什么叫不对，现在说清。 # beat:c_water_change_9 # scene:v6_reeds # cast:v6_du,v6_zhaoli,v6_cheng # speaker:you
  船尾先空，桨声两下不接，就退。不是等看见浪才说不对。 # beat:c_water_change_10 # scene:v6_reeds # cast:v6_du,v6_zhaoli,v6_cheng # speaker:v6_du # mood:v6_du=neutral
  -> night_moor


=== night_moor ===
旧桩湾黑得只剩船灯。一艘小渔船被回流顶上旧桩，船上有人举着空盆敲。 # beat:c_night_moor_1 # scene:v6_rainboat # cast:v6_zhaoli,v6_du,v6_cheng # speaker:narrator
那桩有半截在水里，船一转就穿底！ # beat:c_night_moor_2 # scene:v6_rainboat # cast:v6_zhaoli,v6_du,v6_cheng # speaker:v6_cheng # mood:v6_cheng=surprised
我们过去也会被顶住。得先把他们的人转出来。 # beat:c_night_moor_3 # scene:v6_rainboat # cast:v6_zhaoli,v6_du,v6_cheng # speaker:v6_zhaoli # mood:v6_zhaoli=neutral
主绳别直牵，直牵两条船就会一起横。 # beat:c_night_moor_4 # scene:v6_rainboat # cast:v6_zhaoli,v6_du,v6_cheng # speaker:v6_du # mood:v6_du=neutral
你叫我守哪边？ # beat:c_night_moor_5 # scene:v6_rainboat # cast:v6_zhaoli,v6_du,v6_cheng # speaker:you
岸绳。可我要过去接人，你要能说不行，不许只会说小心。 # beat:c_night_moor_6 # scene:v6_rainboat # cast:v6_zhaoli,v6_du,v6_cheng # speaker:v6_zhaoli # mood:v6_zhaoli=intent
她把红绳的另一端交进你手心，没有回头。 # beat:c_night_moor_7 # scene:v6_rainboat # cast:v6_zhaoli,v6_du,v6_cheng # speaker:narrator # cg:rescue
* {rope or water_read} [用斜牵线靠活树，让船头有转向余地。 # cid:night_angle]
  ~ night_safe = true
  你先等等。树到船尾，绳留这个角，别直撞过去。 # beat:c_night_moor_8 # scene:v6_rainboat # cast:v6_zhaoli,v6_du,v6_cheng # speaker:you
  对。我压船尾，照鲤走绳内侧，别给绳勒住脚。 # beat:c_night_moor_9 # scene:v6_rainboat # cast:v6_zhaoli,v6_du,v6_cheng # speaker:v6_du # mood:v6_du=intent
  -> night_decide
* [请老杜定绳角，自己照口令逐次放绳。 # cid:night_order]
  ~ night_safe = true
  我不猜。杜师傅，你喊放多少，我放多少。 # beat:c_night_moor_10 # scene:v6_rainboat # cast:v6_zhaoli,v6_du,v6_cheng # speaker:you
  一臂。停。再半臂。别怕慢，怕的就是你忽然替我快一下。 # beat:c_night_moor_11 # scene:v6_rainboat # cast:v6_zhaoli,v6_du,v6_cheng # speaker:v6_du # mood:v6_du=neutral
  -> night_decide
* [先拉紧绳，尽快把照鲤送到对船。 # cid:night_pull]
  ~ night_safe = false
  ~ wound = wound + 1
  绳猛地压住手腕，两船一起偏转。照鲤伏倒在舷边，杜汀叟的篙抵住旧桩。 # beat:c_night_moor_12 # scene:v6_rainboat # cast:v6_zhaoli,v6_du,v6_cheng # speaker:narrator
  松！半臂！你是在救人，不是在拔河！ # beat:c_night_moor_13 # scene:v6_rainboat # cast:v6_zhaoli,v6_du,v6_cheng # speaker:v6_du # mood:v6_du=sharp
  -> night_decide


=== night_decide ===
船上还有个大箱子！里头是我娘攒的布，不拿就都没了！ # beat:c_night_decide_1 # scene:v6_rainboat # cast:v6_zhaoli,v6_liu,v6_cheng # speaker:v6_liu # mood:v6_liu=neutral
人先过来，箱子我替你拴住！ # beat:c_night_decide_2 # scene:v6_rainboat # cast:v6_zhaoli,v6_liu,v6_cheng # speaker:v6_zhaoli # mood:v6_zhaoli=sharp
你们走了，谁还记得一箱布？ # beat:c_night_decide_3 # scene:v6_rainboat # cast:v6_zhaoli,v6_liu,v6_cheng # speaker:v6_liu # mood:v6_liu=neutral
船底开始进水。照鲤伸出的手悬在半途，阿笠咬牙把空盆递给船上另一个人。 # beat:c_night_decide_4 # scene:v6_rainboat # cast:v6_zhaoli,v6_liu,v6_cheng # speaker:narrator
盆拿去舀水。布箱不能挡门！ # beat:c_night_decide_5 # scene:v6_rainboat # cast:v6_zhaoli,v6_liu,v6_cheng # speaker:v6_cheng # mood:v6_cheng=neutral
他说的不是价钱，是以后怎么办。 # beat:c_night_decide_6 # scene:v6_rainboat # cast:v6_zhaoli,v6_liu,v6_cheng # speaker:you
那你替我告诉他，以后还有人来。现在先把手给我。 # beat:c_night_decide_7 # scene:v6_rainboat # cast:v6_zhaoli,v6_liu,v6_cheng # speaker:v6_zhaoli # mood:v6_zhaoli=neutral
* [答应回来捞布，明确写下船号与地点。 # cid:cloth_promise]
  ~ cloth = true
  我记住这根断桩。天亮以后我们一起回来，不让你一个人找。 # beat:c_night_decide_8 # scene:v6_rainboat # cast:v6_zhaoli,v6_liu,v6_cheng # speaker:you
  ……船号叫小蓬。你别只记船号，记我叫刘篙。 # beat:c_night_decide_9 # scene:v6_rainboat # cast:v6_zhaoli,v6_liu,v6_cheng # speaker:v6_liu # mood:v6_liu=uneasy
  刘篙，抓住！ # beat:c_night_decide_10 # scene:v6_rainboat # cast:v6_zhaoli,v6_liu,v6_cheng # speaker:v6_zhaoli # mood:v6_zhaoli=intent
  -> night_fire
* [不许救不了的诺，直说只保得住人。 # cid:cloth_truth]
  ~ cloth = false
  我不能保证布还在。但你娘要等回去的人，是你。 # beat:c_night_decide_11 # scene:v6_rainboat # cast:v6_zhaoli,v6_liu,v6_cheng # speaker:you
  刘篙低头看了一眼，终于跨过船舷。照鲤没替你说一句好听的，只把他的手抓牢。 # beat:c_night_decide_12 # scene:v6_rainboat # cast:v6_zhaoli,v6_liu,v6_cheng # speaker:narrator
  -> night_fire


=== night_fire ===
火别靠帆，帆浸过油。你们要烤衣，到这边来。 # beat:c_night_fire_1 # scene:v6_rainboat # cast:v6_zhaoli,v6_du,v6_bo # speaker:v6_bo # mood:v6_bo=neutral
钓客薄远掀开岸棚。小火上架着一只黑锅，里面只有几片老姜。 # beat:c_night_fire_2 # scene:v6_rainboat # cast:v6_zhaoli,v6_du,v6_bo # speaker:narrator
我刚才是不是太急？老杜明明让我等。 # beat:c_night_fire_3 # scene:v6_rainboat # cast:v6_zhaoli,v6_du,v6_bo # speaker:v6_zhaoli # mood:v6_zhaoli=uneasy
急得对不对，要看你急的时候有没有听见别人。不是今天救到了，就每回都这么救。 # beat:c_night_fire_4 # scene:v6_rainboat # cast:v6_zhaoli,v6_du,v6_bo # speaker:v6_du # mood:v6_du=neutral
你刚才听见我了。 # beat:c_night_fire_5 # scene:v6_rainboat # cast:v6_zhaoli,v6_du,v6_bo # speaker:you
听见了。平时别人只说船上的事你作主，作坏了也你自己认。 # beat:c_night_fire_6 # scene:v6_rainboat # cast:v6_zhaoli,v6_du,v6_bo # speaker:v6_zhaoli # mood:v6_zhaoli=neutral
她把红绳解开，手腕上也留着一道深痕。 # beat:c_night_fire_7 # scene:v6_rainboat # cast:v6_zhaoli,v6_du,v6_bo # speaker:narrator
* [以后由她看水、你看人，互相叫停。 # cid:zhaoli_share]
  ~ zhaoli_trust = true
  你有看不见的岸，我有听不懂的水。别谁全包，谁也不问。 # beat:c_night_fire_8 # scene:v6_rainboat # cast:v6_zhaoli,v6_du,v6_bo # speaker:you
  好。下次我又一口气往前冲，你就喊江照鲤，别喊姑娘小心。 # beat:c_night_fire_9 # scene:v6_rainboat # cast:v6_zhaoli,v6_du,v6_bo # speaker:v6_zhaoli # mood:v6_zhaoli=calm
  -> night_watch
* [让她独坐一会儿，自己去补救生绳。 # cid:zhaoli_space]
  ~ zhaoli_trust = false
  ~ rope = true
  我不替你把这件事说圆。绳子我先补好，你想说再叫我。 # beat:c_night_fire_10 # scene:v6_rainboat # cast:v6_zhaoli,v6_du,v6_bo # speaker:you
  嗯。姜汤给我留半碗，别把话也全留在肚子里。 # beat:c_night_fire_11 # scene:v6_rainboat # cast:v6_zhaoli,v6_du,v6_bo # speaker:v6_zhaoli # mood:v6_zhaoli=calm
  -> night_watch


=== night_watch ===
我守上半夜。你们先睡，明早还得用眼。 # beat:c_night_watch_1 # scene:v6_rainboat # cast:v6_cheng,v6_jue,v6_du # speaker:v6_jue # mood:v6_jue=neutral
我不困，刚才都没出多少力。 # beat:c_night_watch_2 # scene:v6_rainboat # cast:v6_cheng,v6_jue,v6_du # speaker:v6_cheng # mood:v6_cheng=neutral
你把人从舷边背过来三趟，没出力是船自己背的？ # beat:c_night_watch_3 # scene:v6_rainboat # cast:v6_cheng,v6_jue,v6_du # speaker:v6_du # mood:v6_du=sharp
阿笠终于低头，看见自己两只手在抖。觉茂没有说她胆小，只把锅往她那边挪。 # beat:c_night_watch_4 # scene:v6_rainboat # cast:v6_cheng,v6_jue,v6_du # speaker:narrator
会怕也能掌桨。今天没有人因为你怕就落水。 # beat:c_night_watch_5 # scene:v6_rainboat # cast:v6_cheng,v6_jue,v6_du # speaker:you
明早别跟渡口的人讲我抖。 # beat:c_night_watch_6 # scene:v6_rainboat # cast:v6_cheng,v6_jue,v6_du # speaker:v6_cheng # mood:v6_cheng=uneasy
只讲你背了几个人。手抖是你自己知道的事。 # beat:c_night_watch_7 # scene:v6_rainboat # cast:v6_cheng,v6_jue,v6_du # speaker:v6_jue # mood:v6_jue=calm
* [接下半夜，给阿笠留下整段睡觉的时间。 # cid:watch_second]
  ~ escort = true
  下半夜我来。你睡足，明天别让我划得满船转圈。 # beat:c_night_watch_8 # scene:v6_rainboat # cast:v6_cheng,v6_jue,v6_du # speaker:you
  你那也不是转圈，是找不到岸。行，我明天看着你。 # beat:c_night_watch_9 # scene:v6_rainboat # cast:v6_cheng,v6_jue,v6_du # speaker:v6_cheng # mood:v6_cheng=amused
  -> night_return
* [和薄远修好警铃，让疲惫的人都能轮休。 # cid:watch_tools]
  ~ escort = false
  ~ labor = true
  水一到这根钉，铃先响。醒着的人查铃，别硬撑眼皮。 # beat:c_night_watch_10 # scene:v6_rainboat # cast:v6_cheng,v6_jue,v6_du # speaker:you
  先试响，再睡。管用的东西不能只看着像管用。 # beat:c_night_watch_11 # scene:v6_rainboat # cast:v6_cheng,v6_jue,v6_du # speaker:v6_du # mood:v6_du=neutral
  -> night_return


=== night_return ===
天亮后，主事派的接船停在湾外。苏晚澄先问人数，再看册子。 # beat:c_night_return_1 # scene:v6_reeds # cast:v6_su,v6_zhaoli,v6_du # speaker:narrator
都在？好。误了的那场，我会按急难记，不记弃试。 # beat:c_night_return_2 # scene:v6_reeds # cast:v6_su,v6_zhaoli,v6_du # speaker:v6_su # mood:v6_su=neutral
我想写所有人的名字。阿笠、刘篙、薄远，不只领船人。 # beat:c_night_return_3 # scene:v6_reeds # cast:v6_su,v6_zhaoli,v6_du # speaker:v6_zhaoli # mood:v6_zhaoli=neutral
让他们自己说，我来记。 # beat:c_night_return_4 # scene:v6_reeds # cast:v6_su,v6_zhaoli,v6_du # speaker:v6_su # mood:v6_su=calm
别把我写成隐居的神仙。昨晚要是没那棵树，神仙也得湿。 # beat:c_night_return_5 # scene:v6_reeds # cast:v6_su,v6_zhaoli,v6_du # speaker:v6_du # mood:v6_du=neutral
没有人拿剑把水劈开。倒是这条绳，大家都碰过。 # beat:c_night_return_6 # scene:v6_reeds # cast:v6_su,v6_zhaoli,v6_du # speaker:you
行，先回去。夸绳子也得让绳子歇口气。 # beat:c_night_return_7 # scene:v6_reeds # cast:v6_su,v6_zhaoli,v6_du # speaker:v6_zhaoli # mood:v6_zhaoli=amused
* [让每人说自己的部分，不替他们领功。 # cid:water_credit]
  ~ credit = true
  我只讲岸上那段。水里发生的，让阿笠讲。 # beat:c_night_return_8 # scene:v6_reeds # cast:v6_su,v6_zhaoli,v6_du # speaker:you
  这样才是记录。一个人站在最亮处，不等于全场都是他做的。 # beat:c_night_return_9 # scene:v6_reeds # cast:v6_su,v6_zhaoli,v6_du # speaker:v6_su # mood:v6_su=neutral
  -> workshop_gate
* [先核对失去的东西与未兑现的承诺。 # cid:water_cost]
  ~ credit = false
  船、布、网，各有谁的名字。回去不能只报人齐了就算完。 # beat:c_night_return_10 # scene:v6_reeds # cast:v6_su,v6_zhaoli,v6_du # speaker:you
  我跟你一起对。救回来之后的日子，也要有人过。 # beat:c_night_return_11 # scene:v6_reeds # cast:v6_su,v6_zhaoli,v6_du # speaker:v6_zhaoli # mood:v6_zhaoli=calm
  -> workshop_gate



=== workshop_gate ===
第三日清早，修船坞的门板架成饭桌，一锅汤滚得很响。陆队、水队与留在会场的人，终于坐到一处。 # beat:c6_workshop_gate_1 # scene:v6_workshop # cast:v6_he,v6_aunt,v6_qiao # speaker:narrator
先喝。谁想讲最险的那一下，先看看碗里有没有捞到菜。 # beat:c6_workshop_gate_2 # scene:v6_workshop # cast:v6_he,v6_aunt,v6_qiao # speaker:v6_aunt # mood:v6_aunt=neutral
我今日没抢最重的。你们也别一见就先审我。 # beat:c6_workshop_gate_3 # scene:v6_workshop # cast:v6_he,v6_aunt,v6_qiao # speaker:v6_qiao # mood:v6_qiao=amused
没抢。只问了十九遍谁还没到。 # beat:c6_workshop_gate_4 # scene:v6_workshop # cast:v6_he,v6_aunt,v6_qiao # speaker:v6_he # mood:v6_he=neutral
他右腕没有抬高，左手先把空凳往你这边挪。 # beat:c6_workshop_gate_5 # scene:v6_workshop # cast:v6_he,v6_aunt,v6_qiao # speaker:narrator
{
- route == 1:
听说你们桥边耽搁。我们也迟了，只是缘故不一样。 # beat:c6_workshop_gate_6 # scene:v6_workshop # cast:v6_zhaoli,v6_he,v6_aunt # speaker:v6_zhaoli # mood:v6_zhaoli=neutral
你们船上的事，我先听你讲，不拿山路上那套替你猜。 # beat:c6_workshop_gate_7 # scene:v6_workshop # cast:v6_zhaoli,v6_he,v6_aunt # speaker:you
- route == 2:
整夜没见你们灯。砚生把汤端热三回，最后不敢再问。 # beat:c6_workshop_gate_8 # scene:v6_workshop # cast:v6_pei,v6_zhaoli,v6_he # speaker:v6_pei # mood:v6_pei=neutral
我们在等水。桥上的那段，也得从你们口里听。 # beat:c6_workshop_gate_9 # scene:v6_workshop # cast:v6_pei,v6_zhaoli,v6_he # speaker:you
- else:
你们护药的回来了。我今日留在会场，也没把一张钱账办利落。 # beat:c6_workshop_gate_10 # scene:v6_workshop # cast:v6_rong,v6_pei,v6_zhaoli # speaker:v6_rong # mood:v6_rong=uneasy
我只见过这里这一段。药车和船的事，轮到他们自己讲。 # beat:c6_workshop_gate_11 # scene:v6_workshop # cast:v6_rong,v6_pei,v6_zhaoli # speaker:you
那我从第一面坡讲，先别笑。范遇说往前不远，说了五回。 # beat:c6_workshop_gate_12 # scene:v6_workshop # cast:v6_qiao,v6_rong,v6_pei # speaker:v6_qiao # mood:v6_qiao=calm
}
* [先讲自己做错的那一下。 # cid:reunion_honest]
  ~ honest = true
  我不是每步都做对。最想省工夫的时候，差点让别人替我付。 # beat:c6_workshop_gate_13 # scene:v6_workshop # cast:v6_qiao,v6_rong,v6_pei # speaker:you
  你肯回来讲，我就敢告诉你没做好的。先吃，不是抢着认罪。 # beat:c6_workshop_gate_14 # scene:v6_workshop # cast:v6_qiao,v6_rong,v6_pei # speaker:v6_qiao # mood:v6_qiao=calm
  -> workshop_people
* [先讲最好笑的一件，给大家喘口气。 # cid:reunion_light]
  ~ honest = false
  先说不疼的。陆汀舟能把回函压在饼下面，我们怎么还怕没笑话？ # beat:c6_workshop_gate_15 # scene:v6_workshop # cast:v6_qiao,v6_rong,v6_pei # speaker:you
  这桩比师门三百年还难翻篇。下回我要挑个没你们的饭桌。 # beat:c6_workshop_gate_16 # scene:v6_workshop # cast:v6_lu,v6_qiao,v6_rong # speaker:v6_lu # mood:v6_lu=amused
  -> workshop_people

=== workshop_people ===
雁秋，你肩上的旧伤还发不发？ # beat:c_workshop_people_1 # scene:v6_workshop # cast:v6_pei,v6_ling,v6_he # speaker:v6_ling # mood:v6_ling=uneasy
你现在问，是按朋友问，还是按大夫问？ # beat:c_workshop_people_2 # scene:v6_workshop # cast:v6_pei,v6_ling,v6_he # speaker:v6_pei # mood:v6_pei=neutral
按有眼睛的人问。你抬箱子时，把左边先让给别人了。 # beat:c_workshop_people_3 # scene:v6_workshop # cast:v6_pei,v6_ling,v6_he # speaker:v6_ling # mood:v6_ling=sharp
裴雁秋伸手去端汤，何铆把重碗换成一只小的。 # beat:c_workshop_people_4 # scene:v6_workshop # cast:v6_pei,v6_ling,v6_he # speaker:narrator
当年我让你走，是怕车队再误，不是觉得你只会添乱。 # beat:c_workshop_people_5 # scene:v6_workshop # cast:v6_pei,v6_ling,v6_he # speaker:v6_pei # mood:v6_pei=neutral
我知道。但你替我决定了。我那时候已经能自己说走不走。 # beat:c_workshop_people_6 # scene:v6_workshop # cast:v6_pei,v6_ling,v6_he # speaker:v6_ling # mood:v6_ling=neutral
你们还一起护药？ # beat:c_workshop_people_7 # scene:v6_workshop # cast:v6_pei,v6_ling,v6_he # speaker:you
正因为一起，才不能永远绕着这句。 # beat:c_workshop_people_8 # scene:v6_workshop # cast:v6_pei,v6_ling,v6_he # speaker:v6_pei # mood:v6_pei=neutral
* [让两人自己讲完，接下眼前的杂活。 # cid:healer_speak]
  ~ ally = true
  汤我去添，你们别拿谁的碗空了当话头躲过去。 # beat:c_workshop_people_9 # scene:v6_workshop # cast:v6_pei,v6_ling,v6_he # speaker:you
  听见了？今天连躲的地方都被你的人堵上了。 # beat:c_workshop_people_10 # scene:v6_workshop # cast:v6_pei,v6_ling,v6_he # speaker:v6_ling # mood:v6_ling=amused
  那就讲完。下回我先问你，再定车队怎么走。 # beat:c_workshop_people_11 # scene:v6_workshop # cast:v6_pei,v6_ling,v6_he # speaker:v6_pei # mood:v6_pei=calm
  -> two_swords
* [问一次以后该怎样分工，不替谁判对错。 # cid:healer_question]
  ~ ally = false
  下次又有人受伤，你们先问什么？ # beat:c_workshop_people_12 # scene:v6_workshop # cast:v6_pei,v6_ling,v6_he # speaker:you
  先问她需要几个人、多久。我报清车队能等多久。 # beat:c_workshop_people_13 # scene:v6_workshop # cast:v6_pei,v6_ling,v6_he # speaker:v6_pei # mood:v6_pei=neutral
  再一起决定。别拿体谅当成不必开口。 # beat:c_workshop_people_14 # scene:v6_workshop # cast:v6_pei,v6_ling,v6_he # speaker:v6_ling # mood:v6_ling=calm
  -> two_swords


=== workshop_qiao ===
明日我跟你同组。你手要是没好，现在告诉我。 # beat:c_workshop_qiao_1 # scene:v6_workshop # cast:v6_qiao,v6_xu,v6_ling # speaker:v6_xu # mood:v6_xu=neutral
好没好，你上场不就知道？ # beat:c_workshop_qiao_2 # scene:v6_workshop # cast:v6_qiao,v6_xu,v6_ling # speaker:v6_qiao # mood:v6_qiao=sharp
他要的是能不能打，不是你会不会顶嘴。 # beat:c_workshop_qiao_3 # scene:v6_workshop # cast:v6_qiao,v6_xu,v6_ling # speaker:v6_ling # mood:v6_ling=neutral
乔砚生盯着许竞川的刀鞘，过了片刻，终于把右腕放在桌上。 # beat:c_workshop_qiao_4 # scene:v6_workshop # cast:v6_qiao,v6_xu,v6_ling # speaker:narrator
不能连抢三次。两次以后，我得换。 # beat:c_workshop_qiao_5 # scene:v6_workshop # cast:v6_qiao,v6_xu,v6_ling # speaker:v6_qiao # mood:v6_qiao=uneasy
够了。我知道你留什么，也告诉你，我右脚转身慢。别说我没给你看。 # beat:c_workshop_qiao_6 # scene:v6_workshop # cast:v6_qiao,v6_xu,v6_ling # speaker:v6_xu # mood:v6_xu=neutral
你这算让招？ # beat:c_workshop_qiao_7 # scene:v6_workshop # cast:v6_qiao,v6_xu,v6_ling # speaker:you
算把丑话讲在前面。真打的时候，各自想办法。 # beat:c_workshop_qiao_8 # scene:v6_workshop # cast:v6_qiao,v6_xu,v6_ling # speaker:v6_xu # mood:v6_xu=intent
* [约定明日协作试，由他守你攻。 # cid:qiao_team]
  ~ team = true
  守的时候喊我。我不把你的剑拿走，也不假装你的手没伤。 # beat:c_workshop_qiao_9 # scene:v6_workshop # cast:v6_qiao,v6_xu,v6_ling # speaker:you
  行。你别把攻全吞了，该我走的时候，我自己会走。 # beat:c_workshop_qiao_10 # scene:v6_workshop # cast:v6_qiao,v6_xu,v6_ling # speaker:v6_qiao # mood:v6_qiao=calm
  -> workshop_rong
* [支持他独立完成有限目标，你去自己的场。 # cid:qiao_single]
  ~ team = false
  你自己选能做到的那一段。我在自己的场上，也不会拿你当借口。 # beat:c_workshop_qiao_11 # scene:v6_workshop # cast:v6_qiao,v6_xu,v6_ling # speaker:you
  这回听着舒服。谁先完事，谁去看另一场。 # beat:c_workshop_qiao_12 # scene:v6_workshop # cast:v6_qiao,v6_xu,v6_ling # speaker:v6_qiao # mood:v6_qiao=calm
  -> workshop_rong


=== workshop_rong ===
东仓能多拿十袋，再多就得动雇工的口粮。 # beat:c_workshop_rong_1 # scene:v6_workshop # cast:v6_rong,v6_deng,v6_aunt # speaker:v6_deng # mood:v6_deng=neutral
我知道。不是我一句送米，后面的人就不用吃。 # beat:c_workshop_rong_2 # scene:v6_workshop # cast:v6_rong,v6_deng,v6_aunt # speaker:v6_rong # mood:v6_rong=uneasy
你爹年轻时也这样。想做一桩大善事，把洗锅的米都捐了。 # beat:c_workshop_rong_3 # scene:v6_workshop # cast:v6_rong,v6_deng,v6_aunt # speaker:v6_aunt # mood:v6_aunt=neutral
后来呢？ # beat:c_workshop_rong_4 # scene:v6_workshop # cast:v6_rong,v6_deng,v6_aunt # speaker:v6_rong # mood:v6_rong=neutral
后来在我这儿赊了七顿。 # beat:c_workshop_rong_5 # scene:v6_workshop # cast:v6_rong,v6_deng,v6_aunt # speaker:v6_aunt # mood:v6_aunt=amused
那明日怎么办？ # beat:c_workshop_rong_6 # scene:v6_workshop # cast:v6_rong,v6_deng,v6_aunt # speaker:you
我出十袋，工钱照付。有人说我拿钱买好名声，你若真这么想，就当面说。 # beat:c_workshop_rong_7 # scene:v6_workshop # cast:v6_rong,v6_deng,v6_aunt # speaker:v6_rong # mood:v6_rong=intent
* [出自己的劳力，把十袋的用处做足。 # cid:grain_work]
  ~ grain_help = true
  你出米，我们来搬。谁干过活，册上写谁，不拿你名字盖过去。 # beat:c_workshop_rong_8 # scene:v6_workshop # cast:v6_rong,v6_deng,v6_aunt # speaker:you
  好。也别把我的名字擦掉。出了力的人，没必要假装没出。 # beat:c_workshop_rong_9 # scene:v6_workshop # cast:v6_rong,v6_deng,v6_aunt # speaker:v6_rong # mood:v6_rong=calm
  -> workshop_night
* [要求公开米数和用途，免得善意变成人情债。 # cid:grain_terms]
  ~ grain_help = false
  账公开，少了谁能问，多了别拿来逼谁让招。 # beat:c_workshop_rong_10 # scene:v6_workshop # cast:v6_rong,v6_deng,v6_aunt # speaker:you
  可以。我也要你们以后别用家财两个字，抹掉我练棍的十几年。 # beat:c_workshop_rong_11 # scene:v6_workshop # cast:v6_rong,v6_deng,v6_aunt # speaker:v6_rong # mood:v6_rong=sharp
  -> workshop_night


=== workshop_night ===
饭后，苏晚澄在灯下誊记，陆汀舟把干净回函放到她面前，压纸的是一块洗过的卵石。 # beat:c_workshop_night_1 # scene:v6_workshop # cast:v6_zhaoli,v6_lu,v6_su # speaker:narrator
终于不是饼了。 # beat:c_workshop_night_2 # scene:v6_workshop # cast:v6_zhaoli,v6_lu,v6_su # speaker:v6_su # mood:v6_su=amused
石头不能吃，我少一个能送的人情。 # beat:c_workshop_night_3 # scene:v6_workshop # cast:v6_zhaoli,v6_lu,v6_su # speaker:v6_lu # mood:v6_lu=neutral
明日会前都有点心慌？我刚才连平时走惯的踏板，都多看了一眼。 # beat:c_workshop_night_4 # scene:v6_workshop # cast:v6_zhaoli,v6_lu,v6_su # speaker:v6_zhaoli # mood:v6_zhaoli=neutral
有。最怕别人说我今天做的，只是碰巧。 # beat:c_workshop_night_5 # scene:v6_workshop # cast:v6_zhaoli,v6_lu,v6_su # speaker:you
碰巧也有前因。你明天不用把过去都证明一遍。 # beat:c_workshop_night_6 # scene:v6_workshop # cast:v6_zhaoli,v6_lu,v6_su # speaker:v6_su # mood:v6_su=neutral
你想试的那一手，只要到场，真试过就行。别顺便试着替一生争个结论。 # beat:c_workshop_night_7 # scene:v6_workshop # cast:v6_zhaoli,v6_lu,v6_su # speaker:v6_lu # mood:v6_lu=calm
{
- medicine:
药棚的人还问起你。你肯听他们说完，省下的不只我一口气。 # beat:c_workshop_night_8 # scene:v6_workshop # cast:v6_ling,v6_zhaoli,v6_lu # speaker:v6_ling # mood:v6_ling=neutral
我也才知道，同一种发热，后面可能是不同的日子。 # beat:c_workshop_night_9 # scene:v6_workshop # cast:v6_ling,v6_zhaoli,v6_lu # speaker:you
- else:
床和药车有人守着，我才能在里面看人。你不站在最前面，也没少帮忙。 # beat:c_workshop_night_10 # scene:v6_workshop # cast:v6_ling,v6_zhaoli,v6_lu # speaker:v6_ling # mood:v6_ling=neutral
}
{
- supplies:
药箱是干的，村里能用到最后一包。出门时肯挪那半刻，到地方就不用追着湿纸捡药。 # beat:c_workshop_night_11 # scene:v6_workshop # cast:v6_pei,v6_ling,v6_zhaoli # speaker:v6_pei # mood:v6_pei=neutral
- else:
有箱角沾了水，药没全坏。何铆在修底，下回装货不能只想着多一袋。 # beat:c_workshop_night_12 # scene:v6_workshop # cast:v6_pei,v6_ling,v6_zhaoli # speaker:v6_pei # mood:v6_pei=neutral
}
* [找照鲤核对明日的停手信号。 # cid:night_friend]
  ~ zhaoli_trust = true
  你喊我名字，我停。也请你听我喊，别最后还嫌我多嘴。 # beat:c_workshop_night_13 # scene:v6_workshop # cast:v6_pei,v6_ling,v6_zhaoli # speaker:you
  说定了。明天不管在岸上还是船上，都算。 # beat:c_workshop_night_14 # scene:v6_workshop # cast:v6_pei,v6_ling,v6_zhaoli # speaker:v6_zhaoli # mood:v6_zhaoli=calm
  -> morning_roof
* [找苏晚澄把自己的失误补进记录。 # cid:night_record]
  ~ su_trust = true
  好听的写了，难听的也得在。别让下个学徒照着我错的那一步学。 # beat:c_workshop_night_15 # scene:v6_workshop # cast:v6_pei,v6_ling,v6_zhaoli # speaker:you
  我不删。你也别只记错的，把真正做到的那一段留住。 # beat:c_workshop_night_16 # scene:v6_workshop # cast:v6_su,v6_pei,v6_ling # speaker:v6_su # mood:v6_su=calm
  -> morning_roof


=== arena_open ===
青蒲水陆小会开试。不是天下第一，没有一场胜负能替你包下一世。 # beat:c_arena_open_1 # scene:v6_arena # cast:v6_yan,v6_gao,v6_rong # speaker:v6_yan # mood:v6_yan=neutral # action:试艺开场
木兵，出线止，三个短音全场停。护渡见习另记，不抵试艺胜负。 # beat:c_arena_open_2 # scene:v6_arena # cast:v6_yan,v6_gao,v6_rong # speaker:v6_gao # mood:v6_gao=neutral
听见没有？别打赢我以后去说自己破了米价。 # beat:c_arena_open_3 # scene:v6_arena # cast:v6_yan,v6_gao,v6_rong # speaker:v6_rong # mood:v6_rong=amused
米价你自己定，棍价我试试。 # beat:c_arena_open_4 # scene:v6_arena # cast:v6_yan,v6_gao,v6_rong # speaker:you
容既白把外袍交给邓苹，露出磨破的肘护。第一棍试探很短，落在你剑能接住的位置。 # beat:c_arena_open_5 # scene:v6_arena # cast:v6_yan,v6_gao,v6_rong # speaker:narrator
别因为我第一次出得轻，就以为后面也轻。 # beat:c_arena_open_6 # scene:v6_arena # cast:v6_yan,v6_gao,v6_rong # speaker:v6_rong # mood:v6_rong=intent
你看见他左手每次往回收，右脚才跟进。间隙在棍尾，不在脸上。 # beat:c_arena_open_7 # scene:v6_arena # cast:v6_yan,v6_gao,v6_rong # speaker:narrator
{
- rong_fair:
你在客舍要我真打。我就按说好的来，输了也不找棍子滑的借口。 # beat:c_arena_open_8 # scene:v6_arena # cast:v6_yan,v6_gao,v6_rong # speaker:v6_rong # mood:v6_rong=calm
- else:
你在客舍说只认判线。行，不用先交朋友，也能认真过这一场。 # beat:c_arena_open_9 # scene:v6_arena # cast:v6_yan,v6_gao,v6_rong # speaker:v6_rong # mood:v6_rong=neutral
}
{
- fair:
你在渡口问过敢不敢判出钱人输。我站在这里，今天仍是那个回答。 # beat:c_arena_open_10 # scene:v6_arena # cast:v6_su,v6_yan,v6_gao # speaker:v6_su # mood:v6_su=neutral
}
* [先守一手，看清棍尾回收的时机。 # cid:arena_read]
  ~ duel_read = true
  我看见了，但不急着进去。你也还在等我。 # beat:c_arena_open_11 # scene:v6_arena # cast:v6_su,v6_yan,v6_gao # speaker:you
  这句算实话。来，第二手。 # beat:c_arena_open_12 # scene:v6_arena # cast:v6_rong,v6_su,v6_yan # speaker:v6_rong # mood:v6_rong=intent
  -> arena_press
* [抢第一轮的短棍，逼他早出后手。 # cid:arena_rush]
  ~ duel_read = false
  你抢进中间，棍尾忽然翻上来。你只得侧身，剑势散了一半。 # beat:c_arena_open_13 # scene:v6_arena # cast:v6_rong,v6_su,v6_yan # speaker:narrator
  钱替不了我打，胆子也替不了你退。现在怎么办？ # beat:c_arena_open_14 # scene:v6_arena # cast:v6_rong,v6_su,v6_yan # speaker:v6_rong # mood:v6_rong=sharp
  -> arena_press


=== arena_press ===
第二轮，棍的压力突然变重。你听见衣袖擦过护手，场外的喊声像隔了一层水。 # beat:c_arena_press_1 # scene:v6_arena # cast:v6_rong,v6_xu,v6_qiao # speaker:narrator
他不是每一下都快！别被第一下赶着！ # beat:c_arena_press_2 # scene:v6_arena # cast:v6_rong,v6_xu,v6_qiao # speaker:v6_qiao # mood:v6_qiao=intent
你先把呼吸接回来！右边还有半步！ # beat:c_arena_press_3 # scene:v6_arena # cast:v6_rong,v6_xu,v6_qiao # speaker:v6_xu # mood:v6_xu=neutral
场外的人说得都对，可剑还在我手上。 # beat:c_arena_press_4 # scene:v6_arena # cast:v6_rong,v6_xu,v6_qiao # speaker:you
那就听你自己能做到的。我要再进了。 # beat:c_arena_press_5 # scene:v6_arena # cast:v6_rong,v6_xu,v6_qiao # speaker:v6_rong # mood:v6_rong=intent
棍头占住中线，你的伤处若再发力，就很难收住下一下。 # beat:c_arena_press_6 # scene:v6_arena # cast:v6_rong,v6_xu,v6_qiao # speaker:narrator
* {duel_read and wound < 2} [让出中线，贴棍尾绕到侧方。 # cid:duel_turn]
  ~ duel = 2
  你让出一条直路，把剑留在斜处。棍尾回收时，剑背终于轻碰到他肩衣。 # beat:c_arena_press_7 # scene:v6_arena # cast:v6_rong,v6_xu,v6_qiao # speaker:narrator
  ……这一手，确实到了。再来，我不会再让你这么走。 # beat:c_arena_press_8 # scene:v6_arena # cast:v6_rong,v6_xu,v6_qiao # speaker:v6_rong # mood:v6_rong=surprised
  -> arena_result
* [不求碰肩，只守住第三轮。 # cid:duel_three]
  ~ duel = 1
  我不抢你那条路。我只把自己这条留住。 # beat:c_arena_press_9 # scene:v6_arena # cast:v6_rong,v6_xu,v6_qiao # speaker:you
  第三棍震得手心发麻，你仍没越线。锣声后，你才把那口气吐出来。 # beat:c_arena_press_10 # scene:v6_arena # cast:v6_rong,v6_xu,v6_qiao # speaker:narrator
  守住了。这不是你碰到我，但也不是我打倒你。 # beat:c_arena_press_11 # scene:v6_arena # cast:v6_rong,v6_xu,v6_qiao # speaker:v6_rong # mood:v6_rong=calm
  -> arena_result
* [赌他收棍的半瞬，以伤换碰肩。 # cid:duel_risk]
  ~ duel = 0
  ~ wound = wound + 1
  剑背碰上衣肩，棍尾也点中你肋下。主事立即叫停，判同时中身。 # beat:c_arena_press_12 # scene:v6_arena # cast:v6_rong,v6_xu,v6_qiao # speaker:narrator
  别硬笑。你碰到了，我也到了，这笔账谁都没赢净。 # beat:c_arena_press_13 # scene:v6_arena # cast:v6_rong,v6_xu,v6_qiao # speaker:v6_rong # mood:v6_rong=uneasy
  -> arena_result


=== arena_result ===
到此，记一次清楚的问手。输了哪一手，自己也得记清楚。 # beat:c_arena_result_1 # scene:v6_arena # cast:v6_rong,v6_yan,v6_deng # speaker:v6_yan # mood:v6_yan=neutral
你比我想得难打。我本来以为，你会先问我输不输得起。 # beat:c_arena_result_2 # scene:v6_arena # cast:v6_rong,v6_yan,v6_deng # speaker:v6_rong # mood:v6_rong=neutral
你真输了会怎样？ # beat:c_arena_result_3 # scene:v6_arena # cast:v6_rong,v6_yan,v6_deng # speaker:you
先想怎么赢回来，再想午饭。顺序不能反，反了容易发脾气。 # beat:c_arena_result_4 # scene:v6_arena # cast:v6_rong,v6_yan,v6_deng # speaker:v6_rong # mood:v6_rong=amused
少东，午饭已经凉了。 # beat:c_arena_result_5 # scene:v6_arena # cast:v6_rong,v6_yan,v6_deng # speaker:v6_deng # mood:v6_deng=neutral
那就先吃。道理也得看时候。 # beat:c_arena_result_6 # scene:v6_arena # cast:v6_rong,v6_yan,v6_deng # speaker:v6_rong # mood:v6_rong=surprised
他把棍靠在坪边，没有叫伙计替他解释。你终于看见，比你家有钱的人也会认真懊恼。 # beat:c_arena_result_7 # scene:v6_arena # cast:v6_rong,v6_yan,v6_deng # speaker:narrator
* [约定养好伤以后再来，不要今日赌完。 # cid:rival_rematch]
  ~ rematch = true
  下一回我也练好了。今天先把手留着吃饭。 # beat:c_arena_result_8 # scene:v6_arena # cast:v6_rong,v6_yan,v6_deng # speaker:you
  好。输赢不预定，饭我可以先定。 # beat:c_arena_result_9 # scene:v6_arena # cast:v6_rong,v6_yan,v6_deng # speaker:v6_rong # mood:v6_rong=calm
  -> arena_pairs
* [只行礼承认这场，不许下未来的诺。 # cid:rival_distance2]
  ~ rematch = false
  这一次我认。下回的事，下回走到你面前再讲。 # beat:c_arena_result_10 # scene:v6_arena # cast:v6_rong,v6_yan,v6_deng # speaker:you
  也好。比随口说明年一定来，再让我多备一双筷子强。 # beat:c_arena_result_11 # scene:v6_arena # cast:v6_rong,v6_yan,v6_deng # speaker:v6_rong # mood:v6_rong=calm
  -> arena_pairs


=== arena_pairs ===
乔砚生与许竞川的场排在斜木板旁。试的不是倒人，是二人轮换守住一面小旗。 # beat:c_arena_pairs_1 # scene:v6_arena # cast:v6_qiao,v6_xu,v6_yan # speaker:narrator
怎么，我想跟你打，结果要跟你站一边？ # beat:c_arena_pairs_2 # scene:v6_arena # cast:v6_qiao,v6_xu,v6_yan # speaker:v6_xu # mood:v6_xu=amused
嫌我碍事，你去守另一边，看主事认不认。 # beat:c_arena_pairs_3 # scene:v6_arena # cast:v6_qiao,v6_xu,v6_yan # speaker:v6_qiao # mood:v6_qiao=neutral
轮换的时候互相报信。谁抢得自己风光，旗落了就都算失。 # beat:c_arena_pairs_4 # scene:v6_arena # cast:v6_qiao,v6_xu,v6_yan # speaker:v6_yan # mood:v6_yan=neutral
原来这场不是两个人都把别人打倒。 # beat:c_arena_pairs_5 # scene:v6_arena # cast:v6_qiao,v6_xu,v6_yan # speaker:you
我守左。手不行的时候会喊，不让你自己猜。 # beat:c_arena_pairs_6 # scene:v6_arena # cast:v6_qiao,v6_xu,v6_yan # speaker:v6_qiao # mood:v6_qiao=intent
另一组木杆横扫，旗脚在湿板上滑了一寸。 # beat:c_arena_pairs_7 # scene:v6_arena # cast:v6_qiao,v6_xu,v6_yan # speaker:narrator
* {team or qiao_rest} [按约定报位置，让同伴先换手。 # cid:pair_signal]
  ~ pair_win = true
  砚生，左边我接！你去旗后，别抬右腕！ # beat:c_arena_pairs_8 # scene:v6_arena # cast:v6_qiao,v6_xu,v6_yan # speaker:you
  乔砚生让出位置，许竞川的刀鞘钉住旗脚。旗没有倒，三个人也没抢成一团。 # beat:c_arena_pairs_9 # scene:v6_arena # cast:v6_qiao,v6_xu,v6_yan # speaker:narrator
  听见了。这次我没撑，你也没把我全拿走。 # beat:c_arena_pairs_10 # scene:v6_arena # cast:v6_qiao,v6_xu,v6_yan # speaker:v6_qiao # mood:v6_qiao=amused
  -> v6_wind
* [自己扑住旗脚，把守人的事交出去。 # cid:pair_flag]
  ~ pair_win = true
  旗我按着，你们守人！我不抬头，信你们这回。 # beat:c_arena_pairs_11 # scene:v6_arena # cast:v6_qiao,v6_xu,v6_yan # speaker:you
  别松！再一轮！ # beat:c_arena_pairs_12 # scene:v6_arena # cast:v6_qiao,v6_xu,v6_yan # speaker:v6_xu # mood:v6_xu=intent
  木杆停在你头顶半尺，刀鞘先接住了它。你连谁打来的都没看清。 # beat:c_arena_pairs_13 # scene:v6_arena # cast:v6_qiao,v6_xu,v6_yan # speaker:narrator
  -> v6_wind
* [先抢倒持杆人，用先手结束压力。 # cid:pair_attack]
  ~ pair_win = false
  你扑了出去。对方收杆让开，旗在你身后倒了。 # beat:c_arena_pairs_14 # scene:v6_arena # cast:v6_qiao,v6_xu,v6_yan # speaker:narrator
  我喊了。我不是要你救我，是要你换一下。 # beat:c_arena_pairs_15 # scene:v6_arena # cast:v6_qiao,v6_xu,v6_yan # speaker:v6_qiao # mood:v6_qiao=uneasy
  还能记清哪一下没听见，今天就没白来。 # beat:c_arena_pairs_16 # scene:v6_arena # cast:v6_qiao,v6_xu,v6_yan # speaker:v6_xu # mood:v6_xu=neutral
  -> v6_wind


=== arena_pair_result ===
这场我记三个人的手，不写谁替谁扛了全场。 # beat:c_arena_pair_result_1 # scene:v6_wind # cast:v6_su,v6_lu,v6_yan # speaker:v6_su # mood:v6_su=neutral
我刚才看见有人临时换了握法，不在旧式里，也没把旧式扔了。 # beat:c_arena_pair_result_2 # scene:v6_wind # cast:v6_su,v6_lu,v6_yan # speaker:v6_lu # mood:v6_lu=neutral
你若要拿来反驳我，最好写清楚为什么换。 # beat:c_arena_pair_result_3 # scene:v6_wind # cast:v6_su,v6_lu,v6_yan # speaker:v6_su # mood:v6_su=amused
你们还要争？ # beat:c_arena_pair_result_4 # scene:v6_wind # cast:v6_su,v6_lu,v6_yan # speaker:you
要。但晚上能坐一桌吃饭，不耽误争。 # beat:c_arena_pair_result_5 # scene:v6_wind # cast:v6_su,v6_lu,v6_yan # speaker:v6_lu # mood:v6_lu=neutral
忽然，东边的锣响了两个短音。严平章抬头，还没等第三声，便有人沿坪边跑来。 # beat:c_arena_pair_result_6 # scene:v6_wind # cast:v6_su,v6_lu,v6_yan # speaker:narrator
东堤漫水！最外那座雨棚开始进水，车堵着撤不下来！ # beat:c_arena_pair_result_7 # scene:v6_wind # cast:v6_tian,v6_su,v6_lu # speaker:v6_tian # mood:v6_tian=intent
* [提醒停试令，要求立即给东堤让路。 # cid:stop_public]
  ~ stop_clear = true
  第三声！别等人都听不见才敲！ # beat:c_arena_pair_result_8 # scene:v6_wind # cast:v6_tian,v6_su,v6_lu # speaker:you
  停试！旗手，把东出口放开。未完的场另记，不许堵在路上争！ # beat:c_arena_pair_result_9 # scene:v6_wind # cast:v6_yan,v6_tian,v6_su # speaker:v6_yan # mood:v6_yan=intent
  -> v6_sluice
* [先去东堤看人，不再等场上宣布。 # cid:go_direct]
  ~ stop_clear = false
  我先走，名字在册上，回来再说。 # beat:c_arena_pair_result_10 # scene:v6_wind # cast:v6_yan,v6_tian,v6_su # speaker:you
  我记着。你去的是急难，不是逃场。陆汀舟，跟我开侧门。 # beat:c_arena_pair_result_11 # scene:v6_wind # cast:v6_yan,v6_tian,v6_su # speaker:v6_su # mood:v6_su=intent
  -> v6_sluice


=== levee_call ===
东堤的水已掏空车轮下的土。最外棚还有老人，堤上另一辆米车陷进了泥里。 # beat:c_levee_call_1 # scene:v6_levee # cast:v6_yan,v6_tian,v6_he # speaker:narrator
一个个过！别推！推倒的人，前面就走不了了！ # beat:c_levee_call_2 # scene:v6_levee # cast:v6_yan,v6_tian,v6_he # speaker:v6_tian # mood:v6_tian=neutral
别把车硬拉，轴会折！卸这一排米，先把车身抬正！ # beat:c_levee_call_3 # scene:v6_levee # cast:v6_yan,v6_tian,v6_he # speaker:v6_he # mood:v6_he=sharp
我昨晚该拆这座棚。 # beat:c_levee_call_4 # scene:v6_levee # cast:v6_yan,v6_tian,v6_he # speaker:v6_yan # mood:v6_yan=uneasy
现在后悔用得上手吗？ # beat:c_levee_call_5 # scene:v6_levee # cast:v6_yan,v6_tian,v6_he # speaker:you
用不上。你说现在先做什么，我来喊。 # beat:c_levee_call_6 # scene:v6_levee # cast:v6_yan,v6_tian,v6_he # speaker:v6_yan # mood:v6_yan=neutral
这位一直坐上席的主事，卷起下摆，踩进与你同样深的泥里。 # beat:c_levee_call_7 # scene:v6_levee # cast:v6_yan,v6_tian,v6_he # speaker:narrator
{
- stop_clear:
停试令已报全，东出口放开了。你在坪上喊的那句，现在后面的人也听见了。 # beat:c_levee_call_8 # scene:v6_levee # cast:v6_gao,v6_yan,v6_tian # speaker:v6_gao # mood:v6_gao=neutral
- else:
东出口还有人争刚才算不算输。我先去报清，不让你们这边还要等。 # beat:c_levee_call_9 # scene:v6_levee # cast:v6_gao,v6_yan,v6_tian # speaker:v6_gao # mood:v6_gao=neutral
}
{
- repair:
在馆里帮过我那位，过来拿钉。先试后抬，你见过我怎么查。 # beat:c_levee_call_10 # scene:v6_levee # cast:v6_he,v6_gao,v6_yan # speaker:v6_he # mood:v6_he=neutral
先查木底，不拿表面那一层当整块。 # beat:c_levee_call_11 # scene:v6_levee # cast:v6_he,v6_gao,v6_yan # speaker:you
- else:
今天没空从头教。不会就讲，别看别人拿锤，你也抢一把。 # beat:c_levee_call_12 # scene:v6_levee # cast:v6_he,v6_gao,v6_yan # speaker:v6_he # mood:v6_he=neutral
}
{
- warning:
你们报过回水。我把棚往内挪了两丈，还少做了一步。 # beat:c_levee_call_13 # scene:v6_levee # cast:v6_he,v6_gao,v6_yan # speaker:v6_yan # mood:v6_yan=neutral
那两丈让人还来得及走。先把剩下的一步做完。 # beat:c_levee_call_14 # scene:v6_levee # cast:v6_he,v6_gao,v6_yan # speaker:you
- else:
幸亏昨晚多留了两根长绳。谁绑的先别领功，先把那头拉过来。 # beat:c_levee_call_15 # scene:v6_levee # cast:v6_he,v6_gao,v6_yan # speaker:v6_he # mood:v6_he=neutral
我来。现在不是说谁早知道的时候。 # beat:c_levee_call_16 # scene:v6_levee # cast:v6_he,v6_gao,v6_yan # speaker:you
}
* [先把老人分成短队，逐段送出。 # cid:evacuate_elders]
  ~ evac = true
  不许一口气全挤。田雁报人，明栓扶脚，我站中间接。 # beat:c_levee_call_17 # scene:v6_levee # cast:v6_he,v6_gao,v6_yan # speaker:you
  好。册上的人一个个划，没过去的绝不先打勾。 # beat:c_levee_call_18 # scene:v6_levee # cast:v6_tian,v6_he,v6_gao # speaker:v6_tian # mood:v6_tian=calm
  -> levee_grain
* [先卸车开路，让会走的人自己走。 # cid:evacuate_cart]
  ~ evac = false
  ~ labor = true
  米先放高处，人从车边过。别把所有人都当不能走。 # beat:c_levee_call_19 # scene:v6_levee # cast:v6_tian,v6_he,v6_gao # speaker:you
  我数一二三，你们抬。车只要正半尺，不用抬上天！ # beat:c_levee_call_20 # scene:v6_levee # cast:v6_tian,v6_he,v6_gao # speaker:v6_he # mood:v6_he=neutral
  -> levee_grain


=== levee_grain ===
剩下的米，进外棚垫脚。今天别再问能不能脏。 # beat:c_levee_grain_1 # scene:v6_levee # cast:v6_rong,v6_deng,v6_aunt # speaker:v6_rong # mood:v6_rong=neutral
这就不够给雇工过冬了。 # beat:c_levee_grain_2 # scene:v6_levee # cast:v6_rong,v6_deng,v6_aunt # speaker:v6_deng # mood:v6_deng=uneasy
仓里还有，先记我该赔他们的数。不能用他们的钱替我做好人。 # beat:c_levee_grain_3 # scene:v6_levee # cast:v6_rong,v6_deng,v6_aunt # speaker:v6_rong # mood:v6_rong=neutral
这句像个人话。我把摊棚拆了，木板也能走。 # beat:c_levee_grain_4 # scene:v6_levee # cast:v6_rong,v6_deng,v6_aunt # speaker:v6_aunt # mood:v6_aunt=neutral
你拿米垫脚，自己家的名声也要受损。 # beat:c_levee_grain_5 # scene:v6_levee # cast:v6_rong,v6_deng,v6_aunt # speaker:you
我宁愿明天被骂糟蹋米，也不想今晚站在干处数还有几个人。 # beat:c_levee_grain_6 # scene:v6_levee # cast:v6_rong,v6_deng,v6_aunt # speaker:v6_rong # mood:v6_rong=sharp
邓苹没有再争，自己先扛起一袋。 # beat:c_levee_grain_7 # scene:v6_levee # cast:v6_rong,v6_deng,v6_aunt # speaker:narrator
{
- grain_help:
昨天搬米的人我都叫来了。不是报恩，是大家认得哪袋能压，哪袋不能再沾水。 # beat:c_levee_grain_8 # scene:v6_levee # cast:v6_rong,v6_deng,v6_aunt # speaker:v6_deng # mood:v6_deng=neutral
- else:
按你说的，数和用途都写在这儿。今天谁拿了米，先做事，回来也得讲清。 # beat:c_levee_grain_9 # scene:v6_levee # cast:v6_rong,v6_deng,v6_aunt # speaker:v6_deng # mood:v6_deng=neutral
}
* [帮他们把米铺在确实能承重的地方。 # cid:grain_allow]
  ~ grain_rescue = true
  何铆先看底，不往空泥里倒。你捐出去的不是一句话，是每人脚底这一寸。 # beat:c_levee_grain_10 # scene:v6_levee # cast:v6_rong,v6_deng,v6_aunt # speaker:you
  好。邓苹，听木匠的，不听我着急的。 # beat:c_levee_grain_11 # scene:v6_levee # cast:v6_rong,v6_deng,v6_aunt # speaker:v6_rong # mood:v6_rong=intent
  -> levee_wrist
* [用拆棚板替代一部分米，保住雇工口粮。 # cid:grain_save]
  ~ grain_rescue = false
  木板架这里能接上，米只用最湿的两袋。别救完人，又让你的人断炊。 # beat:c_levee_grain_12 # scene:v6_levee # cast:v6_rong,v6_deng,v6_aunt # speaker:you
  我来拆。少东，你先去领人，账我会记清楚。 # beat:c_levee_grain_13 # scene:v6_levee # cast:v6_rong,v6_deng,v6_aunt # speaker:v6_deng # mood:v6_deng=calm
  -> levee_wrist


=== levee_wrist ===
乔砚生想抬担架，右手忽然松了。许竞川一步顶住，担架没有落地。 # beat:c_levee_wrist_1 # scene:v6_levee # cast:v6_qiao,v6_xu,v6_ling # speaker:narrator
你说疼就停，讲过的！ # beat:c_levee_wrist_2 # scene:v6_levee # cast:v6_qiao,v6_xu,v6_ling # speaker:v6_xu # mood:v6_xu=sharp
我以为这一回还能—— # beat:c_levee_wrist_3 # scene:v6_levee # cast:v6_qiao,v6_xu,v6_ling # speaker:v6_qiao # mood:v6_qiao=uneasy
每个以为都在用同一只手。换到后边，报路，不要再抬。 # beat:c_levee_wrist_4 # scene:v6_levee # cast:v6_qiao,v6_xu,v6_ling # speaker:v6_ling # mood:v6_ling=neutral
看着我。你能不能握住？ # beat:c_levee_wrist_5 # scene:v6_levee # cast:v6_qiao,v6_xu,v6_ling # speaker:you
现在不能。可我不想去一边等，像个被保护得没事的人。 # beat:c_levee_wrist_6 # scene:v6_levee # cast:v6_qiao,v6_xu,v6_ling # speaker:v6_qiao # mood:v6_qiao=neutral
那就别等。你记人，我搬人，谁说只有抬得动才算来过？ # beat:c_levee_wrist_7 # scene:v6_levee # cast:v6_qiao,v6_xu,v6_ling # speaker:v6_xu # mood:v6_xu=neutral
{
- qiao_rest:
之前肯歇，手就还没坏到拿不住轻物。现在换下来，等养好还能握。 # beat:c_levee_wrist_8 # scene:v6_levee # cast:v6_qiao,v6_xu,v6_ling # speaker:v6_ling # mood:v6_ling=neutral
知道。比以前少练一天，也不等于一辈子再不能练。 # beat:c_levee_wrist_9 # scene:v6_levee # cast:v6_qiao,v6_xu,v6_ling # speaker:v6_qiao # mood:v6_qiao=calm
- else:
之前没肯休，这一下不能再商量。疼不是你不够勇敢，是手已经在说不能。 # beat:c_levee_wrist_10 # scene:v6_levee # cast:v6_qiao,v6_xu,v6_ling # speaker:v6_ling # mood:v6_ling=sharp
}
* [让他负责报人和接应，不再冒险握剑。 # cid:qiao_dispatch]
  ~ qiao_saved = true
  你认得回馆的每条巷。把他们送到不会再进水的地方，我信你这件事。 # beat:c_levee_wrist_11 # scene:v6_levee # cast:v6_qiao,v6_xu,v6_ling # speaker:you
  好。许竞川，别把担架往窄巷里扛，先听我喊。 # beat:c_levee_wrist_12 # scene:v6_levee # cast:v6_qiao,v6_xu,v6_ling # speaker:v6_qiao # mood:v6_qiao=calm
  -> missing_name
* [让他决定保哪段力气，给出明确停手信号。 # cid:qiao_choose]
  ~ qiao_saved = qiao_rest
  你选。但我喊你名字，就必须放手。你要还我这一个答应。 # beat:c_levee_wrist_13 # scene:v6_levee # cast:v6_qiao,v6_xu,v6_ling # speaker:you
  答应。不是想让我走，是想让我还能留下，对吧？ # beat:c_levee_wrist_14 # scene:v6_levee # cast:v6_qiao,v6_xu,v6_ling # speaker:v6_qiao # mood:v6_qiao=uneasy
  是。 # beat:c_levee_wrist_15 # scene:v6_levee # cast:v6_qiao,v6_xu,v6_ling # speaker:you
  -> missing_name


=== levee_exit ===
回水撞上堤脚，一段木栅倾倒。陆汀舟拔剑只切缠绳，苏晚澄却先把册子塞进裴雁秋怀里。 # beat:c_levee_exit_1 # scene:v6_levee # cast:v6_su,v6_lu,v6_pei # speaker:narrator
别误会，不是比人要紧。我腾手。 # beat:c_levee_exit_2 # scene:v6_levee # cast:v6_su,v6_lu,v6_pei # speaker:v6_su # mood:v6_su=neutral
我没说。你今天倒比我先乱猜。 # beat:c_levee_exit_3 # scene:v6_levee # cast:v6_su,v6_lu,v6_pei # speaker:v6_lu # mood:v6_lu=amused
三条撤路，南巷到高地，东桥到船坞，原路回会坪。桥边已有人在清板。 # beat:c_levee_exit_4 # scene:v6_levee # cast:v6_su,v6_lu,v6_pei # speaker:v6_pei # mood:v6_pei=neutral
我们缺哪头？ # beat:c_levee_exit_5 # scene:v6_levee # cast:v6_su,v6_lu,v6_pei # speaker:you
缺一个肯留下报清人数的人，也缺一个能去渡口帮照鲤的人。 # beat:c_levee_exit_6 # scene:v6_levee # cast:v6_su,v6_lu,v6_pei # speaker:v6_su # mood:v6_su=neutral
不是谁更像英雄。两头都不能空。 # beat:c_levee_exit_7 # scene:v6_levee # cast:v6_su,v6_lu,v6_pei # speaker:v6_lu # mood:v6_lu=intent
* [留下把撤离数核清，再赶去渡口。 # cid:leave_signal]
  ~ signal = true
  我记完这一队再走。没见到的人，不能在册上当他已经到了。 # beat:c_levee_exit_8 # scene:v6_levee # cast:v6_su,v6_lu,v6_pei # speaker:you
  我和你核。你不是一个人耽误，你在让那头知道还有几个人。 # beat:c_levee_exit_9 # scene:v6_levee # cast:v6_su,v6_lu,v6_pei # speaker:v6_su # mood:v6_su=calm
  -> levee_split
* [立刻去渡口，让苏晚澄负责记录。 # cid:leave_boat]
  ~ signal = false
  记录交你。我不再回头猜这边，去把船那头接住。 # beat:c_levee_exit_10 # scene:v6_levee # cast:v6_su,v6_lu,v6_pei # speaker:you
  好。到岸举两次灯，我看见就送下一队。 # beat:c_levee_exit_11 # scene:v6_levee # cast:v6_su,v6_lu,v6_pei # speaker:v6_su # mood:v6_su=intent
  -> levee_split


=== levee_split ===
最后一条船还没进。刘篙在掌桨，后面有个从棚里出来的老人。 # beat:c_levee_split_1 # scene:v6_levee # cast:v6_zhaoli,v6_du,v6_he # speaker:v6_zhaoli # mood:v6_zhaoli=neutral
旧堤后头开了个回水口。篙能顶一时，顶不住一夜。 # beat:c_levee_split_2 # scene:v6_levee # cast:v6_zhaoli,v6_du,v6_he # speaker:v6_du # mood:v6_du=neutral
这根主绳能承船，但岸桩撑不住。得换到仓前的石墩。 # beat:c_levee_split_3 # scene:v6_levee # cast:v6_zhaoli,v6_du,v6_he # speaker:v6_he # mood:v6_he=neutral
多远？ # beat:c_levee_split_4 # scene:v6_levee # cast:v6_zhaoli,v6_du,v6_he # speaker:you
过没膝的水，再跨一段断板。可以两人协作，也可以等主事调大船来。 # beat:c_levee_split_5 # scene:v6_levee # cast:v6_zhaoli,v6_du,v6_he # speaker:v6_zhaoli # mood:v6_zhaoli=intent
大船来得慢，却稳。你们要抢这一刻，就得说清楚拿什么抢。 # beat:c_levee_split_6 # scene:v6_levee # cast:v6_zhaoli,v6_du,v6_he # speaker:v6_du # mood:v6_du=neutral
* [先将绳锚换到石墩，再决定接船方式。 # cid:final_prepare]
  ~ anchor = true
  不把第一步赌了。你看船，我去石墩，何铆查绳。 # beat:c_levee_split_7 # scene:v6_levee # cast:v6_zhaoli,v6_du,v6_he # speaker:you
  我跟着。你有伤就说，别等我从水里把你捞出来才知道。 # beat:c_levee_split_8 # scene:v6_levee # cast:v6_zhaoli,v6_du,v6_he # speaker:v6_he # mood:v6_he=intent
  -> last_boat
* [先让照鲤接近船，自己守住现有岸桩。 # cid:final_hurry]
  ~ anchor = false
  岸桩若动我就喊停。我们先让船上知道有人在这儿。 # beat:c_levee_split_9 # scene:v6_levee # cast:v6_zhaoli,v6_du,v6_he # speaker:you
  桩动一寸就喊。别自作主张替它多撑半寸。 # beat:c_levee_split_10 # scene:v6_levee # cast:v6_zhaoli,v6_du,v6_he # speaker:v6_du # mood:v6_du=intent
  -> last_boat


=== storm_choice ===
雨把两盏灯连成模糊的一线。船尾在回水里摆动，刘篙举起空盆，又缓慢放下。 # beat:c_storm_choice_1 # scene:v6_storm # cast:v6_zhaoli,v6_du,v6_he # speaker:narrator # action:回水口 · 两盏灯
我们要保的是船上的人，不一定保得住船。 # beat:c_storm_choice_2 # scene:v6_storm # cast:v6_zhaoli,v6_du,v6_he # speaker:v6_zhaoli # mood:v6_zhaoli=intent
记得：船离桩，人先离绳。没谁能拿身子替一整条船压水。 # beat:c_storm_choice_3 # scene:v6_storm # cast:v6_zhaoli,v6_du,v6_he # speaker:v6_du # mood:v6_du=neutral
我知道。今天不是碰一寸衣袖。 # beat:c_storm_choice_4 # scene:v6_storm # cast:v6_zhaoli,v6_du,v6_he # speaker:you
也不是谁在看。你要用的东西，在手上，你要叫的人，在旁边。 # beat:c_storm_choice_5 # scene:v6_storm # cast:v6_zhaoli,v6_du,v6_he # speaker:v6_he # mood:v6_he=neutral
照鲤把红绳系在腰侧，留出能一手解开的活口。她看你，等你真正开口。 # beat:c_storm_choice_6 # scene:v6_storm # cast:v6_zhaoli,v6_du,v6_he # speaker:narrator
你定哪一段，我就接哪一段。不许临时把我也替了。 # beat:c_storm_choice_7 # scene:v6_storm # cast:v6_zhaoli,v6_du,v6_he # speaker:v6_zhaoli # mood:v6_zhaoli=neutral # cg:storm
{
- route == 2 and night_safe:
旧桩湾那次，我们先把绳角定清。今天照样先定，别因为有人看着，就忽然又改成拼命。 # beat:c_storm_choice_8 # scene:v6_storm # cast:v6_zhaoli,v6_du,v6_he # speaker:v6_zhaoli # mood:v6_zhaoli=neutral
}
{
- route == 1 and bridge_safe:
桥头你知道先清哪条路。水里一样，先留退路，不是一脚下去才问怎么回来。 # beat:c_storm_choice_9 # scene:v6_storm # cast:v6_zhaoli,v6_du,v6_he # speaker:v6_he # mood:v6_he=neutral
}
* [与照鲤协作接船，把最后一队人带到岸上。 # cid:end_rescue]
  ~ final = 1
  你接人，我守绳。要松的时候，我一定松，不跟船赌力气。 # beat:c_storm_choice_10 # scene:v6_storm # cast:v6_zhaoli,v6_du,v6_he # speaker:you
  好。我听你喊，也请你听我。 # beat:c_storm_choice_11 # scene:v6_storm # cast:v6_zhaoli,v6_du,v6_he # speaker:v6_zhaoli # mood:v6_zhaoli=calm
  -> storm_act
* [回高处组织大船，宁可慢也不再添险。 # cid:end_lead]
  ~ final = 2
  我们的小船不够稳。我回高处举灯，叫大船沿石墩进。 # beat:c_storm_choice_12 # scene:v6_storm # cast:v6_zhaoli,v6_du,v6_he # speaker:you
  我顶住这一段。跑的时候别想着快，把该说的信号先说全。 # beat:c_storm_choice_13 # scene:v6_storm # cast:v6_zhaoli,v6_du,v6_he # speaker:v6_du # mood:v6_du=calm
  -> storm_act
* [留给熟手救援，回坪争取重开正式试艺。 # cid:end_honor]
  ~ final = 3
  我不装能掌船。这里交给你们，另一头答应过的公平，我去要。 # beat:c_storm_choice_14 # scene:v6_storm # cast:v6_zhaoli,v6_du,v6_he # speaker:you
  去吧。记得你说的是交给我们，别回头再说自己一个人救了这条河。 # beat:c_storm_choice_15 # scene:v6_storm # cast:v6_zhaoli,v6_du,v6_he # speaker:v6_zhaoli # mood:v6_zhaoli=uneasy
  -> storm_act
* [陪腕伤的砚生护送最后一队回馆。 # cid:end_home]
  ~ final = 4
  我先带砚生把人送进屋。船上交给真正懂的人。 # beat:c_storm_choice_16 # scene:v6_storm # cast:v6_zhaoli,v6_du,v6_he # speaker:you
  去。屋里有人等，也得有人让等的人看见灯。 # beat:c_storm_choice_17 # scene:v6_storm # cast:v6_zhaoli,v6_du,v6_he # speaker:v6_du # mood:v6_du=neutral
  -> storm_act


=== storm_act ===
选择落下之后，没人再问哪条路最好。每个人都去做自己接住的那一段。 # beat:c_storm_act_1 # scene:v6_storm # cast:v6_zhaoli,v6_du,v6_he # speaker:narrator
先看脚下。断板第二块不能踩！ # beat:c_storm_act_2 # scene:v6_storm # cast:v6_zhaoli,v6_du,v6_he # speaker:v6_he # mood:v6_he=neutral
刘篙，把老人移到舱中！不要站船头替我们照灯！ # beat:c_storm_act_3 # scene:v6_storm # cast:v6_zhaoli,v6_du,v6_he # speaker:v6_zhaoli # mood:v6_zhaoli=intent
听得见！你也听我—— # beat:c_storm_act_4 # scene:v6_storm # cast:v6_zhaoli,v6_du,v6_he # speaker:you
一道浪从旧桩后绕回来，岸绳绷紧。你这一路学到的，并不会替你多长一双手。 # beat:c_storm_act_5 # scene:v6_storm # cast:v6_zhaoli,v6_du,v6_he # speaker:narrator
{
- final == 1:
{
- anchor and (rope or water_read or terrain) and wound < 3:
石墩把绳的力接住，你按口令松出半臂。照鲤借船身的转向靠拢，刘篙把老人送进她臂间。 # beat:c_storm_act_6 # scene:v6_storm # cast:v6_zhaoli,v6_du,v6_he # speaker:narrator
松！现在！ # beat:c_storm_act_7 # scene:v6_storm # cast:v6_zhaoli,v6_du,v6_he # speaker:v6_zhaoli # mood:v6_zhaoli=intent
你松了。那条被旧桩卡住的空船在浪里翻转，人却已经越过了最险的地方。 # beat:c_storm_act_8 # scene:v6_storm # cast:v6_zhaoli,v6_du,v6_he # speaker:narrator
- else:
岸绳突然震动，你试图多撑一瞬，{wound > 0:伤处|手臂}先替你松了力。何铆把你往后扯，自己也跪进水里。 # beat:c_storm_act_9 # scene:v6_storm # cast:v6_zhaoli,v6_du,v6_he # speaker:narrator
小船退！刘篙，留在舱中！等大船，不许跳！ # beat:c_storm_act_10 # scene:v6_storm # cast:v6_zhaoli,v6_du,v6_he # speaker:v6_du # mood:v6_du=sharp
照鲤退回岸侧。没有人抛下他们，可刚才还能赶上的窗口已经合拢。 # beat:c_storm_act_11 # scene:v6_storm # cast:v6_zhaoli,v6_du,v6_he # speaker:narrator
}
- final == 2:
你跑上仓前高处，先举两次灯，再指石墩外的来路。主事的大船终于看见你。 # beat:c_storm_act_12 # scene:v6_storm # cast:v6_zhaoli,v6_du,v6_he # speaker:narrator
沿右侧进，听篙声！别把岸边人当成挡路的！ # beat:c_storm_act_13 # scene:v6_storm # cast:v6_yan,v6_zhaoli,v6_du # speaker:v6_yan # mood:v6_yan=intent
救援比你想得慢，也比小船稳。你站在雨里数灯，第一次盼着自己什么都不必出剑。 # beat:c_storm_act_14 # scene:v6_storm # cast:v6_yan,v6_zhaoli,v6_du # speaker:narrator
- final == 3:
你回到空了一半的会坪。锣被雨打得沉闷，高秉还守着没写完的名册。 # beat:c_storm_act_15 # scene:v6_storm # cast:v6_yan,v6_zhaoli,v6_du # speaker:narrator
还有人在渡口。现在要求开试，你得让回来的人也有机会。 # beat:c_storm_act_16 # scene:v6_storm # cast:v6_gao,v6_yan,v6_zhaoli # speaker:v6_gao # mood:v6_gao=neutral
我来求的正是这个。不是趁他们缺席先拿走一场。 # beat:c_storm_act_17 # scene:v6_storm # cast:v6_gao,v6_yan,v6_zhaoli # speaker:you
- else:
你接过乔砚生左肩的重量。最后一队人经过汤二娘摊前时，她把整扇门板搭进泥里。 # beat:c_storm_act_18 # scene:v6_storm # cast:v6_gao,v6_yan,v6_zhaoli # speaker:narrator
我没拿到差事。还把手弄成这样。 # beat:c_storm_act_19 # scene:v6_storm # cast:v6_qiao,v6_gao,v6_yan # speaker:v6_qiao # mood:v6_qiao=uneasy
先把他们送进屋。回去以后，你可以坐着骂我多管闲事。 # beat:c_storm_act_20 # scene:v6_storm # cast:v6_qiao,v6_gao,v6_yan # speaker:you
}
-> v6_canon_reckon


=== storm_return ===
临时药棚里，凌苇把每一块湿布换成干的。苏晚澄的册子放在梁上，陆汀舟没有碰。 # beat:c_storm_return_1 # scene:v6_storm # cast:v6_su,v6_lu,v6_ling # speaker:narrator
先喘气，再说自己还能干什么。喘不上气的人，我一律不听大话。 # beat:c_storm_return_2 # scene:v6_storm # cast:v6_su,v6_lu,v6_ling # speaker:v6_ling # mood:v6_ling=neutral
各处人数正在核，不说一个都不少，直到最后一个真的进门。 # beat:c_storm_return_3 # scene:v6_storm # cast:v6_su,v6_lu,v6_ling # speaker:v6_su # mood:v6_su=neutral
你可以坐一会儿。人不是一直站着，才算没退。 # beat:c_storm_return_4 # scene:v6_storm # cast:v6_su,v6_lu,v6_ling # speaker:v6_lu # mood:v6_lu=calm
等人回来，比在场上等下一招还难。 # beat:c_storm_return_5 # scene:v6_storm # cast:v6_su,v6_lu,v6_ling # speaker:you
因为这回你没有一柄剑能插进每一处。学会把手从不该抢的地方拿开，也难。 # beat:c_storm_return_6 # scene:v6_storm # cast:v6_su,v6_lu,v6_ling # speaker:v6_ling # mood:v6_ling=neutral
门外传来三次篙声。有人提灯，沿着泥路走近。 # beat:c_storm_return_7 # scene:v6_storm # cast:v6_su,v6_lu,v6_ling # speaker:narrator
* [先问是否有人未到，不急着说赢了。 # cid:account_all]
  ~ account = true
  慢慢数。还缺谁，我们就先说那个人的名字。 # beat:c_storm_return_8 # scene:v6_storm # cast:v6_su,v6_lu,v6_ling # speaker:you
  我和你数。不拿一句大功告成，盖住还没坐到这里的人。 # beat:c_storm_return_9 # scene:v6_storm # cast:v6_su,v6_lu,v6_ling # speaker:v6_su # mood:v6_su=calm
  -> storm_resolution
* [先接回受伤的人，把清点交给主事。 # cid:help_wounded]
  ~ account = false
  凌苇要干布，给我一叠。姓名你们数，我先把人接进来。 # beat:c_storm_return_10 # scene:v6_storm # cast:v6_su,v6_lu,v6_ling # speaker:you
  好。先扶肩，不要拉伤处。没查明的伤，不用一句没事替他定了。 # beat:c_storm_return_11 # scene:v6_storm # cast:v6_su,v6_lu,v6_ling # speaker:v6_ling # mood:v6_ling=intent
  -> storm_resolution


=== storm_resolution ===
雨停在将亮未亮的时候。会坪还在，东棚只剩木架，米袋上全是鞋印。 # beat:c_storm_resolution_1 # scene:v6_dawn # cast:v6_zhaoli,v6_qiao,v6_yan # speaker:narrator
急难记急难，试艺记试艺。不能因为救人，就把谁原本没赢的那场改成赢。 # beat:c_storm_resolution_2 # scene:v6_dawn # cast:v6_zhaoli,v6_qiao,v6_yan # speaker:v6_yan # mood:v6_yan=neutral
也不能因为迟到，就把送到药的人写成没来。 # beat:c_storm_resolution_3 # scene:v6_dawn # cast:v6_zhaoli,v6_qiao,v6_yan # speaker:v6_qiao # mood:v6_qiao=neutral
是。以后这两册分开，谁都能来看。 # beat:c_storm_resolution_4 # scene:v6_dawn # cast:v6_zhaoli,v6_qiao,v6_yan # speaker:v6_yan # mood:v6_yan=calm
那船上的人呢？ # beat:c_storm_resolution_5 # scene:v6_dawn # cast:v6_zhaoli,v6_qiao,v6_yan # speaker:v6_zhaoli # mood:v6_zhaoli=neutral
每个人都来自己报一声。该赔的、该修的，今日起一桩桩认。 # beat:c_storm_resolution_6 # scene:v6_dawn # cast:v6_zhaoli,v6_qiao,v6_yan # speaker:v6_yan # mood:v6_yan=neutral
你看见严平章先在损失那一栏，写下了自己的名字。 # beat:c_storm_resolution_7 # scene:v6_dawn # cast:v6_zhaoli,v6_qiao,v6_yan # speaker:narrator
{
- final == 1 and anchor and (rope or water_read or terrain) and wound < 3:
船没了，刘篙和老人都到了。这一次不是我们把水赢了，是最后那一下终于肯松手。 # beat:c_storm_resolution_8 # scene:v6_dawn # cast:v6_zhaoli,v6_qiao,v6_yan # speaker:v6_zhaoli # mood:v6_zhaoli=calm
我手里那段，也没只靠我。 # beat:c_storm_resolution_9 # scene:v6_dawn # cast:v6_zhaoli,v6_qiao,v6_yan # speaker:you
照鲤解下红绳，放进你掌心。这回没有急着说下次。 # beat:c_storm_resolution_10 # scene:v6_dawn # cast:v6_zhaoli,v6_qiao,v6_yan # speaker:narrator
  ~ rescued = true
- final == 1 and wound >= 3:
你肋伤不能再扛重。人靠大船接回来了，你这口气还得慢慢养。 # beat:c_storm_resolution_11 # scene:v6_dawn # cast:v6_ling,v6_zhaoli,v6_qiao # speaker:v6_ling # mood:v6_ling=intent
这次我扶你。你不许说自己不重，我也不会信。 # beat:c_storm_resolution_12 # scene:v6_dawn # cast:v6_ling,v6_zhaoli,v6_qiao # speaker:v6_qiao # mood:v6_qiao=uneasy
  ~ rescued = false
- final == 1:
刘篙最后才离船，老人被先送出来。他替船挡的一下，左腿没保住原来的利落。 # beat:c_storm_resolution_13 # scene:v6_dawn # cast:v6_du,v6_ling,v6_zhaoli # speaker:v6_du # mood:v6_du=neutral
我答应要把人带回来。人回来了，可我不能说一切都跟以前一样。 # beat:c_storm_resolution_14 # scene:v6_dawn # cast:v6_du,v6_ling,v6_zhaoli # speaker:v6_zhaoli # mood:v6_zhaoli=uneasy
那我们也不那么说。往后的事，不能因为故事到这里就算了。 # beat:c_storm_resolution_15 # scene:v6_dawn # cast:v6_du,v6_ling,v6_zhaoli # speaker:you
  ~ rescued = false
- else:
大船接到了。最后一程很慢，没人少，船损还要慢慢赔。 # beat:c_storm_resolution_16 # scene:v6_dawn # cast:v6_du,v6_ling,v6_zhaoli # speaker:v6_du # mood:v6_du=calm
我们也有不能一口气解决的事。这回至少都能坐下说。 # beat:c_storm_resolution_17 # scene:v6_dawn # cast:v6_du,v6_ling,v6_zhaoli # speaker:v6_zhaoli # mood:v6_zhaoli=neutral
  ~ rescued = true
}
* [留下修渡、还债，把未完的事做完。 # cid:aftermath_stay]
  ~ future = 1
  屋顶、破网、坏船，先做看得见的一件。欠的名字，一个个去找。 # beat:c_storm_resolution_18 # scene:v6_dawn # cast:v6_du,v6_ling,v6_zhaoli # speaker:you
  那就从拆这架棚开始。回来了，还得干活。 # beat:c_storm_resolution_19 # scene:v6_dawn # cast:v6_he,v6_du,v6_ling # speaker:v6_he # mood:v6_he=calm
  -> after_choice
* [准备远行，先把承诺交代清楚。 # cid:aftermath_road]
  ~ future = 2
  我想继续走。但不拿一句江湖再见，替自己还没还的账。 # beat:c_storm_resolution_20 # scene:v6_dawn # cast:v6_he,v6_du,v6_ling # speaker:you
  去每个人面前说。留下地址，比留一句漂亮话难，也有用。 # beat:c_storm_resolution_21 # scene:v6_dawn # cast:v6_su,v6_he,v6_du # speaker:v6_su # mood:v6_su=calm
  -> after_choice
* [回馆休养，把学来的教给后来者。 # cid:aftermath_teach]
  ~ future = 3
  包小满还等着学站稳。我先教他别怎么摔，再和师父一起补瓦。 # beat:c_storm_resolution_22 # scene:v6_dawn # cast:v6_su,v6_he,v6_du # speaker:you
  别一进门就说你什么都懂了。那半间房，还装不下你这么多道理。 # beat:c_storm_resolution_23 # scene:v6_dawn # cast:v6_qiao,v6_su,v6_he # speaker:v6_qiao # mood:v6_qiao=amused
  -> after_choice


=== ending_harbor ===
你留在青蒲渡。护渡的差事没有让谁一夜成名，却让修桥、开仓、教人的工钱都有了着落。 # beat:c_ending_harbor_1 # scene:v6_end_harbor # cast:v6_zhaoli,v6_he,v6_aunt # speaker:narrator
新板别急着上漆，里头还潮。今天要是不装样子，明年就不用重修。 # beat:c_ending_harbor_2 # scene:v6_end_harbor # cast:v6_zhaoli,v6_he,v6_aunt # speaker:v6_he # mood:v6_he=neutral
我这儿也是。账慢慢还，别拿一阵子风光抵一年的饭。 # beat:c_ending_harbor_3 # scene:v6_end_harbor # cast:v6_zhaoli,v6_he,v6_aunt # speaker:v6_aunt # mood:v6_aunt=amused
我先把这根钉敲直。 # beat:c_ending_harbor_4 # scene:v6_end_harbor # cast:v6_zhaoli,v6_he,v6_aunt # speaker:you
下午有一条船，过来搭手？不是有危险，就是缺人。 # beat:c_ending_harbor_5 # scene:v6_end_harbor # cast:v6_zhaoli,v6_he,v6_aunt # speaker:v6_zhaoli # mood:v6_zhaoli=calm
来。普通的那一条，也有人要回家。 # beat:c_ending_harbor_6 # scene:v6_end_harbor # cast:v6_zhaoli,v6_he,v6_aunt # speaker:you # cg:dawn
潮又涨起来。你们没有把江湖变小，只让它在这一处，多留了一段能安稳走过的岸。 # beat:c_ending_harbor_7 # scene:v6_end_harbor # cast:v6_zhaoli,v6_he,v6_aunt # speaker:narrator # ending:harbor
-> END


=== ending_name ===
补试那日，容既白主动来约同一块坪。棍尾换了走法，你也没把上次那一剑当成万能的解。 # beat:c_ending_name_1 # scene:v6_end_name # cast:v6_rong,v6_xu,v6_su # speaker:narrator
再来。今天你不用让，也别以为昨天的我还站在原地。 # beat:c_ending_name_2 # scene:v6_end_name # cast:v6_rong,v6_xu,v6_su # speaker:v6_rong # mood:v6_rong=intent
你们交手到最后一轮，各退半步。你凭新的一手先碰到肩衣，这一次，没有同时中身。 # beat:c_ending_name_3 # scene:v6_end_name # cast:v6_rong,v6_xu,v6_su # speaker:narrator
记下了。只记这场，不替你写进任何大榜。 # beat:c_ending_name_4 # scene:v6_end_name # cast:v6_rong,v6_xu,v6_su # speaker:v6_su # mood:v6_su=neutral
这场就够了。 # beat:c_ending_name_5 # scene:v6_end_name # cast:v6_rong,v6_xu,v6_su # speaker:you
够今天的。明年的你还得自己来。 # beat:c_ending_name_6 # scene:v6_end_name # cast:v6_rong,v6_xu,v6_su # speaker:v6_xu # mood:v6_xu=amused
后来米行的人照样催工钱，馆里的瓦照样要修。可你知道自己赢过一场，也知道对手没有替你输。 # beat:c_ending_name_7 # scene:v6_end_name # cast:v6_rong,v6_xu,v6_su # speaker:narrator # cg:none
没有人叫你宗师。有人叫你的名字，问下一回什么时候来。你认真给了一个能赴的日期。 # beat:c_ending_name_8 # scene:v6_end_name # cast:v6_rong,v6_xu,v6_su # speaker:narrator # ending:name
-> END


=== ending_together5 ===
你和乔砚生随镖队再上路。他的腕子还没能任意使剑，裴雁秋给他换了押尾报路的差事。 # beat:c_ending_together5_1 # scene:v6_end_departure # cast:v6_qiao,v6_pei,v6_zhaoli # speaker:narrator
以前总觉得得拿剑站最前。现在最后一个走，也能把人叫齐。 # beat:c_ending_together5_2 # scene:v6_end_departure # cast:v6_qiao,v6_pei,v6_zhaoli # speaker:v6_qiao # mood:v6_qiao=amused
我若走快了，你就喊。不许只在心里骂我。 # beat:c_ending_together5_3 # scene:v6_end_departure # cast:v6_qiao,v6_pei,v6_zhaoli # speaker:you
那我能一边喊一边骂吗？ # beat:c_ending_together5_4 # scene:v6_end_departure # cast:v6_qiao,v6_pei,v6_zhaoli # speaker:v6_qiao # mood:v6_qiao=neutral
看前头的坡。有力气斗嘴，留一点抬车。 # beat:c_ending_together5_5 # scene:v6_end_departure # cast:v6_qiao,v6_pei,v6_zhaoli # speaker:v6_pei # mood:v6_pei=amused
渡口这头我守着。你们回来，别再拿米袋当刺客。 # beat:c_ending_together5_6 # scene:v6_end_departure # cast:v6_qiao,v6_pei,v6_zhaoli # speaker:v6_zhaoli # mood:v6_zhaoli=neutral
你们各自背一半行李，谁也没有替另一人写完前程。 # beat:c_ending_together5_7 # scene:v6_end_together5 # cast:v6_qiao,v6_pei # speaker:narrator # cg:none
路还会分岔，伤也不会因为同行就消失。这回你们学会的，是分开之前先开口，重逢时仍肯听。 # beat:c_ending_together5_8 # scene:v6_end_together5 # cast:v6_qiao,v6_pei # speaker:narrator # ending:together5
-> END


=== ending_teacher ===
你回石梁馆，先养手，再教刚入门的孩子。包小满第一日就问，学多久能打赢许竞川。 # beat:c_ending_teacher_1 # scene:v6_end_teacher # cast:v6_han,v6_qiao,v6_bao # speaker:narrator
我不知道。今天先学车歪了，怎样不跟着倒。 # beat:c_ending_teacher_2 # scene:v6_end_teacher # cast:v6_han,v6_qiao,v6_bao # speaker:you
那不是回到搬米吗？ # beat:c_ending_teacher_3 # scene:v6_end_teacher # cast:v6_han,v6_qiao,v6_bao # speaker:v6_bao # mood:v6_bao=uneasy
我出门一圈，也才知道原来搬米有这么多事。 # beat:c_ending_teacher_4 # scene:v6_end_teacher # cast:v6_han,v6_qiao,v6_bao # speaker:v6_qiao # mood:v6_qiao=amused
教人之前，把你那一回做错的也讲给他听。 # beat:c_ending_teacher_5 # scene:v6_end_teacher # cast:v6_han,v6_qiao,v6_bao # speaker:v6_han # mood:v6_han=neutral
你照做了，没有把伤说成英雄的勋章。孩子听完，还敢问你第二遍。 # beat:c_ending_teacher_6 # scene:v6_end_teacher # cast:v6_han,v6_qiao,v6_bao # speaker:narrator
再来。今天没有谁必须先证明自己特别。 # beat:c_ending_teacher_7 # scene:v6_end_teacher # cast:v6_han,v6_qiao,v6_bao # speaker:you # cg:none
新瓦盖住了最漏的地方。雨盆没有扔，放在门边养了一株小草。你仍在学，也开始让别人敢于学。 # beat:c_ending_teacher_8 # scene:v6_end_teacher # cast:v6_han,v6_qiao,v6_bao # speaker:narrator # ending:teacher
-> END


=== ending_captain ===
你留在青蒲渡，与江照鲤分领两段水路。旧船没有凭空回来，赔船的账压在第一年的工钱里。 # beat:c_ending_captain_1 # scene:v6_end_captain # cast:v6_zhaoli,v6_du,v6_cheng # speaker:narrator
当领船的人，先学会每月少买两条新腰带。 # beat:c_ending_captain_2 # scene:v6_end_captain # cast:v6_zhaoli,v6_du,v6_cheng # speaker:v6_zhaoli # mood:v6_zhaoli=amused
你哪月买过？别拿笑话把该算的藏了。 # beat:c_ending_captain_3 # scene:v6_end_captain # cast:v6_zhaoli,v6_du,v6_cheng # speaker:v6_du # mood:v6_du=neutral
他这句我同意。今天还差谁的船钱，先报清。 # beat:c_ending_captain_4 # scene:v6_end_captain # cast:v6_zhaoli,v6_du,v6_cheng # speaker:you
我报。还有，明天那段我想自己掌桨，你们在岸上看一次。 # beat:c_ending_captain_5 # scene:v6_end_captain # cast:v6_zhaoli,v6_du,v6_cheng # speaker:v6_cheng # mood:v6_cheng=intent
好。我先看你准备，不替你把每个险处都走掉。 # beat:c_ending_captain_6 # scene:v6_end_captain # cast:v6_zhaoli,v6_du,v6_cheng # speaker:v6_zhaoli # mood:v6_zhaoli=calm
红绳挂在新船头，末端还是能一手解开的活结。 # beat:c_ending_captain_7 # scene:v6_end_captain # cast:v6_zhaoli,v6_du,v6_cheng # speaker:narrator # cg:none
后来有人问，那年是谁救了渡口。照鲤把船册翻开，指给他看许多个名字。你的名字在其中，有自己的那一段。 # beat:c_ending_captain_8 # scene:v6_end_captain # cast:v6_zhaoli,v6_du,v6_cheng # speaker:narrator # ending:captain
-> END


=== ending_apart ===
你离开青蒲，没有把一路相识都装进同行的承诺。乔砚生留馆养腕，照鲤守船，你向下一处城走。 # beat:c_ending_apart_1 # scene:v6_end_apart # cast:v6_su,v6_lu,v6_qiao # speaker:narrator
你想走，就走。别替我留，也别把我没走说成不敢。 # beat:c_ending_apart_2 # scene:v6_end_apart # cast:v6_su,v6_lu,v6_qiao # speaker:v6_qiao # mood:v6_qiao=calm
知道。写信给你，说我亲眼见的，不抄别人吹的。 # beat:c_ending_apart_3 # scene:v6_end_apart # cast:v6_su,v6_lu,v6_qiao # speaker:you
欠的事我替你留着记，不替你去还。下回路过，自己一一敲门。 # beat:c_ending_apart_4 # scene:v6_end_apart # cast:v6_su,v6_lu,v6_qiao # speaker:v6_su # mood:v6_su=neutral
要是记不得名字，就说明你走太急。先回来吃顿饭。 # beat:c_ending_apart_5 # scene:v6_end_apart # cast:v6_su,v6_lu,v6_qiao # speaker:v6_lu # mood:v6_lu=amused
你没有拿到所有人的认可。有人送到路口，有人只在窗边点头，都是真实给出的分量。 # beat:c_ending_apart_6 # scene:v6_end_apart # cast:v6_su,v6_lu,v6_qiao # speaker:narrator # cg:none
远行的代价，是不能同时在每一盏灯下坐着。你把能到的地址写好，才把第一步踏到无人替你保证的路上。 # beat:c_ending_apart_7 # scene:v6_end_apart # cast:none # speaker:narrator # ending:apart
-> END


=== ending_scar ===
你休养了整个秋天。肋伤让你不能像从前一样猛转，第一次试着抬木料时，疼得蹲了下去。 # beat:c_ending_scar_1 # scene:v6_end_scar # cast:v6_ling,v6_qiao,v6_he # speaker:narrator
不是说了三个月？你想把三个月养成三年？ # beat:c_ending_scar_2 # scene:v6_end_scar # cast:v6_ling,v6_qiao,v6_he # speaker:v6_ling # mood:v6_ling=sharp
这回轮到我说你嘴硬了。木料放下，不会自己跑。 # beat:c_ending_scar_3 # scene:v6_end_scar # cast:v6_ling,v6_qiao,v6_he # speaker:v6_qiao # mood:v6_qiao=uneasy
我以为只试一下。 # beat:c_ending_scar_4 # scene:v6_end_scar # cast:v6_ling,v6_qiao,v6_he # speaker:you
我年轻时也这么想。你的手不是坏了就换一根的木头。 # beat:c_ending_scar_5 # scene:v6_end_scar # cast:v6_ling,v6_qiao,v6_he # speaker:v6_he # mood:v6_he=neutral
人最终由大船接回，代价没有被一句好结局抵掉。你改了练法，也学着接受同伴替你搬那根梁。 # beat:c_ending_scar_6 # scene:v6_end_scar # cast:v6_ling,v6_qiao,v6_he # speaker:narrator
明天还来。但不抬这一头，先量尺寸。 # beat:c_ending_scar_7 # scene:v6_end_scar # cast:v6_ling,v6_qiao,v6_he # speaker:you # cg:quiet
你没能按原定的日子上路。窗外有人来，有人走；你仍能把能做的一件事做完，慢慢重新约下一次。 # beat:c_ending_scar_8 # scene:v6_end_scar # cast:v6_ling,v6_qiao,v6_he # speaker:narrator # ending:scar
-> END


=== ending_lost ===
刘篙保住了命，左腿却再不能长久站在晃船上。之后的每次点名，他都在岸上答应。 # beat:c_ending_lost_1 # scene:v6_end_lost # cast:v6_zhaoli,v6_liu,v6_han # speaker:narrator
别每次看我都先问疼不疼。我还认船号，能管发船。 # beat:c_ending_lost_2 # scene:v6_end_lost # cast:v6_zhaoli,v6_liu,v6_han # speaker:v6_liu # mood:v6_liu=uneasy
好。哪条先走，你报，我听。 # beat:c_ending_lost_3 # scene:v6_end_lost # cast:v6_zhaoli,v6_liu,v6_han # speaker:you
我把领船的钱分出一份赔他，不算替你洗清，也不算替我。 # beat:c_ending_lost_4 # scene:v6_end_lost # cast:v6_zhaoli,v6_liu,v6_han # speaker:v6_zhaoli # mood:v6_zhaoli=neutral
你回到旧桩湾看过许多次。那一刻没学会的松手，不能靠后来再说一百遍补回去。 # beat:c_ending_lost_5 # scene:v6_end_lost # cast:v6_zhaoli,v6_liu,v6_han # speaker:narrator
记住不等于永远跪在那里。你以后握的是别人要用的绳，不是自己的惩罚。 # beat:c_ending_lost_6 # scene:v6_end_lost # cast:v6_zhaoli,v6_liu,v6_han # speaker:v6_han # mood:v6_han=calm
你开始每次先试结，每次把没回来做原来那份活的人，也写进报平安的信里。 # beat:c_ending_lost_7 # scene:v6_end_lost # cast:v6_zhaoli,v6_liu,v6_han # speaker:narrator # cg:none
江湖里少了一位掌桨的人，多了一位在岸上报船的人。你们继续过日子，连同那场没有被好话遮住的失去。 # beat:c_ending_lost_8 # scene:v6_end_lost # cast:v6_zhaoli,v6_liu,v6_han # speaker:narrator # ending:lost
-> END


=== last_lesson ===
天擦黑，包小满来问学费，手里攥着几枚铜钱，没敢先递。 # beat:c_last_lesson_1 # scene:v6_hall # cast:v6_han,v6_qiao,v6_bao # speaker:narrator
我娘说我笨，别去糟蹋好木剑。这些钱，够学怎么站吗？ # beat:c_last_lesson_2 # scene:v6_hall # cast:v6_han,v6_qiao,v6_bao # speaker:v6_bao # mood:v6_bao=uneasy
谁说学站就得先聪明？我小时候也—— # beat:c_last_lesson_3 # scene:v6_hall # cast:v6_han,v6_qiao,v6_bao # speaker:v6_qiao # mood:v6_qiao=sharp
也拿牙顶门。别总让孩子听这一件，换件不丢人的。 # beat:c_last_lesson_4 # scene:v6_hall # cast:v6_han,v6_qiao,v6_bao # speaker:v6_han # mood:v6_han=amused
那没有太多能换的。 # beat:c_last_lesson_5 # scene:v6_hall # cast:v6_han,v6_qiao,v6_bao # speaker:v6_qiao # mood:v6_qiao=uneasy
韩鹭石取一把最旧的木剑，没给孩子，先让他把门口那盆水端进来。 # beat:c_last_lesson_6 # scene:v6_hall # cast:v6_han,v6_qiao,v6_bao # speaker:narrator
不是要学剑吗？ # beat:c_last_lesson_7 # scene:v6_hall # cast:v6_han,v6_qiao,v6_bao # speaker:v6_bao # mood:v6_bao=neutral
是。你端着盆还记得看脚下，待会儿拿着剑也别忘。水洒了，先擦，不能让下一个人摔。 # beat:c_last_lesson_8 # scene:v6_hall # cast:v6_han,v6_qiao,v6_bao # speaker:v6_han # mood:v6_han=neutral
师父，这一课你当年没这么说。 # beat:c_last_lesson_9 # scene:v6_hall # cast:v6_han,v6_qiao,v6_bao # speaker:you
当年你把盆扣在头上，我没来得及。 # beat:c_last_lesson_10 # scene:v6_hall # cast:v6_han,v6_qiao,v6_bao # speaker:v6_han # mood:v6_han=neutral
* [陪小满端水，讲自己摔过的地方。 # cid:lesson_stand]
  ~ bao_help = true
  你不用学我。我先把我掉过的坑给你指明白。 # beat:c_last_lesson_11 # scene:v6_hall # cast:v6_han,v6_qiao,v6_bao # speaker:you
  真掉过水沟？不是为了哄我编的？ # beat:c_last_lesson_12 # scene:v6_hall # cast:v6_han,v6_qiao,v6_bao # speaker:v6_bao # mood:v6_bao=amused
  真掉。还不止一回。 # beat:c_last_lesson_13 # scene:v6_hall # cast:v6_han,v6_qiao,v6_bao # speaker:v6_qiao # mood:v6_qiao=amused
  -> last_lesson_after
* [让他自己试，在旁边等他开口。 # cid:lesson_ask]
  ~ bao_help = false
  你先走。走不稳就停，想问的时候我在这儿。 # beat:c_last_lesson_14 # scene:v6_hall # cast:v6_han,v6_qiao,v6_bao # speaker:you
  小满一路盯水，险些撞柱，自己停了下来。没有人先笑他。 # beat:c_last_lesson_15 # scene:v6_hall # cast:v6_han,v6_qiao,v6_bao # speaker:narrator
  不是只看盆，也不是只看脚。得看看前头。 # beat:c_last_lesson_16 # scene:v6_hall # cast:v6_han,v6_qiao,v6_bao # speaker:v6_bao # mood:v6_bao=intent
  -> last_lesson_after


=== last_lesson_after ===
水盆放稳，孩子终于松开了手。韩鹭石只收一枚铜钱，让他回去先跟母亲讲清。 # beat:c_last_lesson_after_1 # scene:v6_hall # cast:v6_han,v6_qiao,v6_bao # speaker:narrator
别让她等到天黑，以为你把学剑当失踪。 # beat:c_last_lesson_after_2 # scene:v6_hall # cast:v6_han,v6_qiao,v6_bao # speaker:v6_han # mood:v6_han=neutral
明日先搬米，后日你们回来，我再来。 # beat:c_last_lesson_after_3 # scene:v6_hall # cast:v6_han,v6_qiao,v6_bao # speaker:v6_bao # mood:v6_bao=intent
嗯，我们也不是出了门，就能忘记谁在等。 # beat:c_last_lesson_after_4 # scene:v6_hall # cast:v6_han,v6_qiao,v6_bao # speaker:v6_qiao # mood:v6_qiao=calm
木剑留在门边。你想起自己第一次来时，也没敢先摸它。 # beat:c_last_lesson_after_5 # scene:v6_hall # cast:v6_han,v6_qiao,v6_bao # speaker:narrator
-> hall_leave


=== charred_cake ===
安福端进半盘焦饼，说只收半价。乔砚生盯着焦边，神情比看对手还慎重。 # beat:c_charred_cake_1 # scene:v6_inn # cast:v6_an,v6_zhaoli,v6_qiao # speaker:narrator
别看黑，心是软的。跟我这个人一样。 # beat:c_charred_cake_2 # scene:v6_inn # cast:v6_an,v6_zhaoli,v6_qiao # speaker:v6_an # mood:v6_an=neutral
上个月也是这句。那回心还没熟。 # beat:c_charred_cake_3 # scene:v6_inn # cast:v6_an,v6_zhaoli,v6_qiao # speaker:v6_zhaoli # mood:v6_zhaoli=amused
你怎么专记这些。 # beat:c_charred_cake_4 # scene:v6_inn # cast:v6_an,v6_zhaoli,v6_qiao # speaker:v6_an # mood:v6_an=uneasy
吃下去的人得自己记。 # beat:c_charred_cake_5 # scene:v6_inn # cast:v6_an,v6_zhaoli,v6_qiao # speaker:you
他想把盘撤走，棚外两个没买到热食的脚夫又望了过来。 # beat:c_charred_cake_6 # scene:v6_inn # cast:v6_an,v6_zhaoli,v6_qiao # speaker:narrator
二娘说米里掉头发要筛米钱，这个烧黑怎么算？ # beat:c_charred_cake_7 # scene:v6_inn # cast:v6_an,v6_zhaoli,v6_qiao # speaker:v6_qiao # mood:v6_qiao=neutral
算我急。想趁大雨前多做一炉，结果全赶一块儿了。 # beat:c_charred_cake_8 # scene:v6_inn # cast:v6_an,v6_zhaoli,v6_qiao # speaker:v6_an # mood:v6_an=neutral
火就这么大，你非要烤两盘。别说是老天害你。 # beat:c_charred_cake_9 # scene:v6_inn # cast:v6_an,v6_zhaoli,v6_qiao # speaker:v6_zhaoli # mood:v6_zhaoli=neutral
安福挑出了焦透的几块，没有继续拿笑话挡。 # beat:c_charred_cake_10 # scene:v6_inn # cast:v6_an,v6_zhaoli,v6_qiao # speaker:narrator
* [分还能吃的，焦透的别再卖。 # cid:cake_share]
  能吃的大家分。焦透的别再说是我们不识货。 # beat:c_charred_cake_11 # scene:v6_inn # cast:v6_an,v6_zhaoli,v6_qiao # speaker:you
  行。这盘我请，下一炉一炉一炉烤。 # beat:c_charred_cake_12 # scene:v6_inn # cast:v6_an,v6_zhaoli,v6_qiao # speaker:v6_an # mood:v6_an=calm
  -> charred_cake_after
* [帮他减半火上的饼，等一炉新的。 # cid:cake_work]
  我不替你把焦饼说好吃。人还等着，下一炉做稳点。 # beat:c_charred_cake_13 # scene:v6_inn # cast:v6_an,v6_zhaoli,v6_qiao # speaker:you
  我帮你看雨，不用一人顾三头。 # beat:c_charred_cake_14 # scene:v6_inn # cast:v6_an,v6_zhaoli,v6_qiao # speaker:v6_zhaoli # mood:v6_zhaoli=calm
  -> charred_cake_after


=== charred_cake_after ===
新饼出炉，没有人叫好。安福把最厚的一块给等得最久的脚夫，盘里少一块，也没显得亏。 # beat:c_charred_cake_after_1 # scene:v6_inn # cast:v6_an,v6_zhaoli,v6_qiao # speaker:narrator
总觉得快赢一次，屋里就都能好。可修瓦、上药、吃饭，哪件都不肯等那一次。 # beat:c_charred_cake_after_2 # scene:v6_inn # cast:v6_an,v6_zhaoli,v6_qiao # speaker:v6_qiao # mood:v6_qiao=calm
赢还是想赢。别让所有事都饿着肚子等你。 # beat:c_charred_cake_after_3 # scene:v6_inn # cast:v6_an,v6_zhaoli,v6_qiao # speaker:you
先吃。这个不焦，别等凉了再怨江湖不好混。 # beat:c_charred_cake_after_4 # scene:v6_inn # cast:v6_an,v6_zhaoli,v6_qiao # speaker:v6_zhaoli # mood:v6_zhaoli=amused
你们吃完才起身。雨声不再像一整片，开始听得见一滴滴落地。 # beat:c_charred_cake_after_5 # scene:v6_inn # cast:v6_an,v6_zhaoli,v6_qiao # speaker:narrator
-> inn_rival


=== farewell ===
分路之前，你们才想起换洗衣装在同一个包。两人拆绳结，越拆越乱。 # beat:c_farewell_1 # scene:v6_depart # cast:v6_zhaoli,v6_qiao,v6_su # speaker:narrator
我说别绑死，你非说背着不散。 # beat:c_farewell_2 # scene:v6_depart # cast:v6_zhaoli,v6_qiao,v6_su # speaker:v6_qiao # mood:v6_qiao=uneasy
你当时叫它跑到洛阳也不散。 # beat:c_farewell_3 # scene:v6_depart # cast:v6_zhaoli,v6_qiao,v6_su # speaker:you
没到洛阳，也没散。就是谁都解不开。 # beat:c_farewell_4 # scene:v6_depart # cast:v6_zhaoli,v6_qiao,v6_su # speaker:v6_zhaoli # mood:v6_zhaoli=amused
小刀在这里。剪的时候别割衣服，别再多一笔赔偿。 # beat:c_farewell_5 # scene:v6_depart # cast:v6_zhaoli,v6_qiao,v6_su # speaker:v6_su # mood:v6_su=neutral
包里滚出一只掉漆木马。乔砚生赶紧捡起来。 # beat:c_farewell_6 # scene:v6_depart # cast:v6_zhaoli,v6_qiao,v6_su # speaker:narrator
我妹塞的。说出远门带匹马，跑得快。 # beat:c_farewell_7 # scene:v6_depart # cast:v6_zhaoli,v6_qiao,v6_su # speaker:v6_qiao # mood:v6_qiao=uneasy
那你给我半匹？ # beat:c_farewell_8 # scene:v6_depart # cast:v6_zhaoli,v6_qiao,v6_su # speaker:you
你想把她的马锯了？ # beat:c_farewell_9 # scene:v6_depart # cast:v6_zhaoli,v6_qiao,v6_su # speaker:v6_qiao # mood:v6_qiao=sharp
* [木马留给他，到会场再拿出来看。 # cid:horse_keep]
  你带着。不是要有多出息，就是让我知道你也到了。 # beat:c_farewell_10 # scene:v6_depart # cast:v6_zhaoli,v6_qiao,v6_su # speaker:you
  行。先给你看马，再给你看人。 # beat:c_farewell_11 # scene:v6_depart # cast:v6_zhaoli,v6_qiao,v6_su # speaker:v6_qiao # mood:v6_qiao=calm
  -> farewell_after
* [借笔画木马，各收半张图。 # cid:horse_draw]
  不锯马，锯纸。苏姑娘，能画匹很不像的马吗？ # beat:c_farewell_12 # scene:v6_depart # cast:v6_zhaoli,v6_qiao,v6_su # speaker:you
  我画马一向不像，这个要求很容易。 # beat:c_farewell_13 # scene:v6_depart # cast:v6_zhaoli,v6_qiao,v6_su # speaker:v6_su # mood:v6_su=amused
  你们各收半张，纸上马尾太长，谁都没舍得改。 # beat:c_farewell_14 # scene:v6_depart # cast:v6_zhaoli,v6_qiao,v6_su # speaker:narrator
  -> farewell_after


=== farewell_after ===
后日见。你们说的约，我也听见了。 # beat:c_farewell_after_1 # scene:v6_depart # cast:v6_zhaoli,v6_qiao,v6_su # speaker:v6_su # mood:v6_su=neutral
先到的人占一条长凳。谁都别在外头站着装客气。 # beat:c_farewell_after_2 # scene:v6_depart # cast:v6_zhaoli,v6_qiao,v6_su # speaker:v6_qiao # mood:v6_qiao=neutral
凳子别放漏雨那边。我会看水，不想吃饭也看。 # beat:c_farewell_after_3 # scene:v6_depart # cast:v6_zhaoli,v6_qiao,v6_su # speaker:v6_zhaoli # mood:v6_zhaoli=neutral
靠门右边那条，我记住了。 # beat:c_farewell_after_4 # scene:v6_depart # cast:v6_zhaoli,v6_qiao,v6_su # speaker:you
未知的远路，忽然有了一个具体要回来的地方。 # beat:c_farewell_after_5 # scene:v6_depart # cast:v6_zhaoli,v6_qiao,v6_su # speaker:narrator
-> v6_roles_anchor


=== road_shoes ===
补鞋的曾补正收摊。范遇一脚踏进棚，鞋底就张开了嘴。 # beat:c_road_shoes_1 # scene:v6_ridge # cast:v6_zeng,v6_fan,v6_pei # speaker:narrator
今早还好好的。 # beat:c_road_shoes_2 # scene:v6_ridge # cast:v6_zeng,v6_fan,v6_pei # speaker:v6_fan # mood:v6_fan=uneasy
今早你也没扛两个人的箱子。鞋比嘴诚实。 # beat:c_road_shoes_3 # scene:v6_ridge # cast:v6_zeng,v6_fan,v6_pei # speaker:v6_zeng # mood:v6_zeng=neutral
能走到前村吗？ # beat:c_road_shoes_4 # scene:v6_ridge # cast:v6_zeng,v6_fan,v6_pei # speaker:you
能。到那里还能不能回来，不保证。 # beat:c_road_shoes_5 # scene:v6_ridge # cast:v6_zeng,v6_fan,v6_pei # speaker:v6_zeng # mood:v6_zeng=neutral
先补。我们缺的是下一段还能走的脚。 # beat:c_road_shoes_6 # scene:v6_ridge # cast:v6_zeng,v6_fan,v6_pei # speaker:v6_pei # mood:v6_pei=neutral
曾补挑开旧线，里面垫着半张盖药箱的油纸。 # beat:c_road_shoes_7 # scene:v6_ridge # cast:v6_zeng,v6_fan,v6_pei # speaker:narrator
雨大，垫一下也能用。 # beat:c_road_shoes_8 # scene:v6_ridge # cast:v6_zeng,v6_fan,v6_pei # speaker:v6_fan # mood:v6_fan=neutral
能用不是一直能用。你扛的东西有人记，脚底烂了怎么不讲？ # beat:c_road_shoes_9 # scene:v6_ridge # cast:v6_zeng,v6_fan,v6_pei # speaker:v6_zeng # mood:v6_zeng=sharp
* [全队等他补好，不让他独自追。 # cid:shoe_wait]
  一起走，别为了赶上来，再把补好的踩坏。 # beat:c_road_shoes_10 # scene:v6_ridge # cast:v6_zeng,v6_fan,v6_pei # speaker:you
  那我不说不远了。到前村，实走还得半个时辰。 # beat:c_road_shoes_11 # scene:v6_ridge # cast:v6_zeng,v6_fan,v6_pei # speaker:v6_fan # mood:v6_fan=calm
  -> road_shoes_after
* [留下陪他，药车先走。 # cid:shoe_carry]
  我陪他。我们不抄险路，晚到就在村口报一声。 # beat:c_road_shoes_12 # scene:v6_ridge # cast:v6_zeng,v6_fan,v6_pei # speaker:you
  好。别让嘴替脚抢快。 # beat:c_road_shoes_13 # scene:v6_ridge # cast:v6_zeng,v6_fan,v6_pei # speaker:v6_pei # mood:v6_pei=neutral
  -> road_shoes_after


=== road_shoes_after ===
新线压进鞋底。曾补又塞了两根备用的，只收补这一双的钱。 # beat:c_road_shoes_after_1 # scene:v6_ridge # cast:v6_zeng,v6_fan,v6_pei # speaker:narrator
前村有孩子会补。把线给他看，别让我再跑过去替你换。 # beat:c_road_shoes_after_2 # scene:v6_ridge # cast:v6_zeng,v6_fan,v6_pei # speaker:v6_zeng # mood:v6_zeng=neutral
你教人讲伤，自己怎么不说腰硬？ # beat:c_road_shoes_after_3 # scene:v6_ridge # cast:v6_zeng,v6_fan,v6_pei # speaker:v6_fan # mood:v6_fan=amused
我腰硬。听见了？把凳子推过来。 # beat:c_road_shoes_after_4 # scene:v6_ridge # cast:v6_zeng,v6_fan,v6_pei # speaker:v6_zeng # mood:v6_zeng=neutral
听见了。原来实话可以这么说，不用先替谁丢脸。 # beat:c_road_shoes_after_5 # scene:v6_ridge # cast:v6_zeng,v6_fan,v6_pei # speaker:you
-> ridge_supper


=== marsh_lantern ===
过浅滩，程阿笠看见岸边一盏旧灯，向它摆了两下桨。 # beat:c_marsh_lantern_1 # scene:v6_reeds # cast:v6_cheng,v6_po,v6_du # speaker:narrator
她娘留的。以前跑夜船，看见灯就有热汤等。 # beat:c_marsh_lantern_2 # scene:v6_reeds # cast:v6_cheng,v6_po,v6_du # speaker:v6_po # mood:v6_po=neutral
婆婆，别讲给所有客人听。 # beat:c_marsh_lantern_3 # scene:v6_reeds # cast:v6_cheng,v6_po,v6_du # speaker:v6_cheng # mood:v6_cheng=uneasy
船上几个人，也不算所有。 # beat:c_marsh_lantern_4 # scene:v6_reeds # cast:v6_cheng,v6_po,v6_du # speaker:v6_du # mood:v6_du=calm
现在谁挂？ # beat:c_marsh_lantern_5 # scene:v6_reeds # cast:v6_cheng,v6_po,v6_du # speaker:you
我。出门挂，回来收。有时很晚，见它还亮着，就少慌一点。 # beat:c_marsh_lantern_6 # scene:v6_reeds # cast:v6_cheng,v6_po,v6_du # speaker:v6_cheng # mood:v6_cheng=neutral
也让等船的人知道能靠。哪怕只借一点光。 # beat:c_marsh_lantern_7 # scene:v6_reeds # cast:v6_cheng,v6_po,v6_du # speaker:v6_po # mood:v6_po=neutral
灯纸破了一角，火芯随风缩。阿笠看着，没先停桨。 # beat:c_marsh_lantern_8 # scene:v6_reeds # cast:v6_cheng,v6_po,v6_du # speaker:narrator
药要早到。灯回来再修。 # beat:c_marsh_lantern_9 # scene:v6_reeds # cast:v6_cheng,v6_po,v6_du # speaker:v6_cheng # mood:v6_cheng=neutral
你想现在修，就讲。别替全船决定谁都等不起。 # beat:c_marsh_lantern_10 # scene:v6_reeds # cast:v6_cheng,v6_po,v6_du # speaker:v6_du # mood:v6_du=neutral
* [靠岸只修漏风一角。 # cid:lamp_fix]
  不必整盏重做。我递纸，你修，大家等半刻。 # beat:c_marsh_lantern_11 # scene:v6_reeds # cast:v6_cheng,v6_po,v6_du # speaker:you
  谢谢。没说它只是个灯。 # beat:c_marsh_lantern_12 # scene:v6_reeds # cast:v6_cheng,v6_po,v6_du # speaker:v6_cheng # mood:v6_cheng=calm
  -> marsh_lantern_after
* [先送药，回程帮她修。 # cid:lamp_return]
  我替你记。若你忙忘了，我叫你一声。 # beat:c_marsh_lantern_13 # scene:v6_reeds # cast:v6_cheng,v6_po,v6_du # speaker:you
  嗯。不要怕我嫌多事。 # beat:c_marsh_lantern_14 # scene:v6_reeds # cast:v6_cheng,v6_po,v6_du # speaker:v6_cheng # mood:v6_cheng=calm
  -> marsh_lantern_after


=== marsh_lantern_after ===
灯在苇后缩成一点暖色。老杜半晌没讲话，忽然指了指远处灰线。 # beat:c_marsh_lantern_after_1 # scene:v6_reeds # cast:v6_cheng,v6_po,v6_du # speaker:narrator
那边浅，别走。以前也有一盏，前年风里倒了。 # beat:c_marsh_lantern_after_2 # scene:v6_reeds # cast:v6_cheng,v6_po,v6_du # speaker:v6_du # mood:v6_du=neutral
回去我查那根桩。 # beat:c_marsh_lantern_after_3 # scene:v6_reeds # cast:v6_cheng,v6_po,v6_du # speaker:v6_cheng # mood:v6_cheng=intent
我认灯，不认桩。你指，我记。 # beat:c_marsh_lantern_after_4 # scene:v6_reeds # cast:v6_cheng,v6_po,v6_du # speaker:you
地图没有这盏灯，船上的人却知道它照哪一段回家路。 # beat:c_marsh_lantern_after_5 # scene:v6_reeds # cast:v6_cheng,v6_po,v6_du # speaker:narrator
-> water_healer


=== two_swords ===
旗手任耕拿着小旗过斜踏板。陆汀舟让他转身，他差点把旗丢进木屑。 # beat:c_two_swords_1 # scene:v6_workshop # cast:v6_su,v6_lu,v6_ren # speaker:narrator
先别让他快，脚还没稳。 # beat:c_two_swords_2 # scene:v6_workshop # cast:v6_su,v6_lu,v6_ren # speaker:v6_su # mood:v6_su=sharp
教急了。先停，我换个说法。 # beat:c_two_swords_3 # scene:v6_workshop # cast:v6_su,v6_lu,v6_ren # speaker:v6_lu # mood:v6_lu=uneasy
我是不是不适合？爬杆也怕，走板也怕。 # beat:c_two_swords_4 # scene:v6_workshop # cast:v6_su,v6_lu,v6_ren # speaker:v6_ren # mood:v6_ren=neutral
怕可以讲。现在看旗什么时候受风，不是看你能装多久不怕。 # beat:c_two_swords_5 # scene:v6_workshop # cast:v6_su,v6_lu,v6_ren # speaker:v6_su # mood:v6_su=neutral
我初学怕窄岭，跟师兄太紧，把他的鞋踩掉一只。 # beat:c_two_swords_6 # scene:v6_workshop # cast:v6_su,v6_lu,v6_ren # speaker:v6_lu # mood:v6_lu=neutral
谁捡的？ # beat:c_two_swords_7 # scene:v6_workshop # cast:v6_su,v6_lu,v6_ren # speaker:you
我。下次看得特别仔细。 # beat:c_two_swords_8 # scene:v6_workshop # cast:v6_su,v6_lu,v6_ren # speaker:v6_lu # mood:v6_lu=amused
苏晚澄没笑他，试了踏板两端受力。 # beat:c_two_swords_9 # scene:v6_workshop # cast:v6_su,v6_lu,v6_ren # speaker:narrator
先用旧步，中间再换。不是全守，也不是全改。 # beat:c_two_swords_10 # scene:v6_workshop # cast:v6_su,v6_lu,v6_ren # speaker:v6_su # mood:v6_su=neutral
* [问两种方法各自不能用在哪里。 # cid:swords_note]
  ~ read = true
  我想把不能用的也记住。 # beat:c_two_swords_11 # scene:v6_workshop # cast:v6_su,v6_lu,v6_ren # speaker:you
  斜步怕脚下横滑，不是快都能救。 # beat:c_two_swords_12 # scene:v6_workshop # cast:v6_su,v6_lu,v6_ren # speaker:v6_lu # mood:v6_lu=calm
  旧步怕硬要走完一套。地不许，就别把规矩当撑杆。 # beat:c_two_swords_13 # scene:v6_workshop # cast:v6_su,v6_lu,v6_ren # speaker:v6_su # mood:v6_su=neutral
  -> two_swords_after
* [先走一回，让他看你怎样停。 # cid:swords_try]
  我也不熟。看我怎么停，不只看他们多稳。 # beat:c_two_swords_14 # scene:v6_workshop # cast:v6_su,v6_lu,v6_ren # speaker:you
  你晃了一下，没有硬扭，停住重新放脚。 # beat:c_two_swords_15 # scene:v6_workshop # cast:v6_su,v6_lu,v6_ren # speaker:narrator
  原来停一下，还算能走。 # beat:c_two_swords_16 # scene:v6_workshop # cast:v6_su,v6_lu,v6_ren # speaker:v6_ren # mood:v6_ren=calm
  -> two_swords_after


=== two_swords_after ===
任耕慢慢把旗送到门边。两人各退半步，让他把最后一段自己走。 # beat:c_two_swords_after_1 # scene:v6_workshop # cast:v6_su,v6_lu,v6_ren # speaker:narrator
没问哪门更高，也把旗送到了。 # beat:c_two_swords_after_2 # scene:v6_workshop # cast:v6_su,v6_lu,v6_ren # speaker:v6_lu # mood:v6_lu=amused
他的问题是送旗。问剑，我仍要讲。 # beat:c_two_swords_after_3 # scene:v6_workshop # cast:v6_su,v6_lu,v6_ren # speaker:v6_su # mood:v6_su=calm
那晚上吃饭再讲。别把饼忘了。 # beat:c_two_swords_after_4 # scene:v6_workshop # cast:v6_su,v6_lu,v6_ren # speaker:you
先笑的是苏晚澄。她翻到新页，给任耕留了署名的位置。 # beat:c_two_swords_after_5 # scene:v6_workshop # cast:v6_su,v6_lu,v6_ren # speaker:narrator
-> workshop_qiao


=== morning_roof ===
兰老实送来八只竹筐，说临时坐、装湿衣都能用，就是毛边还得削。 # beat:c_morning_roof_1 # scene:v6_workshop # cast:v6_he,v6_lan,v6_qiao # speaker:narrator
你一夜没睡？ # beat:c_morning_roof_2 # scene:v6_workshop # cast:v6_he,v6_lan,v6_qiao # speaker:v6_qiao # mood:v6_qiao=neutral
睡了半会儿。老又不是不用睡，别学。 # beat:c_morning_roof_3 # scene:v6_workshop # cast:v6_he,v6_lan,v6_qiao # speaker:v6_lan # mood:v6_lan=neutral
没报试艺，也忙到现在。 # beat:c_morning_roof_4 # scene:v6_workshop # cast:v6_he,v6_lan,v6_qiao # speaker:you
我拿修棚钱，他拿筐钱。做事不是没拿钱，才值得一句谢谢。 # beat:c_morning_roof_5 # scene:v6_workshop # cast:v6_he,v6_lan,v6_qiao # speaker:v6_he # mood:v6_he=neutral
那筐钱你什么时候给？ # beat:c_morning_roof_6 # scene:v6_workshop # cast:v6_he,v6_lan,v6_qiao # speaker:v6_lan # mood:v6_lan=amused
我只是木匠，找主事去！ # beat:c_morning_roof_7 # scene:v6_workshop # cast:v6_he,v6_lan,v6_qiao # speaker:v6_he # mood:v6_he=uneasy
笑完，何铆继续削毛边，没有急着挂上棚。 # beat:c_morning_roof_8 # scene:v6_workshop # cast:v6_he,v6_lan,v6_qiao # speaker:narrator
要帮忙吗？ # beat:c_morning_roof_9 # scene:v6_workshop # cast:v6_he,v6_lan,v6_qiao # speaker:v6_qiao # mood:v6_qiao=neutral
先吃面。绑索不是给饿的人练轻功的。 # beat:c_morning_roof_10 # scene:v6_workshop # cast:v6_he,v6_lan,v6_qiao # speaker:v6_he # mood:v6_he=neutral
* [吃完帮忙试索，再上场。 # cid:tools_test]
  ~ rope = true
  我只绑一处。你查完，再让人踩。 # beat:c_morning_roof_11 # scene:v6_workshop # cast:v6_he,v6_lan,v6_qiao # speaker:you
  会了还肯让人查，比绑着自夸好。 # beat:c_morning_roof_12 # scene:v6_workshop # cast:v6_he,v6_lan,v6_qiao # speaker:v6_he # mood:v6_he=calm
  -> morning_roof_after
* [请主事补派人手，自己休息。 # cid:tools_delegate]
  试艺后还要用手。再抢就两边做不好。 # beat:c_morning_roof_13 # scene:v6_workshop # cast:v6_he,v6_lan,v6_qiao # speaker:you
  去。讲清不来抢，也省我半路喊停。 # beat:c_morning_roof_14 # scene:v6_workshop # cast:v6_he,v6_lan,v6_qiao # speaker:v6_he # mood:v6_he=neutral
  -> morning_roof_after


=== morning_roof_after ===
总以为师父不上场，是没有机会。看他查门轴，好像没少做什么。 # beat:c_morning_roof_after_1 # scene:v6_workshop # cast:v6_he,v6_lan,v6_qiao # speaker:v6_qiao # mood:v6_qiao=calm
你还想赢？ # beat:c_morning_roof_after_2 # scene:v6_workshop # cast:v6_he,v6_lan,v6_qiao # speaker:you
想。吃完就去。不拿赢一场解释自己为什么面都顾不上。 # beat:c_morning_roof_after_3 # scene:v6_workshop # cast:v6_he,v6_lan,v6_qiao # speaker:v6_qiao # mood:v6_qiao=amused
你们吃到最后，一起收碗。隔着河湾传来第一声锣。 # beat:c_morning_roof_after_4 # scene:v6_workshop # cast:v6_he,v6_lan,v6_qiao # speaker:narrator
-> v6_contract


=== missing_name ===
册上有一行没划。小满找三遍，没见到那位背竹篮的老人。 # beat:c_missing_name_1 # scene:v6_levee # cast:v6_tian,v6_gao,v6_bao # speaker:narrator
我扶她过去了！ # beat:c_missing_name_2 # scene:v6_levee # cast:v6_tian,v6_gao,v6_bao # speaker:v6_bao # mood:v6_bao=uneasy
巷口，还是高地院里？ # beat:c_missing_name_3 # scene:v6_levee # cast:v6_tian,v6_gao,v6_bao # speaker:v6_tian # mood:v6_tian=neutral
巷口。她说认路。 # beat:c_missing_name_4 # scene:v6_levee # cast:v6_tian,v6_gao,v6_bao # speaker:v6_bao # mood:v6_bao=neutral
先不怪谁。巷口两岔，她也可能去了别处。 # beat:c_missing_name_5 # scene:v6_levee # cast:v6_tian,v6_gao,v6_bao # speaker:v6_gao # mood:v6_gao=intent
谁看见她跟谁走？ # beat:c_missing_name_6 # scene:v6_levee # cast:v6_tian,v6_gao,v6_bao # speaker:you
旁边七嘴八舌，都是好像。田雁没把好像先写成平安。 # beat:c_missing_name_7 # scene:v6_levee # cast:v6_tian,v6_gao,v6_bao # speaker:narrator
两个找，一个接消息。不能所有人钻进同一条水巷。 # beat:c_missing_name_8 # scene:v6_levee # cast:v6_tian,v6_gao,v6_bao # speaker:v6_tian # mood:v6_tian=neutral
我认篮子，我去！ # beat:c_missing_name_9 # scene:v6_levee # cast:v6_tian,v6_gao,v6_bao # speaker:v6_bao # mood:v6_bao=intent
不带篮子也是她。先说她穿什么。 # beat:c_missing_name_10 # scene:v6_levee # cast:v6_tian,v6_gao,v6_bao # speaker:you
* [按衣着和路线核，陪小满走巷口。 # cid:missing_check]
  高秉问高地，田雁留着接消息。我们回来先报，不另拐。 # beat:c_missing_name_11 # scene:v6_levee # cast:v6_tian,v6_gao,v6_bao # speaker:you
  没找到也报。别一直往深处走。 # beat:c_missing_name_12 # scene:v6_levee # cast:v6_tian,v6_gao,v6_bao # speaker:v6_tian # mood:v6_tian=calm
  -> missing_name_after
* [留下问新来的人，让差役去找。 # cid:missing_wait]
  我守这里，有人认出就送消息，不让找的人扑空。 # beat:c_missing_name_13 # scene:v6_levee # cast:v6_tian,v6_gao,v6_bao # speaker:you
  我跟田姐姐去。一定回来报。 # beat:c_missing_name_14 # scene:v6_levee # cast:v6_tian,v6_gao,v6_bao # speaker:v6_bao # mood:v6_bao=intent
  -> missing_name_after


=== missing_name_after ===
老人在另一处高地找到。竹篮给了一个走不动的孩子扶，自己跟送药的走了。 # beat:c_missing_name_after_1 # scene:v6_levee # cast:v6_tian,v6_gao,v6_bao # speaker:narrator
以为看见篮子，就看见她。 # beat:c_missing_name_after_2 # scene:v6_levee # cast:v6_tian,v6_gao,v6_bao # speaker:v6_bao # mood:v6_bao=uneasy
现在知道了。先看人，名字也问清。 # beat:c_missing_name_after_3 # scene:v6_levee # cast:v6_tian,v6_gao,v6_bao # speaker:v6_tian # mood:v6_tian=neutral
人不用总带着我们认得的东西，才算是他。 # beat:c_missing_name_after_4 # scene:v6_levee # cast:v6_tian,v6_gao,v6_bao # speaker:you
问号没删，后面补上了找到的地点和时候。 # beat:c_missing_name_after_5 # scene:v6_levee # cast:v6_tian,v6_gao,v6_bao # speaker:narrator
-> levee_exit


=== last_boat ===
许竞川跑来，把干护腕塞进你手里。 # beat:c_last_boat_1 # scene:v6_levee # cast:v6_du,v6_zhaoli,v6_xu # speaker:narrator
不是拿去硬撑。护住擦伤，真疼还得喊。 # beat:c_last_boat_2 # scene:v6_levee # cast:v6_du,v6_zhaoli,v6_xu # speaker:v6_xu # mood:v6_xu=intent
余枫替你捡的那只？ # beat:c_last_boat_3 # scene:v6_levee # cast:v6_du,v6_zhaoli,v6_xu # speaker:you
另一只，我又不只一只手。 # beat:c_last_boat_4 # scene:v6_levee # cast:v6_du,v6_zhaoli,v6_xu # speaker:v6_xu # mood:v6_xu=uneasy
练剑的，脸皮也练护腕？ # beat:c_last_boat_5 # scene:v6_levee # cast:v6_du,v6_zhaoli,v6_xu # speaker:v6_zhaoli # mood:v6_zhaoli=amused
你也别笑。红绳活口再拆一回。 # beat:c_last_boat_6 # scene:v6_levee # cast:v6_du,v6_zhaoli,v6_xu # speaker:v6_du # mood:v6_du=neutral
她认真拆开再绑。手在抖，结比上回清楚。 # beat:c_last_boat_7 # scene:v6_levee # cast:v6_du,v6_zhaoli,v6_xu # speaker:narrator
我怕的是没来得及叫人，自己就冲了。 # beat:c_last_boat_8 # scene:v6_levee # cast:v6_du,v6_zhaoli,v6_xu # speaker:v6_zhaoli # mood:v6_zhaoli=intent
我也怕。但能问的话，不该全咽着。 # beat:c_last_boat_9 # scene:v6_levee # cast:v6_du,v6_zhaoli,v6_xu # speaker:you
我还在，不是给你们壮胆的一尊泥像。 # beat:c_last_boat_10 # scene:v6_levee # cast:v6_du,v6_zhaoli,v6_xu # speaker:v6_du # mood:v6_du=calm
* [先空走一遍退回的路线。 # cid:boat_rehearse]
  ~ signal = true
  我退到石边，照鲤松船，老杜最后撤。别拿真浪排第一次。 # beat:c_last_boat_11 # scene:v6_levee # cast:v6_du,v6_zhaoli,v6_xu # speaker:you
  你喊停，我听。不是没救到才停，是还有人要救。 # beat:c_last_boat_12 # scene:v6_levee # cast:v6_du,v6_zhaoli,v6_xu # speaker:v6_zhaoli # mood:v6_zhaoli=calm
  -> last_boat_after
* [复述松绳信号，安排岸上守灯。 # cid:boat_signal]
  ~ signal = true
  一声退，二声松。听不见看灯，不自行改。 # beat:c_last_boat_13 # scene:v6_levee # cast:v6_du,v6_zhaoli,v6_xu # speaker:you
  再叫一个岸上人守灯。灯不能跟你们一起忙灭。 # beat:c_last_boat_14 # scene:v6_levee # cast:v6_du,v6_zhaoli,v6_xu # speaker:v6_du # mood:v6_du=intent
  -> last_boat_after


=== last_boat_after ===
许竞川退到岸上接下一队，没有坚持自己也去。 # beat:c_last_boat_after_1 # scene:v6_levee # cast:v6_du,v6_zhaoli,v6_xu # speaker:narrator
回来还护腕。别让我跟师弟解释，怎么又丢了。 # beat:c_last_boat_after_2 # scene:v6_levee # cast:v6_du,v6_zhaoli,v6_xu # speaker:v6_xu # mood:v6_xu=calm
烂了也当面说，不偷偷往河里扔。 # beat:c_last_boat_after_3 # scene:v6_levee # cast:v6_du,v6_zhaoli,v6_xu # speaker:you
好。现在船在等，人也等。 # beat:c_last_boat_after_4 # scene:v6_levee # cast:v6_du,v6_zhaoli,v6_xu # speaker:v6_zhaoli # mood:v6_zhaoli=amused
你看了一眼岸上的灯。有人将它举高，稳在所有人看得见的地方。 # beat:c_last_boat_after_5 # scene:v6_levee # cast:v6_du,v6_zhaoli,v6_xu # speaker:narrator
-> storm_choice



=== inn_depart ===
两队的空位留到天亮，苏晚澄却把第三张名册压在桌上。册子没有船，也没有出镇的路。 # beat:c6_inn_depart_1 # scene:v6_depart # cast:v6_su,v6_zhaoli,v6_pei # speaker:narrator
会场缺人。护栏未定，工钱未发。留下的人也要试艺，我不想等你们回来才说他们没练过。 # beat:c6_inn_depart_2 # scene:v6_depart # cast:v6_su,v6_zhaoli,v6_pei # speaker:v6_su # mood:v6_su=neutral
护药车少一人，要晚半个时辰。我能等到现在，再晚，村里就得多等一夜。 # beat:c6_inn_depart_3 # scene:v6_depart # cast:v6_su,v6_zhaoli,v6_pei # speaker:v6_pei # mood:v6_pei=neutral
我的船不能在两头都留灯。选完就各自做事，别走了还回头替另一队答应。 # beat:c6_inn_depart_4 # scene:v6_depart # cast:v6_su,v6_zhaoli,v6_pei # speaker:v6_zhaoli # mood:v6_zhaoli=intent
留下会错过什么？ # beat:c6_inn_depart_5 # scene:v6_depart # cast:v6_su,v6_zhaoli,v6_pei # speaker:you
先手试艺。名册已排好，我能给你另约，不能保你仍占原来那一场。 # beat:c6_inn_depart_6 # scene:v6_depart # cast:v6_su,v6_zhaoli,v6_pei # speaker:v6_su # mood:v6_su=neutral
乔砚生把包袱往膝上移，右腕避开了系带。他想跟你一起，也确实想走陆路。 # beat:c6_inn_depart_7 # scene:v6_depart # cast:v6_su,v6_zhaoli,v6_pei # speaker:narrator
* [先问砚生自己的去向，再决定我的。 # cid:v6_ask_qiao]
  ~ v6_qiao_asked = true
  你想走陆路，是想护药，还是怕我一个人去？ # beat:c6_inn_depart_8 # scene:v6_depart # cast:v6_su,v6_zhaoli,v6_pei # speaker:you
  都有。但不是你走哪条，我就得跟到哪条。我想知道受伤以后，自己还能做成什么。 # beat:c6_inn_depart_9 # scene:v6_depart # cast:v6_qiao,v6_su,v6_zhaoli # speaker:v6_qiao # mood:v6_qiao=intent
  那各自选。回来见面，我听你自己讲。 # beat:c6_inn_depart_10 # scene:v6_depart # cast:v6_qiao,v6_su,v6_zhaoli # speaker:you
  说定。别替我先写成你的人情。 # beat:c6_inn_depart_11 # scene:v6_depart # cast:v6_qiao,v6_su,v6_zhaoli # speaker:v6_qiao # mood:v6_qiao=calm
  -> v6_separate
* [说清自己只能照顾一条路，不许诺同时兼顾。 # cid:v6_own_route]
  ~ v6_qiao_asked = false
  我选过以后，另一队有事也未必知道。 # beat:c6_inn_depart_12 # scene:v6_depart # cast:v6_qiao,v6_su,v6_zhaoli # speaker:you
  本来就如此。你若想得在场才能安心，哪一条路也出不了门。 # beat:c6_inn_depart_13 # scene:v6_depart # cast:v6_pei,v6_qiao,v6_su # speaker:v6_pei # mood:v6_pei=neutral
  我仍走陆路。到馆里的人，替我留一句到过了。 # beat:c6_inn_depart_14 # scene:v6_depart # cast:v6_pei,v6_qiao,v6_su # speaker:v6_qiao # mood:v6_qiao=uneasy
  他没有说同你一样。你也没有替他改口。 # beat:c6_inn_depart_15 # scene:v6_depart # cast:v6_pei,v6_qiao,v6_su # speaker:narrator
  -> v6_separate

=== v6_separate ===
苏晚澄把笔搁开。她没有把“留守”写在两条路下面，免得像落选后的去处。 # beat:c6_v6_separate_1 # scene:v6_depart # cast:v6_su,v6_zhaoli,v6_pei # speaker:narrator
最后一遍。陆路、水路、留守。别选一个好听的，选你真愿意做的。 # beat:c6_v6_separate_2 # scene:v6_depart # cast:v6_su,v6_zhaoli,v6_pei # speaker:v6_su # mood:v6_su=neutral
* [走枫岭陆路，随裴雁秋护药车。 # cid:route_land]
  ~ route = 1
  我走山路，帮药进屋。砚生，不会使的力气当面说。 # beat:c6_v6_separate_3 # scene:v6_depart # cast:v6_su,v6_zhaoli,v6_pei # speaker:you
  我听见了。先看车轮，别一出门就抢着抬最重的。 # beat:c6_v6_separate_4 # scene:v6_depart # cast:v6_su,v6_zhaoli,v6_pei # speaker:v6_pei # mood:v6_pei=calm
  -> farewell
* [走白苇水路，随照鲤领船。 # cid:route_water]
  ~ route = 2
  我上船。照鲤，你说停的时候，先停再问。 # beat:c6_v6_separate_5 # scene:v6_depart # cast:v6_su,v6_zhaoli,v6_pei # speaker:you
  先别把话说满。上船以后晕了，得敢先叫我。 # beat:c6_v6_separate_6 # scene:v6_depart # cast:v6_su,v6_zhaoli,v6_pei # speaker:v6_zhaoli # mood:v6_zhaoli=amused
  -> farewell
* [留在会场，担下护栏、雇工和补试。 # cid:route_stay]
  ~ route = 3
  我留下。先手那场若赶不上，另约。现在谁欠着工钱，让他到桌前来。 # beat:c6_v6_separate_7 # scene:v6_depart # cast:v6_su,v6_zhaoli,v6_pei # speaker:you
  严主事在坪上。你问他，他未必愿意听。 # beat:c6_v6_separate_8 # scene:v6_depart # cast:v6_su,v6_zhaoli,v6_pei # speaker:v6_su # mood:v6_su=intent
  听不听是他的事。我的名字先写下。 # beat:c6_v6_separate_9 # scene:v6_depart # cast:v6_su,v6_zhaoli,v6_pei # speaker:you
  -> farewell

=== v6_stay_open ===
你走到青蒲坪时，严平章正在把两条白线往外移。旗手明明站在干处，手背却出了汗。 # beat:c6_v6_stay_open_1 # scene:v6_stay # cast:v6_yan,v6_ren,v6_deng # speaker:narrator
坪太小，两组不能同时试。借米行那段空地，把候场的人挪过去。 # beat:c6_v6_stay_open_2 # scene:v6_stay # cast:v6_yan,v6_ren,v6_deng # speaker:v6_yan # mood:v6_yan=neutral
那是我们发工钱的地方。你借地，先问雇工站哪儿。 # beat:c6_v6_stay_open_3 # scene:v6_stay # cast:v6_yan,v6_ren,v6_deng # speaker:v6_deng # mood:v6_deng=sharp
东栏底下的木楔松了。我想再钉一回，刚才有人说别耽误开场。 # beat:c6_v6_stay_open_4 # scene:v6_stay # cast:v6_yan,v6_ren,v6_deng # speaker:v6_ren # mood:v6_ren=uneasy
何铆说中午来。先别往那头挤，够站。 # beat:c6_v6_stay_open_5 # scene:v6_stay # cast:v6_yan,v6_ren,v6_deng # speaker:v6_yan # mood:v6_yan=neutral
有人已把第二组弟子领到栏边。你若停场，他们就会问为什么轮到自己才慢下来。 # beat:c6_v6_stay_open_6 # scene:v6_stay # cast:v6_yan,v6_ren,v6_deng # speaker:narrator
* [把松楔指出来，要求这组先停。 # cid:v6_stop_line]
  ~ v6_stopped = true
  别往栏上靠。这根不是何铆中午来，就能现在不松。 # beat:c6_v6_stay_open_7 # scene:v6_stay # cast:v6_yan,v6_ren,v6_deng # speaker:you
  你才来，就替我喊停？ # beat:c6_v6_stay_open_8 # scene:v6_stay # cast:v6_yan,v6_ren,v6_deng # speaker:v6_yan # mood:v6_yan=sharp
  我替自己说。我站在里面，也不想等有人掉下去才算有份。 # beat:c6_v6_stay_open_9 # scene:v6_stay # cast:v6_yan,v6_ren,v6_deng # speaker:you
  严平章盯着你，最后让第二组退回。候场人中立刻有人喊不公。 # beat:c6_v6_stay_open_10 # scene:v6_stay # cast:v6_yan,v6_ren,v6_deng # speaker:narrator
  -> v6_stay_lines
* [自己守住栏边，先让这一组做完。 # cid:v6_hold_line]
  ~ v6_stopped = false
  我守这头，不让人靠。你把何铆找来，别再往后拖。 # beat:c6_v6_stay_open_11 # scene:v6_stay # cast:v6_yan,v6_ren,v6_deng # speaker:you
  任耕跟他一起。只放这一组。 # beat:c6_v6_stay_open_12 # scene:v6_stay # cast:v6_yan,v6_ren,v6_deng # speaker:v6_yan # mood:v6_yan=neutral
  你横过木杆，挡住两个想看得更近的孩子。后头的人仍在往前挪。 # beat:c6_v6_stay_open_13 # scene:v6_stay # cast:v6_yan,v6_ren,v6_deng # speaker:narrator
  -> v6_stay_lines

=== v6_stay_lines ===
你们一停，人都往米行走。工钱桌周围站满练剑的，我们的人从早等到现在。 # beat:c6_v6_stay_lines_1 # scene:v6_stay # cast:v6_yan,v6_deng,v6_ren # speaker:v6_deng # mood:v6_deng=neutral
会开完就腾。 # beat:c6_v6_stay_lines_2 # scene:v6_stay # cast:v6_yan,v6_deng,v6_ren # speaker:v6_yan # mood:v6_yan=sharp
你上回也说搬完棚就发。会开完，谁给等不到的家里带饭？ # beat:c6_v6_stay_lines_3 # scene:v6_stay # cast:v6_yan,v6_deng,v6_ren # speaker:v6_deng # mood:v6_deng=sharp
隔开两条线吧。一条领钱，一条候场。我能站在中间喊，别让人挤。 # beat:c6_v6_stay_lines_4 # scene:v6_stay # cast:v6_yan,v6_deng,v6_ren # speaker:v6_ren # mood:v6_ren=neutral
他的手仍在抖。不是怕喊，是怕高处的横旗还得自己上去换。 # beat:c6_v6_stay_lines_5 # scene:v6_stay # cast:v6_yan,v6_deng,v6_ren # speaker:narrator
* [把发钱的地方先清出来，让试艺继续等。 # cid:v6_separate_queue]
  ~ v6_labor_first = true
  领钱的人先走。候场排我后面，我也还没试，不比你们少等。 # beat:c6_v6_stay_lines_6 # scene:v6_stay # cast:v6_yan,v6_deng,v6_ren # speaker:you
  你的先手场便赶不上了。 # beat:c6_v6_stay_lines_7 # scene:v6_stay # cast:v6_yan,v6_deng,v6_ren # speaker:v6_yan # mood:v6_yan=uneasy
  记着我因何缺场。别写成自己不来。 # beat:c6_v6_stay_lines_8 # scene:v6_stay # cast:v6_yan,v6_deng,v6_ren # speaker:you
  他让苏晚澄来补了一行，没有替你把空出的机会留住。 # beat:c6_v6_stay_lines_9 # scene:v6_stay # cast:v6_yan,v6_deng,v6_ren # speaker:narrator
  -> v6_stay_pay
* [拿馆里剩的路费垫急用，先保住试艺排期。 # cid:v6_advance_wage]
  ~ v6_advance = true
  我先垫这一笔。谁领了，谁在这里签；会场之后还馆里，不许说是我捐的。 # beat:c6_v6_stay_lines_10 # scene:v6_stay # cast:v6_yan,v6_deng,v6_ren # speaker:you
  我记清。你的钱能垫这一桌，垫不了明天那桌。 # beat:c6_v6_stay_lines_11 # scene:v6_stay # cast:v6_yan,v6_deng,v6_ren # speaker:v6_deng # mood:v6_deng=intent
  会后核账。 # beat:c6_v6_stay_lines_12 # scene:v6_stay # cast:v6_yan,v6_deng,v6_ren # speaker:v6_yan # mood:v6_yan=neutral
  你看着越来越薄的钱袋。馆里原本要换的那片瓦，暂时还换不得。 # beat:c6_v6_stay_lines_13 # scene:v6_stay # cast:v6_yan,v6_deng,v6_ren # speaker:narrator
  -> v6_stay_pay

=== v6_stay_pay ===
何铆到了，蹲在东栏边捏起半截烂楔。他不争刚才够不够站，只把木头放进严平章手里。 # beat:c6_v6_stay_pay_1 # scene:v6_stay # cast:v6_he,v6_ren,v6_yan # speaker:narrator
这一头烂到芯了。今天不换，站个人替它撑，也不能长出好木头。 # beat:c6_v6_stay_pay_2 # scene:v6_stay # cast:v6_he,v6_ren,v6_yan # speaker:v6_he # mood:v6_he=sharp
旗也要换，上头那条横杆裂了。我……我不想现在上去。 # beat:c6_v6_stay_pay_3 # scene:v6_stay # cast:v6_he,v6_ren,v6_yan # speaker:v6_ren # mood:v6_ren=uneasy
你每日都上。 # beat:c6_v6_stay_pay_4 # scene:v6_stay # cast:v6_he,v6_ren,v6_yan # speaker:v6_yan # mood:v6_yan=neutral
每日怕，也每日上。今天已经裂了！ # beat:c6_v6_stay_pay_5 # scene:v6_stay # cast:v6_he,v6_ren,v6_yan # speaker:v6_ren # mood:v6_ren=sharp
后排有人笑他胆小，任耕听见了，脸涨得更红。 # beat:c6_v6_stay_pay_6 # scene:v6_stay # cast:v6_he,v6_ren,v6_yan # speaker:narrator
* [不让任耕爬裂杆，先放下整面旗。 # cid:v6_lower_flag]
  ~ v6_flag_safe = true
  旗放地上也认得出青蒲会。帮我接这一头，任耕别上。 # beat:c6_v6_stay_pay_7 # scene:v6_stay # cast:v6_he,v6_ren,v6_yan # speaker:you
  这句可算省了我一根新杆。 # beat:c6_v6_stay_pay_8 # scene:v6_stay # cast:v6_he,v6_ren,v6_yan # speaker:v6_he # mood:v6_he=amused
  锣声和旗要一起报，少一面就得多跑一趟。 # beat:c6_v6_stay_pay_9 # scene:v6_stay # cast:v6_he,v6_ren,v6_yan # speaker:v6_yan # mood:v6_yan=uneasy
  那跑。别拿他的胆量省脚程。 # beat:c6_v6_stay_pay_10 # scene:v6_stay # cast:v6_he,v6_ren,v6_yan # speaker:you
  -> v6_stay_afternoon
* [请任耕只上最低横档，自己系住下端帮他。 # cid:v6_tie_flag]
  ~ v6_flag_safe = false
  只上最低一档，我系下端。够不到就下来，不许再往上一格。 # beat:c6_v6_stay_pay_11 # scene:v6_stay # cast:v6_he,v6_ren,v6_yan # speaker:you
  我试。 # beat:c6_v6_stay_pay_12 # scene:v6_stay # cast:v6_he,v6_ren,v6_yan # speaker:v6_ren # mood:v6_ren=uneasy
  旗角挂住裂处，任耕急着解，右手被夹了一下。人回到地上，指节已肿起来。 # beat:c6_v6_stay_pay_13 # scene:v6_stay # cast:v6_he,v6_ren,v6_yan # speaker:narrator # cg:timber # action:裂处松动 · 人已回到地上
  我说杆裂了，不是说系住下端它就不裂。 # beat:c6_v6_stay_pay_14 # scene:v6_stay # cast:v6_he,v6_ren,v6_yan # speaker:v6_he # mood:v6_he=sharp # cg:none
  -> v6_stay_afternoon

=== v6_stay_afternoon ===
午后补试的册子送到客舍。你还没拿到自己的名字，门外又有人抬着一名扭伤的弟子过来。 # beat:c6_v6_stay_afternoon_1 # scene:v6_staycare # cast:v6_ren,v6_su,v6_rong # speaker:narrator
我在外坪跟他试的。他怕输，落地还拧，不能全算是地不平。 # beat:c6_v6_stay_afternoon_2 # scene:v6_staycare # cast:v6_ren,v6_su,v6_rong # speaker:v6_rong # mood:v6_rong=intent
你有没有先看那块板？ # beat:c6_v6_stay_afternoon_3 # scene:v6_staycare # cast:v6_ren,v6_su,v6_rong # speaker:v6_su # mood:v6_su=sharp
没有。 # beat:c6_v6_stay_afternoon_4 # scene:v6_staycare # cast:v6_ren,v6_su,v6_rong # speaker:v6_rong # mood:v6_rong=uneasy
他没再替自己添理由。伤者想走，脚刚沾地便又坐回去。 # beat:c6_v6_stay_afternoon_5 # scene:v6_staycare # cast:v6_ren,v6_su,v6_rong # speaker:narrator
药棚缺人。他同门要赶最后一轮，问谁能送。 # beat:c6_v6_stay_afternoon_6 # scene:v6_staycare # cast:v6_ren,v6_su,v6_rong # speaker:v6_su # mood:v6_su=neutral
我得补签差事的具结。过了时，不能算米行承包那一班。 # beat:c6_v6_stay_afternoon_7 # scene:v6_staycare # cast:v6_ren,v6_su,v6_rong # speaker:v6_rong # mood:v6_rong=neutral
{
- v6_flag_safe:
我送。早上你们让我别爬，我就还有两只好手。你留下，我认得药棚。 # beat:c6_v6_stay_afternoon_8 # scene:v6_staycare # cast:v6_ren,v6_su,v6_rong # speaker:v6_ren # mood:v6_ren=intent
他蹲下让伤者搭肩，先问疼的是哪边，没有替人说不疼。 # beat:c6_v6_stay_afternoon_9 # scene:v6_staycare # cast:v6_ren,v6_su,v6_rong # speaker:narrator
- else:
我这手使不上力。扶一小段还行，再远怕把人一起摔了。 # beat:c6_v6_stay_afternoon_10 # scene:v6_staycare # cast:v6_ren,v6_su,v6_rong # speaker:v6_ren # mood:v6_ren=uneasy
他把肿着的指节藏回袖里。这次没人拿每日都上来说他。 # beat:c6_v6_stay_afternoon_11 # scene:v6_staycare # cast:v6_ren,v6_su,v6_rong # speaker:narrator
}
* [自己送伤者到药棚，接受错过补试。 # cid:v6_escort_patient]
  ~ v6_escort = true
  名字让它过。苏姑娘，写我去了哪儿，别替我讨个没打过的胜。 # beat:c6_v6_stay_afternoon_12 # scene:v6_staycare # cast:v6_ren,v6_su,v6_rong # speaker:you
  会写。 # beat:c6_v6_stay_afternoon_13 # scene:v6_staycare # cast:v6_ren,v6_su,v6_rong # speaker:v6_su # mood:v6_su=calm
  具结办完，我去接你。伤药的账我付，不算买你闭嘴。 # beat:c6_v6_stay_afternoon_14 # scene:v6_staycare # cast:v6_ren,v6_su,v6_rong # speaker:v6_rong # mood:v6_rong=uneasy
  那就各认各的。走。 # beat:c6_v6_stay_afternoon_15 # scene:v6_staycare # cast:v6_ren,v6_su,v6_rong # speaker:you
  -> v6_stay_return
* [保住补试，明确约好谁陪伤者，自己不包揽。 # cid:v6_keep_trial]
  ~ v6_escort = false
  我留下试。谁送、谁付药钱，现在说清，不能人一出门就都算办完。 # beat:c6_v6_stay_afternoon_16 # scene:v6_staycare # cast:v6_ren,v6_su,v6_rong # speaker:you
  我送。具结重新约期，失了这一班，算我的。 # beat:c6_v6_stay_afternoon_17 # scene:v6_staycare # cast:v6_ren,v6_su,v6_rong # speaker:v6_rong # mood:v6_rong=intent
  我陪同，回执拿回来。 # beat:c6_v6_stay_afternoon_18 # scene:v6_staycare # cast:v6_ren,v6_su,v6_rong # speaker:v6_su # mood:v6_su=neutral
  你没有赢得所有人的好感。容既白从你身旁走过，没有再说一声轻松的改日见。 # beat:c6_v6_stay_afternoon_19 # scene:v6_staycare # cast:v6_ren,v6_su,v6_rong # speaker:narrator
  -> v6_stay_return

=== v6_stay_return ===
天暗时，客舍门口少了上午一半喧闹。补试的名册和药棚回执并排放着，谁也不能拿另一张抵掉。 # beat:c6_v6_stay_return_1 # scene:v6_staycare # cast:v6_su,v6_ren # speaker:narrator
明日你还要和他们争一年的差事。今日怎样分工，也要说。 # beat:c6_v6_stay_return_2 # scene:v6_staycare # cast:v6_su,v6_ren # speaker:v6_su # mood:v6_su=neutral
包括我没去的地方？ # beat:c6_v6_stay_return_3 # scene:v6_staycare # cast:v6_su,v6_ren # speaker:you
尤其是没去的。那一段，有别人的名字。 # beat:c6_v6_stay_return_4 # scene:v6_staycare # cast:v6_su,v6_ren # speaker:v6_su # mood:v6_su=neutral
* [把照料、垫款和错场的人分别写清。 # cid:v6_write_names]
  ~ v6_ledger = true
  任耕、米行的雇工、送人的。我的那份放最后，欠账另列。 # beat:c6_v6_stay_return_5 # scene:v6_staycare # cast:v6_su,v6_ren # speaker:you
  这张原稿你留。明天有人问，我们照它核。 # beat:c6_v6_stay_return_6 # scene:v6_staycare # cast:v6_su,v6_ren # speaker:v6_su # mood:v6_su=calm
  -> workshop_gate
* [先当面对没能兼顾的人交代，不替旁人作证。 # cid:v6_speak_first]
  ~ v6_ledger = false
  我先去说。我没看见的，只能请他们自己来。 # beat:c6_v6_stay_return_7 # scene:v6_staycare # cast:v6_su,v6_ren # speaker:you
  可以。别等到会场开价，才忽然有空听。 # beat:c6_v6_stay_return_8 # scene:v6_staycare # cast:v6_su,v6_ren # speaker:v6_su # mood:v6_su=neutral
  你收起空白的纸，挨个去敲仍亮着灯的门。 # beat:c6_v6_stay_return_9 # scene:v6_staycare # cast:v6_su,v6_ren # speaker:narrator
  -> workshop_gate

=== v6_contract ===
次日早饭后，有人把一年的护渡具结摊在门板上。容既白先在最上面写了一个数，又划掉。 # beat:c6_v6_contract_1 # scene:v6_contract # cast:v6_rong,v6_deng,v6_yan # speaker:narrator
差事拆三班，钱却还是一份。米行给一半，余下要各馆认。我不肯签白纸，等我爹明年再骂邓苹。 # beat:c6_v6_contract_2 # scene:v6_contract # cast:v6_rong,v6_deng,v6_yan # speaker:v6_rong # mood:v6_rong=neutral
我也不签。上回说义举，最后从雇工的钱里腾。你们赢一场，不是我们家少吃一顿的缘故。 # beat:c6_v6_contract_3 # scene:v6_contract # cast:v6_rong,v6_deng,v6_yan # speaker:v6_deng # mood:v6_deng=sharp
今年棚、坪、舟都花了钱。头名若肯带一班，不另领场租，我能先把工钱补上。 # beat:c6_v6_contract_4 # scene:v6_contract # cast:v6_rong,v6_deng,v6_yan # speaker:v6_yan # mood:v6_yan=neutral
那馆里的瓦呢？ # beat:c6_v6_contract_5 # scene:v6_contract # cast:v6_rong,v6_deng,v6_yan # speaker:you
你别拿屋顶压我。我也想真赢，赢了还想活得过这一年。 # beat:c6_v6_contract_6 # scene:v6_contract # cast:v6_rong,v6_deng,v6_yan # speaker:v6_rong # mood:v6_rong=intent
{
- route == 3:
{
- v6_ledger:
你昨晚写的原稿在这里。同一笔垫款被抄了两回，先划掉重复的，别从每个人那份均摊。 # beat:c6_v6_contract_7 # scene:v6_contract # cast:v6_su,v6_rong,v6_deng # speaker:v6_su # mood:v6_su=neutral
划的是重复的这一行，不是他垫的钱。我照原稿找他认。 # beat:c6_v6_contract_8 # scene:v6_contract # cast:v6_su,v6_rong,v6_deng # speaker:v6_deng # mood:v6_deng=intent
有数可对，钱仍不够。你们能先谈缺多少，不必先把五个人重新找齐。 # beat:c6_v6_contract_9 # scene:v6_contract # cast:v6_su,v6_rong,v6_deng # speaker:narrator
- else:
你昨夜敲门问过的两个人，垫出的木料钱还没还，等着这笔去买药。他们说今日上午能来，等我叫本人过来。 # beat:c6_v6_contract_10 # scene:v6_contract # cast:v6_su,v6_rong,v6_deng # speaker:v6_deng # mood:v6_deng=neutral
那两笔先留待核，不拿你带回的话替他们签字。 # beat:c6_v6_contract_11 # scene:v6_contract # cast:v6_su,v6_rong,v6_deng # speaker:v6_su # mood:v6_su=neutral
你知道谁等不得，却没有一张能直接对数的原稿。这一轮要等人到场，午前还发不完。 # beat:c6_v6_contract_12 # scene:v6_contract # cast:v6_su,v6_rong,v6_deng # speaker:narrator
}
}
{
- v6_advance:
还有你垫的这笔。先还馆里，不许我一说账，你就说算了。 # beat:c6_v6_contract_13 # scene:v6_contract # cast:v6_su,v6_rong,v6_deng # speaker:v6_deng # mood:v6_deng=neutral
你钱袋里的空处，这回摆到了具结上。 # beat:c6_v6_contract_14 # scene:v6_contract # cast:v6_su,v6_rong,v6_deng # speaker:narrator
- else:
谁没垫过，也得问这一年靠谁的工钱养。不是只看今日哪位肯掏。 # beat:c6_v6_contract_15 # scene:v6_contract # cast:v6_su,v6_rong,v6_deng # speaker:v6_deng # mood:v6_deng=neutral
}
* [先列完整工钱和缺口，让各馆按实际一班报价。 # cid:v6_wage_public]
  ~ v6_public_cost = true
  先写工钱，不把没写的当没人要。哪一班缺多少，我们看过再认。 # beat:c6_v6_contract_16 # scene:v6_contract # cast:v6_su,v6_rong,v6_deng # speaker:you
  这样今晚定不下。 # beat:c6_v6_contract_17 # scene:v6_contract # cast:v6_yan,v6_su,v6_rong # speaker:v6_yan # mood:v6_yan=sharp
  今晚定下付不了的，明天还是定不下。 # beat:c6_v6_contract_18 # scene:v6_contract # cast:v6_yan,v6_su,v6_rong # speaker:you
  我肯等到明早。再晚，米行不出船。 # beat:c6_v6_contract_19 # scene:v6_contract # cast:v6_yan,v6_su,v6_rong # speaker:v6_rong # mood:v6_rong=calm
  -> v6_contract_cost
* [保住本馆工钱底线，少接一班，也不替人降价。 # cid:v6_roof_first]
  ~ v6_public_cost = false
  馆里不能再把师父那份填进去。我少接一班，这个数以下不签。 # beat:c6_v6_contract_20 # scene:v6_contract # cast:v6_yan,v6_su,v6_rong # speaker:you
  那就别再说赢了差事便人人有着落。 # beat:c6_v6_contract_21 # scene:v6_contract # cast:v6_yan,v6_su,v6_rong # speaker:v6_rong # mood:v6_rong=sharp
  我没说人人。我先把自己做不到的说清。 # beat:c6_v6_contract_22 # scene:v6_contract # cast:v6_yan,v6_su,v6_rong # speaker:you
  严平章收回一张空具结，没有把你的拒绝记作退场。 # beat:c6_v6_contract_23 # scene:v6_contract # cast:v6_yan,v6_su,v6_rong # speaker:narrator
  -> v6_contract_cost

=== v6_contract_cost ===
韩鹭石捻着湿瓦上的泥，坐到门槛边。苏晚澄翻出各馆到场的人数，没有替谁补一个能干两班的名字。 # beat:c6_v6_contract_cost_1 # scene:v6_contract # cast:v6_su,v6_han,v6_rong # speaker:narrator
屋顶漏，我知道。你们要挣工钱，我也知道。别最后让我一听赢了，反而不敢问钱在哪儿。 # beat:c6_v6_contract_cost_2 # scene:v6_contract # cast:v6_su,v6_han,v6_rong # speaker:v6_han # mood:v6_han=neutral
我愿认运粮一班，不认教徒。拿棍会打，不等于我会教。 # beat:c6_v6_contract_cost_3 # scene:v6_contract # cast:v6_su,v6_han,v6_rong # speaker:v6_rong # mood:v6_rong=neutral
教徒的人还得有人代守船。两班同时开，不能把同一个人写两遍。 # beat:c6_v6_contract_cost_4 # scene:v6_contract # cast:v6_su,v6_han,v6_rong # speaker:v6_su # mood:v6_su=neutral
你想起留守那张册，也想起远路上谁替你抬过一只箱。 # beat:c6_v6_contract_cost_5 # scene:v6_contract # cast:v6_su,v6_han,v6_rong # speaker:narrator
* [只认清楚能做到的一班，把空缺留给真正愿来的人。 # cid:v6_share_shift]
  ~ v6_one_shift = true
  我先认一班。另一个名字，要他自己答应，不是我一句还有伙伴。 # beat:c6_v6_contract_cost_6 # scene:v6_contract # cast:v6_su,v6_han,v6_rong # speaker:you
  那我明早自己来填教徒那班。你别替我写。 # beat:c6_v6_contract_cost_7 # scene:v6_contract # cast:v6_su,v6_han,v6_rong # speaker:v6_han # mood:v6_han=calm
  我把运粮的三个人带来。到时看人，不听我报一长串。 # beat:c6_v6_contract_cost_8 # scene:v6_contract # cast:v6_su,v6_han,v6_rong # speaker:v6_rong # mood:v6_rong=intent
  -> v6_contract_sign
* [承接第二班的临时代守，约定一个月后重新核人。 # cid:v6_cover_shift]
  ~ v6_one_shift = false
  我先代一月，写明日期。到时补不上，不许当我以后都愿意。 # beat:c6_v6_contract_cost_9 # scene:v6_contract # cast:v6_su,v6_han,v6_rong # speaker:you
  你自己的练功就得让出几日。 # beat:c6_v6_contract_cost_10 # scene:v6_contract # cast:v6_su,v6_han,v6_rong # speaker:v6_han # mood:v6_han=uneasy
  知道。这一月，我也不是一边练剑一边把船守了。 # beat:c6_v6_contract_cost_11 # scene:v6_contract # cast:v6_su,v6_han,v6_rong # speaker:you
  苏晚澄把一个月写得很重，你不能只拿那句好听的临时回去。 # beat:c6_v6_contract_cost_12 # scene:v6_contract # cast:v6_su,v6_han,v6_rong # speaker:narrator
  -> v6_contract_sign

=== v6_contract_sign ===
我腕子不好，那张册上还有没有我能自己领工钱的地方？ # beat:c6_v6_contract_sign_1 # scene:v6_contract # cast:v6_su,v6_rong,v6_qiao # speaker:v6_qiao # mood:v6_qiao=uneasy
报路、点人，但要你自己试，不是他替你担保。 # beat:c6_v6_contract_sign_2 # scene:v6_contract # cast:v6_su,v6_rong,v6_qiao # speaker:v6_su # mood:v6_su=neutral
你上次不肯让假胜，这回也别替他领一个好看的工钱。 # beat:c6_v6_contract_sign_3 # scene:v6_contract # cast:v6_su,v6_rong,v6_qiao # speaker:v6_rong # mood:v6_rong=calm
砚生看的是你。帮忙与替人作主，只隔着一支还没落下的笔。 # beat:c6_v6_contract_sign_4 # scene:v6_contract # cast:v6_su,v6_rong,v6_qiao # speaker:narrator
* [把笔递给砚生，让他自己约试。 # cid:v6_qiao_apply]
  ~ v6_qiao_agency = true
  你自己写。不能握剑的那一项，也别藏着。 # beat:c6_v6_contract_sign_5 # scene:v6_contract # cast:v6_su,v6_rong,v6_qiao # speaker:you
  我写。哪日还疼，也自己说。 # beat:c6_v6_contract_sign_6 # scene:v6_contract # cast:v6_su,v6_rong,v6_qiao # speaker:v6_qiao # mood:v6_qiao=intent
  他用左手落了名。歪一点，仍是他的字。 # beat:c6_v6_contract_sign_7 # scene:v6_contract # cast:v6_su,v6_rong,v6_qiao # speaker:narrator
  -> v6_grain_inventory
* [劝砚生先休满约定的日子，我暂时多守一班。 # cid:v6_qiao_wait]
  ~ v6_qiao_agency = false
  先休满那几日。我顶到那天，不替你永久领着。 # beat:c6_v6_contract_sign_8 # scene:v6_contract # cast:v6_su,v6_rong,v6_qiao # speaker:you
  你劝可以，别把我的名字划掉。 # beat:c6_v6_contract_sign_9 # scene:v6_contract # cast:v6_su,v6_rong,v6_qiao # speaker:v6_qiao # mood:v6_qiao=sharp
  不划。你哪天想自己去，先讲清。 # beat:c6_v6_contract_sign_10 # scene:v6_contract # cast:v6_su,v6_rong,v6_qiao # speaker:you
  他把笔放在自己那边，没有交给你保管。 # beat:c6_v6_contract_sign_11 # scene:v6_contract # cast:v6_su,v6_rong,v6_qiao # speaker:narrator
  -> v6_grain_inventory

=== v6_wind ===
双人守旗刚落定，东口卖鱼的薄远便把桶提到坪边。桶内的鱼还活着，水面却斜向一边。 # beat:c6_v6_wind_1 # scene:v6_wind # cast:v6_bo,v6_yan,v6_he # speaker:narrator # action:风向先变
上头涨得快。岸下先退了半尺，钓竿的位置都变了。 # beat:c6_v6_wind_2 # scene:v6_wind # cast:v6_bo,v6_yan,v6_he # speaker:v6_bo # mood:v6_bo=neutral
杜老说过。大水还没过来。 # beat:c6_v6_wind_3 # scene:v6_wind # cast:v6_bo,v6_yan,v6_he # speaker:v6_yan # mood:v6_yan=uneasy
他等你看见大水，再跟你说？东口的车先别进。 # beat:c6_v6_wind_4 # scene:v6_wind # cast:v6_bo,v6_yan,v6_he # speaker:v6_he # mood:v6_he=sharp
一辆米车正要推过窄口。拦车会耽误运粮，不拦，过后人和车都要从这里退。 # beat:c6_v6_wind_5 # scene:v6_wind # cast:v6_bo,v6_yan,v6_he # speaker:narrator
{
- warning:
你在客舍报过，我批了备绳。绳在东棚，没派人去搬。 # beat:c6_v6_wind_6 # scene:v6_wind # cast:v6_bo,v6_yan,v6_he # speaker:v6_yan # mood:v6_yan=neutral
那现在搬。不说备过就算到了手上。 # beat:c6_v6_wind_7 # scene:v6_wind # cast:v6_bo,v6_yan,v6_he # speaker:you
- else:
客舍那一回没收到正式的水报，只有人说要备绳。 # beat:c6_v6_wind_8 # scene:v6_wind # cast:v6_bo,v6_yan,v6_he # speaker:v6_yan # mood:v6_yan=neutral
我备了。没抄进册，也不是绳就不存在。 # beat:c6_v6_wind_9 # scene:v6_wind # cast:v6_bo,v6_yan,v6_he # speaker:v6_he # mood:v6_he=neutral
何铆叫人去取，已经比临场找绳快了一步，却仍得有人把它带到出口。 # beat:c6_v6_wind_10 # scene:v6_wind # cast:v6_bo,v6_yan,v6_he # speaker:narrator
}
* [现在清出车口，把自己的未完场移后。 # cid:v6_clear_gate]
  ~ v6_gate_clear = true
  车先停。我这场还没登记也先停，名单送回来再争。 # beat:c6_v6_wind_11 # scene:v6_wind # cast:v6_bo,v6_yan,v6_he # speaker:you
  东口留一条空道！装过车的先卸两排，报明米行的数。 # beat:c6_v6_wind_12 # scene:v6_wind # cast:v6_bo,v6_yan,v6_he # speaker:v6_yan # mood:v6_yan=intent
  有人骂你输了便想停。你没有回头跟他争，只让车夫把轴退出门槛。 # beat:c6_v6_wind_13 # scene:v6_wind # cast:v6_bo,v6_yan,v6_he # speaker:narrator
  -> v6_wind_people
* [先把绳、药箱与接人的位置定好，等主事正式停试。 # cid:v6_stage_rope]
  ~ v6_gate_clear = false
  我不替你敲停试锣。何师傅拿绳，我去找药棚的人，你把什么时候停报清。 # beat:c6_v6_wind_14 # scene:v6_wind # cast:v6_bo,v6_yan,v6_he # speaker:you
  一有第三声，立即停。 # beat:c6_v6_wind_15 # scene:v6_wind # cast:v6_bo,v6_yan,v6_he # speaker:v6_yan # mood:v6_yan=uneasy
  米车仍驶过去。你把能做的先送到手边，也留下了一辆之后要退出来的车。 # beat:c6_v6_wind_16 # scene:v6_wind # cast:v6_bo,v6_yan,v6_he # speaker:narrator
  -> v6_wind_people

=== v6_wind_people ===
任耕拿着一段刚换的旗索，望了望东面的高杆。田雁已在找还没出棚的老人。 # beat:c6_v6_wind_people_1 # scene:v6_wind # cast:v6_ren,v6_tian,v6_su # speaker:narrator
谁能去高处报旗，谁在下面喊，分开说。我不想人已经走散还听三处同一句。 # beat:c6_v6_wind_people_2 # scene:v6_wind # cast:v6_ren,v6_tian,v6_su # speaker:v6_tian # mood:v6_tian=neutral
{
- v6_qiao_agency:
报路那一段我刚自己试过，高秉给我排了两趟。别把我当多出来的伤员，找得到名字的那份我能做。 # beat:c6_v6_wind_people_3 # scene:v6_wind # cast:v6_qiao,v6_ren,v6_tian # speaker:v6_qiao # mood:v6_qiao=intent
他用左手把名牌交到田雁手里。那份工钱里，终于有一项由他自己挣来。 # beat:c6_v6_wind_people_4 # scene:v6_wind # cast:v6_qiao,v6_ren,v6_tian # speaker:narrator
- else:
我还没休满，今日不接报路的工钱。先替你们喊名字，等自己试过再领那一班。 # beat:c6_v6_wind_people_5 # scene:v6_wind # cast:v6_qiao,v6_ren,v6_tian # speaker:v6_qiao # mood:v6_qiao=calm
他把写着待试的那张牌收好。你先前顶下的几日，不能因为此刻缺人就算已经到期。 # beat:c6_v6_wind_people_6 # scene:v6_wind # cast:v6_qiao,v6_ren,v6_tian # speaker:narrator
}
{
- route == 3 and not v6_flag_safe:
我的手不能爬。我去下面跑，旗得换个人。 # beat:c6_v6_wind_people_7 # scene:v6_wind # cast:v6_qiao,v6_ren,v6_tian # speaker:v6_ren # mood:v6_ren=uneasy
他举起肿着的指节。早上那一步不肯停，现在少了一只可用的手。 # beat:c6_v6_wind_people_8 # scene:v6_wind # cast:v6_qiao,v6_ren,v6_tian # speaker:narrator
- else:
我报旗。木杆先查，再上；叫停的时候，下面要有人真听见。 # beat:c6_v6_wind_people_9 # scene:v6_wind # cast:v6_qiao,v6_ren,v6_tian # speaker:v6_ren # mood:v6_ren=intent
他没有忽然不怕，只是先把新绳从头捋了一遍。 # beat:c6_v6_wind_people_10 # scene:v6_wind # cast:v6_qiao,v6_ren,v6_tian # speaker:narrator
}
* [让能做的人各领一段，我在出口核对没到的人。 # cid:v6_assign_people]
  ~ v6_roles_clear = true
  旗手先查手和杆，田姑娘带出棚的人。我留出口，每到一队报一次，不替没看见的喊齐。 # beat:c6_v6_wind_people_11 # scene:v6_wind # cast:v6_qiao,v6_ren,v6_tian # speaker:you
  我跟你核名字。 # beat:c6_v6_wind_people_12 # scene:v6_wind # cast:v6_su,v6_qiao,v6_ren # speaker:v6_su # mood:v6_su=intent
  任耕问了一遍往哪儿报，才走出门口。 # beat:c6_v6_wind_people_13 # scene:v6_wind # cast:v6_su,v6_qiao,v6_ren # speaker:narrator
  -> v6_wind_return
* [自己先跑药棚，让主事另找人核出口。 # cid:v6_run_myself]
  ~ v6_roles_clear = false
  药棚那头我去，出口严主事另定一个人，别因为我说先去，就算两头都有人。 # beat:c6_v6_wind_people_14 # scene:v6_wind # cast:v6_su,v6_qiao,v6_ren # speaker:you
  我守出口，你回来向我报。 # beat:c6_v6_wind_people_15 # scene:v6_wind # cast:v6_su,v6_qiao,v6_ren # speaker:v6_su # mood:v6_su=sharp
  你点头。跑到拐角，才听见背后有人按各自名字应声。 # beat:c6_v6_wind_people_16 # scene:v6_wind # cast:v6_su,v6_qiao,v6_ren # speaker:narrator
  -> v6_wind_return

=== v6_wind_return ===
风把空旗拍得很响，东堤来人还没走到坪边。苏晚澄合起账页，只留名单摊着。 # beat:c6_v6_wind_return_1 # scene:v6_wind # cast:v6_su,v6_lu,v6_yan # speaker:narrator
刚才不是比谁说得早。现在没到的人，谁也不能替他到。 # beat:c6_v6_wind_return_2 # scene:v6_wind # cast:v6_su,v6_lu,v6_yan # speaker:v6_su # mood:v6_su=neutral
我去的那一头，会报回来。 # beat:c6_v6_wind_return_3 # scene:v6_wind # cast:v6_su,v6_lu,v6_yan # speaker:you
我去侧门。人多的时候，别让我拿回函挡路。 # beat:c6_v6_wind_return_4 # scene:v6_wind # cast:v6_su,v6_lu,v6_yan # speaker:v6_lu # mood:v6_lu=intent
-> arena_pair_result

=== after_choice ===
天亮，赊账簿重新晾在竹竿上。你没有把所有相识都约在今日，也不能同时过完几种人生。 # beat:c6_after_choice_1 # scene:v6_dawn # cast:v6_aunt,v6_su,v6_qiao # speaker:narrator
去哪儿先说。欠我的不看你今后名字多响，看你什么时候肯来。 # beat:c6_after_choice_2 # scene:v6_dawn # cast:v6_aunt,v6_su,v6_qiao # speaker:v6_aunt # mood:v6_aunt=neutral
你也别一声不响就替我定了。我有自己要回的地方。 # beat:c6_after_choice_3 # scene:v6_dawn # cast:v6_aunt,v6_su,v6_qiao # speaker:v6_qiao # mood:v6_qiao=calm
该赔的另记，归宿也不是拿一场好话把代价抹平。 # beat:c6_after_choice_4 # scene:v6_dawn # cast:v6_aunt,v6_su,v6_qiao # speaker:v6_su # mood:v6_su=neutral
{
- v6_advance:
会场把那笔路费还馆里了，收据在这里。你别再替别人垫第二回。 # beat:c6_after_choice_5 # scene:v6_dawn # cast:v6_deng,v6_aunt,v6_su # speaker:v6_deng # mood:v6_deng=neutral
我先收好。馆里的钱不是我的脸面。 # beat:c6_after_choice_6 # scene:v6_dawn # cast:v6_deng,v6_aunt,v6_su # speaker:you
}
{
- v6_public_cost:
工钱缺口公开后，今晚还是没有全凑足。严主事把不能开的那班划掉，留了重新招人的日期。 # beat:c6_after_choice_7 # scene:v6_dawn # cast:v6_deng,v6_aunt,v6_su # speaker:v6_su # mood:v6_su=neutral
那写清停到哪天。有人靠这钱过冬，不能只写待定。 # beat:c6_after_choice_8 # scene:v6_dawn # cast:v6_deng,v6_aunt,v6_su # speaker:you
- else:
你不肯认的那班没有写你名字。会后若有人再说你答应全包，我留着原具结。 # beat:c6_after_choice_9 # scene:v6_dawn # cast:v6_deng,v6_aunt,v6_su # speaker:v6_su # mood:v6_su=neutral
我自己也去讲，不能都等你替我证明。 # beat:c6_after_choice_10 # scene:v6_dawn # cast:v6_deng,v6_aunt,v6_su # speaker:you
}
{
- not v6_one_shift:
{
- final == 1 and not rescued and wound >= 3:
你答应代守的一个月，得另找人做。我先垫替工的钱，他按原价领，不从你养伤的药里挪。 # beat:c6_after_choice_11 # scene:v6_dawn # cast:v6_rong,v6_deng,v6_aunt # speaker:v6_rong # mood:v6_rong=intent
写借条。等我能上工再约还期，这一月不冒成我自己做完的。 # beat:c6_after_choice_12 # scene:v6_dawn # cast:v6_rong,v6_deng,v6_aunt # speaker:you
具结留着你的缺勤和另请的名字，伤没有替承诺自动销账。 # beat:c6_after_choice_13 # scene:v6_dawn # cast:v6_rong,v6_deng,v6_aunt # speaker:narrator
- else:
修船开班以后，你按约多接了一月的代守，练剑的课表少去几日。月底回执签完，空出的时辰才重新归你。 # beat:c6_after_choice_14 # scene:v6_dawn # cast:v6_rong,v6_deng,v6_aunt # speaker:narrator
这一页签清。下一月若还缺人，我另问，不能把临时写成你以后都在。 # beat:c6_after_choice_15 # scene:v6_dawn # cast:v6_rong,v6_deng,v6_aunt # speaker:v6_rong # mood:v6_rong=neutral
这回我也不拿一句帮忙，就把自己的一整年填进去。 # beat:c6_after_choice_16 # scene:v6_dawn # cast:v6_rong,v6_deng,v6_aunt # speaker:you
}
{
- future == 2 and not (final == 1 and not rescued and wound >= 3):
原本想赶的那一趟镖已走。你等下一队，不由旁人替代守的一个月凭空挪出另一条路。 # beat:c6_after_choice_17 # scene:v6_dawn # cast:v6_rong,v6_deng,v6_aunt # speaker:narrator
}
}
{
- final == 1 and not rescued and wound >= 3:
-> v6_after_scar
- final == 1 and not rescued:
-> v6_after_lost
- final == 3 and duel == 2:
-> v6_after_name
- future == 3:
-> v6_after_teacher
- future == 2 and team and qiao_saved:
-> v6_after_together
- future == 2:
-> v6_after_apart
- route == 2 and zhaoli_trust and rescued:
-> v6_after_captain
- else:
-> v6_after_harbor
}

=== v6_after_harbor ===
何铆把船坞钥匙放在桌上，让你自己伸手拿。领了差事的人，明日得第一个开门。 # beat:c6_v6_after_harbor_1 # scene:v6_dawn # cast:v6_he,v6_zhaoli,v6_aunt # speaker:narrator
工钱不多，漏一班就要有人补。你先选清晨还是午后，别看哪一班听着像救过人。 # beat:c6_v6_after_harbor_2 # scene:v6_dawn # cast:v6_he,v6_zhaoli,v6_aunt # speaker:v6_he # mood:v6_he=neutral
清晨我在河上。你若误了，我让整条船听你喊人。 # beat:c6_v6_after_harbor_3 # scene:v6_dawn # cast:v6_he,v6_zhaoli,v6_aunt # speaker:v6_zhaoli # mood:v6_zhaoli=amused
我只问，买饼要不要也给你留一份？ # beat:c6_v6_after_harbor_4 # scene:v6_dawn # cast:v6_he,v6_zhaoli,v6_aunt # speaker:v6_aunt # mood:v6_aunt=neutral
* [认清晨一班，练剑挪到午后。 # cid:v6_morning_shift]
  ~ v6_after_shift = 1
  给我留一份。第一班我来开门，不拿起晚说练到半夜。 # beat:c6_v6_after_harbor_5 # scene:v6_dawn # cast:v6_he,v6_zhaoli,v6_aunt # speaker:you
  钥匙收好。先查绳，再查船，不是先给人讲你那日站哪儿。 # beat:c6_v6_after_harbor_6 # scene:v6_dawn # cast:v6_he,v6_zhaoli,v6_aunt # speaker:v6_he # mood:v6_he=calm
  -> v6_harbor_shift
* [认午后船坞，清晨回馆教小满站稳。 # cid:v6_late_shift]
  ~ v6_after_shift = 2
  午后我来。清晨我在馆里，若临时换班，当天先写给你。 # beat:c6_v6_after_harbor_7 # scene:v6_dawn # cast:v6_he,v6_zhaoli,v6_aunt # speaker:you
  写也要有人接。明天我们把传话的人定下。 # beat:c6_v6_after_harbor_8 # scene:v6_dawn # cast:v6_he,v6_zhaoli,v6_aunt # speaker:v6_zhaoli # mood:v6_zhaoli=calm
  -> v6_harbor_shift

=== v6_harbor_shift ===
你把时辰写进册，没有把一个人的名字填满整日。 # beat:c6_v6_harbor_shift_1 # scene:v6_dawn # cast:v6_he,v6_zhaoli # speaker:narrator
{
- not v6_one_shift:
代守那一个月签清了。往后午后要多排班，我再问你，不拿上月那张当你一直答应。 # beat:c6_v6_harbor_shift_2 # scene:v6_dawn # cast:v6_he,v6_zhaoli # speaker:v6_he # mood:v6_he=neutral
一月少练的那几日我认，下一月也得自己再选。 # beat:c6_v6_harbor_shift_3 # scene:v6_dawn # cast:v6_he,v6_zhaoli # speaker:you
- else:
只认的一班做稳了，再谈第二班。今天不是因为你赢过才让你拿钥匙。 # beat:c6_v6_harbor_shift_4 # scene:v6_dawn # cast:v6_he,v6_zhaoli # speaker:v6_zhaoli # mood:v6_zhaoli=neutral
}
-> ending_harbor

=== v6_after_name ===
容既白把棍尾重新包好，试着走了一遍新步。你想起自己也有没练明白的地方，没先摆出赢者的样子。 # beat:c6_v6_after_name_1 # scene:v6_dawn # cast:v6_rong,v6_su,v6_xu # speaker:narrator
补试我还来。你上回看见的，我会换。 # beat:c6_v6_after_name_2 # scene:v6_dawn # cast:v6_rong,v6_su,v6_xu # speaker:v6_rong # mood:v6_rong=intent
先把饭约好，免得打完又说午饭凉了。 # beat:c6_v6_after_name_3 # scene:v6_dawn # cast:v6_rong,v6_su,v6_xu # speaker:v6_xu # mood:v6_xu=amused
正式试手与年差具结分开，谁也别拿工钱让人让招。 # beat:c6_v6_after_name_4 # scene:v6_dawn # cast:v6_rong,v6_su,v6_xu # speaker:v6_su # mood:v6_su=neutral
* [约定养好手后先拆旧招，再打补试。 # cid:v6_name_short]
  先拆。你变了路，我也不拿同一招蒙你第二回。 # beat:c6_v6_after_name_5 # scene:v6_dawn # cast:v6_rong,v6_su,v6_xu # speaker:you
  怕我到时正好防住？ # beat:c6_v6_after_name_6 # scene:v6_dawn # cast:v6_rong,v6_su,v6_xu # speaker:v6_rong # mood:v6_rong=amused
  怕我自己以为你还没学会。 # beat:c6_v6_after_name_7 # scene:v6_dawn # cast:v6_rong,v6_su,v6_xu # speaker:you
  -> v6_name_date
* [不约私下拆招，直接在公开补试再见。 # cid:v6_name_open]
  公开场上再见。今日各练各的，届时别因为请过饭就客气。 # beat:c6_v6_after_name_8 # scene:v6_dawn # cast:v6_rong,v6_su,v6_xu # speaker:you
  好。饭还请，棍也照打。 # beat:c6_v6_after_name_9 # scene:v6_dawn # cast:v6_rong,v6_su,v6_xu # speaker:v6_rong # mood:v6_rong=intent
  -> v6_name_date

=== v6_name_date ===
你们各自试着落了一步，没有替下一场提前分胜负。 # beat:c6_v6_name_date_1 # scene:v6_dawn # cast:v6_rong,v6_su # speaker:narrator
-> ending_name

=== v6_after_together ===
再出门的包袱比来时轻，砚生的药却多了一包。裴雁秋看完他的腕，先把押前的名字划成押尾。 # beat:c6_v6_after_together_1 # scene:v6_afterhall # cast:v6_qiao,v6_pei,v6_han # speaker:narrator
换差事可以，不要一路都只叫我伤着的那个。 # beat:c6_v6_after_together_2 # scene:v6_afterhall # cast:v6_qiao,v6_pei,v6_han # speaker:v6_qiao # mood:v6_qiao=sharp
押尾也得有人试路，不是给你留一处空位歇着。 # beat:c6_v6_after_together_3 # scene:v6_afterhall # cast:v6_qiao,v6_pei,v6_han # speaker:v6_pei # mood:v6_pei=neutral
你们走得快，药换得慢。哪天一项赶不上，就停那一项。 # beat:c6_v6_after_together_4 # scene:v6_afterhall # cast:v6_qiao,v6_pei,v6_han # speaker:v6_han # mood:v6_han=neutral
{
- v6_qiao_asked and v6_qiao_agency:
这回我也自己填。上回你问过，没替我写，我就还敢讲。 # beat:c6_v6_after_together_5 # scene:v6_afterhall # cast:v6_qiao,v6_pei,v6_han # speaker:v6_qiao # mood:v6_qiao=calm
他把押尾的回执收进自己的包，不再让你替他揣着。 # beat:c6_v6_after_together_6 # scene:v6_afterhall # cast:v6_qiao,v6_pei,v6_han # speaker:narrator
- else:
我想去，是我说的。不因为你想同行，才变成我的主意。 # beat:c6_v6_after_together_7 # scene:v6_afterhall # cast:v6_qiao,v6_pei,v6_han # speaker:v6_qiao # mood:v6_qiao=neutral
听见了。哪天你不想走，也直接告诉我。 # beat:c6_v6_after_together_8 # scene:v6_afterhall # cast:v6_qiao,v6_pei,v6_han # speaker:you
}
* [和他先定停步、换药、掉队三种口令。 # cid:v6_tail_signal]
  你喊停，我先停。不是你每次喊，我都猜你在替我担心。 # beat:c6_v6_after_together_9 # scene:v6_afterhall # cast:v6_qiao,v6_pei,v6_han # speaker:you
  那你走丢，我也喊停？ # beat:c6_v6_after_together_10 # scene:v6_afterhall # cast:v6_qiao,v6_pei,v6_han # speaker:v6_qiao # mood:v6_qiao=amused
  走丢就喊他名字，别把整队都叫成停。 # beat:c6_v6_after_together_11 # scene:v6_afterhall # cast:v6_qiao,v6_pei,v6_han # speaker:v6_pei # mood:v6_pei=neutral
  -> v6_together_depart
* [把半日休整写进路线，不靠一路临时忍耐。 # cid:v6_tail_schedule]
  这半日在客栈，谁都不接急件。腕子没好不是过一夜便忘了。 # beat:c6_v6_after_together_12 # scene:v6_afterhall # cast:v6_qiao,v6_pei,v6_han # speaker:you
  可以。少赚的那件镖钱你们也要认。 # beat:c6_v6_after_together_13 # scene:v6_afterhall # cast:v6_qiao,v6_pei,v6_han # speaker:v6_pei # mood:v6_pei=calm
  我认我的，不都落你头上。 # beat:c6_v6_after_together_14 # scene:v6_afterhall # cast:v6_qiao,v6_pei,v6_han # speaker:v6_qiao # mood:v6_qiao=neutral
  -> v6_together_depart

=== v6_together_depart ===
你们把落在纸上的约定带出门，没把别人的伤装成证明同行的记号。 # beat:c6_v6_together_depart_1 # scene:v6_afterhall # cast:v6_qiao,v6_pei # speaker:narrator
-> ending_together5

=== v6_after_teacher ===
包小满把水盆端到门边，等着你说下一步。你一时真想把这一趟见过的，全教给他。 # beat:c6_v6_after_teacher_1 # scene:v6_afterhall # cast:v6_bao,v6_han,v6_qiao # speaker:narrator
我今日能拿剑了么？不是要把盆端到明年吧？ # beat:c6_v6_after_teacher_2 # scene:v6_afterhall # cast:v6_bao,v6_han,v6_qiao # speaker:v6_bao # mood:v6_bao=intent
你问得比我们当年快。 # beat:c6_v6_after_teacher_3 # scene:v6_afterhall # cast:v6_bao,v6_han,v6_qiao # speaker:v6_qiao # mood:v6_qiao=amused
快没关系。问他会不会教，也该问得快。 # beat:c6_v6_after_teacher_4 # scene:v6_afterhall # cast:v6_bao,v6_han,v6_qiao # speaker:v6_han # mood:v6_han=neutral
你看着小满的脚，只能确定自己教得清这一段。 # beat:c6_v6_after_teacher_5 # scene:v6_afterhall # cast:v6_bao,v6_han,v6_qiao # speaker:narrator
* [今天只教站稳后的第一步，让小满自己重复。 # cid:v6_teach_one]
  不是一直端盆。盆先放，迈这一小步，到了再说下一步。 # beat:c6_v6_after_teacher_6 # scene:v6_afterhall # cast:v6_bao,v6_han,v6_qiao # speaker:you
  终于走出门了！ # beat:c6_v6_after_teacher_7 # scene:v6_afterhall # cast:v6_bao,v6_han,v6_qiao # speaker:v6_bao # mood:v6_bao=amused
  门槛还没过。看着点。 # beat:c6_v6_after_teacher_8 # scene:v6_afterhall # cast:v6_bao,v6_han,v6_qiao # speaker:v6_han # mood:v6_han=amused
  -> v6_teacher_first
* [让小满先说哪里站不住，我不抢着示范。 # cid:v6_teach_ask]
  你先说。你若只想学我最响的那句话，我可不收学费。 # beat:c6_v6_after_teacher_9 # scene:v6_afterhall # cast:v6_bao,v6_han,v6_qiao # speaker:you
  后脚老跟着前脚挤。不是我不肯站，是一动就挤。 # beat:c6_v6_after_teacher_10 # scene:v6_afterhall # cast:v6_bao,v6_han,v6_qiao # speaker:v6_bao # mood:v6_bao=uneasy
  好，那先只试这个。 # beat:c6_v6_after_teacher_11 # scene:v6_afterhall # cast:v6_bao,v6_han,v6_qiao # speaker:you
  -> v6_teacher_first

=== v6_teacher_first ===
小满第一次没做好，第二次仍没做好。你没有把自己出去见过世面，拿来替他的脚走路。 # beat:c6_v6_teacher_first_1 # scene:v6_afterhall # cast:v6_han,v6_bao # speaker:narrator
-> ending_teacher

=== v6_after_captain ===
船册上留下空格，程阿笠却先把自己的名字写在新一段水路旁。江照鲤伸手想改，她按住了纸。 # beat:c6_v6_after_captain_1 # scene:v6_dawn # cast:v6_zhaoli,v6_du,v6_cheng # speaker:narrator
我说自己掌，不是说偷偷掌。你们都在岸上，还不能让我试？ # beat:c6_v6_after_captain_2 # scene:v6_dawn # cast:v6_zhaoli,v6_du,v6_cheng # speaker:v6_cheng # mood:v6_cheng=sharp
她这句有理。你们领船的，也得留个新人能过的地方。 # beat:c6_v6_after_captain_3 # scene:v6_dawn # cast:v6_zhaoli,v6_du,v6_cheng # speaker:v6_du # mood:v6_du=neutral
我知道她会。就是一想那夜，还没法不先伸手。 # beat:c6_v6_after_captain_4 # scene:v6_dawn # cast:v6_zhaoli,v6_du,v6_cheng # speaker:v6_zhaoli # mood:v6_zhaoli=uneasy
你也想替她把每个险处走完，那样她就永远只是跟船的人。 # beat:c6_v6_after_captain_5 # scene:v6_dawn # cast:v6_zhaoli,v6_du,v6_cheng # speaker:narrator
* [岸上约好三处停靠，照鲤只在真正越线时介入。 # cid:v6_train_bank]
  定三处。她停错了说哪儿错，没到险处，先让她自己挽回来。 # beat:c6_v6_after_captain_6 # scene:v6_dawn # cast:v6_zhaoli,v6_du,v6_cheng # speaker:you
  好。我先把水路指给你们看。 # beat:c6_v6_after_captain_7 # scene:v6_dawn # cast:v6_zhaoli,v6_du,v6_cheng # speaker:v6_cheng # mood:v6_cheng=intent
  我听。不是等你说完，再把我的写上去。 # beat:c6_v6_after_captain_8 # scene:v6_dawn # cast:v6_zhaoli,v6_du,v6_cheng # speaker:v6_zhaoli # mood:v6_zhaoli=calm
  -> v6_captain_first
* [先让阿笠领一趟轻货，亏下的工钱自己认份额。 # cid:v6_train_cargo]
  这一趟少装，慢的那点别扣她工钱。我们既要教，也得肯少赚一次。 # beat:c6_v6_after_captain_9 # scene:v6_dawn # cast:v6_zhaoli,v6_du,v6_cheng # speaker:you
  难得。不是只肯在岸上鼓掌。 # beat:c6_v6_after_captain_10 # scene:v6_dawn # cast:v6_zhaoli,v6_du,v6_cheng # speaker:v6_du # mood:v6_du=amused
  货少了，我也照规矩交清。别当玩一圈。 # beat:c6_v6_after_captain_11 # scene:v6_dawn # cast:v6_zhaoli,v6_du,v6_cheng # speaker:v6_cheng # mood:v6_cheng=neutral
  -> v6_captain_first

=== v6_captain_first ===
红绳仍挂在船头，末端能解。你们没有因为回来过一次，就不再重新试结。 # beat:c6_v6_captain_first_1 # scene:v6_dawn # cast:v6_zhaoli,v6_cheng # speaker:narrator
-> ending_captain

=== v6_after_apart ===
你要走的那条路，不在砚生今日的包袱里。他把借来的护腕叠好，搁在桌边，没有追问为什么。 # beat:c6_v6_after_apart_1 # scene:v6_dawn # cast:v6_qiao,v6_su,v6_lu # speaker:narrator
我想让你留，也想明白这不是我一句话就该定的。 # beat:c6_v6_after_apart_2 # scene:v6_dawn # cast:v6_qiao,v6_su,v6_lu # speaker:v6_qiao # mood:v6_qiao=uneasy
我也想带你。可不能把你现在养伤，说成暂时等着跟上我的人生。 # beat:c6_v6_after_apart_3 # scene:v6_dawn # cast:v6_qiao,v6_su,v6_lu # speaker:you
那就把信写到能收到的地方。别只留江湖两个字。 # beat:c6_v6_after_apart_4 # scene:v6_dawn # cast:v6_qiao,v6_su,v6_lu # speaker:v6_su # mood:v6_su=neutral
* [约一个月内报平安，失约前先托人传话。 # cid:v6_letter_month]
  一个月内。没走到原定的城，也从中途寄，不拿路远挡着。 # beat:c6_v6_after_apart_5 # scene:v6_dawn # cast:v6_qiao,v6_su,v6_lu # speaker:you
  我不替你收得胜的传闻，只收你自己的字。 # beat:c6_v6_after_apart_6 # scene:v6_dawn # cast:v6_qiao,v6_su,v6_lu # speaker:v6_qiao # mood:v6_qiao=calm
  -> v6_apart_address
* [不许诺常写，约定下一次确定路过时当面来见。 # cid:v6_letter_meet]
  我没把握月月写，不拿这个哄你。下回真知道何日经过，先送信。 # beat:c6_v6_after_apart_7 # scene:v6_dawn # cast:v6_qiao,v6_su,v6_lu # speaker:you
  那就真知道再说。今天这顿饭，先坐着吃完。 # beat:c6_v6_after_apart_8 # scene:v6_dawn # cast:v6_qiao,v6_su,v6_lu # speaker:v6_qiao # mood:v6_qiao=sharp
  总算有人肯把先吃饭用在正经时候。 # beat:c6_v6_after_apart_9 # scene:v6_dawn # cast:v6_qiao,v6_su,v6_lu # speaker:v6_lu # mood:v6_lu=amused
  -> v6_apart_address

=== v6_apart_address ===
你把没能同时答应的事摊开，没有请任何一个人替你说离开最洒脱。 # beat:c6_v6_apart_address_1 # scene:v6_dawn # cast:v6_qiao,v6_su # speaker:narrator
-> ending_apart

=== v6_after_scar ===
醒来后，凌苇先让你握一只空碗。你想撑着坐起，肋下的痛便逼你重新躺回去。 # beat:c6_v6_after_scar_1 # scene:v6_afterhall # cast:v6_ling,v6_qiao,v6_he # speaker:narrator
先别问什么时候能出剑。你连这口气都在抢。 # beat:c6_v6_after_scar_2 # scene:v6_afterhall # cast:v6_ling,v6_qiao,v6_he # speaker:v6_ling # mood:v6_ling=sharp
我来过这一套。你别把我劝你的话又还回来。 # beat:c6_v6_after_scar_3 # scene:v6_afterhall # cast:v6_ling,v6_qiao,v6_he # speaker:v6_qiao # mood:v6_qiao=uneasy
船坞缺量尺寸的人，不缺咬着牙替我抬梁的人。你要来，先照这个来。 # beat:c6_v6_after_scar_4 # scene:v6_afterhall # cast:v6_ling,v6_qiao,v6_he # speaker:v6_he # mood:v6_he=neutral
* [接受量尺寸的轻活，停下原定试艺。 # cid:v6_accept_light]
  我来量。疼了就停，不试自己还能硬撑几回。 # beat:c6_v6_after_scar_5 # scene:v6_afterhall # cast:v6_ling,v6_qiao,v6_he # speaker:you
  这句我记着，不是给你一个月以后反悔的。 # beat:c6_v6_after_scar_6 # scene:v6_afterhall # cast:v6_ling,v6_qiao,v6_he # speaker:v6_ling # mood:v6_ling=calm
  你没有在床边试握剑，只先把碗放稳。 # beat:c6_v6_after_scar_7 # scene:v6_afterhall # cast:v6_ling,v6_qiao,v6_he # speaker:narrator
  -> v6_scar_work
* [先留馆专心养伤，让伙伴代办这一月的工钱。 # cid:v6_accept_rest]
  我先不去。代办的那份记账，不把你们照顾说成我已经能干。 # beat:c6_v6_after_scar_8 # scene:v6_afterhall # cast:v6_ling,v6_qiao,v6_he # speaker:you
  好。明日我来说做了哪件，没做成也说。 # beat:c6_v6_after_scar_9 # scene:v6_afterhall # cast:v6_ling,v6_qiao,v6_he # speaker:v6_qiao # mood:v6_qiao=calm
  少掉的工钱仍少掉，你把养伤的时日写进原来的计划。 # beat:c6_v6_after_scar_10 # scene:v6_afterhall # cast:v6_ling,v6_qiao,v6_he # speaker:narrator
  -> v6_scar_work

=== v6_scar_work ===
这个秋天会比你想的长。你先学着把今天做完，不再用下一场胜负许诺伤口。 # beat:c6_v6_scar_work_1 # scene:v6_afterhall # cast:v6_ling,v6_he # speaker:narrator
-> ending_scar

=== v6_after_lost ===
刘篙坐在岸上，左腿搁在矮凳。你来之前想了许多赔礼，见到他，第一句仍差点是还疼不疼。 # beat:c6_v6_after_lost_1 # scene:v6_dawn # cast:v6_liu,v6_zhaoli,v6_han # speaker:narrator
别又问。报船我会，认船号我也会。你们若是真缺人，就把册子放过来。 # beat:c6_v6_after_lost_2 # scene:v6_dawn # cast:v6_liu,v6_zhaoli,v6_han # speaker:v6_liu # mood:v6_liu=sharp
领船的钱我分一份，不拿来买他原谅。 # beat:c6_v6_after_lost_3 # scene:v6_dawn # cast:v6_liu,v6_zhaoli,v6_han # speaker:v6_zhaoli # mood:v6_zhaoli=uneasy
你要改，也得听他想把哪件事拿回来，不是只想着自己多难受。 # beat:c6_v6_after_lost_4 # scene:v6_dawn # cast:v6_liu,v6_zhaoli,v6_han # speaker:v6_han # mood:v6_han=neutral
* [把报船册交给他，自己照他报的次序做。 # cid:v6_liu_report]
  你报，我照着做。有哪处我抢了你的话，直接叫我停。 # beat:c6_v6_after_lost_5 # scene:v6_dawn # cast:v6_liu,v6_zhaoli,v6_han # speaker:you
  三号先，五号等。别看我眼色，去看那条船。 # beat:c6_v6_after_lost_6 # scene:v6_dawn # cast:v6_liu,v6_zhaoli,v6_han # speaker:v6_liu # mood:v6_liu=intent
  你向河上转身，没有再把全岸的人都叫来听一场道歉。 # beat:c6_v6_after_lost_7 # scene:v6_dawn # cast:v6_liu,v6_zhaoli,v6_han # speaker:narrator
  -> v6_lost_report
* [先把每月赔付日期和来源写清，再请他定想做的工作。 # cid:v6_liu_account]
  这笔每月到，不看你肯不肯来。你来做的活，另算工钱。 # beat:c6_v6_after_lost_8 # scene:v6_dawn # cast:v6_liu,v6_zhaoli,v6_han # speaker:you
  写清。我愿来报船，不等于你们以后就可以说伤已经不碍事。 # beat:c6_v6_after_lost_9 # scene:v6_dawn # cast:v6_liu,v6_zhaoli,v6_han # speaker:v6_liu # mood:v6_liu=calm
  你把两笔分开，拿给他自己看。 # beat:c6_v6_after_lost_10 # scene:v6_dawn # cast:v6_liu,v6_zhaoli,v6_han # speaker:narrator
  -> v6_lost_report

=== v6_lost_report ===
一条船离岸，你没有把刘篙仍在岸边这件事抹去。下一条轮到谁，仍由他报。 # beat:c6_v6_lost_report_1 # scene:v6_dawn # cast:v6_liu,v6_zhaoli # speaker:narrator
-> ending_lost


=== v6_books ===
客舍漏雨，苏晚澄把借来的旧录移到长凳上。最下面一包已湿了边。陆汀舟去借竹架，回来时，何铆正端着炭盆进门。 # beat:c6_v6_books_1 # scene:v6_inn # cast:v6_su,v6_lu,v6_he # speaker:narrator
烘木料的火，借你们半刻。人看着就行。 # beat:c6_v6_books_2 # scene:v6_inn # cast:v6_su,v6_lu,v6_he # speaker:v6_he # mood:v6_he=neutral
先别搁这儿。 # beat:c6_v6_books_3 # scene:v6_inn # cast:v6_su,v6_lu,v6_he # speaker:v6_su # mood:v6_su=sharp
南岳送回金陵七箱书的那回事，你听过么？ # beat:c6_v6_books_4 # scene:v6_inn # cast:v6_su,v6_lu,v6_he # speaker:v6_lu # mood:v6_lu=intent
两门和好的故事？ # beat:c6_v6_books_5 # scene:v6_inn # cast:v6_su,v6_lu,v6_he # speaker:you
和不和好，各人还会争。起火的事却查明了：梅雨里起炭烘纸，旧棉先着，烧上木梁。没谁潜进去放火。 # beat:c6_v6_books_6 # scene:v6_inn # cast:v6_su,v6_lu,v6_he # speaker:v6_su # mood:v6_su=neutral
我以为是他们早年的仇。 # beat:c6_v6_books_7 # scene:v6_inn # cast:v6_su,v6_lu,v6_he # speaker:v6_he # mood:v6_he=uneasy
后来送回的是另一地存下的抄本。眼下这包，也有一份在馆里，另一包没有。 # beat:c6_v6_books_8 # scene:v6_inn # cast:v6_su,v6_lu,v6_he # speaker:v6_su # mood:v6_su=neutral
离开饭桌，得把借来的书移到通风的空屋。你原本约了砚生趁雨小练一回。 # beat:c6_v6_books_9 # scene:v6_inn # cast:v6_su,v6_lu,v6_he # speaker:narrator
* [撤炭，帮两人架书，错过今晚约好的对练。 # cid:v6_air_books]
  ~ v6_book_dry = true
  何师傅，火还给木料。我把这张桌搬过去。 # beat:c6_v6_books_10 # scene:v6_inn # cast:v6_su,v6_lu,v6_he # speaker:you
  我架上层，你垫下边。纸别贴墙。 # beat:c6_v6_books_11 # scene:v6_inn # cast:v6_su,v6_lu,v6_he # speaker:v6_lu # mood:v6_lu=calm
  乔砚生从廊下探头，看见你满手湿纸，只把木剑靠到门边，说自己先走两趟步。 # beat:c6_v6_books_12 # scene:v6_inn # cast:v6_su,v6_lu,v6_he # speaker:narrator
  -> v6_books_after
* [说清自己要赴约，请他们另找空屋，不替自己认已办完。 # cid:v6_delegate_books]
  ~ v6_book_dry = false
  我答应砚生了。这里得请你们自己搬，我没替你们架好。 # beat:c6_v6_books_13 # scene:v6_inn # cast:v6_su,v6_lu,v6_he # speaker:you
  我搭架。那两包先放我门口，今晚不点炉。 # beat:c6_v6_books_14 # scene:v6_inn # cast:v6_su,v6_lu,v6_he # speaker:v6_he # mood:v6_he=neutral
  你按时赴了约。回屋时，苏晚澄还在分开粘住的纸边，能辨的字只誊出半册。 # beat:c6_v6_books_15 # scene:v6_inn # cast:v6_su,v6_lu,v6_he # speaker:narrator
  -> v6_books_after

=== v6_books_after ===
这册讲山地改步。金陵收右脚换左步，遇湿石未必留得住那个落点。我带回去试，不把原式刮掉。 # beat:c6_v6_books_after_1 # scene:v6_inn # cast:v6_su,v6_lu # speaker:v6_lu # mood:v6_lu=neutral
新写的先注明哪条山路。不是把你的用法塞进旧人名下，便能多一层凭据。 # beat:c6_v6_books_after_2 # scene:v6_inn # cast:v6_su,v6_lu # speaker:v6_su # mood:v6_su=intent
你替我留原式，我替你补落脚的石头。这一页倒能写在一起。 # beat:c6_v6_books_after_3 # scene:v6_inn # cast:v6_su,v6_lu # speaker:v6_lu # mood:v6_lu=amused
他们没有争出哪一门高。苏把空白的半页折起，约定回来再看你走过的路。 # beat:c6_v6_books_after_4 # scene:v6_inn # cast:v6_su,v6_lu # speaker:narrator
-> inn_depart

=== v6_roles_anchor ===
临出发，程阿笠把两张船名牌放到杜汀叟面前。旁边有个练棍的青年，正说自己昨日胜过她，不该只分到后船。 # beat:c6_v6_roles_anchor_1 # scene:v6_depart # cast:v6_zhaoli,v6_du,v6_cheng # speaker:narrator
昨日我输了，今日我认前船。不是一回事。 # beat:c6_v6_roles_anchor_2 # scene:v6_depart # cast:v6_zhaoli,v6_du,v6_cheng # speaker:v6_cheng # mood:v6_cheng=sharp
她认浅口，后船的人会补帆。你拿棍赢她，若也认得那两段水，先指出来。 # beat:c6_v6_roles_anchor_3 # scene:v6_depart # cast:v6_zhaoli,v6_du,v6_cheng # speaker:v6_du # mood:v6_du=neutral
青年只指中一处，又蹲下去看名牌。杜老没有叫他滚，给他留了一根记水深的篙。 # beat:c6_v6_roles_anchor_4 # scene:v6_depart # cast:v6_zhaoli,v6_du,v6_cheng # speaker:narrator
海上归潮岛的旧事，我跑海路的师傅讲过。沈归潮赢过周望海，四十九岁仍没得九席；后来自己也认了。 # beat:c6_v6_roles_anchor_5 # scene:v6_depart # cast:v6_zhaoli,v6_du,v6_cheng # speaker:v6_cheng # mood:v6_cheng=neutral
别只记没得。那几年，周带回九条船，沈带回七条；两帮械斗，打服以后还得有人不让它再打。 # beat:c6_v6_roles_anchor_6 # scene:v6_depart # cast:v6_zhaoli,v6_du,v6_cheng # speaker:v6_du # mood:v6_du=neutral
青蒲渡又不是海天门。 # beat:c6_v6_roles_anchor_7 # scene:v6_depart # cast:v6_zhaoli,v6_du,v6_cheng # speaker:you
所以不排九席。只问今天这张牌，写谁的名字真的找得到谁。 # beat:c6_v6_roles_anchor_8 # scene:v6_depart # cast:v6_zhaoli,v6_du,v6_cheng # speaker:v6_du # mood:v6_du=neutral
你选的路已经写定，程阿笠仍要向你借一个早晨。出发前帮各班走一遍，或只报自己这一班，都须当面讲。 # beat:c6_v6_roles_anchor_9 # scene:v6_depart # cast:v6_zhaoli,v6_du,v6_cheng # speaker:narrator
* [走完交接再出发，少练一轮自己的起手。 # cid:v6_walk_handover]
  ~ v6_handover = true
  前船等谁，后船几点换，我跟你们走一遍。我的起手回头再练。 # beat:c6_v6_roles_anchor_10 # scene:v6_depart # cast:v6_zhaoli,v6_du,v6_cheng # speaker:you
  那先别答应我三处。你只认这边两班的碰头时辰。 # beat:c6_v6_roles_anchor_11 # scene:v6_depart # cast:v6_zhaoli,v6_du,v6_cheng # speaker:v6_cheng # mood:v6_cheng=intent
  你用两块不同的木牌试过交接。到时间没有人来，便找班首，不把空船当成已经有人守。 # beat:c6_v6_roles_anchor_12 # scene:v6_depart # cast:v6_zhaoli,v6_du,v6_cheng # speaker:narrator
  -> v6_roles_after
* [只报清自己一班，让班首负责两班交接，保住晨练。 # cid:v6_name_own_shift]
  ~ v6_handover = false
  我只报自己这班。两班交接你找班首，我不替没走过的点头。 # beat:c6_v6_roles_anchor_13 # scene:v6_depart # cast:v6_zhaoli,v6_du,v6_cheng # speaker:you
  成。回来若发现缺人，再补，不把今早这句算成你都查过。 # beat:c6_v6_roles_anchor_14 # scene:v6_depart # cast:v6_zhaoli,v6_du,v6_cheng # speaker:v6_du # mood:v6_du=neutral
  你去赴最后一轮晨练。程阿笠领着另外两人走船，临开船才发现第二班把碰头时辰听迟了一刻。 # beat:c6_v6_roles_anchor_15 # scene:v6_depart # cast:v6_zhaoli,v6_du,v6_cheng # speaker:narrator
  -> v6_roles_after

=== v6_roles_after ===
院门外，裴雁秋用两根树枝摆出一处窄口，韩鹭石蹲下替他压住风吹的那根。 # beat:c6_v6_roles_after_1 # scene:v6_depart # cast:v6_pei,v6_han # speaker:narrator
靖王出巡遇伏那件公门旧案，我师父拿来教过队列。许长安不追弩手，先夹住车，等车驾出去便脱身。他要守的是人过口的工夫。 # beat:c6_v6_roles_after_2 # scene:v6_depart # cast:v6_pei,v6_han # speaker:v6_pei # mood:v6_pei=neutral
他们的刀和我们的药车，不是一档本事。你们练一遍听报就退，倒不用等练到那层。 # beat:c6_v6_roles_after_3 # scene:v6_depart # cast:v6_pei,v6_han # speaker:v6_han # mood:v6_han=neutral
真出事，别拿追远的那个人当成非打倒不可。你可以守窄口，也可以做传信；我现在要的是到时听得见谁。 # beat:c6_v6_roles_after_4 # scene:v6_depart # cast:v6_pei,v6_han # speaker:v6_pei # mood:v6_pei=intent
往返练报会磨去一刻钟，药车少歇一站。你得选这段时间从哪里出。 # beat:c6_v6_roles_after_5 # scene:v6_depart # cast:v6_pei,v6_han # speaker:narrator
* [同各班练一遍退报，出发后少歇一站。 # cid:v6_rehearse_exit]
  ~ v6_exit_drill = true
  先试。后面喊人齐，前面复一遍，再退。别凭谁嗓门大。 # beat:c6_v6_roles_after_6 # scene:v6_depart # cast:v6_pei,v6_han # speaker:you
  我报末车。没听清就重来，不拿点头当听见。 # beat:c6_v6_roles_after_7 # scene:v6_depart # cast:v6_pei,v6_han # speaker:v6_pei # mood:v6_pei=neutral
  第三遍才接上。启程以后，别人还能坐着喝半碗热水，你先替这一刻的迟出补行李。 # beat:c6_v6_roles_after_8 # scene:v6_depart # cast:v6_pei,v6_han # speaker:narrator
  -> v6_roles_ready
* [按时出发留足脚力，只记下各班的报信人。 # cid:v6_leave_rested]
  ~ v6_exit_drill = false
  报信人的名字我记。先按时走，这趟不练。 # beat:c6_v6_roles_after_9 # scene:v6_depart # cast:v6_pei,v6_han # speaker:you
  那临场就得再问一遍。你别嫌人来问慢。 # beat:c6_v6_roles_after_10 # scene:v6_depart # cast:v6_pei,v6_han # speaker:v6_pei # mood:v6_pei=neutral
  你把名字折在衣袋里。纸没有替人说过话，谁会漏听，还不知道。 # beat:c6_v6_roles_after_11 # scene:v6_depart # cast:v6_pei,v6_han # speaker:narrator
  -> v6_roles_ready

=== v6_roles_ready ===
别因为听了一个旧案，便把自己当成能守住高手的人。 # beat:c6_v6_roles_ready_1 # scene:v6_depart # cast:v6_han,v6_pei # speaker:v6_han # mood:v6_han=intent
守不住我会叫。也不把药车留下，自己跑去问剑。 # beat:c6_v6_roles_ready_2 # scene:v6_depart # cast:v6_han,v6_pei # speaker:you
韩鹭石把压树枝的石头捡开。路在门外，摆过一遍并不保证会顺。 # beat:c6_v6_roles_ready_3 # scene:v6_depart # cast:v6_han,v6_pei # speaker:narrator
-> departure

=== v6_grain_inventory ===
具结还没送回，何铆已在米行门口找木梯。账上明明有四张，他只摸到两张可用的。 # beat:c6_v6_grain_inventory_1 # scene:v6_contract # cast:v6_rong,v6_deng,v6_he # speaker:narrator
旧册抄的，上个月没人说坏。 # beat:c6_v6_grain_inventory_2 # scene:v6_contract # cast:v6_rong,v6_deng,v6_he # speaker:v6_rong # mood:v6_rong=uneasy
下月还照抄？ # beat:c6_v6_grain_inventory_3 # scene:v6_contract # cast:v6_rong,v6_deng,v6_he # speaker:v6_deng # mood:v6_deng=sharp
找另一仓。谁肯跟我去？这会儿去，你们今晚的对练就缺人。 # beat:c6_v6_grain_inventory_4 # scene:v6_contract # cast:v6_rong,v6_deng,v6_he # speaker:v6_he # mood:v6_he=neutral
容既白翻出一页运粮旧事，不是拳谱。山河璧所指的图已经抄开以后，人还得去守第七库；玉上没有一粒可以煮的米。 # beat:c6_v6_grain_inventory_5 # scene:v6_contract # cast:v6_rong,v6_deng,v6_he # speaker:narrator
家里拿这页教管仓，我小时候偏爱前头抢玉的那段。现在轮到我报四张梯。 # beat:c6_v6_grain_inventory_6 # scene:v6_contract # cast:v6_rong,v6_deng,v6_he # speaker:v6_rong # mood:v6_rong=neutral
报错能改。先看。 # beat:c6_v6_grain_inventory_7 # scene:v6_contract # cast:v6_rong,v6_deng,v6_he # speaker:you
先别替我轻松。现有两张，你要保今晚试艺，还是跟何师傅去找剩下两张？ # beat:c6_v6_grain_inventory_8 # scene:v6_contract # cast:v6_rong,v6_deng,v6_he # speaker:v6_rong # mood:v6_rong=neutral
* [放下对练，逐仓查梯、干布和备用横板。 # cid:v6_inspect_stock]
  ~ v6_stock_checked = true
  实物查完再回。今晚的对练我另约。 # beat:c6_v6_grain_inventory_9 # scene:v6_contract # cast:v6_rong,v6_deng,v6_he # speaker:you
  一张横档烂了别用脚试。放旁边，免得后来的人又捡走。 # beat:c6_v6_grain_inventory_10 # scene:v6_contract # cast:v6_rong,v6_deng,v6_he # speaker:v6_he # mood:v6_he=intent
  第四张果然断在漆下。你们借到一张替用的，把两包干布移到高架，工钱照出，不拿借字免账。 # beat:c6_v6_grain_inventory_11 # scene:v6_contract # cast:v6_rong,v6_deng,v6_he # speaker:narrator
  -> v6_grain_ready
* [只认现场两张，留在试艺名单前，把补查交给米行。 # cid:v6_keep_evening]
  ~ v6_stock_checked = false
  我今晚得练。只签见到的两张，其余你另派人查。 # beat:c6_v6_grain_inventory_12 # scene:v6_contract # cast:v6_rong,v6_deng,v6_he # speaker:you
  我派。你这边别再替我说四张齐。 # beat:c6_v6_grain_inventory_13 # scene:v6_contract # cast:v6_rong,v6_deng,v6_he # speaker:v6_rong # mood:v6_rong=intent
  他找人时，库门已锁。天亮只拿到一张未查的旧梯，谁也没有先上去证明能用。你保住了对练时辰。 # beat:c6_v6_grain_inventory_14 # scene:v6_contract # cast:v6_rong,v6_deng,v6_he # speaker:narrator
  -> v6_grain_ready

=== v6_grain_ready ===
借梯的钱从会场支，不先扣搬粮的工钱。我去要借条。 # beat:c6_v6_grain_ready_1 # scene:v6_contract # cast:v6_rong,v6_deng # speaker:v6_deng # mood:v6_deng=neutral
你去。我在这儿，不让那一栏空着送走。 # beat:c6_v6_grain_ready_2 # scene:v6_contract # cast:v6_rong,v6_deng # speaker:v6_rong # mood:v6_rong=calm
契书上的数有了实物可以对，或者留下了一处明写着待查的空白。你没法靠把字写满，添出另一张梯。 # beat:c6_v6_grain_ready_3 # scene:v6_contract # cast:v6_rong,v6_deng # speaker:narrator
-> v6_evidence

=== v6_evidence ===
试艺前，高秉拿来两份报名注记。有人把许竞川那次败给你的私试写成输石梁馆；还添了一句，他家旧师也不及韩鹭石。 # beat:c6_v6_evidence_1 # scene:v6_arena # cast:v6_su,v6_xu,v6_gao # speaker:narrator # action:亲见与传闻
我输的那场可以写。后一句，谁在场？ # beat:c6_v6_evidence_2 # scene:v6_arena # cast:v6_su,v6_xu,v6_gao # speaker:v6_xu # mood:v6_xu=sharp
递来的不是他本人。 # beat:c6_v6_evidence_3 # scene:v6_arena # cast:v6_su,v6_xu,v6_gao # speaker:v6_gao # mood:v6_gao=uneasy
江汉死人争榜旧案里，后来查出的三名弟子用同一招路，让几份战绩看似都是谢藏锋一人打的。会同一路剑，证明不了是同一个人。 # beat:c6_v6_evidence_4 # scene:v6_arena # cast:v6_su,v6_xu,v6_gao # speaker:v6_su # mood:v6_su=neutral
所以这张若替我删了前一场，也是在占便宜。 # beat:c6_v6_evidence_5 # scene:v6_arena # cast:v6_su,v6_xu,v6_gao # speaker:v6_xu # mood:v6_xu=neutral
前一场留。没见过的那句，查来历。 # beat:c6_v6_evidence_6 # scene:v6_arena # cast:v6_su,v6_xu,v6_gao # speaker:v6_su # mood:v6_su=intent
报名复核只留到第一声锣。你若留下给私试作证，热身就少一轮；直接入场，也可要求先把传闻另页收存，但高秉来不及当场问你细节。 # beat:c6_v6_evidence_7 # scene:v6_arena # cast:v6_su,v6_xu,v6_gao # speaker:narrator
* [留下签自己见过的那一场，要求其余暂不采。 # cid:v6_sign_witness]
  ~ v6_witness_signed = true
  我签私试。起止和谁先停，我都在。祖辈那句我不知道，别写我的名。 # beat:c6_v6_evidence_8 # scene:v6_arena # cast:v6_su,v6_xu,v6_gao # speaker:you
  这一页你也看过。改了再让你认，不替你补句听说。 # beat:c6_v6_evidence_9 # scene:v6_arena # cast:v6_su,v6_xu,v6_gao # speaker:v6_gao # mood:v6_gao=neutral
  你落了名，入场时第一遍热身已过。许竞川没有道谢，把你没系紧的护腕结指给你看。 # beat:c6_v6_evidence_10 # scene:v6_arena # cast:v6_su,v6_xu,v6_gao # speaker:narrator
  -> v6_evidence_ready
* [先入场，明确要求未查传闻另页，不占正式战绩。 # cid:v6_split_rumor]
  ~ v6_witness_signed = false
  我先准备。传闻另收，别靠我没留下就算默认。私试的细节，散场找我核。 # beat:c6_v6_evidence_11 # scene:v6_arena # cast:v6_su,v6_xu,v6_gao # speaker:you
  复核栏先空着，不能当你已认。 # beat:c6_v6_evidence_12 # scene:v6_arena # cast:v6_su,v6_xu,v6_gao # speaker:v6_gao # mood:v6_gao=neutral
  许竞川站到另一边热身。册上仍留待核两字，他今日报给外人的履历，暂时也少了这一场已经真打过的私试。 # beat:c6_v6_evidence_13 # scene:v6_arena # cast:v6_su,v6_xu,v6_gao # speaker:narrator
  -> v6_evidence_ready

=== v6_evidence_ready ===
今日若再输，只写今日。别因为替我分清旧账，就先欠我一场。 # beat:c6_v6_evidence_ready_1 # scene:v6_arena # cast:v6_su,v6_xu # speaker:v6_xu # mood:v6_xu=intent
他也不欠。 # beat:c6_v6_evidence_ready_2 # scene:v6_arena # cast:v6_su,v6_xu # speaker:v6_su # mood:v6_su=neutral
你们各自进场。册子收起，没有替任何人挡下一棍。 # beat:c6_v6_evidence_ready_3 # scene:v6_arena # cast:v6_su,v6_xu # speaker:narrator
-> arena_open

=== v6_sluice ===
东堤来的第一声求援打断了点名。侧门上有一扇高窗，窗下的泥路已漫水。程阿笠想从高处先接出两个走不快的老人。 # beat:c6_v6_sluice_1 # scene:v6_levee # cast:v6_he,v6_tian,v6_cheng # speaker:narrator
横梯呢？一头搭这里，另一头架内墙，够过去。 # beat:c6_v6_sluice_2 # scene:v6_levee # cast:v6_he,v6_tian,v6_cheng # speaker:v6_cheng # mood:v6_cheng=intent
等我看过再上。 # beat:c6_v6_sluice_3 # scene:v6_levee # cast:v6_he,v6_tian,v6_cheng # speaker:v6_he # mood:v6_he=neutral
{
- v6_gate_clear:
坪上那辆车提前退了，接出来的人能直接过东口。只是药箱还在后队，我先借一块干布。 # beat:c6_v6_sluice_4 # scene:v6_levee # cast:v6_he,v6_tian,v6_cheng # speaker:v6_tian # mood:v6_tian=neutral
清车那阵我只能先背绳，药棚还得再派个人跑。 # beat:c6_v6_sluice_5 # scene:v6_levee # cast:v6_he,v6_tian,v6_cheng # speaker:v6_he # mood:v6_he=neutral
你们省下了退车的那一段，又得把缺的这一趟补上。 # beat:c6_v6_sluice_6 # scene:v6_levee # cast:v6_he,v6_tian,v6_cheng # speaker:narrator
- else:
药箱和绳都到手了。东口那辆车得先退，能走的人暂时跟我绕内侧。 # beat:c6_v6_sluice_7 # scene:v6_levee # cast:v6_he,v6_tian,v6_cheng # speaker:v6_tian # mood:v6_tian=neutral
你们早一步把物件摆好，我不用再空手跑回去。车口那头，多留两个人卸。 # beat:c6_v6_sluice_8 # scene:v6_levee # cast:v6_he,v6_tian,v6_cheng # speaker:v6_he # mood:v6_he=intent
手边有药，却少了能直接过车的那条道。田雁把接人的队拆开，逐段往里带。 # beat:c6_v6_sluice_9 # scene:v6_levee # cast:v6_he,v6_tian,v6_cheng # speaker:narrator
}
{
- v6_stock_checked:
借来的好梯还在高架。你跟我查过的，拿那张，不拿漆下断的。 # beat:c6_v6_sluice_10 # scene:v6_levee # cast:v6_he,v6_tian,v6_cheng # speaker:v6_he # mood:v6_he=calm
横梯搭上，两位老人能从内墙边慢慢挪。你把手伸到最外一格，听他们自己报脚下踩稳没有。 # beat:c6_v6_sluice_11 # scene:v6_levee # cast:v6_he,v6_tian,v6_cheng # speaker:narrator
- else:
这张没查过，谁也别踩。我拆开看，内芯也烂了。 # beat:c6_v6_sluice_12 # scene:v6_levee # cast:v6_he,v6_tian,v6_cheng # speaker:v6_he # mood:v6_he=sharp
那只能绕内巷。我背一个，另一个得再找人。 # beat:c6_v6_sluice_13 # scene:v6_levee # cast:v6_he,v6_tian,v6_cheng # speaker:v6_cheng # mood:v6_cheng=uneasy
你们绕了两条巷才到干地。老人都还在，程阿笠少赶上一趟送人回渡的船。 # beat:c6_v6_sluice_14 # scene:v6_levee # cast:v6_he,v6_tian,v6_cheng # speaker:narrator
}
{
- v6_exit_drill:
末队出门——前头复报！ # beat:c6_v6_sluice_15 # scene:v6_levee # cast:v6_he,v6_tian,v6_cheng # speaker:v6_tian # mood:v6_tian=intent
末队出门！外口接人！ # beat:c6_v6_sluice_16 # scene:v6_levee # cast:v6_he,v6_tian,v6_cheng # speaker:v6_cheng # mood:v6_cheng=neutral
出发前练过的两声接在一起。你听清最后一队已经离开高窗，才把侧栏放下，不必再站进水里等。 # beat:c6_v6_sluice_17 # scene:v6_levee # cast:v6_he,v6_tian,v6_cheng # speaker:narrator
- else:
末队出门！ # beat:c6_v6_sluice_18 # scene:v6_levee # cast:v6_he,v6_tian,v6_cheng # speaker:v6_tian # mood:v6_tian=intent
侧墙挡住后半句，你没听清是出门还是没出门。你朝回跑到拐角复问，才确认那两位老人已过高窗。 # beat:c6_v6_sluice_19 # scene:v6_levee # cast:v6_he,v6_tian,v6_cheng # speaker:narrator
刚才喊你，你又回去了。下次我先复一遍。 # beat:c6_v6_sluice_20 # scene:v6_levee # cast:v6_he,v6_tian,v6_cheng # speaker:v6_cheng # mood:v6_cheng=uneasy
回头多走的这一段，让你的鞋里灌满冷泥。名单终于接上，腿却不会因此少走这段路。 # beat:c6_v6_sluice_21 # scene:v6_levee # cast:v6_he,v6_tian,v6_cheng # speaker:narrator
}
-> levee_call

=== v6_canon_reckon ===
干布摊开以后，苏晚澄才从箱里取出客舍带来的旧录。雨中没抢这只箱，她先把人送进屋。 # beat:c6_v6_canon_reckon_1 # scene:v6_storm # cast:v6_su,v6_lu,v6_ling # speaker:narrator
这一回，页角怎样？ # beat:c6_v6_canon_reckon_2 # scene:v6_storm # cast:v6_su,v6_lu,v6_ling # speaker:v6_lu # mood:v6_lu=uneasy
{
- v6_roles_clear:
高秉接着你留的两份名单往下核，没把往返的人重算。你离开出口以后，那里还有人能接手。 # beat:c6_v6_canon_reckon_3 # scene:v6_storm # cast:v6_su,v6_lu,v6_ling # speaker:v6_su # mood:v6_su=neutral
你把最后一张回条放到册旁。自己去过堤上，不等于那张册也只能跟你一起走。 # beat:c6_v6_canon_reckon_4 # scene:v6_storm # cast:v6_su,v6_lu,v6_ling # speaker:narrator
- else:
你送来的那箱干布用上了。前头换完，后头也不用等我一块块去找。 # beat:c6_v6_canon_reckon_5 # scene:v6_storm # cast:v6_su,v6_lu,v6_ling # speaker:v6_ling # mood:v6_ling=intent
出口临时改由我和高秉核，往返的人重记了一次。数要重新对，不能拿药已送到替它勾齐。 # beat:c6_v6_canon_reckon_6 # scene:v6_storm # cast:v6_su,v6_lu,v6_ling # speaker:v6_su # mood:v6_su=neutral
你先跑成了药棚那一趟；报齐的最后一句，还得等他们多核一遍。 # beat:c6_v6_canon_reckon_7 # scene:v6_storm # cast:v6_su,v6_lu,v6_ling # speaker:narrator
}
{
- v6_book_dry:
客舍那夜分开晾透了，夹在中间的也没粘。只湿了封皮。 # beat:c6_v6_canon_reckon_8 # scene:v6_storm # cast:v6_su,v6_lu,v6_ling # speaker:v6_su # mood:v6_su=calm
那半页给我留着。你走过的湿石，明日还能照它重走。 # beat:c6_v6_canon_reckon_9 # scene:v6_storm # cast:v6_su,v6_lu,v6_ling # speaker:v6_lu # mood:v6_lu=neutral
她把原式与你补的路形分作两栏。旧字还在，不必凭记忆替失掉的字作主。 # beat:c6_v6_canon_reckon_10 # scene:v6_storm # cast:v6_su,v6_lu,v6_ling # speaker:narrator
- else:
粘住的那几页还没分开。现在又潮了，今晚不揭。 # beat:c6_v6_canon_reckon_11 # scene:v6_storm # cast:v6_su,v6_lu,v6_ling # speaker:v6_su # mood:v6_su=uneasy
先回馆找另一份。没有副本的那一包，我陪你重抄能认的。 # beat:c6_v6_canon_reckon_12 # scene:v6_storm # cast:v6_su,v6_lu,v6_ling # speaker:v6_lu # mood:v6_lu=neutral
她在缺处夹了空纸。你赴过的那次对练没有消失，纸上的缺字也没有。 # beat:c6_v6_canon_reckon_13 # scene:v6_storm # cast:v6_su,v6_lu,v6_ling # speaker:narrator
}
{
- v6_handover:
两班木牌照出发前走的换过。程阿笠接上后船，我才腾得出这一趟。 # beat:c6_v6_canon_reckon_14 # scene:v6_storm # cast:v6_zhaoli,v6_su,v6_lu # speaker:v6_zhaoli # mood:v6_zhaoli=intent
你认得递来的那块牌，没把前船空下误作没人守。 # beat:c6_v6_canon_reckon_15 # scene:v6_storm # cast:v6_zhaoli,v6_su,v6_lu # speaker:narrator
- else:
后船没接上人，我折回换班，又耽搁一趟。程阿笠现在守着，你去就先向她报。 # beat:c6_v6_canon_reckon_16 # scene:v6_storm # cast:v6_zhaoli,v6_su,v6_lu # speaker:v6_zhaoli # mood:v6_zhaoli=uneasy
她手里的牌还是早上那块。你保住的那轮晨练，换不来这趟未能及时送出的船。 # beat:c6_v6_canon_reckon_17 # scene:v6_storm # cast:v6_zhaoli,v6_su,v6_lu # speaker:narrator
}
{
- v6_witness_signed:
高秉把你签过的私试照原样留了。许竞川的同门已看过，没有替那句祖辈传闻找一个模糊出处。 # beat:c6_v6_canon_reckon_18 # scene:v6_storm # cast:v6_zhaoli,v6_su,v6_lu # speaker:v6_su # mood:v6_su=neutral
许竞川从门外应了一声，说等腕子好，再把今日那场写全。 # beat:c6_v6_canon_reckon_19 # scene:v6_storm # cast:v6_zhaoli,v6_su,v6_lu # speaker:narrator
- else:
高秉还等你核私试。你们俩明日都得早到一刻，今天的热身保住了，旧账没因此自己结清。 # beat:c6_v6_canon_reckon_20 # scene:v6_storm # cast:v6_zhaoli,v6_su,v6_lu # speaker:v6_su # mood:v6_su=neutral
你把明早的时辰记在干纸上，没说一切已查明。 # beat:c6_v6_canon_reckon_21 # scene:v6_storm # cast:v6_zhaoli,v6_su,v6_lu # speaker:narrator
}
-> storm_return
