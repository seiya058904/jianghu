// Canon8252–11849; explicit separate eras/POVs. No definite Qi lifespan, no secret sword upgrade, no invented old-bout scores.
VAR ws_admit = false
VAR ws_gap = false
VAR ws_second = false
VAR ws_reason = false
VAR ws_wait_name = false
VAR ws_no_result = false
VAR ws_today = false
VAR ws_unknown = false
VAR ws_own_ground = false
VAR ws_gu_notes = false
VAR ws_record_bound = false
VAR ws_slow = false
VAR ws_after = 0
-> twelve_days

=== twelve_days ===
约三百余年前，雪灾后的昆仑。你是被叫来接古步的一名弟子。九月大雪，十一月后连续数十日风雪，旧道全断，一处崩坡压掉旧院。 # beat:ws_twelve_days_1 # scene:ws_snow # cast:none # speaker:narrator
三位老人罹难，分掌内剑、最高吐纳一支与这套古步。教你的老人被挖出，还活着。你们后来才知道，只剩十二日。 # beat:ws_twelve_days_2 # scene:ws_snow # cast:none # speaker:narrator
安置老人的是另一间没有塌的屋子。进来的人先在门口放下沾雪的鞋。 # beat:ws_twelve_days_3 # scene:ws_room # cast:ws_stepelder # speaker:narrator
再走。 # beat:ws_twelve_days_4 # scene:ws_room # cast:ws_stepelder # speaker:ws_stepelder # mood:ws_stepelder=neutral
你记了口诀，脚下形也对上。他听你喘，没让人先把谱收成已经传完。 # beat:ws_twelve_days_5 # scene:ws_room # cast:ws_stepelder # speaker:narrator
* [将每次接不上处另记，先告诉同来的人自己还不知道什么。 # cid:ws_note_break]
  ~ ws_admit = true
  这一处口诀会背，身子却接不过去。 # beat:ws_twelve_days_6 # scene:ws_room # cast:ws_stepelder # speaker:you
  记着。别替我补一句你以为的。 # beat:ws_twelve_days_7 # scene:ws_room # cast:ws_stepelder # speaker:ws_stepelder # mood:ws_stepelder=neutral
  纸边空下一块，比你已写满的地方更扎眼。 # beat:ws_twelve_days_8 # scene:ws_room # cast:ws_stepelder # speaker:narrator
  -> last_step
* [先把还能示出的形逐次记全，再回来问最后不连贯的一处。 # cid:ws_note_shape]
  ~ ws_admit = false
  老人点一次，你补一次，纸上渐满。问回那一处时，他已需要先歇。你把问题折在最上面，没敢说都懂了。 # beat:ws_twelve_days_9 # scene:ws_room # cast:ws_stepelder # speaker:narrator
  -> last_step

=== last_step ===
十二日太短。老人去世时，你会形，会口诀，也知道怎么练。最后那一段究竟应当是什么，却没有因此跟着留在纸上。 # beat:ws_last_step_1 # scene:ws_room # cast:none # speaker:narrator
你们又试了三年，才真正承认：断了一截。不是全失，也不是多抄几遍便能将缺处补齐。 # beat:ws_last_step_2 # scene:ws_room # cast:none # speaker:narrator
{
- ws_admit:
三年后翻纸，来帮你的人先看见留白。他没照那一段作示范，先问你当时卡住在哪里。你能将那一脚再走给他看，却仍不能给出老人没教完的答案。 # beat:ws_last_step_3 # scene:ws_room # cast:none # speaker:narrator
- else:
三年后有人照纸上满满的形练，到了折着的那一处才停。他问原来这里也没接上，你只得从头讲起；那张纸看着更齐，仍没有多留下一步。 # beat:ws_last_step_4 # scene:ws_room # cast:none # speaker:narrator
}
* [将缺处如实留给内议，不用自己的顺手写成祖传最后一步。 # cid:ws_keep_gap]
  ~ ws_gap = true
  你带去的不只一卷抄本，还有一处承认不会的停顿。 # beat:ws_last_step_5 # scene:ws_room # cast:none # speaker:narrator
  -> white_council
* [请当时同来的弟子一道去，让他说明老人停在何处，不由你一个人担作全会。 # cid:ws_bring_witness]
  ~ ws_gap = false
  对方再看你走，指出另一次喘息。那不是补回失传，却让议事的人不只听见一个人的记忆。 # beat:ws_last_step_6 # scene:ws_room # cast:none # speaker:narrator
  -> white_council

=== white_council ===
视角换到雪灾后三年。你是昆仑掌门陆照寒。后来山外将这次内议称白石之议，究竟是不是在白石谷开的，外人并不确定。 # beat:ws_white_council_1 # scene:ws_court # cast:ws_swordelder # speaker:narrator
弟子把古步的缺处摆在眼前。有人说人少易断，多收人便是。你摇头：人多不是昆仑。 # beat:ws_white_council_2 # scene:ws_court # cast:ws_swordelder # speaker:narrator
人可以少。路不能只剩一个人。 # beat:ws_white_council_3 # scene:ws_court # cast:ws_swordelder # speaker:you
祖宗几百年都这样传，何必改？ # beat:ws_white_council_4 # scene:ws_court # cast:ws_swordelder # speaker:ws_swordelder # mood:ws_swordelder=sharp
祖宗也没见这场雪。 # beat:ws_white_council_5 # scene:ws_court # cast:ws_swordelder # speaker:you
老剑师说自己练剑八十年，看掌做什么。你问若明日他死，弟子卡住最后一步，山里还有谁知道卡在哪里。他没有立刻再答。 # beat:ws_white_council_6 # scene:ws_court # cast:ws_swordelder # speaker:narrator # fact:ws_snow_gap
{
- ws_gap:
你把不会的那一处也摆到议事上。省了我再问一遍的功夫。 # beat:ws_white_council_7 # scene:ws_court # cast:ws_swordelder # speaker:ws_swordelder # mood:ws_swordelder=calm
那一处空着，屋里便没有人敢说已经接完；后来的抄本上也就留着这道缺口。 # beat:ws_white_council_8 # scene:ws_court # cast:ws_swordelder # speaker:narrator
- else:
你说带了当日同来的人。那我只问他一句：老人最后那一下，是不是也没做完。 # beat:ws_white_council_9 # scene:ws_court # cast:ws_swordelder # speaker:ws_swordelder # mood:ws_swordelder=sharp
他答不上来。于是没有人再提"多收人自然传得下去"。 # beat:ws_white_council_10 # scene:ws_court # cast:ws_swordelder # speaker:narrator
}
* [先为一脉找第二个能理解的人，向老人讲明并非叫人照抄全部秘谱。 # cid:ws_find_second]
  ~ ws_second = true
  不是让别人教你的剑。至少让别人知道，你在做什么。 # beat:ws_white_council_11 # scene:ws_court # cast:ws_swordelder # speaker:you
  老人将卷挪过半寸，只让另脉先看一个停处。你没替他宣布从此愿意尽传。 # beat:ws_white_council_12 # scene:ws_court # cast:ws_swordelder # speaker:narrator
  -> second_person
* [请弟子重走失败的一段，先让另一脉说看到了什么，再谈由谁接。 # cid:ws_show_failure]
  ~ ws_second = false
  来看的老人没有改教那套古步，只问气息为什么在这里断。原来两个彼此不肯看的房门，也能从同一个问题开始开。 # beat:ws_white_council_13 # scene:ws_court # cast:ws_swordelder # speaker:narrator
  -> second_person

=== second_person ===
第二人不必走同一条路，却须知道为何这样走、断在哪里，第一人突然不在后从哪继续找。并非人人互抄最高秘谱，更不是广开山门便能解决。 # beat:ws_second_person_1 # scene:ws_room # cast:ws_swordelder # speaker:narrator
几十年里山外几乎看不出结果，没有突然多三个返真。一位老人早死，旁人知道弟子卡在哪；一个弟子不适合，另脉看出他正在硬凑。 # beat:ws_second_person_2 # scene:ws_room # cast:ws_swordelder # speaker:narrator
昆仑仍小，最高处仍会有起落。只是一些本会跟人一起消失的事，终于有人再问得下去。 # beat:ws_second_person_3 # scene:ws_room # cast:ws_swordelder # speaker:narrator
{
- ws_second:
你替我找的第二人，昨日没来学剑。他来问，我那弟子为何总在这里喘。 # beat:ws_second_person_4 # scene:ws_room # cast:ws_swordelder # speaker:ws_swordelder # mood:ws_swordelder=neutral
你请老人先回答这个。最初只肯给人看的一个停处，终于不再只存于他的记性。 # beat:ws_second_person_5 # scene:ws_room # cast:ws_swordelder # speaker:narrator
- else:
那日叫我看弟子失败，原还不服。昨日另脉又来问，我便知道他不是只来看一次热闹。 # beat:ws_second_person_6 # scene:ws_room # cast:ws_swordelder # speaker:ws_swordelder # mood:ws_swordelder=neutral
你请他讲当时怎样认出来，不给他再添一项代教所有支脉的虚名。 # beat:ws_second_person_7 # scene:ws_room # cast:ws_swordelder # speaker:narrator
}
* [把另一脉看懂了什么留在卷后，而不只记谁又学了一式。 # cid:ws_record_reason]
  ~ ws_reason = true
  卷后添的是此处为什么不能强练，不是一张又多一门神功的名目。 # beat:ws_second_person_8 # scene:ws_room # cast:ws_swordelder # speaker:narrator
  -> eastward_letter
* [让接手的人亲口复述，发现仍含糊的地方就再请老人回来。 # cid:ws_record_next]
  ~ ws_reason = false
  我以为这一句你知道。 # beat:ws_second_person_9 # scene:ws_room # cast:ws_swordelder # speaker:ws_swordelder # mood:ws_swordelder=uneasy
  话说出来，他又坐回原位。这一回多占半日，下一回少一个以为。 # beat:ws_second_person_10 # scene:ws_room # cast:ws_swordelder # speaker:narrator
  -> eastward_letter

=== eastward_letter ===
另一个年代，你是祁玄岳，六十余岁。少年时老师嫌你总问为什么，你说山每天不一样；三十以后各路揉进自身，四十比三十少，五十又少。 # beat:ws_eastward_letter_1 # scene:ws_snow # cast:ws_messenger # speaker:narrator
这次下山为送一封压了多年的旧信。原该送的人病死，后来几次错过，如今交到你手里。 # beat:ws_eastward_letter_2 # scene:ws_snow # cast:ws_messenger # speaker:narrator
认识去少林的路么？ # beat:ws_eastward_letter_3 # scene:ws_snow # cast:ws_messenger # speaker:ws_messenger # mood:ws_messenger=neutral
不认识。 # beat:ws_eastward_letter_4 # scene:ws_snow # cast:ws_messenger # speaker:you
那怎么去？ # beat:ws_eastward_letter_5 # scene:ws_snow # cast:ws_messenger # speaker:ws_messenger # mood:ws_messenger=neutral
往东。 # beat:ws_eastward_letter_6 # scene:ws_snow # cast:ws_messenger # speaker:you
别人追问是否顺道找总谱第一。那人返真约七八年，你说不用——自己想找的，是已经在里面走了几十年的人。不是说他不高，是要问的事不同。 # beat:ws_eastward_letter_7 # scene:ws_snow # cast:ws_messenger # speaker:narrator
{
- ws_reason:
前代旧卷后留的那句我看了。写的是为什么不能强练，不是又一门名目。 # beat:ws_eastward_letter_8 # scene:ws_snow # cast:ws_messenger # speaker:ws_messenger # mood:ws_messenger=neutral
雪灾后留下的记法，仍有人沿用。如今接手的人先问哪里断，不问学成几式。 # beat:ws_eastward_letter_9 # scene:ws_snow # cast:ws_messenger # speaker:narrator
- else:
前代旧卷里记着，接手的人复述到一半就卡住了。我读到这里，也还没弄懂。 # beat:ws_eastward_letter_10 # scene:ws_snow # cast:ws_messenger # speaker:ws_messenger # mood:ws_messenger=uneasy
你请他把旧卷拿来，将他今日卡住的地方另记在旁，没替前人改成当时已经讲透。 # beat:ws_eastward_letter_11 # scene:ws_snow # cast:ws_messenger # speaker:narrator
}
* [先问少林后山法晦能否见，得到不见外客的答复，就在山下住。 # cid:ws_ask_old_name]
  ~ ws_wait_name = true
  法晦百岁前已退门务，撤名数十年，返真后又走三十余年。你没因知道他的旧名，便觉得今日门应当由自己推开。 # beat:ws_eastward_letter_12 # scene:ws_snow # cast:ws_messenger # speaker:narrator
  -> thirteenth_day
* [先送妥旧信，再把想见法晦的话递入，不借送信的旧情逼他动手。 # cid:ws_deliver_first]
  ~ ws_wait_name = false
  信有人接，你的事还没有答复。你住到山下去，没将二者混作只欠自己的一件事。 # beat:ws_eastward_letter_13 # scene:ws_snow # cast:ws_messenger # speaker:narrator
  -> thirteenth_day

=== thirteenth_day ===
第一日，第二日，直到第七日，你仍在。少林人来问等什么。 # beat:ws_thirteenth_day_1 # scene:ws_monkgate # cast:ws_visitor # speaker:narrator
等他想见。 # beat:ws_thirteenth_day_2 # scene:ws_monkgate # cast:ws_visitor # speaker:you
第十三日，山上传下“上来”。不是门人被你打服，不是十三日换得一张总谱帖。 # beat:ws_thirteenth_day_3 # scene:ws_monkgate # cast:ws_visitor # speaker:narrator
{
- ws_wait_name:
你是为见人上山，还是为送信上山，我们分得开。 # beat:ws_thirteenth_day_4 # scene:ws_monkgate # cast:ws_visitor # speaker:ws_visitor # mood:ws_visitor=neutral
你先问的是法晦还能不能见，信的事摆在后面；门里便也只按这一件来回你。 # beat:ws_thirteenth_day_5 # scene:ws_monkgate # cast:ws_visitor # speaker:narrator
- else:
信先送妥，话后递到。两件事分开，门里便也分开来回你。 # beat:ws_thirteenth_day_6 # scene:ws_monkgate # cast:ws_visitor # speaker:ws_visitor # mood:ws_visitor=calm
你没有借送信的旧情去逼那位老人动手；信有人接，你的事另等答复。 # beat:ws_thirteenth_day_7 # scene:ws_monkgate # cast:ws_visitor # speaker:narrator
}
这场只有极少数少林高层在，昆仑只有你一人。法晦不用兵器，你也未拔剑。前二十余不显，三十以后方丈少言，五十以后旁边老僧闭眼，难判断下一手在哪里。 # beat:ws_thirteenth_day_8 # scene:ws_trial # cast:ws_fahui # speaker:narrator
第九十七手，法晦先停，你也停。他问练什么。 # beat:ws_thirteenth_day_9 # scene:ws_trial # cast:ws_fahui # speaker:narrator
昆仑。 # beat:ws_thirteenth_day_10 # scene:ws_trial # cast:ws_fahui # speaker:you
不像。 # beat:ws_thirteenth_day_11 # scene:ws_trial # cast:ws_fahui # speaker:ws_fahui # mood:ws_fahui=amused
他们也这么说。 # beat:ws_thirteenth_day_12 # scene:ws_trial # cast:ws_fahui # speaker:you
老人笑了。旧册只留试手九十七、法晦先止，没有胜负。多年后他对弟子说，再打也许不会马上输，却只能等你先错。这不是当场宣布认负。 # beat:ws_thirteenth_day_13 # scene:ws_trial # cast:ws_fahui # speaker:narrator # fact:ws_ninety_seven
* [将这一场停在双方都收手的地方，继续问别山上一代还剩谁。 # cid:ws_keep_no_result]
  ~ ws_no_result = true
  你带走的是已经见过的手，不是要旁人替自己补的一个胜字。 # beat:ws_thirteenth_day_14 # scene:ws_trial # cast:ws_fahui # speaker:narrator
  -> old_palm
* [离山后向接待者问退谱多久、是否还愿见人，先查清要见的仍是谁。 # cid:ws_ask_deep_years]
  ~ ws_no_result = false
  年轻弟子有些名字从未听过，要送进山后请老人辨。你等着，没有因为答得慢便改问现榜最高的人。 # beat:ws_thirteenth_day_15 # scene:ws_trial # cast:ws_fahui # speaker:narrator
  -> old_palm

=== old_palm ===
十余年问山，你走过中原、西北与西域。可靠互证只有十一场，六场明确胜，五场未定，没有一场能确认你败。不是见完天下，也不是十一场全胜。 # beat:ws_old_palm_1 # scene:ws_trial # cast:ws_dongxuan # speaker:narrator
太极司马洞玄，是四十多年前旧总谱第一，退位后又在山中三十余年。门人听你问还在么，脸色都变了。老人却肯见。 # beat:ws_old_palm_2 # scene:ws_trial # cast:ws_dongxuan # speaker:narrator
你们试了一整日，中间喝水、坐过，再继续，招数已无人算清。日将暮，洞玄弃先手，只守；又过许久，他自己停。 # beat:ws_old_palm_3 # scene:ws_trial # cast:ws_dongxuan # speaker:narrator
今日是你高。 # beat:ws_old_palm_4 # scene:ws_trial # cast:ws_dongxuan # speaker:ws_dongxuan # mood:ws_dongxuan=neutral
前辈年轻二十年呢？ # beat:ws_old_palm_5 # scene:ws_trial # cast:ws_dongxuan # speaker:you
你这人真不会说话。 # beat:ws_old_palm_6 # scene:ws_trial # cast:ws_dongxuan # speaker:ws_dongxuan # mood:ws_dongxuan=amused
你认真等。 # beat:ws_old_palm_7 # scene:ws_trial # cast:ws_dongxuan # speaker:narrator
不知道。但我还是想打。 # beat:ws_old_palm_8 # scene:ws_trial # cast:ws_dongxuan # speaker:ws_dongxuan # mood:ws_dongxuan=neutral
{
- ws_no_result:
法晦那场没定胜负，不用替他添。我今日说你高，是今日这一场。 # beat:ws_old_palm_9 # scene:ws_trial # cast:ws_dongxuan # speaker:ws_dongxuan # mood:ws_dongxuan=calm
洞玄亲口认的是今日；法晦先止而未定胜负的九十七手，仍照原来的记法留着。 # beat:ws_old_palm_10 # scene:ws_trial # cast:ws_dongxuan # speaker:narrator
- else:
你先问我退谱多久、还见不见人，再问我愿不愿试。这一问，比试手难答。 # beat:ws_old_palm_11 # scene:ws_trial # cast:ws_dongxuan # speaker:ws_dongxuan # mood:ws_dongxuan=amused
离开时你知道要见的是今日这个人，不是四十多年前那张榜上的名字。 # beat:ws_old_palm_12 # scene:ws_trial # cast:ws_dongxuan # speaker:narrator
}
* [向他谢今日肯试，不用年轻二十年这个未知假设抹掉他现在的深处。 # cid:ws_ask_today]
  ~ ws_today = true
  老人喝水时还在比方才一处，你看他比完，没替他把一生最高定在四十年前那张榜上。 # beat:ws_old_palm_13 # scene:ws_trial # cast:ws_dongxuan # speaker:narrator
  -> two_old_swords
* [先把水递还，让刚才停过的两个人歇一歇，不催一场立刻再证的比试。 # cid:ws_rest_water]
  ~ ws_today = false
  还以为你不懂得停。 # beat:ws_old_palm_14 # scene:ws_trial # cast:ws_dongxuan # speaker:ws_dongxuan # mood:ws_dongxuan=amused
  你坐回去。歇息不算认输，方才那句今日也不变成永远。 # beat:ws_old_palm_15 # scene:ws_trial # cast:ws_dongxuan # speaker:narrator
  -> two_old_swords

=== two_old_swords ===
八卦藏山公姓慕容，名已不可考，从不入世榜。第一日论，第二日打到夜里，第三日继续，仍无明确胜负。 # beat:ws_two_old_swords_1 # scene:ws_room # cast:ws_cangshan # speaker:narrator
你要找什么？ # beat:ws_two_old_swords_2 # scene:ws_room # cast:ws_cangshan # speaker:ws_cangshan # mood:ws_cangshan=neutral
不知道。有人让我停下，大概就是。 # beat:ws_two_old_swords_3 # scene:ws_room # cast:ws_cangshan # speaker:you
我让你停下了么？ # beat:ws_two_old_swords_4 # scene:ws_room # cast:ws_cangshan # speaker:ws_cangshan # mood:ws_cangshan=neutral
你摇头，他笑，叫你继续找。三日后藏山公闭门一月，没人知道想什么，不能据此添一场败。 # beat:ws_two_old_swords_5 # scene:ws_room # cast:ws_cangshan # speaker:narrator
{
- ws_today:
洞玄肯同你说今日高低，便留在他那一场。这里的三日，你也亲自看过了。 # beat:ws_two_old_swords_6 # scene:ws_room # cast:ws_cangshan # speaker:ws_cangshan # mood:ws_cangshan=calm
三日之后藏山公闭门一月，所思为何无人知道；洞玄那一场有认高的话，这一场却不能照添。 # beat:ws_two_old_swords_7 # scene:ws_room # cast:ws_cangshan # speaker:narrator
- else:
洞玄同你歇过、喝水再打，我也听说了。在这里坐三日，你还不急着走。 # beat:ws_two_old_swords_8 # scene:ws_room # cast:ws_cangshan # speaker:ws_cangshan # mood:ws_cangshan=amused
你谢他肯留三日，不拿洞玄一场的认高，替眼前这个仍未定胜负的老人认输。 # beat:ws_two_old_swords_9 # scene:ws_room # cast:ws_cangshan # speaker:narrator
}
华山陆归藏退位五十余年，旧谱最高第四，百岁以后反比列榜时深。你住十八日未见，第十九清晨童子叫你自行上旧栈道。 # beat:ws_two_old_swords_10 # scene:ws_cliff # cast:ws_guicang # speaker:narrator
六十余招，陆先收剑，不是认输。他说你并非来看他能不能赢，他也不是证明仍能赢；想看的东西，六十招够看。 # beat:ws_two_old_swords_11 # scene:ws_cliff # cast:ws_guicang # speaker:narrator
够了。 # beat:ws_two_old_swords_12 # scene:ws_cliff # cast:ws_guicang # speaker:ws_guicang # mood:ws_guicang=neutral
你想了很久，下山。后来只对昆仑弟子说华山那老人很好，没再往下讲。 # beat:ws_two_old_swords_13 # scene:ws_cliff # cast:ws_guicang # speaker:narrator # fact:ws_old_people
* [有人问是否天下第一，只答天下太大，没有刚好全见过。 # cid:ws_keep_unknown]
  ~ ws_unknown = true
  后来总谱愿列你第一时，你答随便；若不列，更好。一版旧谱曾列极前，下一版多年不见便撤，纸都写不全你问过的人。 # beat:ws_two_old_swords_14 # scene:ws_cliff # cast:ws_guicang # speaker:narrator
  -> six_students
* [有人索旧战细节，只保留愿意被确认的记录，不替不愿露面的老人作主。 # cid:ws_keep_privacy]
  ~ ws_unknown = false
  有宗门只承认见过，有的连仍活着都不愿传。可靠的十一场止于可互证的地方，没有资料并不等于败，也不等于你可自行报胜。 # beat:ws_two_old_swords_15 # scene:ws_cliff # cast:ws_guicang # speaker:narrator
  -> six_students

=== six_students ===
下山十余年，你回昆仑。雪大，守谷弟子没认得，问从哪里来。 # beat:ws_six_students_1 # scene:ws_snow # cast:ws_gatekeeper # speaker:narrator
外面。 # beat:ws_six_students_2 # scene:ws_snow # cast:ws_gatekeeper # speaker:you
老人出来才认出你。再问外面还有高手么，你说有；问是谁，你说不知道。天下那么大，不可能刚好全见过。 # beat:ws_six_students_3 # scene:ws_snow # cast:ws_gatekeeper # speaker:narrator
此后你不再长期下山。门中挑六位本已极高的人正式随学，两个后来入化，最强晚年到返真门前极深，却无一个学成你。 # beat:ws_six_students_4 # scene:ws_snow # cast:ws_gatekeeper # speaker:narrator
又练十年，还是如此。他们剑、步、呼吸都学得会，合起来便不是。你终于先叫他们别学。 # beat:ws_six_students_5 # scene:ws_snow # cast:ws_gatekeeper # speaker:narrator
这一刻你仍是祁玄岳，六名弟子坐在面前。顾寒声最不肯放，那柄剑收回时，连停的样子都像你。 # beat:ws_six_students_6 # scene:ws_room # cast:ws_gu # speaker:narrator
是弟子资质不够？ # beat:ws_six_students_7 # scene:ws_room # cast:ws_gu # speaker:ws_gu # mood:ws_gu=uneasy
不是。我没有东西能教。 # beat:ws_six_students_8 # scene:ws_room # cast:ws_gu # speaker:you
你说剑、步、吐纳都是结果，根在自己这里：几十年山里何时喘、哪块石会滑，见过的人、怕过的事，已全在一起。他们学的只是最后做出来的样子。 # beat:ws_six_students_9 # scene:ws_room # cast:ws_gu # speaker:narrator # fact:ws_cannot_copy
{
- ws_unknown:
外面问您是不是天下第一，您答不知道。那我们学不成，是不是也不算丢您的人。 # beat:ws_six_students_10 # scene:ws_room # cast:ws_gu # speaker:ws_gu # mood:ws_gu=uneasy
总谱愿列你第一时你答随便，不列更好。顾寒声这一句，你没有答。 # beat:ws_six_students_11 # scene:ws_room # cast:ws_gu # speaker:narrator
- else:
有些宗门不愿让人知道有人见过他们的人。您替他们留着。那我们学不成，也就学不成。 # beat:ws_six_students_12 # scene:ws_room # cast:ws_gu # speaker:ws_gu # mood:ws_gu=neutral
可靠的十一场止在可互证的地方；没有人因为资料少，就替你报一场胜或一场败。 # beat:ws_six_students_13 # scene:ws_room # cast:ws_gu # speaker:narrator
}
* [请顾指出自己刚才先看哪块地，不替他报出你记得的那一块。 # cid:ws_ask_own_stone]
  ~ ws_own_ground = true
  我……先照您的脚。 # beat:ws_six_students_14 # scene:ws_room # cast:ws_gu # speaker:ws_gu # mood:ws_gu=neutral
  他低头再看。你没替这一眼叫出返真的名字，只让他先说清自己的身子站在哪里。 # beat:ws_six_students_15 # scene:ws_room # cast:ws_gu # speaker:narrator
  -> gu_stops
* [请顾说自己怕哪一步接不上，不把照做无错当成已知道为什么。 # cid:ws_ask_own_fear]
  ~ ws_own_ground = false
  怕不像。 # beat:ws_six_students_16 # scene:ws_room # cast:ws_gu # speaker:ws_gu # mood:ws_gu=uneasy
  他答得很轻，仍是实话。你把本来要讲的下一步收住，他还没有准备让旁人替这件事改一个好听名字。 # beat:ws_six_students_17 # scene:ws_room # cast:ws_gu # speaker:narrator
  -> gu_stops

=== gu_stops ===
视角换成顾寒声。你模仿了二十余年，年轻门人夸像祖师，你也高兴。祁玄岳叫你完整走一遍，看完说很好，接着说不要再练了。 # beat:ws_gu_stops_1 # scene:ws_court # cast:ws_qi # speaker:narrator
你越来越像我，所以越来越不像你。 # beat:ws_gu_stops_2 # scene:ws_court # cast:ws_qi # speaker:ws_qi # mood:ws_qi=neutral
你当日放下剑，三个月没练。老人的那句很好，没有因后一句便成了从未说过；但你不能再只为那两个字走。 # beat:ws_gu_stops_3 # scene:ws_court # cast:ws_qi # speaker:narrator
三个月后重新拿剑，第一件事是删。二十多年学来的样子，一点点拆。你最后没有返真，却成为下一代极重要的人，不靠突然学会一部祖师最高剑。 # beat:ws_gu_stops_4 # scene:ws_court # cast:ws_qi # speaker:narrator
{
- ws_own_ground:
你想起祁玄岳问先看哪块地。今日第一遍，先将自己的落脚说给同伴，再请他看；没有那句我先照您的脚替自己挡过去。 # beat:ws_gu_stops_5 # scene:ws_court # cast:ws_qi # speaker:narrator
- else:
你想起自己答怕不像。今日第一遍又想先问像不像，终于停住，改问刚才自己的气息断在哪里。同伴只能答他看见的那一点。 # beat:ws_gu_stops_6 # scene:ws_court # cast:ws_qi # speaker:narrator
}
* [留下原先在哪些地方硬凑的记录，供后来者辨认，不把自己的删法又立成唯一练法。 # cid:ws_keep_life_notes]
  ~ ws_gu_notes = true
  你将曾经那句怕不像也记在旁边，没叫后人照着害怕。 # beat:ws_gu_stops_7 # scene:ws_court # cast:ws_qi # speaker:narrator
  -> forbidden_copy
* [去请另一脉再看自己重新起步的地方，让他指出你仍在扮谁。 # cid:ws_keep_two_people]
  ~ ws_gu_notes = false
  对方只说见到什么，不能替你回到二十年前。你听完再走一次，终于没有先问像不像祖师。 # beat:ws_gu_stops_8 # scene:ws_court # cast:ws_qi # speaker:narrator
  -> forbidden_copy

=== forbidden_copy ===
昆仑后来定下：祁玄岳遗录不得照练。可以读、可以研究，不许当最高秘笈一式一式往自己身上套。雪灾是人死东西会断；祁玄岳是人活着，东西也未必能复制。这是两件不同的难事。 # beat:ws_forbidden_copy_1 # scene:ws_room # cast:ws_qi # speaker:narrator
祁玄岳渐入深山，据说那处旧崖名玉虚崖，外界未能确认。十年、二十年，偶有人见，仍不知他在练什么。 # beat:ws_forbidden_copy_2 # scene:ws_room # cast:ws_qi # speaker:narrator
以前觉得外面有人会告诉我。后来发现，别人也只知道自己的。 # beat:ws_forbidden_copy_3 # scene:ws_room # cast:ws_qi # speaker:ws_qi # mood:ws_qi=neutral
{
- ws_gu_notes:
你留下的是当年怎么硬凑，不是你的删法。这两样，后来人分得清。 # beat:ws_forbidden_copy_4 # scene:ws_room # cast:ws_qi # speaker:ws_qi # mood:ws_qi=neutral
遗录旁边多了一句"怕不像"，你没有叫后人照着害怕。 # beat:ws_forbidden_copy_5 # scene:ws_room # cast:ws_qi # speaker:narrator
- else:
你又请另一脉来看你重新起步的地方。看一回，你就得再拆一回。 # beat:ws_forbidden_copy_6 # scene:ws_room # cast:ws_qi # speaker:ws_qi # mood:ws_qi=neutral
对方只说见到什么，不能替你回到二十年前；听不听得进去，是你自己的事。 # beat:ws_forbidden_copy_7 # scene:ws_room # cast:ws_qi # speaker:narrator
}
后来可靠的人最后见他，已是归山数十年后。再后没有可靠记录。无生之乱时若仍活必极老，昆仑既没请他出山，也没宣布他死。那张旧录往后，再没有谁能写下亲见他的日子。 # beat:ws_forbidden_copy_8 # scene:ws_room # cast:none # speaker:narrator
此后换了多代。昆仑重新强化第二人理解，各代须有人下山看山外。回来先问外面变了什么，不只问赢谁。 # beat:ws_forbidden_copy_9 # scene:ws_room # cast:none # speaker:narrator
一名弟子报江南连胜，却答不出金陵这一代剑怎么变，挨骂三日不出门。几代之间没有震动天下的大会，但有人退、有人接，前代尚在，后代又到门前。 # beat:ws_forbidden_copy_10 # scene:ws_room # cast:none # speaker:narrator
六大之名渐成，没有哪年由十四掌门投票封号。昆仑没有为此广开山门；它的教法极耗人，正传每个人都须被看见。 # beat:ws_forbidden_copy_11 # scene:ws_room # cast:none # speaker:narrator
视角停在后世一名守卷人。你不是顾寒声，也不是祁玄岳；今日将不同年代的记录并排，须先分清哪些话有人能证。 # beat:ws_forbidden_copy_12 # scene:ws_room # cast:none # speaker:narrator # fact:ws_no_lifespan
* [在旧录后留下确定与未定的边界，不把祖师未归的年份当作已死之年。 # cid:ws_keep_limits]
  ~ ws_record_bound = true
  一代代读者往后翻，见到的是有人能证什么，不是一张偷偷补齐的寿数。 # beat:ws_forbidden_copy_13 # scene:ws_room # cast:none # speaker:narrator
  -> first_crown
* [沿着第二人的制度记接住的支路，不因史上没写新第一便删掉中间几代。 # cid:ws_keep_second]
  ~ ws_record_bound = false
  没有震动天下的那些年，也有人曾为一个弟子多看半日。你留下的是可以再问谁，不是另一张最高名单。 # beat:ws_forbidden_copy_14 # scene:ws_room # cast:none # speaker:narrator
  -> first_crown

=== first_crown ===
时代再换，你是公孙无我。年轻下山时，人先注意你的剑极快，你只答还行。几十年后，第一次坐旧总谱第一，昆仑没什么反应，你也没有。 # beat:ws_first_crown_1 # scene:ws_court # cast:ws_guest # speaker:narrator
山下都说，昆仑出了天下第一。 # beat:ws_first_crown_2 # scene:ws_court # cast:ws_guest # speaker:ws_guest # mood:ws_guest=amused
嗯。 # beat:ws_first_crown_3 # scene:ws_court # cast:ws_guest # speaker:you
来客以为还该有下一句，你已在看自己刚停的剑。快足够让人先记住，却不替你回答以后还练什么。 # beat:ws_first_crown_4 # scene:ws_court # cast:ws_guest # speaker:narrator
后来你从第一退下，消失多年。旧榜上换了名字，许多听过你剑快的人，也渐渐不再来问下一场。 # beat:ws_first_crown_5 # scene:ws_court # cast:ws_guest # speaker:narrator
{
- ws_record_bound:
祁祖旧录里连不知道也留着。您读过那一条么？ # beat:ws_first_crown_6 # scene:ws_court # cast:ws_guest # speaker:ws_guest # mood:ws_guest=neutral
你点头。旧录未给祁玄岳补齐寿数，公孙无我今日出手，也不能替那段未知作答。 # beat:ws_first_crown_7 # scene:ws_court # cast:ws_guest # speaker:narrator
- else:
旧录连没写进榜的年份也记。可谁还认得那些接过传承的人？ # beat:ws_first_crown_8 # scene:ws_court # cast:ws_guest # speaker:ws_guest # mood:ws_guest=amused
你叫来客去问守卷人。山里有人记着来路，不等于你已替几代人的每一日作过见证。 # beat:ws_first_crown_9 # scene:ws_court # cast:ws_guest # speaker:narrator
}
* [旧谱第一退下后，先在自己总抢快的一处停，问不抢时这一剑还能如何接。 # cid:ws_ask_slow_hand]
  ~ ws_slow = true
  没有旁人替这一停判输。你也没将停一下便算成已走到第二次。 # beat:ws_first_crown_10 # scene:ws_court # cast:ws_guest # speaker:narrator
  -> second_crown
* [读祁祖遗录时，只问自己哪处不能解释，不用模仿再替自己造一个祖师。 # cid:ws_ask_own_road]
  ~ ws_slow = false
  纸上剑路可以做出来，为何在那里作出，你不知道。你把卷放回原处，自己的剑还在手里。 # beat:ws_first_crown_11 # scene:ws_court # cast:ws_guest # speaker:narrator
  -> second_crown

=== second_crown ===
多年后再出，公孙无我第二次坐旧总谱第一。来客要你再演年轻时那一剑，你提剑，手却已不再急着替他证一个快字。 # beat:ws_second_crown_1 # scene:ws_court # cast:ws_guest # speaker:narrator
宁无极后来评：第一次第一只是剑快，第二次才算会剑。宁有宁的尺度。来客仍记得旧日那一剑，想看清这回究竟哪里不同。 # beat:ws_second_crown_2 # scene:ws_court # cast:ws_guest # speaker:narrator
您与祁祖谁更高？ # beat:ws_second_crown_3 # scene:ws_court # cast:ws_guest # speaker:ws_guest # mood:ws_guest=neutral
没见过。 # beat:ws_second_crown_4 # scene:ws_court # cast:ws_guest # speaker:you
旧录看过，能学么？ # beat:ws_second_crown_5 # scene:ws_court # cast:ws_guest # speaker:ws_guest # mood:ws_guest=neutral
能照着做。不一样。 # beat:ws_second_crown_6 # scene:ws_court # cast:ws_guest # speaker:you
你沉默很久才说，知道自己怎么到今日，看他的东西，却不知道他怎么到那里。不因两次第一便替自己报赢一位没见过的祖师。 # beat:ws_second_crown_7 # scene:ws_court # cast:ws_guest # speaker:narrator # fact:ws_two_crowns
{
- ws_slow:
您方才提剑，慢了半息。是故意的？ # beat:ws_second_crown_8 # scene:ws_court # cast:ws_guest # speaker:ws_guest # mood:ws_guest=neutral
你没有答。快足够让人先记住，却不替你回答以后还练什么。 # beat:ws_second_crown_9 # scene:ws_court # cast:ws_guest # speaker:narrator
- else:
您没照那位祖师的剑路做。那您自己的路，是从哪一步起头的？ # beat:ws_second_crown_10 # scene:ws_court # cast:ws_guest # speaker:ws_guest # mood:ws_guest=neutral
你答不知道他怎么到那里；这一句，你也不打算替自己补上。 # beat:ws_second_crown_11 # scene:ws_court # cast:ws_guest # speaker:narrator
}
现在回到洛阳龙虎会之后的白石谷。你是当代将要下山的一名普通昆仑弟子。旧卷里的人各有自己的年月。你合上顾寒声那一页，再取起今日准备带走的门帖。 # beat:ws_second_crown_12 # scene:ws_snow # cast:ws_presentelder # speaker:narrator
如今掌门夏千秋，现行总谱第五。是否昆仑最强，山后几位返真，公孙无我是否尚在，都没有可靠公开定论。 # beat:ws_second_crown_13 # scene:ws_snow # cast:ws_presentelder # speaker:narrator
回来先说外面变了什么。 # beat:ws_second_crown_14 # scene:ws_snow # cast:ws_presentelder # speaker:ws_presentelder # mood:ws_presentelder=neutral
老人将正式门帖交给你，没有替你写一定要胜过谁。此前谢青云来白石谷见夏却未交手，看谁的剑不答，三个月后返江南少七式，没有人把一套神功教给他。 # beat:ws_second_crown_15 # scene:ws_snow # cast:ws_presentelder # speaker:narrator
* [携帖去山外，约好回来先讲一个看懂的变化与一个没问明白的问题。 # cid:ws_go_observe]
  ~ ws_after = 1
  不明白可以带回来。别带回来一张全懂的脸。 # beat:ws_second_crown_16 # scene:ws_snow # cast:ws_presentelder # speaker:ws_presentelder # mood:ws_presentelder=neutral
  你笑，行囊里留一页空纸。谷后怎样走，不写给山外来客作地图。 # beat:ws_second_crown_17 # scene:ws_snow # cast:ws_presentelder # speaker:narrator
  -> today_after
* [先接一段谷中来客与交接差事，推后自己的出发，等下一人真正能接。 # cid:ws_stay_receive]
  ~ ws_after = 2
  帖不作废。换班的那个人，你得领认。 # beat:ws_second_crown_18 # scene:ws_snow # cast:ws_presentelder # speaker:ws_presentelder # mood:ws_presentelder=neutral
  你把行囊放回客舍，今日少走一段山外路。不是从此不下山，是原定接手的人还没来。 # beat:ws_second_crown_19 # scene:ws_snow # cast:ws_presentelder # speaker:narrator
  -> today_after

=== today_after ===
雪落在院外，扫过的路仍要再扫。没有一页名次能替山里的人永远活着，也没有一页旧录能替后来的人把剑先练完。 # beat:ws_today_after_1 # scene:ws_snow # cast:none # speaker:narrator
{
- ws_after == 1:
你出谷时有人问昆仑到底多少人。你答只知道今日亲见的这些，转而问他的来路。那人讲起山道新换的过法，你第一次没有先问那地方谁最强。 # beat:ws_today_after_2 # scene:ws_snow # cast:none # speaker:narrator # ending:ws_outside_after
-> END
- else:
来接班的人到后，你先领他走药房和客舍，再将没答妥的来帖逐份交清。他问这是不是昆仑全部，你指谷后说也是，却没拿一句也是骗他已经看尽这座山。 # beat:ws_today_after_3 # scene:ws_snow # cast:none # speaker:narrator # ending:ws_receiving_after
-> END
}
