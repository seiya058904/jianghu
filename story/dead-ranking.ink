// Source: 宋世江湖20214–24155. Anonymous bout reconstructions are compatible additions; three identities and fixed records stay separate.
VAR dr_letter_hand = false
VAR dr_practice = false
VAR dr_liang_private = false
VAR dr_claim_separate = false
VAR dr_asked_reopen = false
VAR dr_wants_test = false
VAR dr_boat_wait = false
VAR dr_clinic_time = false
VAR dr_zhao_direct = false
VAR dr_each_name = false
VAR dr_two_accounts = false
VAR dr_tell_three = false
VAR dr_each_seen = false
VAR dr_old_worker = false
VAR dr_gu_wait = false
VAR dr_gu_own_words = false
VAR dr_land_trace = false
VAR dr_house_plain = false
VAR dr_names_plain = false
VAR dr_life_limits = false
VAR dr_letter_private = false
VAR dr_new_name = false
VAR dr_face_alone = false
VAR dr_faces_recorded = false
VAR dr_face_askers = false
VAR dr_first_sword = 0
VAR dr_second_sword = 0
VAR dr_third_sword = 0
VAR dr_pov = 0
VAR dr_mid_response = 0
VAR dr_bow_response = 0
VAR dr_career = 0
VAR dr_lesson = 0
-> dead_letter

=== dead_letter ===
二月初七，一张折过三次的旧纸送到榜房。你周砚，三十六，已见惯自报三十招胜某人的帖子；今天落款那三个字却让你看第二遍时笑不出来。 # beat:dr_dead_letter_1 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
谢藏锋。旧江汉第七，涉白水渡案，失踪，后以死论。纸上却说未死，十八年前欠的位置，今年要一席席自己取回来。 # beat:dr_dead_letter_2 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
若真回来，先留一席？ # beat:dr_dead_letter_3 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:dr_apprentice # mood:dr_apprentice=uneasy
陆观棋蹲院里晒旧册，看完先说字不是他的。老人十八年前见过，出事前一月，谢还来拍过这张桌子。 # beat:dr_dead_letter_4 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
赢十一，平第五，他就要往前。第六没输过，也没同他打。第五后来又胜第三，这些都不肯先看。 # beat:dr_dead_letter_5 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:dr_lu # mood:dr_lu=intent
那榜不就是一人一台？ # beat:dr_dead_letter_6 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:dr_apprentice # mood:dr_apprentice=neutral
二十四个人，不是二十四座擂台。先把晒着的这卷接住，别叫风也给你排一场。 # beat:dr_dead_letter_7 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:dr_lu # mood:dr_lu=amused
* [先问老人究竟认得什么，不拿一句字不像便替死者断定又是假。 # cid:dr_ask_letter_hand]
  ~ dr_letter_hand = true
  您认字，还是认当年那封信？ # beat:dr_dead_letter_8 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:you
  当年在这里写过。人得另找，字不像也只先记字不像。 # beat:dr_dead_letter_9 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:dr_lu # mood:dr_lu=neutral
  你把纸移到不晒烫的桌边，那三个字还没变成一个可放回现榜的人。 # beat:dr_dead_letter_10 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
  -> old_dream
* [先让老人把当年当面争榜的那个人讲完，不只把旧录一句涉案念给徒弟。 # cid:dr_ask_old_visit]
  ~ dr_letter_hand = false
  四十四，年轻得很。气得骂完要我迟早往前写，一个月后白水渡便出事。 # beat:dr_dead_letter_11 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:dr_lu # mood:dr_lu=intent
  你记下他的怒，不把生气当杀人证据。徒弟替你压住将卷起的一角，终于没再急着留座。 # beat:dr_dead_letter_12 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
  -> old_dream

=== old_dream ===
你也有过争榜的时候。十七初到榜房抄字，二十陆教你编榜；那时学剑不坏，却被一个四十多的药商三十七招胜，回去三个月，再问六十一，仍败。 # beat:dr_old_dream_1 # scene:dr_practice # cast:dr_apprentice # speaker:narrator
第三次想去，人已急病死。你再也不知道以后能不能赢，来这里抄、查、跟老人出门，真正核战绩已十六年。武功没丢，只不再真争。 # beat:dr_old_dream_2 # scene:dr_practice # cast:dr_apprentice # speaker:narrator
后悔？ # beat:dr_old_dream_3 # scene:dr_practice # cast:dr_apprentice # speaker:dr_apprentice # mood:dr_apprentice=uneasy
偶尔。药商死早了，第四场还没打。 # beat:dr_old_dream_4 # scene:dr_practice # cast:dr_apprentice # speaker:you
第三场也没打！ # beat:dr_old_dream_5 # scene:dr_practice # cast:dr_apprentice # speaker:dr_apprentice # mood:dr_apprentice=amused
你抬眼，他缩一下，又忍不住笑。你也笑，那位老人再没有机会纠正你这句。 # beat:dr_old_dream_6 # scene:dr_practice # cast:dr_apprentice # speaker:narrator
{
- dr_letter_hand:
陆认的是当年那封信，不是只认字。你把这问法记下了：先问人从哪里认起，再谈像不像。 # beat:dr_old_dream_7 # scene:dr_practice # cast:dr_apprentice # speaker:narrator
- else:
那场争榜你听完才走。旧录涉案一句之外，卷里因此多了一个真活过、真来拍过这张桌子的样子。 # beat:dr_old_dream_8 # scene:dr_practice # cast:dr_apprentice # speaker:narrator
}
* [把剑拿起，陪徒弟接一轮；还会出手，也不必为做了榜房人就宣称从未想赢。 # cid:dr_pickup_training]
  ~ dr_practice = true
  他一进你退半步，剑便从他肩外回来。你叫他看脚，别因师父会写榜就以为这一手也只能写。 # beat:dr_old_dream_9 # scene:dr_practice # cast:dr_apprentice # speaker:narrator
  这回练完，该查的信仍在那里等。 # beat:dr_old_dream_10 # scene:dr_practice # cast:dr_apprentice # speaker:narrator
  -> liang_house
* [让徒弟照当年药商那条路进，自己重走一次，不把多年后那场没打完想成必胜。 # cid:dr_show_old_loss]
  ~ dr_practice = false
  你走到六十一招常停的位置，仍找不出一个能叫死去的人照样回答的下一步。徒弟没再替你说今日一定能赢，只问刚才怎么换。 # beat:dr_old_dream_11 # scene:dr_practice # cast:dr_apprentice # speaker:narrator
  来，你真接一次。 # beat:dr_old_dream_12 # scene:dr_practice # cast:dr_apprentice # speaker:you
  -> liang_house

=== liang_house ===
来信十九日后，江汉第二十一断江掌梁启山夜约出城，清晨回，右臂肿得抬不起来。你上门，他先看一眼门外弟子，才亲口说输了，谢藏锋。 # beat:dr_liang_house_1 # scene:dr_lianghouse # cast:dr_liang # speaker:narrator
看清脸？ # beat:dr_liang_house_2 # scene:dr_lianghouse # cast:dr_liang # speaker:you
没有。声音变了，身形差不多。 # beat:dr_liang_house_3 # scene:dr_lianghouse # cast:dr_liang # speaker:dr_liang # mood:dr_liang=intent
剑也能冒。 # beat:dr_liang_house_4 # scene:dr_lianghouse # cast:dr_liang # speaker:you
他用回灯照影！年轻我见过两次，一次真吃过，一模一样。 # beat:dr_liang_house_5 # scene:dr_lianghouse # cast:dr_liang # speaker:dr_liang # mood:dr_liang=sharp
他左手压着桌边，右袖动一下便停。门外人还在竖耳等师父说几招，你得决定这份细问在哪儿接下去。 # beat:dr_liang_house_6 # scene:dr_lianghouse # cast:dr_liang # speaker:narrator
* [请弟子先让开，细节私下复走，公开先记亲口认负；另走一日请可信人补核。 # cid:dr_liang_private]
  ~ dr_liang_private = true
  你多留一天，另约见过那一路剑的人来问。没有叫梁当着所有弟子再把自己怎样输抖一遍，外面却开始猜榜房为何不肯把细节都说。 # beat:dr_liang_house_7 # scene:dr_lianghouse # cast:dr_liang # speaker:narrator
  我认输，不是叫你替我藏一场。该核，你明日来。 # beat:dr_liang_house_8 # scene:dr_lianghouse # cast:dr_liang # speaker:dr_liang # mood:dr_liang=intent
  -> liang_memory
* [请门下可信者在场听完整复原，把招数与认负一起说明，先让他们能逐处核。 # cid:dr_liang_open]
  ~ dr_liang_private = false
  弟子在旁认过位置，口述不再只压在你一支笔里。消息也传得快，城里第二日便有人笑梁败给死人。 # beat:dr_liang_house_9 # scene:dr_lianghouse # cast:dr_liang # speaker:narrator
  我说给能核的人，不是给他们说书的。 # beat:dr_liang_house_10 # scene:dr_lianghouse # cast:dr_liang # speaker:dr_liang # mood:dr_liang=intent
  你没有为公开便能核得快，就说他该把那些笑也一起受了。 # beat:dr_liang_house_11 # scene:dr_lianghouse # cast:dr_liang # speaker:narrator
  -> liang_memory

=== liang_memory ===
这里暂借梁的口述回到城外。你是那名自称谢藏锋的持剑者；脸仍未被看清，梁记得的只够复原他眼前这一段，不是周砚忽然亲历当夜。 # beat:dr_liang_memory_1 # scene:dr_nightground # cast:dr_liang # speaker:narrator
掌从右边逼入，你先把重心送向左，脚却留着一处还可回。梁追上，以为已认得你只能走开的地方。 # beat:dr_liang_memory_2 # scene:dr_nightground # cast:dr_liang # speaker:narrator
* [借他追来的那点力转回右侧，不用猛快遮住换重心的一瞬。 # cid:dr_borrow_chase]
  ~ dr_first_sword = 1
  你让开的不是整个人都失控。梁踏入，那一步追势才给你转回的地方；掌还指着左边，你的剑已从右侧回来。 # beat:dr_liang_memory_3 # scene:dr_nightground # cast:dr_liang # speaker:narrator
  -> eighty_three
* [让承重的左脚真把这一步接完，再换回，不因怕人看见脚下便急收。 # cid:dr_hold_bad_foot]
  ~ dr_first_sword = 2
  左脚落重，你没有假装它同另一只一样轻快。梁从那一点追，转回的路却正借他来得够深才重新打开。 # beat:dr_liang_memory_4 # scene:dr_nightground # cast:dr_liang # speaker:narrator
  -> eighty_three

=== eighty_three ===
第八十三招的结果，回到梁亲口说的那一场：他输了，右臂受伤，对方曾有能下杀手的机会。至于人是谁，仍未证明。 # beat:dr_eighty_three_1 # scene:dr_lianghouse # cast:dr_liang # speaker:narrator
您认负？ # beat:dr_eighty_three_2 # scene:dr_lianghouse # cast:dr_liang # speaker:you
老子说了输了，还要怎么说！ # beat:dr_eighty_three_3 # scene:dr_lianghouse # cast:dr_liang # speaker:dr_liang # mood:dr_liang=sharp
你落下梁启山亲认负，不多添一个已认定谢藏锋亲至。 # beat:dr_eighty_three_4 # scene:dr_lianghouse # cast:dr_liang # speaker:narrator
回程徒弟问十个人都认剑还不算么，你让他先分清每个人真看见哪一层。 # beat:dr_eighty_three_5 # scene:dr_road # cast:dr_apprentice # speaker:narrator
那什么也不能信？ # beat:dr_eighty_three_6 # scene:dr_road # cast:dr_apprentice # speaker:dr_apprentice # mood:dr_apprentice=uneasy
是什么证据，就信到什么程度。不是都不信。 # beat:dr_eighty_three_7 # scene:dr_road # cast:dr_apprentice # speaker:you
* [把八十三与对方自称分开，承认真败不必等身份查清才记。 # cid:dr_keep_claim_separate]
  ~ dr_claim_separate = true
  徒弟原想把输了那行也空下，你叫他写回去。空着的只有还不知的人，梁受的那一下不会因你没查完就没有。 # beat:dr_eighty_three_8 # scene:dr_road # cast:dr_apprentice # speaker:narrator
  -> zhao_memory
* [让徒弟先问一个自报三十招胜第十的来客，第十知不知道这场。 # cid:dr_ask_opponent_knows]
  ~ dr_claim_separate = false
  来客原本很响，听见要去问第十，才改说是酒楼听朋友讲的。徒弟看你一眼，终于没将那一场也添给旧名。 # beat:dr_eighty_three_9 # scene:dr_road # cast:dr_apprentice # speaker:narrator
  先问他本人。这回知道从哪里起了？ # beat:dr_eighty_three_10 # scene:dr_road # cast:dr_apprentice # speaker:you
  -> zhao_memory

=== zhao_memory ===
其后，二十七日的新报到房，第十六青蒲剑赵问川败，六十九招。这次口述里，那名自称谢藏锋者右脚更重，出手却像先等你把会走的路都送到面前。 # beat:dr_zhao_memory_1 # scene:dr_dayground # cast:dr_zhao # speaker:narrator
仍是复原，不是凭你手里有三份纸便已知道三个名字。你暂借持剑者所能做的一步，面对赵还在变的来剑。 # beat:dr_zhao_memory_2 # scene:dr_dayground # cast:dr_zhao # speaker:narrator
{
- dr_claim_separate:
梁亲认的那场负与对方自称，你分开记着。到赵这一份，卷上也是两行：一场真败，一个还未证明的人。 # beat:dr_zhao_memory_3 # scene:dr_dayground # cast:dr_zhao # speaker:narrator
- else:
自报三十招胜第十那位来客的事你还留着。徒弟再听旁人转述战绩，先问本人知不知道这一场。 # beat:dr_zhao_memory_4 # scene:dr_dayground # cast:dr_zhao # speaker:narrator
}
* [不急着演完整一套照夜剑，先看赵真正怎样递手，等他下一步露出。 # cid:dr_watch_actual_person]
  ~ dr_second_sword = 1
  赵回剑时手比脚先回，你没有追那一截快。等他想从旧路再进，剑已经等在他这次真正会来的侧边。 # beat:dr_zhao_memory_5 # scene:dr_dayground # cast:dr_zhao # speaker:narrator
  -> sixty_nine
* [留一个他会试的空，再从他真正试过的反应里换，不拿预想替他做完。 # cid:dr_leave_false_opening]
  ~ dr_second_sword = 2
  赵没照你最先猜的来，你便把那一猜放掉。右脚接重，手从另一处续出，没有为一个像师父的姿势先停住眼前的人。 # beat:dr_zhao_memory_6 # scene:dr_dayground # cast:dr_zhao # speaker:narrator
  -> sixty_nine

=== sixty_nine ===
六十九，赵亲认败。一个月后，第十二伏波刀何定远也败，一百一十四。三个人、三种兵器、三份口述，都说对方自称谢藏锋。 # beat:dr_sixty_nine_1 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
何说对方出剑前会吸一口气。你翻到那一处，徒弟以为总算能把三份合成一个从二十一往上走的人。 # beat:dr_sixty_nine_2 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
先别合。何这一场，你也得问完。 # beat:dr_sixty_nine_3 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:dr_lu # mood:dr_lu=intent
-> he_memory

=== he_memory ===
何的刀从下路提起。口述中的持剑人手很稳，转折细，出剑前那口气不急着藏。你此刻仍在复原第三场，不能凭读者想知道是谁便先替榜房写名字。 # beat:dr_he_memory_1 # scene:dr_knifeground # cast:dr_he # speaker:narrator
何刀势逼紧，你手上仍有余地，若只想叫死人再添一胜，眼前这个真会受伤的人就很容易变成一行数字。 # beat:dr_he_memory_2 # scene:dr_knifeground # cast:dr_he # speaker:narrator
* [从刀背逼来的细处转开，争一条能续的线，不为像旧谱便将对方硬拖到底。 # cid:dr_turn_small]
  ~ dr_third_sword = 1
  你吸一口气，剑从将合的两线间换出，何原想一压便紧的地方被一点点松开。他真得再挪脚，不能只靠刀重便续原路。 # beat:dr_he_memory_3 # scene:dr_knifeground # cast:dr_he # speaker:narrator
  -> one_fourteen
* [手上留一回能停的位置，先把他真能续的刀引尽，不将胜负问成取命。 # cid:dr_keep_last_hand]
  ~ dr_third_sword = 2
  刀临近，你没有急着硬撞，转折一点点将它送离能再起的一边。最后一线显出时，手仍稳得能停，不必靠多伤一下证明不是假赢。 # beat:dr_he_memory_4 # scene:dr_knifeground # cast:dr_he # speaker:narrator
  -> one_fourteen

=== one_fourteen ===
一百一十四，何败。来人留下活路，不改何亲认的负。三份口述如今都在桌上，酒楼也已卖照夜剑旧战十二篇，八篇竟是假的。 # beat:dr_one_fourteen_1 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
还有个说受过谢前辈教。 # beat:dr_one_fourteen_2 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:dr_apprentice # mood:dr_apprentice=amused
多大？ # beat:dr_one_fourteen_3 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:you
只比谢小两岁，追问改说神交。 # beat:dr_one_fourteen_4 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:dr_apprentice # mood:dr_apprentice=neutral
活人会驳，死人不会。先别笑完就信下一封。 # beat:dr_one_fourteen_5 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:dr_lu # mood:dr_lu=amused
七十多封信，真有用不到五封。有人催先留谢一席，陆问留给谁，人呢；十八年前若错查十八年前，今天若假也要查，不能怕过去错就故意再错。 # beat:dr_one_fourteen_6 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
* [问若没有这些冒名胜绩，榜房还会不会重新看旧案。 # cid:dr_ask_reopen_plain]
  ~ dr_asked_reopen = true
  陆沉默很久，说大概不会，人手少、旧证重，人又被当死了。 # beat:dr_one_fourteen_7 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
  所以他们对了？ # beat:dr_one_fourteen_8 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:you
  我说会不会查，没说对不对。现在查。 # beat:dr_one_fourteen_9 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:dr_lu # mood:dr_lu=intent
  -> shen_three
* [把白水旧卷也放回桌上，眼前身份继续查，不让查假成为不看旧冤的借口。 # cid:dr_put_old_case_back]
  ~ dr_asked_reopen = false
  若他们没这三场，大概不会再翻。旧案每年来几十件，不是拿这句便能说每件都已尽力。 # beat:dr_one_fourteen_10 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:dr_lu # mood:dr_lu=intent
  老人把那卷推近，叫你查，不用承认以前不够便先放过今天的假。 # beat:dr_one_fourteen_11 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
  -> shen_three

=== shen_three ===
陆请来沈霁娘，秋水刀，六十八，头发白半，右腿旧伤走稍跛。旧江汉十七，最高十四，伤后自行退；真同谢藏锋问过三次，一胜、一负、一平。 # beat:dr_shen_three_1 # scene:dr_shenyard # cast:dr_shen,dr_lu # speaker:narrator
三份完整口述她看两日，第三日才说不是一个人。梁那份左脚吃重，赵那份右脚，何出剑前吸气。 # beat:dr_shen_three_2 # scene:dr_shenyard # cast:dr_shen,dr_lu # speaker:narrator
打法能变，十八年也能改习惯。 # beat:dr_shen_three_3 # scene:dr_shenyard # cast:dr_shen,dr_lu # speaker:you
所以我没说他们不是谢藏锋。我说，不是一个人。 # beat:dr_shen_three_4 # scene:dr_shenyard # cast:dr_shen,dr_lu # speaker:dr_shen # mood:dr_shen=intent
你原想接着问的那句停了，老人已将三页分开，不把一句像与不像揉成同一个结论。 # beat:dr_shen_three_5 # scene:dr_shenyard # cast:dr_shen,dr_lu # speaker:narrator
{
- dr_first_sword == 1 and dr_second_sword == 1 and dr_third_sword == 1:
三场你都先看对面真正会怎样来。借追势、等递手、从刀背细处转开，纸上像一路，脚手与呼吸却各有不同。 # beat:dr_shen_three_6 # scene:dr_shenyard # cast:dr_shen,dr_lu # speaker:dr_shen # mood:dr_shen=intent
她这么一说，你才发觉三次复原能相接，不等于真由同一个人走完。 # beat:dr_shen_three_7 # scene:dr_shenyard # cast:dr_shen,dr_lu # speaker:narrator
- else:
八十三那场，{dr_first_sword == 2:你把承重的左脚真交出去。|你借追来的力转回右侧。}六十九那场，{dr_second_sword == 2:你留空看他真怎样试。|你先等他真正递手。}一百一十四那场，{dr_third_sword == 2:你留着能停的一手。|你从刀背细处转开。}三种走法拼起来像，却不在同一只手里。 # beat:dr_shen_three_8 # scene:dr_shenyard # cast:dr_shen,dr_lu # speaker:dr_shen # mood:dr_shen=intent
你原以为那三份纸抄得越齐越好，如今才知不齐本身就是一条线索。 # beat:dr_shen_three_9 # scene:dr_shenyard # cast:dr_shen,dr_lu # speaker:narrator
}
{
- dr_first_sword == 2:
八十三那一场，你把承重的左脚真交了出去。这一手写在纸上不好看，却是那夜还能站住的一处。 # beat:dr_shen_three_10 # scene:dr_shenyard # cast:dr_shen,dr_lu # speaker:narrator
- else:
八十三那一场，你借他追来的力转回右侧。这一手顺，顺得像打过很多回的人，而不是一个心虚的冒名者。 # beat:dr_shen_three_11 # scene:dr_shenyard # cast:dr_shen,dr_lu # speaker:narrator
}
{
- dr_asked_reopen:
陆那句大概不会，你没有替它圆成他们对了。旧案如今真在桌上，靠的是这三份口述，不是那句迟来的承认。 # beat:dr_shen_three_12 # scene:dr_shenyard # cast:dr_shen,dr_lu # speaker:narrator
- else:
白水旧卷是你亲手放回桌上的。查假与翻旧冤两件事，陆都没有让它们互相顶替。 # beat:dr_shen_three_13 # scene:dr_shenyard # cast:dr_shen,dr_lu # speaker:narrator
}
* [请她真试被找到的人，纸上差别是路，不先拿来判一个未到场的人。 # cid:dr_ask_actual_test]
  ~ dr_wants_test = true
  找到，叫来。我问的是他今天怎样走，不叫你照三句话抓三个影。 # beat:dr_shen_three_14 # scene:dr_shenyard # cast:dr_shen,dr_lu # speaker:dr_shen # mood:dr_shen=neutral
  她把刀横好，起身时先给坏腿留一步，不拿自己曾能进十四便说如今伤已不在。 # beat:dr_shen_three_15 # scene:dr_shenyard # cast:dr_shen,dr_lu # speaker:narrator
  -> white_sand
* [把她三次亲手问过的范围写清，不让外面传成她一眼便识天下所有假剑。 # cid:dr_ask_what_she_knows]
  ~ dr_wants_test = false
  你还肯问范围，倒有一点像陆那烦人样。 # beat:dr_shen_three_16 # scene:dr_shenyard # cast:dr_shen,dr_lu # speaker:dr_shen # mood:dr_shen=amused
  问第二遍，才省得以后问十八年。 # beat:dr_shen_three_17 # scene:dr_shenyard # cast:dr_shen,dr_lu # speaker:dr_lu # mood:dr_lu=neutral
  你带三页出门，两人没因互呛一句便少讲今天该去哪里。 # beat:dr_shen_three_18 # scene:dr_shenyard # cast:dr_shen,dr_lu # speaker:narrator
  -> white_sand

=== white_sand ===
查人往返数月，先到白沙渡，别同白水旧案混成一处。撑船谢无灯四十七，瘦，左脚微跛。你看两日，第三日才登船。 # beat:dr_white_sand_1 # scene:dr_whitesand # cast:dr_wudeng # speaker:narrator
到江心，你问梁启山右臂好些么。篙停一瞬，又继续。 # beat:dr_white_sand_2 # scene:dr_whitesand # cast:dr_wudeng # speaker:narrator
不认识。 # beat:dr_white_sand_3 # scene:dr_whitesand # cast:dr_wudeng # speaker:dr_wudeng # mood:dr_wudeng=intent
他认得你。 # beat:dr_white_sand_4 # scene:dr_whitesand # cast:dr_wudeng # speaker:you
谢不答。你并无官差印信，也不拿查身份作掀船搜人的理由。篙从岸边推开，船上的人仍得先到岸。 # beat:dr_white_sand_5 # scene:dr_whitesand # cast:dr_wudeng # speaker:narrator
* [等他把乘客送稳，靠岸才说沈霁娘要见，不在江心逼他当众答身份。 # cid:dr_wait_until_land]
  ~ dr_boat_wait = true
  他把最后一人送上，听见沈名字，终于回头。你没替他落笔一个已认，只问何时能来。 # beat:dr_white_sand_6 # scene:dr_whitesand # cast:dr_wudeng # speaker:narrator
  她真在？ # beat:dr_white_sand_7 # scene:dr_whitesand # cast:dr_wudeng # speaker:dr_wudeng # mood:dr_wudeng=uneasy
  在等你亲自走一遍。 # beat:dr_white_sand_8 # scene:dr_whitesand # cast:dr_wudeng # speaker:you
  -> doctor
* [先说明只请到院当面问，仍让他把船撑完，不把想核实改成一船人都被扣住。 # cid:dr_name_fair_meeting]
  ~ dr_boat_wait = false
  他听见不是叫弟子押来，篙才从水里拔起。到岸你又说沈霁娘，他回头，问是不是还带三份口述。 # beat:dr_white_sand_9 # scene:dr_whitesand # cast:dr_wudeng # speaker:narrator
  带。你也可以说哪份不对。 # beat:dr_white_sand_10 # scene:dr_whitesand # cast:dr_wudeng # speaker:you
  他没答应所有事，却真问了去处。 # beat:dr_white_sand_11 # scene:dr_whitesand # cast:dr_wudeng # speaker:narrator
  -> doctor

=== doctor ===
南边小县，严松五十一，郎中模样。你到时，他正替孩子接脱臼的手，先忙完，洗净才问是不是找到无灯了。 # beat:dr_doctor_1 # scene:dr_clinic # cast:dr_yan # speaker:narrator
你倒省事。第十二何定远是你问的？ # beat:dr_doctor_2 # scene:dr_clinic # cast:dr_yan # speaker:you
是。没造假，留了手。 # beat:dr_doctor_3 # scene:dr_clinic # cast:dr_yan # speaker:dr_yan # mood:dr_yan=intent
为何冒谢藏锋？ # beat:dr_doctor_4 # scene:dr_clinic # cast:dr_yan # speaker:you
他不答，先提醒第三个人还没找。外头又来一个抱药的人，严接过看，不叫一场大案把整间医馆都停成等你讲话。 # beat:dr_doctor_5 # scene:dr_clinic # cast:dr_yan # speaker:narrator
{
- dr_boat_wait:
白沙渡那一回你等他把船撑完才开口。到了医馆也一样：你要人认账，不等于要人先丢下手里正接着的活。 # beat:dr_doctor_6 # scene:dr_clinic # cast:dr_yan # speaker:narrator
- else:
江心那一问你问得直接，严松答得也直接。两个人都没有把想核的事，改成一船人陪着耽误。 # beat:dr_doctor_7 # scene:dr_clinic # cast:dr_yan # speaker:narrator
}
* [约好他能来而病人有人接的时辰，问话不等于他往后的活都须让开。 # cid:dr_leave_visit_time]
  ~ dr_clinic_time = true
  后日有人替。我去。 # beat:dr_doctor_8 # scene:dr_clinic # cast:dr_yan # speaker:dr_yan # mood:dr_yan=neutral
  到院里，何那场细节还得再问。 # beat:dr_doctor_9 # scene:dr_clinic # cast:dr_yan # speaker:you
  你既找到我，我没打算只承认一半。先让我把今日的药配完。 # beat:dr_doctor_10 # scene:dr_clinic # cast:dr_yan # speaker:dr_yan # mood:dr_yan=amused
  -> woodshop
* [先问第三个人去处，把今天能确认的记下，其余当着对方也能核时再问。 # cid:dr_ask_next_name]
  ~ dr_clinic_time = false
  严报杜青禾，棺材铺。你没有因他肯认何一场就让他替另两人都认完，出门前又问后日是否能来。 # beat:dr_doctor_11 # scene:dr_clinic # cast:dr_yan # speaker:narrator
  能。你把哪一页要我当面说带来。 # beat:dr_doctor_12 # scene:dr_clinic # cast:dr_yan # speaker:dr_yan # mood:dr_yan=intent
  -> woodshop

=== woodshop ===
杜青禾四十四，粗手，正在刨柏木。县里叫这个名的棺材铺只有一家。他不抬头，先问死人用？你答活人，他才看你。 # beat:dr_woodshop_1 # scene:dr_woodshop # cast:dr_du # speaker:narrator
三份帖放桌上，他指何帖旁一封未公开的。 # beat:dr_woodshop_2 # scene:dr_woodshop # cast:dr_du # speaker:narrator
这个。第九。 # beat:dr_woodshop_3 # scene:dr_woodshop # cast:dr_du # speaker:dr_du # mood:dr_du=intent
结果？ # beat:dr_woodshop_4 # scene:dr_woodshop # cast:dr_du # speaker:you
没打。他不肯。 # beat:dr_woodshop_5 # scene:dr_woodshop # cast:dr_du # speaker:dr_du # mood:dr_du=neutral
你把未打原样留着，不拿叫谢藏锋的第四封也添出第四场胜。杜将木屑拨开，问今天要他跟你去，还是等他把这一面刨平。 # beat:dr_woodshop_6 # scene:dr_woodshop # cast:dr_du # speaker:narrator
{
- dr_clinic_time:
严约的是病人有人接的时辰。杜这一面也刨平了才起身——你请动的人，没有一个欠着半件事跟你走。 # beat:dr_woodshop_7 # scene:dr_woodshop # cast:dr_du # speaker:narrator
- else:
你没让严替另两人都认完。到杜这里，也是一帖一帖问，不把一个肯开口的人用成三个人的答案。 # beat:dr_woodshop_8 # scene:dr_woodshop # cast:dr_du # speaker:narrator
}
* [直接把赵六十九那份也推近，听他本人说，不让他只挑未打的一帖避过去。 # cid:dr_ask_zhao_direct]
  ~ dr_zhao_direct = true
  这一份也得问。不是只来收一封没打的帖。 # beat:dr_woodshop_9 # scene:dr_woodshop # cast:dr_du # speaker:you
  杜看你一会，没再将木头压在纸角，只说去沈前辈那里一起问。 # beat:dr_woodshop_10 # scene:dr_woodshop # cast:dr_du # speaker:narrator
  我不躲这个。别只把无灯当带头的。 # beat:dr_woodshop_11 # scene:dr_woodshop # cast:dr_du # speaker:dr_du # mood:dr_du=intent
  -> three_parts
* [约三人当面，让沈各试，不先拿他递哪一张决定全部胜负归谁。 # cid:dr_ask_all_together]
  ~ dr_zhao_direct = false
  好。都问，别只问谁先起头。 # beat:dr_woodshop_12 # scene:dr_woodshop # cast:dr_du # speaker:dr_du # mood:dr_du=neutral
  他把刨子放下，你等他将柏木立好才走。门外要买棺材的人侧身让路，不知这位普通木工还会一手从未拿来开价的剑。 # beat:dr_woodshop_13 # scene:dr_woodshop # cast:dr_du # speaker:narrator
  -> three_parts

=== three_parts ===
到院里，沈先问谢无灯的脚。他左重、跛仍在，却懂怎样把坏腿留下的路拿来接人。那不是照着画谱摆一个好看的回灯照影。 # beat:dr_three_parts_1 # scene:dr_shenyard # cast:dr_shen,dr_wudeng # speaker:narrator
你学的脚。还有两个人，别替他们全走。 # beat:dr_three_parts_2 # scene:dr_shenyard # cast:dr_shen,dr_wudeng # speaker:dr_shen # mood:dr_shen=intent
严松的手稳，心细，转处细到一截将合未合的距离。沈问到这里，他不拿行医当借口说这双手从不伤人，何那场是真较艺，也真赢。 # beat:dr_three_parts_3 # scene:dr_shenyard # cast:dr_shen,dr_yan # speaker:narrator
你学的变。 # beat:dr_three_parts_4 # scene:dr_shenyard # cast:dr_shen,dr_yan # speaker:dr_shen # mood:dr_shen=neutral
杜天资最好，身子却普通。沈进一刀，他先看人，不急着演一整套；谢当年便没叫他死练，先叫看别人怎样出手。 # beat:dr_three_parts_5 # scene:dr_shenyard # cast:dr_shen,dr_du # speaker:narrator
一个脚，一个手，一个眼。拼起来，才最像。 # beat:dr_three_parts_6 # scene:dr_shenyard # cast:dr_shen,dr_du # speaker:dr_shen # mood:dr_shen=intent
{
- dr_wants_test:
三人当院各走了一遍，是沈自己看过的，不是你照着三份纸替他们分完。她说纸上是路，今天才是人。 # beat:dr_three_parts_7 # scene:dr_shenyard # cast:dr_shen,dr_du # speaker:narrator
- else:
你先前请沈只说亲历能确认的范围。今日三人已当院各走过一遍；这三回她能认，不等于她能替天下未到场的假剑作证。 # beat:dr_three_parts_8 # scene:dr_shenyard # cast:dr_shen,dr_du # speaker:narrator
}
{
- dr_zhao_direct:
赵六十九那份你没让杜绕过去。沈试手时问的次序，也照你这份直接：谁的场，谁自己认。 # beat:dr_three_parts_9 # scene:dr_shenyard # cast:dr_shen,dr_du # speaker:narrator
- else:
当面同试是你与杜谈定的。沈所以能一次看全三条路，靠的是没人先替他挑过哪一帖。 # beat:dr_three_parts_10 # scene:dr_shenyard # cast:dr_shen,dr_du # speaker:narrator
}
* [问谁出的主意，也让另两人自己回答，不替他们选一个最肯扛的。 # cid:dr_ask_each_responsibility]
  ~ dr_each_name = true
  谢说我，严立即说一起，杜叫别争这个，都得担。 # beat:dr_three_parts_11 # scene:dr_shenyard # cast:dr_shen,dr_du # speaker:narrator
  你把三种说法留在三个人面前，没有顺着最硬那一个替其余人删名。 # beat:dr_three_parts_12 # scene:dr_shenyard # cast:dr_shen,dr_du # speaker:narrator
  -> seventeen_petitions
* [问为何三人各只有一部分，让他们从师父实际教过的说起。 # cid:dr_ask_missing_whole]
  ~ dr_each_name = false
  不是三份完整剑谱，是谢按他们各自能做的分教。说到冒名，谢仍先认自己起头，严接一起，杜说都要担。 # beat:dr_three_parts_13 # scene:dr_shenyard # cast:dr_shen,dr_du # speaker:narrator
  沈把刀收好，三个人没有因拼得像便真变成一个可叫师父回来的身体。 # beat:dr_three_parts_14 # scene:dr_shenyard # cast:dr_shen,dr_du # speaker:narrator
  -> seventeen_petitions

=== seventeen_petitions ===
你问为一席？谢笑第七有什么用。严从屋里搬旧箱，换过锁，里头申状、旧信、抄件：十七年前、十五、十、八、三……十七次替师父申诉。 # beat:dr_seventeen_petitions_1 # scene:dr_petitionroom # cast:dr_wudeng,dr_yan,dr_du # speaker:narrator
最客气待查，最多旧案已结、无新证。之后再没有话。 # beat:dr_seventeen_petitions_2 # scene:dr_petitionroom # cast:dr_wudeng,dr_yan,dr_du # speaker:dr_yan # mood:dr_yan=intent
写十七年，没人听。死人说话没人听，那就让他活回来。 # beat:dr_seventeen_petitions_3 # scene:dr_petitionroom # cast:dr_wudeng,dr_yan,dr_du # speaker:dr_wudeng # mood:dr_wudeng=sharp
你看着箱子，没能立刻接出一句能把这些年都说轻的话。 # beat:dr_seventeen_petitions_4 # scene:dr_petitionroom # cast:dr_wudeng,dr_yan,dr_du # speaker:narrator
{
- dr_each_name:
起头的主意你让三个人自己答过：谢说我，严说一起，杜说都得担。这三句到今天也没被谁替谁删掉一个名。 # beat:dr_seventeen_petitions_5 # scene:dr_petitionroom # cast:dr_wudeng,dr_yan,dr_du # speaker:narrator
- else:
不是完整剑谱、是谢按各人能做的分教——这一段你说清过。三个人怎么走到冒名这一步，因此各自有一条自己的路可讲。 # beat:dr_seventeen_petitions_6 # scene:dr_petitionroom # cast:dr_wudeng,dr_yan,dr_du # speaker:narrator
}
还有找证据这一条。 # beat:dr_seventeen_petitions_7 # scene:dr_petitionroom # cast:dr_shen,dr_wudeng # speaker:dr_shen # mood:dr_shen=intent
十八年！我们找了十八年！榜房当年把假写真！ # beat:dr_seventeen_petitions_8 # scene:dr_petitionroom # cast:dr_shen,dr_wudeng # speaker:dr_wudeng # mood:dr_wudeng=sharp
那证明当年假。不是今天再造个假。 # beat:dr_seventeen_petitions_9 # scene:dr_petitionroom # cast:dr_shen,dr_wudeng # speaker:dr_shen # mood:dr_shen=neutral
院里静下来，谢脸仍硬，没因一句正话便觉得十八年忽然短了。 # beat:dr_seventeen_petitions_10 # scene:dr_petitionroom # cast:dr_shen,dr_wudeng # speaker:narrator
* [承认若无冒名旧案未必重查，也告诉他们这并不能抵掉各自冒名。 # cid:dr_keep_two_accounts]
  ~ dr_two_accounts = true
  你们让它重开，是事实。冒名，也是事实。你师父的账不替你们抵，你们的错也不替他认那桩杀人。 # beat:dr_seventeen_petitions_11 # scene:dr_petitionroom # cast:dr_shen,dr_wudeng # speaker:you
  严把箱盖先放一边，没叫谢马上感激。还得真查。 # beat:dr_seventeen_petitions_12 # scene:dr_petitionroom # cast:dr_shen,dr_wudeng # speaker:narrator
  -> identity_timing
* [问他们今天要的是还一生还是再取第七，把旧案与新战绩当面分清。 # cid:dr_ask_what_needed]
  ~ dr_two_accounts = false
  谢仍问现榜能不能回第七，你说旧录可改，现榜是今天的人。严问那三场呢，你答分别记，冒名也记。 # beat:dr_seventeen_petitions_13 # scene:dr_petitionroom # cast:dr_shen,dr_wudeng # speaker:narrator
  那就都记。别只剩一个谢藏锋，后面三个又没了。 # beat:dr_seventeen_petitions_14 # scene:dr_petitionroom # cast:dr_du,dr_shen,dr_wudeng # speaker:dr_du # mood:dr_du=intent
  -> identity_timing

=== identity_timing ===
如今你已能说清三个名字与三场归属，但还有被冒名者的门人等答复，也有这三个人等自己开口。沈已经试过，谁也不能再把错认当成全部真相。 # beat:dr_identity_timing_1 # scene:dr_shenyard # cast:dr_wudeng,dr_yan,dr_du # speaker:narrator
先叫谁知道，不改三战到底谁胜，却会改变他们怎样走到九月那张桌前。 # beat:dr_identity_timing_2 # scene:dr_shenyard # cast:dr_wudeng,dr_yan,dr_du # speaker:narrator
{
- dr_two_accounts:
旧案重开与各自冒名，你当面分开说过。严把箱盖放到一边那一刻，听懂的不是宽恕，是两笔账都要真算。 # beat:dr_identity_timing_3 # scene:dr_shenyard # cast:dr_wudeng,dr_yan,dr_du # speaker:narrator
- else:
要还一生还是再取第七，你问过他们自己。旧录可改、现榜是今天的人——这句后来被重复时，谁也没有再混过一次。 # beat:dr_identity_timing_4 # scene:dr_shenyard # cast:dr_wudeng,dr_yan,dr_du # speaker:narrator
}
* [先给三人一夜当面商量，明早自己共同说明；被挑战门人多等半日，你去解释。 # cid:dr_tell_three_first]
  ~ dr_tell_three = true
  你去挡那半日质疑，有人说榜房在替造假者护短。三人没有因此全肯跟你，却约定到会自己都站出来，不再让谢一句我做了便独揽。 # beat:dr_identity_timing_5 # scene:dr_shenyard # cast:dr_wudeng,dr_yan,dr_du # speaker:narrator
  明早我们自己说。你别替我把木铺关了。 # beat:dr_identity_timing_6 # scene:dr_shenyard # cast:dr_wudeng,dr_yan,dr_du # speaker:dr_du # mood:dr_du=intent
  -> three_faces
* [先向被挑战的门人说明三场各归谁，再分别通知三人；该告知的真败不再让人等。 # cid:dr_tell_challenged_first]
  ~ dr_tell_three = false
  门人当晚便有人到医馆、木铺问，杜听成榜房只要谢一人来顶，严的病人也被围问。你还没来得及当面解释，三个人已将各自的门关上。 # beat:dr_identity_timing_7 # scene:dr_shenyard # cast:dr_wudeng,dr_yan,dr_du # speaker:narrator
  名字你说出去了。我也要听你说，我们到会到底由谁开口。 # beat:dr_identity_timing_8 # scene:dr_shenyard # cast:dr_wudeng,dr_yan,dr_du # speaker:dr_yan # mood:dr_yan=intent
  -> three_faces

=== three_faces ===
请人这一节你走了三日。八十三招那一场的主人先到，右袖仍空着不使力；谢无灯把篙留在门外，进门先看那张凳，不先看你。 # beat:dr_three_faces_1 # scene:dr_faceroom # cast:dr_liang,dr_wudeng # speaker:narrator
八十三招我认了。今日我不问你是不是他。 # beat:dr_three_faces_2 # scene:dr_faceroom # cast:dr_liang,dr_wudeng # speaker:dr_liang # mood:dr_liang=sharp # action:梁启山 · 右袖不使力
我问，你听见满城笑我输给一个死了十八年的人，为什么一次都没站出来说不是。 # beat:dr_three_faces_3 # scene:dr_faceroom # cast:dr_liang,dr_wudeng # speaker:dr_liang # mood:dr_liang=intent
说过一回。在渡口。 # beat:dr_three_faces_4 # scene:dr_faceroom # cast:dr_liang,dr_wudeng # speaker:dr_wudeng # mood:dr_wudeng=uneasy # action:谢无灯 · 渡口那一回
跟谁说。 # beat:dr_three_faces_5 # scene:dr_faceroom # cast:dr_liang,dr_wudeng # speaker:dr_liang # mood:dr_liang=neutral
跟一个不认识我的人。他一听就走，我便没有再讲第二回。 # beat:dr_three_faces_6 # scene:dr_faceroom # cast:dr_liang,dr_wudeng # speaker:dr_wudeng # mood:dr_wudeng=neutral
堂里静下来。他答的是实话，而这一句实话，正把最难出口的那一段原封留在原处。 # beat:dr_three_faces_7 # scene:dr_faceroom # cast:dr_liang,dr_wudeng # speaker:narrator
* [让三人各自单独进来，先听每个人自己肯认到哪一步，不叫后来的人在场把前一句冲淡。 # cid:dr_face_one_by_one]
  ~ dr_face_alone = true
  一个一个说。谁先讲的，我不带进下一间屋。 # beat:dr_three_faces_8 # scene:dr_faceroom # cast:dr_liang,dr_wudeng # speaker:you
  那我先说完。别叫他们听见我怎么说。 # beat:dr_three_faces_9 # scene:dr_faceroom # cast:dr_liang,dr_wudeng # speaker:dr_wudeng # mood:dr_wudeng=intent # action:谢无灯 · 我先说完
  你站在门边没有坐下。这一日三间屋，三个人的话不互相替，也不互相遮。 # beat:dr_three_faces_10 # scene:dr_faceroom # cast:dr_liang,dr_wudeng # speaker:narrator
  -> three_faces_1
* [六个人同一日到齐，谁冒了谁、各归哪一场，当着本人说清，不从三份体面里拼一个温和结论。 # cid:dr_face_all_together]
  ~ dr_face_alone = false
  都到齐。谁欠谁的，当着本人说。 # beat:dr_three_faces_11 # scene:dr_faceroom # cast:dr_liang,dr_wudeng # speaker:you
  我也不必谢你替我留脸。 # beat:dr_three_faces_12 # scene:dr_faceroom # cast:dr_liang,dr_wudeng # speaker:dr_liang # mood:dr_liang=intent
  六张凳一次摆满。你仍不替任何人先开口，只把三份帖按主人分开，放在桌上。 # beat:dr_three_faces_13 # scene:dr_faceroom # cast:dr_liang,dr_wudeng # speaker:narrator
  -> three_faces_1

=== three_faces_1 ===
{dr_face_alone:第二间是青蒲剑赵问川与杜青禾。|接着是青蒲剑赵问川与杜青禾，当着同桌的人开口。}赵六十九招真败，他问的第一句仍不是名字。 # beat:dr_three_faces_1_1 # scene:dr_faceroom # cast:dr_zhao,dr_du # speaker:narrator
你挑我，是我那一场好写？ # beat:dr_three_faces_1_2 # scene:dr_faceroom # cast:dr_zhao,dr_du # speaker:dr_zhao # mood:dr_zhao=intent # action:赵问川 · 好写那一场
你名字笔画少。抄帖的夜里，写得快。 # beat:dr_three_faces_1_3 # scene:dr_faceroom # cast:dr_zhao,dr_du # speaker:dr_du # mood:dr_du=neutral # action:杜青禾 · 笔画少
你就写了。 # beat:dr_three_faces_1_4 # scene:dr_faceroom # cast:dr_zhao,dr_du # speaker:dr_zhao # mood:dr_zhao=sharp
写了。写完那一夜没睡，一直在想我凭哪一场挑人。 # beat:dr_three_faces_1_5 # scene:dr_faceroom # cast:dr_zhao,dr_du # speaker:dr_du # mood:dr_du=uneasy
杜的粗手压在膝上。他没搬出沈前辈说过的那句天资最好替这一回开脱，也没说是谢让他挑的。 # beat:dr_three_faces_1_6 # scene:dr_faceroom # cast:dr_zhao,dr_du # speaker:narrator
* [让三位真败者九月自己到长桌前讲被冒的经过，榜房不代他们陈述，宁可当日议程被拖长。 # cid:dr_face_let_askers_in]
  ~ dr_face_askers = true
  九月那张桌，你们自己去说，我不替你们讲。 # beat:dr_three_faces_1_7 # scene:dr_faceroom # cast:dr_zhao,dr_du # speaker:you
  那我们说的话谁记。 # beat:dr_three_faces_1_8 # scene:dr_faceroom # cast:dr_zhao,dr_du # speaker:dr_zhao # mood:dr_zhao=intent
  谁问谁记。可能记不全，也可能有人插嘴打断。 # beat:dr_three_faces_1_9 # scene:dr_faceroom # cast:dr_zhao,dr_du # speaker:you
  赵没答应，只把手从袖里收回去，像先把这句话留着。堂上多三个开口的人，便不再是榜房念一遍、各家点头的一日。 # beat:dr_three_faces_1_10 # scene:dr_faceroom # cast:dr_zhao,dr_du # speaker:narrator
  -> three_faces_2
* [九月仍由榜房按证据念被冒的经过，三位真败者不必再当众复述一次自己怎样输给一个假名。 # cid:dr_face_keep_askers_out]
  ~ dr_face_askers = false
  九月我来念。你们不必再把那一场当众讲第二遍。 # beat:dr_three_faces_1_11 # scene:dr_faceroom # cast:dr_zhao,dr_du # speaker:you
  那我今日说的算什么。 # beat:dr_three_faces_1_12 # scene:dr_faceroom # cast:dr_zhao,dr_du # speaker:dr_zhao # mood:dr_zhao=uneasy
  记在你名下。到堂上念的是证，不是你。 # beat:dr_three_faces_1_13 # scene:dr_faceroom # cast:dr_zhao,dr_du # speaker:you
  赵点头。他也知道，替他开口的人多一道，这件事便不再只从他嘴里出来。 # beat:dr_three_faces_1_14 # scene:dr_faceroom # cast:dr_zhao,dr_du # speaker:narrator
  -> three_faces_2

=== three_faces_2 ===
{dr_face_alone:第三间是伏波刀何定远，一百一十四。严松进门之前先洗了手，坐下仍是那副郎中样子。|再由伏波刀何定远问严松，一百一十四。严松来时先洗过手，此刻坐在同一张桌旁，仍是那副郎中样子。} # beat:dr_three_faces_2_1 # scene:dr_faceroom # cast:dr_he,dr_yan # speaker:narrator
那一场我认。我只问一句：你留手，是怕伤我，还是怕我死。 # beat:dr_three_faces_2_2 # scene:dr_faceroom # cast:dr_he,dr_yan # speaker:dr_he # mood:dr_he=intent # action:何定远 · 我只问一句
两个都有。 # beat:dr_three_faces_2_3 # scene:dr_faceroom # cast:dr_he,dr_yan # speaker:dr_yan # mood:dr_yan=intent
哪一个排在前头。 # beat:dr_three_faces_2_4 # scene:dr_faceroom # cast:dr_he,dr_yan # speaker:dr_he # mood:dr_he=neutral
怕你死。说这一句比说怕伤你难。 # beat:dr_three_faces_2_5 # scene:dr_faceroom # cast:dr_he,dr_yan # speaker:dr_yan # mood:dr_yan=uneasy # action:严松 · 怕你死
他没有替自己添一个医者仁心的名目。何听完不再问，刀留在门外没拿进来。 # beat:dr_three_faces_2_6 # scene:dr_faceroom # cast:dr_he,dr_yan # speaker:narrator
-> three_faces_after

=== three_faces_after ===
{dr_face_alone:三间屋走完|六个人同桌说完}，你把六个人的话带回榜房。陆观棋将三份帖按主人分好，等你先说今日听的是哪一层。 # beat:dr_three_faces_after_1 # scene:dr_boardhouse # cast:dr_lu # speaker:narrator
你听见什么了。 # beat:dr_three_faces_after_2 # scene:dr_boardhouse # cast:dr_lu # speaker:dr_lu # mood:dr_lu=intent # action:周砚 · 带回六个人的话
三场真败，三个假名，和三个人自己说出的那半句。 # beat:dr_three_faces_after_3 # scene:dr_boardhouse # cast:dr_lu # speaker:you
那半句是气话还是认错，你分得清。 # beat:dr_three_faces_after_4 # scene:dr_boardhouse # cast:dr_lu # speaker:dr_lu # mood:dr_lu=neutral
你想起梁听完没再问，赵收帖时手停了一下，何为一句怕你死之后没有再开口。这三处都不改胜负，也都不是与案无关的闲话。 # beat:dr_three_faces_after_5 # scene:dr_boardhouse # cast:dr_lu # speaker:narrator
* [把三人自己说的那半句原话记在各自名下，与三场真败并列，不改成榜房的评语。 # cid:dr_face_write_own_words]
  ~ dr_faces_recorded = true
  你写下怕丢人的位置、写了快那一夜的没睡、写了怕你死排在前头。纸上的三个人没有变成三个符号，也没有谁被写成一句谁都能填的恶。 # beat:dr_three_faces_after_6 # scene:dr_boardhouse # cast:dr_lu # speaker:narrator
  记。他们自己的句子，别由你替他们润。 # beat:dr_three_faces_after_7 # scene:dr_boardhouse # cast:dr_lu # speaker:dr_lu # mood:dr_lu=intent
  -> white_water
* [只记三人当面对质这一节，各人的原话不逐句入卷，留给本人在九月自己讲。 # cid:dr_face_write_plain]
  ~ dr_faces_recorded = false
  你只落一行三人各与本人当面对质。陆点头，没催你把最扎眼的那几句也抄进来；可你也知道，九月那张桌上若无人肯再说一遍，这一行便只剩一个空架子。 # beat:dr_three_faces_after_8 # scene:dr_boardhouse # cast:dr_lu # speaker:narrator
  肯把笔收一收，也是长进。 # beat:dr_three_faces_after_9 # scene:dr_boardhouse # cast:dr_lu # speaker:dr_lu # mood:dr_lu=amused
  -> white_water

=== white_water ===
旧案也一直在这些往返里推进。白水渡，沧浪剑社护一段商路，主人宋怀义曾与谢公开争、约再战；案前五日，酒楼又吵，很多人真看见。 # beat:dr_white_water_1 # scene:dr_whitewater # cast:dr_apprentice,dr_lu # speaker:narrator
二月十六夜，剑社连借宿镖队四十三人，三十二死、五重伤。十五具尸体有像谢的剑伤，活口说看见他进后院，次晨又有人见他带血从那边离开。后来下游得衣、岸边得剑，人再不见。 # beat:dr_white_water_2 # scene:dr_whitewater # cast:dr_apprentice,dr_lu # speaker:narrator
那当时怎么会不信？ # beat:dr_white_water_3 # scene:dr_whitewater # cast:dr_apprentice,dr_lu # speaker:dr_apprentice # mood:dr_apprentice=uneasy
你看着一段已换了主人的泊位，没有拿十八年后的从容，假装当时人人都已看得清。 # beat:dr_white_water_4 # scene:dr_whitewater # cast:dr_apprentice,dr_lu # speaker:narrator
* [把看见吵、看见血、看见后院分别问清，不叫一个人看过其中一处便替另外两处作证。 # cid:dr_ask_each_seen]
  ~ dr_each_seen = true
  同门来讲前辈早说过，你让他指明哪位当时在酒楼、哪位只听船头讲。眼前人不悦，也终于承认他自己那年还没出门。 # beat:dr_white_water_5 # scene:dr_whitewater # cast:dr_apprentice,dr_lu # speaker:narrator
  那就不写你亲见。你肯带我去找他说的那个人，仍有用。 # beat:dr_white_water_6 # scene:dr_whitewater # cast:dr_apprentice,dr_lu # speaker:you
  -> different_wounds
* [去走从鹿溪与白水各自到河岸的路，血从哪里来仍待问，不先让方向替人定死。 # cid:dr_walk_departure]
  ~ dr_each_seen = false
  两处都能到同一条水路，你走得鞋底进泥，才知后来一句从白水方向不是有人一路跟过他。 # beat:dr_white_water_7 # scene:dr_whitewater # cast:dr_apprentice,dr_lu # speaker:narrator
  要把它划掉？ # beat:dr_white_water_8 # scene:dr_whitewater # cast:dr_apprentice,dr_lu # speaker:dr_apprentice # mood:dr_apprentice=neutral
  写他见过的路口，不替他看完没跟过的路。 # beat:dr_white_water_9 # scene:dr_whitewater # cast:dr_apprentice,dr_lu # speaker:you
  -> different_wounds

=== different_wounds ===
虫咬旧验尸簿，你抄两日：十五剑、九钝、四喉骨断，其余暗器与踩踏。不是只有一个人下手，旧案却本就说谢勾黑道，不能只因不止一人便全部推翻。 # beat:dr_different_wounds_1 # scene:dr_oldrecords # cast:dr_lu,dr_apprentice # speaker:narrator
为何偏留最像自己的剑？ # beat:dr_different_wounds_2 # scene:dr_oldrecords # cast:dr_lu,dr_apprentice # speaker:you
当时说杀红眼、没顾上。尸刚凉，人又跑，谁先替他想？ # beat:dr_different_wounds_3 # scene:dr_oldrecords # cast:dr_lu,dr_apprentice # speaker:dr_lu # mood:dr_lu=intent
你说太方便，也不能拿这句代替重新去问。一家旧店换了三回，帮散、地转，陆没让你只留在库里等一个自己长出来的答案。 # beat:dr_different_wounds_4 # scene:dr_oldrecords # cast:dr_lu,dr_apprentice # speaker:narrator
* [从旧驿真正当过差的人问起，给他们说没看清的余地，不以认谢名便逼成全证。 # cid:dr_ask_old_workers]
  ~ dr_old_worker = true
  半年里反复访过的人又报来鹿溪酒馆，九十多的老妇说好像见过。她十八年前便已七十多，你先问她记的是人还是那一夜有别的事。 # beat:dr_different_wounds_5 # scene:dr_oldrecords # cast:dr_lu,dr_apprentice # speaker:narrator
  -> old_woman
* [不只围着白水问那晚谁来，也去问当时别处谁有可能真见过他。 # cid:dr_check_other_places]
  ~ dr_old_worker = false
  一路问到七十余里外鹿溪旧驿，老妇说好像见过。她已九十多，你没有为终于有人肯说见过就替她删掉好像两字。 # beat:dr_different_wounds_6 # scene:dr_oldrecords # cast:dr_lu,dr_apprentice # speaker:narrator
  -> old_woman

=== old_woman ===
那天，还有顾老爷。 # beat:dr_old_woman_1 # scene:dr_luxi # cast:dr_oldwoman # speaker:dr_oldwoman # mood:dr_oldwoman=intent
哪位？ # beat:dr_old_woman_2 # scene:dr_luxi # cast:dr_oldwoman # speaker:you
榜第一那个。你让我慢些想，不要一说我老了，就把前面全替我答完。 # beat:dr_old_woman_3 # scene:dr_luxi # cast:dr_oldwoman # speaker:dr_oldwoman # mood:dr_oldwoman=neutral
鹿溪距白水七十余里。她说那夜客人迟迟不散，院里有人，天将亮才去。能记的她说，没见的打了多少下，她不替你编。你带回这一处可再问的路，去江边旧庄见顾临川。 # beat:dr_old_woman_4 # scene:dr_luxi # cast:dr_oldwoman # speaker:narrator
十八年前七十余的横江叟，如今九十余、早退，正在晒太阳。听到谢名，眼便睁开。 # beat:dr_old_woman_5 # scene:dr_gumanor # cast:dr_gu # speaker:narrator
* [先让顾把终于查到我这句话说完，不替他找一份体面的开场。 # cid:dr_wait_for_gu]
  ~ dr_gu_wait = true
  终于查到我了？ # beat:dr_old_woman_6 # scene:dr_gumanor # cast:dr_gu # speaker:dr_gu # mood:dr_gu=intent
  你没答替他圆场的好久不见，只放下鹿溪那一页，等他看完。 # beat:dr_old_woman_7 # scene:dr_gumanor # cast:dr_gu # speaker:narrator
  那一夜，您在哪里？ # beat:dr_old_woman_8 # scene:dr_gumanor # cast:dr_gu # speaker:you
  -> gu_silence
* [直接问二月十六夜，不用他旧第一的礼数把真正的问题往后推。 # cid:dr_ask_night_first]
  ~ dr_gu_wait = false
  那夜谢藏锋是不是和您在鹿溪？ # beat:dr_old_woman_9 # scene:dr_gumanor # cast:dr_gu # speaker:you
  是。终于还是查到这里。 # beat:dr_old_woman_10 # scene:dr_gumanor # cast:dr_gu # speaker:dr_gu # mood:dr_gu=intent
  老人看向江，没叫你为当年第一先轻一轻口气。你坐下，等他说。 # beat:dr_old_woman_11 # scene:dr_gumanor # cast:dr_gu # speaker:narrator
  -> gu_silence

=== gu_silence ===
谢不服榜，来问第一。顾同意私下，身上一处不公开的旧伤不肯让前几位都来试。两人约无论胜负不外传，黄昏开，断续到将明，顾险胜半手，谢也受伤。 # beat:dr_gu_silence_1 # scene:dr_gumanor # cast:dr_gu # speaker:narrator
血有了另一来处。白水案后谢来求证，顾叫等三日；第一日想明天，第二更多指认，第三谢已逃。过月再说，便也得承认自己明知却沉默月余。 # beat:dr_gu_silence_2 # scene:dr_gumanor # cast:dr_gu # speaker:narrator
为什么没去？ # beat:dr_gu_silence_3 # scene:dr_gumanor # cast:dr_gu # speaker:you
他看江很久。你没有得到一个被更大势力迫住的秘密，也没有一封能替他消去选择的密令。 # beat:dr_gu_silence_4 # scene:dr_gumanor # cast:dr_gu # speaker:narrator
* [等他自己说那三个字，不给一个可以顺着认的怕牵连门人。 # cid:dr_ask_own_words]
  ~ dr_gu_own_words = true
  怕丢人。 # beat:dr_gu_silence_5 # scene:dr_gumanor # cast:dr_gu # speaker:dr_gu # mood:dr_gu=uneasy
  你以为听错，再问，他仍答怕丢人。旧伤与反手全翻，第一坐十一年，名、门人、地位都压在上面，他不敢让人知谢已逼到这里。 # beat:dr_gu_silence_6 # scene:dr_gumanor # cast:dr_gu # speaker:narrator
  -> afraid_of_shame
* [问三日变一个月、再到十年，是哪一日终于能开口。 # cid:dr_ask_delay]
  ~ dr_gu_own_words = false
  一日比一日难。开始怕丢人，到第十年，怕人问为何九年前不说。 # beat:dr_gu_silence_7 # scene:dr_gumanor # cast:dr_gu # speaker:dr_gu # mood:dr_gu=uneasy
  你没再找一个被迫无奈替换。他自己承认，最早不说，就是怕丢人。 # beat:dr_gu_silence_8 # scene:dr_gumanor # cast:dr_gu # speaker:narrator
  -> afraid_of_shame

=== afraid_of_shame ===
你抄过他从十八到第一的许多旧战，纸上像山。眼前老人怕的不是一把更快剑，是自己的名。一场私斗的险胜，成了另一人十八年不能洗掉的血。 # beat:dr_afraid_of_shame_1 # scene:dr_gumanor # cast:dr_gu # speaker:narrator
这段，要照您说的记。 # beat:dr_afraid_of_shame_2 # scene:dr_gumanor # cast:dr_gu # speaker:you
记。 # beat:dr_afraid_of_shame_3 # scene:dr_gumanor # cast:dr_gu # speaker:dr_gu # mood:dr_gu=intent
他没让你将怕丢人换成顾全门声。回房陆也只叫照说的记，不替他找好听。鹿溪可核的证言与顾这份一旦坐实，核心时段谢不在现场；凶手是谁，却仍得找。 # beat:dr_afraid_of_shame_4 # scene:dr_gumanor # cast:dr_gu # speaker:narrator
* [追当年指认后院那名活口案后两年买田的钱，不拿顾一开口便让所有旧事自动都清。 # cid:dr_follow_land_money]
  ~ dr_land_trace = true
  旧契上有中人，问上去，一笔笔连到黑沙会。田今天仍有人种，你没带人去夺地，只问当时谁出的钱、谁肯再确认这一笔。 # beat:dr_afraid_of_shame_5 # scene:dr_gumanor # cast:dr_gu # speaker:narrator
  -> paid_witness
* [沿剑社倒后谁接护运追往来的人，再与活口两年后买田那笔钱核到一起。 # cid:dr_ask_road_changes]
  ~ dr_land_trace = false
  接路的人愿讲凶会不愿讲产业。你先听清当年转手谁在场，再拿到有中人的旧契，收买活口的款最终仍指黑沙会，不是眼前这一位家主自动成旧夜主凶。 # beat:dr_afraid_of_shame_6 # scene:dr_gumanor # cast:dr_gu # speaker:narrator
  -> paid_witness

=== paid_witness ===
你要查的，无非葛九衡。他早年与谢藏锋同门学过几年剑，因盗财被逐，走的是年轻底子，连照夜剑的门都没摸到。 # beat:dr_paid_witness_1 # scene:dr_roadestate # cast:dr_householder # speaker:dr_householder # mood:dr_householder=intent
你问他既然知道这些，那夜怎么没人拦。 # beat:dr_paid_witness_2 # scene:dr_roadestate # cast:dr_householder # speaker:narrator
拦？那夜动手的另有其人。他只负责在最显眼的尸上补像谢的剑，让满城第一眼都想到死人——会里定的差事，他办得很周到。 # beat:dr_paid_witness_3 # scene:dr_roadestate # cast:dr_householder # speaker:dr_householder # mood:dr_householder=sharp
公开结怨、被收买的活口、带血逃人，传闻便往这一个答案上长。你写证据自生，陆划证据换传闻：证据不会自己长。 # beat:dr_paid_witness_4 # scene:dr_roadestate # cast:dr_householder # speaker:narrator
葛死了，黑沙首脑也死了，当年的人大多死于内斗、清剿、仇杀。没有寨子留给你杀进去。 # beat:dr_paid_witness_5 # scene:dr_roadestate # cast:dr_householder # speaker:dr_householder # mood:dr_householder=intent
可今天接路、买田、占码头的还活着。比如，你。 # beat:dr_paid_witness_6 # scene:dr_roadestate # cast:dr_householder # speaker:you
他脸上那点支持查凶的热心冷了下去。 # beat:dr_paid_witness_7 # scene:dr_roadestate # cast:dr_householder # speaker:narrator
* [说明不来收地，问他家当时谁知道黑沙在后面，不因产业依法转就把这问也收回。 # cid:dr_ask_knowledge_not_seizure]
  ~ dr_house_plain = true
  替死人洗干净，会脏几十个活人。 # beat:dr_paid_witness_8 # scene:dr_roadestate # cast:dr_householder # speaker:dr_householder # mood:dr_householder=sharp
  脏不脏，不是我写出来的。当时谁知道？ # beat:dr_paid_witness_9 # scene:dr_roadestate # cast:dr_householder # speaker:you
  他不再给你留座，门人将茶收走。你站着，把他肯确认与拒答的分别听完，不将拒答本身便写成参与杀人。 # beat:dr_paid_witness_10 # scene:dr_roadestate # cast:dr_householder # speaker:narrator
  -> living_benefit
* [当着继业门人问转手的见闻，给他们说自己那时尚小的机会，也不免家主回答。 # cid:dr_ask_in_front_of_heirs]
  ~ dr_house_plain = false
  门人想用府榜名头挡，你问那位高手当时亲见还是后来听父辈说。他终于退到自己真知道的一笔，家主脸色更难看。 # beat:dr_paid_witness_11 # scene:dr_roadestate # cast:dr_householder # speaker:narrator
  我不替他记没亲见。您当时知道哪一段，也请自己说。 # beat:dr_paid_witness_12 # scene:dr_roadestate # cast:dr_householder # speaker:you
  门开着，你却没有再得到送回渡口的车。 # beat:dr_paid_witness_13 # scene:dr_roadestate # cast:dr_householder # speaker:narrator
  -> living_benefit

=== living_benefit ===
你走回城里，鞋里又进了泥。受益不等于都参与凶杀，也不等于一提证言便可用十八年前依法转手堵住。肯说的人有，拒的人也在，整案不能只选最像一个大坏人的名字。 # beat:dr_living_benefit_1 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
案的要处终于核拢。九月大修前二十日，顾递信只有我到。你问会不会公开说，陆答不知道；即使反悔，现有证词也够翻案，唯有顾自己能决定是否还那份沉默。 # beat:dr_living_benefit_2 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
三个人到时真都会来？ # beat:dr_living_benefit_3 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:dr_apprentice # mood:dr_apprentice=uneasy
门口已有赌盘、外地看客、想看死人进前十的人。你还得先把三个活人真请到那张桌边。 # beat:dr_living_benefit_4 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
{
- dr_each_seen and dr_old_worker:
你一处一处分开问过，也给旧驿真当过差的人留了说没看清的余地。卷上因此写着好几个我没看见，而不是几个都看见了。 # beat:dr_living_benefit_5 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
- else:
你没让看过其中一处的人替另外两处作证。有的问到了，有的仍只有一句他见过的路口，余人作不得证。 # beat:dr_living_benefit_6 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
}
{
- dr_gu_wait and dr_gu_own_words:
顾临川是被你等他自己把那三个字说出来的，不是被一句顾全门声带过去。怕丢人这一句在卷里没有被改成别的词。 # beat:dr_living_benefit_7 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
- else:
{dr_gu_own_words:你先问二月十六夜，再等顾临川自己说出怕丢人。卷里留下的是他的原话，不是你替他找的体面开场。|你问三日怎样拖成十年；顾说到第十年，连为何九年前不说也成了不敢开口的缘由。那不是他在第十年已经作证。}怕丢人仍原样留着，没有被改成被迫无奈。 # beat:dr_living_benefit_8 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
}
{
- dr_land_trace and dr_house_plain:
收买活口那笔钱你追到了中人；接手产业那一家，你问过当时谁知道，也把他的拒答与确认分开记着。 # beat:dr_living_benefit_9 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
- else:
{dr_land_trace:收买活口那笔钱，你沿旧契追到中人。|旧契上那笔钱，你从接路往来反推回来。}{dr_house_plain:接手产业那一家，你问谁当时知道，不将拒答写成参与杀人。|继业门人当场分清亲见与父辈传话，家主也须回答自己知道哪一段。}确认与未答的，两样你都没省。 # beat:dr_living_benefit_10 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
}
{
- dr_tell_three:
那一夜先让三人商量的约定还在，他们自己认过各要说哪一段。你替多等半日的门人解释过，也受了护短的骂；严先交代病客，杜要收好木铺，谢也还得送船，三个人约好次日才一同来，不是听你一句召集便无别的事。 # beat:dr_living_benefit_11 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
- else:
你先公开三名，医馆、木铺被追问后关过门。如今你多跑两夜，一夜等严配完药，一夜在杜刨台边说明不是只找谢顶；谢也要听另两人亲口说自己来。你不催立刻信你，最后三人定自己一起到，重开的门却不等于先前围问没发生。 # beat:dr_living_benefit_12 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
}
-> which_eyes

=== which_eyes ===
前一晚，院外赌死人进前十、榜房不敢翻、三个假谢会抓谁。陆居然叫人押谢不进现榜，你问不是自己定的么，他说所以稳。 # beat:dr_which_eyes_1 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
人家听见您名字，把这一注退了。 # beat:dr_which_eyes_2 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:dr_apprentice # mood:dr_apprentice=amused
没下注也不让死人占。明日先把活人的事讲完。 # beat:dr_which_eyes_3 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:dr_lu # mood:dr_lu=intent
你收好卷，三个人也各定好来时辰。明日白水旧案不只一行要改，还会有人站出来，将十八年再说一遍。 # beat:dr_which_eyes_4 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
* [次日留在周砚的座位：读全旧案，也看顾临川肯不肯自己开口。 # cid:dr_eyes_zhou]
  ~ dr_pov = 1
  你将从桌边听每一句。自己掌着笔，却没有替别人先说这次该怎样认错的权力。 # beat:dr_which_eyes_5 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
  -> council
* [次日随谢无灯站在院后：以他的眼与心，接住师名洗清与自己冒名的两份事。 # cid:dr_eyes_wudeng]
  ~ dr_pov = 2
  你将暂时跟随谢无灯。已经找到的三个人不会再被藏回一个假名，周的笔也不会因此替谁少记一份。 # beat:dr_which_eyes_6 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
  -> council

=== council ===
大修当日，正中长桌，后面旧册，两边各门老人，现榜来一半。没有擂台，也不临时打一场便把二十四个人全部重排。 # beat:dr_council_1 # scene:dr_council # cast:dr_lu # speaker:narrator
先议二十四退不退、十九三败、十三两年不公开应、八迁川蜀。门外等死人案不耐，陆说前面二十三人也活着，不能全晾着。 # beat:dr_council_2 # scene:dr_council # cast:dr_lu # speaker:narrator
{
- dr_pov == 2:
此刻你是谢无灯，在院后看那张桌。十八年都想有人听见师名，偏它还没被叫；严、杜在旁不抢话，你也不能用今天最冤的一件把前头所有人都挤开。 # beat:dr_council_3 # scene:dr_council # cast:dr_lu # speaker:narrator
- else:
此刻你仍是周砚，坐陆旁。一封来信已将院子挤满，手底这卷却不能只为今天最热闹的一名漏掉其余活人的旧战。 # beat:dr_council_4 # scene:dr_council # cast:dr_lu # speaker:narrator
}
{
- dr_pov == 2:
 -> council_wu
- else:
 -> council_zhou
}

=== council_wu ===
第十八去年输关键一场，今却议升十六。身旁有人骂榜房果然想怎么写便写。你也听得一紧，十八年来见过太多一张纸压下真正做过的事。 # beat:dr_council_wu_1 # scene:dr_outeryard # cast:dr_yan,dr_du # speaker:narrator
先听他们念完。 # beat:dr_council_wu_2 # scene:dr_outeryard # cast:dr_yan,dr_du # speaker:dr_yan # mood:dr_yan=intent
那场负给第五，打二百七十余才险败；三年又胜二十二、十九、十七。不是一场负便把其余全删。 # beat:dr_council_wu_3 # scene:dr_outeryard # cast:dr_yan,dr_du # speaker:narrator
* [先不替台下骂声答应，听完十八这几年的事；自己的师父，也盼有人肯这样听。 # cid:dr_wu_listen_whole]
  ~ dr_mid_response = 1
  你握着衣边，没再催叫师名。杜看你一眼，把原想说的那句也等过去。今天迟一点，不全是有人还想压着你们。 # beat:dr_council_wu_4 # scene:dr_outeryard # cast:dr_yan,dr_du # speaker:narrator
  -> case_read
* [向近旁人说刚才漏听的二百七十与三场胜，不用自己的苦把另一个活人的路说没。 # cid:dr_wu_stop_rumor]
  ~ dr_mid_response = 2
  他负的是第五。你先把后面听完。 # beat:dr_council_wu_5 # scene:dr_outeryard # cast:dr_yan,dr_du # speaker:you
  那人反问你又是谁，你没报谢藏锋。谢无灯三个字说出来，喉口反比先前用师名叫阵时紧。 # beat:dr_council_wu_6 # scene:dr_outeryard # cast:dr_yan,dr_du # speaker:narrator
  -> case_read

=== council_zhou ===
第十八提十六，院外骂声起。徒弟手指正压在那一场败字，你要他把对手也读出来：第五，二百七十余险胜。再读三年胜二十二、十九、十七。 # beat:dr_council_zhou_1 # scene:dr_council # cast:dr_lu,dr_apprentice # speaker:narrator
输第五，便证明不如十八？ # beat:dr_council_zhou_2 # scene:dr_council # cast:dr_lu,dr_apprentice # speaker:dr_lu # mood:dr_lu=intent
院里慢慢静一点。你仍得把具体几场给人听，不拿懂规矩三字叫所有不懂的人先闭口。 # beat:dr_council_zhou_3 # scene:dr_council # cast:dr_lu,dr_apprentice # speaker:narrator
* [让徒弟读全三年，再回答质问，不用一句陆老已定将这段省掉。 # cid:dr_zhou_read_whole]
  ~ dr_mid_response = 1
  他读得慢，开始还有人插话，后来真问是哪一次公开。你翻到那一页给他，不要求他因读得响便自动信。 # beat:dr_council_zhou_4 # scene:dr_council # cast:dr_lu,dr_apprentice # speaker:narrator
  -> case_read
* [把胜负的对手与怎样负逐项说清，宁肯死人案再迟片刻。 # cid:dr_zhou_answer_opponent]
  ~ dr_mid_response = 2
  你答完，门外看客又催谢。陆没让你快些去讨今天最想听的人欢喜，先等这一项各家真议完。 # beat:dr_council_zhou_5 # scene:dr_council # cast:dr_lu,dr_apprentice # speaker:narrator
  -> case_read

=== case_read ===
午后，终于白水渡。周砚念谢旧第七、涉案、失踪、后以死论，再念顾证、鹿溪旧驿、黑沙旧款、葛身份、收买活口的契与验尸旧簿。近一时辰，逐份有人问、有人对，不拿一段悲情替它们全过。 # beat:dr_case_read_1 # scene:dr_council # cast:dr_lu # speaker:narrator
三十二死者是否还可归谢？主议老人无一赞成，谢不涉杀人案先定。院外这时才有人让路：顾临川拄杖，走很慢，进来没坐，先问念到哪里。 # beat:dr_case_read_2 # scene:dr_council # cast:dr_lu # speaker:narrator
周说刚定谢不涉案，顾点头，答那还有我的。 # beat:dr_case_read_3 # scene:dr_council # cast:dr_lu # speaker:narrator
那夜他来，我应。私下，我险胜，他受伤。后来求我作证，我叫等三日。 # beat:dr_case_read_4 # scene:dr_council # cast:dr_gu,dr_lu # speaker:dr_gu # mood:dr_gu=intent
有人问为何三日。他握杖，院里等着。 # beat:dr_case_read_5 # scene:dr_council # cast:dr_gu,dr_lu # speaker:narrator
怕丢人。 # beat:dr_case_read_6 # scene:dr_council # cast:dr_gu,dr_lu # speaker:dr_gu # mood:dr_gu=uneasy
只因谢已逼他把底全翻？是。年轻时觉得那已极大，后来才知还有更大。 # beat:dr_case_read_7 # scene:dr_council # cast:dr_gu,dr_lu # speaker:narrator
没有被迫的幕后人从门外替他说话，也没有新战绩能抵掉这十八年。 # beat:dr_case_read_8 # scene:dr_council # cast:dr_gu,dr_lu # speaker:narrator
{
- dr_mid_response == 1:
第十八这三年的胜负，是被人完整听过一遍才起的争辩。先听全再说话——院里今天多几个人学会了这一手。 # beat:dr_case_read_9 # scene:dr_council # cast:dr_gu,dr_lu # speaker:narrator
- else:
对手是谁、怎样负，你逐项答完才轮到下一项。门外再催，这一项也没有被跳过去。 # beat:dr_case_read_10 # scene:dr_council # cast:dr_gu,dr_lu # speaker:narrator
}
{
- dr_pov == 2:
 -> wu_bow
- else:
 -> zhou_bow
}

=== wu_bow ===
你仍是谢无灯。顾朝院后走，走到你们面前将杖交旁人，双手抱拳，行平礼。 # beat:dr_wu_bow_1 # scene:dr_outeryard # cast:dr_gu # speaker:narrator
这十八年，有我一份。 # beat:dr_wu_bow_2 # scene:dr_outeryard # cast:dr_gu # speaker:dr_gu # mood:dr_gu=intent
你眼一下红，手却没抬。小时候以为最响的名字能把天都压住，如今他只在眼前等你，不能把这十八年替你重新活。 # beat:dr_wu_bow_3 # scene:dr_outeryard # cast:dr_gu # speaker:narrator
* [先让自己不回答，不逼严与杜也一起站成同一种硬。 # cid:dr_wu_allow_silence]
  ~ dr_bow_response = 1
  严先抬手，杜跟，你看见了，没有责他们比自己先软。这里不是还要凑三个人才像一个不肯回头的师父。 # beat:dr_wu_bow_4 # scene:dr_outeryard # cast:dr_gu # speaker:narrator
  -> after_bow
* [看他平举的手，承认他今天真说出了，也让自己的怨还留在自己这里。 # cid:dr_wu_look_at_hands]
  ~ dr_bow_response = 2
  你没能立刻原谅，也没把那句话当没听见。严先举手，杜随后，眼前老人仍没催你。 # beat:dr_wu_bow_5 # scene:dr_outeryard # cast:dr_gu # speaker:narrator
  -> after_bow

=== zhou_bow ===
你仍是周砚。顾到三人前，交杖、抱拳，平礼。 # beat:dr_zhou_bow_1 # scene:dr_council # cast:dr_gu,dr_wudeng # speaker:narrator
这十八年，有我一份。 # beat:dr_zhou_bow_2 # scene:dr_council # cast:dr_gu,dr_wudeng # speaker:dr_gu # mood:dr_gu=intent
谢眼红，却没回。你手在笔边，第一次知道纸能把一句记全，也不能替一个人答该不该原谅。 # beat:dr_zhou_bow_3 # scene:dr_council # cast:dr_gu,dr_wudeng # speaker:narrator
严先，杜次。谢仍站着，没有人给他报一段已经太迟的谢辞。 # beat:dr_zhou_bow_4 # scene:dr_council # cast:dr_gu,dr_wudeng # speaker:narrator
* [不给谢递一个必须回礼的眼色，让这一刻由他自己过。 # cid:dr_zhou_leave_space]
  ~ dr_bow_response = 1
  你松开本想起身的手。顾等，谢也等，院外看客没有因为想看一个皆大欢喜便能替他们把手抬起。 # beat:dr_zhou_bow_5 # scene:dr_council # cast:dr_gu,dr_wudeng # speaker:narrator
  -> after_bow
* [把这一礼留在私记，不抢先宣读成榜房已见证他们彼此释怀。 # cid:dr_zhou_keep_private]
  ~ dr_bow_response = 2
  你只记亲见的礼，不写已和解。那些会被后世抄成真话的字，今日不能由你替他们先说。 # beat:dr_zhou_bow_6 # scene:dr_council # cast:dr_gu,dr_wudeng # speaker:narrator
  -> after_bow

=== after_bow ===
很久，谢终于抬手。四人不再多说，谢只眼红，仍未哭。榜里没写这礼，周的私记留下了；它不升哪一席，也不等于十八年已抵。 # beat:dr_after_bow_1 # scene:dr_outeryard # cast:dr_wudeng,dr_yan,dr_du # speaker:narrator
这一礼之后，视角回到周砚。桌边还有旧录与三场真胜负，你得回去把未完的事做完。 # beat:dr_after_bow_2 # scene:dr_outeryard # cast:dr_wudeng,dr_yan,dr_du # speaker:narrator
{
- dr_bow_response == 1:
那一礼你没有人急着替谁回。严先抬手、杜跟上、谢自己走过这一刻——后来谁问起，这一段都还是他们自己的。 # beat:dr_after_bow_3 # scene:dr_outeryard # cast:dr_wudeng,dr_yan,dr_du # speaker:narrator
- else:
你把看见的照实记下，没有替这一刻添一个和解。该留的怨各人自己留着，纸上便只有一行亲见的礼。 # beat:dr_after_bow_4 # scene:dr_outeryard # cast:dr_wudeng,dr_yan,dr_du # speaker:narrator
}
有人叫谢藏锋算第几，陆答不算，他死了。翻案与复活两回事，十八年前第七仍是他的，今天二十四席却不为一个被以死论、未确认仍在此间活动的人留座。 # beat:dr_after_bow_5 # scene:dr_council # cast:dr_lu,dr_wudeng # speaker:narrator
那我们那些场？ # beat:dr_after_bow_6 # scene:dr_council # cast:dr_lu,dr_wudeng # speaker:dr_wudeng # mood:dr_wudeng=uneasy
分别记。冒名也分别记。 # beat:dr_after_bow_7 # scene:dr_council # cast:dr_lu,dr_wudeng # speaker:you
* [当三人面逐场读回本人名字，也读冒名，不把谢一人推在前面承担全部。 # cid:dr_read_names_to_people]
  ~ dr_names_plain = true
  梁八十三归谢无灯，赵六十九归杜青禾，何一百一十四归严松。三人听完，各自答是，没有谁能因自己本领更高便把另一个人的那场也拿走。 # beat:dr_after_bow_8 # scene:dr_council # cast:dr_lu,dr_wudeng # speaker:narrator
  -> old_entry
* [让三人各自说明哪场自己真做过，再把要承担的假名当面读清。 # cid:dr_let_each_answer]
  ~ dr_names_plain = false
  谢认梁、杜认赵、严认何，各自也认用谢藏锋之名。你没因十七份申诉就用同一个感动替他们免答，也没因冒名便抹掉真赢。 # beat:dr_after_bow_9 # scene:dr_council # cast:dr_lu,dr_wudeng # speaker:narrator
  -> old_entry

=== old_entry ===
旧录原来涉白水渡案、失踪后以死论，改成白水渡案后失踪，原案所指杀人事后查不实；恢复旧江汉第七。现榜没有谢藏锋。 # beat:dr_old_entry_1 # scene:dr_council # cast:dr_lu,dr_wudeng # speaker:narrator
谢本身三人最弱，梁一场连几场可核旧战够候补；严更稳却活动少，杜最高但几无公开行走，都不入。谢问弱的反候补？陆说榜不读心，强的可去打，杜答没兴趣。 # beat:dr_old_entry_2 # scene:dr_council # cast:dr_lu,dr_wudeng # speaker:narrator
所以。 # beat:dr_old_entry_3 # scene:dr_council # cast:dr_lu,dr_wudeng # speaker:dr_lu # mood:dr_lu=amused
三日后新榜，首仍原首，前十动三席，谢只第一候补，未进二十四。他站榜下笑，说十八年，师父没回，自己也没进。 # beat:dr_old_entry_4 # scene:dr_council # cast:dr_lu,dr_wudeng # speaker:narrator
本来也没人说一定能进。 # beat:dr_old_entry_5 # scene:dr_council # cast:dr_lu,dr_wudeng # speaker:you
陆经过，答能回来的只有真相，死人不会回来。你看旧卷，写的是后以死论，仍不是那一夜真有人见尸。 # beat:dr_old_entry_6 # scene:dr_council # cast:dr_lu,dr_wudeng # speaker:narrator
{
- dr_liang_private:
梁的弟子来约你，说老师愿再当面补一段。你先前多走那一天、挨过遮掩的骂没有白换成一份客气：梁肯自己向新抄手说明为何输了，不必每次先拿死人的笑话挡在两人之间。 # beat:dr_old_entry_7 # scene:dr_council # cast:dr_lu,dr_wudeng # speaker:narrator
- else:
梁送来一份签过的补述，人没来。他那段公开得快，也真被城里笑了月余，你当面去认没先说清传播的代价，没有要求他再站院里替你证明公信。他仍认负，今后细问先走书面，你得多派一趟人核回。 # beat:dr_old_entry_8 # scene:dr_council # cast:dr_lu,dr_wudeng # speaker:narrator
}
{
- dr_face_askers:
九月那日，梁、赵、何各自站起来说明自己被冒的那一场。堂上比往年多三张嘴，旧案那一项被拖到后半日；被冒这件事却是从本人嘴里出来的，不由你代说。 # beat:dr_old_entry_9 # scene:dr_council # cast:dr_lu,dr_wudeng # speaker:narrator
- else:
九月那日念的都是证。梁、赵、何在场，从头到尾没有开口；后来翻卷的人只见榜房的笔，与那一行三人各与本人当面对质。 # beat:dr_old_entry_10 # scene:dr_council # cast:dr_lu,dr_wudeng # speaker:narrator
}
{
- dr_names_plain:
梁八十三、赵六十九、何一百一十四逐场读回本人名字那一段，卷里有三人各自答是作底，后人翻不到一句代答。 # beat:dr_old_entry_11 # scene:dr_council # cast:dr_lu,dr_wudeng # speaker:narrator
- else:
哪场自己真做过、用的哪个假名，是三个人各自说明的。卷上因此各有各的笔迹，不是榜房一个声音念到底。 # beat:dr_old_entry_12 # scene:dr_council # cast:dr_lu,dr_wudeng # speaker:narrator
}
-> two_years

=== two_years ===
案看似收好，徒弟把白水卷推回架上时都松了口气，你却叫住他：衣与剑在下游，并没有尸。 # beat:dr_two_years_1 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
案结了。再查，查的是谁的案？ # beat:dr_two_years_2 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:dr_apprentice # mood:dr_apprentice=uneasy
谢藏锋的。他还没死成。 # beat:dr_two_years_3 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:you
陆观棋从旧册里抬头。你以为他要拦，他却把当月的访资簿推到你手边。 # beat:dr_two_years_4 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
榜房一年走得了几个县，你自己填。填得下，就别指望明年今日便有结果。 # beat:dr_two_years_5 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:dr_lu # mood:dr_lu=intent
你填了。此后又两年，山寺客簿出现谢藏锋，日期是案后第七年；再追，案后九年西南有人见姓谢瘦剑客，十一年，小镇医馆给谢藏锋治旧伤。至少所有人当他已死以后，他又活过十一年，后面怎样终老仍未能确证。 # beat:dr_two_years_6 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
同在修榜后第二年，顾临川去世。临终信两行，榜可以错，不能明知错了还不改。你夹在卷首，不宣传，不刻碑，没让最后一句替他抵掉已由自己亲认的沉默。 # beat:dr_two_years_7 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
{
- dr_face_alone:
梁、赵、何当初各自单独说完，没有第二个人在旁替他们作证。九月那张桌上他们肯复述的仍只有输赢，那半句留在三间关起来的屋里。 # beat:dr_two_years_8 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
- else:
六个人当初同日在场，说过的话有人可证。九月桌上再有人问谁被谁冒，你不必只靠自己一支笔去挡。 # beat:dr_two_years_9 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
}
{
- dr_faces_recorded:
三份帖旁还各自留着原话。后来有人翻到这一段，最先看见的不是三个假名，是三个人怎样把自己的那一句说出口。 # beat:dr_two_years_10 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
- else:
卷上只有一行当面对质。梁后来仍肯认输，赵仍收帖，可当日那半句没有被记下，九月之后便再没有第二处能引。 # beat:dr_two_years_11 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
}
* [把七、九、十一各自来源带给三人，告诉至少活过，不拿后无记录又补一个确定死日。 # cid:dr_tell_life_with_limits]
  ~ dr_life_limits = true
  你把那几处一一读，谢听到十一，手在凳边停住。你没叫他为查得细先谢榜房，这十一年不是你今日赐给师父的寿命。 # beat:dr_two_years_12 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
  -> living_eleven
* [亲去找三人，先让他们听师父还有过路，再将核过与仍不知分开说，不只寄一份结论。 # cid:dr_tell_three_in_person]
  ~ dr_life_limits = false
  三人都愣，谢先问为何没回。你没答不想见他们，也不替谢藏锋补一个自己没问到的苦衷。 # beat:dr_two_years_13 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:narrator
  我不知道。能核的先在这里，后面我还会问。 # beat:dr_two_years_14 # scene:dr_boardhouse # cast:dr_lu,dr_apprentice # speaker:you
  -> living_eleven

=== living_eleven ===
为什么没回来？ # beat:dr_living_eleven_1 # scene:dr_boxroom # cast:dr_wudeng,dr_yan,dr_du # speaker:dr_wudeng # mood:dr_wudeng=uneasy
没有人能回答。几个月后，山寺又找出未寄的信，收无灯、严松、青禾。不知为何留寺，纸黄了，名字却不像冒名帖上的那一个。 # beat:dr_living_eleven_2 # scene:dr_boxroom # cast:dr_wudeng,dr_yan,dr_du # speaker:narrator
信说年轻觉得名脏便什么都没，走远才知人还在、路还在；白水不是他，能清便好，不能也别把一生耗进去。最后不是要争第七。 # beat:dr_living_eleven_3 # scene:dr_boxroom # cast:dr_wudeng,dr_yan,dr_du # speaker:narrator
别争我的榜，争我没做过的事。 # beat:dr_living_eleven_4 # scene:dr_boxroom # cast:dr_wudeng,dr_yan,dr_du # speaker:narrator
{
- dr_life_limits:
七、九、十一各是哪一年、谁看见，你都分开读过。谢没有替师父多领一天，也只是从那天起，不再把活过的年头当成查错的错处。 # beat:dr_living_eleven_5 # scene:dr_boxroom # cast:dr_wudeng,dr_yan,dr_du # speaker:narrator
- else:
是你把能核的年头先送到三个人面前的。所以这封信拆开时，他们问的是为何不回，不是消息真假。 # beat:dr_living_eleven_6 # scene:dr_boxroom # cast:dr_wudeng,dr_yan,dr_du # speaker:narrator
}
* [把信交到三人手里，不将最后一句立刻读给院外等传奇的人。 # cid:dr_give_unfinished_letter]
  ~ dr_letter_private = true
  你往旁让，严把折口展开又停，杜用粗手托住下沿。谢看了很久，没有再先问这纸能不能让谁进现榜。 # beat:dr_living_eleven_7 # scene:dr_boxroom # cast:dr_wudeng,dr_yan,dr_du # speaker:narrator
  -> letter_cry
* [问他们愿怎样留原信，副本才归卷，不把已经找到便当成可任你宣传。 # cid:dr_ask_how_keep_letter]
  ~ dr_letter_private = false
  先让他看完。抄本给你，原件我们商量。 # beat:dr_living_eleven_8 # scene:dr_boxroom # cast:dr_wudeng,dr_yan,dr_du # speaker:dr_yan # mood:dr_yan=intent
  你应下，没因自己查了两年就替他们把最后一页的去处也先定。 # beat:dr_living_eleven_9 # scene:dr_boxroom # cast:dr_wudeng,dr_yan,dr_du # speaker:narrator
  -> letter_cry

=== letter_cry ===
谢十八年来最硬，被查不怕，被沈骂也顶，顾一礼只眼红，到这封信却蹲下哭得像孩子。你没扶他站直给人看，严也没有把哭当作该尽快结束的一件事。 # beat:dr_letter_cry_1 # scene:dr_boxroom # cast:dr_wudeng,dr_yan,dr_du # speaker:narrator
十八年，有一半走错。 # beat:dr_letter_cry_2 # scene:dr_boxroom # cast:dr_wudeng,dr_yan,dr_du # speaker:dr_yan # mood:dr_yan=uneasy
另一半没错。白水渡不是他，这没争错。 # beat:dr_letter_cry_3 # scene:dr_boxroom # cast:dr_wudeng,dr_yan,dr_du # speaker:dr_du # mood:dr_du=intent
三个人安静下来。师父没被拖回江汉第七，却有活过的十一年终于不再全被夹进同一天的死里。 # beat:dr_letter_cry_4 # scene:dr_boxroom # cast:dr_wudeng,dr_yan,dr_du # speaker:narrator
{
- dr_letter_private:
原信交在三人手里，院外那晚没有听见最后一个字。卷里后来收的是抄本，原件上三个人各自按过的手印还在。 # beat:dr_letter_cry_5 # scene:dr_boxroom # cast:dr_wudeng,dr_yan,dr_du # speaker:narrator
- else:
原件由他们商量着留，副本归卷。你记下这一条去处，没有因自己查了两年，就替最后一页多定一次。 # beat:dr_letter_cry_6 # scene:dr_boxroom # cast:dr_wudeng,dr_yan,dr_du # speaker:narrator
}
-> fifth_year

=== fifth_year ===
这些年间，距原来那次修榜五年，谢无灯才真正入二十四，第二十四，渡灯手。不写谢藏锋，不写照夜剑传人。剑他仍会，手里却已是短篙改铁杆。 # beat:dr_fifth_year_1 # scene:dr_newboard # cast:dr_wudeng,dr_yan,dr_du # speaker:narrator
为何不再用师父剑？ # beat:dr_fifth_year_2 # scene:dr_newboard # cast:dr_wudeng,dr_yan,dr_du # speaker:you
会。但不想再像。 # beat:dr_fifth_year_3 # scene:dr_newboard # cast:dr_wudeng,dr_yan,dr_du # speaker:dr_wudeng # mood:dr_wudeng=amused
严仍行医，始终不入，杜也很少再正式问艺。懂行的人知两人可能并不弱，榜不能因为记得当年三人拼起来才像，就把他们今后也绑着一起排。 # beat:dr_fifth_year_4 # scene:dr_newboard # cast:dr_wudeng,dr_yan,dr_du # speaker:narrator
我做木头，没说每年拿剑请你改我名字。 # beat:dr_fifth_year_5 # scene:dr_newboard # cast:dr_wudeng,dr_yan,dr_du # speaker:dr_du # mood:dr_du=amused
你先把他那根篙修平。别又叫人握着扎手来我这里。 # beat:dr_fifth_year_6 # scene:dr_newboard # cast:dr_wudeng,dr_yan,dr_du # speaker:dr_yan # mood:dr_yan=neutral
* [请谢以自己名字再走一手，真记今天的铁杆，不只说终于恢复师传。 # cid:dr_keep_wudeng_name]
  ~ dr_new_name = true
  他脚下仍有旧伤，铁杆借水上的短近，早不是硬摆回一张旧剑图。你接他慢递的一下，退开，才让徒弟照实记看见的兵器。 # beat:dr_fifth_year_7 # scene:dr_newboard # cast:dr_wudeng,dr_yan,dr_du # speaker:narrator
  这回你别写又像。 # beat:dr_fifth_year_8 # scene:dr_newboard # cast:dr_wudeng,dr_yan,dr_du # speaker:dr_wudeng # mood:dr_wudeng=amused
  写你。 # beat:dr_fifth_year_9 # scene:dr_newboard # cast:dr_wudeng,dr_yan,dr_du # speaker:you
  -> lu_last
* [向严与杜说榜外不是被这几年忘了，给他们不再争的选择，不劝二人也去补一席。 # cid:dr_ask_yan_du]
  ~ dr_new_name = false
  病人今日没少一位，你可别替我另挂一块要出去比剑的牌。 # beat:dr_fifth_year_10 # scene:dr_newboard # cast:dr_wudeng,dr_yan,dr_du # speaker:dr_yan # mood:dr_yan=amused
  他能进，记他。我不想打，也记我不想打。 # beat:dr_fifth_year_11 # scene:dr_newboard # cast:dr_wudeng,dr_yan,dr_du # speaker:dr_du # mood:dr_du=neutral
  你点头，没让一个谢无灯入榜的好结尾连带把另外两个人也改成该被推上去。 # beat:dr_fifth_year_12 # scene:dr_newboard # cast:dr_wudeng,dr_yan,dr_du # speaker:narrator
  -> lu_last

=== lu_last ===
旧案彻底收尾后第三年，陆病重，八十二，无榜籍，年轻最高也只普通小榜候补。替人写一生的老人，将榜房钥匙交给你。 # beat:dr_lu_last_1 # scene:dr_luroom # cast:dr_lu # speaker:narrator
还要交代什么？ # beat:dr_lu_last_2 # scene:dr_luroom # cast:dr_lu # speaker:you
别信名气。 # beat:dr_lu_last_3 # scene:dr_luroom # cast:dr_lu # speaker:dr_lu # mood:dr_lu=intent
还有？ # beat:dr_lu_last_4 # scene:dr_luroom # cast:dr_lu # speaker:you
别太不信名气。 # beat:dr_lu_last_5 # scene:dr_luroom # cast:dr_lu # speaker:dr_lu # mood:dr_lu=amused
不矛盾？ # beat:dr_lu_last_6 # scene:dr_luroom # cast:dr_lu # speaker:you
所以才要查。 # beat:dr_lu_last_7 # scene:dr_luroom # cast:dr_lu # speaker:dr_lu # mood:dr_lu=neutral
他闭眼睡。 # beat:dr_lu_last_8 # scene:dr_luroom # cast:dr_lu # speaker:narrator
{
- dr_new_name:
榜上记的是谢无灯与那根铁杆，不是又像了一次师传。徒弟照实写下的兵器那一行，后来没有人需要再改。 # beat:dr_lu_last_9 # scene:dr_luroom # cast:dr_lu # speaker:narrator
- else:
严与杜那两句不想打，你也照记。榜外不是被忘，是他们自己选下的位置——这话后来果然不必收回。 # beat:dr_lu_last_10 # scene:dr_luroom # cast:dr_lu # speaker:narrator
}
第二日清晨没醒。你四十二，正式接榜房。开院门那天，没有一个新名次写给你，三间屋两间库却都真要有人接。 # beat:dr_lu_last_11 # scene:dr_luroom # cast:none # speaker:narrator
* [多留院里亲带新抄手，将查到与没查到当面教；外访让同门去，少去一段自己还想追的路。 # cid:dr_career_teach]
  ~ dr_career = 1
  你把原订远访托给同门，留新抄手自己问一回。门外有人要将三十招胜第八直接送上榜，你叫年轻人先把对方也找来，不替他问完才叫他抄。 # beat:dr_lu_last_12 # scene:dr_luroom # cast:none # speaker:narrator
  -> new_duties
* [多往外亲访，让不便远来的证人也能说；堂前交同门带新抄手，少亲看一班正在学的人。 # cid:dr_career_visit]
  ~ dr_career = 2
  你托同门守当天的问事，自己到外县见不愿再赶来的人。新抄手想跟，你只带这一位，另班得由别人真教，不能说出门也算自己都教过了。 # beat:dr_lu_last_13 # scene:dr_luroom # cast:none # speaker:narrator
  -> new_duties

=== new_duties ===
头一年三件递到桌前。第一件，自报三十招胜现第八；你去查，是酒后争执，第八站都站不稳。你把它退回去，不作较艺记。 # beat:dr_new_duties_1 # scene:dr_boardhouse # cast:dr_next # speaker:narrator
第二件呢？府榜那位死不认输的。 # beat:dr_new_duties_2 # scene:dr_boardhouse # cast:dr_next # speaker:dr_next # mood:dr_next=uneasy
十二可靠旁观，胜负照记。认不认，是他的脸面，不是证据。 # beat:dr_new_duties_3 # scene:dr_boardhouse # cast:dr_next # speaker:you
第三件最麻烦：两人闭门，一个说平，一个说自己胜，无第三人。 # beat:dr_new_duties_4 # scene:dr_boardhouse # cast:dr_next # speaker:narrator
那记什么？ # beat:dr_new_duties_5 # scene:dr_boardhouse # cast:dr_next # speaker:dr_next # mood:dr_next=neutral
有战无定论。 # beat:dr_new_duties_6 # scene:dr_boardhouse # cast:dr_next # speaker:you
两边都来骂闭门那一行，你忽然觉得陆走早了。院门没有因你接了钥匙就会少来一句整个江湖都知道。 # beat:dr_new_duties_7 # scene:dr_boardhouse # cast:dr_next # speaker:narrator
{
- dr_career == 1:
 -> room_lesson
- else:
 -> road_lesson
}

=== room_lesson ===
年轻胜者站在桌前，十二见证已经核过，输的府榜人物仍不肯认。新抄手想让对方再来签，少年问是不是不认便能一直压着自己的真胜。 # beat:dr_room_lesson_1 # scene:dr_boardhouse # cast:dr_next,dr_youngwinner # speaker:narrator
我能再走给你看，不能叫那日重来。 # beat:dr_room_lesson_2 # scene:dr_boardhouse # cast:dr_next,dr_youngwinner # speaker:dr_youngwinner # mood:dr_youngwinner=intent
你让他别为证明自己先演一个替原战补出来的今日。抄手将已核的那份翻回，终于真同他讲这场照记。 # beat:dr_room_lesson_3 # scene:dr_boardhouse # cast:dr_next,dr_youngwinner # speaker:narrator
* [让抄手亲口答已经能确认什么，自己在旁接漏处，不抢他第一次真要担的一句。 # cid:dr_room_let_next_answer]
  ~ dr_lesson = 1
  他答得磕绊，却没说请少年再赢一回就容易记。你等他把原战与今日示范分开，才补一句不认输也不等于无证。 # beat:dr_room_lesson_4 # scene:dr_boardhouse # cast:dr_next,dr_youngwinner # speaker:narrator
  那我今日不白来，不是又替他等一句肯认。 # beat:dr_room_lesson_5 # scene:dr_boardhouse # cast:dr_next,dr_youngwinner # speaker:dr_youngwinner # mood:dr_youngwinner=amused
  -> later_teacher
* [同少年慢接一手，让抄手看今日可观察，不等于自己忽然看见当日的全场。 # cid:dr_room_show_limits]
  ~ dr_lesson = 2
  木剑一搭，你看出他会怎样回，不替从前没有在场的自己多记十招。抄手先记今天示范，另列原战十二见证，没把它们揉成同一场。 # beat:dr_room_lesson_6 # scene:dr_boardhouse # cast:dr_next,dr_youngwinner # speaker:narrator
  你叫少年把木剑收好，真胜仍由那日真实的证来写。 # beat:dr_room_lesson_7 # scene:dr_boardhouse # cast:dr_next,dr_youngwinner # speaker:narrator
  -> later_teacher

=== road_lesson ===
你到外县见不便来房的几位目击者。年轻胜者引路，想把十二人全请到一间屋，他怕若有一句不一样便又被说不算。 # beat:dr_road_lesson_1 # scene:dr_ferryroad # cast:dr_next,dr_youngwinner # speaker:narrator
要他们先对一遍么？ # beat:dr_road_lesson_2 # scene:dr_ferryroad # cast:dr_next,dr_youngwinner # speaker:dr_youngwinner # mood:dr_youngwinner=uneasy
各自说。看见的位置不同，本来就不会每字一样。 # beat:dr_road_lesson_3 # scene:dr_ferryroad # cast:dr_next,dr_youngwinner # speaker:you
抄手跟到岸边，先让老人坐下，没用为了你好一句就把十二个人都搬到自己的门前。 # beat:dr_road_lesson_4 # scene:dr_ferryroad # cast:dr_next,dr_youngwinner # speaker:narrator
* [带抄手分别站到当时的位置，让每人只说亲见，不要求他们先讲出一致故事。 # cid:dr_road_separate_views]
  ~ dr_lesson = 1
  一位看脚，一位看先停的手，谁也没看完所有。你先听彼此能相接的地方，再问相冲那一句，不以年老就先取年轻人那份。 # beat:dr_road_lesson_5 # scene:dr_ferryroad # cast:dr_next,dr_youngwinner # speaker:narrator
  不是少一字就全假，也不是人多便都真。 # beat:dr_road_lesson_6 # scene:dr_ferryroad # cast:dr_next,dr_youngwinner # speaker:dr_next # mood:dr_next=intent
  接着问。 # beat:dr_road_lesson_7 # scene:dr_ferryroad # cast:dr_next,dr_youngwinner # speaker:you
  -> later_teacher
* [让抄手自己问对方怎样停，宁肯再住一晚，不替他将整条访路一句查毕带回。 # cid:dr_road_let_next_ask]
  ~ dr_lesson = 2
  他问得慢，渡船已走，你多住一夜，堂里那班仍由同门接。胜者想替老人答，你让他等，后来听见的停手细节正是他当时背向没看见的。 # beat:dr_road_lesson_8 # scene:dr_ferryroad # cast:dr_next,dr_youngwinner # speaker:narrator
  第二日回去，抄手带回的不是你写给他抄的一页结论。 # beat:dr_road_lesson_9 # scene:dr_ferryroad # cast:dr_next,dr_youngwinner # speaker:narrator
  -> later_teacher

=== later_teacher ===
后来有一回，沈霁娘听人夸一眼认三谢，又说不是一眼，是真打过三次。问最要紧懂武还是懂人，她都说不够。 # beat:dr_later_teacher_1 # scene:dr_shenyard # cast:dr_shen # speaker:narrator
肯承认可能看错。陆这辈子最烦，就是总问第二遍。 # beat:dr_later_teacher_2 # scene:dr_shenyard # cast:dr_shen # speaker:dr_shen # mood:dr_shen=intent
你想起老人改证据为传闻，也想起若没有三人冒名，旧案大概永远洗不清。可若为同情把三个人拼成的谢重新写进现榜，又是一错。 # beat:dr_later_teacher_3 # scene:dr_shenyard # cast:dr_shen # speaker:narrator
沈没有叫你为懂这句话就从此再不犯错，只催把门边绊她腿的小凳移开。你真去移了，不把她旧伤也说成今天讲得好便没有。 # beat:dr_later_teacher_4 # scene:dr_shenyard # cast:dr_shen # speaker:narrator
{
- dr_lesson == 1:
{dr_career == 1:让抄手自己答第一句、你在旁接漏处|带抄手分别站到当时的位置，让每人只说亲见}——沈说的肯问第二遍，先得容眼前的人说出自己真知道的。 # beat:dr_later_teacher_5 # scene:dr_shenyard # cast:dr_shen # speaker:narrator
- else:
{dr_career == 1:示范与原战你在场也分开，今天看见的，不替当天写。|抄手自己问停手细节，你陪他多住一晚，等到胜者背向时没见的那一句。}沈说不懂武、不懂人都不够，今天真做过的，也不能只剩一句查毕。 # beat:dr_later_teacher_6 # scene:dr_shenyard # cast:dr_shen # speaker:narrator
}
{
- dr_liang_private:
梁愿意亲自接新抄手第二问，这些年仍会说当年败八十三。你先前多费一天换来的不是永远替榜房说好话，是他肯再把看见的交给一个肯等他说完的人。 # beat:dr_later_teacher_7 # scene:dr_shenyard # cast:dr_shen # speaker:narrator
- else:
梁后来仍多用书面补述，输的八十三没改，话也没因你道歉就都改成愿当众讲。你守着先走书面再另核的约，让新抄手知道能记一场真负，不等于可以无限使用输者的难堪。 # beat:dr_later_teacher_8 # scene:dr_shenyard # cast:dr_shen # speaker:narrator
}
-> last_page

=== last_page ===
许多年后，你七十多退下榜房。接任者问最难排谁，你说不是人，是事。十个人看一战，会见十样，最后那一行要让后世许多人当真，写慢一点。 # beat:dr_last_page_1 # scene:dr_lateyard # cast:dr_next # speaker:narrator # look:dr_next=late
墙上无署名木牌，先证明他是谁。后来抄手多当陆留下，只有你知道自己写时想的是一张自称未死的旧纸。 # beat:dr_last_page_2 # scene:dr_lateyard # cast:dr_next # speaker:narrator
又几版，谢无灯也退，新人占旧席。白水卷最里一格，顾的榜可以错、不能明知不改，与谢的别争榜、争没做过的事仍放一起。写信人都已不在，谁也没替他们再添一场未有的胜。 # beat:dr_last_page_3 # scene:dr_lateyard # cast:dr_next # speaker:narrator
{
- dr_career == 1:
来接班的人还记得自己第一次坐桌前怎样将话说错，也记得你没抢过笔说索性我来。后来一次新查推翻旧行，他让抄手亲手添后查不实，别人看得见原来错在哪里。 # beat:dr_last_page_4 # scene:dr_lateyard # cast:dr_next # speaker:narrator
- else:
来接班的人还记得外县{dr_lesson == 1:分站位置问见闻的那一回|等慢问说完而多住的那一夜}，证人不必为腿脚慢便永远说不上话。后来一份旧说被重核，他派人去到说话者身边，也把自己当初信过的错留在卷上供人看见。 # beat:dr_last_page_5 # scene:dr_lateyard # cast:dr_next # speaker:narrator
}
这样还能告诉天下谁最强么？ # beat:dr_last_page_6 # scene:dr_lateyard # cast:dr_next # speaker:dr_next # mood:dr_next=uneasy
天下那么大，你告诉得完？至少留谁来过、打过什么、哪样真、哪样后来证明错。 # beat:dr_last_page_7 # scene:dr_lateyard # cast:dr_next # speaker:you
年轻人还想问最强，你在太阳下闭眼，叫他们自己打去。 # beat:dr_last_page_8 # scene:dr_lateyard # cast:dr_next # speaker:narrator
{
- dr_career == 1:
院里有人又问第二遍。你听见纸翻过一页，没有替他先答；那一行还肯慢下来，门便没有只剩一个写对过的人。 # beat:dr_last_page_9 # scene:dr_lateyard # cast:dr_next # speaker:narrator # ending:dr_room_after
-> END
- else:
远来的人在门边坐下，不必先有能打进榜的名字才配把话说完。你放下已交出的钥匙，听接班的人问他真看见哪一段。 # beat:dr_last_page_10 # scene:dr_lateyard # cast:dr_next # speaker:narrator # ending:dr_road_after
-> END
}
