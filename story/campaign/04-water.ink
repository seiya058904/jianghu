
=== night_moor ===
旧桩湾黑得只剩船灯。一艘小渔船被回流顶上旧桩，船上有人举着空盆敲。 # beat:c_night_moor_1 # scene:rainboat # cast:zhaoli,du,cheng # speaker:narrator
那桩有半截在水里，船一转就穿底！ # beat:c_night_moor_2 # scene:rainboat # cast:zhaoli,du,cheng # speaker:cheng # mood:cheng=surprised
我们过去也会被顶住。得先把他们的人转出来。 # beat:c_night_moor_3 # scene:rainboat # cast:zhaoli,du,cheng # speaker:zhaoli # mood:zhaoli=neutral
主绳别直牵，直牵两条船就会一起横。 # beat:c_night_moor_4 # scene:rainboat # cast:zhaoli,du,cheng # speaker:du # mood:du=neutral
你叫我守哪边？ # beat:c_night_moor_5 # scene:rainboat # cast:zhaoli,du,cheng # speaker:you
岸绳。可我要过去接人，你要能说不行，不许只会说小心。 # beat:c_night_moor_6 # scene:rainboat # cast:zhaoli,du,cheng # speaker:zhaoli # mood:zhaoli=intent
她把红绳的另一端交进你手心，没有回头。 # beat:c_night_moor_7 # scene:rainboat # cast:zhaoli,du,cheng # speaker:narrator # cg:rescue
* {rope or water_read} [用斜牵线靠活树，让船头有转向余地。 # cid:night_angle]
  ~ night_safe = true
  你先等等。树到船尾，绳留这个角，别直撞过去。 # beat:c_night_moor_8 # scene:rainboat # cast:zhaoli,du,cheng # speaker:you
  对。我压船尾，照鲤走绳内侧，别给绳勒住脚。 # beat:c_night_moor_9 # scene:rainboat # cast:zhaoli,du,cheng # speaker:du # mood:du=intent
  -> night_decide
* [请老杜定绳角，自己照口令逐次放绳。 # cid:night_order]
  ~ night_safe = true
  我不猜。杜师傅，你喊放多少，我放多少。 # beat:c_night_moor_10 # scene:rainboat # cast:zhaoli,du,cheng # speaker:you
  一臂。停。再半臂。别怕慢，怕的就是你忽然替我快一下。 # beat:c_night_moor_11 # scene:rainboat # cast:zhaoli,du,cheng # speaker:du # mood:du=neutral
  -> night_decide
* [先拉紧绳，尽快把照鲤送到对船。 # cid:night_pull]
  ~ night_safe = false
  ~ wound = wound + 1
  绳猛地压住手腕，两船一起偏转。照鲤伏倒在舷边，杜汀叟的篙抵住旧桩。 # beat:c_night_moor_12 # scene:rainboat # cast:zhaoli,du,cheng # speaker:narrator
  松！半臂！你是在救人，不是在拔河！ # beat:c_night_moor_13 # scene:rainboat # cast:zhaoli,du,cheng # speaker:du # mood:du=sharp
  -> night_decide

=== night_decide ===
船上还有个大箱子！里头是我娘攒的布，不拿就都没了！ # beat:c_night_decide_1 # scene:rainboat # cast:zhaoli,liu,cheng # speaker:liu # mood:liu=neutral
人先过来，箱子我替你拴住！ # beat:c_night_decide_2 # scene:rainboat # cast:zhaoli,liu,cheng # speaker:zhaoli # mood:zhaoli=sharp
你们走了，谁还记得一箱布？ # beat:c_night_decide_3 # scene:rainboat # cast:zhaoli,liu,cheng # speaker:liu # mood:liu=neutral
船底开始进水。照鲤伸出的手悬在半途，阿笠咬牙把空盆递给船上另一个人。 # beat:c_night_decide_4 # scene:rainboat # cast:zhaoli,liu,cheng # speaker:narrator
盆拿去舀水。布箱不能挡门！ # beat:c_night_decide_5 # scene:rainboat # cast:zhaoli,liu,cheng # speaker:cheng # mood:cheng=neutral
他说的不是价钱，是以后怎么办。 # beat:c_night_decide_6 # scene:rainboat # cast:zhaoli,liu,cheng # speaker:you
那你替我告诉他，以后还有人来。现在先把手给我。 # beat:c_night_decide_7 # scene:rainboat # cast:zhaoli,liu,cheng # speaker:zhaoli # mood:zhaoli=neutral
* [答应回来捞布，明确写下船号与地点。 # cid:cloth_promise]
  ~ cloth = true
  我记住这根断桩。天亮以后我们一起回来，不让你一个人找。 # beat:c_night_decide_8 # scene:rainboat # cast:zhaoli,liu,cheng # speaker:you
  ……船号叫小蓬。你别只记船号，记我叫刘篙。 # beat:c_night_decide_9 # scene:rainboat # cast:zhaoli,liu,cheng # speaker:liu # mood:liu=uneasy
  刘篙，抓住！ # beat:c_night_decide_10 # scene:rainboat # cast:zhaoli,liu,cheng # speaker:zhaoli # mood:zhaoli=intent
  -> night_fire
* [不许救不了的诺，直说只保得住人。 # cid:cloth_truth]
  ~ cloth = false
  我不能保证布还在。但你娘要等回去的人，是你。 # beat:c_night_decide_11 # scene:rainboat # cast:zhaoli,liu,cheng # speaker:you
  刘篙低头看了一眼，终于跨过船舷。照鲤没替你说一句好听的，只把他的手抓牢。 # beat:c_night_decide_12 # scene:rainboat # cast:zhaoli,liu,cheng # speaker:narrator
  -> night_fire

=== night_fire ===
火别靠帆，帆浸过油。你们要烤衣，到这边来。 # beat:c_night_fire_1 # scene:rainboat # cast:zhaoli,du,bo # speaker:bo # mood:bo=neutral
钓客薄远掀开岸棚。小火上架着一只黑锅，里面只有几片老姜。 # beat:c_night_fire_2 # scene:rainboat # cast:zhaoli,du,bo # speaker:narrator
我刚才是不是太急？老杜明明让我等。 # beat:c_night_fire_3 # scene:rainboat # cast:zhaoli,du,bo # speaker:zhaoli # mood:zhaoli=uneasy
急得对不对，要看你急的时候有没有听见别人。不是今天救到了，就每回都这么救。 # beat:c_night_fire_4 # scene:rainboat # cast:zhaoli,du,bo # speaker:du # mood:du=neutral
你刚才听见我了。 # beat:c_night_fire_5 # scene:rainboat # cast:zhaoli,du,bo # speaker:you
听见了。平时别人只说船上的事你作主，作坏了也你自己认。 # beat:c_night_fire_6 # scene:rainboat # cast:zhaoli,du,bo # speaker:zhaoli # mood:zhaoli=neutral
她把红绳解开，手腕上也留着一道深痕。 # beat:c_night_fire_7 # scene:rainboat # cast:zhaoli,du,bo # speaker:narrator
* [以后由她看水、你看人，互相叫停。 # cid:zhaoli_share]
  ~ zhaoli_trust = true
  你有看不见的岸，我有听不懂的水。别谁全包，谁也不问。 # beat:c_night_fire_8 # scene:rainboat # cast:zhaoli,du,bo # speaker:you
  好。下次我又一口气往前冲，你就喊江照鲤，别喊姑娘小心。 # beat:c_night_fire_9 # scene:rainboat # cast:zhaoli,du,bo # speaker:zhaoli # mood:zhaoli=calm
  -> night_watch
* [让她独坐一会儿，自己去补救生绳。 # cid:zhaoli_space]
  ~ zhaoli_trust = false
  ~ rope = true
  我不替你把这件事说圆。绳子我先补好，你想说再叫我。 # beat:c_night_fire_10 # scene:rainboat # cast:zhaoli,du,bo # speaker:you
  嗯。姜汤给我留半碗，别把话也全留在肚子里。 # beat:c_night_fire_11 # scene:rainboat # cast:zhaoli,du,bo # speaker:zhaoli # mood:zhaoli=calm
  -> night_watch

=== night_watch ===
我守上半夜。你们先睡，明早还得用眼。 # beat:c_night_watch_1 # scene:rainboat # cast:cheng,jue,du # speaker:jue # mood:jue=neutral
我不困，刚才都没出多少力。 # beat:c_night_watch_2 # scene:rainboat # cast:cheng,jue,du # speaker:cheng # mood:cheng=neutral
你把人从舷边背过来三趟，没出力是船自己背的？ # beat:c_night_watch_3 # scene:rainboat # cast:cheng,jue,du # speaker:du # mood:du=sharp
阿笠终于低头，看见自己两只手在抖。觉茂没有说她胆小，只把锅往她那边挪。 # beat:c_night_watch_4 # scene:rainboat # cast:cheng,jue,du # speaker:narrator
会怕也能掌桨。今天没有人因为你怕就落水。 # beat:c_night_watch_5 # scene:rainboat # cast:cheng,jue,du # speaker:you
明早别跟渡口的人讲我抖。 # beat:c_night_watch_6 # scene:rainboat # cast:cheng,jue,du # speaker:cheng # mood:cheng=uneasy
只讲你背了几个人。手抖是你自己知道的事。 # beat:c_night_watch_7 # scene:rainboat # cast:cheng,jue,du # speaker:jue # mood:jue=calm
* [接下半夜，给阿笠留下整段睡觉的时间。 # cid:watch_second]
  ~ escort = true
  下半夜我来。你睡足，明天别让我划得满船转圈。 # beat:c_night_watch_8 # scene:rainboat # cast:cheng,jue,du # speaker:you
  你那也不是转圈，是找不到岸。行，我明天看着你。 # beat:c_night_watch_9 # scene:rainboat # cast:cheng,jue,du # speaker:cheng # mood:cheng=amused
  -> night_return
* [和薄远修好警铃，让疲惫的人都能轮休。 # cid:watch_tools]
  ~ escort = false
  ~ labor = true
  水一到这根钉，铃先响。醒着的人查铃，别硬撑眼皮。 # beat:c_night_watch_10 # scene:rainboat # cast:cheng,jue,du # speaker:you
  先试响，再睡。管用的东西不能只看着像管用。 # beat:c_night_watch_11 # scene:rainboat # cast:cheng,jue,du # speaker:du # mood:du=neutral
  -> night_return

=== night_return ===
天亮后，主事派的接船停在湾外。苏晚澄先问人数，再看册子。 # beat:c_night_return_1 # scene:reeds # cast:su,zhaoli,du # speaker:narrator
都在？好。误了的那场，我会按急难记，不记弃试。 # beat:c_night_return_2 # scene:reeds # cast:su,zhaoli,du # speaker:su # mood:su=neutral
我想写所有人的名字。阿笠、刘篙、薄远，不只领船人。 # beat:c_night_return_3 # scene:reeds # cast:su,zhaoli,du # speaker:zhaoli # mood:zhaoli=neutral
让他们自己说，我来记。 # beat:c_night_return_4 # scene:reeds # cast:su,zhaoli,du # speaker:su # mood:su=calm
别把我写成隐居的神仙。昨晚要是没那棵树，神仙也得湿。 # beat:c_night_return_5 # scene:reeds # cast:su,zhaoli,du # speaker:du # mood:du=neutral
没有人拿剑把水劈开。倒是这条绳，大家都碰过。 # beat:c_night_return_6 # scene:reeds # cast:su,zhaoli,du # speaker:you
行，先回去。夸绳子也得让绳子歇口气。 # beat:c_night_return_7 # scene:reeds # cast:su,zhaoli,du # speaker:zhaoli # mood:zhaoli=amused
* [让每人说自己的部分，不替他们领功。 # cid:water_credit]
  ~ credit = true
  我只讲岸上那段。水里发生的，让阿笠讲。 # beat:c_night_return_8 # scene:reeds # cast:su,zhaoli,du # speaker:you
  这样才是记录。一个人站在最亮处，不等于全场都是他做的。 # beat:c_night_return_9 # scene:reeds # cast:su,zhaoli,du # speaker:su # mood:su=neutral
  -> workshop_gate
* [先核对失去的东西与未兑现的承诺。 # cid:water_cost]
  ~ credit = false
  船、布、网，各有谁的名字。回去不能只报人齐了就算完。 # beat:c_night_return_10 # scene:reeds # cast:su,zhaoli,du # speaker:you
  我跟你一起对。救回来之后的日子，也要有人过。 # beat:c_night_return_11 # scene:reeds # cast:su,zhaoli,du # speaker:zhaoli # mood:zhaoli=calm
  -> workshop_gate
