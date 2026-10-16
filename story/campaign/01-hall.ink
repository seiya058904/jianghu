
=== hall_gate ===
馆门外的雨盆排成一行，韩鹭石蹲在屋檐下削木楔，许竞川提着一把伞站在门边。 # beat:c_hall_gate_1 # scene:hall # cast:han,qiao,xu # speaker:narrator
来晚了。你师父连你小时候摔断门牙都讲完了。 # beat:c_hall_gate_2 # scene:hall # cast:han,qiao,xu # speaker:xu # mood:xu=amused
那是被你推的。 # beat:c_hall_gate_3 # scene:hall # cast:han,qiao,xu # speaker:qiao # mood:qiao=sharp
我是推门，谁让你用牙顶？ # beat:c_hall_gate_4 # scene:hall # cast:han,qiao,xu # speaker:xu # mood:xu=neutral
有得笑就先笑。笑完把门顶住，木楔还没削好。 # beat:c_hall_gate_5 # scene:hall # cast:han,qiao,xu # speaker:han # mood:han=neutral
师父，屋顶的事，我们在渡口看到了那个差事。 # beat:c_hall_gate_6 # scene:hall # cast:han,qiao,xu # speaker:you
先关门。屋顶还没塌，别把心先漏出去。 # beat:c_hall_gate_7 # scene:hall # cast:han,qiao,xu # speaker:han # mood:han=neutral
{
- bread:
你把半张饼放在木楔旁。韩鹭石伸手要推，乔砚生先按住了他的手。 # beat:c_hall_gate_8 # scene:hall # cast:han,qiao,xu # speaker:narrator
凉了就硬了。先吃，我们不看。 # beat:c_hall_gate_9 # scene:hall # cast:han,qiao,xu # speaker:qiao # mood:qiao=neutral
不看你还把眼瞪这么大？ # beat:c_hall_gate_10 # scene:hall # cast:han,qiao,xu # speaker:han # mood:han=amused
- else:
你们早饭吃了？别学我拿茶灌饱，练剑会抖。 # beat:c_hall_gate_11 # scene:hall # cast:han,qiao,xu # speaker:han # mood:han=neutral
吃了。钱的事现在说。 # beat:c_hall_gate_12 # scene:hall # cast:han,qiao,xu # speaker:you
好。说清楚比替我撑脸面强。 # beat:c_hall_gate_13 # scene:hall # cast:han,qiao,xu # speaker:han # mood:han=neutral
}
* [先帮木匠修漏处，报名不差这半日。 # cid:repair_now]
  ~ repair = true
  试艺要用手，手也能递瓦。先修最漏的那一块。 # beat:c_hall_gate_14 # scene:hall # cast:han,qiao,xu # speaker:you
  何铆在后院等梯子。别逞能上梁，你们的脚还不值一块新瓦。 # beat:c_hall_gate_15 # scene:hall # cast:han,qiao,xu # speaker:han # mood:han=calm
  -> hall_debt
* [先把明日的试艺练好，承认馆里缺钱。 # cid:practice_now]
  ~ repair = false
  我们想拿差事，但不保证拿得到。今天先把本事练足。 # beat:c_hall_gate_16 # scene:hall # cast:han,qiao,xu # speaker:you
  这话听着顺耳。缺钱不丢人，瞒着没本事去拿钱才要命。 # beat:c_hall_gate_17 # scene:hall # cast:han,qiao,xu # speaker:han # mood:han=neutral
  -> hall_debt

=== hall_debt ===
修最漏的地方不贵。贵的是你们上次拿剑把瓦挑裂了。 # beat:c_hall_debt_1 # scene:hall # cast:he,han,qiao # speaker:he # mood:he=neutral
那是为了够风筝。 # beat:c_hall_debt_2 # scene:hall # cast:he,han,qiao # speaker:qiao # mood:qiao=uneasy
风筝两文，瓦一百。你这剑飞得不便宜。 # beat:c_hall_debt_3 # scene:hall # cast:he,han,qiao # speaker:he # mood:he=neutral
何铆把一条旧绳挂上梁，另一头放进你手里。 # beat:c_hall_debt_4 # scene:hall # cast:he,han,qiao # speaker:narrator
拉紧试试。别光看绳粗，先看结。 # beat:c_hall_debt_5 # scene:hall # cast:he,han,qiao # speaker:he # mood:he=neutral
我年轻时也这么绑，松过一次。后来左腕就不敢再拿重物。 # beat:c_hall_debt_6 # scene:hall # cast:he,han,qiao # speaker:han # mood:han=neutral
你从来没说过。 # beat:c_hall_debt_7 # scene:hall # cast:he,han,qiao # speaker:you
你们从来只问我打赢过谁。 # beat:c_hall_debt_8 # scene:hall # cast:he,han,qiao # speaker:han # mood:han=neutral # fact:knots
* [请何铆重教一遍，自己绑一个。 # cid:learn_knots]
  ~ rope = true
  我会拉，不会保住别人。你先看我绑对没有。 # beat:c_hall_debt_9 # scene:hall # cast:he,han,qiao # speaker:you
  主绳双套，救人末端活结。好，拆了再绑。能闭眼绑才算记住。 # beat:c_hall_debt_10 # scene:hall # cast:he,han,qiao # speaker:he # mood:he=neutral
  -> hall_trial
* [把结交给何铆，自己去搬木料。 # cid:carry_timber]
  ~ labor = true
  不装会。你绑，我扛，今天先把漏补住。 # beat:c_hall_debt_11 # scene:hall # cast:he,han,qiao # speaker:you
  这句也值钱。两个人做事，不用两个人都抢那把锤子。 # beat:c_hall_debt_12 # scene:hall # cast:he,han,qiao # speaker:he # mood:he=neutral
  -> hall_trial

=== hall_trial ===
小会抽签前，借你们一块干地。三次碰袖，不拿胜负出门说。 # beat:c_hall_trial_1 # scene:hall # cast:xu,qiao,han # speaker:xu # mood:xu=neutral
怕输给我，被人听见？ # beat:c_hall_trial_2 # scene:hall # cast:xu,qiao,han # speaker:qiao # mood:qiao=sharp
怕你赢一次，说到我孙子都听见。 # beat:c_hall_trial_3 # scene:hall # cast:xu,qiao,han # speaker:xu # mood:xu=neutral
木刀木剑。碰伤了各自的师父骂各自的，不许来我这里躲。 # beat:c_hall_trial_4 # scene:hall # cast:xu,qiao,han # speaker:han # mood:han=neutral
许竞川左脚落地很沉，右脚总留半鞋空处。乔砚生眼里只有他袖口。 # beat:c_hall_trial_5 # scene:hall # cast:xu,qiao,han # speaker:narrator
你也来一回？明日有的人不会先告诉你准备好了。 # beat:c_hall_trial_6 # scene:hall # cast:xu,qiao,han # speaker:xu # mood:xu=intent
他右手快，别跟着刀尖转。 # beat:c_hall_trial_7 # scene:hall # cast:xu,qiao,han # speaker:qiao # mood:qiao=neutral
* [看他腰带和承重脚，先不抢攻。 # cid:read_weight]
  ~ read = true
  你右脚不着实，是等我往你那边挤？ # beat:c_hall_trial_8 # scene:hall # cast:xu,qiao,han # speaker:you
  看出来了，就试着别让我挤到。光看不算接住。 # beat:c_hall_trial_9 # scene:hall # cast:xu,qiao,han # speaker:xu # mood:xu=intent
  -> hall_exchange
* [先抢袖口，试试自己到底差多远。 # cid:force_trial]
  ~ read = false
  明知道你等着，我也得试一次。 # beat:c_hall_trial_10 # scene:hall # cast:xu,qiao,han # speaker:you
  刀背敲上腕骨。你没丢剑，却知道这只手今晚会肿。 # beat:c_hall_trial_11 # scene:hall # cast:xu,qiao,han # speaker:narrator
  胆子我看见了。明天还得用的手，别每次都拿来证明。 # beat:c_hall_trial_12 # scene:hall # cast:xu,qiao,han # speaker:xu # mood:xu=calm
  -> hall_exchange

=== hall_exchange ===
木刀压住剑背，你忽然发现许竞川没往前。他只要再推一寸，你就得松手。 # beat:c_hall_exchange_1 # scene:hall # cast:xu,qiao,han # speaker:narrator
换你。要退，还是还想挤？ # beat:c_hall_exchange_2 # scene:hall # cast:xu,qiao,han # speaker:xu # mood:xu=intent
他在骗你先动，别—— # beat:c_hall_exchange_3 # scene:hall # cast:xu,qiao,han # speaker:qiao # mood:qiao=sharp
闭嘴。替别人出剑的时候，你自己的脚也会停。 # beat:c_hall_exchange_4 # scene:hall # cast:xu,qiao,han # speaker:han # mood:han=neutral
雨盆叮了一声，许竞川的视线往门边偏了半瞬。 # beat:c_hall_exchange_5 # scene:hall # cast:xu,qiao,han # speaker:narrator
这时候说话，也算出招？ # beat:c_hall_exchange_6 # scene:hall # cast:xu,qiao,han # speaker:you
你要能让我信，我认。 # beat:c_hall_exchange_7 # scene:hall # cast:xu,qiao,han # speaker:xu # mood:xu=amused
* {read} [顺着刀背侧开，让他先落步。 # cid:yield_side]
  ~ respect = true
  你要中间，给你。我从旁边走。 # beat:c_hall_exchange_8 # scene:hall # cast:xu,qiao,han # speaker:you
  你退过一条木缝，刀尖擦过衣袖。他也及时收住，没有顺势逼倒你。 # beat:c_hall_exchange_9 # scene:hall # cast:xu,qiao,han # speaker:narrator
  接住了。不过我没输，别抢着替我起绰号。 # beat:c_hall_exchange_10 # scene:hall # cast:xu,qiao,han # speaker:xu # mood:xu=calm
  -> hall_wrist
* [认这一手输，留下明日再用的手。 # cid:call_stop]
  ~ respect = true
  停。我腕子受不住，今天到这里。 # beat:c_hall_exchange_11 # scene:hall # cast:xu,qiao,han # speaker:you
  好。自己能喊停，明天就不用靠别人替你喊。 # beat:c_hall_exchange_12 # scene:hall # cast:xu,qiao,han # speaker:xu # mood:xu=calm
  -> hall_wrist
* [硬挤一下，宁可碰伤也要碰袖。 # cid:press_again]
  ~ wound = 1
  ~ respect = false
  你碰到一寸布，腕骨也被木刀压得发麻。许竞川皱眉松开了刀。 # beat:c_hall_exchange_13 # scene:hall # cast:xu,qiao,han # speaker:narrator
  你要一寸布，我给你。可别把这叫赢。 # beat:c_hall_exchange_14 # scene:hall # cast:xu,qiao,han # speaker:xu # mood:xu=sharp
  冷水在门外。今天这只手不许再练。 # beat:c_hall_exchange_15 # scene:hall # cast:xu,qiao,han # speaker:han # mood:han=neutral
  -> hall_wrist

=== hall_wrist ===
谁把跌打药当饭吃？上回剩的药，还没到该用完的时候。 # beat:c_hall_wrist_1 # scene:hall # cast:qiao,ling,han # speaker:ling # mood:ling=neutral
我拿了一点擦剑鞘。 # beat:c_hall_wrist_2 # scene:hall # cast:qiao,ling,han # speaker:qiao # mood:qiao=uneasy
剑鞘会喊疼？把碗端起来。 # beat:c_hall_wrist_3 # scene:hall # cast:qiao,ling,han # speaker:ling # mood:ling=sharp
乔砚生伸左手，右腕缩进袖里。韩鹭石没有逼他，只把自己的左手放在桌上。 # beat:c_hall_wrist_4 # scene:hall # cast:qiao,ling,han # speaker:narrator
我以前也说不疼。后来连拿碗都要挑轻的。 # beat:c_hall_wrist_5 # scene:hall # cast:qiao,ling,han # speaker:han # mood:han=neutral
我能撑到后日。拿了差事再养，不耽误。 # beat:c_hall_wrist_6 # scene:hall # cast:qiao,ling,han # speaker:qiao # mood:qiao=neutral
伤不会看你报名册。现在讲明白，才能替你留个办法。 # beat:c_hall_wrist_7 # scene:hall # cast:qiao,ling,han # speaker:ling # mood:ling=neutral # fact:wrist
* [替他把训练停下，明日用另一种打法。 # cid:wrist_rest]
  ~ qiao_rest = true
  你当年替我背过一段山路。今天轮到我拿剑，轮到你少用一只手。 # beat:c_hall_wrist_8 # scene:hall # cast:qiao,ling,han # speaker:you
  别把我的比赛也拿走。我能守，能动，别把我晾着。 # beat:c_hall_wrist_9 # scene:hall # cast:qiao,ling,han # speaker:qiao # mood:qiao=uneasy
  不晾。改握法，留一段能使的力气。这才叫养。 # beat:c_hall_wrist_10 # scene:hall # cast:qiao,ling,han # speaker:ling # mood:ling=calm
  -> last_lesson
* [把选择留给他，约定一疼就当众叫停。 # cid:wrist_private]
  ~ qiao_rest = false
  我不替你报退。可你一旦松手，我们就停，脸面我陪你丢。 # beat:c_hall_wrist_11 # scene:hall # cast:qiao,ling,han # speaker:you
  说好了。别到时候也跟我一样嘴硬。 # beat:c_hall_wrist_12 # scene:hall # cast:qiao,ling,han # speaker:qiao # mood:qiao=calm
  我听见了。谁反悔，谁替我捣三天药。 # beat:c_hall_wrist_13 # scene:hall # cast:qiao,ling,han # speaker:ling # mood:ling=neutral
  -> last_lesson

=== hall_leave ===
差事只有一份，去的人不只你们。有人替你说好话，也有人真会比你强。 # beat:c_hall_leave_1 # scene:hall # cast:han,xu,qiao # speaker:han # mood:han=neutral
我就不说好话了。会场见，我要赢你们一场。 # beat:c_hall_leave_2 # scene:hall # cast:han,xu,qiao # speaker:xu # mood:xu=neutral
你小时候输的弹子，还没还我。 # beat:c_hall_leave_3 # scene:hall # cast:han,xu,qiao # speaker:qiao # mood:qiao=amused
你要我带刀去还，还是带弹弓？ # beat:c_hall_leave_4 # scene:hall # cast:han,xu,qiao # speaker:xu # mood:xu=neutral
许竞川把伞留下，自己冲进雨里。韩鹭石没拦，把削好的木楔收进小布包。 # beat:c_hall_leave_5 # scene:hall # cast:han,xu,qiao # speaker:narrator
师父没什么大名，替不了你们撑门。包里这个，船上也能用。 # beat:c_hall_leave_6 # scene:hall # cast:han,xu,qiao # speaker:han # mood:han=neutral
那我们带着。不是护身符，有东西松了才敲进去。 # beat:c_hall_leave_7 # scene:hall # cast:han,xu,qiao # speaker:you
* [答应会后回来把屋顶修完。 # cid:promise_home]
  ~ home_promise = true
  差事拿不拿得到，我们都回来。瓦还差一边。 # beat:c_hall_leave_8 # scene:hall # cast:han,xu,qiao # speaker:you
  好。我留着梯子。别把回来也当一种认输。 # beat:c_hall_leave_9 # scene:hall # cast:han,xu,qiao # speaker:han # mood:han=calm
  -> inn_table
* [说清楚想继续走远，留下自己的那份工钱。 # cid:promise_road]
  ~ home_promise = false
  我们可能还要走。若有工钱，先托二娘捎回来。 # beat:c_hall_leave_10 # scene:hall # cast:han,xu,qiao # speaker:you
  想走就走。别把师父说得像只等钱的破瓦罐。 # beat:c_hall_leave_11 # scene:hall # cast:han,xu,qiao # speaker:han # mood:han=amused
  -> inn_table
