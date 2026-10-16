// Source 6058–6165. Longmen +5 years, not +2. Ordinary attending disciple POV; no access to the closed bamboo night.
VAR ly_ask_xu = false
VAR ly_watch_gamble = false
VAR ly_wait_risk = false
VAR ly_record_plain = false
VAR ly_side_seat = false
VAR ly_loose_hand = false
VAR ly_road_question = false
VAR ly_expected_stop = false
VAR ly_after = 0
-> ten_li

=== ten_li ===
龙门秋会五年后，洛阳南郊。你随河中来客到会，十里外便有人问认不认得北榜的帖。许重山接过，先看姓名，再看自己该往哪棚去。 # beat:ly_ten_li_1 # scene:ly_arrival # cast:lm_xu,lm_luo,lm_he # speaker:narrator
贺已过百，罗如今河中第一；武陵石惊川也到了。五年前章复生是龙门最尊的外客，如今他在这里，也只是南榜三十六席的一人。 # beat:ly_ten_li_2 # scene:ly_arrival # cast:lm_xu,lm_luo,lm_he # speaker:narrator
别老看我。这里第一前面还得问哪张榜。 # beat:ly_ten_li_3 # scene:ly_arrival # cast:lm_xu,lm_luo,lm_he # speaker:lm_luo # mood:lm_luo=intent
你若迷路，至少别照着最响的第一两个字走。 # beat:ly_ten_li_4 # scene:ly_arrival # cast:lm_xu,lm_luo,lm_he # speaker:lm_xu # mood:lm_xu=amused
北榜穆刚二十四、窦长春二十一、魏子衡十八、袁定山十二；南榜伍绍清二十四、叶秋娘十八、郑海十二、谢青云第七，陆续有人相迎。木牌未换，坐下的人却让你重新估这一片地方。 # beat:ly_ten_li_5 # scene:ly_arrival # cast:lm_xu,lm_luo,lm_he # speaker:narrator
* [问许为何在门口先停，承认自己见了许多熟名，反而不知先看谁。 # cid:ly_ask_xu_first]
  ~ ly_ask_xu = true
  先看眼前这一场。名字不会替你把来手慢下来。 # beat:ly_ten_li_6 # scene:ly_arrival # cast:lm_xu,lm_luo,lm_he # speaker:lm_xu # mood:lm_xu=neutral
  他将自己带来的木刀交给门人，空出手去同旧相识行礼。你也收回追着每块名牌跑的眼。 # beat:ly_ten_li_7 # scene:ly_arrival # cast:lm_xu,lm_luo,lm_he # speaker:narrator
  -> shen_fifty_seven
* [在南榜来客中找章，向他行礼，不替五年前那九剑先编一场今日再胜。 # cid:ly_look_for_zhang]
  ~ ly_ask_xu = false
  章从另一棚认得河中来客，点头，仍先答身边的人。你没再挤去问他今日要压过谁，回到许旁边等第一场。 # beat:ly_ten_li_8 # scene:ly_arrival # cast:lm_xu,lm_luo,lm_he # speaker:narrator
  -> shen_fifty_seven

=== shen_fifty_seven ===
沈长庚对北榜第二十九断门刀史天魁。四十招尚不逊色，五十以后，沈几次进手都要把旁处一并放掉。 # beat:ly_shen_fifty_seven_1 # scene:ly_smallground # cast:lm_shenchang,ly_shi # speaker:narrator
第五十七，刀背贴肋，沈收掌认输。下场看见你盯着他手，先把自己的茶拿走。 # beat:ly_shen_fifty_seven_2 # scene:ly_smallground # cast:lm_shenchang,ly_shi # speaker:narrator
没断。别又一脸等我说没事。 # beat:ly_shen_fifty_seven_3 # scene:ly_smallground # cast:lm_shenchang,ly_shi # speaker:lm_shenchang # mood:lm_shenchang=sharp
前头那一掌，我也没敢轻接。 # beat:ly_shen_fifty_seven_4 # scene:ly_smallground # cast:lm_shenchang,ly_shi # speaker:ly_shi # mood:ly_shi=intent
沈哼一声，没因对手肯认前四十就讨回最后十七招。 # beat:ly_shen_fifty_seven_5 # scene:ly_smallground # cast:lm_shenchang,ly_shi # speaker:narrator
* [问沈从哪一下开始必须赌，听他愿讲多少，不只追问最后为何没赢。 # cid:ly_ask_when_gamble]
  ~ ly_watch_gamble = true
  原来出去还能回来，后来出去便得等他肯不肯放。你看见肋下，是最后才看见。 # beat:ly_shen_fifty_seven_6 # scene:ly_smallground # cast:lm_shenchang,ly_shi # speaker:lm_shenchang # mood:lm_shenchang=neutral
  他将茶抿一口，自己比了一下，叫你别站到他肘边。那一段仍有他要重新想的地方。 # beat:ly_shen_fifty_seven_7 # scene:ly_smallground # cast:lm_shenchang,ly_shi # speaker:narrator
  -> gun_and_knife
* [请史讲前四十为何也要小心，别因结果已知就把沈起初的本事抹平。 # cid:ly_compare_with_shi]
  ~ ly_watch_gamble = false
  我若当他总会输，头四十就能输给他。后面才有后面的事。 # beat:ly_shen_fifty_seven_8 # scene:ly_smallground # cast:lm_shenchang,ly_shi # speaker:ly_shi # mood:ly_shi=neutral
  沈听见，茶碗停一下，没夸这人会说，只叫他下回别把刀背放这么凉。 # beat:ly_shen_fifty_seven_9 # scene:ly_smallground # cast:lm_shenchang,ly_shi # speaker:narrator
  -> gun_and_knife

=== gun_and_knife ===
河朔第四铁枪镇河邢万里，对南榜第三十四断水刀夏镇南。前三十余邢甚至占优，五十后夏才真正抢入。 # beat:ly_gun_and_knife_1 # scene:ly_smallground # cast:ly_xing,ly_xia # speaker:narrator
九十四合，刀尖先到右肩。枪还在邢手里，今日这一场已到该停的地方。 # beat:ly_gun_and_knife_2 # scene:ly_smallground # cast:ly_xing,ly_xia # speaker:narrator
邢兄不是输在枪。你前五十想赢，我前五十想看。 # beat:ly_gun_and_knife_3 # scene:ly_smallground # cast:ly_xing,ly_xia # speaker:ly_xia # mood:ly_xia=neutral
我以为再逼一步，就不用等后头。 # beat:ly_gun_and_knife_4 # scene:ly_smallground # cast:ly_xing,ly_xia # speaker:ly_xing # mood:ly_xing=uneasy
夏没把他的枪说成坏，邢也没有扔下去换一门南榜刀。 # beat:ly_gun_and_knife_5 # scene:ly_smallground # cast:ly_xing,ly_xia # speaker:narrator
* [问夏只想看时怎样担前五十的险，不把等写成从开场就必胜。 # cid:ly_ask_cost_of_wait]
  ~ ly_wait_risk = true
  也得接得住。他枪若快半寸，你看也白看。 # beat:ly_gun_and_knife_6 # scene:ly_smallground # cast:ly_xing,ly_xia # speaker:ly_xia # mood:ly_xia=intent
  你记得沈刚才说过出去还能不能回。两场都有人等，能等下来的脚却不是同一只。 # beat:ly_gun_and_knife_7 # scene:ly_smallground # cast:ly_xing,ly_xia # speaker:narrator
  -> shi_half_sword
* [问邢下回仍会不会问这一场，让输的人有自己的下一句，不替他宣布今后必输。 # cid:ly_ask_xing_next]
  ~ ly_wait_risk = false
  问。先把今日五十以后想清。 # beat:ly_gun_and_knife_8 # scene:ly_smallground # cast:ly_xing,ly_xia # speaker:ly_xing # mood:ly_xing=intent
  他收枪，没许再来便翻成胜。夏答下次另约，你这才知道认输也会留下下一次真来的日子。 # beat:ly_gun_and_knife_9 # scene:ly_smallground # cast:ly_xing,ly_xia # speaker:narrator
  -> shi_half_sword

=== shi_half_sword ===
石惊川对江宁二十四剑第二照水剑陆怀秋，一百三十七合，半剑胜。收剑时，陆仍将那半剑的位置指给他，两人又各说一遍。 # beat:ly_shi_half_sword_1 # scene:ly_records # cast:lm_shi,ly_lu # speaker:narrator
这回先到，不是从此每回都先到。 # beat:ly_shi_half_sword_2 # scene:ly_records # cast:lm_shi,ly_lu # speaker:lm_shi # mood:lm_shi=intent
那下一次，我会把这里换过。 # beat:ly_shi_half_sword_3 # scene:ly_records # cast:lm_shi,ly_lu # speaker:ly_lu # mood:ly_lu=neutral
主事册第一次在武陵回雁门石惊川后添“此人，可以看”。不是直接进南榜，也不是门人替他写的一句好听话。 # beat:ly_shi_half_sword_4 # scene:ly_records # cast:lm_shi,ly_lu # speaker:narrator
你若回武陵报信，就报这五个字。多一字，也别算我说的。 # beat:ly_shi_half_sword_5 # scene:ly_records # cast:lm_shi,ly_lu # speaker:lm_shi # mood:lm_shi=amused
* [问这五字要看什么，愿等后续不同对手，不催石拿今天一胜换席。 # cid:ly_ask_see_what]
  ~ ly_record_plain = true
  先看下次我还能不能把他那半剑还回来。 # beat:ly_shi_half_sword_6 # scene:ly_records # cast:lm_shi,ly_lu # speaker:ly_lu # mood:ly_lu=amused
  石笑，答那便得再约。你听见两个名家把主事册外的日子也接上了。 # beat:ly_shi_half_sword_7 # scene:ly_records # cast:lm_shi,ly_lu # speaker:narrator
  -> grey_robe
* [问石是否还愿继续走，给武陵回信写明能到的时日，不替他许必入大榜。 # cid:ly_ask_shi_future]
  ~ ly_record_plain = false
  愿意。也得先给门里一个准信。我不是不回家了。 # beat:ly_shi_half_sword_8 # scene:ly_records # cast:lm_shi,ly_lu # speaker:lm_shi # mood:lm_shi=neutral
  你将回帖放回他行囊上，先让本人写，不拿随行便代替他决定终点。 # beat:ly_shi_half_sword_9 # scene:ly_records # cast:lm_shi,ly_lu # speaker:narrator
  -> grey_robe

=== grey_robe ===
第三日，灰袍老人入场，没有唱名，袁定山、谢青云与主事先后起身。九天追风柳成章，南榜第三、总谱第二十七。 # beat:ly_grey_robe_1 # scene:ly_sideseat # cast:ly_liu,lm_xu # speaker:narrator
许此生第一次真正见总谱人物。他没有上去求一套刀，只将身旁那张空椅让开。 # beat:ly_grey_robe_2 # scene:ly_sideseat # cast:ly_liu,lm_xu # speaker:narrator
柳老只来观战。 # beat:ly_grey_robe_3 # scene:ly_sideseat # cast:ly_liu,lm_xu # speaker:lm_xu # mood:lm_xu=intent
观战也得有地方坐。你们别全站在我前头。 # beat:ly_grey_robe_4 # scene:ly_sideseat # cast:ly_liu,lm_xu # speaker:ly_liu # mood:ly_liu=amused
一群本已很高的名字，忽然又有了自己行礼的方向。你退一步，发觉柳的眼睛已越过名牌，看向刚收势的手。 # beat:ly_grey_robe_5 # scene:ly_sideseat # cast:ly_liu,lm_xu # speaker:narrator
* [将挡着视线的椅移开，照许说的先看，不为柳到场就停下别人的真较艺。 # cid:ly_make_seat]
  ~ ly_side_seat = true
  柳坐下，问手的两人继续。你没听见一道要把全场重排的吩咐，只有身边衣袖落回椅侧。 # beat:ly_grey_robe_6 # scene:ly_sideseat # cast:ly_liu,lm_xu # speaker:narrator
  -> two_weapons
* [等一场停后问柳为何不下场，接他只来看的答复，不把总谱27当成今日必须再证明一次。 # cid:ly_ask_no_bout]
  ~ ly_side_seat = false
  别人打他们的。我看他们到哪里了。 # beat:ly_grey_robe_7 # scene:ly_sideseat # cast:ly_liu,lm_xu # speaker:ly_liu # mood:ly_liu=neutral
  他指场内，你也回头。不是每一位来客都得先赢一场，才配坐着听。 # beat:ly_grey_robe_8 # scene:ly_sideseat # cast:ly_liu,lm_xu # speaker:narrator
  -> two_weapons

=== two_weapons ===
第六日，北榜第十四双鞭镇北郭洪，对东海海天门内院第四席叶观澜。两人年岁相若，郭七十余；叶没有中原榜籍。 # beat:ly_two_weapons_1 # scene:ly_central # cast:ly_guo,ly_ye # speaker:narrator
十余招双鞭封路，叶三次不得入；第十三海天斜步，反从最密处穿进。第五十九，双鞭合棍，旁人都以为兵器要脱。 # beat:ly_two_weapons_2 # scene:ly_central # cast:ly_guo,ly_ye # speaker:narrator
叶松一手，黑木短棍滑出半尺，反锁郭右腕。你方才想喊的危险，停在嘴边。 # beat:ly_two_weapons_3 # scene:ly_central # cast:ly_guo,ly_ye # speaker:narrator
* [看松手后棍与右腕的位置，别把抓得更紧当作所有兵器的答案。 # cid:ly_follow_half_chi]
  ~ ly_loose_hand = true
  半尺滑过，另一只手仍在。郭也没因此让整条右臂全交出去，左鞭已换来。你得跟着看，不是记住松手便够。 # beat:ly_two_weapons_4 # scene:ly_central # cast:ly_guo,ly_ye # speaker:narrator
  -> one_oh_six
* [看郭怎样从反锁中重取距离，不因叶无榜籍便在心里先替郭找轻敌借口。 # cid:ly_watch_guo_return]
  ~ ly_loose_hand = false
  郭转腕，棍没忽然放松，左鞭先逼一处空。叶也随之转，哪一方此刻少看半步，都要真付在手上。 # beat:ly_two_weapons_5 # scene:ly_central # cast:ly_guo,ly_ye # speaker:narrator
  -> one_oh_six

=== one_oh_six ===
第一百零六，左鞭封顶、右鞭横肋，潮生棍从两鞭间直入胸前，右鞭也已横在叶肩外。 # beat:ly_one_oh_six_1 # scene:ly_central # cast:ly_guo,ly_ye,ly_steward # speaker:narrator
止。 # beat:ly_one_oh_six_2 # scene:ly_central # cast:ly_guo,ly_ye,ly_steward # speaker:ly_steward # mood:ly_steward=sharp
两人同时收。郭腕上留着刚才一圈红，叶将棍握回常处，没谁为没有中原榜籍便先多退一步。 # beat:ly_one_oh_six_3 # scene:ly_central # cast:ly_guo,ly_ye,ly_steward # speaker:narrator
下回这一手，我也换。 # beat:ly_one_oh_six_4 # scene:ly_central # cast:ly_guo,ly_ye,ly_steward # speaker:ly_guo # mood:ly_guo=intent
好。到海上来，也得让我先看一趟你的船。 # beat:ly_one_oh_six_5 # scene:ly_central # cast:ly_guo,ly_ye,ly_steward # speaker:ly_ye # mood:ly_ye=neutral
两人平手问艺，不替海天内院第四直接换一张北榜第十四。 # beat:ly_one_oh_six_6 # scene:ly_central # cast:ly_guo,ly_ye,ly_steward # speaker:narrator # fact:ly_two_scales
* [到柳身旁问这场能否看成两种排名等价，肯听他不肯给出的那把尺。 # cid:ly_ask_liu_road]
  ~ ly_road_question = true
  都还在路上。 # beat:ly_one_oh_six_7 # scene:ly_sideseat # cast:ly_liu,ly_ye # speaker:ly_liu # mood:ly_liu=neutral
  他没替你把四与十四换成同一个数。你看着郭揉腕，叶还在说第十三步，看似都能列出的数字，在他们手里又成了下回要问的地方。 # beat:ly_one_oh_six_8 # scene:ly_sideseat # cast:ly_liu,ly_ye # speaker:narrator
  -> old_tea
* [先问叶海天席位除了问手还管什么，不要把没列榜当没人见过他的真本事。 # cid:ly_ask_ye_sea]
  ~ ly_road_question = false
  门里还有门里的事。今日先把这一场问完，不能拿我一个人替整座海天门排位置。 # beat:ly_one_oh_six_9 # scene:ly_sideseat # cast:ly_liu,ly_ye # speaker:ly_ye # mood:ly_ye=intent
  后来有人问柳，他只答都还在路上。你没把自己听过两句话便说成已知道两门究竟差几名。 # beat:ly_one_oh_six_10 # scene:ly_sideseat # cast:ly_liu,ly_ye # speaker:narrator
  -> old_tea

=== old_tea ===
会后段，北榜第五严仲山与南榜第四宁文昭，本来饮茶谈二十三年前未决旧战，仍走上问艺坪。 # beat:ly_old_tea_1 # scene:ly_latefight # cast:ly_yan,ly_ning # speaker:narrator
前五十余还论艺，六十以后，谁先赢过谁的心又压回来。宁十二骨铁扇越收越近，严短掌也不再只试一手。 # beat:ly_old_tea_2 # scene:ly_latefight # cast:ly_yan,ly_ning # speaker:narrator
第八十一，宁复使二十三年前那一式，严早等了二十三年。一个锁扇轴，一个直入胸；明知下一手会重伤，仍都往里去。 # beat:ly_old_tea_3 # scene:ly_latefight # cast:ly_yan,ly_ning # speaker:narrator
* [等他们自己收，先不喊出胜负；看清自己愿望不能代两人的手停下来。 # cid:ly_expect_stop]
  ~ ly_expected_stop = true
  你以为方才郭叶都肯收，这边也总会在同一刻收。扇轴仍进，严的腕也不退，两场并没有因都叫问艺就走成同一个结局。 # beat:ly_old_tea_4 # scene:ly_latefight # cast:ly_yan,ly_ning # speaker:narrator
  -> both_hands
* [认出已经要伤，退开别挤近坪边，不把再看一招当成自己不必承担的热闹。 # cid:ly_recognize_harm]
  ~ ly_expected_stop = false
  你退，别人还想挤。柳已从侧席起身，没等一群旁观者先说完究竟该不该停。 # beat:ly_old_tea_5 # scene:ly_latefight # cast:ly_yan,ly_ning # speaker:narrator
  -> both_hands

=== both_hands ===
灰影入两人中间。左搭严腕，右按宁扇骨，没有震飞人，也没折断兵器。 # beat:ly_both_hands_1 # scene:ly_latefight # cast:ly_liu,ly_yan,ly_ning # speaker:narrator
松手。收扇。 # beat:ly_both_hands_2 # scene:ly_latefight # cast:ly_liu,ly_yan,ly_ning # speaker:ly_liu # mood:ly_liu=sharp
两位真的停。严先问若晚一步怎样，柳说你左臂废半年，他右肩更久。宁仍不服，问为何自己更重。 # beat:ly_both_hands_3 # scene:ly_latefight # cast:ly_liu,ly_yan,ly_ning # speaker:narrator
为何我更重？ # beat:ly_both_hands_4 # scene:ly_latefight # cast:ly_liu,ly_yan,ly_ning # speaker:ly_ning # mood:ly_ning=sharp
因为你还想赢。 # beat:ly_both_hands_5 # scene:ly_latefight # cast:ly_liu,ly_yan,ly_ning # speaker:ly_liu # mood:ly_liu=intent
严没有趁这句笑宁，手也刚从那只腕上收回来。二十三年旧账，今日以平字了结，未发生的伤不被写成已经受过。 # beat:ly_both_hands_6 # scene:ly_latefight # cast:ly_liu,ly_yan,ly_ning # speaker:narrator # fact:ly_stop
* [回到许身旁，请他让自己真试一次刀停以后还能怎样走；不把今日的止字当作会使刀。 # cid:ly_return_trial]
  ~ ly_after = 1
  刀给你。你别等我喊止，才想起脚下挤到哪儿。 # beat:ly_both_hands_7 # scene:ly_latefight # cast:lm_xu,ly_liu,ly_yan # speaker:lm_xu # mood:lm_xu=intent
  你收回半截，后脚却先卡住。柳那双手没有因此变成你已学会的一招，眼前这一脚得许真推一回才知道。 # beat:ly_both_hands_8 # scene:ly_latefight # cast:lm_xu,ly_liu,ly_yan # speaker:narrator
  -> road_after
* [随石去拿主事回帖，问下一次为何仍愿来，不把此人可以看当作终于到了终点。 # cid:ly_follow_next_post]
  ~ ly_after = 2
  今天看了这么多，你还以为有个到头？ # beat:ly_both_hands_9 # scene:ly_latefight # cast:lm_shi,lm_xu,ly_liu # speaker:lm_shi # mood:lm_shi=amused
  他取回正式邀帖，亲写门里何时能归。你有一段想问的九十四合，只能等他把给武陵的信先写完。 # beat:ly_both_hands_10 # scene:ly_latefight # cast:lm_shi,lm_xu,ly_liu # speaker:narrator
  -> road_after

=== road_after ===
洛阳的灯还亮。门人的刀、远客的剑，都没有因为看过总谱人物便自行好用；会里有新的邀约，也有要回去的人。 # beat:ly_road_after_1 # scene:ly_return # cast:lm_xu,lm_shi # speaker:narrator
{
- ly_after == 1:
你在客舍院里试到第三遍，终于肯让许只推一下便停，先问自己为什么退不到原来以为的地方。次日回门里，要讲的不只是哪位名家赢。 # beat:ly_road_after_2 # scene:ly_return # cast:lm_xu,lm_shi # speaker:narrator # ending:ly_trial_after
-> END
- else:
石写完归期，才来听你问九十四合。你等到一段真正愿讲的话，也错过外头另一场热闹；这趟洛阳，留下的是能继续问的日子。 # beat:ly_road_after_3 # scene:ly_return # cast:lm_xu,lm_shi # speaker:narrator # ending:ly_post_after
-> END
}
