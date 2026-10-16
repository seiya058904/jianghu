
=== bridge_arrive ===
断雨桥只有半边能走。何铆踩着桥桩敲木板，桥下传来一个孩子的哭声。 # beat:c_bridge_arrive_1 # scene:bridge # cast:pei,he,ming # speaker:narrator
不是塌了，是有人拿旧板补新洞，底下的撑木烂透了。 # beat:c_bridge_arrive_2 # scene:bridge # cast:pei,he,ming # speaker:he # mood:he=neutral
那我们刚才站的—— # beat:c_bridge_arrive_3 # scene:bridge # cast:pei,he,ming # speaker:ming # mood:ming=surprised
别跳！慢慢退！ # beat:c_bridge_arrive_4 # scene:bridge # cast:pei,he,ming # speaker:he # mood:he=sharp
桥下是拾柴的，卡在横梁边。水还没到胸，雨再来就难说。 # beat:c_bridge_arrive_5 # scene:bridge # cast:pei,he,ming # speaker:pei # mood:pei=neutral
你为什么先上桥？ # beat:c_bridge_arrive_6 # scene:bridge # cast:pei,he,ming # speaker:you
因为你们会看剑，不会看木头。我也得来一趟。 # beat:c_bridge_arrive_7 # scene:bridge # cast:pei,he,ming # speaker:he # mood:he=neutral # fact:cross
* {rope} [把绳固定在活树，先试受力再下人。 # cid:bridge_anchor]
  ~ bridge_safe = true
  桥本身不稳，不能再把人的命系桥上。树根在这边。 # beat:c_bridge_arrive_8 # scene:bridge # cast:pei,he,ming # speaker:you
  这个位置对。我看结，你们一人试拉，别一起上。 # beat:c_bridge_arrive_9 # scene:bridge # cast:pei,he,ming # speaker:he # mood:he=intent
  -> bridge_guard
* [请何铆掌绳，自己清桥头围观的人。 # cid:bridge_expert]
  ~ bridge_safe = true
  你来管绳。我让上头空出路，不再有人踩坏下一块。 # beat:c_bridge_arrive_10 # scene:bridge # cast:pei,he,ming # speaker:you
  好。不是说不会就算完了，站住你会的那个位置。 # beat:c_bridge_arrive_11 # scene:bridge # cast:pei,he,ming # speaker:he # mood:he=neutral
  -> bridge_guard
* [抢先踩梁下去，省去等绳的工夫。 # cid:bridge_jump]
  ~ bridge_safe = false
  ~ wound = wound + 1
  湿木往下沉了一截，你撞上桥桩，肋边一疼。何铆及时把绳抛过来。 # beat:c_bridge_arrive_12 # scene:bridge # cast:pei,he,ming # speaker:narrator
  抓住！省下的工夫现在得两个人来赔！ # beat:c_bridge_arrive_13 # scene:bridge # cast:pei,he,ming # speaker:he # mood:he=sharp
  -> bridge_guard

=== bridge_guard ===
后面的车催着过，说药车能等，他们的菜不能等。 # beat:c_bridge_guard_1 # scene:bridge # cast:xu,fan,pei # speaker:fan # mood:fan=neutral
再推一次，我就—— # beat:c_bridge_guard_2 # scene:bridge # cast:xu,fan,pei # speaker:xu # mood:xu=sharp
你就怎样？把他们砍倒，车自己往回走？ # beat:c_bridge_guard_3 # scene:bridge # cast:xu,fan,pei # speaker:pei # mood:pei=neutral
带头的脚夫抬起扁担。桥头只有两步宽，你不用赢他，得让后面的人停下来。 # beat:c_bridge_guard_4 # scene:bridge # cast:xu,fan,pei # speaker:narrator
先叫车轮别动。许竞川，刀别出鞘。 # beat:c_bridge_guard_5 # scene:bridge # cast:xu,fan,pei # speaker:you
我守右边。你别往桥洞里退。 # beat:c_bridge_guard_6 # scene:bridge # cast:xu,fan,pei # speaker:xu # mood:xu=intent
扁担从斜上扫下，打的不是你，是顶住车轮的木楔。 # beat:c_bridge_guard_7 # scene:bridge # cast:xu,fan,pei # speaker:narrator
{
- bridge_help:
坡口你帮我把车扶正，这会儿扁担也借你。放心，新的，我试过受力。 # beat:c_bridge_guard_8 # scene:bridge # cast:xu,fan,pei # speaker:fan # mood:fan=neutral
- else:
你在坡口没抢着谈路钱，现在也别抢着跟所有人讲理。守住这头，我去叫车停。 # beat:c_bridge_guard_9 # scene:bridge # cast:xu,fan,pei # speaker:fan # mood:fan=neutral
}
* {terrain or read} [贴近车轴，护木楔而不抢扁担。 # cid:guard_wedge]
  ~ guard = true
  你贴车轴蹲低，扁担落在实木上，震得对方虎口发麻。车轮没有越线。 # beat:c_bridge_guard_10 # scene:bridge # cast:xu,fan,pei # speaker:narrator
  就这样！撑三息，裴领队已经过去了。 # beat:c_bridge_guard_11 # scene:bridge # cast:xu,fan,pei # speaker:xu # mood:xu=intent
  -> bridge_endure
* [认下延期的损失，让脚夫先看桥下。 # cid:guard_talk]
  ~ guard = true
  ~ debt = true
  菜坏了记我账。先看下面，那个人比你这筐菜先落水。 # beat:c_bridge_guard_12 # scene:bridge # cast:xu,fan,pei # speaker:you
  对方低头，扁担终于垂下。你没赢一招，桥头却空了出来。 # beat:c_bridge_guard_13 # scene:bridge # cast:xu,fan,pei # speaker:narrator
  -> bridge_endure
* [正面接扁担，硬守三息。 # cid:guard_meet]
  ~ guard = false
  ~ wound = wound + 1
  扁担压得你手臂发颤。第三息将尽，许竞川用刀鞘撑住你的肘。 # beat:c_bridge_guard_14 # scene:bridge # cast:xu,fan,pei # speaker:narrator
  别跟木头比硬！我顶住了，松半分！ # beat:c_bridge_guard_15 # scene:bridge # cast:xu,fan,pei # speaker:xu # mood:xu=sharp
  -> bridge_endure

=== bridge_endure ===
桥下的小孩顺绳爬上来，怀里还抱着一捆湿柴。明栓想接，先被他躲开。 # beat:c_bridge_endure_1 # scene:bridge # cast:he,ming,pei # speaker:narrator
我不抢你的。你松手，我给你捆紧。 # beat:c_bridge_endure_2 # scene:bridge # cast:he,ming,pei # speaker:ming # mood:ming=uneasy
过桥的人少一半，桥的命就长一半。先抬药，人分开走。 # beat:c_bridge_endure_3 # scene:bridge # cast:he,ming,pei # speaker:he # mood:he=neutral
我们迟了大半日。赶回去也许就错过第一轮。 # beat:c_bridge_endure_4 # scene:bridge # cast:he,ming,pei # speaker:pei # mood:pei=neutral
那还赶么？ # beat:c_bridge_endure_5 # scene:bridge # cast:he,ming,pei # speaker:you
赶。但不拿第二个孩子的命换。你想选什么，现在说。 # beat:c_bridge_endure_6 # scene:bridge # cast:he,ming,pei # speaker:pei # mood:pei=neutral
雨打在刚补好的木板上，每一块都能听见不同的空响。 # beat:c_bridge_endure_7 # scene:bridge # cast:he,ming,pei # speaker:narrator
* [把最后一箱送入村，接受迟到。 # cid:escort_finish]
  ~ escort = true
  人没进屋就还没送完。迟到写在我名下。 # beat:c_bridge_endure_8 # scene:bridge # cast:he,ming,pei # speaker:you
  写全队。不要一个人抢着做欠账的人。 # beat:c_bridge_endure_9 # scene:bridge # cast:he,ming,pei # speaker:pei # mood:pei=calm
  -> bridge_letter
* [自己先回报信，由镖队完成最后一程。 # cid:escort_split]
  ~ escort = false
  我回去报桥坏和迟到，你们送药。会场不能只看见我们缺席。 # beat:c_bridge_endure_10 # scene:bridge # cast:he,ming,pei # speaker:you
  好。回程别抄近路。你带的是消息，不是逃跑的理由。 # beat:c_bridge_endure_11 # scene:bridge # cast:he,ming,pei # speaker:pei # mood:pei=neutral
  -> bridge_letter

=== bridge_letter ===
我会记：桥头停争、护车、救人。这不是替迟到找借口。 # beat:c_bridge_letter_1 # scene:bridge # cast:su,lu,pei # speaker:su # mood:su=neutral
也别把你挨了一扁担，记成胜十名壮汉。 # beat:c_bridge_letter_2 # scene:bridge # cast:su,lu,pei # speaker:lu # mood:lu=neutral
你再说，我就把你藏了两块饼写进去。 # beat:c_bridge_letter_3 # scene:bridge # cast:su,lu,pei # speaker:you
那可是救急的饼。 # beat:c_bridge_letter_4 # scene:bridge # cast:su,lu,pei # speaker:lu # mood:lu=surprised
救你的急，还是救我们看你挨饿的急？ # beat:c_bridge_letter_5 # scene:bridge # cast:su,lu,pei # speaker:pei # mood:pei=amused
笑声里，你才发现人人都湿透了。苏晚澄把册子藏进油布，自己的袖子却滴着水。 # beat:c_bridge_letter_6 # scene:bridge # cast:su,lu,pei # speaker:narrator
回去以后，谁问陆路容易，你自己讲。别把他们那条河也讲完。 # beat:c_bridge_letter_7 # scene:bridge # cast:su,lu,pei # speaker:su # mood:su=neutral
* [要求记录里加上木匠和脚夫的姓名。 # cid:record_people]
  ~ credit = true
  没有何铆的结、范遇的扁担，我们这几柄剑有什么用？ # beat:c_bridge_letter_8 # scene:bridge # cast:su,lu,pei # speaker:you
  已经写了。不过你提醒得对，下次由他们自己说名字。 # beat:c_bridge_letter_9 # scene:bridge # cast:su,lu,pei # speaker:su # mood:su=calm
  -> workshop_gate
* [先记延误与损失，免得两村互相埋怨。 # cid:record_cost]
  ~ credit = false
  好事不急着领。药少了多少、菜坏了多少，先说清楚。 # beat:c_bridge_letter_10 # scene:bridge # cast:su,lu,pei # speaker:you
  我回去对账。你没把这事只当一场好看的救人。 # beat:c_bridge_letter_11 # scene:bridge # cast:su,lu,pei # speaker:pei # mood:pei=neutral
  -> workshop_gate
