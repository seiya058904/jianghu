
=== inn_table ===
临水客舍只剩一张空桌。苏晚澄刚放下册子，陆汀舟已把饼摊开，占了半边。 # beat:c_inn_table_1 # scene:inn # cast:lu,su,qiao # speaker:narrator
陆汀舟，我留的不是饭桌，是记录席。 # beat:c_inn_table_2 # scene:inn # cast:lu,su,qiao # speaker:su # mood:su=sharp
记录我先饿了，不违事实。 # beat:c_inn_table_3 # scene:inn # cast:lu,su,qiao # speaker:lu # mood:lu=amused
你们两位是一路来的？ # beat:c_inn_table_4 # scene:inn # cast:lu,su,qiao # speaker:qiao # mood:qiao=neutral
不是。 # beat:c_inn_table_5 # scene:inn # cast:lu,su,qiao # speaker:su # mood:su=neutral
一条路，两个方向。她在找我师伯的外务回函，我在替师伯送回函。 # beat:c_inn_table_6 # scene:inn # cast:lu,su,qiao # speaker:lu # mood:lu=neutral
所以她为什么还没拿到？ # beat:c_inn_table_7 # scene:inn # cast:lu,su,qiao # speaker:you
因为我把它放在饼下面压平了。 # beat:c_inn_table_8 # scene:inn # cast:lu,su,qiao # speaker:lu # mood:lu=neutral
* [先替苏晚澄挪开油纸。 # cid:sit_su]
  ~ su_trust = true
  要说笑，先别拿别人的事垫着。 # beat:c_inn_table_9 # scene:inn # cast:lu,su,qiao # speaker:you
  这句对。苏姑娘，是我欠妥，纸没沾油，我另换一张垫。 # beat:c_inn_table_10 # scene:inn # cast:lu,su,qiao # speaker:lu # mood:lu=uneasy
  多谢。饭可以一起吃，回函不能吃进去。 # beat:c_inn_table_11 # scene:inn # cast:lu,su,qiao # speaker:su # mood:su=calm
  -> inn_sword
* [借一角坐下，把自己的干布垫上。 # cid:sit_lu]
  ~ su_trust = false
  我也饿。回函垫干布，咱们各让一只碗的位置。 # beat:c_inn_table_12 # scene:inn # cast:lu,su,qiao # speaker:you
  行。别把桌子说成剑道之争，就只是桌子不够大。 # beat:c_inn_table_13 # scene:inn # cast:lu,su,qiao # speaker:su # mood:su=neutral
  我本来准备说的。你怎么连这个都知道？ # beat:c_inn_table_14 # scene:inn # cast:lu,su,qiao # speaker:lu # mood:lu=amused
  -> inn_sword

=== inn_sword ===
还有一碗面？我替白苇村送药，明早要早行。 # beat:c_inn_sword_1 # scene:inn # cast:lu,su,jue # speaker:jue # mood:jue=neutral
师父坐这儿。我去端。面大碗还是小碗？ # beat:c_inn_sword_2 # scene:inn # cast:lu,su,jue # speaker:lu # mood:lu=neutral
大碗。行脚不能吃虚的。 # beat:c_inn_sword_3 # scene:inn # cast:lu,su,jue # speaker:jue # mood:jue=calm
明日有水陆两队。陆队护药车过枫岭，水队带药米去白苇汊，后日会场汇合。 # beat:c_inn_sword_4 # scene:inn # cast:lu,su,jue # speaker:su # mood:su=neutral
她带陆队走外务，我看山路。水路听江照鲤的，别听我的。 # beat:c_inn_sword_5 # scene:inn # cast:lu,su,jue # speaker:lu # mood:lu=neutral
小会为什么还管这些？ # beat:c_inn_sword_6 # scene:inn # cast:lu,su,jue # speaker:you
差事叫护渡，不能光在干地上打一场。两队都记见习，误了试艺不抹掉已做的事。 # beat:c_inn_sword_7 # scene:inn # cast:lu,su,jue # speaker:su # mood:su=neutral
* [请书吏把停试与急难的规矩当众读清。 # cid:read_rules]
  ~ rule_known = true
  三个短音停试。去帮忙的人回来，不许被说成怯战。 # beat:c_inn_sword_8 # scene:inn # cast:lu,su,jue # speaker:you
  我给每队抄一份。写清楚，是省得事后各说各的。 # beat:c_inn_sword_9 # scene:inn # cast:gao,lu,su # speaker:gao # mood:gao=neutral
  -> charred_cake
* [先问路上的人手和缺口。 # cid:ask_routes]
  ~ rule_known = false
  哪队少会抬担架的人？哪队少能在岸上守绳的人？ # beat:c_inn_sword_10 # scene:inn # cast:gao,lu,su # speaker:you
  这才是我正要问的。两队各缺一个愿意在别人忙的时候留住手的人。 # beat:c_inn_sword_11 # scene:inn # cast:gao,lu,su # speaker:su # mood:su=intent
  -> charred_cake

=== inn_rival ===
刚才问敢不敢判出钱人输的，是你？ # beat:c_inn_rival_1 # scene:inn # cast:rong,xu,qiao # speaker:rong # mood:rong=neutral
容既白穿着干净长衫，背后伙计扛着两袋米。他手里却是一根磨白的棍。 # beat:c_inn_rival_2 # scene:inn # cast:rong,xu,qiao # speaker:narrator
他问得没错。你的名字排在头一场，谁知道是不是挑了软的。 # beat:c_inn_rival_3 # scene:inn # cast:rong,xu,qiao # speaker:xu # mood:xu=neutral
头场最早，打完我还得开仓。你若想换，现在就换。 # beat:c_inn_rival_4 # scene:inn # cast:rong,xu,qiao # speaker:rong # mood:rong=sharp
那你为什么捐米？ # beat:c_inn_rival_5 # scene:inn # cast:rong,xu,qiao # speaker:qiao # mood:qiao=neutral
仓门也是木头。水来了，我的米不会因为姓容就不湿。 # beat:c_inn_rival_6 # scene:inn # cast:rong,xu,qiao # speaker:rong # mood:rong=neutral
你想我们怎么跟你打？ # beat:c_inn_rival_7 # scene:inn # cast:rong,xu,qiao # speaker:you
想赢就真赢。别打到一半突然替我留脸。 # beat:c_inn_rival_8 # scene:inn # cast:rong,xu,qiao # speaker:rong # mood:rong=intent # fact:grain
* [约定真打，也要求他受伤就停。 # cid:rong_true]
  ~ rong_fair = true
  我不让，你也别把输了说成我们不识抬举。 # beat:c_inn_rival_9 # scene:inn # cast:rong,xu,qiao # speaker:you
  成交。邓苹，听见了？我输了不许先说棍子滑。 # beat:c_inn_rival_10 # scene:inn # cast:rong,xu,qiao # speaker:rong # mood:rong=amused
  -> inn_rain
* [暂不交好，只认同一条判线。 # cid:rong_distance]
  ~ rong_fair = false
  你有钱修坪，我没有。好坏都让场上的线说。 # beat:c_inn_rival_11 # scene:inn # cast:rong,xu,qiao # speaker:you
  可以。至少你肯把我算成对手，没有只算成一袋银子。 # beat:c_inn_rival_12 # scene:inn # cast:rong,xu,qiao # speaker:rong # mood:rong=calm
  -> inn_rain

=== inn_rain ===
夜雨敲着窗。杜汀叟一只耳朵贴在木柱上，何铆把酒碗从他肘下救开。 # beat:c_inn_rain_1 # scene:inn # cast:zhaoli,du,he # speaker:narrator
听河也别压我的桌子。桌腿刚补好。 # beat:c_inn_rain_2 # scene:inn # cast:zhaoli,du,he # speaker:he # mood:he=neutral
桥脚回水先退后涨，今年比前几年早。 # beat:c_inn_rain_3 # scene:inn # cast:zhaoli,du,he # speaker:du # mood:du=neutral
会场的人还在加棚。东堤要是真涨，他们来得及撤？ # beat:c_inn_rain_4 # scene:inn # cast:zhaoli,du,he # speaker:zhaoli # mood:zhaoli=uneasy
提前告诉他们。别到水上来了，才问要不要信老头。 # beat:c_inn_rain_5 # scene:inn # cast:zhaoli,du,he # speaker:du # mood:du=neutral
你也报了水队？ # beat:c_inn_rain_6 # scene:inn # cast:zhaoli,du,he # speaker:you
我领船，就得把人带回来。可这次我想让他们也记一次我的名字，不只写某船。 # beat:c_inn_rain_7 # scene:inn # cast:zhaoli,du,he # speaker:zhaoli # mood:zhaoli=neutral # fact:bank
* [把回水的征兆先报给主事。 # cid:warn_water]
  ~ warning = true
  谁嫌多事就让他嫌。写在会前，事后才没人装没听过。 # beat:c_inn_rain_8 # scene:inn # cast:zhaoli,du,he # speaker:you
  我陪你去。老杜说的话，也得有人把它送到听得见的地方。 # beat:c_inn_rain_9 # scene:inn # cast:zhaoli,du,he # speaker:zhaoli # mood:zhaoli=calm
  -> inn_depart
* [先帮何铆把撤棚用的绳和木楔备好。 # cid:prepare_water]
  ~ warning = false
  ~ labor = true
  他们听不听，绳子都先备着。你量，我裁。 # beat:c_inn_rain_10 # scene:inn # cast:zhaoli,du,he # speaker:you
  那就动手。别把每条绳都剪短，留两根能跨沟的。 # beat:c_inn_rain_11 # scene:inn # cast:zhaoli,du,he # speaker:he # mood:he=neutral
  -> inn_depart

=== inn_depart ===
枫岭一路要赶两处村子。药箱到了，不意味着护送完，人也得进屋。 # beat:c_inn_depart_1 # scene:inn # cast:zhaoli,pei,qiao # speaker:pei # mood:pei=neutral
白苇汊河道窄，药米都走船。谁晕船现在说，别拿脸色证明勇敢。 # beat:c_inn_depart_2 # scene:inn # cast:zhaoli,pei,qiao # speaker:zhaoli # mood:zhaoli=neutral
我想走陆路。不能握剑，也还有肩膀能抬东西。 # beat:c_inn_depart_3 # scene:inn # cast:zhaoli,pei,qiao # speaker:qiao # mood:qiao=neutral
我也缺肩膀。就是这肩膀得会跟船一起歪。 # beat:c_inn_depart_4 # scene:inn # cast:zhaoli,pei,qiao # speaker:zhaoli # mood:zhaoli=amused
两队各留着一个空位。你们的名字都在后日试艺的册上，去路却只能选一条。 # beat:c_inn_depart_5 # scene:inn # cast:zhaoli,pei,qiao # speaker:narrator
分开的人，也会到会场？ # beat:c_inn_depart_6 # scene:inn # cast:zhaoli,pei,qiao # speaker:you
会。只是路上有些事，错过就不是你亲眼见过。 # beat:c_inn_depart_7 # scene:inn # cast:zhaoli,pei,qiao # speaker:pei # mood:pei=neutral
* [走枫岭陆路，随镖队护药车。 # cid:route_land]
  ~ route = 1
  我走山路。照鲤，会场见，不许拿我们怕水编笑话。 # beat:c_inn_depart_8 # scene:inn # cast:zhaoli,pei,qiao # speaker:you
  那得看你们回来时，有没有比晕船更好笑的事。 # beat:c_inn_depart_9 # scene:inn # cast:zhaoli,pei,qiao # speaker:zhaoli # mood:zhaoli=amused
  -> farewell
* [走白苇水路，跟照鲤和老杜上船。 # cid:route_water]
  ~ route = 2
  我上船。砚生，你的肩膀留着，到会场帮我扛赢来的东西。 # beat:c_inn_depart_10 # scene:inn # cast:zhaoli,pei,qiao # speaker:you
  要是赢一身伤，我也扛。但你最好轻一点。 # beat:c_inn_depart_11 # scene:inn # cast:zhaoli,pei,qiao # speaker:qiao # mood:qiao=amused
  -> farewell

=== departure ===
天没亮，陆队推车出镇，水队解缆离岸。两盏灯在雾里越隔越远。 # beat:c_departure_1 # scene:quay # cast:su,zhaoli,qiao # speaker:narrator
各自记得报平安。没有亲眼见过的事，回来慢慢问。 # beat:c_departure_2 # scene:quay # cast:su,zhaoli,qiao # speaker:su # mood:su=neutral
好。今天先把手里这段路走完。 # beat:c_departure_3 # scene:quay # cast:su,zhaoli,qiao # speaker:you
{ route == 1:
-> ridge_load
- else:
-> water_load
}
