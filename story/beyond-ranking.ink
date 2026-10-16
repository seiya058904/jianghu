// Canon35058–35315. Ning late-life private judgement; historical disciple POV. No official reranking, definite survival or invented bouts.
VAR br_source_first = false
VAR br_alive = false
VAR br_missing_hand = false
VAR br_correct = false
VAR br_observe = false
VAR br_palm = false
VAR br_return = false
VAR br_place = false
VAR br_after = 0
-> yellow_page

=== yellow_page ===
宁无极百岁退谱以后，太玄门里的一段旧事。你是来侍读的门人，先将窗边那盏茶移开，免得压住纸角。 # beat:br_yellow_page_1 # scene:br_room # cast:br_ning,br_peer # speaker:narrator
一页黄纸，十个名字。后世据说宁无极亲手写过，眼前这次你却没有见他落笔。 # beat:br_yellow_page_2 # scene:br_room # cast:br_ning,br_peer # speaker:narrator
师祖，您也肯替天下排一次？ # beat:br_yellow_page_3 # scene:br_room # cast:br_ning,br_peer # speaker:br_peer # mood:br_peer=amused
天下习武者无数。真让我觉得站在我前面的，便这十个。 # beat:br_yellow_page_4 # scene:br_room # cast:br_ning,br_peer # speaker:br_ning # mood:br_ning=neutral
同门已经找来一张干净纸，想抄到外头去。宁没点头，也没先替你们讲自己当年列过旧总谱前位。 # beat:br_yellow_page_5 # scene:br_room # cast:br_ning,br_peer # speaker:narrator
* [先问这十个人，哪些是师祖亲试、哪些是亲见，不急着将十个名次传出去。 # cid:br_ask_witness]
  ~ br_source_first = true
  有我试过的，也有看过的。还有消息，得看从谁那里来。 # beat:br_yellow_page_6 # scene:br_room # cast:br_ning,br_peer # speaker:br_ning # mood:br_ning=neutral
  你将空纸横过来，姓名旁边留了一栏。同门瞧见，以为你还想多排一项。 # beat:br_yellow_page_7 # scene:br_room # cast:br_ning,br_peer # speaker:narrator
  -> not_all_alive
* [先问能否拿去改总谱，听他肯不肯让自己的判断替天下落榜。 # cid:br_ask_public]
  ~ br_source_first = false
  你们的总谱，什么时候归我写了？ # beat:br_yellow_page_8 # scene:br_room # cast:br_ning,br_peer # speaker:br_ning # mood:br_ning=neutral
  我以为既然排了…… # beat:br_yellow_page_9 # scene:br_room # cast:br_ning,br_peer # speaker:br_peer # mood:br_peer=uneasy
  他话停在一半。纸有先后，与拿着纸便有权改榜，中间还隔着师祖没答应的一步。 # beat:br_yellow_page_10 # scene:br_room # cast:br_ning,br_peer # speaker:narrator
  -> not_all_alive

=== not_all_alive ===
这不是历代死者的最高名单。宁从写下时仍确定在世、或没有足够可靠死讯的人里衡量；十人当时皆已过百。 # beat:br_not_all_alive_1 # scene:br_room # cast:br_ning,br_peer # speaker:narrator
有人数十年不露面，可靠人物最后见过时已一百五六十，之后便失去可信行踪。没有死讯，不等于此刻一定还活着。 # beat:br_not_all_alive_2 # scene:br_room # cast:br_ning,br_peer # speaker:narrator
那岂不是连活没活着，也有不知道的？ # beat:br_not_all_alive_3 # scene:br_room # cast:br_ning,br_peer # speaker:br_peer # mood:br_peer=neutral
不知道的，就留着不知道。 # beat:br_not_all_alive_4 # scene:br_room # cast:br_ning,br_peer # speaker:br_ning # mood:br_ning=neutral
宁没有叫人去给十个名字各填一个今日住处。后来也没有按年重抄一张新榜，留下的只是晚年这一次判断。 # beat:br_not_all_alive_5 # scene:br_room # cast:br_ning,br_peer # speaker:narrator # fact:br_alive_limit
* [给未知生死留空，不把没死讯写成已证尚活。 # cid:br_keep_missing]
  ~ br_alive = true
  同门想添一个尚字，你按住笔，请他先把“无确讯”四字写清。宁看一眼，叫你别只挑省墨的写法。 # beat:br_not_all_alive_6 # scene:br_room # cast:br_ning,br_peer # speaker:narrator
  -> first_two
* [问若有可信死讯怎么办，不拿师祖写过便让一个名字永远占着。 # cid:br_ask_reliable]
  ~ br_alive = false
  已知不在的人，不在这一页里。 # beat:br_not_all_alive_7 # scene:br_room # cast:br_ning,br_peer # speaker:br_ning # mood:br_ning=neutral
  你将问题留在页后，没编一个今夜刚死的名家来试他会不会改。 # beat:br_not_all_alive_8 # scene:br_room # cast:br_ning,br_peer # speaker:narrator
  -> first_two

=== first_two ===
第一，“混元武祖”周道玄，太极旧掌，晚年居终南混元院。宁年轻时试过三手，旧册没有前两手的来路，只留第三手一句：到今日也没看懂。 # beat:br_first_two_1 # scene:br_room # cast:br_ning # speaker:narrator
这一手，我到今日也没看懂。 # beat:br_first_two_2 # scene:br_room # cast:br_ning # speaker:br_ning # mood:br_ning=intent
第二，“万剑归宗”陆天行，华山旧宗主，曾坐旧总谱第一。宁说真正可怕在百岁退谱以后，晚年剑只记四字——剑已无剑。 # beat:br_first_two_3 # scene:br_room # cast:br_ning # speaker:narrator
那周祖第三手，能不能…… # beat:br_first_two_4 # scene:br_room # cast:br_peer,br_ning # speaker:br_peer # mood:br_peer=neutral
我没看懂，你要我教什么？ # beat:br_first_two_5 # scene:br_room # cast:br_peer,br_ning # speaker:br_ning # mood:br_ning=neutral
同门咳一下，把原准备照图学的那张纸收了。陆天行四个字，也没有变成谁都能领走的一套招。 # beat:br_first_two_6 # scene:br_room # cast:br_peer,br_ning # speaker:narrator # fact:br_first_two
* [问旧册为何不记周的前两手，允许师祖说这页纸留不全当日。 # cid:br_ask_first_two]
  ~ br_missing_hand = true
  没留下。你若想知道，得另找能知道的人。 # beat:br_first_two_7 # scene:br_room # cast:br_peer,br_ning # speaker:br_ning # mood:br_ning=neutral
  你删掉自己在页边写的一个推字。第三手尚不懂，不能靠把前两手补顺，便替师祖懂了第三手。 # beat:br_first_two_8 # scene:br_room # cast:br_peer,br_ning # speaker:narrator
  -> third_fourth
* [问陆百岁退谱后为何更可怕，不将旧第一那几年当成一个人的顶点。 # cid:br_ask_late_sword]
  ~ br_missing_hand = false
  列榜时有列榜时的剑。你只拿那几年的名字来问，问不到后来。 # beat:br_first_two_9 # scene:br_room # cast:br_peer,br_ning # speaker:br_ning # mood:br_ning=neutral
  你保留百岁以后的字眼，没有把四字评语画成一柄已经没了的真剑。 # beat:br_first_two_10 # scene:br_room # cast:br_peer,br_ning # speaker:narrator
  -> third_fourth

=== third_fourth ===
第三，“九霄道君”张玄衡，武当玄门旧首席；曾短列旧总谱第二，重定禁榜后自请撤名。宁与他论三日，真正动手只有一次。 # beat:br_third_fourth_1 # scene:br_room # cast:br_ning,br_peer # speaker:narrator
他的气还没有尽。我已经没有第二条路。 # beat:br_third_fourth_2 # scene:br_room # cast:br_ning,br_peer # speaker:br_ning # mood:br_ning=neutral
第四，“大日金刚”慧空，少林达摩院旧首座，一生不入世榜。宁五十余岁三上嵩山，终于试掌；两掌后停，第三掌未发。 # beat:br_third_fourth_3 # scene:br_room # cast:br_ning,br_peer # speaker:narrator
第三掌若出，输的是我。 # beat:br_third_fourth_4 # scene:br_room # cast:br_ning,br_peer # speaker:br_ning # mood:br_ning=neutral
那就是三掌败…… # beat:br_third_fourth_5 # scene:br_room # cast:br_ning,br_peer # speaker:br_peer # mood:br_peer=sharp
他刚写了三，你把手边那页两掌的旧记推过去。宁没有再出一掌，好让你们当场验一遍。 # beat:br_third_fourth_6 # scene:br_room # cast:br_ning,br_peer # speaker:narrator # fact:br_unplayed_third
* [请同门改回两掌后止，把第三掌若出仍写成宁的判断。 # cid:br_correct_third]
  ~ br_correct = true
  差一个字，听起来确实像真打了。 # beat:br_third_fourth_7 # scene:br_room # cast:br_ning,br_peer # speaker:br_peer # mood:br_peer=uneasy
  他刮掉那个败，纸薄了一点。宁叫你们换一页，不必为省一张纸把旧话刮得看不清。 # beat:br_third_fourth_8 # scene:br_room # cast:br_ning,br_peer # speaker:narrator
  -> fifth_sixth
* [先追问张那一次真正动手，提醒同门别把论三日写成连打三日。 # cid:br_ask_once]
  ~ br_correct = false
  话说了三日，手只问一次。你们若只肯记动手，三日也能给你们抄没。 # beat:br_third_fourth_9 # scene:br_room # cast:br_ning,br_peer # speaker:br_ning # mood:br_ning=neutral
  同门先在旁边写了“动手一次”，又回去看那个尚未改掉的三掌败。 # beat:br_third_fourth_10 # scene:br_room # cast:br_ning,br_peer # speaker:narrator
  -> fifth_sixth

=== fifth_sixth ===
第五，“海上飞仙”叶无涯，东海海天门上一代门主。宁亲见他与一位旧总谱第一私下较艺十四招，双方自行停手。 # beat:br_fifth_sixth_1 # scene:br_room # cast:br_ning # speaker:narrator
那位旧谱首位当夜只说，海上有人。 # beat:br_fifth_sixth_2 # scene:br_room # cast:br_ning # speaker:br_ning # mood:br_ning=neutral
那位首位未名，十四招没有谁被写成败者。宁记了几十年，也没将听见的一句改成自己曾与叶争过首。 # beat:br_fifth_sixth_3 # scene:br_room # cast:br_ning # speaker:narrator
第六，“剑压九州”公孙无我，昆仑旧掌，两次旧总谱第一。宁说第一次人怕剑快，第二次已少有人说清究竟快不快。 # beat:br_fifth_sixth_4 # scene:br_room # cast:br_ning # speaker:narrator
第一次做第一，只是剑快。第二次做第一，才算会剑。 # beat:br_fifth_sixth_5 # scene:br_room # cast:br_ning # speaker:br_ning # mood:br_ning=neutral
你在别卷读过同一句，今日才看见说话的人并不准备替第一与第六再约一场。 # beat:br_fifth_sixth_6 # scene:br_room # cast:br_ning # speaker:narrator
* [问十四招为何没写胜负，把自己没亲见的停手，仍留在旁观记录这一栏。 # cid:br_ask_fourteen]
  ~ br_observe = true
  两人自己收了。你问我看见什么，我只能告诉你我看见的。 # beat:br_fifth_sixth_7 # scene:br_room # cast:br_ning # speaker:br_ning # mood:br_ning=neutral
  你没拿十四比九十七短，便在纸边另排一遍。那是不同年代、不同人肯停的地方。 # beat:br_fifth_sixth_8 # scene:br_room # cast:br_ning # speaker:narrator
  -> seventh_eighth
* [问公孙两次第一之间所变的是否只有快慢，肯让宁的评语停在自己的尺度。 # cid:br_ask_two_crowns]
  ~ br_observe = false
  你只问快不快，还是那一问。 # beat:br_fifth_sixth_9 # scene:br_room # cast:br_ning # speaker:br_ning # mood:br_ning=neutral
  他叫你把手上写字的笔放慢，你反而先乱了一划。同门笑，你也只得重写，没把这一下当作已经会剑。 # beat:br_fifth_sixth_10 # scene:br_room # cast:br_ning # speaker:narrator
  -> seventh_eighth

=== seventh_eighth ===
第七，“凤翅神尼”妙真，峨眉旧七峰首座，一生不入世榜。宁三上峨眉，前两次未真正交手；第三次下山，删练了数十年的掌法近半。 # beat:br_seventh_eighth_1 # scene:br_room # cast:br_ning,br_peer # speaker:narrator
那一年，她比我深。 # beat:br_seventh_eighth_2 # scene:br_room # cast:br_ning,br_peer # speaker:br_ning # mood:br_ning=neutral
第三次如何问手、多少招、胜负怎么记，页上没有。删近半也没有使那套掌法从此不曾对宁有用。 # beat:br_seventh_eighth_3 # scene:br_room # cast:br_ning,br_peer # speaker:narrator
第八，“九霄龙王”燕九霄，六合旧总门主，由北榜第一进总谱，旧首位坐十一年。宁见他与旧总谱第二横天神枪楚天雄私斗十九招。 # beat:br_seventh_eighth_4 # scene:br_room # cast:br_ning,br_peer # speaker:narrator
楚天雄还在用枪。燕九霄已经不太像在用枪。 # beat:br_seventh_eighth_5 # scene:br_room # cast:br_ning,br_peer # speaker:br_ning # mood:br_ning=neutral
所以谁赢？ # beat:br_seventh_eighth_6 # scene:br_room # cast:br_ning,br_peer # speaker:br_peer # mood:br_peer=neutral
宁只把十九招那行再推近。你们还没有从这一句看见一场确凿胜负。 # beat:br_seventh_eighth_7 # scene:br_room # cast:br_ning,br_peer # speaker:narrator # fact:br_later_four
* [问删近半后留下什么，愿听宁承认旧时自己不足，不索一套妙真的秘招。 # cid:br_ask_deleted_palm]
  ~ br_palm = true
  先把不该留的去了。你们想听的那个人，没有坐在这里。 # beat:br_seventh_eighth_8 # scene:br_room # cast:br_ning,br_peer # speaker:br_ning # mood:br_ning=neutral
  同门收回刚伸出去的纸。他肯说自己的改过，不等于能替妙真授徒。 # beat:br_seventh_eighth_9 # scene:br_room # cast:br_ning,br_peer # speaker:narrator
  -> ninth_tenth
* [问“不太像在用枪”是否就没有枪，先将一句评语和兵器实物分清。 # cid:br_ask_gun_words]
  ~ br_palm = false
  你若见着，倒可以问他肯不肯把枪借你。 # beat:br_seventh_eighth_10 # scene:br_room # cast:br_ning,br_peer # speaker:br_ning # mood:br_ning=amused
  你听出他还愿意笑，却没有因此领到那杆枪究竟怎样使的答案。 # beat:br_seventh_eighth_11 # scene:br_room # cast:br_ning,br_peer # speaker:narrator
  -> ninth_tenth

=== ninth_tenth ===
第九，“天外神魔”赫连无疆，旧总谱第二，五十余远走西域，三十余年不见中原，回来后宁真正试过一次。 # beat:br_ninth_tenth_1 # scene:br_room # cast:br_ning # speaker:narrator
他走的时候，不如我。回来以后，我没有胜算。 # beat:br_ninth_tenth_2 # scene:br_room # cast:br_ning # speaker:br_ning # mood:br_ning=neutral
旧位置没有替三十余年的空白作主。宁也没说他在西域一定学了哪部秘笈。 # beat:br_ninth_tenth_3 # scene:br_room # cast:br_ning # speaker:narrator
第十，“乾坤一圣”孟沧海，八卦旧总门主，旧总谱第一四年。宁真正动手时孟九十余，后来又见百岁后晚年武学；孟百岁退门务、闭门讲武二十余载。 # beat:br_ninth_tenth_4 # scene:br_room # cast:br_ning # speaker:narrator
他做天下第一的时候，还远没有后来高。 # beat:br_ninth_tenth_5 # scene:br_room # cast:br_ning # speaker:br_ning # mood:br_ning=neutral
十个名字都过了一遍，茶凉了。宁没有将第十划走，让你们把全盛的自己添进去。 # beat:br_ninth_tenth_6 # scene:br_room # cast:br_ning # speaker:narrator # fact:br_last_two
* [问赫连重返以后何处让宁无胜算，不用离开时的不如我遮住后来。 # cid:br_ask_hl_years]
  ~ br_return = true
  我自己试过。后来，就没有。 # beat:br_ninth_tenth_7 # scene:br_room # cast:br_ning # speaker:br_ning # mood:br_ning=neutral
  他没给一条能把三十余年全部填满的捷径。你把出走与归来分作两行。 # beat:br_ninth_tenth_8 # scene:br_room # cast:br_ning # speaker:narrator
  -> the_order
* [将孟九十余实际试手与百岁后再见分开，免得后人把二十余年讲武塞成同一天。 # cid:br_ask_meng_dates]
  ~ br_return = false
  写清什么时候。你们现在少写几个字，往后便多一个人问错。 # beat:br_ninth_tenth_9 # scene:br_room # cast:br_ning # speaker:br_ning # mood:br_ning=neutral
  你添回那几年的前后，笔已不如开头快，却少了一个含混的后来。 # beat:br_ninth_tenth_10 # scene:br_room # cast:br_ning # speaker:narrator
  -> the_order

=== the_order ===
同门将十人依次念完，又问第一对第二、第九对第十，是否便照这张纸定。 # beat:br_the_order_1 # scene:br_room # cast:br_ning,br_peer # speaker:narrator
我排的是我看他们怎样。人真到了眼前，还有年岁、伤病、兵器、心境，当日的一念。 # beat:br_the_order_2 # scene:br_room # cast:br_ning,br_peer # speaker:br_ning # mood:br_ning=neutral
这是宁亲自排下的总体判断，不是十人的实力被抹成全无高下，也不是每场结果已经写好。 # beat:br_the_order_3 # scene:br_room # cast:br_ning,br_peer # speaker:narrator
若真正交手，师祖全盛时呢？ # beat:br_the_order_4 # scene:br_room # cast:br_ning,br_peer # speaker:br_peer # mood:br_peer=neutral
宁沉默许久。 # beat:br_the_order_5 # scene:br_room # cast:br_ning,br_peer # speaker:narrator
一个也胜不了。 # beat:br_the_order_6 # scene:br_room # cast:br_ning,br_peer # speaker:br_ning # mood:br_ning=neutral
太玄后人后来据见闻私判，宁晚年大致稳在返真中段；依他所评，十人至少后段，前五更可能近尾段。这些仍各有说话的人，没有一条替天下保证某个明日。 # beat:br_the_order_7 # scene:br_room # cast:br_ning,br_peer # speaker:narrator
{
- br_source_first:
同门取你起初留了一栏的纸，要将三掌败抄进去，又看见栏头的亲试、亲见、消息。他停笔，先翻回慧空那页，问这个三是不是仍该改。 # beat:br_the_order_8 # scene:br_room # cast:br_ning,br_peer # speaker:narrator
- else:
同门取起初那张想送出山的净纸，三掌败仍在边上。他问这张若拿去改榜，究竟谁会知道师祖第三掌没出。开头那个改榜的问题，终于回到你们手上。 # beat:br_the_order_9 # scene:br_room # cast:br_ning,br_peer # speaker:narrator
}
{
- br_correct:
你将已经换好的两掌后止递给他。错句没再抄进新纸，他仍得自己把“若出”二字读给来取卷的人。 # beat:br_the_order_10 # scene:br_room # cast:br_ning,br_peer # speaker:narrator
- else:
你们还欠那一改。你从头抄清两掌后止，又写第三掌若出；同门等着，没赶上原想下山的那一拨人。 # beat:br_the_order_11 # scene:br_room # cast:br_ning,br_peer # speaker:narrator
}
* [最后问宁自己应在何处，肯接受这次他不再替你往下排。 # cid:br_ask_ning_place]
  ~ br_place = true
  宁只笑，没答。你还想问第十一，手已先从书边缩回来。 # beat:br_the_order_12 # scene:br_room # cast:br_ning,br_peer # speaker:narrator
  我若能排进去，又何必写他们？ # beat:br_the_order_13 # scene:br_room # cast:br_ning,br_peer # speaker:br_ning # mood:br_ning=neutral
  他合上旧册。这一问到此为止。 # beat:br_the_order_14 # scene:br_room # cast:br_ning,br_peer # speaker:narrator
  -> closed_book
* [先把全盛之时一个也胜不了完整抄回，不用省成天下只有十人比我强。 # cid:br_read_whole]
  ~ br_place = false
  另一个门人仍问师祖自己排在哪里。宁笑不答，最后合册。 # beat:br_the_order_15 # scene:br_room # cast:br_ning,br_peer # speaker:narrator
  我若能排进去，又何必写他们？ # beat:br_the_order_16 # scene:br_room # cast:br_ning,br_peer # speaker:br_ning # mood:br_ning=neutral
  你保留原问答，没有代他答一个第十一。 # beat:br_the_order_17 # scene:br_room # cast:br_ning,br_peer # speaker:narrator
  -> closed_book

=== closed_book ===
出了屋，同门仍捏着那页新纸，问你愿不愿一起拿到外头去。你看见每个名字旁边都留着某人某时见过、或还没有确讯的地方。 # beat:br_closed_book_1 # scene:br_veranda # cast:br_peer # speaker:narrator
这样讲，人家会嫌我们没给一个准数。 # beat:br_closed_book_2 # scene:br_veranda # cast:br_peer # speaker:br_peer # mood:br_peer=uneasy
我们见的，本来也不只有十个数。 # beat:br_closed_book_3 # scene:br_veranda # cast:br_peer # speaker:you
他抬头问，那还要不要讲。屋里的老人已不再为你们这一句出来。 # beat:br_closed_book_4 # scene:br_veranda # cast:br_peer # speaker:narrator
* [留下给下一位门人讲两掌与若出，先等他问完再交卷。 # cid:br_explain_to_reader]
  ~ br_after = 1
  那我也晚一日。你别又只说他错了，叫他自己念一遍。 # beat:br_closed_book_5 # scene:br_veranda # cast:br_peer # speaker:br_peer # mood:br_peer=neutral
  你应下，把纸放平。少讲一个痛快胜负，要多陪一个人坐一会儿。 # beat:br_closed_book_6 # scene:br_veranda # cast:br_peer # speaker:narrator
  -> after_copy
* [随同门去查能核对的旧记，只带问题与确有来源的抄件，不替人传一张新公榜。 # cid:br_find_record]
  ~ br_after = 2
  那我去问谁收着旧来帖。若人家不借呢？ # beat:br_closed_book_7 # scene:br_veranda # cast:br_peer # speaker:br_peer # mood:br_peer=neutral
  就先记没借到，不写看过。 # beat:br_closed_book_8 # scene:br_veranda # cast:br_peer # speaker:you
  他点头，将原想带走的整张名次纸留回屋里。 # beat:br_closed_book_9 # scene:br_veranda # cast:br_peer # speaker:narrator
  -> after_copy

=== after_copy ===
太玄旧册合上。十人没有因你问过便都出现在山外，未知的旧行踪也没有忽然补齐。你只多认得几句不能省掉的话。 # beat:br_after_copy_1 # scene:br_veranda # cast:none # speaker:narrator
{
- br_after == 1:
下一位门人念到慧空，果然先问第三掌是谁赢。你请他把若字再念一遍，他停下来，自己改了刚才那一问。半日过去，窗边的茶换过，旧卷还在两人中间。 # beat:br_after_copy_2 # scene:br_veranda # cast:none # speaker:narrator # ending:br_reader_after
-> END
- else:
收帖的人未肯立刻借卷，只答某年确有一封来信。你与同门记下可再来问的日子，空手走回去；今日没查清的，仍放在没查清的一栏。 # beat:br_after_copy_3 # scene:br_veranda # cast:none # speaker:narrator # ending:br_record_after
-> END
}
