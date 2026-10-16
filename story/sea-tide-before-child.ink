// Source: 宋世江湖7424–7787. Shen remembers nine hands in his forties, not first at63.
VAR st_first_rail = false
VAR st_trial_breath = false
VAR st_shared_knot = false
VAR st_exchange_drill = false
VAR st_tide_follow = false
VAR st_transfer_line = false
VAR st_call_gap = false
VAR st_after_carry = false
VAR st_rush_plain = false
VAR st_rank_question = false
VAR st_flat_practice = false
VAR st_watch_space = false
VAR st_condition_excuse = false
VAR st_shared_post = false
VAR st_wait_paid = false
VAR st_listen_seat = false
VAR st_zhou_talk = false
VAR st_enter_plain = false
VAR st_fish_question = false
VAR st_last_unknown = false
VAR st_life = 0
-> first_boat

=== first_boat ===
第五日清晨，雾后露出黑崖，浪碎成白线。你趴在船边，肚里早已没有什么可吐，一抬头，胃里又跟着船晃。 # beat:st_first_boat_1 # scene:st_approach # cast:st2_boatkeeper # speaker:narrator
你叫沈见潮，十二岁，白螺屿人。父亲捕鱼，母亲晒盐。第一次去归潮岛，船走五日，你吐了三日；崖顶楼没有旗，只悬望海二字。 # beat:st_first_boat_2 # scene:st_approach # cast:st2_boatkeeper # speaker:narrator
到了。海天门。 # beat:st_first_boat_3 # scene:st_approach # cast:st2_boatkeeper # speaker:st2_boatkeeper # mood:st2_boatkeeper=intent
你想站起来，好让他知道自己不是只会吐的小孩。船却先摇了一下。 # beat:st_first_boat_4 # scene:st_approach # cast:st2_boatkeeper # speaker:narrator
* [抓住栏杆，顺着船摇站起来。 # cid:st_take_rail]
  ~ st_first_rail = true
  手心沾了一点湿木屑。你站起时没比船快，反倒真看清黑崖上那两个字。 # beat:st_first_boat_5 # scene:st_approach # cast:st2_boatkeeper # speaker:narrator
  今日先别把早饭也送给望海楼。 # beat:st_first_boat_6 # scene:st_approach # cast:st2_boatkeeper # speaker:st2_boatkeeper # mood:st2_boatkeeper=amused
  -> trial
* [再坐一会，等这波落下去才站。 # cid:st_wait_wave]
  ~ st_first_rail = false
  老人把你身旁的空桶推远一点，自己仍扶着舷。船身回落，你才把脚移到刚才放桶的地方。 # beat:st_first_boat_7 # scene:st_approach # cast:st2_boatkeeper # speaker:narrator
  我现在能看了。 # beat:st_first_boat_8 # scene:st_approach # cast:st2_boatkeeper # speaker:you
  楼又不走。 # beat:st_first_boat_9 # scene:st_approach # cast:st2_boatkeeper # speaker:st2_boatkeeper # mood:st2_boatkeeper=amused
  -> trial

=== trial ===
东极群岛更偏南、更深，大小四十余岛，常住的十余座。归潮岛有山、有田、三处大港。船上的老人说，北去蓬莱还得换船；你到的这座岛，山脚已有人把田分成一格一格。 # beat:st_trial_1 # scene:st_trialshore # cast:st_coach,st_an # speaker:narrator # look:st_an=child
三年一次试门，四十七个孩子排在水边。阿岑也是白螺屿来的，挤在你旁边，扯袖问木刀是不是等下要发。他看中了靠边那柄，怕先叫别人拿去。 # beat:st_trial_2 # scene:st_trialshore # cast:st_coach,st_an # speaker:narrator
第一关，游水。 # beat:st_trial_3 # scene:st_trialshore # cast:st_coach,st_an # speaker:st_coach # mood:st_coach=neutral
不先打？ # beat:st_trial_4 # scene:st_trialshore # cast:st_coach,st_an # speaker:st_an # mood:st_an=surprised
你倒先游到那边，再问第二句。 # beat:st_trial_5 # scene:st_trialshore # cast:st_coach,st_an # speaker:st_coach # mood:st_coach=intent
* [先换足一口气，按自己的快慢游。 # cid:st_swim_breath]
  ~ st_trial_breath = true
  你落后一截，转身时却还能换气。阿岑在前面呛了一口，听你呼气，终于也慢下来。 # beat:st_trial_6 # scene:st_trialshore # cast:st_coach,st_an # speaker:narrator
  教头沿水边跟着那口咳声走，叫近处两个看护者下到浅水。阿岑站起来时，他已经等在岸边。 # beat:st_trial_7 # scene:st_trialshore # cast:st_coach,st_an # speaker:narrator
  -> four_tests
* [绕开教头指的回流，从外侧游。 # cid:st_swim_line]
  ~ st_trial_breath = false
  你比阿岑绕得远，却没被回流带回去。他到岸时咳着问为什么，你指向刚才反复转白的水。 # beat:st_trial_8 # scene:st_trialshore # cast:st_coach,st_an # speaker:narrator
  认得一回，别当下回还在原处。 # beat:st_trial_9 # scene:st_trialshore # cast:st_coach,st_an # speaker:st_coach # mood:st_coach=intent
  -> four_tests

=== four_tests ===
第二关攀崖，第三关认风。到第四关，才有人推你们三次，看谁少摔两跤。你仍摔得满手砂，抬起来，教头先看你指节还能不能动。 # beat:st_four_tests_1 # scene:st_trialshore # cast:st_coach,st_an # speaker:narrator
会打，可以慢慢学。海上先看你会不会活。 # beat:st_four_tests_2 # scene:st_trialshore # cast:st_coach,st_an # speaker:st_coach # mood:st_coach=neutral
四十七个孩子最后留下十六个，你和阿岑都在其中。没有人因游得快便免掉攀崖，也没人因最后站稳一次就不再学水。 # beat:st_four_tests_3 # scene:st_trialshore # cast:st_coach,st_an # speaker:narrator
* [把自己绑的扣交给阿岑，让他解一次。 # cid:st_learn_shared_knot]
  ~ st_shared_knot = true
  他扯半晌解不开，索性拿膝顶住绳圈。你笑他，又看他真急了，只得凑过去同他拆开；轮到他绑，倒也卡住了你的指头。 # beat:st_four_tests_4 # scene:st_trialshore # cast:st_coach,st_an # speaker:narrator
  别怪我手笨。你下回掉水里，绳也不能只认你的手。 # beat:st_four_tests_5 # scene:st_trialshore # cast:st_coach,st_an # speaker:st_an # mood:st_an=amused
  -> outer_years
* [先练湿手快解，再同阿岑换一回。 # cid:st_learn_fast_knot]
  ~ st_shared_knot = false
  你练到手指发热，自己解扣越来越快。阿岑拿来却还打不开，木刀那边已经叫人，你答应明早再同他换。 # beat:st_four_tests_6 # scene:st_trialshore # cast:st_coach,st_an # speaker:narrator
  那你明早叫我。我不替你占前面那柄刀。 # beat:st_four_tests_7 # scene:st_trialshore # cast:st_coach,st_an # speaker:st_an # mood:st_an=uneasy
  你说好，先跑去排队。他把这扣留下，没肯让你替他解。 # beat:st_four_tests_8 # scene:st_trialshore # cast:st_coach,st_an # speaker:narrator
  -> outer_years

=== outer_years ===
外院六年，海潮拳、短刀、步法、基础吐纳，也学掌船、绑绳、识潮、修帆、救溺。十七岁的你把断帆补好，终于忍不住问，这些哪里像武功。 # beat:st_outer_years_1 # scene:st_outeryard # cast:st_coach,st_an # speaker:narrator # look:st_an=youth # cg:rigging # action:绳与帆
我今日绑绳比你快，算不算赢？ # beat:st_outer_years_2 # scene:st_outeryard # cast:st_coach,st_an # speaker:st_an # mood:st_an=amused
我问的是正经的。 # beat:st_outer_years_3 # scene:st_outeryard # cast:st_coach,st_an # speaker:you # cg:none
你若在海上把人打赢，船却沉了，算谁赢？ # beat:st_outer_years_4 # scene:st_outeryard # cast:st_coach # speaker:st_coach # mood:st_coach=intent # camera:portrait # action:外院教头 · 算谁赢
你手里还拿针，半天才把没说完的那句吞回去。 # beat:st_outer_years_5 # scene:st_outeryard # cast:st_coach,st_an # speaker:narrator
{
- st_shared_knot:
早年你肯同阿岑互解一扣，这几年忙起来，却也常由最快的人一把做完。教头这回的问，把那项已经会过却没一直做的事又放回眼前。 # beat:st_outer_years_6 # scene:st_outeryard # cast:st_coach,st_an # speaker:narrator
- else:
十二岁那回，你第二日真去叫过阿岑，一扣也教过了。十七岁再回头看，换了新人，还是得让他从头试，不能指着自己和阿岑都会，就算这班人都能接。 # beat:st_outer_years_7 # scene:st_outeryard # cast:st_coach,st_an # speaker:narrator
}
* [以后收工留一轮换手，让别人解绳、自己来接，不总由最快的人做完。 # cid:st_practice_exchange]
  ~ st_exchange_drill = true
  阿岑真把绳递回来，你才发现他留的扣与你习惯不同。两人拆到指头发酸，回去时饭已经温了。他抢走碗底那块鱼，说早来就有热的，偏要留这会儿。 # beat:st_outer_years_8 # scene:st_outeryard # cast:st_coach,st_an # speaker:narrator
  -> tide_step
* [以后把自己的湿手解扣练得更熟，另找时辰问接手的办法。 # cid:st_practice_alone]
  ~ st_exchange_drill = false
  你一人练到绳股磨热，收放确实更快。别人来接时，你仍惯于自己抢回来做完。那句以后问没有消失，只是被每天最急的活挤到后头。 # beat:st_outer_years_9 # scene:st_outeryard # cast:st_coach,st_an # speaker:narrator
  -> tide_step

=== tide_step ===
十八岁过潮试，入正传。刀、掌、棍、长兵器开始分路，人人却都学潮行。老师把你带到小船上，只说站稳。 # beat:st_tide_step_1 # scene:st_smallboat # cast:st_tidemaster # speaker:narrator
你才站好，他一脚踹船舷，你便落水。连续七日，你终于能在晃船上纹丝不动，刚要抬头看他。 # beat:st_tide_step_2 # scene:st_smallboat # cast:st_tidemaster # speaker:narrator
错了。 # beat:st_tide_step_3 # scene:st_smallboat # cast:st_tidemaster # speaker:st_tidemaster # mood:st_tidemaster=intent
还不够稳？ # beat:st_tide_step_4 # scene:st_smallboat # cast:st_tidemaster # speaker:you
船本来在动。下一步呢？ # beat:st_tide_step_5 # scene:st_smallboat # cast:st_tidemaster # speaker:st_tidemaster # mood:st_tidemaster=neutral
* [松开死顶的膝，试着让船带动自己，再从这一下迈出去。 # cid:st_follow_motion]
  ~ st_tide_follow = true
  你又跌一次，手还没摸到舷，船已往另一边沉。老师挪开脚，给你留了爬回来的地方；你刚上来，膝盖便又得跟着松。 # beat:st_tide_step_6 # scene:st_smallboat # cast:st_tidemaster # speaker:narrator
  刚才还能走，是我不肯松。 # beat:st_tide_step_7 # scene:st_smallboat # cast:st_tidemaster # speaker:you
  那再来。 # beat:st_tide_step_8 # scene:st_smallboat # cast:st_tidemaster # speaker:st_tidemaster # mood:st_tidemaster=neutral
  -> eleven_years
* [不再求七日练成的姿势，先退让半步，看不稳以后还有哪里能落脚。 # cid:st_release_fixed]
  ~ st_tide_follow = false
  一退，船头又翘起来，你只得把刚找的地方也放掉。第二步落下时，老师才点头。 # beat:st_tide_step_9 # scene:st_smallboat # cast:st_tidemaster # speaker:narrator
  不是永远稳，是不稳时还能走。 # beat:st_tide_step_10 # scene:st_smallboat # cast:st_tidemaster # speaker:st_tidemaster # mood:st_tidemaster=neutral
  你喘着气，把船沿上的水抹掉，给下一次留了位置。 # beat:st_tide_step_11 # scene:st_smallboat # cast:st_tidemaster # speaker:narrator
  -> eleven_years

=== eleven_years ===
随后十一年，练武也跟船，潮行不是会背这两句话就不再落水。你与阿岑从候潮的小孩长到能在船上接班的大人，饭桌上已经有人问下次工钱何时结。 # beat:st_eleven_years_1 # scene:st_workshore # cast:st_an # speaker:narrator # look:st_an=adult
明早外海船回来，先接缆再查帆。你别一上船又只问有没有高手。 # beat:st_eleven_years_2 # scene:st_workshore # cast:st_an # speaker:st_an # mood:st_an=intent
我若问，你叫我先把绳交了。 # beat:st_eleven_years_3 # scene:st_workshore # cast:st_an # speaker:you
你说着，把明日用的绳移到两人都能摸到的地方。二十九岁那年，东极的大风先到了。 # beat:st_eleven_years_4 # scene:st_workshore # cast:st_an # speaker:narrator
-> storm

=== storm ===
十一艘商船里，三艘撞礁。你跟门里赶到时，一艘船正向另一侧倾，船上还有二十余人没转出来。阿岑在接应船头，船主指着那根已裂开的桅，话被风吞了一半。 # beat:st_storm_1 # scene:st_storm # cast:st_an,st_shipper # speaker:narrator
还有孩子，躲在那边！ # beat:st_storm_2 # scene:st_storm # cast:st_an,st_shipper # speaker:st_shipper # mood:st_shipper=uneasy
我接这头。你说先过人，还是先把两船牵住！ # beat:st_storm_3 # scene:st_storm # cast:st_an,st_shipper # speaker:st_an # mood:st_an=sharp
两船又被拉开。阿岑伸长手，没够住那边递来的腕；船主已经往卡住的舱门跑，风把他的后半句吹散了。 # beat:st_storm_4 # scene:st_storm # cast:st_an,st_shipper # speaker:narrator
* [先请阿岑牵住转人这一线，自己准备跨过去，分明谁接哪一头。 # cid:st_set_transfer_line]
  ~ st_transfer_line = true
  你守这根，不随我跳。过来一个，先送进去，别堵船头！ # beat:st_storm_5 # scene:st_storm # cast:st_an,st_shipper # speaker:you
  阿岑叫近旁两人接位，自己把绳压到能再松的地方。你刚看见两船靠近，便抢着向那条将沉的船跃去。 # beat:st_storm_6 # scene:st_storm # cast:st_an,st_shipper # speaker:narrator
  -> broken_mast
* [先让眼前能动的人转过去，自己准备去够住滞在远边的人。 # cid:st_send_nearest_people]
  ~ st_transfer_line = false
  先接这几个人。我去远头，别叫他们跟我挤在一边！ # beat:st_storm_7 # scene:st_storm # cast:st_an,st_shipper # speaker:you
  阿岑把近处的人接走，转人确实开始了；空出的这一刻，你却把该再认一次的裂桅漏在身后，抢着跃过去。 # beat:st_storm_8 # scene:st_storm # cast:st_an,st_shipper # speaker:narrator
  -> broken_mast

=== broken_mast ===
你太急。落脚还没来得及换，断桅已倒下，木梁把你压在船边。胸口贴着湿船板，一只手够不着近处，另一只手也推不起那根梁。 # beat:st_broken_mast_1 # scene:st_mast # cast:st_an # speaker:narrator
见潮！别再往水里挣！ # beat:st_broken_mast_2 # scene:st_mast # cast:st_an # speaker:st_an # mood:st_an=sharp
你想叫阿岑，抬头却见他还牵着两船间那一头。你每挣一下，湿木梁便往胸前再磨一寸。 # beat:st_broken_mast_3 # scene:st_mast # cast:st_an # speaker:narrator
{
- st_exchange_drill:
这些年你们收工总肯多换一轮手。阿岑把你常用的一扣交给旁人，对方能解，绳便真松出一段接住退回的人。他自己留下牵住你这边，没有把整条绳缠上手臂。 # beat:st_broken_mast_4 # scene:st_mast # cast:st_an # speaker:narrator
- else:
阿岑知道你会解这一扣，却没替下一只手练会。接位的人一扯不开，他只得自己回身松绳，再来牵你这边；急里把绳压在腕上，绳股抽过去，痛得他咬紧牙仍不敢撒手。 # beat:st_broken_mast_5 # scene:st_mast # cast:st_an # speaker:narrator
}
{
- st_tide_follow:
你试着松膝随船转，压住的地方却没有跟来。十八岁时能换出的那一步，此刻先得有人替你移开木梁。 # beat:st_broken_mast_6 # scene:st_mast # cast:st_an # speaker:narrator
- else:
你想像当年在小船上那样退半步，脚跟却卡在梁下。你只得停住，把胸口勉强留得出的那口气用来喊人。 # beat:st_broken_mast_7 # scene:st_mast # cast:st_an # speaker:narrator
}
* [朝阿岑叫清自己被压的位置，别让他也跳进同一处险。 # cid:st_call_clear_gap]
  ~ st_call_gap = true
  梁压住我。你别来，留在能接人的那边！ # beat:st_broken_mast_8 # scene:st_mast # cast:st_an # speaker:you
  你喘不过一整句，便分成两次喊。那头终于不再往你这里跳，船边多留下一个还能抬手接人的人。 # beat:st_broken_mast_9 # scene:st_mast # cast:st_an # speaker:narrator
  -> three_steps
* [先指给接应者孩子躲的地方，把自己的慌分出一句能用的话。 # cid:st_show_child_place]
  ~ st_call_gap = false
  你手抬不起，只能用眼与下颌示向那边。阿岑看明白，朝后来的人转喊；你喊到最后没了声，也没能凭想救人便忽然推开木梁。 # beat:st_broken_mast_10 # scene:st_mast # cast:st_an # speaker:narrator
  -> three_steps

=== three_steps ===
有人从另一条船跃来，在倾斜桅杆上走三步，如走平地。第一掌拍断压你的梁，继而越过你，把旁边吓得不会动的孩子送出。 # beat:st_three_steps_1 # scene:st_mast # cast:st_ye # speaker:narrator
你被接回时，回头仍看见他往里走。 # beat:st_three_steps_2 # scene:st_mast # cast:st_ye # speaker:narrator
那是你第一次真正见叶孤舟，内院第六席。你才张嘴，他又回身去接后面的人。 # beat:st_three_steps_3 # scene:st_mast # cast:st_ye # speaker:narrator
那边腾一处！别把孩子挤在舷口！ # beat:st_three_steps_4 # scene:st_mast # cast:st_ye # speaker:st_ye # mood:st_ye=sharp
等再没有人朝这头伸手，他才跟着最后一拨人回来。最后一个离船的人，也是他。 # beat:st_three_steps_5 # scene:st_mast # cast:st_ye # speaker:narrator
* [缓过一口气，蹲下接递来的那只手。 # cid:st_take_next_carry]
  ~ st_after_carry = true
  腿仍抖，你就蹲着接递来的手。你没有成为最后离船的人，只把眼前能送到舱内的这一位真送过去。 # beat:st_three_steps_6 # scene:st_mast # cast:st_ye # speaker:narrator
  这里接住，别把刚腾开的路又挡了。 # beat:st_three_steps_7 # scene:st_mast # cast:st_ye # speaker:st_ye # mood:st_ye=intent
  -> after_storm
* [把船头的人往里送，给下一人留落脚处。 # cid:st_clear_landing]
  ~ st_after_carry = false
  你扶一个人往里退，近处的人才跟着让路。风里那道能落脚的空处，比你再喊一遍我能跳更有用。 # beat:st_three_steps_8 # scene:st_mast # cast:st_ye # speaker:narrator
  对，再退一个位置。 # beat:st_three_steps_9 # scene:st_mast # cast:st_ye # speaker:st_ye # mood:st_ye=intent
  -> after_storm

=== after_storm ===
大风过去，三艘撞礁船的木料还堆在岸上。阿岑要回白螺屿报平安，你先陪他等这趟工钱。他捋湿袖时，你问能不能自己拿那只行包，没急着先替他接过来。 # beat:st_after_storm_1 # scene:st_workshore # cast:st_an # speaker:narrator
{
- st_exchange_drill:
他的手没被那回接绳抽伤，隔几日便能照常做活。你们把换手那一轮教给这次接位的人，来回多练两晚，没把一次接对说成永远不会再乱。 # beat:st_after_storm_2 # scene:st_workshore # cast:st_an # speaker:narrator
别再一学会就全抢回去。你在下面压着的时候，绳也没空等你。 # beat:st_after_storm_3 # scene:st_workshore # cast:st_an # speaker:st_an # mood:st_an=amused
- else:
他腕上的伤养了两个月，重活做不得，少了两趟船钱。你接他能让出的班，自己少练了几个夜里；替班的钱有了，痛和错过的船并没被一句对不起抹掉。 # beat:st_after_storm_4 # scene:st_workshore # cast:st_an # speaker:narrator
先替我这一趟。等我好了，教会我再走，别下回还只有你会。 # beat:st_after_storm_5 # scene:st_workshore # cast:st_an # speaker:st_an # mood:st_an=intent
}
* [向来问话的叶孤舟说清自己漏看断桅，不用救人的本意遮过去。 # cid:st_admit_rush]
  ~ st_rush_plain = true
  我看见要去的人，却没再看脚下会断的地方。 # beat:st_after_storm_6 # scene:st_workshore # cast:st_an # speaker:you
  他说知道，没再逼你把懊悔说得更响。下一回之前，他叫你先能把接应的那个人也讲清楚。 # beat:st_after_storm_7 # scene:st_workshore # cast:st_an # speaker:narrator
  -> inner_court
* [把落脚到被压的一段重走给叶孤舟看，找出自己何处已没有下一步。 # cid:st_trace_next_step]
  ~ st_rush_plain = false
  你在岸上走到那一步，脚便停住。没有风，仍能看见自己当时只盯着要到的地方。 # beat:st_after_storm_8 # scene:st_workshore # cast:st_an # speaker:narrator
  我想过去，没有想过去以后怎么回。 # beat:st_after_storm_9 # scene:st_workshore # cast:st_an # speaker:you
  他让你把这一段重新走完。 # beat:st_after_storm_10 # scene:st_workshore # cast:st_an # speaker:narrator
  -> inner_court

=== inner_court ===
半年后，你因那次救船调入内院，已近三十。叶孤舟问，若再来一次，还跳不跳。 # beat:st_inner_court_1 # scene:st_inner # cast:st_ye # speaker:narrator
跳。但不会那样跳了。 # beat:st_inner_court_2 # scene:st_inner # cast:st_ye # speaker:you
这才值得教。 # beat:st_inner_court_3 # scene:st_inner # cast:st_ye # speaker:st_ye # mood:st_ye=amused
内院人少，得能独当一面。其上九席，门主统摄全门；退位门主、前代高席和百岁仍留岛的老人，多住镇海院。你听见九席，最先想的仍是谁更能打。 # beat:st_inner_court_4 # scene:st_inner # cast:st_ye # speaker:narrator
{
- st_transfer_line:
那天你叫阿岑留绳，他真留住了。你自己跳前，却少看了一眼桅。 # beat:st_inner_court_5 # scene:st_inner # cast:st_ye # speaker:st_ye # mood:st_ye=intent
你还想答已说过了，叶孤舟让你把下次谁留岸上再报一遍，直到名字也说清。 # beat:st_inner_court_6 # scene:st_inner # cast:st_ye # speaker:narrator
- else:
你先送能动的人，没错。你跳过去以后，那头谁留绳？ # beat:st_inner_court_7 # scene:st_inner # cast:st_ye # speaker:st_ye # mood:st_ye=intent
你报了阿岑，话到一半，又想起他还在往里送人。你得再找一个肯留下的，不能只把同一个名字报两次。 # beat:st_inner_court_8 # scene:st_inner # cast:st_ye # speaker:narrator
}
* [直接问第四与第六到底相当于中原第几，不假装自己已经懂。 # cid:st_ask_rank]
  ~ st_rank_question = true
  叶观澜师兄第四，您第六，放中原算第几？ # beat:st_inner_court_9 # scene:st_inner # cast:st_ye # speaker:you
  你等见过我们在哪儿做什么，再来问同一句。 # beat:st_inner_court_10 # scene:st_inner # cast:st_ye # speaker:st_ye # mood:st_ye=amused
  -> four_six
* [先问为什么同一人上岸与上船不同，试着从那三步里找自己的问题。 # cid:st_ask_ground]
  ~ st_rank_question = false
  若换成平地，那三步还能这样走？ # beat:st_inner_court_11 # scene:st_inner # cast:st_ye # speaker:you
  平地又没有那根桅。你先去看观澜的脚，别拿我这一下替所有地方作数。 # beat:st_inner_court_12 # scene:st_inner # cast:st_ye # speaker:st_ye # mood:st_ye=intent
  -> four_six

=== four_six ===
叶观澜列第四，叶孤舟第六，两人都未入化。平整青石坪上，观澜正面更强；换夜海、风浪、接舷两船，孤舟更会借潮与乱局，结果便可能反过来。 # beat:st_four_six_1 # scene:st_court # cast:st_guanlan,st_ye # speaker:narrator
你站我正前，不必替孤舟先藏一处船舷。 # beat:st_four_six_2 # scene:st_court # cast:st_guanlan,st_ye # speaker:st_guanlan # mood:st_guanlan=intent
他进一步，你才要照船上那样让，脚下没有会下沉的船，掌已从肩前逼来。叶孤舟没替你把这回解释成海上必能赢。 # beat:st_four_six_3 # scene:st_court # cast:st_guanlan,st_ye # speaker:narrator
你先接完今天这一手。 # beat:st_four_six_4 # scene:st_court # cast:st_guanlan,st_ye # speaker:st_ye # mood:st_ye=amused
* [留在平地把刚才没接住的一步试完，不急着拿海上替自己找回场。 # cid:st_test_flat_step]
  ~ st_flat_practice = true
  观澜又进，你放掉预想里那阵浪，才在真实石面上找到还能退转的一点。 # beat:st_four_six_5 # scene:st_court # cast:st_guanlan,st_ye # speaker:narrator
  这回脚在这里。下回再认。 # beat:st_four_six_6 # scene:st_court # cast:st_guanlan,st_ye # speaker:st_guanlan # mood:st_guanlan=neutral
  -> report_from_mainland
* [请两位各走一次同一来招，自己站进去接，看区别而非背一句各有长短。 # cid:st_compare_live_step]
  ~ st_flat_practice = false
  同一来掌，两人续法不同。你刚想说看明白了，孤舟便把你叫回原处，让你亲接；你挡住前半手，后半步已经叫他转到肩外。 # beat:st_four_six_7 # scene:st_court # cast:st_guanlan,st_ye # speaker:narrator
  -> report_from_mainland

=== report_from_mainland ===
后来，中原的战报经回岛船带来：龙虎风云会，叶观澜与北榜第十四郭洪一百零六合互有杀着，主事同时叫停。老教习把纸展开，你在岛上听他念完。 # beat:st_report_from_mainland_1 # scene:st_inner # cast:st_oldtutor # speaker:narrator
那他们大概是中段到中前段？ # beat:st_report_from_mainland_2 # scene:st_inner # cast:st_oldtutor # speaker:you
大约。然后呢？ # beat:st_report_from_mainland_3 # scene:st_inner # cast:st_oldtutor # speaker:st_oldtutor # mood:st_oldtutor=neutral
没有然后？ # beat:st_report_from_mainland_4 # scene:st_inner # cast:st_oldtutor # speaker:you
换个人、换地方、换一年，都要变。 # beat:st_report_from_mainland_5 # scene:st_inner # cast:st_oldtutor # speaker:st_oldtutor # mood:st_oldtutor=intent
你还想问怎样把这句话换成一张总不会改的座次。直到四十多岁，叶孤舟自外海归来，去找第一席谢观海。 # beat:st_report_from_mainland_6 # scene:st_inner # cast:st_oldtutor # speaker:narrator
-> borrow_hand

=== borrow_hand ===
谢观海九十余，入化多年，仍占第一席，住处却不在镇海院：门里有些事，还需要他看。叶孤舟刚在外海追船连胜两位成名海客，岛上都说六席又深了。 # beat:st_borrow_hand_1 # scene:st_teacourt # cast:st_ye,st_xie # speaker:narrator
谢师兄，借我一手。 # beat:st_borrow_hand_2 # scene:st_teacourt # cast:st_ye,st_xie # speaker:st_ye # mood:st_ye=intent
几手？ # beat:st_borrow_hand_3 # scene:st_teacourt # cast:st_ye,st_xie # speaker:st_xie # mood:st_xie=neutral
打到您觉得够。 # beat:st_borrow_hand_4 # scene:st_teacourt # cast:st_ye,st_xie # speaker:st_ye # mood:st_ye=neutral
谢放下茶碗，不拿兵器。你四十多，自认已看得懂，这一回先看叶孤舟怎样进。 # beat:st_borrow_hand_5 # scene:st_teacourt # cast:st_ye,st_xie # speaker:narrator
* [不只盯棍尖，看看叶每次进以后，还剩哪里能走。 # cid:st_watch_next_space]
  ~ st_watch_space = true
  第一招叶进，谢侧一步。那一步不是退远，却叫叶原可接上的一处挤在两人身后；你眼睛跟过去，才发现棍还得从别处回来。 # beat:st_borrow_hand_6 # scene:st_teacourt # cast:st_ye,st_xie # speaker:narrator
  -> two_hands
* [先看叶孤舟每一招自己想做什么，不拿第一席名头提前替他认输。 # cid:st_watch_own_choice]
  ~ st_watch_space = false
  第一招叶进，谢侧一步。叶步没乱，棍也快，你几乎想替他说这一步走得对；可眼前两人的位置已经和你那句对不一样。 # beat:st_borrow_hand_7 # scene:st_teacourt # cast:st_ye,st_xie # speaker:narrator
  -> two_hands

=== two_hands ===
第二招，短棍封住中线。谢在棍侧轻碰，第三招后你才渐觉不对。每一手单看似乎没错，叶每作一个选择，下一步能走的地方却少一块。 # beat:st_two_hands_1 # scene:st_teacourt # cast:st_ye,st_xie # speaker:narrator
第五招，叶第一次后退。第七招，短棍被带偏。第九招，谢的右手停在叶胸前，棍仍在外侧。 # beat:st_two_hands_2 # scene:st_teacourt # cast:st_ye,st_xie # speaker:narrator
还来么？ # beat:st_two_hands_3 # scene:st_teacourt # cast:st_ye,st_xie # speaker:st_xie # mood:st_xie=neutral
不用了。 # beat:st_two_hands_4 # scene:st_teacourt # cast:st_ye,st_xie # speaker:st_ye # mood:st_ye=intent
谢坐回去喝茶，呼吸没变多少。叶把短棍横在膝上，食指沿着方才被碰的位置摸了一下。你看那只手，又看谢的茶碗，迟迟没问出口。 # beat:st_two_hands_5 # scene:st_teacourt # cast:st_ye,st_xie # speaker:narrator
* [问他是不是那日状态不好，听他亲口说这并不是理由。 # cid:st_ask_condition]
  ~ st_condition_excuse = true
  您是不是状态不好？ # beat:st_two_hands_6 # scene:st_teacourt # cast:st_ye,st_xie # speaker:you
  我状态很好。 # beat:st_two_hands_7 # scene:st_teacourt # cast:st_ye,st_xie # speaker:st_ye # mood:st_ye=intent
  那九招…… # beat:st_two_hands_8 # scene:st_teacourt # cast:st_ye,st_xie # speaker:you
  九招够了。 # beat:st_two_hands_9 # scene:st_teacourt # cast:st_ye,st_xie # speaker:st_ye # mood:st_ye=neutral
  他把棍收好，抬眼等你。你那句还想问的话卡在嘴里，想了一遍，又慢慢咽回去。 # beat:st_two_hands_10 # scene:st_teacourt # cast:st_ye,st_xie # speaker:narrator
  -> nine_enough
* [问同一手为什么自己看着对、下一步却已经少了路。 # cid:st_ask_earlier]
  ~ st_condition_excuse = false
  你每一手都知道自己在做什么，为什么还会那样？ # beat:st_two_hands_11 # scene:st_teacourt # cast:st_ye,st_xie # speaker:you
  你摸摸棍侧这一处。 # beat:st_two_hands_12 # scene:st_teacourt # cast:st_ye,st_xie # speaker:st_ye # mood:st_ye=intent
  他把棍横过来，你照着第二招封住的方向试，刚伸手，自己也先挪了脚。 # beat:st_two_hands_13 # scene:st_teacourt # cast:st_ye,st_xie # speaker:narrator
  -> nine_enough

=== nine_enough ===
我每一招都知道自己在做什么。他比我早知道。 # beat:st_nine_enough_1 # scene:st_teacourt # cast:st_ye # speaker:st_ye # mood:st_ye=neutral
你第一次真正看见入化与未入化之间这段差距。不是每个未入化都一样：门外仍有韩世雄那样能叫入化人物费力的异数；叶与观澜已很深，却还没到门口最窄的地方。 # beat:st_nine_enough_2 # scene:st_teacourt # cast:st_ye # speaker:narrator
你回院照着试第二招，叫同门一碰，棍尖便歪了。他问是不是这样，你只得请他再慢些。第二回，他还没碰上来，你便先把棍收了，重新找站的地方。 # beat:st_nine_enough_3 # scene:st_teacourt # cast:st_ye # speaker:narrator
* [往后巡船先同接班的人试一遍位置，把自己看到的险说明白。 # cid:st_prepare_shared_post]
  ~ st_shared_post = true
  这会多占出港前半刻。有人嫌慢，你让他真从另一头接，自己也从那一头走回；直到不靠你喊第二遍也能松开这条路。 # beat:st_nine_enough_4 # scene:st_teacourt # cast:st_ye # speaker:narrator
  -> seven_ships
* [往后巡船先把最难的一段自己练熟，再把余处交别人，不让慢手挡住眼前的急。 # cid:st_prepare_fast_post]
  ~ st_shared_post = false
  你做得快，其他人也习惯等你做完。你以为最险的归自己就是负责，至于自己被另一处叫走以后谁接，常留到真起风才再说。 # beat:st_nine_enough_5 # scene:st_teacourt # cast:st_ye # speaker:narrator
  -> seven_ships

=== seven_ships ===
四十七岁那场大风，你带回七条船，周望海九条。第七船到港时，病客还裹着湿毯，岸上的人站在缆头等你开口。 # beat:st_seven_ships_1 # scene:st_returnport # cast:st_zhou,st_deckhand # speaker:narrator
谁带病客进去，谁还看缆？你先说，我跟着。 # beat:st_seven_ships_2 # scene:st_returnport # cast:st_zhou,st_deckhand # speaker:st_deckhand # mood:st_deckhand=uneasy
周的船也陆续靠岸，他不站在你船头等人报谁更多。 # beat:st_seven_ships_3 # scene:st_returnport # cast:st_zhou,st_deckhand # speaker:narrator
{
- st_shared_post:
接班的人出港前试过两头，病客转入以后还有人照看缆。你留在第七船到交清才走，错过了当晚原约的问手；天黑前病客进了舱，这头船工不用候夜。 # beat:st_seven_ships_4 # scene:st_returnport # cast:st_zhou,st_deckhand # speaker:narrator
这头我来。你说过的那一步，我自己走过。 # beat:st_seven_ships_5 # scene:st_returnport # cast:st_zhou,st_deckhand # speaker:st_deckhand # mood:st_deckhand=intent
- else:
你先把病客送进，绳那头的人却等着你；等你回身，岸上接位又空一处。船都带回了，你仍得守到次日补交，船工也跟着多候一夜，第二日少接一份短工。 # beat:st_seven_ships_6 # scene:st_returnport # cast:st_zhou,st_deckhand # speaker:narrator
我不是不肯接。你刚才走前，没说我能不能松。 # beat:st_seven_ships_7 # scene:st_returnport # cast:st_zhou,st_deckhand # speaker:st_deckhand # mood:st_deckhand=uneasy
}
* [先对清各人该领的工钱，把误掉的约另记下来。 # cid:st_pay_waiting]
  ~ st_wait_paid = true
  你把账页带到船工面前，先报今日各人该收的，再问有没有漏记。 # beat:st_seven_ships_8 # scene:st_returnport # cast:st_zhou,st_deckhand # speaker:narrator
  -> handoff_account
* [请船工走一次交接，再按实际多留的时辰结钱。 # cid:st_rehearse_handoff]
  ~ st_wait_paid = false
  你把绳又递回船工手里，请他从接过这一头，走到能把人送进去的地方。 # beat:st_seven_ships_9 # scene:st_returnport # cast:st_zhou,st_deckhand # speaker:narrator
  -> handoff_account

=== handoff_account ===
账在船篷下摊开。周望海又往自己的船走了几步，问第九船的交接，才折回来。 # beat:st_handoff_account_1 # scene:st_returnport # cast:st_zhou,st_deckhand # speaker:narrator
{
- st_shared_post and st_wait_paid:
账上没有候夜这一项。你按原班结清工钱，把自己错过的问手约另写一封信。 # beat:st_handoff_account_2 # scene:st_returnport # cast:st_zhou,st_deckhand # speaker:narrator
那我回家了。明早头一班，我照旧来。 # beat:st_handoff_account_3 # scene:st_returnport # cast:st_zhou,st_deckhand # speaker:st_deckhand # mood:st_deckhand=intent
}
{
- st_shared_post and not st_wait_paid:
两头原已接得上，船工再走一遍也没停住。他望望候渡的船，催你快些结清；你把这次多练的一刻另算，送他赶上离岸那班。 # beat:st_handoff_account_4 # scene:st_returnport # cast:st_zhou,st_deckhand # speaker:narrator
今日没人候夜。多占的这一刻，也记清。 # beat:st_handoff_account_5 # scene:st_returnport # cast:st_zhou,st_deckhand # speaker:st_zhou # mood:st_zhou=neutral
}
{
- not st_shared_post and st_wait_paid:
候夜和次日少接的短工，两笔都列在你这边。船工点完钱，仍问明晚是否还要这样守；你把账合上，留下听他把这一问说完。 # beat:st_handoff_account_6 # scene:st_returnport # cast:st_zhou,st_deckhand # speaker:narrator
他们得知道下次有人接，才敢先进去抬人。 # beat:st_handoff_account_7 # scene:st_returnport # cast:st_zhou,st_deckhand # speaker:st_zhou # mood:st_zhou=intent
}
{
- not st_shared_post and not st_wait_paid:
船工从缆头走到门边，另一头就空了。你给那处补人，又照实付昨夜与短工的钱；改过一遍交接，昨日候的那一夜仍在账上。 # beat:st_handoff_account_8 # scene:st_returnport # cast:st_zhou,st_deckhand # speaker:narrator
这回谁接，说给他本人听。 # beat:st_handoff_account_9 # scene:st_returnport # cast:st_zhou,st_deckhand # speaker:st_zhou # mood:st_zhou=neutral
}
-> ninth_empty

=== ninth_empty ===
四十九岁，第九席空缺，候选五人。论单打，你自认第二；定下来的却是周望海。你赢过他，这件事一点也没替你把那张椅子挪近。 # beat:st_ninth_empty_1 # scene:st_inner # cast:st_ye,st_zhou # speaker:narrator
你气了三个月没和他说话。周来取差，你把卷纸递过去；他问东港还是西港，你只指东边。他还想问哪日，你已低头找下一张。三个月后，你终于去问叶孤舟。 # beat:st_ninth_empty_2 # scene:st_inner # cast:st_ye,st_zhou # speaker:narrator
我明明赢过他，为什么不是我？ # beat:st_ninth_empty_3 # scene:st_inner # cast:st_ye,st_zhou # speaker:you
白沙屿两帮械斗，你怎么处理的？ # beat:st_ninth_empty_4 # scene:st_inner # cast:st_ye,st_zhou # speaker:st_ye # mood:st_ye=intent
打服。 # beat:st_ninth_empty_5 # scene:st_inner # cast:st_ye,st_zhou # speaker:you
三个月后是不是又打了一次？ # beat:st_ninth_empty_6 # scene:st_inner # cast:st_ye,st_zhou # speaker:st_ye # mood:st_ye=neutral
你不说话。 # beat:st_ninth_empty_7 # scene:st_inner # cast:st_ye,st_zhou # speaker:narrator
* [让他把周去过以后的事说完，不再把自己赢过周那一场插进去。 # cid:st_listen_seven_years]
  ~ st_listen_seat = true
  周后来去一趟，两边七年没再动。 # beat:st_ninth_empty_8 # scene:st_inner # cast:st_ye,st_zhou # speaker:st_ye # mood:st_ye=neutral
  这七年不是周单打比你多赢的七场，是后来真没人再被两帮喊去打。你那次打服的声势，没替三个月以后多留住一天。 # beat:st_ninth_empty_9 # scene:st_inner # cast:st_ye,st_zhou # speaker:narrator
  -> better_seat
* [问自己打完以后漏下什么，不只问周有没有向别人求助。 # cid:st_ask_missing_work]
  ~ st_listen_seat = false
  他后来把什么留在那里了？ # beat:st_ninth_empty_10 # scene:st_inner # cast:st_ye,st_zhou # speaker:you
  先把两边后来七年没再动这件事听进去。你打完，三个月又打了。 # beat:st_ninth_empty_11 # scene:st_inner # cast:st_ye,st_zhou # speaker:st_ye # mood:st_ye=neutral
  你想从周的办法里拣一句可以马上学会的，叶却没让你省掉看那七年的耐心。 # beat:st_ninth_empty_12 # scene:st_inner # cast:st_ye,st_zhou # speaker:narrator
  -> better_seat

=== better_seat ===
前年大风，你带回来几条船？ # beat:st_better_seat_1 # scene:st_inner # cast:st_ye # speaker:st_ye # mood:st_ye=neutral
七条。 # beat:st_better_seat_2 # scene:st_inner # cast:st_ye # speaker:you
周望海九条。你比他会打。他那几年，比你更适合坐那个位置。 # beat:st_better_seat_3 # scene:st_inner # cast:st_ye # speaker:st_ye # mood:st_ye=neutral
你不再有话，并不等于第二日见周就忽然心里全无不平。九席大体前位更重，却有传功、巡海、外务、守岛；不能哪天胜过第八，便自动升第八。 # beat:st_better_seat_4 # scene:st_inner # cast:st_ye # speaker:narrator
{
- st_rank_question:
当年你追问第四、第六相当于中原第几，如今又在叶孤舟面前报自己赢过周。说到一半，你把那个名次咽回去，先问白沙屿今日谁在那里。 # beat:st_better_seat_5 # scene:st_inner # cast:st_ye # speaker:narrator
- else:
你曾问平地与船上为何不同。今日坐在这间屋里，脚下又没有石坪；你把原先想报的那一场收住，改问谁接明日的巡船。 # beat:st_better_seat_6 # scene:st_inner # cast:st_ye # speaker:narrator
}
* [先向周把三个月没肯说完的话补上，不求他先夸自己大度。 # cid:st_repair_talk]
  ~ st_zhou_talk = true
  你交过来的差，我接。但下回你说谁接哪一头，我会听完。 # beat:st_better_seat_7 # scene:st_inner # cast:st_ye # speaker:you
  周把当日去处讲清，没拿这份难得的开口换一声早就该懂了。 # beat:st_better_seat_8 # scene:st_inner # cast:st_ye # speaker:narrator
  那先去看他们明早怎么出港。不是去听我讲自己做得好。 # beat:st_better_seat_9 # scene:st_inner # cast:st_zhou,st_ye # speaker:st_zhou # mood:st_zhou=intent
  -> fourteen_years
* [先随周去看白沙屿如何过今天，不把赔一句话当已补上漏掉的活。 # cid:st_repair_work]
  ~ st_zhou_talk = false
  你到白沙屿，没让两边再摆一场拳。今日争的是谁先用修船地，你得听他们把能过明日的办法说完。 # beat:st_better_seat_10 # scene:st_inner # cast:st_zhou,st_ye # speaker:narrator
  回程你向周认自己三个月话难听，他没免你这句，也没叫你把每件事都当面认输给他。 # beat:st_better_seat_11 # scene:st_inner # cast:st_zhou,st_ye # speaker:narrator
  明日我有别处。你来接这里。 # beat:st_better_seat_12 # scene:st_inner # cast:st_zhou,st_ye # speaker:st_zhou # mood:st_zhou=neutral
  -> fourteen_years

=== fourteen_years ===
四十九岁以后，白沙屿那段七年未动的日子，仍是周望海先前留下的。你接到的是今日的修船地、明日的巡海班，还有教场里等课的人。 # beat:st_fourteen_years_1 # scene:st_returnport # cast:st_zhou # speaker:narrator
今日哪处你来？不是再比七与九。 # beat:st_fourteen_years_2 # scene:st_returnport # cast:st_zhou # speaker:st_zhou # mood:st_zhou=intent
你望一眼教场，又看一眼正候潮的船。两边都有人缺，你得真选一边，再把另一边交给肯接的人。 # beat:st_fourteen_years_3 # scene:st_returnport # cast:st_zhou # speaker:narrator
{
- st_wait_paid:
你先带着工钱和时辰去问人。周把账还给你，请你也把每一班接手者叫来，当面听他们答能不能来。 # beat:st_fourteen_years_4 # scene:st_returnport # cast:st_zhou # speaker:narrator
- else:
你先请人走清两头。周看完，又替你把旁边一直等的短工叫过来；位置排得进，收工与领钱的时辰也得听本人说。 # beat:st_fourteen_years_5 # scene:st_returnport # cast:st_zhou # speaker:narrator
}
* [长些日子留在教场，把潮行和接位教给后来的人，远海交给同门。 # cid:st_life_teach]
  ~ st_life = 1
  你少跑几条自己仍想去的远线，先把早课与晚归的人分开接。周替你接远港，你替他带回来的新人多留一课，谁也没凭一张排班就同时在两地。 # beat:st_fourteen_years_6 # scene:st_returnport # cast:st_zhou # speaker:narrator
  -> sixty_three
* [长些日子留在巡海线上，带新人认港认人，教场托给同门。 # cid:st_life_patrol]
  ~ st_life = 2
  你少亲看几班刚学会的弟子，把课交给同门，再带新人上船。周问你谁接下一港，你回去真找本人说清，不把岸上的人当一声托付就永远有空。 # beat:st_fourteen_years_7 # scene:st_returnport # cast:st_zhou # speaker:narrator
  -> sixty_three

=== sixty_three ===
十四年后，六十三岁，你终于补入第九席。这回你没有先问能不能再打第八。门里出了大事，自己负责的那一块不能塌，才是这一席每天真要坐住的地方。 # beat:st_sixty_three_1 # scene:st_inner # cast:st_ye # speaker:narrator # look:st_ye=late
跟我走。镇海院。 # beat:st_sixty_three_2 # scene:st_inner # cast:st_ye # speaker:st_ye # mood:st_ye=intent
今日？ # beat:st_sixty_three_3 # scene:st_inner # cast:st_ye # speaker:you
你还要准备一张问手名单带进去？ # beat:st_sixty_three_4 # scene:st_inner # cast:st_ye # speaker:st_ye # mood:st_ye=amused
你下意识摸了一下衣襟，才笑。当年四十余岁在院里看那九招，谢观海收手后，自己站了好一会才开口。今日想起，还是先想到他放在桌边的茶碗。 # beat:st_sixty_three_5 # scene:st_inner # cast:st_ye # speaker:narrator
{
- st_zhou_talk:
今早周望海交差，照你后来肯听完的习惯，把最末那段也讲了。你原想点头便走，听到候潮时辰，又坐回去把接班的人名补齐。 # beat:st_sixty_three_6 # scene:st_inner # cast:st_ye # speaker:narrator
- else:
今早周望海把白沙屿那份单另给了你。你后来常去亲看，他便只问还缺谁；你没替没到场的人先答肯来，出门后又去找了一趟。 # beat:st_sixty_three_7 # scene:st_inner # cast:st_ye # speaker:narrator
}
* [把先想好的名次放在门外，跟他去看住在那里的人。 # cid:st_enter_light]
  ~ st_enter_plain = true
  东崖后的路不设擂台，也没有一行固定椅子等你对号。你走到院口，先闻见晒鱼的咸味。 # beat:st_sixty_three_8 # scene:st_inner # cast:st_ye # speaker:narrator
  -> dry_fish
* [问院里的人如今还做什么，带着能听见答复的问题进去。 # cid:st_ask_duty_here]
  ~ st_enter_plain = false
  先看。别认得一张旧总谱就替每个人把今天安排好了。 # beat:st_sixty_three_9 # scene:st_inner # cast:st_ye # speaker:st_ye # mood:st_ye=neutral
  门内有人拨鱼，你听见竹匾轻响，忽然觉得自己预备问的一长串还不如这一下近。 # beat:st_sixty_three_10 # scene:st_inner # cast:st_ye # speaker:narrator
  -> dry_fish

=== dry_fish ===
一个百余岁的老人蹲在院里晒鱼。叶孤舟叫师叔祖，他抬头看你。 # beat:st_dry_fish_1 # scene:st_oldyard # cast:st_ye,st_fishelder # speaker:narrator
新九席？ # beat:st_dry_fish_2 # scene:st_oldyard # cast:st_ye,st_fishelder # speaker:st_fishelder # mood:st_fishelder=neutral
是。第九。 # beat:st_dry_fish_3 # scene:st_oldyard # cast:st_ye,st_fishelder # speaker:you
这么年轻？ # beat:st_dry_fish_4 # scene:st_oldyard # cast:st_ye,st_fishelder # speaker:st_fishelder # mood:st_fishelder=amused
你六十三，头回听人这样说。他叫你打一手，你把后脚收了半寸，刚摆架，胸口已被一根手指点住。你还没想好该不该再来，他已转身去翻鱼了。 # beat:st_dry_fish_5 # scene:st_oldyard # cast:st_ye,st_fishelder # speaker:narrator
还行。 # beat:st_dry_fish_6 # scene:st_oldyard # cast:st_ye,st_fishelder # speaker:st_fishelder # mood:st_fishelder=neutral
* [问刚才自己哪里先被看见，不要老人为一声还行再打一场给你认榜。 # cid:st_ask_again_small]
  ~ st_fish_question = true
  我刚才脚还没走。 # beat:st_dry_fish_7 # scene:st_oldyard # cast:st_ye,st_fishelder # speaker:you
  手也还没走？ # beat:st_dry_fish_8 # scene:st_oldyard # cast:st_ye,st_fishelder # speaker:st_fishelder # mood:st_fishelder=amused
  你低头看自己举起的那只手，老人已把另一面鱼翻过来。你得自己把刚才那一下再试，不是再问三遍他到底排第几。 # beat:st_dry_fish_9 # scene:st_oldyard # cast:st_ye,st_fishelder # speaker:narrator
  -> old_depth
* [先收架，让他晒完这一面，自己在旁重走一遍，不急着求再一指。 # cid:st_try_after_stop]
  ~ st_fish_question = false
  你才动，便想起刚才肩上那点先紧。老人没抬头替你判对错，只叫你往旁边半步，别挡太阳。 # beat:st_dry_fish_10 # scene:st_oldyard # cast:st_ye,st_fishelder # speaker:narrator
  好。 # beat:st_dry_fish_11 # scene:st_oldyard # cast:st_ye,st_fishelder # speaker:you
  你真的让开，没把自己的问武当整座院子都该先停的事。 # beat:st_dry_fish_12 # scene:st_oldyard # cast:st_ye,st_fishelder # speaker:narrator
  -> old_depth

=== old_depth ===
你回头看那位老人，没问出他的确切境界。院里另有人收竹匾，叶孤舟同他招手；这扇门后，退下去的前辈并没有随着旧席次一同消失。 # beat:st_old_depth_1 # scene:st_oldyard # cast:st_ye # speaker:narrator
门中旧录有门主返真、院里仍有返真旧人的年代，也记过衰时。最高层传承少有全断，常是前一代仍在，后一代已接了差。 # beat:st_old_depth_2 # scene:st_oldyard # cast:st_ye # speaker:narrator
出去还有你的差。别看见院后有老人，就当外头可以不接。 # beat:st_old_depth_3 # scene:st_oldyard # cast:st_ye # speaker:st_ye # mood:st_ye=intent
如今门主叶沧溟列总谱第三，也不能由此证明他便是全门最强。一个后来的弟子在楼下等你，问到这里，眼睛还等着一个比第三更响的数字。 # beat:st_old_depth_4 # scene:st_oldyard # cast:st_ye # speaker:narrator
{
- st_condition_excuse:
当年问叶孤舟是不是状态不好，话一出口，自己都觉得该有别的解释。如今胸口那一指还在，你先把想问老人是不是趁你没备好的话压住。 # beat:st_old_depth_5 # scene:st_oldyard # cast:st_ye # speaker:narrator
- else:
当年问他每手既知道为何还输，如今这一指，也没给你多出一手的工夫。你把方才准备进的那一步在心里重走，仍没问出晒鱼老人的确切境界。 # beat:st_old_depth_6 # scene:st_oldyard # cast:st_ye # speaker:narrator
}
* [直说不知道，把自己看见与没看见的都留清。 # cid:st_say_unknown]
  ~ st_last_unknown = true
  不知道。 # beat:st_old_depth_7 # scene:st_oldyard # cast:st_ye # speaker:you
  这句倒可以说得响一点。 # beat:st_old_depth_8 # scene:st_oldyard # cast:st_ye # speaker:st_ye # mood:st_ye=amused
  你笑起来。叶孤舟让开门边，你这才看见候在外面的弟子还拿着出港单，方才一直不敢催。 # beat:st_old_depth_9 # scene:st_oldyard # cast:st_ye # speaker:narrator
  -> last_look
* [说明总谱第三是能核的名次，最强却不能替院里没出手的人答，再带后来人去接差。 # cid:st_point_next_work]
  ~ st_last_unknown = false
  第三是现今总谱写的。是不是全门最强，我不知道。 # beat:st_old_depth_10 # scene:st_oldyard # cast:st_ye # speaker:you
  弟子还想问，出港单的纸角已经被他捏皱。你先问哪条船，他低头找了一回，又翻到背面，把来接班的人名报给你。 # beat:st_old_depth_11 # scene:st_oldyard # cast:st_ye # speaker:narrator
  -> last_look

=== last_look ===
望海楼门内，旧话每天都在：所见之海，非海之尽。十二岁的你曾以为楼最高，近三十以为九席最高；到六十三，走过九席门口，又见门后的日子仍有人在接。 # beat:st_last_look_1 # scene:st_tower # cast:st_an # speaker:narrator # look:st_an=late
新九席，今日还认得白螺屿来的船么？ # beat:st_last_look_2 # scene:st_tower # cast:st_an # speaker:st_an # mood:st_an=amused
先看你这回哪只手来接绳。 # beat:st_last_look_3 # scene:st_tower # cast:st_an # speaker:you
阿岑也老了，笑时仍先看泊位，不让回忆把别人的船挡在外头。 # beat:st_last_look_4 # scene:st_tower # cast:st_an # speaker:narrator
{
- st_exchange_drill:
早年一起换手练的习惯，他又教给后来人。有人解得比他慢，他等那一下，没因自己一直做得到便替旁人的手一把全做完。 # beat:st_last_look_5 # scene:st_tower # cast:st_an # speaker:narrator
- else:
旧腕阴天仍会酸，他不再拿伤替别人换一声勇敢。新人来接，他把那一扣教到对方真能解，再把绳松过去；你少赶那一班夜课，同他等到最后一轮试完。 # beat:st_last_look_6 # scene:st_tower # cast:st_an # speaker:narrator
}
{
- st_life == 1:
今日你带新人回小船。船一晃，他先想钉住自己，你在旁边问下一步。远港的信到门里，你没亲去，先读给接了那趟的人听，再回头等学生自己从不稳里走出来。 # beat:st_last_look_7 # scene:st_latepier # cast:st_an # speaker:narrator
这一回不把整条船都替他站了？ # beat:st_last_look_8 # scene:st_latepier # cast:st_an # speaker:st_an # mood:st_an=amused
他得有地方走。 # beat:st_last_look_9 # scene:st_latepier # cast:st_an # speaker:you
- else:
今日你随新人候潮。他问还要不要先记中原第几，你让他先认这一港谁接、下一港能问谁。岸上那班课已交给同门，你想回头看看，终究等船先把这一程走完。 # beat:st_last_look_10 # scene:st_latepier # cast:st_an # speaker:narrator
回来别替他们把课也全重教一遍。 # beat:st_last_look_11 # scene:st_latepier # cast:st_an # speaker:st_an # mood:st_an=amused
那回来先听他们讲。 # beat:st_last_look_12 # scene:st_latepier # cast:st_an # speaker:you
}
{
- st_life == 1 and st_first_rail:
学生把栏抓得指节发白，像十二岁那回的你。你把自己的手放在旁边，让他先握着，又等他肯松开一指，才把船再晃一下。 # beat:st_last_look_13 # scene:st_latepier # cast:st_an # speaker:narrator
}
{
- st_life == 1 and not st_first_rail:
学生坐在船边等浪过去，你也同他坐一会。十二岁时那位老人挪开空桶等过你；这回你先把学生脚边的杂物挪开。 # beat:st_last_look_14 # scene:st_latepier # cast:st_an # speaker:narrator
}
{
- st_life == 2 and st_first_rail:
新人伸手抓栏，你记得十二岁沾过的那一点湿木屑，把还没收好的绳往里理了理。等他站好，才叫岸上把这一头松开。 # beat:st_last_look_15 # scene:st_latepier # cast:st_an # speaker:narrator
}
{
- st_life == 2 and not st_first_rail:
新人催着出港，你却请他等过眼前这一波。十二岁时你等船回落才站，今日等的是岸上那只手真正松开，少等一口气都不行。 # beat:st_last_look_16 # scene:st_latepier # cast:st_an # speaker:narrator
}
-> beyond_sea

=== beyond_sea ===
后来整理口述的人仍会问沈见潮，海天门到底有多高。他留下九招、七船与九船，也留下那句不知道。没有一个后来人需要先把海问完，才有资格把今天这一船接住。 # beat:st_beyond_sea_1 # scene:st_horizon # cast:none # speaker:narrator
楼外向东，仍有海。 # beat:st_beyond_sea_2 # scene:st_horizon # cast:none # speaker:narrator
{
- st_life == 1:
你把船晃起来，让后来人自己迈下一步。没有人永远站稳，课却可以一直有人接。 # beat:st_beyond_sea_3 # scene:st_horizon # cast:none # speaker:narrator # ending:st_next_step
-> END
- else:
下一港还没入眼，接班的人已经在船头。你不替他报一个海的尽头，只把能问下一句的地方指给他。 # beat:st_beyond_sea_4 # scene:st_horizon # cast:none # speaker:narrator # ending:st_next_watch
-> END
}
