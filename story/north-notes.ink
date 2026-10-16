VAR nn_gun_first = false
VAR nn_scale = false
VAR nn_open_questions = false
VAR nn_three_names = false
VAR nn_person = false
VAR nn_keep = 0
-> two_books

=== two_books ===
这册夹页先从终南开始。你那时还年轻，替门里誊几份旧稿，见老师把一杆枪放回角落，便问同样是天岳，为何一个先不许碰枪，一个却总让他慢一点。 # beat:nn_two_books_1 # scene:nn_oldporch # cast:nn_heng # speaker:narrator
司马衡没有把两人叫到同一张桌前作比较。你在观里问过他，若干年后又分别问秦与司马，才把三段不同年景的对话装订在一起。 # beat:nn_two_books_2 # scene:nn_oldporch # cast:nn_heng # speaker:narrator
你是要抄一条谁都可用的办法，还是先问我教的是谁？ # beat:nn_two_books_3 # scene:nn_oldporch # cast:nn_heng # speaker:nn_heng # mood:nn_heng=intent
* [先问秦天岳，六十一岁已有北榜前位，为什么偏要离枪三个月。 # cid:nn_ask_gun]
  ~ nn_gun_first = true
  他不拿枪，还怎么知道哪里错？ # beat:nn_two_books_4 # scene:nn_oldporch # cast:nn_heng # speaker:you
  他一拿，就把能做的全替枪做了。先看看不站在那杆枪后面，他还肯不肯不会。 # beat:nn_two_books_5 # scene:nn_oldporch # cast:nn_heng # speaker:nn_heng # mood:nn_heng=amused
  你在旁边记三个月，却不把不碰兵器写成所有人入门都必守的第一条。 # beat:nn_two_books_6 # scene:nn_oldporch # cast:nn_heng # speaker:narrator
  -> different_pupils
* [先问司马天岳，看得那么快，为何还要反复问他真看见了么。 # cid:nn_ask_palm]
  ~ nn_gun_first = false
  他能想出别人没想的，为什么还要慢？ # beat:nn_two_books_7 # scene:nn_oldporch # cast:nn_heng # speaker:you
  看得快，就容易替眼前那人先长成自己想的样子。 # beat:nn_two_books_8 # scene:nn_oldporch # cast:nn_heng # speaker:nn_heng # mood:nn_heng=intent
  你在旁边记慢，却不把从此永远慢一步写成谁来都该照做的身法。 # beat:nn_two_books_9 # scene:nn_oldporch # cast:nn_heng # speaker:narrator
  -> different_pupils

=== different_pupils ===
一个总想自己来，一个总想先知道怎样最对。你把两句话换过来，未必就教得动另一个。 # beat:nn_different_pupils_1 # scene:nn_oldporch # cast:nn_heng # speaker:nn_heng # mood:nn_heng=neutral
都是先放下？ # beat:nn_different_pupils_2 # scene:nn_oldporch # cast:nn_heng # speaker:you
你又想省成两个字。 # beat:nn_different_pupils_3 # scene:nn_oldporch # cast:nn_heng # speaker:nn_heng # mood:nn_heng=intent
老师把你的纸推回。秦仍六合，教这一段不改门；司马十四便正式在太极师门里。你先在两页上各写清人，不能一个老师便抄成同一份谱。 # beat:nn_different_pupils_4 # scene:nn_oldporch # cast:nn_heng # speaker:narrator # fact:nn_two_doors
* [问后来谁走得更高，听他为什么不肯用这一问替代两个孩子的路。 # cid:nn_ask_stronger]
  ~ nn_scale = true
  他们有没有各自走过，你先写清。秦不必因司马早返真，就把自己六十一那年删掉。 # beat:nn_different_pupils_5 # scene:nn_oldporch # cast:nn_heng # speaker:nn_heng # mood:nn_heng=amused
  你把原想空一栏排谁先谁后的地方划开，改成各自在学什么。 # beat:nn_different_pupils_6 # scene:nn_oldporch # cast:nn_heng # speaker:narrator
  -> not_same_scale
* [问老师是否也得承认有教不到的地方，不让第三位高处抹掉周与楚。 # cid:nn_ask_same_teacher]
  ~ nn_scale = false
  没有周定川练成那杆枪，没有楚怀锋让他知道怎么输，我这里凭空教什么？ # beat:nn_different_pupils_7 # scene:nn_oldporch # cast:nn_heng # speaker:nn_heng # mood:nn_heng=intent
  你在师名下留三处，不把最高境界那一个写得最大。 # beat:nn_different_pupils_8 # scene:nn_oldporch # cast:nn_heng # speaker:narrator
  -> not_same_scale

=== not_same_scale ===
你记录的只是这席教法。它没有给两位弟子未来尚未发生的问艺先填胜负，更不能用来证明世间只有这两种学生。 # beat:nn_not_same_scale_1 # scene:nn_oldporch # cast:nn_heng # speaker:narrator
先别太早觉得懂了。 # beat:nn_not_same_scale_2 # scene:nn_oldporch # cast:nn_heng # speaker:nn_heng # mood:nn_heng=intent
那时你还不知这句会在后来的两份访问里各回来一次。老师转身去看木椅，你收起纸，没再催他把教过谁都替你数完。 # beat:nn_not_same_scale_3 # scene:nn_oldporch # cast:nn_heng # speaker:narrator
* [把没听懂的一并留下，几年后有机会再向当事人问。 # cid:nn_keep_questions]
  ~ nn_open_questions = true
  你在页边留一个问：若自己已经走很远，还敢不敢回第一步？没有因为今天未答就撕掉这页。 # beat:nn_not_same_scale_4 # scene:nn_oldporch # cast:nn_heng # speaker:narrator
  -> qin_visit
* [把三月离枪与问慢各留一件实事，不让两句漂亮话占满整本。 # cid:nn_keep_example]
  ~ nn_open_questions = false
  你先记枪靠哪边，再记老师没有替弟子迈出的那半步。将来还有新的事情，页边也要留得下。 # beat:nn_not_same_scale_5 # scene:nn_oldporch # cast:nn_heng # speaker:narrator
  -> qin_visit

=== qin_visit ===
又过些年，你到六合馆。秦天岳已八十余，枪房三件仍挂：白蜡枪、断枪杆、椅扶手。你的终南旧页没有因纸黄便先比这间院里的人知道得多。 # beat:nn_qin_visit_1 # scene:nn_gunroom # cast:nn_qin # speaker:narrator
想问哪一段？ # beat:nn_qin_visit_2 # scene:nn_gunroom # cast:nn_qin # speaker:nn_qin # mood:nn_qin=intent
六十一。那三个月。 # beat:nn_qin_visit_3 # scene:nn_gunroom # cast:nn_qin # speaker:you
我当时也不懂。后来三年才懂一点，不是放下枪那天就换了一个人。 # beat:nn_qin_visit_4 # scene:nn_gunroom # cast:nn_qin # speaker:nn_qin # mood:nn_qin=neutral
你把三年记到三月旁。第一页原来写得太短，不是因为老师一句够深就真已包括了后来的每一天。 # beat:nn_qin_visit_5 # scene:nn_gunroom # cast:nn_qin # speaker:narrator # fact:nn_qin_time
{
- nn_gun_first:
老师说你总想自己来。你何时发现这不是夸强？ # beat:nn_qin_visit_6 # scene:nn_gunroom # cast:nn_qin # speaker:you
三月不碰，棋还想赢。二十七盘才等一回赢，他偏又问我为什么高兴。 # beat:nn_qin_visit_7 # scene:nn_gunroom # cast:nn_qin # speaker:nn_qin # mood:nn_qin=amused
秦笑完，手摸旧枪，没把如今懂得一点说成当时早有深意。 # beat:nn_qin_visit_8 # scene:nn_gunroom # cast:nn_qin # speaker:narrator
- else:
老师说不能拿司马的快和你的强抄一份谱。你会想自己到得晚么？ # beat:nn_qin_visit_9 # scene:nn_gunroom # cast:nn_qin # speaker:you
先把今日这一枪走明白。没有周师那三样，我连晚到哪里都不知。 # beat:nn_qin_visit_10 # scene:nn_gunroom # cast:nn_qin # speaker:nn_qin # mood:nn_qin=intent
他把旧白蜡枪拿下，让你看那一处早已发黑的掌痕。 # beat:nn_qin_visit_11 # scene:nn_gunroom # cast:nn_qin # speaker:narrator
}
* [问后辈该怎样记三位老师，容他们各自的门人也保留自己的讲法。 # cid:nn_name_three]
  ~ nn_three_names = true
  先把名字叫对。别见周师没进北榜，就在他面前添一句只是。 # beat:nn_qin_visit_12 # scene:nn_gunroom # cast:nn_qin # speaker:nn_qin # mood:nn_qin=neutral
  若有人记得你走时留下的麻烦？ # beat:nn_qin_visit_13 # scene:nn_gunroom # cast:nn_qin # speaker:you
  也记。我走到这里，不替别人把那几个月还回去了。 # beat:nn_qin_visit_14 # scene:nn_gunroom # cast:nn_qin # speaker:nn_qin # mood:nn_qin=intent
  -> qin_names
* [把早年笔录交给他看，请他指出自己写得过快的地方。 # cid:nn_show_first_page]
  ~ nn_three_names = false
  你这里写后来懂了，中间太空。 # beat:nn_qin_visit_15 # scene:nn_gunroom # cast:nn_qin # speaker:nn_qin # mood:nn_qin=intent
  他没替你补一句更玄的话，先说没有枪的日子照样扫院、挑水，回门也还得接着做事。你把那一空拆成能容下三年的几行。 # beat:nn_qin_visit_16 # scene:nn_gunroom # cast:nn_qin # speaker:narrator
  -> qin_names

=== qin_names ===
他没有把枪房扶手取下烧掉，也不肯把它说成暗藏太极一脉的信物。第三位老师教的一段很深，门籍却一直是六合。 # beat:nn_qin_names_1 # scene:nn_gunroom # cast:nn_qin # speaker:narrator
你这回不是来问他到底第几？ # beat:nn_qin_names_2 # scene:nn_gunroom # cast:nn_qin # speaker:nn_qin # mood:nn_qin=amused
先记我今日真听见的。 # beat:nn_qin_names_3 # scene:nn_gunroom # cast:nn_qin # speaker:you
秦叫一个年轻人站到纸前，先只让纸动。你收好旧页，等他把这堂真课接起来才告辞。 # beat:nn_qin_names_4 # scene:nn_gunroom # cast:nn_qin # speaker:narrator
-> sima_visit

=== sima_visit ===
另一个时日，你到太极。司马天岳已经坐稳总谱第一，账仍没在自己手上，桌边倒有剑。你刚坐下，他先看你手边那册，问夹页是不是会滑出来。 # beat:nn_sima_visit_1 # scene:nn_teaporch # cast:nn_sima # speaker:narrator
你右边多夹一张，翻到后面会歪。 # beat:nn_sima_visit_2 # scene:nn_teaporch # cast:nn_sima # speaker:nn_sima # mood:nn_sima=intent
我来问师父为何教你慢。 # beat:nn_sima_visit_3 # scene:nn_teaporch # cast:nn_sima # speaker:you
这个我想很久。纸也先放平，字总不能在地上听。 # beat:nn_sima_visit_4 # scene:nn_teaporch # cast:nn_sima # speaker:nn_sima # mood:nn_sima=amused
他替你挪正纸，没有因此把茶也泡得更好。你尝一口，很苦，他看剑看久了，又忘了出汤。 # beat:nn_sima_visit_5 # scene:nn_teaporch # cast:nn_sima # speaker:narrator
* [问六十八岁那位弟子，一种正确为何在他身上走不通。 # cid:nn_ask_shoulder]
  ~ nn_person = true
  肩骨不一样。我一直要他走别人顺的那一手。 # beat:nn_sima_visit_6 # scene:nn_teaporch # cast:nn_sima # speaker:nn_sima # mood:nn_sima=intent
  所以是先会所有谱？ # beat:nn_sima_visit_7 # scene:nn_teaporch # cast:nn_sima # speaker:you
  不是。是我先看见他。 # beat:nn_sima_visit_8 # scene:nn_teaporch # cast:nn_sima # speaker:nn_sima # mood:nn_sima=neutral
  你把这个人的这一手记下来，没改写成世上再不需要旧谱。 # beat:nn_sima_visit_9 # scene:nn_teaporch # cast:nn_sima # speaker:narrator
  -> sima_person
* [问既在第一，又被周道玄等人胜过，老师那句慢还有没有尽头。 # cid:nn_ask_outside]
  ~ nn_person = false
  七十三再二十九，合一百零二。我知道怎么输，还不知他为何让我只能这样输。 # beat:nn_sima_visit_10 # scene:nn_teaporch # cast:nn_sima # speaker:nn_sima # mood:nn_sima=amused
  那你如今全知道了么？ # beat:nn_sima_visit_11 # scene:nn_teaporch # cast:nn_sima # speaker:you
  不知道。 # beat:nn_sima_visit_12 # scene:nn_teaporch # cast:nn_sima # speaker:nn_sima # mood:nn_sima=neutral
  你没有为一份晚年访谈更像答案，替他补一句早就看透。 # beat:nn_sima_visit_13 # scene:nn_teaporch # cast:nn_sima # speaker:narrator
  -> sima_person

=== sima_person ===
秦的枪得他自己去。我这掌，也不能叫师父替我返真。 # beat:nn_sima_person_1 # scene:nn_teaporch # cast:nn_sima # speaker:nn_sima # mood:nn_sima=neutral
后来比师父高，是不是师父老？ # beat:nn_sima_person_2 # scene:nn_teaporch # cast:nn_sima # speaker:you
有一部分。换回二十年前，我也觉得能赢。他还笑我早就超过却不问。 # beat:nn_sima_person_3 # scene:nn_teaporch # cast:nn_sima # speaker:nn_sima # mood:nn_sima=intent
你写下老的一部分，也写下多年真走过的一部分。谁也不必靠抹掉前者证明后者，老师也不靠从未被弟子越过才算老师。 # beat:nn_sima_person_4 # scene:nn_teaporch # cast:nn_sima # speaker:narrator # fact:nn_sima_person
* [师门笔记留可追问处，未见的境界和旧战仍不替他们填。 # cid:nn_keep_unfinished]
  ~ nn_keep = 1
  天外那个使剑人，性别来处也还不知道？ # beat:nn_sima_person_5 # scene:nn_teaporch # cast:nn_sima # speaker:you
  不知道。说过三剑，是旧人传来的话。我没见三剑。 # beat:nn_sima_person_6 # scene:nn_teaporch # cast:nn_sima # speaker:nn_sima # mood:nn_sima=neutral
  你给那一页注明传闻，再留一处将来确有见闻才添的位置。 # beat:nn_sima_person_7 # scene:nn_teaporch # cast:nn_sima # speaker:narrator
  -> notes_remain
* [师门笔记留下各自能再练的例子，不把两个天岳抄成一套通用诀窍。 # cid:nn_keep_teaching]
  ~ nn_keep = 2
  你写秦先离枪，司马先问真看见么，旁边各留一个别照抄。司马看你，又说字挤得太紧，后面再来人要写哪里。 # beat:nn_sima_person_8 # scene:nn_teaporch # cast:nn_sima # speaker:narrator
  还有下一页。 # beat:nn_sima_person_9 # scene:nn_teaporch # cast:nn_sima # speaker:you
  那就好。 # beat:nn_sima_person_10 # scene:nn_teaporch # cast:nn_sima # speaker:nn_sima # mood:nn_sima=amused
  -> notes_remain

=== notes_remain ===
装订时，终南、六合与太极各有日期，不是三位老人同夜为后来人排座次。两位弟子也没有互相继承对方的选择与记忆。 # beat:nn_notes_remain_1 # scene:nn_pages # cast:none # speaker:narrator
老师当年的问，经过两个不同人的多年，才在页边长出不同答复。这册笔记可再翻，不替每一个来学的人先决定他该有哪一种快、哪一种强。 # beat:nn_notes_remain_2 # scene:nn_pages # cast:none # speaker:narrator # fact:nn_rumor_limit
{
- nn_keep == 1:
页边空着，已经写下的并不因此无用。你把线放松一点，留给下一回真能问的人。 # beat:nn_notes_remain_3 # scene:nn_pages # cast:none # speaker:narrator # ending:nn_unfinished_page
-> END
- else:
一个起手先放枪，一个起手先看人。后来人翻到这里，也仍得把自己的手举起，不能只把两句都背熟。 # beat:nn_notes_remain_4 # scene:nn_pages # cast:none # speaker:narrator # ending:nn_different_starts
-> END
}
