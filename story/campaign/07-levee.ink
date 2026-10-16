
=== levee_call ===
东堤的水不高，却已把车轮底下的土掏空。棚里还有老人，出口卡着运米的车。 # beat:c_levee_call_1 # scene:levee # cast:yan,tian,he # speaker:narrator
一个个过！别推！推倒的人，前面就走不了了！ # beat:c_levee_call_2 # scene:levee # cast:yan,tian,he # speaker:tian # mood:tian=neutral
别把车硬拉，轴会折！卸这一排米，先把车身抬正！ # beat:c_levee_call_3 # scene:levee # cast:yan,tian,he # speaker:he # mood:he=sharp
我昨晚该拆这座棚。 # beat:c_levee_call_4 # scene:levee # cast:yan,tian,he # speaker:yan # mood:yan=uneasy
现在后悔用得上手吗？ # beat:c_levee_call_5 # scene:levee # cast:yan,tian,he # speaker:you
用不上。你说现在先做什么，我来喊。 # beat:c_levee_call_6 # scene:levee # cast:yan,tian,he # speaker:yan # mood:yan=neutral
这位一直坐上席的主事，卷起下摆，踩进与你同样深的泥里。 # beat:c_levee_call_7 # scene:levee # cast:yan,tian,he # speaker:narrator
{
- stop_clear:
停试令已报全，东出口放开了。你在坪上喊的那句，现在后面的人也听见了。 # beat:c_levee_call_8 # scene:levee # cast:gao,yan,tian # speaker:gao # mood:gao=neutral
- else:
东出口还有人争刚才算不算输。我先去报清，不让你们这边还要等。 # beat:c_levee_call_9 # scene:levee # cast:gao,yan,tian # speaker:gao # mood:gao=neutral
}
{
- repair:
在馆里帮过我那位，过来拿钉。先试后抬，你见过我怎么查。 # beat:c_levee_call_10 # scene:levee # cast:he,gao,yan # speaker:he # mood:he=neutral
先查木底，不拿表面那一层当整块。 # beat:c_levee_call_11 # scene:levee # cast:he,gao,yan # speaker:you
- else:
今天没空从头教。不会就讲，别看别人拿锤，你也抢一把。 # beat:c_levee_call_12 # scene:levee # cast:he,gao,yan # speaker:he # mood:he=neutral
}
{
- warning:
你们昨夜报过回水。我把棚往内挪了两丈，还少做了一步。 # beat:c_levee_call_13 # scene:levee # cast:he,gao,yan # speaker:yan # mood:yan=neutral
那两丈让人还来得及走。先把剩下的一步做完。 # beat:c_levee_call_14 # scene:levee # cast:he,gao,yan # speaker:you
- else:
幸亏昨晚多留了两根长绳。谁绑的先别领功，先把那头拉过来。 # beat:c_levee_call_15 # scene:levee # cast:he,gao,yan # speaker:he # mood:he=neutral
我来。现在不是说谁早知道的时候。 # beat:c_levee_call_16 # scene:levee # cast:he,gao,yan # speaker:you
}
* [先把老人分成短队，逐段送出。 # cid:evacuate_elders]
  ~ evac = true
  不许一口气全挤。田雁报人，明栓扶脚，我站中间接。 # beat:c_levee_call_17 # scene:levee # cast:he,gao,yan # speaker:you
  好。册上的人一个个划，没过去的绝不先打勾。 # beat:c_levee_call_18 # scene:levee # cast:tian,he,gao # speaker:tian # mood:tian=calm
  -> levee_grain
* [先卸车开路，让会走的人自己走。 # cid:evacuate_cart]
  ~ evac = false
  ~ labor = true
  米先放高处，人从车边过。别把所有人都当不能走。 # beat:c_levee_call_19 # scene:levee # cast:tian,he,gao # speaker:you
  我数一二三，你们抬。车只要正半尺，不用抬上天！ # beat:c_levee_call_20 # scene:levee # cast:tian,he,gao # speaker:he # mood:he=neutral
  -> levee_grain

=== levee_grain ===
剩下的米，进外棚垫脚。今天别再问能不能脏。 # beat:c_levee_grain_1 # scene:levee # cast:rong,deng,aunt # speaker:rong # mood:rong=neutral
这就不够给雇工过冬了。 # beat:c_levee_grain_2 # scene:levee # cast:rong,deng,aunt # speaker:deng # mood:deng=uneasy
仓里还有，先记我该赔他们的数。不能用他们的钱替我做好人。 # beat:c_levee_grain_3 # scene:levee # cast:rong,deng,aunt # speaker:rong # mood:rong=neutral
这句像个人话。我把摊棚拆了，木板也能走。 # beat:c_levee_grain_4 # scene:levee # cast:rong,deng,aunt # speaker:aunt # mood:aunt=neutral
你拿米垫脚，自己家的名声也要受损。 # beat:c_levee_grain_5 # scene:levee # cast:rong,deng,aunt # speaker:you
我宁愿明天被骂糟蹋米，也不想今晚站在干处数还有几个人。 # beat:c_levee_grain_6 # scene:levee # cast:rong,deng,aunt # speaker:rong # mood:rong=sharp
邓苹没有再争，自己先扛起一袋。 # beat:c_levee_grain_7 # scene:levee # cast:rong,deng,aunt # speaker:narrator
{
- grain_help:
昨天搬米的人我都叫来了。不是报恩，是大家认得哪袋能压，哪袋不能再沾水。 # beat:c_levee_grain_8 # scene:levee # cast:rong,deng,aunt # speaker:deng # mood:deng=neutral
- else:
按你说的，数和用途都写在这儿。今天谁拿了米，先做事，回来也得讲清。 # beat:c_levee_grain_9 # scene:levee # cast:rong,deng,aunt # speaker:deng # mood:deng=neutral
}
* [帮他们把米铺在确实能承重的地方。 # cid:grain_allow]
  ~ grain_rescue = true
  何铆先看底，不往空泥里倒。你捐出去的不是一句话，是每人脚底这一寸。 # beat:c_levee_grain_10 # scene:levee # cast:rong,deng,aunt # speaker:you
  好。邓苹，听木匠的，不听我着急的。 # beat:c_levee_grain_11 # scene:levee # cast:rong,deng,aunt # speaker:rong # mood:rong=intent
  -> levee_wrist
* [用拆棚板替代一部分米，保住雇工口粮。 # cid:grain_save]
  ~ grain_rescue = false
  木板架这里能接上，米只用最湿的两袋。别救完人，又让你的人断炊。 # beat:c_levee_grain_12 # scene:levee # cast:rong,deng,aunt # speaker:you
  我来拆。少东，你先去领人，账我会记清楚。 # beat:c_levee_grain_13 # scene:levee # cast:rong,deng,aunt # speaker:deng # mood:deng=calm
  -> levee_wrist

=== levee_wrist ===
乔砚生想抬担架，右手忽然松了。许竞川一步顶住，担架没有落地。 # beat:c_levee_wrist_1 # scene:levee # cast:qiao,xu,ling # speaker:narrator
你说疼就停，讲过的！ # beat:c_levee_wrist_2 # scene:levee # cast:qiao,xu,ling # speaker:xu # mood:xu=sharp
我以为这一回还能—— # beat:c_levee_wrist_3 # scene:levee # cast:qiao,xu,ling # speaker:qiao # mood:qiao=uneasy
每个以为都在用同一只手。换到后边，报路，不要再抬。 # beat:c_levee_wrist_4 # scene:levee # cast:qiao,xu,ling # speaker:ling # mood:ling=neutral
看着我。你能不能握住？ # beat:c_levee_wrist_5 # scene:levee # cast:qiao,xu,ling # speaker:you
现在不能。可我不想去一边等，像个被保护得没事的人。 # beat:c_levee_wrist_6 # scene:levee # cast:qiao,xu,ling # speaker:qiao # mood:qiao=neutral
那就别等。你记人，我搬人，谁说只有抬得动才算来过？ # beat:c_levee_wrist_7 # scene:levee # cast:qiao,xu,ling # speaker:xu # mood:xu=neutral
{
- qiao_rest:
昨天肯歇，手就还没坏到拿不住轻物。现在换下来，等养好还能握。 # beat:c_levee_wrist_8 # scene:levee # cast:qiao,xu,ling # speaker:ling # mood:ling=neutral
知道。比以前少练一天，也不等于一辈子再不能练。 # beat:c_levee_wrist_9 # scene:levee # cast:qiao,xu,ling # speaker:qiao # mood:qiao=calm
- else:
昨天没肯休，今天这一下不能再商量。疼不是你不够勇敢，是手已经在说不能。 # beat:c_levee_wrist_10 # scene:levee # cast:qiao,xu,ling # speaker:ling # mood:ling=sharp
}
* [让他负责报人和接应，不再冒险握剑。 # cid:qiao_dispatch]
  ~ qiao_saved = true
  你认得回馆的每条巷。把他们送到不会再进水的地方，我信你这件事。 # beat:c_levee_wrist_11 # scene:levee # cast:qiao,xu,ling # speaker:you
  好。许竞川，别把担架往窄巷里扛，先听我喊。 # beat:c_levee_wrist_12 # scene:levee # cast:qiao,xu,ling # speaker:qiao # mood:qiao=calm
  -> missing_name
* [让他决定保哪段力气，给出明确停手信号。 # cid:qiao_choose]
  ~ qiao_saved = qiao_rest
  你选。但我喊你名字，就必须放手。你要还我这一个答应。 # beat:c_levee_wrist_13 # scene:levee # cast:qiao,xu,ling # speaker:you
  答应。不是想让我走，是想让我还能留下，对吧？ # beat:c_levee_wrist_14 # scene:levee # cast:qiao,xu,ling # speaker:qiao # mood:qiao=uneasy
  是。 # beat:c_levee_wrist_15 # scene:levee # cast:qiao,xu,ling # speaker:you
  -> missing_name

=== levee_exit ===
回水撞上堤脚，一段木栅倾倒。陆汀舟拔剑只切缠绳，苏晚澄却先把册子塞进裴雁秋怀里。 # beat:c_levee_exit_1 # scene:levee # cast:su,lu,pei # speaker:narrator
别误会，不是比人要紧。我腾手。 # beat:c_levee_exit_2 # scene:levee # cast:su,lu,pei # speaker:su # mood:su=neutral
我没说。你今天倒比我先乱猜。 # beat:c_levee_exit_3 # scene:levee # cast:su,lu,pei # speaker:lu # mood:lu=amused
三条撤路，南巷到高地，东桥到船坞，原路回会坪。桥边已有人在清板。 # beat:c_levee_exit_4 # scene:levee # cast:su,lu,pei # speaker:pei # mood:pei=neutral
我们缺哪头？ # beat:c_levee_exit_5 # scene:levee # cast:su,lu,pei # speaker:you
缺一个肯留下报清人数的人，也缺一个能去渡口帮照鲤的人。 # beat:c_levee_exit_6 # scene:levee # cast:su,lu,pei # speaker:su # mood:su=neutral
不是谁更像英雄。两头都不能空。 # beat:c_levee_exit_7 # scene:levee # cast:su,lu,pei # speaker:lu # mood:lu=intent
* [留下把撤离数核清，再赶去渡口。 # cid:leave_signal]
  ~ signal = true
  我记完这一队再走。没见到的人，不能在册上当他已经到了。 # beat:c_levee_exit_8 # scene:levee # cast:su,lu,pei # speaker:you
  我和你核。你不是一个人耽误，你在让那头知道还有几个人。 # beat:c_levee_exit_9 # scene:levee # cast:su,lu,pei # speaker:su # mood:su=calm
  -> levee_split
* [立刻去渡口，让苏晚澄负责记录。 # cid:leave_boat]
  ~ signal = false
  记录交你。我不再回头猜这边，去把船那头接住。 # beat:c_levee_exit_10 # scene:levee # cast:su,lu,pei # speaker:you
  好。到岸举两次灯，我看见就送下一队。 # beat:c_levee_exit_11 # scene:levee # cast:su,lu,pei # speaker:su # mood:su=intent
  -> levee_split

=== levee_split ===
最后一条船还没进。刘篙在掌桨，后面有个从棚里出来的老人。 # beat:c_levee_split_1 # scene:levee # cast:zhaoli,du,he # speaker:zhaoli # mood:zhaoli=neutral
旧堤后头开了个回水口。篙能顶一时，顶不住一夜。 # beat:c_levee_split_2 # scene:levee # cast:zhaoli,du,he # speaker:du # mood:du=neutral
这根主绳能承船，但岸桩撑不住。得换到仓前的石墩。 # beat:c_levee_split_3 # scene:levee # cast:zhaoli,du,he # speaker:he # mood:he=neutral
多远？ # beat:c_levee_split_4 # scene:levee # cast:zhaoli,du,he # speaker:you
过没膝的水，再跨一段断板。可以两人协作，也可以等主事调大船来。 # beat:c_levee_split_5 # scene:levee # cast:zhaoli,du,he # speaker:zhaoli # mood:zhaoli=intent
大船来得慢，却稳。你们要抢这一刻，就得说清楚拿什么抢。 # beat:c_levee_split_6 # scene:levee # cast:zhaoli,du,he # speaker:du # mood:du=neutral
* [先将绳锚换到石墩，再决定接船方式。 # cid:final_prepare]
  ~ anchor = true
  不把第一步赌了。你看船，我去石墩，何铆查绳。 # beat:c_levee_split_7 # scene:levee # cast:zhaoli,du,he # speaker:you
  我跟着。你有伤就说，别等我从水里把你捞出来才知道。 # beat:c_levee_split_8 # scene:levee # cast:zhaoli,du,he # speaker:he # mood:he=intent
  -> last_boat
* [先让照鲤接近船，自己守住现有岸桩。 # cid:final_hurry]
  ~ anchor = false
  岸桩若动我就喊停。我们先让船上知道有人在这儿。 # beat:c_levee_split_9 # scene:levee # cast:zhaoli,du,he # speaker:you
  桩动一寸就喊。别自作主张替它多撑半寸。 # beat:c_levee_split_10 # scene:levee # cast:zhaoli,du,he # speaker:du # mood:du=intent
  -> last_boat
