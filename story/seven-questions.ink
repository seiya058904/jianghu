// Source: 宋世江湖 13920–14849. Independent era, fixed canon, separate witnessed and reported routes.
VAR sq_partner = 0
VAR sq_sources = false
VAR sq_bone = false
VAR sq_witness = false
VAR sq_front = false
VAR sq_saved_scribe = false
VAR sq_shared_tests = false
VAR sq_last_words = false
VAR sq_seat_side = 0
VAR sq_access_question = false
VAR sq_kept_questions = false
VAR sq_notes = false
VAR sq_two_names = false
VAR sq_water_ready = false
VAR sq_route = 0
VAR sq_valley_call = 0
VAR sq_stayed_tree = false
VAR sq_valley_after = 0
VAR sq_court_duty = false
VAR sq_fire_people = false
VAR sq_court_after = 0
VAR sq_final_sources = false
VAR sq_asked_people = false
VAR sq_each_volume = false
VAR sq_career = 0
VAR sq_kept_time = false
-> receipt

=== receipt ===
二十七个人，二十四个名字划了朱。你别把那一栏也摺进去。 # beat:sq_receipt_1 # scene:sq_receipt # cast:sq_hesheng,sq_asheng # speaker:sq_hesheng # mood:sq_hesheng=uneasy
你把手从纸角移开。青石驿押送队二十四死、两重伤、一失踪；这不是今日等着你赶去救的一队人，是已送到眼前的讣报。 # beat:sq_receipt_2 # scene:sq_receipt # cast:sq_hesheng,sq_asheng # speaker:narrator
约八十年前，你是鹿门往来收发的普通门人。季观尘死后，七卷《门外七问》未抵旧阁便遭截。你没见过袭击者，现在得把两家各收到的副报送去核对。 # beat:sq_receipt_3 # scene:sq_receipt # cast:sq_hesheng,sq_asheng # speaker:narrator
先别装七卷。我这袋只装得下两份名单，再多，走到半山准有人问我为何没把整个江湖背来。 # beat:sq_receipt_4 # scene:sq_receipt # cast:sq_hesheng,sq_asheng # speaker:sq_asheng # mood:sq_asheng=neutral
我说装名单，没说装江湖。 # beat:sq_receipt_5 # scene:sq_receipt # cast:sq_hesheng,sq_asheng # speaker:sq_hesheng # mood:sq_hesheng=sharp
你刚才连雨也想夹进副报里。 # beat:sq_receipt_6 # scene:sq_receipt # cast:sq_hesheng,sq_asheng # speaker:sq_asheng # mood:sq_asheng=amused
她把压湿的外纸换下，留内页给你。金陵和南岳都来了人，谁也不想先在另一家面前像个只会听话的送信人。 # beat:sq_receipt_7 # scene:sq_receipt # cast:sq_hesheng,sq_asheng # speaker:narrator
* [先同禾生核金陵副报，再请他带原件一起去问另一家。 # cid:sq_joint_jinling]
  ~ sq_partner = 1
  你这份有收件人，我和你核。另一家那份，核完也请本人来，不隔着我争。 # beat:sq_receipt_8 # scene:sq_receipt # cast:sq_hesheng,sq_asheng # speaker:you
  我去。空着的见证人一栏也留着，不能因为大家知道是华山人，就先写他跑了。 # beat:sq_receipt_9 # scene:sq_receipt # cast:sq_hesheng,sq_asheng # speaker:sq_hesheng # mood:sq_hesheng=intent
  那我先去报南岳。有改字，用你的墨写，别让我跑回来才猜你们谁添的。 # beat:sq_receipt_10 # scene:sq_receipt # cast:sq_hesheng,sq_asheng # speaker:sq_asheng # mood:sq_asheng=neutral
  禾生签过名，又把墨瓶倒过来看。只够半日，他仍把原件匣抱了起来。 # beat:sq_receipt_11 # scene:sq_receipt # cast:sq_hesheng,sq_asheng # speaker:narrator
  -> last_wish
* [先同阿笙核南岳沿途副报，再请她带记路人一起去问。 # cid:sq_joint_nanyue]
  ~ sq_partner = 2
  你这份写了路，我跟你核。金陵原件也带来，别把他们没收过的那句当没发生。 # beat:sq_receipt_12 # scene:sq_receipt # cast:sq_hesheng,sq_asheng # speaker:you
  行。我先去西渡找老程，他那日撑船。过了酉时他便收橹，你跟紧些。 # beat:sq_receipt_13 # scene:sq_receipt # cast:sq_hesheng,sq_asheng # speaker:sq_asheng # mood:sq_asheng=intent
  我拿收件簿。先等等——这是去年的，谁把今年那本垫桌脚了？ # beat:sq_receipt_14 # scene:sq_receipt # cast:sq_hesheng,sq_asheng # speaker:sq_hesheng # mood:sq_hesheng=neutral
  阿笙约你一起认副报上那处岔路，自己的那一栏由她出面说明，不让你白背她的名。 # beat:sq_receipt_15 # scene:sq_receipt # cast:sq_hesheng,sq_asheng # speaker:narrator
  -> last_wish

=== last_wish ===
季老的弟子给你看遗命：不归一家，十四家各抄一份，原卷封鹿门旧阁。七卷谈高层武道，有十余场亲见较艺和六位返真留下的话，不是一抄便得神功的秘籍。 # beat:sq_last_wish_1 # scene:sq_record # cast:sq_disciple # speaker:narrator
他记了这么多年，最后倒只有这三句话，谁都记得最牢。 # beat:sq_last_wish_2 # scene:sq_record # cast:sq_disciple # speaker:sq_disciple # mood:sq_disciple=uneasy
七卷的签收，我还照原单开？ # beat:sq_last_wish_3 # scene:sq_record # cast:sq_disciple # speaker:you
照开。七个卷次都列着，收到哪个，就在那一格落印。空的给我留着。 # beat:sq_last_wish_4 # scene:sq_record # cast:sq_disciple # speaker:sq_disciple # mood:sq_disciple=neutral
他把季老旧笔收在身边。你伸手接一张空签收，忽然发现纸轻得很，前一张朱名册却还压在腕上。 # beat:sq_last_wish_5 # scene:sq_record # cast:sq_disciple # speaker:narrator
* [在待核项写明所见来源，让传言与死伤名单分开。 # cid:sq_keep_unknown]
  ~ sq_sources = true
  这句“六大不许八家看”，是谁亲耳听的？ # beat:sq_last_wish_6 # scene:sq_record # cast:sq_disciple # speaker:you
  目前没有。可以收作传言，别顶到死者名字上面。 # beat:sq_last_wish_7 # scene:sq_record # cast:sq_disciple # speaker:sq_disciple # mood:sq_disciple=intent
  你留了转述人的来处。禾生和阿笙各拿到一份同样的待核页，不必先相信你站在自己那边。 # beat:sq_last_wish_8 # scene:sq_record # cast:sq_disciple # speaker:narrator
  -> four_houses
* [把街上传言整句另抄，急送先到，附上自己尚未问明的说明。 # cid:sq_copy_rumor]
  ~ sq_sources = false
  先送他们看这句话已经传到哪儿。我没核出源头，也写在开头。 # beat:sq_last_wish_9 # scene:sq_record # cast:sq_disciple # speaker:you
  那一句说明别放最后。会有人只看前两行就出门拔剑。 # beat:sq_last_wish_10 # scene:sq_record # cast:sq_disciple # speaker:sq_disciple # mood:sq_disciple=neutral
  你把说明挪到页首，多写一张给送件人。快送省下一段路，后来问来源那一趟仍欠着。 # beat:sq_last_wish_11 # scene:sq_record # cast:sq_disciple # speaker:narrator
  -> four_houses

=== four_houses ===
最先到齐的只有太玄、六合、金陵和华山。你随副报进屋记收件，不坐门主的椅。太玄闻道尘八十余岁，入化极深，先问七卷若真在华山手里，可会照遗命给十四家。 # beat:sq_four_houses_1 # scene:sq_four # cast:sq_wen,sq_gu # speaker:narrator
出事的是共同押书的人，失踪的是华山人，问一句不算过分。 # beat:sq_four_houses_2 # scene:sq_four # cast:sq_wen,sq_gu # speaker:sq_gu # mood:sq_gu=neutral
华山老人剑出半寸，顾南陵也按剑柄。屋外一声坐下，让你正预备递出的纸停在两人中间。 # beat:sq_four_houses_3 # scene:sq_four # cast:sq_wen,sq_gu # speaker:narrator
坐下。 # beat:sq_four_houses_4 # scene:sq_four # cast:sq_lu,sq_gu # speaker:sq_lu # mood:sq_lu=intent
青石驿那一剑，是不是华山剑？ # beat:sq_four_houses_5 # scene:sq_four # cast:sq_lu,sq_gu # speaker:sq_gu # mood:sq_gu=sharp
不是。 # beat:sq_four_houses_6 # scene:sq_four # cast:sq_lu,sq_gu # speaker:sq_lu # mood:sq_lu=neutral
凭什么？ # beat:sq_four_houses_7 # scene:sq_four # cast:sq_lu,sq_gu # speaker:sq_gu # mood:sq_gu=neutral
陆青崖借他的剑，叫人取来已验过伤口的兽骨。你在旁边接空匣，只看见剑形、落点似乎一样，不敢凭眼熟抢着替任何一方答。 # beat:sq_four_houses_8 # scene:sq_four # cast:sq_lu,sq_gu # speaker:narrator
{
- sq_sources:
你这页把谁亲耳、谁转述分开了。议事省了半场架。 # beat:sq_four_houses_9 # scene:sq_four # cast:sq_lu,sq_gu # speaker:sq_gu # mood:sq_gu=intent
- else:
急送的传言整句抄上，说明未核。四家到了先看说明，没人把它当已证的话传。 # beat:sq_four_houses_10 # scene:sq_four # cast:sq_lu,sq_gu # speaker:narrator
}
* [把旧痕与新试分放两侧，按陆所指处记，不自行下归属。 # cid:sq_hold_both]
  ~ sq_bone = true
  旧痕这一侧，新试那一侧。落点由谁验过，也请留名。 # beat:sq_four_houses_11 # scene:sq_four # cast:sq_lu,sq_gu # speaker:you
  再记深浅。 # beat:sq_four_houses_12 # scene:sq_four # cast:sq_lu,sq_gu # speaker:sq_lu # mood:sq_lu=intent
  你才看见两道相似的痕，不能只靠描一个轮廓给山外的人看。 # beat:sq_four_houses_13 # scene:sq_four # cast:sq_lu,sq_gu # speaker:narrator
  -> bone
* [请陆再指出多出来的位置，把自己看不懂的留作追问。 # cid:sq_ask_margin]
  ~ sq_bone = false
  晚辈看着像，您说不是，差的是哪里？ # beat:sq_four_houses_14 # scene:sq_four # cast:sq_lu,sq_gu # speaker:you
  像的地方已经够多人说。看多送的这一寸。 # beat:sq_four_houses_15 # scene:sq_four # cast:sq_lu,sq_gu # speaker:sq_lu # mood:sq_lu=neutral
  顾没拦你问。你重新放平尺，才把那处在纸上单列。 # beat:sq_four_houses_16 # scene:sq_four # cast:sq_lu,sq_gu # speaker:narrator
  -> bone

=== bone ===
形像，落点也像。青石驿那一剑多送了一寸。华山真正练过这一式的人，不会送那一寸，再送，后手便死。 # beat:sq_bone_1 # scene:sq_four # cast:sq_lu,sq_gu # speaker:sq_lu # mood:sq_lu=intent
你依尺画下深浅，两道痕的轮廓几乎重叠，末端却错开一寸。顾拿过纸，又把兽骨转向窗光，自己看了一遍。 # beat:sq_bone_2 # scene:sq_four # cast:sq_lu,sq_gu # speaker:narrator
那失踪的人，还是要找。 # beat:sq_bone_3 # scene:sq_four # cast:sq_lu,sq_gu # speaker:sq_gu # mood:sq_gu=uneasy
找。不是替谁先免了这一件。 # beat:sq_bone_4 # scene:sq_four # cast:sq_lu,sq_gu # speaker:sq_lu # mood:sq_lu=neutral
顾把剑收回，剑令没摘。屋中暂时不拔剑了，朱名册上的二十四人却仍没有少。 # beat:sq_bone_5 # scene:sq_four # cast:sq_lu,sq_gu # speaker:narrator
{
- sq_bone:
旧痕新试两栏并排的记法，这回又用上了：真迹一栏，添字一栏。季老弟子照着验，半刻就认出扉页是后加的。 # beat:sq_bone_6 # scene:sq_four # cast:sq_lu,sq_gu # speaker:narrator
- else:
你把看不懂的那处仍留作追问。黑市这一卷上，陆前辈指过的多余一寸，你在扉页纸纹上找到了同类的一处。 # beat:sq_bone_7 # scene:sq_four # cast:sq_lu,sq_gu # speaker:narrator
}
* [带共同核问的人去送试痕副报，愿多走一趟。 # cid:sq_send_with_witness]
  ~ sq_witness = true
  这份两家各看过，送时请同行。 # beat:sq_bone_8 # scene:sq_four # cast:sq_lu,sq_gu # speaker:you
  禾生把纸压进匣，阿笙在门外等你交代收件处。你们多等半刻，不用到了下一家再从头争是谁只抄了自家那半边。 # beat:sq_bone_9 # scene:sq_four # cast:sq_lu,sq_gu # speaker:narrator
  -> new_copy
* [先送急报，双方亲见者另约下一站补问，不伪造共同到场。 # cid:sq_send_urgent]
  ~ sq_witness = false
  我先走。谁亲见、谁未见，按现在写。 # beat:sq_bone_10 # scene:sq_four # cast:sq_lu,sq_gu # speaker:you
  你赶上当晚的渡。到了金陵，仍得留一日候两份核名，没人因为你走得快就能替未见者签字。 # beat:sq_bone_11 # scene:sq_four # cast:sq_lu,sq_gu # speaker:narrator
  -> new_copy

=== new_copy ===
汴梁又死了一位八卦老护法，左肋剑痕像昆仑。墙上留“七问已有主”。三日后黑市出现第一卷，季老弟子验过，内容是真，扉页却添“六大所得，八家不得”。 # beat:sq_new_copy_1 # scene:sq_copy # cast:sq_hesheng,sq_asheng # speaker:narrator
有人只把扉页抄给了我师弟。还说再不去抢，南岳连一句也剩不下。 # beat:sq_new_copy_2 # scene:sq_copy # cast:sq_hesheng,sq_asheng # speaker:sq_asheng # mood:sq_asheng=sharp
金陵街上也有这句。可卖抄本的就在金陵商号，掌门已去了。 # beat:sq_new_copy_3 # scene:sq_copy # cast:sq_hesheng,sq_asheng # speaker:sq_hesheng # mood:sq_hesheng=neutral
一本真卷，能让这句也算季老写的？ # beat:sq_new_copy_4 # scene:sq_copy # cast:sq_hesheng,sq_asheng # speaker:you
所以我带了前一份。他老人家的遗命，我还认得。 # beat:sq_new_copy_5 # scene:sq_copy # cast:sq_hesheng,sq_asheng # speaker:sq_hesheng # mood:sq_hesheng=uneasy
街口有人为抢抄本受伤。你们从人群外走，听见两家弟子已在商号门前相撞。 # beat:sq_new_copy_6 # scene:sq_copy # cast:sq_hesheng,sq_asheng # speaker:narrator
* [先把真内容与后加扉页并排给门外人看，再请他们让路。 # cid:sq_compare_front]
  ~ sq_front = true
  这句话不在季老遗命里。要问谁添的，先让我们进到卖书的人面前。 # beat:sq_new_copy_7 # scene:sq_copy # cast:sq_hesheng,sq_asheng # speaker:you
  你们有人要跟着问，就跟。别站在这里先打送纸的。 # beat:sq_new_copy_8 # scene:sq_copy # cast:sq_hesheng,sq_asheng # speaker:sq_asheng # mood:sq_asheng=intent
  一名急性弟子仍骂，手却没再推禾生。你们终于留出能过人的半边门。 # beat:sq_new_copy_9 # scene:sq_copy # cast:sq_hesheng,sq_asheng # speaker:narrator
  -> warehouse
* [先劝两边收短兵，给抬伤者的人留门，核扉页待进屋再做。 # cid:sq_clear_door]
  ~ sq_front = false
  抬人的要出来。你要问谁，等他先过去。 # beat:sq_new_copy_10 # scene:sq_copy # cast:sq_hesheng,sq_asheng # speaker:you
  让一条，不是叫你替哪家让一场胜负！ # beat:sq_new_copy_11 # scene:sq_copy # cast:sq_hesheng,sq_asheng # speaker:sq_hesheng # mood:sq_hesheng=sharp
  阿笙在另一侧把人带开。那句假扉页仍在街上，你们稍后还得把原遗命拿出来说。 # beat:sq_new_copy_12 # scene:sq_copy # cast:sq_hesheng,sq_asheng # speaker:narrator
  -> warehouse

=== warehouse ===
顾南陵不许南岳搜本门地界的商号，沈孤鸿不肯退。前五十招几乎无高低，顾剑快，沈剑沉。八十余招顾左袖破，又数招沈肩头见血。 # beat:sq_warehouse_1 # scene:sq_warehouse # cast:sq_gu,sq_shen # speaker:narrator
你要查书，先把门里的人退开。 # beat:sq_warehouse_2 # scene:sq_warehouse # cast:sq_gu,sq_shen # speaker:sq_gu # mood:sq_gu=sharp
人退了，书与证人若又没了，谁给我一句等过？ # beat:sq_warehouse_3 # scene:sq_warehouse # cast:sq_gu,sq_shen # speaker:sq_shen # mood:sq_shen=sharp
两剑越走越近。你抱着副报在仓外，看见一名抄手跌在门槛边，旁人一挤，他又要被推回去。 # beat:sq_warehouse_4 # scene:sq_warehouse # cast:sq_gu,sq_shen # speaker:narrator
{
- sq_front:
门外的人看过真内容与后加扉页的并排，让路时多问了一句：添字的是谁。 # beat:sq_warehouse_5 # scene:sq_warehouse # cast:sq_gu,sq_shen # speaker:narrator
- else:
你先劝两边收兵抬人。扉页那行字还在你袖中，进屋再核。 # beat:sq_warehouse_6 # scene:sq_warehouse # cast:sq_gu,sq_shen # speaker:narrator
}
* [从侧门接出抄手，不往两剑中间插，自己让掉近处观剑位置。 # cid:sq_take_side]
  ~ sq_saved_scribe = true
  手给我，别翻回门槛。 # beat:sq_warehouse_7 # scene:sq_warehouse # cast:sq_gu,sq_shen # speaker:you
  阿笙抵住后面的人，禾生在门外接。你退出一段，眼前只剩两柄剑的影子，不再能把每一手写成亲见。 # beat:sq_warehouse_8 # scene:sq_warehouse # cast:sq_gu,sq_shen # speaker:narrator
  -> hands
* [先叫门内人腾出退处，交给当值者接抄手，自己留在门外报来客。 # cid:sq_call_clear]
  ~ sq_saved_scribe = false
  门槛边有人。接过去，后面先别挤！ # beat:sq_warehouse_9 # scene:sq_warehouse # cast:sq_gu,sq_shen # speaker:you
  当值者答了，抄手终于被拉开。你留在能报门的位置，掌门的剑仍不是你能上去分开的两根木条。 # beat:sq_warehouse_10 # scene:sq_warehouse # cast:sq_gu,sq_shen # speaker:narrator
  -> hands

=== hands ===
一百三十余招，两人已真想分胜负。仓顶落下一人，一手搭顾的腕，一手按沈的剑脊，两道剑势同时偏开。 # beat:sq_hands_1 # scene:sq_warehouse # cast:sq_murong # speaker:narrator
仓里的人已经死了。 # beat:sq_hands_2 # scene:sq_warehouse # cast:sq_murong # speaker:sq_murong # mood:sq_murong=intent
八卦门主慕容破岳，已返真。你这才敢把门外那份试痕副报递进来，两位门主都没有再追剑。 # beat:sq_hands_3 # scene:sq_warehouse # cast:sq_murong # speaker:narrator
卖抄本的商人已死三个时辰，喉骨被掌震碎，像太玄。顾看向闻讯赶来的闻道尘。屋里没人再敢说，方才两剑若分出高低，事情便能自然问清。 # beat:sq_hands_4 # scene:sq_warehouse # cast:sq_murong # speaker:narrator
取木人。 # beat:sq_hands_5 # scene:sq_warehouse # cast:sq_wen,sq_murong # speaker:sq_wen # mood:sq_wen=neutral
闻一掌落正面，木人背后裂纹先开。他让人再看商人的喉骨。 # beat:sq_hands_6 # scene:sq_warehouse # cast:sq_wen,sq_murong # speaker:narrator
太玄这一掌，力不留骨面。这具尸体的喉骨，从外往里碎。 # beat:sq_hands_7 # scene:sq_warehouse # cast:sq_wen,sq_murong # speaker:sq_wen # mood:sq_wen=intent
和华山一样。 # beat:sq_hands_8 # scene:sq_warehouse # cast:sq_wen,sq_murong # speaker:sq_murong # mood:sq_murong=neutral
你翻到上一页。一道剑痕，一处碎骨，分别指向两家。慕容替你压住被风掀起的纸角，目光却落在尚未出声的顾脸上。 # beat:sq_hands_9 # scene:sq_warehouse # cast:sq_wen,sq_murong # speaker:narrator
* [将两次验痕一起送出，金陵和南岳各留一份过程。 # cid:sq_add_second_test]
  ~ sq_shared_tests = true
  华山的一寸和太玄的内外力，都在这里。不要只带对自家最有利的一张。 # beat:sq_hands_10 # scene:sq_warehouse # cast:sq_wen,sq_murong # speaker:you
  禾生交出商号那页。阿笙读到内外力时停住，又把闻门主叫回门边；他按着木人重指了一次，她才系袋口。 # beat:sq_hands_11 # scene:sq_warehouse # cast:sq_wen,sq_murong # speaker:narrator
  -> invitation
* [先将商号死者与时辰报清，试掌副本由亲见者随后递交。 # cid:sq_first_owner]
  ~ sq_shared_tests = false
  先让外面知道屋里早已死人。试掌这页不替闻门主删成一句无罪。 # beat:sq_hands_12 # scene:sq_warehouse # cast:sq_wen,sq_murong # speaker:you
  你请当场录事另带原件。急报先走，两次试验要到下一站才能并到一册。 # beat:sq_hands_13 # scene:sq_warehouse # cast:sq_wen,sq_murong # speaker:narrator
  -> invitation

=== invitation ===
六大在少室山外先议事，八家又起不满。六合燕横江问，出了十四家的事，六家关门商量，再告诉我们？闻道尘给少林送帖。 # beat:sq_invitation_1 # scene:sq_outer # cast:sq_wen # speaker:narrator
若只查六门之事，太玄不问。若查十四家，请十四家坐下。 # beat:sq_invitation_2 # scene:sq_outer # cast:sq_wen # speaker:sq_wen # mood:sq_wen=sharp
少林回帖很快：闻门主说得对。可会还没开，青石驿最后清醒的活口便死了。 # beat:sq_invitation_3 # scene:sq_outer # cast:sq_wen # speaker:narrator
两名重伤者，一人早已不治，季观尘弟子周北衡醒后说过：袭击者七人，六蒙面，一人没遮脸，右手少根小指。随后死在少林外院，三层守卫，近处两位入化长老；门窗无损，没有打斗声。 # beat:sq_invitation_4 # scene:sq_outer # cast:sq_wen # speaker:narrator
你拿着他原来预备签的收件单，纸上依旧空一栏。少林方丈慧寂亲自验后，只说开十四门会。 # beat:sq_invitation_5 # scene:sq_outer # cast:sq_wen # speaker:narrator
* [先把周最后所见按原话抄给共同收件人，不添自己猜的姓名。 # cid:sq_keep_last_words]
  ~ sq_last_words = true
  七人，六个蒙面，一个没遮脸，右手少小指。只有这些。 # beat:sq_invitation_6 # scene:sq_outer # cast:sq_wen # speaker:you
  那一栏你不再等他来签。季老弟子收走空单，手指停了一会，才把纸翻到背面写不及收件。 # beat:sq_invitation_7 # scene:sq_outer # cast:sq_wen # speaker:narrator
  -> chairs
* [先替来认人的弟子找落脚处，证言原件交共同录事封存。 # cid:sq_help_bereaved]
  ~ sq_last_words = false
  你今晚住哪儿？我替你问外院。原话这一份给当值人收，你回来能找到。 # beat:sq_invitation_8 # scene:sq_outer # cast:sq_wen # speaker:you
  他点头，却先问你有没有温水。你这才放下那张总想先填完的纸，去找一只干净碗。 # beat:sq_invitation_9 # scene:sq_outer # cast:sq_wen # speaker:narrator
  -> chairs

=== chairs ===
嵩阳旧院，十四张椅子围一圈，没设上座。你们搬到第十四张，禾生还在看四条腿，怕一位门主坐下就矮人半头。 # beat:sq_chairs_1 # scene:sq_chairs # cast:sq_hesheng,sq_asheng # speaker:narrator
你若再量一回，我就坐这里，先问问你这算第十五家还是木匠家。 # beat:sq_chairs_2 # scene:sq_chairs # cast:sq_hesheng,sq_asheng # speaker:sq_asheng # mood:sq_asheng=amused
你坐我便敢量。等掌门来了，你又不替我挨问。 # beat:sq_chairs_3 # scene:sq_chairs # cast:sq_hesheng,sq_asheng # speaker:sq_hesheng # mood:sq_hesheng=sharp
别量地。方才最后一张脚下垫的，是谁的未收副报？ # beat:sq_chairs_4 # scene:sq_chairs # cast:sq_hesheng,sq_asheng # speaker:you
两人一起低头，阿笙先笑，禾生把那张纸抽出来重新抄，没把自己弄湿的事算在哪家门主头上。 # beat:sq_chairs_5 # scene:sq_chairs # cast:sq_hesheng,sq_asheng # speaker:narrator
六大六位皆到：慧寂、张玄初、司马归元、慕容破岳、公孙照雪、陆青崖，六人皆返真。八家当家八位也来，妙澄与罗承岳已返真；其余几位仍在门外，不把山中退隐旧人混进这一代的数。 # beat:sq_chairs_6 # scene:sq_chairs # cast:sq_hesheng,sq_asheng # speaker:narrator
八家名帖依次收齐：六合燕横江、峨眉妙澄、青城许问岑、金陵顾南陵、南岳沈孤鸿、河东裴照庭、太玄闻道尘、天海宗罗承岳。你把天海那张另辨一次，不与海天门混写。 # beat:sq_chairs_7 # scene:sq_chairs # cast:sq_hesheng,sq_asheng # speaker:narrator
{
- sq_saved_scribe:
仓门口先捞人的是你。搬椅子这等粗活，禾生倒不敢再嫌你笨手。 # beat:sq_chairs_8 # scene:sq_chairs # cast:sq_hesheng,sq_asheng # speaker:sq_asheng # mood:sq_asheng=amused
- else:
禾生把椅子腿又扶正了一次。他记得门槛边那一下是谁喊的人接。 # beat:sq_chairs_9 # scene:sq_chairs # cast:sq_hesheng,sq_asheng # speaker:narrator
}
* [按共同收件的约定，去金陵一侧接问件，不擅坐空椅。 # cid:sq_sit_by_jinling]
  ~ sq_seat_side = 1
  顾把你送过的那页放到手边，没让你因为帮过忙就替他对全院讲话。禾生压低声音问，你的纸角这回还湿不湿。 # beat:sq_chairs_10 # scene:sq_chairs # cast:sq_hesheng,sq_asheng # speaker:narrator
  你先把量椅子的尺收起来。 # beat:sq_chairs_11 # scene:sq_chairs # cast:sq_hesheng,sq_asheng # speaker:you
  -> first_argument
* [去南岳一侧接问件，请阿笙把待核项带到同一桌。 # cid:sq_sit_by_nanyue]
  ~ sq_seat_side = 2
  沈指了一处门边给你放纸。阿笙已经把外路来报压好，还替你留了能把湿鞋换下的半张席。 # beat:sq_chairs_12 # scene:sq_chairs # cast:sq_hesheng,sq_asheng # speaker:narrator
  这不算上座，借你坐一会儿。上座还得自己去搬。 # beat:sq_chairs_13 # scene:sq_chairs # cast:sq_hesheng,sq_asheng # speaker:sq_asheng # mood:sq_asheng=amused
  -> first_argument

=== first_argument ===
季老遗命，十四家各一份。没有可争。 # beat:sq_first_argument_1 # scene:sq_chairs # cast:sq_yan,sq_sima # speaker:sq_yan # mood:sq_yan=neutral
七问不是普通拳谱。有些话对写它的人是对的，对别人未必。 # beat:sq_first_argument_2 # scene:sq_chairs # cast:sq_yan,sq_sima # speaker:sq_sima # mood:sq_sima=intent
张玄初说，顶层心得危险的不只是错，还可能是对，却只对那个人。妙澄亲口承认，入化后曾照祖师一份返真笔记闭关三年，险些把自己练废。 # beat:sq_first_argument_3 # scene:sq_chairs # cast:sq_yan,sq_sima # speaker:narrator
你原来想问有没有人不肯给八家看，此刻却听见已经返真的八家当家人，讲自己的旧险。她没拿自己如今已成，替那三年说成必经捷径。 # beat:sq_first_argument_4 # scene:sq_chairs # cast:sq_yan,sq_sima # speaker:narrator
危险归危险。为什么判断谁能看的人，总是六大？ # beat:sq_first_argument_5 # scene:sq_chairs # cast:sq_gu,sq_hui # speaker:sq_gu # mood:sq_gu=sharp
他点六大六位，再看八家：这一代已算盛，当家八人也只有两位返真。哪一场谁更强，不能解释几十年、一百年以后谁的传承总能接上。 # beat:sq_first_argument_6 # scene:sq_chairs # cast:sq_gu,sq_hui # speaker:narrator
返真若靠一卷书，天下早有几百返真了。真正拉开差距的，是高人死前，有没有第二个人接住他的东西。 # beat:sq_first_argument_7 # scene:sq_chairs # cast:sq_gu,sq_hui # speaker:sq_hui # mood:sq_hui=neutral
闻道尘许久不语。太玄出过宁无极，他比年轻的你更知道，没有下一人接住是什么重量。 # beat:sq_first_argument_8 # scene:sq_chairs # cast:sq_gu,sq_hui # speaker:narrator
{
- sq_last_words:
那句六个蒙面、一个露脸、右手少小指，各桌都在对。谁先对上人，谁先开口。 # beat:sq_first_argument_9 # scene:sq_chairs # cast:sq_yan,sq_gu,sq_hui # speaker:sq_yan # mood:sq_yan=intent
- else:
证言原件在共同录事处封着。有几桌想借抄对线索，放出去的只是副本。 # beat:sq_first_argument_10 # scene:sq_chairs # cast:sq_yan,sq_gu,sq_hui # speaker:narrator
}
* [把入化前门人的问题递入问件：不能照练，那能先知道哪些风险？ # cid:sq_ask_access]
  ~ sq_access_question = true
  不把我当走到了那个位置的人。但若只告诉我不能看，我下回见到假扉页，仍不知道哪句在骗人。 # beat:sq_first_argument_11 # scene:sq_chairs # cast:sq_yan,sq_gu,sq_hui # speaker:you
  慧寂将问件递给录事。顾盯着它放到哪一叠，直到录事在末尾添上待议，才靠回椅背。 # beat:sq_first_argument_12 # scene:sq_chairs # cast:sq_yan,sq_gu,sq_hui # speaker:narrator
  -> ninety_six
* [问传承怎样交到第二人手里，愿先记真正授课的步骤。 # cid:sq_ask_receiver]
  ~ sq_access_question = false
  如果师父记得清，弟子接不住，留下全本也还是会断么？ # beat:sq_first_argument_13 # scene:sq_chairs # cast:sq_yan,sq_gu,sq_hui # speaker:you
  会。所以教的人要在，学的人也得真走。抄录能留下问路的地方，不能替他走。 # beat:sq_first_argument_14 # scene:sq_chairs # cast:sq_yan,sq_gu,sq_hui # speaker:sq_hui # mood:sq_hui=intent
  你翻回原单，原来只写交到哪家，旁边又添一格问由谁带读。 # beat:sq_first_argument_15 # scene:sq_chairs # cast:sq_yan,sq_gu,sq_hui # speaker:narrator
  -> ninety_six

=== ninety_six ===
顾和燕却又争起眼前第一卷。燕要先封抄本再查幕后，顾说越封越像独占，应先公开已确认的一卷压谣。燕提起第一卷正从金陵流出，顾站起。 # beat:sq_ninety_six_1 # scene:sq_chairs # cast:sq_gu,sq_yan # speaker:narrator
两指作剑点眉心，燕横掌开，第二手已逼肋下。二十、四十、六十招，谁也没先收。第七十余招顾划燕袖，数招后又被逼退三步。 # beat:sq_ninety_six_2 # scene:sq_chairs # cast:sq_gu,sq_yan # speaker:narrator
纸退后！ # beat:sq_ninety_six_3 # scene:sq_chairs # cast:sq_hesheng,sq_gu,sq_yan # speaker:sq_hesheng # mood:sq_hesheng=surprised
你把问件交出，自己让到门侧。第九十六招，一柄剑横进两人之间：顾再进先撞剑，燕再掌腕落剑脊。陆青崖已经在那里。 # beat:sq_ninety_six_4 # scene:sq_chairs # cast:sq_hesheng,sq_gu,sq_yan # speaker:narrator
若我们不收？ # beat:sq_ninety_six_5 # scene:sq_chairs # cast:sq_lu,sq_gu,sq_yan # speaker:sq_gu # mood:sq_gu=sharp
那我陪。 # beat:sq_ninety_six_6 # scene:sq_chairs # cast:sq_lu,sq_gu,sq_yan # speaker:sq_lu # mood:sq_lu=neutral
两人收了。你没把这一剑写成两人自行决定平手，门外极深和返真之间的距离，是刚才真站到两人手腕前的那一下。 # beat:sq_ninety_six_7 # scene:sq_chairs # cast:sq_lu,sq_gu,sq_yan # speaker:narrator
* [把散开的问件收齐，仍按原题交回，不用止斗一剑替代答复。 # cid:sq_return_questions]
  ~ sq_kept_questions = true
  这张问的是怎么借，不是刚才谁赢。方才没答的，还请留下。 # beat:sq_ninety_six_8 # scene:sq_chairs # cast:sq_lu,sq_gu,sq_yan # speaker:you
  我同你收。我的那张差点被你踩到，这回算我没说清放哪儿。 # beat:sq_ninety_six_9 # scene:sq_chairs # cast:sq_hesheng,sq_lu,sq_gu # speaker:sq_hesheng # mood:sq_hesheng=intent
  你们把椅子放回圆里，争论也没有被偷偷搬到桌下。 # beat:sq_ninety_six_10 # scene:sq_chairs # cast:sq_hesheng,sq_lu,sq_gu # speaker:narrator
  -> night_tables
* [先问近门弟子有没有被退剑碰到，议问交阿笙收，再回来核。 # cid:sq_check_injured]
  ~ sq_kept_questions = false
  阿笙，问件放门边那只匣。我去看他的手，一会儿回来点数。 # beat:sq_ninety_six_11 # scene:sq_chairs # cast:sq_hesheng,sq_lu,sq_gu # speaker:you
  去。这回椅子脚下我也看一眼，省得你回来还得找那一张。 # beat:sq_ninety_six_12 # scene:sq_chairs # cast:sq_asheng,sq_hesheng,sq_lu # speaker:sq_asheng # mood:sq_asheng=neutral
  年轻人手背擦破，包好便伸头听里面说话。你让他先把袖口挽住，省得血把刚缠的布又浸开。 # beat:sq_ninety_six_13 # scene:sq_chairs # cast:sq_asheng,sq_hesheng,sq_lu # speaker:narrator
  -> night_tables

=== night_tables ===
白日十四人围一圈，晚上分成许多小桌。你送问件时，才听见六大内部也不是一句话。 # beat:sq_night_tables_1 # scene:sq_night # cast:sq_sima,sq_lu # speaker:narrator
找回七问，照遗命抄给十四家。 # beat:sq_night_tables_2 # scene:sq_night # cast:sq_sima,sq_lu # speaker:sq_sima # mood:sq_sima=neutral
少林赞成，武当赞成却要给高卷附不能照练的说明；公孙照雪担心十四份一年以后变一百四十份。陆青崖听完，先放下杯。 # beat:sq_night_tables_3 # scene:sq_night # cast:sq_sima,sq_lu # speaker:narrator
真靠抄书就能追上华山，那华山也该下去了。 # beat:sq_night_tables_4 # scene:sq_night # cast:sq_sima,sq_lu # speaker:sq_lu # mood:sq_lu=intent
旁边的年轻弟子笑了一声，见本门老人没笑，又把嘴闭上。陆也没等一桌人附和才喝下一口茶。 # beat:sq_night_tables_5 # scene:sq_night # cast:sq_sima,sq_lu # speaker:narrator
* [先把年轻门人所问的风险说明递给主张附注的人，自己候一个可带走的答复。 # cid:sq_deliver_risk]
  ~ sq_notes = true
  这是白日递过的问件。附注若有，给送到外面的前两卷也留一份。 # beat:sq_night_tables_6 # scene:sq_night # cast:sq_sima,sq_lu # speaker:you
  明早来取。我得先问张掌门要那几条，他的字你若认不出，拿来找我。 # beat:sq_night_tables_7 # scene:sq_night # cast:sq_sima,sq_lu # speaker:sq_sima # mood:sq_sima=intent
  你坐下等，错过最后一碗热汤。禾生给你留了半块饼，抱怨汤倒得比你的字还快。 # beat:sq_night_tables_8 # scene:sq_night # cast:sq_sima,sq_lu # speaker:narrator
  -> ash
* [先追问假扉页怎样附在真卷上，把两家核过的来源表送去，夜里再补风险问件。 # cid:sq_deliver_sources]
  ~ sq_notes = false
  这份真抄本附过假话。将来有新扉页，得让收的人能问到谁写。 # beat:sq_night_tables_9 # scene:sq_night # cast:sq_sima,sq_lu # speaker:you
  把原来的留着，比后来一句“皆误”有用。 # beat:sq_night_tables_10 # scene:sq_night # cast:sq_sima,sq_lu # speaker:sq_lu # mood:sq_lu=neutral
  你添了后抄人的来处，回来时灯油已换过一回。阿笙说你若再走一趟，她那双鞋得先替你歇。 # beat:sq_night_tables_11 # scene:sq_night # cast:sq_sima,sq_lu # speaker:narrator
  -> ash

=== ash ===
八家几桌也在争。闻与妙澄认为六大不是凶手，顾还有保留，河东裴照庭却一直问同一件事。 # beat:sq_ash_1 # scene:sq_ash # cast:sq_wen,sq_pei # speaker:narrator
谁能在少林两位入化长老眼皮底下杀周北衡？ # beat:sq_ash_2 # scene:sq_ash # cast:sq_wen,sq_pei # speaker:sq_pei # mood:sq_pei=intent
周房中窗台下一点青灰，起先当香灰收着。妙澄认出盐水长期浸过的船木烧灰；中原大量用这种木的地方，指向伏牛东南废旧河道。同光会的旧名终于进了案卷。 # beat:sq_ash_3 # scene:sq_ash # cast:sq_wen,sq_pei # speaker:narrator
萧天策。 # beat:sq_ash_4 # scene:sq_ash # cast:sq_wen,sq_pei # speaker:sq_wen # mood:sq_wen=uneasy
他早年旧总谱十三，没有返真，最擅布局、借势、拆盟。年轻时因出身被拒，晚年收逐徒、遗徒和困在入化的人。他右手少根小指。 # beat:sq_ash_5 # scene:sq_ash # cast:sq_wen,sq_pei # speaker:narrator
那少林外院，也是他？ # beat:sq_ash_6 # scene:sq_ash # cast:sq_wen,sq_pei # speaker:you
那一条不能因为少根手指，就都接到他身上。 # beat:sq_ash_7 # scene:sq_ash # cast:sq_wen,sq_pei # speaker:sq_pei # mood:sq_pei=neutral
青城许问岑又提出闻人宿：旧总谱第八，失踪四十余年，老师最后见他，只说快进去了。若仍活，如今极可能已返真。一个负责局，一个负责杀，学各家外形的人再留下最显眼的假痕。 # beat:sq_ash_8 # scene:sq_ash # cast:sq_wen,sq_pei # speaker:narrator
* [分别抄明萧与闻人的线索，不把两人履历并成一个无所不能的凶手。 # cid:sq_link_without_merge]
  ~ sq_two_names = true
  萧的右手，是活口亲见。闻人的下落，是前辈旧见和如今推断。两条都留。 # beat:sq_ash_9 # scene:sq_ash # cast:sq_wen,sq_pei # speaker:you
  如此才好继续问。二十七个人，不是认出一个名字就能全部结案。 # beat:sq_ash_10 # scene:sq_ash # cast:sq_wen,sq_pei # speaker:sq_wen # mood:sq_wen=intent
  录事用两层纸包灰样，你替他托底。他仍不放心，追着又塞给你一只小木匣。 # beat:sq_ash_11 # scene:sq_ash # cast:sq_wen,sq_pei # speaker:narrator
  -> joint_routes
* [把旧河道的运输疑问递给查路队，人物证词保留原状另交。 # cid:sq_check_shipping]
  ~ sq_two_names = false
  多年同光会若在这里，木从哪里进、人从哪里出？这张旧图够不够用？ # beat:sq_ash_12 # scene:sq_ash # cast:sq_wen,sq_pei # speaker:you
  带到路上问。不先替没走过的地方画一条如今仍能过船的河。 # beat:sq_ash_13 # scene:sq_ash # cast:sq_wen,sq_pei # speaker:sq_pei # mood:sq_pei=intent
  你去借当地水路簿。人物两条证词还在原页，没让一个运输疑问替代所有查凶。 # beat:sq_ash_14 # scene:sq_ash # cast:sq_wen,sq_pei # speaker:narrator
  -> joint_routes

=== joint_routes ===
十四家终于合查，三路都故意混编六大与八家。慧寂要随闻、燕、许问岑查伏牛旧河，另有急报与核录的人留嵩阳接返程。 # beat:sq_joint_routes_1 # scene:sq_depart # cast:sq_hui,sq_hesheng,sq_asheng # speaker:narrator
若查案还分六和八，萧天策已经赢了一半。 # beat:sq_joint_routes_2 # scene:sq_depart # cast:sq_hui,sq_hesheng,sq_asheng # speaker:sq_hui # mood:sq_hui=neutral
出发前还有半日，你能把一路的准备做熟。两份差事，一份问旧水道与溪沟，一份核旧院回报的收转人，不是再拿一张漂亮地图便都算自己走过。 # beat:sq_joint_routes_3 # scene:sq_depart # cast:sq_hui,sq_hesheng,sq_asheng # speaker:narrator
* [去问真走过旧河的人，标能撤过的溪沟，院中转报请同门接。 # cid:sq_walk_water]
  ~ sq_water_ready = true
  我要问断流以后走哪儿。旧图照抄的，先别跟我说河上能过船。 # beat:sq_joint_routes_4 # scene:sq_depart # cast:sq_hui,sq_hesheng,sq_asheng # speaker:you
  我带你找一个人。他只走过半段，你别一问就是整座伏牛山。 # beat:sq_joint_routes_5 # scene:sq_depart # cast:sq_hui,sq_hesheng,sq_asheng # speaker:sq_asheng # mood:sq_asheng=intent
  你们绕回溪沟认过落脚处，少抄了半日信。旧院转报的班次由值房安排，若留下，仍得自己补问。 # beat:sq_joint_routes_6 # scene:sq_depart # cast:sq_hui,sq_hesheng,sq_asheng # speaker:narrator
  -> choose_route
* [先把旧院每班收转人和后门应声点认熟，水道只带待核旧图。 # cid:sq_set_relay]
  ~ sq_water_ready = false
  谁收、谁再送？火急时不先等同一个人回来，我想同两班都过一遍。 # beat:sq_joint_routes_7 # scene:sq_depart # cast:sq_hui,sq_hesheng,sq_asheng # speaker:you
  先去后门。上回人喊在这里，抬箱子的却绕到前院，隔了两堵墙谁也没听见。 # beat:sq_joint_routes_8 # scene:sq_depart # cast:sq_hui,sq_hesheng,sq_asheng # speaker:sq_hesheng # mood:sq_hesheng=intent
  你们走过应声点，给另一班留同样的去处。伏牛旧图仍未核新水，若随队出去，得承认自己没去看。 # beat:sq_joint_routes_9 # scene:sq_depart # cast:sq_hui,sq_hesheng,sq_asheng # speaker:narrator
  -> choose_route

=== choose_route ===
路要真分了。前面同你核过副报的人在门边等，愿接你的下一程；另一人仍有本门任务，不可能两边都陪。 # beat:sq_choose_route_1 # scene:sq_depart # cast:sq_hesheng,sq_asheng # speaker:narrator
禾生要把假扉页怎样混入真本写到抄手能辨，阿笙想让混编以后谁接谁的话不再靠喊掌门名。两人要的，不只是这一次跟你站在一起。 # beat:sq_choose_route_2 # scene:sq_depart # cast:sq_hesheng,sq_asheng # speaker:narrator
{
- sq_partner == 1:
你先同我把那两份核过，后面我跟你接。不是金陵派我来看你抄错字。 # beat:sq_choose_route_3 # scene:sq_depart # cast:sq_hesheng,sq_asheng # speaker:sq_hesheng # mood:sq_hesheng=intent
那也得等我错了能说。 # beat:sq_choose_route_4 # scene:sq_depart # cast:sq_hesheng,sq_asheng # speaker:you
这个我不等掌门发话。 # beat:sq_choose_route_5 # scene:sq_depart # cast:sq_hesheng,sq_asheng # speaker:sq_hesheng # mood:sq_hesheng=amused
- else:
跟你走。只是先说好，路上走到哪儿歇，我来定。你上回眼里只有下一站。 # beat:sq_choose_route_6 # scene:sq_depart # cast:sq_hesheng,sq_asheng # speaker:sq_asheng # mood:sq_asheng=intent
要误了你的班，我自己找人补。 # beat:sq_choose_route_7 # scene:sq_depart # cast:sq_hesheng,sq_asheng # speaker:you
先记下。这句我学会写了。 # beat:sq_choose_route_8 # scene:sq_depart # cast:sq_hesheng,sq_asheng # speaker:sq_asheng # mood:sq_asheng=amused
}
* [随混编队赴伏牛，担撤路和返程传讯，嵩阳由留守者接。 # cid:sq_follow_valley]
  ~ sq_route = 1
  我随队。旧院来的报回到哪一班，走前交清。 # beat:sq_choose_route_9 # scene:sq_depart # cast:sq_hesheng,sq_asheng # speaker:you
  你把留守一份递到值房，背袋里不再装本来该留给院中人的全部副本。 # beat:sq_choose_route_10 # scene:sq_depart # cast:sq_hesheng,sq_asheng # speaker:narrator
  -> route_gate
* [留嵩阳守证、接回流急报，伏牛的所见等亲历者回来讲。 # cid:sq_hold_courtyard]
  ~ sq_route = 2
  我留。出路那份送走，我不在院中替没到过的山谷记亲见。 # beat:sq_choose_route_11 # scene:sq_depart # cast:sq_hesheng,sq_asheng # speaker:you
  你把回程收转簿放到门边。有人嫌留着无事，你还不知道这一夜会有多少人找这张桌。 # beat:sq_choose_route_12 # scene:sq_depart # cast:sq_hesheng,sq_asheng # speaker:narrator
  -> route_gate

=== route_gate ===
各路离院。杯子还未收净，圆里的椅子空出许多。你接下的不是谁赢的预告，是出了事时别人真能找到的一个位置。 # beat:sq_route_gate_1 # scene:sq_depart # cast:none # speaker:narrator
{
- sq_route == 1:
-> valley_map
- else:
-> quiet_court
}

=== valley_map ===
伏牛第三日，许问岑停在旧河边。五十年前这里已经断流，一处经营几十年的组织，不可能还靠这条河运人。 # beat:sq_valley_map_1 # scene:sq_valley # cast:sq_xu,sq_wen,sq_yan # speaker:narrator
这图上那条船路，太整了。 # beat:sq_valley_map_2 # scene:sq_valley # cast:sq_xu,sq_wen,sq_yan # speaker:sq_xu # mood:sq_xu=intent
地图是给我们看的。 # beat:sq_valley_map_3 # scene:sq_valley # cast:sq_xu,sq_wen,sq_yan # speaker:sq_wen # mood:sq_wen=sharp
两边山坡同时起火，油桶、滚石、封路一起下来。你还没想完往哪里退，慧寂已震倒一株大树，横过溪沟。 # beat:sq_valley_map_4 # scene:sq_valley # cast:sq_xu,sq_wen,sq_yan # speaker:narrator
返真也不是神。山塌下来一样会死。慧寂不追坡上人，先把弟子送过沟。 # beat:sq_valley_map_5 # scene:sq_valley # cast:sq_xu,sq_wen,sq_yan # speaker:narrator
* [先把离树最近的伤者交过去，自己留低处接下一人。 # cid:sq_pass_first]
  ~ sq_valley_call = 1
  那边先接腿，别只拉胳膊！后面的等他脚过树。 # beat:sq_valley_map_6 # scene:sq_valley # cast:sq_xu,sq_wen,sq_yan # speaker:you
  你跪在树根一侧，泥从袖里灌进来。山上有人大喊看见凶手，你没回头，手里这人还没踩到树。 # beat:sq_valley_map_7 # scene:sq_valley # cast:sq_xu,sq_wen,sq_yan # speaker:narrator
  -> tree
* [去对岸喊清接应与空位，不把一群人全挤到树中段。 # cid:sq_count_other_bank]
  ~ sq_valley_call = 2
  过去的人往右散，树脚留一个能接的！ # beat:sq_valley_map_8 # scene:sq_valley # cast:sq_xu,sq_wen,sq_yan # speaker:you
  你自己先过到另一头，接到的人仍要再交一手。背后传来掌碰声，你只能听，不能把对岸没见的一招招写出来。 # beat:sq_valley_map_9 # scene:sq_valley # cast:sq_xu,sq_wen,sq_yan # speaker:narrator
  -> tree

=== tree ===
燕横江和闻道尘合挡一块滚石，碎土砸落肩上。两日前还在席上争封卷的人，此刻一人托底，一人推开石沿。 # beat:sq_tree_1 # scene:sq_valley # cast:sq_yan,sq_wen # speaker:narrator
这一掌还行。 # beat:sq_tree_2 # scene:sq_valley # cast:sq_yan,sq_wen # speaker:sq_yan # mood:sq_yan=amused
闭嘴。 # beat:sq_tree_3 # scene:sq_valley # cast:sq_yan,sq_wen # speaker:sq_wen # mood:sq_wen=sharp
你原想应一句，张口先吃一嘴灰。沟另一边有人叫你，前面认过的路径或只照图抄过的路径，现在都得拿脚走。 # beat:sq_tree_4 # scene:sq_valley # cast:sq_yan,sq_wen # speaker:narrator
{
- sq_water_ready:
你知道溪沟下游那截能落脚，先叫年轻门人往那里送伤者。轮到末尾一人时，前面已腾出地方，他踩实了，没从湿树侧面滑下。 # beat:sq_tree_5 # scene:sq_valley # cast:sq_yan,sq_wen # speaker:narrator
再一手，树根这边。我在。 # beat:sq_tree_6 # scene:sq_valley # cast:sq_yan,sq_wen # speaker:you
那人过沟后自己站着，回头还能替别人接包。先前绕水道的半日，如今留下一个实在能站的人。 # beat:sq_tree_7 # scene:sq_valley # cast:sq_yan,sq_wen # speaker:narrator
- else:
你带的旧图仍画着早已断流的河。最先下沟的人绕错一段，回头挤到湿树中间，一名年轻门人滑落，腿撞在石棱。 # beat:sq_tree_8 # scene:sq_valley # cast:sq_yan,sq_wen # speaker:narrator
先别站！这边接衣带，别再往腿上压。 # beat:sq_tree_9 # scene:sq_valley # cast:sq_yan,sq_wen # speaker:you
你与同伴把他拖回树根，活着送过去。随后三个月他不能随队走远，替你们留下核卷的班，行路的钱和代差也得另算。 # beat:sq_tree_10 # scene:sq_valley # cast:sq_yan,sq_wen # speaker:narrator
}
{
- sq_partner == 1:
你接上面！我压这头。哎，笔先拿走，硌进肋骨了！ # beat:sq_tree_11 # scene:sq_valley # cast:sq_hesheng # speaker:sq_hesheng # mood:sq_hesheng=intent
他伏在树根压住晃动的那端，手指都是泥，仍没松。 # beat:sq_tree_12 # scene:sq_valley # cast:sq_hesheng # speaker:narrator
- else:
那边我喊过了，回来还有两个人。你只接手里这个，另一个我叫人去。 # beat:sq_tree_13 # scene:sq_valley # cast:sq_asheng # speaker:sq_asheng # mood:sq_asheng=intent
她用喊班次的嗓子喊了三遍，直到另一头应声，才扶下一人上树。 # beat:sq_tree_14 # scene:sq_valley # cast:sq_asheng # speaker:narrator
}
* [守住已认的接应点，放过近处观高手的机会。 # cid:sq_stay_receiving]
  ~ sq_stayed_tree = true
  人没过完，这里不空。 # beat:sq_tree_15 # scene:sq_valley # cast:none # speaker:you
  前面一声掌响，那名弟子猛地伏住。你够住他的腕，等他重新探出一只脚，才一点点往岸边带。 # beat:sq_tree_16 # scene:sq_valley # cast:none # speaker:narrator
  -> outsider
* [将接应交给答应接班的门人，再到后方看退路是否仍通。 # cid:sq_handover_tree]
  ~ sq_stayed_tree = false
  这只手交你。你应了我再走。 # beat:sq_tree_17 # scene:sq_valley # cast:none # speaker:you
  对面接班人喊了自己的名，你才撤到高半步处。那里看得见谷口，仍看不清门主每次换腕。 # beat:sq_tree_18 # scene:sq_valley # cast:none # speaker:narrator
  -> outsider

=== outsider ===
灰袍、空手的闻人宿出现在火前，已一百多岁。燕先上，第一掌便退三步，许问岑随即加入。 # beat:sq_outsider_1 # scene:sq_valley # cast:sq_wenren,sq_yan,sq_xu # speaker:narrator
你从撤路一侧望见，四十余招许肩中掌，几招后燕腕被扣住。闻人若愿，那一扣已经能断手。闻道尘第三个上，三人围一人，六十余招仍没真正扳回。 # beat:sq_outsider_2 # scene:sq_valley # cast:sq_wenren,sq_yan,sq_xu # speaker:narrator
闻道尘看着自己一直以为只差的一点，那一点竟大到三个人都填不平。你不再拿平时同门切磋多赢两手，去猜这三位该怎样替你填上它。 # beat:sq_outsider_3 # scene:sq_valley # cast:sq_wenren,sq_yan,sq_xu # speaker:narrator
* [先确认最后一班已过沟，再向后方报空，不催慧寂为抢胜离开弟子。 # cid:sq_last_bank]
  这边最后两个，正过！ # beat:sq_outsider_4 # scene:sq_valley # cast:sq_wenren,sq_yan,sq_xu # speaker:you
  慧寂仍等。你喊到两人真落地，才把空的那一班报出去；没有把差不多也算他们已经活着过去。 # beat:sq_outsider_5 # scene:sq_valley # cast:sq_wenren,sq_yan,sq_xu # speaker:narrator
  -> hui_turn
* [拦下想回去观战的年轻人，给他一份带伤者离火的实际活。 # cid:sq_block_return]
  你能跑，先带他们离沟。那一掌不是站近了就能学到的。 # beat:sq_outsider_6 # scene:sq_valley # cast:sq_wenren,sq_yan,sq_xu # speaker:you
  他看了谷口一眼，接过伤者包袱，陪着慢走。他跑出两步又折回，把自己落下的包袱也扛上；这次没再往谷口看。 # beat:sq_outsider_7 # scene:sq_valley # cast:sq_wenren,sq_yan,sq_xu # speaker:narrator
  -> hui_turn

=== hui_turn ===
年轻弟子全部过沟，慧寂才转身。一掌，闻人宿第一次真正退了一步。 # beat:sq_hui_turn_1 # scene:sq_valley # cast:sq_hui,sq_wenren # speaker:narrator
十招、二十、三十，两位返真交手不再每招都争。你只能认到掌落处和人退开的地方，听见闻道尘说，这一回竟能看懂一点。 # beat:sq_hui_turn_2 # scene:sq_valley # cast:sq_hui,sq_wenren # speaker:narrator
五十余招慧寂逼裂灰袖，六十余招闻人指尖点肩，慧寂一掌同时落在他肋下。闻人吐血，没再强打。 # beat:sq_hui_turn_3 # scene:sq_valley # cast:sq_hui,sq_wenren # speaker:narrator
少林这一代不差。 # beat:sq_hui_turn_4 # scene:sq_valley # cast:sq_hui,sq_wenren # speaker:sq_wenren # mood:sq_wenren=intent
你也没有退太多。 # beat:sq_hui_turn_5 # scene:sq_valley # cast:sq_hui,sq_wenren # speaker:sq_hui # mood:sq_hui=neutral
闻人转身入火，燕要追。慧寂说他要我们追。片刻，前方山壁崩落，碎石把刚才那条路盖住。 # beat:sq_hui_turn_6 # scene:sq_valley # cast:sq_hui,sq_wenren # speaker:narrator
{
- sq_valley_call == 1:
慧寂转身前，你守的接应口已把最后一批人送过沟。他对闻人宿那一掌退开的半步，你在口上看得分明。 # beat:sq_hui_turn_7 # scene:sq_valley # cast:sq_hui,sq_wenren # speaker:narrator
- else:
对岸的空位你早喊清。慧寂转身时，树脚仍有一个人站在能接的位置上。 # beat:sq_hui_turn_8 # scene:sq_valley # cast:sq_hui,sq_wenren # speaker:narrator
}
* [先带伤者离开余火，假本与地图留给有余手的人收。 # cid:sq_take_wounded]
  ~ sq_valley_after = 1
  人先到外口。那一箱有人核，别让伤的人还背它。 # beat:sq_hui_turn_9 # scene:sq_valley # cast:sq_hui,sq_wenren # speaker:you
  同行录事把箱带接过去，另一班已往外找路。你只接近处这一段，没因危局已过便让走慢的人自己跟。 # beat:sq_hui_turn_10 # scene:sq_valley # cast:sq_hui,sq_wenren # speaker:narrator
  -> false_base
* [帮录事封存假本与新地图，伤者交给已答应接的人再走。 # cid:sq_register_false]
  ~ sq_valley_after = 2
  这份图上是哪里？先别跟前一张并着摺。 # beat:sq_hui_turn_11 # scene:sq_valley # cast:sq_hui,sq_wenren # speaker:you
  同伴答应接人，你才蹲下看图。纸上画的不是更深山寨，是离开不久的嵩阳旧院。 # beat:sq_hui_turn_12 # scene:sq_valley # cast:sq_hui,sq_wenren # speaker:narrator
  -> false_base

=== false_base ===
旧河里只有死士、假本和一张嵩阳图，不是同光会总坛。你们终于知道，萧没有只往深山逃，他要回旧院。 # beat:sq_false_base_1 # scene:sq_return # cast:sq_wen # speaker:narrator
回去！ # beat:sq_false_base_2 # scene:sq_return # cast:sq_wen # speaker:sq_wen # mood:sq_wen=sharp
互疑、分兵、再取原卷证词与各家秘函。前两层逼你们走到此处，第三层却在身后。你带的返程收件名，这一刻真有人要用。 # beat:sq_false_base_3 # scene:sq_return # cast:sq_wen # speaker:narrator
{
- sq_partner == 1:
禾生同你认过原件，先把需要核的纸交共同录事，自己背急报走。你不用再隔着一名陌生传令者证明他不是替金陵改话。 # beat:sq_false_base_4 # scene:sq_return # cast:sq_wen # speaker:narrator
- else:
阿笙同你认过外路副报，知道你所说的那处接应点。她分一人回院，一人往外截急队，没有让所有人都跟着同一声回去跑。 # beat:sq_false_base_5 # scene:sq_return # cast:sq_wen # speaker:narrator
}
{
- sq_stayed_tree:
从树脚撤下来的人里，没有一个是没人接就自己趟水的。你守的那一段交班时，一只手都没少。 # beat:sq_false_base_6 # scene:sq_return # cast:sq_wen # speaker:narrator
- else:
你回头看退路时，接应已交给应了声的门人。方才走空的树脚，此刻也有别人站着。 # beat:sq_false_base_7 # scene:sq_return # cast:sq_wen # speaker:narrator
}
{
- sq_valley_after == 1:
你在谷里先带出来的伤者已到外口自己的铺上。抬架空出来的速度，比谁预想的都快。 # beat:sq_false_base_8 # scene:sq_return # cast:sq_wen # speaker:narrator
- else:
封存的假本与新图在东门内当值处。有录事来对图，你指了那句先别并摺。 # beat:sq_false_base_9 # scene:sq_return # cast:sq_wen # speaker:narrator
}
* [返程只报亲见的谷中撤退与地图，院中情况等留守人核，不造自己赶回时辰。 # cid:sq_report_seen_valley]
  谷中弟子已撤，假图所指嵩阳。院里现在怎样，我不知道。 # beat:sq_false_base_10 # scene:sq_return # cast:sq_wen # speaker:you
  急报先走，你随慢队回。途中才收到十四路已开始回流的复信，你没把自己写成那一声令所有门主折返的人。 # beat:sq_false_base_11 # scene:sq_return # cast:sq_wen # speaker:narrator
  -> east_gate
* [把急报交快脚，自己护伤者走慢路，接信人和分行时刻各留一份。 # cid:sq_split_carriers]
  我们从这里分。你先到，报出哪一班在后，不说全队已到。 # beat:sq_false_base_12 # scene:sq_return # cast:sq_wen # speaker:you
  快脚答了便走。你回头接慢的一班，远处火光没有因为有人先报平安就熄掉。 # beat:sq_false_base_13 # scene:sq_return # cast:sq_wen # speaker:narrator
  -> east_gate

=== quiet_court ===
你留在嵩阳。空椅子围着，司马归元坐院中喝茶，像全院只有他没听见急讯。你来换水，他让你把新一壶放在另一边。 # beat:sq_quiet_court_1 # scene:sq_court # cast:sq_sima # speaker:narrator
别都端走。回来的人也要喝。 # beat:sq_quiet_court_2 # scene:sq_court # cast:sq_sima # speaker:sq_sima # mood:sq_sima=amused
您不走？ # beat:sq_quiet_court_3 # scene:sq_court # cast:sq_sima # speaker:you
有人会去。 # beat:sq_quiet_court_4 # scene:sq_court # cast:sq_sima # speaker:sq_sima # mood:sq_sima=neutral
你没听出哪处新线索，只好先把杯放稳。午后，萧天策从原来出入送件的门回来了，右手缺小指。 # beat:sq_quiet_court_5 # scene:sq_court # cast:sq_sima # speaker:narrator
* [去后门接收转班，不跟到院心，把留守的差事真接住。 # cid:sq_keep_back_gate]
  ~ sq_court_duty = true
  我去后门。有消息就从这边应。 # beat:sq_quiet_court_6 # scene:sq_court # cast:sq_sima # speaker:you
  去。 # beat:sq_quiet_court_7 # scene:sq_court # cast:sq_sima # speaker:sq_sima # mood:sq_sima=neutral
  你放下空托盘，转身时听见萧问他为何不去救人，语气像认定这一院早该空了。 # beat:sq_quiet_court_8 # scene:sq_court # cast:sq_sima # speaker:narrator
  -> eighty_one
* [先守院边的交接桌，看清来人去向，后门请当值者应。 # cid:sq_watch_margin]
  ~ sq_court_duty = false
  我在这张桌，有人来先收着。 # beat:sq_quiet_court_9 # scene:sq_court # cast:sq_sima # speaker:you
  别站到两人中间。 # beat:sq_quiet_court_10 # scene:sq_court # cast:sq_sima # speaker:sq_sima # mood:sq_sima=neutral
  你挪到廊柱后，托盘还抱在臂里。多看得见一段，并不使手里木盘能挡下一掌。 # beat:sq_quiet_court_11 # scene:sq_court # cast:sq_sima # speaker:narrator
  -> eighty_one

=== eighty_one ===
你知道我回来？ # beat:sq_eighty_one_1 # scene:sq_court # cast:sq_xiao,sq_sima # speaker:sq_xiao # mood:sq_xiao=intent
不知道。 # beat:sq_eighty_one_2 # scene:sq_court # cast:sq_xiao,sq_sima # speaker:sq_sima # mood:sq_sima=neutral
那为何留下？ # beat:sq_eighty_one_3 # scene:sq_court # cast:sq_xiao,sq_sima # speaker:sq_xiao # mood:sq_xiao=neutral
聪明人总想多走一步。我懒得跟。 # beat:sq_eighty_one_4 # scene:sq_court # cast:sq_xiao,sq_sima # speaker:sq_sima # mood:sq_sima=amused
萧先出手。旧总谱前列、准备多年，前二十招竟占先。三十招以后，司马开始把针对太极准备的东西一件件拆掉。 # beat:sq_eighty_one_5 # scene:sq_court # cast:sq_xiao,sq_sima # speaker:narrator
第六十余招第一掌中，第七十余第二掌中。第八十一招，司马掌停萧心口。 # beat:sq_eighty_one_6 # scene:sq_court # cast:sq_xiao,sq_sima # speaker:narrator
这就是返真？ # beat:sq_eighty_one_7 # scene:sq_court # cast:sq_xiao,sq_sima # speaker:sq_xiao # mood:sq_xiao=uneasy
这只是我。 # beat:sq_eighty_one_8 # scene:sq_court # cast:sq_sima # speaker:sq_sima # mood:sq_sima=neutral # camera:portrait # action:司马归元 · 这只是我
萧忽捏碎袖中烟珠，院后同时起火。你这才知道，他从未打算靠自己在院里赢过司马；真正抢卷的人正进后院。 # beat:sq_eighty_one_9 # scene:sq_court # cast:sq_xiao,sq_sima # speaker:narrator
* [先向后门喊接应位置，叫抄手连人带正封匣退出，不守着抄到一半的副件。 # cid:sq_answer_rear]
  ~ sq_fire_people = true
  正封匣有人接！抄件先放，人从后门退！ # beat:sq_eighty_one_10 # scene:sq_court # cast:sq_xiao,sq_sima # speaker:you
  烟里传来应声，你把桌边水泼湿外衣，伏低去接人，没往萧和司马之间钻。 # beat:sq_eighty_one_11 # scene:sq_court # cast:sq_xiao,sq_sima # speaker:narrator
  -> courtyard_fire
* [先把桌上封匣交给可认的值房人，自己回头接未出的抄手，不追抢卷者。 # cid:sq_hold_seals]
  ~ sq_fire_people = false
  接封匣，原封别拆！后面的人我去叫。 # beat:sq_eighty_one_12 # scene:sq_court # cast:sq_xiao,sq_sima # speaker:you
  值房应声，你才松手。抄手抱着未完一页不愿走，你冲他喊，原卷还有人守，这一页不能替他再活一回。 # beat:sq_eighty_one_13 # scene:sq_court # cast:sq_xiao,sq_sima # speaker:narrator
  -> courtyard_fire

=== courtyard_fire ===
烟从后院灌过来。司马仍在拦对手，你不能把那一掌挡住的人数，当成每扇门后都有人接应。 # beat:sq_courtyard_fire_1 # scene:sq_court_fire # cast:none # speaker:narrator
{
- not sq_water_ready:
两班收转和后门应声点你都走熟了。一班接匣，另一班接人，半途没人又抱着东西绕回前院。抄手咳着出来，手里的副件烧掉一角，人没受重伤。 # beat:sq_courtyard_fire_2 # scene:sq_court_fire # cast:none # speaker:narrator
这边还有一个，接住再送下一匣。 # beat:sq_courtyard_fire_3 # scene:sq_court_fire # cast:none # speaker:you
他落到外廊，自己坐稳，终于放开那一张抄件。 # beat:sq_courtyard_fire_4 # scene:sq_court_fire # cast:none # speaker:narrator
- else:
你先前把半日用在水道，院中转报只看过安排。火起有人向前院送，人却等在后门，应声隔了墙。你折回去，把一名抄手拖过倒架，自己袖口也灼破。 # beat:sq_courtyard_fire_5 # scene:sq_court_fire # cast:none # speaker:narrator
别再等那个名字。后门有人，先走！ # beat:sq_courtyard_fire_6 # scene:sq_court_fire # cast:none # speaker:you
抄手活着，右臂烫伤，养伤三个月。原封匣仍送出，副件烧坏；他的课和抄差要有人接，不是急火过去便一笔销掉。 # beat:sq_courtyard_fire_7 # scene:sq_court_fire # cast:none # speaker:narrator
}
{
- sq_partner == 1:
他抄的最后一页给我。我先接下一班，后面请值房排人，不让人只见缺件又催他握笔。 # beat:sq_courtyard_fire_8 # scene:sq_court_fire # cast:sq_hesheng # speaker:sq_hesheng # mood:sq_hesheng=intent
禾生把半张焦纸夹进自己的课簿，翻开干净一页，手抖得第一行写歪了。 # beat:sq_courtyard_fire_9 # scene:sq_court_fire # cast:sq_hesheng # speaker:narrator
- else:
后门我在。你们交过来，不必每回再喊南岳的人肯不肯接。 # beat:sq_courtyard_fire_10 # scene:sq_court_fire # cast:sq_asheng # speaker:sq_asheng # mood:sq_asheng=intent
她认你原先同核的那一份，也认现在这一班的应声，把抄手送到廊外才去接下一匣。 # beat:sq_courtyard_fire_11 # scene:sq_court_fire # cast:sq_asheng # speaker:narrator
}
{
- sq_court_duty:
后门那班转接，一直有人应。你喊的位置没有空过。 # beat:sq_courtyard_fire_12 # scene:sq_court_fire # cast:none # speaker:narrator
- else:
院边交接桌上的来向记录还连着。谁从哪道门出来，桌上都有一笔。 # beat:sq_courtyard_fire_13 # scene:sq_court_fire # cast:none # speaker:narrator
}
* [把正封已接与副件毁损分别报清，不因人救出便写一切无失。 # cid:sq_mark_missing]
  ~ sq_court_after = 1
  正封已出，副件缺一角，伤的人另列。回来的录事先核哪份，按这张找。 # beat:sq_courtyard_fire_14 # scene:sq_court_fire # cast:none # speaker:you
  你报出后门那一班，终于不是全院人互相喊都有人收。 # beat:sq_courtyard_fire_15 # scene:sq_court_fire # cast:none # speaker:narrator
  -> court_report
* [先请下一班接手，让淋水呛烟的人休息，自己带完整交接去前院。 # cid:sq_relieved_shift]
  ~ sq_court_after = 2
  你们歇。哪箱谁接，我来报。不叫刚从烟里出来的人再跑一遍证明自己。 # beat:sq_courtyard_fire_16 # scene:sq_court_fire # cast:none # speaker:you
  接班者认了名，你才离门。托盘还在廊柱边，杯子倒了，桌却没有再空着等一个没回来的人。 # beat:sq_courtyard_fire_17 # scene:sq_court_fire # cast:none # speaker:narrator
  -> court_report

=== court_report ===
华山先识南逃路线为假，陆青崖即折返；昆仑从另一面截回，武当接鸽讯，天海宗循水路最快。十四家一夜回流，同光会反被堵在三面。 # beat:sq_court_report_1 # scene:sq_return # cast:none # speaker:narrator
你留下的一张收转簿只接其中一段。各路有各路的判断，不是门主们忽然都等着你喊一声才肯回头。 # beat:sq_court_report_2 # scene:sq_return # cast:none # speaker:narrator
{
- sq_court_after == 2:
接班者认了名才离门。托盘还在廊柱边，杯子倒了，桌却没有再空着等一个没回来的人。 # beat:sq_court_report_3 # scene:sq_return # cast:none # speaker:narrator
- else:
正封已接、副件缺一角、伤者另列——合报按你那张单子先核了哪份在后。 # beat:sq_court_report_4 # scene:sq_return # cast:none # speaker:narrator
}
{
- sq_fire_people:
后门退出来的人连人带匣都点了数。你喊的那一声，后来在合报里写成一处有名字的接应点。 # beat:sq_court_report_5 # scene:sq_return # cast:none # speaker:narrator
- else:
封匣交给了可认的值房人。回头接抄手那一段，你没能亲眼看完——看见的人替你补上了那一笔。 # beat:sq_court_report_6 # scene:sq_return # cast:none # speaker:narrator
}
* [先交院中自己亲见的时辰与抢卷经过，伏牛情形等随队者核。 # cid:sq_report_seen_court]
  我在嵩阳，这一夜见到的在这里。谷中谁先过沟，我没有看过。 # beat:sq_court_report_7 # scene:sq_return # cast:none # speaker:you
  你写亲见两字时终于不用猜。快脚后来带来溪沟那一份，纸上有先送弟子的原话。 # beat:sq_court_report_8 # scene:sq_return # cast:none # speaker:narrator
  -> east_gate
* [去前门接最先回院的传讯人，先安置伤者，谷中慢队另留接应。 # cid:sq_pair_arrivals]
  伤的先坐。哪段我未见，等你们喘过来再问。 # beat:sq_court_report_9 # scene:sq_return # cast:none # speaker:you
  最先回来的两名传讯人鞋上满是泥，只带来谷中已撤的急讯。你给后来的伤队留好抬架，东门忽然有人喊让路。 # beat:sq_court_report_10 # scene:sq_return # cast:none # speaker:narrator
  -> east_gate

=== east_gate ===
外廊挤着待问的人，有人捧水，有人抱着湿透的外衣。你把空抬架放到墙边，腾出通往东门的路。 # beat:sq_east_gate_1 # scene:sq_return # cast:none # speaker:narrator
{
- sq_route == 1:
你随慢队回到院时，东门已经收势。守门录事把自己记的递来，你坐下听，不把后来读过的四十一招改成赶上了那一瞬。 # beat:sq_east_gate_2 # scene:sq_east_record # cast:sq_eastscribe # speaker:narrator
闻人宿在东门遇陆。二十余招见血，第三十七招他贴剑抢近，逼长剑近身难转。 # beat:sq_east_gate_3 # scene:sq_east_record # cast:sq_eastscribe # speaker:sq_eastscribe # mood:sq_eastscribe=intent
录事演给你看手的位置，不拿自己那根短尺冒充陆的剑。陆松剑，两指先到眉前；闻人侧头，长剑入陆另一手，反剑上挑，第四十一招停喉。 # beat:sq_east_gate_4 # scene:sq_east_record # cast:sq_eastscribe # speaker:narrator
闻人问他入返真多久。陆说二十七年。闻人笑，说难怪，便认输。 # beat:sq_east_gate_5 # scene:sq_east_record # cast:sq_eastscribe # speaker:sq_eastscribe # mood:sq_eastscribe=neutral
你问他哪一段看不清，他把纸边两处空记指给你。连亲见者也有未能看明的地方，山谷里没在场的你，更不能凭读过便填齐。 # beat:sq_east_gate_6 # scene:sq_east_record # cast:sq_eastscribe # speaker:narrator
- else:
你留在院里接返队，东门的刀兵还未停。送完近处伤者，从外廊望见闻人宿遇上陆青崖。两位返真，没有试探，二十余招已见血。 # beat:sq_east_gate_7 # scene:sq_east # cast:sq_lu,sq_wenren # speaker:narrator
第三十七招闻人贴剑抢近，想借长剑近身难转逼陆弃路。陆真的松剑。剑落，两指已先到眉前；闻人侧头，长剑恰入陆另一手。 # beat:sq_east_gate_8 # scene:sq_east # cast:sq_lu,sq_wenren # speaker:narrator
反剑上挑。第四十一招，剑尖停闻人咽喉。你原来预备往里送的那一只水碗还端着，连叫一声都没来得及。 # beat:sq_east_gate_9 # scene:sq_east # cast:sq_lu,sq_wenren # speaker:narrator
你入返真多久？ # beat:sq_east_gate_10 # scene:sq_east # cast:sq_lu,sq_wenren # speaker:sq_wenren # mood:sq_wenren=uneasy
二十七年。 # beat:sq_east_gate_11 # scene:sq_east # cast:sq_lu,sq_wenren # speaker:sq_lu # mood:sq_lu=neutral
难怪。 # beat:sq_east_gate_12 # scene:sq_east # cast:sq_lu,sq_wenren # speaker:sq_wenren # mood:sq_wenren=amused
闻人认输。都是返真，也不是一样；你站在门外看见的是一次握与松，不是得到一套照着背便能赢过返真的诀窍。 # beat:sq_east_gate_13 # scene:sq_east # cast:sq_lu,sq_wenren # speaker:narrator
}
* [等陆回到外廊再递水，先留退处，不上前拦着问招。 # cid:sq_receive_later]
  水放这边。 # beat:sq_east_gate_14 # scene:sq_return # cast:sq_lu # speaker:you
  陆在外廊接过，问伤者是否安顿。你答了自己接的那一班，不替全院说都好了。 # beat:sq_east_gate_15 # scene:sq_return # cast:sq_lu # speaker:narrator
  -> converge
* [退回外廊把结果报给等讯的人，请亲见录事记招，不凭自己惊讶重造每一手。 # cid:sq_keep_distance]
  东门收势，闻人认输。细招请亲见录事记，我交自己那一份。 # beat:sq_east_gate_16 # scene:sq_return # cast:sq_lu # speaker:you
  等讯的人把抬架放到廊下，先让伤者坐稳，再接院内这一班。 # beat:sq_east_gate_17 # scene:sq_return # cast:sq_lu # speaker:narrator
  -> converge

=== converge ===
急报和慢队终于在旧院汇合。两张一路被雨浸过、一路有烟熏的纸放在一起，你先辨出写字的人，才辨出彼此错过的半场危局。 # beat:sq_converge_1 # scene:sq_return # cast:sq_hesheng,sq_asheng # speaker:narrator
{
- sq_route == 1:
留守录事讲司马一直坐在院中，萧问他知不知道自己回来，他答不知道，只因聪明人总想多走一步，他懒得跟。萧前二十招占先，三十招以后却被逐步拆解，第八十一招掌停心口。 # beat:sq_converge_2 # scene:sq_return # cast:sq_hesheng,sq_asheng # speaker:narrator
萧问这就是返真，司马答这只是我。随后烟珠碎、院后起火。这几句你到此才听见，已请亲见者核过，不把山谷里没能看见的事写作自己的眼力。 # beat:sq_converge_3 # scene:sq_return # cast:sq_hesheng,sq_asheng # speaker:narrator
- else:
随队者讲伏牛旧河早断，许问岑先识假图；两侧火石齐下，慧寂先震树过沟送弟子。闻人现身，燕、许、闻三人围攻六十余招仍没扳回。 # beat:sq_converge_4 # scene:sq_return # cast:sq_hesheng,sq_asheng # speaker:narrator
等弟子全部撤过，慧寂才转身。两位返真六十余招同时伤及彼此，闻人吐血入火，慧寂阻追，前方山壁旋即崩落。你在院里没见那座树桥，记时也留下随队者的姓名。 # beat:sq_converge_5 # scene:sq_return # cast:sq_hesheng,sq_asheng # speaker:narrator
}
{
- sq_seat_side == 1:
你坐的那侧带回来的纸，烟味淡些。我这张被雨泡过，先并你的。 # beat:sq_converge_6 # scene:sq_return # cast:sq_hesheng,sq_asheng # speaker:sq_hesheng # mood:sq_hesheng=neutral
- else:
南岳侧的问件是你收的。这张先对谁的字，你定。 # beat:sq_converge_7 # scene:sq_return # cast:sq_hesheng,sq_asheng # speaker:sq_asheng # mood:sq_asheng=neutral
}
{
- sq_court_after == 1:
嵩阳那页写着副件缺一角。我们两张并上，正好把缺的那行补出来。 # beat:sq_converge_8 # scene:sq_return # cast:sq_hesheng,sq_asheng # speaker:sq_hesheng # mood:sq_hesheng=neutral
- else:
{sq_route == 2:接了你交接的那一班已歇下。合报时，别再叫淋过水的人重跑一遍。|伏牛慢队已经回院。谷中那页先给录事，院里这一页另请留守者核，别叫你一个人替两路都签。} # beat:sq_converge_9 # scene:sq_return # cast:sq_hesheng,sq_asheng # speaker:sq_asheng # mood:sq_asheng=neutral
}
* [把两路亲见和后闻分栏，再让同伴核自己的姓名，不抢一份全知通报。 # cid:sq_separate_witness]
  ~ sq_final_sources = true
  我不在的那段，写谁见，不只写我听懂。 # beat:sq_converge_10 # scene:sq_return # cast:sq_hesheng,sq_asheng # speaker:you
  等会儿，我刚换了笔尖。你慢些报，第三个人名又扎破纸了。 # beat:sq_converge_11 # scene:sq_return # cast:sq_hesheng,sq_asheng # speaker:sq_hesheng # mood:sq_hesheng=amused
  给他留点地方，后面还得写欠我的鞋钱。 # beat:sq_converge_12 # scene:sq_return # cast:sq_hesheng,sq_asheng # speaker:sq_asheng # mood:sq_asheng=neutral
  你们还真算了一回鞋钱，抄到第三行，才一起发现这几日头一回能为这种小事争。 # beat:sq_converge_13 # scene:sq_return # cast:sq_hesheng,sq_asheng # speaker:narrator
  -> middle_chairs
* [先对照还有谁未回，已归的人各留亲见副报，夜里再整理两路。 # cid:sq_first_missing]
  ~ sq_final_sources = false
  我先去找那一班。你们把自己那页留下，回来再合。 # beat:sq_converge_14 # scene:sq_return # cast:sq_hesheng,sq_asheng # speaker:you
  西廊那班我去问。你去东边，回来就在这儿碰头。 # beat:sq_converge_15 # scene:sq_return # cast:sq_hesheng,sq_asheng # speaker:sq_asheng # mood:sq_asheng=intent
  禾生替你圈出已回两名，你少绕一条巷，才在外廊接到走慢的抄手。后半夜归卷，三人的墨各有一层。 # beat:sq_converge_16 # scene:sq_return # cast:sq_hesheng,sq_asheng # speaker:narrator
  -> middle_chairs

=== middle_chairs ===
萧天策被押回十四张椅子中间。想掀这张桌的人，第一次真坐到了圆里。顾先问书，闻却问他到底想要什么。 # beat:sq_middle_chairs_1 # scene:sq_chairs # cast:sq_xiao,sq_wen,sq_gu # speaker:narrator
一个没有门第的江湖。 # beat:sq_middle_chairs_2 # scene:sq_chairs # cast:sq_xiao,sq_wen,sq_gu # speaker:sq_xiao # mood:sq_xiao=intent
十七岁想拜大门，连山门进不去；二十七岁能胜内院弟子；三十七岁被请作外门客卿，问为何非正传，只得没有根三个字。 # beat:sq_middle_chairs_3 # scene:sq_chairs # cast:sq_xiao,sq_wen,sq_gu # speaker:narrator
所以要把这场事推到二十七个人头上？ # beat:sq_middle_chairs_4 # scene:sq_chairs # cast:sq_xiao,sq_wen,sq_gu # speaker:sq_wen # mood:sq_wen=uneasy
萧望向名册。闻道尘把它推到他面前，指尖停在第二十四个朱名上。萧没有接那张纸。 # beat:sq_middle_chairs_5 # scene:sq_chairs # cast:sq_xiao,sq_wen,sq_gu # speaker:narrator
所以你要毁所有大宗？ # beat:sq_middle_chairs_6 # scene:sq_chairs # cast:sq_xiao,sq_lu,sq_sima # speaker:sq_lu # mood:sq_lu=neutral
我只是想看看。把你们几百年攒的全摆上桌，六大还是不是六大。 # beat:sq_middle_chairs_7 # scene:sq_chairs # cast:sq_xiao,sq_lu,sq_sima # speaker:sq_xiao # mood:sq_xiao=neutral
会。 # beat:sq_middle_chairs_8 # scene:sq_chairs # cast:sq_xiao,sq_lu,sq_sima # speaker:sq_sima # mood:sq_sima=neutral
萧一愣，像所有答复都预备过，偏没留这一句的位置。 # beat:sq_middle_chairs_9 # scene:sq_chairs # cast:sq_xiao,sq_lu,sq_sima # speaker:narrator
你把太极所有谱都抄出去，太极还是太极。谱是死的，人是活的。 # beat:sq_middle_chairs_10 # scene:sq_chairs # cast:sq_xiao,sq_lu,sq_sima # speaker:sq_sima # mood:sq_sima=intent
{
- sq_two_names:
两条线索始终分开抄。此刻一个坐在椅里，一个下落另有卷宗——两页纸对上了，谁也没替谁并成一个人。 # beat:sq_middle_chairs_11 # scene:sq_chairs # cast:sq_xiao,sq_lu,sq_sima # speaker:narrator
- else:
旧河道那张图上的疑问，查路队回话到了。木进人出的口子，与萧南逃的路线对上了一段。 # beat:sq_middle_chairs_12 # scene:sq_chairs # cast:sq_xiao,sq_lu,sq_sima # speaker:narrator
}
* [经录事转问还未归的人与物在哪里，不把听见一段怨恨当成已问全案。 # cid:sq_ask_missing_people]
  ~ sq_asked_people = true
  青石驿失踪的见证人，案中还未归的卷，都另列着。请继续问。 # beat:sq_middle_chairs_13 # scene:sq_chairs # cast:sq_xiao,sq_lu,sq_sima # speaker:you
  录事念到失踪者，萧抬了抬眼，没有答。闻道尘让录事坐下，把那一项移到最前，继续问。 # beat:sq_middle_chairs_14 # scene:sq_chairs # cast:sq_xiao,sq_lu,sq_sima # speaker:narrator
  -> three_volumes
* [把他所述身世交给当值录事核，自己先清点归回的封匣，仍留未归栏。 # cid:sq_keep_testimony]
  ~ sq_asked_people = false
  这些话记下，不能替先前的伤亡结案。我先去看接回的物。 # beat:sq_middle_chairs_15 # scene:sq_chairs # cast:sq_xiao,sq_lu,sq_sima # speaker:you
  你到外廊逐匣对封。里面有真卷，有证词，也有一路从假扉页抄出的错话；没有因为凶手坐下，纸就自己分得清。 # beat:sq_middle_chairs_16 # scene:sq_chairs # cast:sq_xiao,sq_lu,sq_sima # speaker:narrator
  -> three_volumes

=== three_volumes ===
清点到最后，事情又露出一层荒唐：萧手里只有前三卷。季老早知同运太险，后四卷一直由另一弟子藏在鹿门山中。 # beat:sq_three_volumes_1 # scene:sq_records # cast:sq_disciple,sq_wen # speaker:narrator # cg:workingBooks # action:案头书卷
他分开时，连我也没知道全部去处。后来听原卷尽失，我也当七卷都失了。 # beat:sq_three_volumes_2 # scene:sq_records # cast:sq_disciple,sq_wen # speaker:sq_disciple # mood:sq_disciple=uneasy
这次交接，不能还只写七卷两个字。 # beat:sq_three_volumes_3 # scene:sq_records # cast:sq_disciple,sq_wen # speaker:you # cg:none
分卷验。哪一卷哪一人接，都验。 # beat:sq_three_volumes_4 # scene:sq_records # cast:sq_disciple,sq_wen # speaker:sq_disciple # mood:sq_disciple=neutral
半个江湖被闹动，真正拿走的却不到一半。抄单要重开，死者名册却不会因这件事有多荒唐就变轻。 # beat:sq_three_volumes_5 # scene:sq_records # cast:sq_disciple,sq_wen # speaker:narrator
{
- sq_final_sources:
两路亲见与后闻分了栏。前三卷这一页，谁亲见、谁听报，栏里写得清楚，没人再问哪句是你的猜想。 # beat:sq_three_volumes_6 # scene:sq_records # cast:sq_disciple,sq_wen # speaker:narrator
- else:
已归的人各留了副报。去找未归那一班之前，合报的架子先立住了。 # beat:sq_three_volumes_7 # scene:sq_records # cast:sq_disciple,sq_wen # speaker:narrator
}
* [逐卷核回来源、封存与接手，不拿看见三卷便替另四签全。 # cid:sq_check_each_volume]
  ~ sq_each_volume = true
  前三卷回收，后四另交。原来的“尽失”，保留当时为何那样报，下面添复核结果。 # beat:sq_three_volumes_8 # scene:sq_records # cast:sq_disciple,sq_wen # speaker:you
  旧单也给我。这行尽失是我写的，我在下面改，不能让你替我签。 # beat:sq_three_volumes_9 # scene:sq_records # cast:sq_disciple,sq_wen # speaker:sq_disciple # mood:sq_disciple=intent
  两条收件路在鹿门汇合，各自留下见证，不让一份新齐单替代全部来路。 # beat:sq_three_volumes_10 # scene:sq_records # cast:sq_disciple,sq_wen # speaker:narrator
  -> distribution
* [先核各家抄读名单，缺卷处仍列待验，请验卷者当面向自己交接。 # cid:sq_prepare_readers]
  ~ sq_each_volume = false
  抄录的人先备，未验的四卷别催他们先背一份并不存在的齐本。 # beat:sq_three_volumes_11 # scene:sq_records # cast:sq_disciple,sq_wen # speaker:you
  我验到哪一卷就报哪一卷，不叫你白等一个全字。 # beat:sq_three_volumes_12 # scene:sq_records # cast:sq_disciple,sq_wen # speaker:sq_disciple # mood:sq_disciple=neutral
  你给抄手留了能先做的空页，后四卷仍等另一弟子带来，没用忙起来挡住缺件。 # beat:sq_three_volumes_13 # scene:sq_records # cast:sq_disciple,sq_wen # speaker:narrator
  -> distribution

=== distribution ===
凶手被制，十四门会反而议得更久。闻道尘最后提出：原卷封鹿门，不入一家；十四家各抄；前两卷逐步外流，第三至七只准真正走到入化后完整借阅。 # beat:sq_distribution_1 # scene:sq_chairs # cast:sq_wen,sq_gu # speaker:narrator
把看不懂的先照练，前人真得来的东西，也可能害后来的人。 # beat:sq_distribution_2 # scene:sq_chairs # cast:sq_wen,sq_gu # speaker:sq_wen # mood:sq_wen=intent
我同意。模仿一家的形，和真走过那条路，差得太远。 # beat:sq_distribution_3 # scene:sq_chairs # cast:sq_wen,sq_gu # speaker:sq_gu # mood:sq_gu=neutral
你想起真卷上那句假扉页。此刻不是十四个人都不再有私心，而是连最反对限制的人，也见到了只看见外形会怎样一路伤人。 # beat:sq_distribution_4 # scene:sq_chairs # cast:sq_wen,sq_gu # speaker:narrator
{
- sq_access_question:
你前头递的问件被翻出来，外流前两卷附带说明的收件人另列。不是年轻门人问过，便能取得高卷，却终于能把不能照练的理由带给只听过封书传言的人。 # beat:sq_distribution_5 # scene:sq_chairs # cast:sq_wen,sq_gu # speaker:narrator
- else:
你前头问由谁带读的那一格，列进抄件交接。书有十四份，不等于每份背后自动多一位能教的人；接课者的名字，这一次单独留着。 # beat:sq_distribution_6 # scene:sq_chairs # cast:sq_wen,sq_gu # speaker:narrator
}
{
- sq_notes:
散席前，司马叫住你，把昨夜答应的附注递来。三处字旁另有小楷，是他怕你认错，重新写过的。你夹进前两卷，今日不必再等一封催信。 # beat:sq_distribution_7 # scene:sq_chairs # cast:sq_wen,sq_gu # speaker:narrator
- else:
你先前送的是扉页来源表，附注还没领。司马已收好自己的行囊，听见你问，又解开袋口找；到门边时，送午饭的人已把担子挑走。 # beat:sq_distribution_8 # scene:sq_chairs # cast:sq_wen,sq_gu # speaker:narrator
}
{
- sq_kept_questions:
白日收回的问件还在原匣。你把学生问的那句展给录事，原题下添上带读与限阅的答复，交回去时仍认得提问人的字。 # beat:sq_distribution_9 # scene:sq_chairs # cast:sq_wen,sq_gu # speaker:narrator
- else:
那日先去包手，问件交过几次人，末尾被蹭掉一行。你找到手上缠布的年轻人，请他重新讲一遍；他这回问得比纸上更细，录事只好再搬一张凳。 # beat:sq_distribution_10 # scene:sq_chairs # cast:sq_wen,sq_gu # speaker:narrator
}
{
- sq_asked_people:
失踪见证人与未归卷另列的那栏，散会时仍开着。录事按它继续问，没并进已结的案里。 # beat:sq_distribution_11 # scene:sq_chairs # cast:sq_wen,sq_gu # speaker:narrator
- else:
他所述身世已交当值录事核。你清点归匣时，那一栏仍未销。 # beat:sq_distribution_12 # scene:sq_chairs # cast:sq_wen,sq_gu # speaker:narrator
}
{
- sq_each_volume:
七卷回收逐卷核过。议约里那句各抄一份，落笔时没人再拿一句尽失充数。 # beat:sq_distribution_13 # scene:sq_chairs # cast:sq_wen,sq_gu # speaker:narrator
- else:
抄读名单先备好，缺卷处仍列待验。十四家签字时，都知道自己签的不是一份齐本。 # beat:sq_distribution_14 # scene:sq_chairs # cast:sq_wen,sq_gu # speaker:narrator
}
* [接下混编传讯的常差，把前两卷与核过的风险说明送到真收件人手里。 # cid:sq_choose_carriers]
  ~ sq_career = 1
  我去送。哪处只收了书、还没有人讲，回报也请留这一项。 # beat:sq_distribution_15 # scene:sq_chairs # cast:sq_wen,sq_gu # speaker:you
  往南的先停一日。那边带读的人还没到，我把回信催来，你一并带。 # beat:sq_distribution_16 # scene:sq_chairs # cast:sq_wen,sq_gu # speaker:sq_wen # mood:sq_wen=neutral
  你改了自己的行期，不替两位同伴一并答应全年都上路。 # beat:sq_distribution_17 # scene:sq_chairs # cast:sq_wen,sq_gu # speaker:narrator
  -> agreement
* [留鹿门接抄读和入门课，给借阅者留能追问的去处，不越阶教高卷。 # cid:sq_choose_reading]
  ~ sq_career = 2
  我留。前两卷里我也不明白的，请授课者讲，不拿管钥匙当自己已经会。 # beat:sq_distribution_18 # scene:sq_chairs # cast:sq_wen,sq_gu # speaker:you
  钥匙也别最后只交给一户人。规矩要让后来借的人能问。 # beat:sq_distribution_19 # scene:sq_chairs # cast:sq_wen,sq_gu # speaker:sq_gu # mood:sq_gu=intent
  你接的是书与人之间的常课，不是把自己坐成第十五把掌门椅。 # beat:sq_distribution_20 # scene:sq_chairs # cast:sq_wen,sq_gu # speaker:narrator
  -> agreement

=== agreement ===
议约不是盟约。十四家往后仍会争、会打、会抢人和路，只是两家以上顶层人物之死不凭招痕定凶；六大八家争议至少三家共验；跨宗高层遗录若原主无明确指定，不由一家独占。 # beat:sq_agreement_1 # scene:sq_records # cast:sq_hesheng,sq_asheng # speaker:narrator
顾坚持添榜、门、世家有别，武道无籍。陆没有反对。你们抄最后一行时，纸终于没有再被拿去垫椅子。 # beat:sq_agreement_2 # scene:sq_records # cast:sq_hesheng,sq_asheng # speaker:narrator
木匠那一卷，要不给我留着。 # beat:sq_agreement_3 # scene:sq_records # cast:sq_hesheng,sq_asheng # speaker:sq_hesheng # mood:sq_hesheng=amused
写在你那册。下回若又量椅子，先把纸收好。 # beat:sq_agreement_4 # scene:sq_records # cast:sq_hesheng,sq_asheng # speaker:sq_asheng # mood:sq_asheng=neutral
两人笑完，还是各拿回自己的差事。你想请同伴再接一程，也得先问这回要误哪一班。 # beat:sq_agreement_5 # scene:sq_records # cast:sq_hesheng,sq_asheng # speaker:narrator
{
- sq_partner == 1:
头两趟我同你接。后面我回金陵教新抄手，假扉页那一课不能总等我师父来骂。 # beat:sq_agreement_6 # scene:sq_records # cast:sq_hesheng,sq_asheng # speaker:sq_hesheng # mood:sq_hesheng=intent
两趟。再请你，另约时日。 # beat:sq_agreement_7 # scene:sq_records # cast:sq_hesheng,sq_asheng # speaker:you
他把自己的日子划出来，没用全听你的替代一句有始有终的答应。 # beat:sq_agreement_8 # scene:sq_records # cast:sq_hesheng,sq_asheng # speaker:narrator
- else:
我接到八月。师妹那堂课我答应回去带，不能送完十四家的信，反倒让她等我一句江湖大事。 # beat:sq_agreement_9 # scene:sq_records # cast:sq_hesheng,sq_asheng # speaker:sq_asheng # mood:sq_asheng=intent
八月前交班。后面我另找接手的人。 # beat:sq_agreement_10 # scene:sq_records # cast:sq_hesheng,sq_asheng # speaker:you
她当场替你问下一班，不把不肯全年同行说成你们这一程白走了。 # beat:sq_agreement_11 # scene:sq_records # cast:sq_hesheng,sq_asheng # speaker:narrator
}
* [按同伴答应的两趟或八月交班，自己补余下的行程与课，不用旧恩情压人。 # cid:sq_keep_companion_time]
  ~ sq_kept_time = true
  到了日子你走。剩下这一份，写我的名字。 # beat:sq_agreement_12 # scene:sq_records # cast:sq_hesheng,sq_asheng # speaker:you
  禾生把到日标清，阿笙把交班处圈好。你们各有回去的地方，仍能在下一次真约定的时候认得彼此。 # beat:sq_agreement_13 # scene:sq_records # cast:sq_hesheng,sq_asheng # speaker:narrator
  -> at_the_door
* [自己付代差钱请同伴多留一次，先等他或她真答应，下一班另安排。 # cid:sq_pay_next_shift]
  ~ sq_kept_time = false
  我还想请多一次。钱照给，没空就按原约走。 # beat:sq_agreement_14 # scene:sq_records # cast:sq_hesheng,sq_asheng # speaker:you
  同伴答应这一回，自己把回程改一日。你少了一份束脩，多出一段能同问的路，没把它记成从此谁都欠你同行。 # beat:sq_agreement_15 # scene:sq_records # cast:sq_hesheng,sq_asheng # speaker:narrator
  -> at_the_door

=== at_the_door ===
大会散后，闻道尘在少室山脚又留两日。你去送最后一份抄件，听他问慧寂：我真的离返真很远？伏牛谷，三人打闻人宿，差得太清楚。 # beat:sq_at_the_door_1 # scene:sq_door # cast:sq_wen,sq_hui # speaker:narrator
你离门很近。 # beat:sq_at_the_door_2 # scene:sq_door # cast:sq_wen,sq_hui # speaker:sq_hui # mood:sq_hui=neutral
这句话，我听了十五年。 # beat:sq_at_the_door_3 # scene:sq_door # cast:sq_wen,sq_hui # speaker:sq_wen # mood:sq_wen=uneasy
很近，不是说你明年进去。是说你这一生，已有资格真正站在门前看。 # beat:sq_at_the_door_4 # scene:sq_door # cast:sq_wen,sq_hui # speaker:sq_hui # mood:sq_hui=intent
闻停了许久，又问里面差别何以仍大。慧寂说闻人刚进去，陆已经走了二十七年。 # beat:sq_at_the_door_5 # scene:sq_door # cast:sq_wen,sq_hui # speaker:narrator
所以里面也还是一样。 # beat:sq_at_the_door_6 # scene:sq_door # cast:sq_wen,sq_hui # speaker:sq_wen # mood:sq_wen=amused
武道什么时候不是这样？ # beat:sq_at_the_door_7 # scene:sq_door # cast:sq_wen,sq_hui # speaker:sq_hui # mood:sq_hui=amused
闻道尘把杯里冷茶喝尽，伸手又提壶。壶已空了。他看一眼慧寂，两人忽然又笑起来。 # beat:sq_at_the_door_8 # scene:sq_door # cast:sq_wen,sq_hui # speaker:narrator
* [交清最后一份，回自己的常差，不拿这次听见的话替别人许成就。 # cid:sq_return_receipt]
  这一份收好了。我按约回去。 # beat:sq_at_the_door_9 # scene:sq_door # cast:sq_wen,sq_hui # speaker:you
  去。下次你来，不一定有十四家等着，也还会有人等一张该到的纸。 # beat:sq_at_the_door_10 # scene:sq_door # cast:sq_wen,sq_hui # speaker:sq_wen # mood:sq_wen=neutral
  你拱手出门。山脚路不窄，却仍有人走得快，有人要停一回。 # beat:sq_at_the_door_11 # scene:sq_door # cast:sq_wen,sq_hui # speaker:narrator
  -> afterwards
* [问眼下可要带一份回帖，承认自己能做的是这一次真送到。 # cid:sq_ask_ordinary]
  回山可有要带的？不是请您另写一篇诀窍。 # beat:sq_at_the_door_12 # scene:sq_door # cast:sq_wen,sq_hui # speaker:you
  带这封。别同那两卷抄件夹混，又叫人以为是我的返真笔记。 # beat:sq_at_the_door_13 # scene:sq_door # cast:sq_wen,sq_hui # speaker:sq_wen # mood:sq_wen=amused
  你将回帖放进袋侧。闻道尘追到门边，又问你路上可有卖茶的地方；方才那壶，他到底还想续上。 # beat:sq_at_the_door_14 # scene:sq_door # cast:sq_wen,sq_hui # speaker:narrator
  -> afterwards

=== afterwards ===
闻道尘后来活到一百一十余，最终没有返真。太玄后人更多叫他十四门会的闻道尘，而不是那个没能进去的门主。你后来写身后录，没有把他的笑改成已经预知会赢。 # beat:sq_afterwards_1 # scene:sq_after # cast:none # speaker:narrator
七问流出一部分，六大仍六大，八家仍八家，没有谁因此忽然多出三个返真。原卷、借阅、授课、验案，各要后来的人继续做。 # beat:sq_afterwards_2 # scene:sq_after # cast:none # speaker:narrator
{
- sq_route == 1 and not sq_water_ready:
伏牛那名腿伤门人三个月后重新走远路。你付过代差，给他另留慢班；后来同走一次，他走到湿石前先停了，你也等，不催他证明早已好全。 # beat:sq_afterwards_3 # scene:sq_after # cast:none # speaker:narrator
}
{
- sq_route == 2 and sq_water_ready:
旧院那名抄手养臂三个月，回来先接短课。你把代下的那份还他，没有拿自己曾救过他，便要求他照你留下的每一行写。 # beat:sq_afterwards_4 # scene:sq_after # cast:none # speaker:narrator
}
{
- sq_shared_tests and sq_witness:
最初同送的两家试痕副报仍在，往后的共同验案有人肯带你去做交接。亲见者当时留下的名字，终于不只在这一次危局里有用。 # beat:sq_afterwards_5 # scene:sq_after # cast:none # speaker:narrator
- else:
最初急送的试痕副报还欠过合核。你后来补走一趟，请两家亲见者共同署明，不让自己如今有常差便免了旧时没核完的活。 # beat:sq_afterwards_6 # scene:sq_after # cast:none # speaker:narrator
}
{
- sq_kept_time:
约定的那天，同伴按期离开。余下的回信由你跑，课由你补；来借书的人催到门口时，你才知道自己答应的剩下这一份有多重。 # beat:sq_afterwards_7 # scene:sq_after # cast:none # speaker:narrator
- else:
多请的那一日过去，同伴把你付的代差钱收好，替你约来下一班。你少了一份束脩，下一次开课便自己修那张旧凳，没再请木匠。 # beat:sq_afterwards_8 # scene:sq_after # cast:none # speaker:narrator
}
{
- sq_career == 1:
你把前两卷送出鹿门，同行的人会换，收件处也会换。有人只想抢先抄一句，你便等他把附注翻开，再说哪处还须问老师。到八月，接班者真站在路口，你没有让所有人永远等着同一个人回来。 # beat:sq_afterwards_9 # scene:sq_after # cast:none # speaker:narrator # ending:sq_shared_road
-> END
- else:
你在鹿门开一堂普通的读谱课，先收剑，再叫学生说今日哪里没懂。钥匙按议约交接，原卷封好；门外还有来借前两卷的人，你给他一处下次能问到人的日子，自己也留在那张桌旁。 # beat:sq_afterwards_10 # scene:sq_after # cast:none # speaker:narrator # ending:sq_open_lesson
-> END
}
