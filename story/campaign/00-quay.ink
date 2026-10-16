
=== cargo ===
你刚踏上青蒲渡，一袋米便从高处砸下来。乔砚生的剑出了半寸，袋口先泼了他一头白。 # beat:c_cargo_1 # scene:quay # cast:zhaoli,qiao,bao # speaker:narrator
……哪位高手，暗器里还掺糠？ # beat:c_cargo_2 # scene:quay # cast:zhaoli,qiao,bao # speaker:qiao # mood:qiao=surprised
上头那位搬米的高手！别拔剑，右边绳要断了！ # beat:c_cargo_3 # scene:quay # cast:zhaoli,qiao,bao # speaker:zhaoli # mood:zhaoli=sharp
我没偷懒！下面有人把车推歪了—— # beat:c_cargo_4 # scene:quay # cast:zhaoli,qiao,bao # speaker:bao # mood:bao=uneasy
吊杆嘎地一响。米袋下是你的盘缠，车轮旁蹲着个捡散米的孩子。 # beat:c_cargo_5 # scene:quay # cast:zhaoli,qiao,bao # speaker:narrator
我拉主绳。你只能赶上一边，先说抓哪边！ # beat:c_cargo_6 # scene:quay # cast:zhaoli,qiao,bao # speaker:zhaoli # mood:zhaoli=intent # action:吊杆倾斜 · 米袋下有人
* [抓住副绳，把整袋米拖离车轮。 # cid:save_rope]
  ~ rope = true
  砚生，别顾头发！把孩子抱走，我拉绳！ # beat:c_cargo_7 # scene:quay # cast:zhaoli,qiao,bao # speaker:you
  别往身上缠！绕木桩，两圈——对，就是这样！ # beat:c_cargo_8 # scene:quay # cast:zhaoli,qiao,bao # speaker:zhaoli # mood:zhaoli=intent
  麻绳烧过掌心，米袋落进浅水。你的钱袋还在，掌心却多了道红印。 # beat:c_cargo_9 # scene:quay # cast:zhaoli,qiao,bao # speaker:narrator
  -> quay_people
* [先把孩子抱出来，盘缠以后再说。 # cid:save_child]
  ~ mercy = true
  ~ purse = false
  过来，先松开那把米。袋子压下来可不认人。 # beat:c_cargo_10 # scene:quay # cast:zhaoli,qiao,bao # speaker:you
  你抱着孩子滚开，车轮碾过钱袋，几枚铜钱叮叮落进水里。 # beat:c_cargo_11 # scene:quay # cast:zhaoli,qiao,bao # speaker:narrator
  人出来就好！包小满，别找钱，先把吊杆顶住！ # beat:c_cargo_12 # scene:quay # cast:zhaoli,qiao,bao # speaker:zhaoli # mood:zhaoli=intent
  -> quay_people

=== quay_people ===
一袋三十斤，不是暗器。我赔你洗头的钱，成不成？ # beat:c_quay_people_1 # scene:quay # cast:zhaoli,qiao,bao # speaker:bao # mood:bao=neutral
这是头发，不是淘米箩。你先赔我一口气。 # beat:c_quay_people_2 # scene:quay # cast:zhaoli,qiao,bao # speaker:qiao # mood:qiao=sharp
那可贵了。他刚才喊了半条河。 # beat:c_quay_people_3 # scene:quay # cast:zhaoli,qiao,bao # speaker:zhaoli # mood:zhaoli=amused
你们这里待客，都先给客人开光？ # beat:c_quay_people_4 # scene:quay # cast:zhaoli,qiao,bao # speaker:you
江照鲤，领船的。刚才那车歪了我也有份，待会儿请你们吃饼。 # beat:c_quay_people_5 # scene:quay # cast:zhaoli,qiao,bao # speaker:zhaoli # mood:zhaoli=neutral
乔砚生。今日先记账，我还得替石梁馆去报名。 # beat:c_quay_people_6 # scene:quay # cast:zhaoli,qiao,bao # speaker:qiao # mood:qiao=neutral
那正好……你们馆还收不收像我这么笨的？ # beat:c_quay_people_7 # scene:quay # cast:zhaoli,qiao,bao # speaker:bao # mood:bao=uneasy
* [先教你站稳，米袋就算学费。 # cid:bao_yes]
  ~ bao_help = true
  收不收得师父说。今晚你来，我先教你怎么不跟着车倒。 # beat:c_quay_people_8 # scene:quay # cast:zhaoli,qiao,bao # speaker:you
  那我先把米晾好！练坏的米不能交学费吧？ # beat:c_quay_people_9 # scene:quay # cast:zhaoli,qiao,bao # speaker:bao # mood:bao=amused
  -> price
* [我也只是学徒。一起去问，别把我当师父。 # cid:bao_plain]
  ~ bao_help = false
  我上月还把自己绊进水沟。你要不嫌丢人，跟我一起问。 # beat:c_quay_people_10 # scene:quay # cast:zhaoli,qiao,bao # speaker:you
  原来你们也会摔！那我敢去了。 # beat:c_quay_people_11 # scene:quay # cast:zhaoli,qiao,bao # speaker:bao # mood:bao=amused
  -> price

=== price ===
两个饼，一碗米汤。乔家小子，你头上那点米，回头记你账上。 # beat:c_price_1 # scene:quay # cast:aunt,zhaoli,qiao # speaker:aunt # mood:aunt=neutral
汤二娘！我这是替你拦住了一袋，不能算护镖？ # beat:c_price_2 # scene:quay # cast:aunt,zhaoli,qiao # speaker:qiao # mood:qiao=surprised
护镖有镖钱。往米里掉头发，有筛米钱。 # beat:c_price_3 # scene:quay # cast:aunt,zhaoli,qiao # speaker:aunt # mood:aunt=neutral
她认钱，不认剑。你赢不了。 # beat:c_price_4 # scene:quay # cast:aunt,zhaoli,qiao # speaker:zhaoli # mood:zhaoli=amused
饼摊后贴着水陆小会的木牌：年轻人试艺，优胜者可领一年护渡差事。 # beat:c_price_5 # scene:quay # cast:aunt,zhaoli,qiao # speaker:narrator
一年。馆里的屋顶就有着落了，不用再拿脸盆接雨。 # beat:c_price_6 # scene:quay # cast:aunt,zhaoli,qiao # speaker:qiao # mood:qiao=intent
差事有船工、守堤、教小孩。不是只看谁把谁打趴下。 # beat:c_price_7 # scene:quay # cast:aunt,zhaoli,qiao # speaker:aunt # mood:aunt=neutral
{
- purse:
你那钱袋还完整，别又学你师父替全桌付账。 # beat:c_price_8 # scene:quay # cast:aunt,zhaoli,qiao # speaker:aunt # mood:aunt=neutral
- else:
我看见铜钱落水了。饼先拿着，你的账写在后头。 # beat:c_price_9 # scene:quay # cast:aunt,zhaoli,qiao # speaker:aunt # mood:aunt=neutral
}
* [把这一顿记在自己名下，改日来还。 # cid:pay_breakfast]
  ~ debt = true
  人是她请，账记我。今天帮忙的人也得吃热的。 # beat:c_price_10 # scene:quay # cast:aunt,zhaoli,qiao # speaker:you
  记住了。赊账可以，别起个假名叫天下第一。 # beat:c_price_11 # scene:quay # cast:aunt,zhaoli,qiao # speaker:aunt # mood:aunt=amused
  -> rules
* [让照鲤请饼，我来洗碗。 # cid:split_breakfast]
  ~ debt = false
  钱让她出，碗我洗。别让她以后说我们白吃。 # beat:c_price_12 # scene:quay # cast:aunt,zhaoli,qiao # speaker:you
  才见一面，就想把人情洗干净？行，抹布在那儿。 # beat:c_price_13 # scene:quay # cast:aunt,zhaoli,qiao # speaker:zhaoli # mood:zhaoli=amused
  -> rules

=== rules ===
报名过午就关。师承、姓名、住处，照实写。 # beat:c_rules_1 # scene:quay # cast:su,gao,qiao # speaker:gao # mood:gao=neutral
石梁馆，乔砚生。这位是—— # beat:c_rules_2 # scene:quay # cast:su,gao,qiao # speaker:qiao # mood:qiao=neutral
我自己说。我也是石梁馆学徒，不顶任何人的名额。 # beat:c_rules_3 # scene:quay # cast:su,gao,qiao # speaker:you
很好。苏晚澄，替主事记录。你们报的是青蒲地方小会，不是榜谱大会。 # beat:c_rules_4 # scene:quay # cast:su,gao,qiao # speaker:su # mood:su=neutral
赢了也不会进榜？ # beat:c_rules_5 # scene:quay # cast:su,gao,qiao # speaker:qiao # mood:qiao=uneasy
不会。会得到差事、工钱，还有今后教人时说得清的一场经历。 # beat:c_rules_6 # scene:quay # cast:su,gao,qiao # speaker:su # mood:su=neutral
去年头名回来撑渡船了。比他没拿头名的师弟，早还清两年债。 # beat:c_rules_7 # scene:quay # cast:su,gao,qiao # speaker:gao # mood:gao=neutral # fact:bell
* [若有人出钱办会，你们敢判他输吗？ # cid:ask_fair]
  ~ fair = true
  我想知道，写在你册上的输赢，是谁说了算。 # beat:c_rules_8 # scene:quay # cast:su,gao,qiao # speaker:you
  有钱的人也按同一条线判。你若看见不同，现在就问我。 # beat:c_rules_9 # scene:quay # cast:su,gao,qiao # speaker:su # mood:su=sharp
  -> ticket
* [先让我看看护渡差事到底要做什么。 # cid:ask_task]
  ~ fair = false
  剑可以慢慢试。接了一年，不能干三天就说不适合。 # beat:c_rules_10 # scene:quay # cast:su,gao,qiao # speaker:you
  这句话比报名册上的豪言有用。明日会有守船试，你别缺席。 # beat:c_rules_11 # scene:quay # cast:su,gao,qiao # speaker:su # mood:su=calm
  -> ticket

=== ticket ===
我明早送药去白苇汊。后日会场见，你们别只顾找对手。 # beat:c_ticket_1 # scene:quay # cast:zhaoli,qiao,su # speaker:zhaoli # mood:zhaoli=neutral
我还不至于见个人就拔剑。 # beat:c_ticket_2 # scene:quay # cast:zhaoli,qiao,su # speaker:qiao # mood:qiao=neutral
是，见米袋才拔。包小满已经学会了。 # beat:c_ticket_3 # scene:quay # cast:zhaoli,qiao,su # speaker:zhaoli # mood:zhaoli=amused
石梁馆的韩教习托我带句话：日落前回馆，没饭也要回来。 # beat:c_ticket_4 # scene:quay # cast:zhaoli,qiao,su # speaker:su # mood:su=neutral
乔砚生的笑收了一点。他把剑往身后藏，露出补过的护腕。 # beat:c_ticket_5 # scene:quay # cast:zhaoli,qiao,su # speaker:narrator
师父要是问起盘缠……你先别说我们吃饼。 # beat:c_ticket_6 # scene:quay # cast:zhaoli,qiao,su # speaker:qiao # mood:qiao=uneasy
吃两个饼还能把屋顶吃没？ # beat:c_ticket_7 # scene:quay # cast:zhaoli,qiao,su # speaker:you
他今天没吃早饭。 # beat:c_ticket_8 # scene:quay # cast:zhaoli,qiao,su # speaker:qiao # mood:qiao=neutral
* [把剩下的半张饼包起来带回去。 # cid:bring_bread]
  ~ bread = true
  那就别藏。二娘，借张干净荷叶。 # beat:c_ticket_9 # scene:quay # cast:zhaoli,qiao,su # speaker:you
  他会说不饿。你到时候别让他把饼又塞回我们手里。 # beat:c_ticket_10 # scene:quay # cast:zhaoli,qiao,su # speaker:qiao # mood:qiao=calm
  -> hall_gate
* [盘缠的事当面说清，不替你瞒。 # cid:speak_purse]
  ~ bread = false
  没钱是没钱，我们别一人瞒一点，瞒到谁也不知道。 # beat:c_ticket_11 # scene:quay # cast:zhaoli,qiao,su # speaker:you
  我没说不告诉他。就是……你先开口，行不行？ # beat:c_ticket_12 # scene:quay # cast:zhaoli,qiao,su # speaker:qiao # mood:qiao=uneasy
  -> hall_gate
