// Source: 宋世江湖6362–7787. Lu and Luo are separate people, two centuries apart.
VAR sr_far_question = false
VAR sr_line_shared = false
VAR sr_port_space = false
VAR sr_local_practice = false
VAR sr_loss_question = false
VAR sr_illness_plain = false
VAR sr_name_first = false
VAR sr_more_questions = false
VAR sr_repeat_plain = false
VAR sr_zhao_honest = false
VAR sr_teaching_daily = false
VAR sr_class_return = false
VAR sr_rule_demonstrate = false
VAR sr_old_visit = false
VAR sr_pages_plain = false
VAR sr_old_read = 0
VAR sr_canghe_answer = 0
VAR sr_first_mainland = 0
VAR sr_zhao_request = 0
VAR sr_own_answer = 0
VAR sr_gate_answer = 0
VAR sr_legacy = 0
-> old_first

=== old_first ===
午后，第四百余招。太极老人掌侧一转，你已从他原来守的那条线换出去，没停在上一招赢来的半步里。 # beat:sr_old_first_1 # scene:sr_oldarena # cast:sr_oldmaster # speaker:narrator
你是陆玄都，五十余岁。前一版总谱第三，前十中的七人已经问过，五胜两平；第二位又在两百余招后败给你。 # beat:sr_old_first_2 # scene:sr_oldarena # cast:sr_oldmaster # speaker:narrator
眼前这位极老的返真宗师，让你从上午打到日影斜过门槛。你的右脚刚落稳，他左掌又到了。 # beat:sr_old_first_3 # scene:sr_oldarena # cast:sr_oldmaster # speaker:narrator
再接这一手。 # beat:sr_old_first_4 # scene:sr_oldarena # cast:sr_oldmaster # speaker:sr_oldmaster # mood:sr_oldmaster=intent
他掌根一沉，你刚要抬的脚又踩实。地上那片斜阳离门槛更远了，老人仍没催，也没松开这一手。 # beat:sr_old_first_5 # scene:sr_oldarena # cast:sr_oldmaster # speaker:narrator
* [先踩实脚下，接住这一掌再转身。 # cid:sr_wait_weight]
  ~ sr_old_read = 1
  掌一搭便换了方向，你脚下转过去，肩边留出的路才真接上。他追来，你又得再变；落日到眼前，谁也没替谁少走最后一手。 # beat:sr_old_first_6 # scene:sr_oldarena # cast:sr_oldmaster # speaker:narrator
  -> first_name
* [让开肩前那一点，绕到掌外接下一手。 # cid:sr_release_full]
  ~ sr_old_read = 2
  你让掉一处似乎够近的落点。老人的掌从那儿穿过，没碰到你预备给他的肩；你从外侧回，手停到他已难再转的一线。 # beat:sr_old_first_7 # scene:sr_oldarena # cast:sr_oldmaster # speaker:narrator
  -> first_name

=== first_name ===
日落，老人自己停手。 # beat:sr_first_name_1 # scene:sr_oldarena # cast:sr_oldmaster # speaker:narrator
我输了。 # beat:sr_first_name_2 # scene:sr_oldarena # cast:sr_oldmaster # speaker:sr_oldmaster # mood:sr_oldmaster=intent
下一次总谱重修，陆玄都第一，五十三岁。旧录把接下来十余年的问手合记：十二位够分量的人，十胜两平，没有一败。有人夸那一代没有第二，你却没从这句话里再长出一座新山。 # beat:sr_first_name_3 # scene:sr_oldarena # cast:sr_oldmaster # speaker:narrator
这十余年里，六十前后你登少林住十一日，下山说很好；太极十七日，八卦也去。各家最深处的结果没有公开，后世的六大格局当时还没有成形。你又走西域、塞北、岭南，终于到了海边。 # beat:sr_first_name_4 # scene:sr_oldarena # cast:sr_oldmaster # speaker:narrator
{
- sr_old_read == 1:
那一日你先踩实了脚下才转。后来走西域、塞北、岭南，落脚处都还留着这一天的规矩：地稳了，手才敢让。 # beat:sr_first_name_5 # scene:sr_oldarena # cast:sr_oldmaster # speaker:narrator
- else:
绕到掌外那一步你记了半生。后来教人，头一件事便是让开对方以为必到的那一点——不是躲，是把回手的位置留给自己。 # beat:sr_first_name_6 # scene:sr_oldarena # cast:sr_oldmaster # speaker:narrator
}
* [问船人，过了眼前这班还能转到哪里。 # cid:sr_ask_farther]
  ~ sr_far_question = true
  出去，还能转到哪里？ # beat:sr_first_name_7 # scene:sr_oldshore # cast:sr_oldboat # speaker:you
  先过这一潮。下一处船有下一处船的主人，先生不是问我一声，就叫整片海都认得你。 # beat:sr_first_name_8 # scene:sr_oldshore # cast:sr_oldboat # speaker:sr_oldboat # mood:sr_oldboat=amused
  他指向泊在外头的小船，浪把两船间的一段水反复抬起。 # beat:sr_first_name_9 # scene:sr_oldshore # cast:sr_oldboat # speaker:narrator
  -> beyond_map
* [收起岸图，先看船人怎样等潮离岸。 # cid:sr_watch_tide]
  ~ sr_far_question = false
  你看船工等潮，不再催快半盏茶。地图上最外一条岸，在眼前仍有新船从后面出来。 # beat:sr_first_name_10 # scene:sr_oldshore # cast:sr_oldboat # speaker:narrator
  要去就等这班风。你在岸上多胜一场，浪也不会先照顾你一步。 # beat:sr_first_name_11 # scene:sr_oldshore # cast:sr_oldboat # speaker:sr_oldboat # mood:sr_oldboat=intent
  -> beyond_map

=== beyond_map ===
还没找到对手？ # beat:sr_beyond_map_1 # scene:sr_oldshore # cast:sr_oldboat # speaker:sr_oldboat # mood:sr_oldboat=neutral
有。 # beat:sr_beyond_map_2 # scene:sr_oldshore # cast:sr_oldboat # speaker:you
谁？ # beat:sr_beyond_map_3 # scene:sr_oldshore # cast:sr_oldboat # speaker:sr_oldboat # mood:sr_oldboat=surprised
不知道。中原这么大，外面只会更大。 # beat:sr_beyond_map_4 # scene:sr_oldshore # cast:sr_oldboat # speaker:you
{
- sr_far_question:
出去还能转到哪里——这一问后来真有人替你答了。蓬莱旧卷里那七年，起头便是另一班船的主人接的话。 # beat:sr_beyond_map_5 # scene:sr_oldshore # cast:sr_oldboat # speaker:narrator
- else:
你先看了船工怎样等潮。几年后到蓬莱，也先看岛上的人怎样过日子，才问他们的剑。 # beat:sr_beyond_map_6 # scene:sr_oldshore # cast:sr_oldboat # speaker:narrator
}
* [去外港问转船，先跟船工把这一箱搬上去。 # cid:sr_take_open_route]
  箱子不好下手，船工让你换到低的一头。你照做，脚下的船板随着第二个人上来，往下一沉。 # beat:sr_beyond_map_7 # scene:sr_oldshore # cast:sr_oldboat # speaker:narrator
  -> seven_years
* [先把岸图收进油布，按船人说的时辰到潮线外等。 # cid:sr_leave_closed_map]
  你把图叠小，油布边角压进包内。船人叫到第二声，你才发现他喊的是这班船，不是你的名字。 # beat:sr_beyond_map_8 # scene:sr_oldshore # cast:sr_oldboat # speaker:narrator
  -> seven_years

=== seven_years ===
几年后，天下第一失踪，无尸、无告别，连近人也不知去处。总谱等两次重修才撤名，旧录只留下陆玄都的名字，后面两个字：失踪。 # beat:sr_seven_years_1 # scene:sr_oldshore # cast:none # speaker:narrator
陆玄都先到蓬莱，停了七年。二十余场可靠记录里，有三百余招胜旧阁主，也有与孤岛老人连问两日、第三日各自离开而无胜负。 # beat:sr_seven_years_2 # scene:sr_oldshore # cast:none # speaker:narrator
蓬莱旧卷说，他离岛时比来时更高。再往外十余年，他确实遇过能令自己停步的人，最后在西海诸国留下天都门，再未回中原。 # beat:sr_seven_years_3 # scene:sr_oldshore # cast:none # speaker:narrator
陆玄都的终老、葬处与最后境界，旧卷都没有确证。岸上那个人已经走远。 # beat:sr_seven_years_4 # scene:sr_oldshore # cast:none # speaker:narrator
-> two_centuries

=== two_centuries ===
两百余年后，蓬莱。你是阿罗真，三十五岁，天都门弟子。西海诸国当地父母所生，九岁入门；汉文谱和汉话，从小都学过。 # beat:sr_two_centuries_1 # scene:sr_newshore # cast:sr_boatman # speaker:narrator
刀、拳、枪、剑，你从小换着学。二十五年轻第一，二十九三百余招胜六十余护法；三十三岁，又胜了来船的蓬莱武人一百四十余招。那人临走替你留了个船名，叫你去蓬莱看看。 # beat:sr_two_centuries_2 # scene:sr_newshore # cast:sr_boatman # speaker:narrator
如今你刚到北部蓬莱诸岛；去南偏深处东极归潮岛的船，还得另外转。阿汀把缆抛上岸，一个武馆弟子却踩住绳头，要他让船位。 # beat:sr_two_centuries_3 # scene:sr_newshore # cast:sr_boatman # speaker:narrator # cg:rigging # action:船位与缆
手放开。先说哪条船占你位置，我还系着这一头！ # beat:sr_two_centuries_4 # scene:sr_newshore # cast:sr_boatman # speaker:sr_boatman # mood:sr_boatman=sharp
你跨上岸边，拦在两人之间。汉文谱你从小会读，汉话也会说，口音却让围过来的人先猜你到底在叫他们停，还是叫船开。 # beat:sr_two_centuries_5 # scene:sr_newshore # cast:sr_boatman # speaker:narrator # cg:none
* [把缆交给阿汀，自己去拦推人的手。 # cid:sr_trust_line]
  ~ sr_line_shared = true
  船停。人，也先停。 # beat:sr_two_centuries_6 # scene:sr_newshore # cast:sr_boatman # speaker:you
  你摊掌朝下，阿汀听懂，压住船缆；武馆弟子仍推来，你不用一边顶他、一边把整条船也拉在手上。 # beat:sr_two_centuries_7 # scene:sr_newshore # cast:sr_boatman # speaker:narrator
  -> twelve
* [先把缆扣到熟悉的桩上，再拦推人的手。 # cid:sr_hold_line]
  ~ sr_line_shared = false
  你把这一扣亲自系好才回身。阿汀已经在另一侧撑住船，弟子见你不答，手又推到近处。 # beat:sr_two_centuries_8 # scene:sr_newshore # cast:sr_boatman # speaker:narrator
  我不是叫你开船。我叫你，先放人。 # beat:sr_two_centuries_9 # scene:sr_newshore # cast:sr_boatman # speaker:you
  你用了多一句，也终于把要拦的那只手拦住。 # beat:sr_two_centuries_10 # scene:sr_newshore # cast:sr_boatman # speaker:narrator
  -> twelve

=== twelve ===
第十二招，那武馆弟子倒地。你松开他腕子，他往后坐，压住了方才自己踩着的绳头。阿汀拽了两下，没拽动。 # beat:sr_twelve_1 # scene:sr_port # cast:sr_boatman,sr_young # speaker:narrator
你哪家？ # beat:sr_twelve_2 # scene:sr_port # cast:sr_boatman,sr_young # speaker:sr_young # mood:sr_young=uneasy
先让船靠稳。 # beat:sr_twelve_3 # scene:sr_port # cast:sr_boatman,sr_young # speaker:you
这边你摊手像请接招，船上我摊手是叫停。下回先指船，省得一条缆也得同你打一场。 # beat:sr_twelve_4 # scene:sr_port # cast:sr_boatman,sr_young # speaker:sr_boatman # mood:sr_boatman=amused
你笑了一下，又替他把绳头抽出来。对方师父闻讯赶来，先把弟子拉到身后，叫围观的人往外退。 # beat:sr_twelve_5 # scene:sr_port # cast:sr_boatman,sr_young # speaker:narrator
* [把岸上人让到缆外，自己接来拳，不借别人会跌水的地方逼胜。 # cid:sr_give_step]
  ~ sr_port_space = true
  岸边腾出一步，对方师父还是从正面进。你接住后看见他肘侧有一线，换到那里时，他已追不上你下一步。 # beat:sr_twelve_6 # scene:sr_port # cast:sr_boatman,sr_young # speaker:narrator
  -> forty_three
* [先请到桩外平地再问手，叫阿汀看船，自己承认岸上这一步仍得真接。 # cid:sr_take_open_ground]
  ~ sr_port_space = false
  你们移开船缆，他没有因此少用力。来拳从肩外逼入，你把近处一线放开，回手落到他第二步难接的位置。 # beat:sr_twelve_7 # scene:sr_port # cast:sr_boatman,sr_young # speaker:narrator
  -> forty_three

=== forty_three ===
四十三招，师父败。两日后当地名家再来，八十余招后也败。到第三场以后，蓬莱才认真问，这个西海人是谁。 # beat:sr_forty_three_1 # scene:sr_port # cast:sr_teacher,sr_boatman # speaker:narrator
天都门。 # beat:sr_forty_three_2 # scene:sr_port # cast:sr_teacher,sr_boatman # speaker:you
阿汀先把名字传给熟识的老海商。老人听到陆玄都，停了很久，终于取来蓬莱阁旧卷中能核的那一页。 # beat:sr_forty_three_3 # scene:sr_port # cast:sr_teacher,sr_boatman # speaker:narrator
七年。你们门里没记这一段？ # beat:sr_forty_three_4 # scene:sr_port # cast:sr_teacher,sr_boatman # speaker:sr_teacher # mood:sr_teacher=intent
只记他向外走了。 # beat:sr_forty_three_5 # scene:sr_port # cast:sr_teacher,sr_boatman # speaker:you
那你这回可别又只抄一个名字。 # beat:sr_forty_three_6 # scene:sr_port # cast:sr_teacher,sr_boatman # speaker:sr_teacher # mood:sr_teacher=neutral
你看见二十余场旧记录，其中有你从未听师父细说的两日无胜负。那幅祖像忽然不像一张早画完的天下地图。 # beat:sr_forty_three_7 # scene:sr_port # cast:sr_teacher,sr_boatman # speaker:narrator
{
- sr_line_shared:
往后转船的箱单也托你点。我接岸上的人，不替你先点收。 # beat:sr_forty_three_8 # scene:sr_port # cast:sr_teacher,sr_boatman # speaker:you
那今日先同我对一遍。你每只箱上那两个记号，我可猜不来。 # beat:sr_forty_three_9 # scene:sr_port # cast:sr_teacher,sr_boatman # speaker:sr_boatman # mood:sr_boatman=intent
你挪出一下午，同他逐只验清。原想当日再去的武馆，只好先托人递一句改日拜访。 # beat:sr_forty_three_10 # scene:sr_port # cast:sr_teacher,sr_boatman # speaker:narrator
- else:
往后行李、路钱还是我收。船位托你，你要开船，不用等我点箱。 # beat:sr_forty_three_11 # scene:sr_port # cast:sr_teacher,sr_boatman # speaker:you
好。到了港，我报哪家脚夫还在。你自己接，别又只顾着问武馆。 # beat:sr_forty_three_12 # scene:sr_port # cast:sr_teacher,sr_boatman # speaker:sr_boatman # mood:sr_boatman=neutral
阿汀先去交船钱。你收好箱单，武馆的人还在门外等，今日的拜访来得及。 # beat:sr_forty_three_13 # scene:sr_port # cast:sr_teacher,sr_boatman # speaker:narrator
}
{
- sr_port_space:
岸边让出的那一步，后来你写进开馆的头一课：不借别人会跌的地方赢。那年在码头腾出的不是一步，是往后每一个学你这门的人落脚的规矩。 # beat:sr_forty_three_14 # scene:sr_port # cast:sr_teacher,sr_boatman # speaker:narrator
- else:
先请到平地再问手，你连着三场都这么开口。蓬莱认真问你是谁，不只因为你赢，也因为每一场你都先把地方让清了。 # beat:sr_forty_three_15 # scene:sr_port # cast:sr_teacher,sr_boatman # speaker:narrator
}
* [留下来真学蓬莱的步与兵器，不只数祖师胜过几个。 # cid:sr_ask_local_method]
  ~ sr_local_practice = true
  先让我看你们怎么走这一步。旧卷可以晚一点再抄。 # beat:sr_forty_three_16 # scene:sr_port # cast:sr_teacher,sr_boatman # speaker:you
  那明日来，不替你祖师先赢今天这一次。 # beat:sr_forty_three_17 # scene:sr_port # cast:sr_teacher,sr_boatman # speaker:sr_teacher # mood:sr_teacher=intent
  阿汀把原来给你问好的下一班船划掉，先问你新住处的租钱还够不够。 # beat:sr_forty_three_18 # scene:sr_port # cast:sr_teacher,sr_boatman # speaker:narrator
  -> five_years
* [照旧卷找今日仍在教的地方，自己去问手，让旧名字成为真正见人的路。 # cid:sr_test_old_record]
  ~ sr_local_practice = false
  旧卷能指去处，不能让今天的主人先认你。你一处处敲门，遇见已改过的练法，又回来问为什么。 # beat:sr_forty_three_19 # scene:sr_port # cast:sr_teacher,sr_boatman # speaker:narrator
  我倒知道你这回留了。只看你每天出去挨问的地方，换得比船还勤。 # beat:sr_forty_three_20 # scene:sr_port # cast:sr_teacher,sr_boatman # speaker:sr_boatman # mood:sr_boatman=amused
  -> five_years

=== five_years ===
后来回看蓬莱五年，二十八场正式较艺：二十三胜、三平、两败。第一场败给阁中大长老，两百余招以后，自己的剑从手里脱出。 # beat:sr_five_years_1 # scene:sr_islandyard # cast:sr_elder # speaker:narrator
再拿起来？ # beat:sr_five_years_2 # scene:sr_islandyard # cast:sr_elder # speaker:sr_elder # mood:sr_elder=intent
你握空的那只手又伸了一下。剑落在两步外，大长老剑尖却还抵着你能过去拾剑的那条路。 # beat:sr_five_years_3 # scene:sr_islandyard # cast:sr_elder # speaker:narrator
{
- sr_local_practice:
你想起方才那一下：这几年在馆里改过的步，被他拆开还给你。熟悉的起脚，后半寸却被封住；你往侧边找，剑柄就滑了。 # beat:sr_five_years_4 # scene:sr_islandyard # cast:sr_elder # speaker:narrator
你在阁里练过这一步。再试，别照我的身子落脚。 # beat:sr_five_years_5 # scene:sr_islandyard # cast:sr_elder # speaker:sr_elder # mood:sr_elder=intent
- else:
你随身的纸上记着几处旧录剑路。大长老撤开剑尖，让你把纸压在石沿，在旧落点旁比一比自己刚才站的地方。 # beat:sr_five_years_6 # scene:sr_islandyard # cast:sr_elder # speaker:narrator
前人的脚到了。你自己的，还差这里。 # beat:sr_five_years_7 # scene:sr_islandyard # cast:sr_elder # speaker:sr_elder # mood:sr_elder=intent
}
* [拾起剑，请他再试刚才卸腕的半掌。 # cid:sr_ask_lost_grip]
  ~ sr_loss_question = true
  这里。我以为还能转回来。 # beat:sr_five_years_8 # scene:sr_islandyard # cast:sr_elder # speaker:you
  你从前赢的那一步，在我这里已经过了。往后退半掌，再接。 # beat:sr_five_years_9 # scene:sr_islandyard # cast:sr_elder # speaker:sr_elder # mood:sr_elder=intent
  你退了半掌再接，剑这次留在手里，却够不着他。你把脚收回来，请他慢一遍，自己照着再试。 # beat:sr_five_years_10 # scene:sr_islandyard # cast:sr_elder # speaker:narrator
  -> ninety_seven
* [先不拾剑，空手重走落剑前的那一步。 # cid:sr_try_without_sword]
  ~ sr_loss_question = false
  没剑以后，你肩仍先堵住自己的转身。大长老看你重走，脚下又截去半步。 # beat:sr_five_years_11 # scene:sr_islandyard # cast:sr_elder # speaker:narrator
  不是换一件兵器就过去。 # beat:sr_five_years_12 # scene:sr_islandyard # cast:sr_elder # speaker:you
  你承认这一回，再把剑拾起。今晚想记住的不是自己又多见一门。 # beat:sr_five_years_13 # scene:sr_islandyard # cast:sr_elder # speaker:narrator
  -> ninety_seven

=== ninety_seven ===
另一场对沧鹤老人，短得多。第九十七招，你自己停手认输。他脚边那块湿石始终没人踩到，你已经绕过它三回；下一回，掌缘还是会先到。 # beat:sr_ninety_seven_1 # scene:sr_lonelyisle # cast:sr_canghe # speaker:narrator
二十多年习武，头一回不到百招就收手。 # beat:sr_ninety_seven_2 # scene:sr_lonelyisle # cast:sr_canghe # speaker:narrator
前辈去过中原？ # beat:sr_ninety_seven_3 # scene:sr_lonelyisle # cast:sr_canghe # speaker:you
去过。 # beat:sr_ninety_seven_4 # scene:sr_lonelyisle # cast:sr_canghe # speaker:sr_canghe # mood:sr_canghe=neutral
那边这样的高手多么？ # beat:sr_ninety_seven_5 # scene:sr_lonelyisle # cast:sr_canghe # speaker:you
不多。肯定比蓬莱多。 # beat:sr_ninety_seven_6 # scene:sr_lonelyisle # cast:sr_canghe # speaker:sr_canghe # mood:sr_canghe=neutral
你眼睛又亮，手还没放下，已经往岸那边指。老人顺着你手指看了一眼，没动。 # beat:sr_ninety_seven_7 # scene:sr_lonelyisle # cast:sr_canghe # speaker:narrator
* [问怎样往更强处去，承认自己此刻仍最想打赢。 # cid:sr_ask_route_to_strong]
  ~ sr_canghe_answer = 1
  我还想去。看看比这更高的。 # beat:sr_ninety_seven_8 # scene:sr_lonelyisle # cast:sr_canghe # speaker:you
  你去中原为了什么？ # beat:sr_ninety_seven_9 # scene:sr_lonelyisle # cast:sr_canghe # speaker:sr_canghe # mood:sr_canghe=intent
  打。 # beat:sr_ninety_seven_10 # scene:sr_lonelyisle # cast:sr_canghe # speaker:you
  打完呢？ # beat:sr_ninety_seven_11 # scene:sr_lonelyisle # cast:sr_canghe # speaker:sr_canghe # mood:sr_canghe=neutral
  赢。 # beat:sr_ninety_seven_12 # scene:sr_lonelyisle # cast:sr_canghe # speaker:you
  赢完呢？ # beat:sr_ninety_seven_13 # scene:sr_lonelyisle # cast:sr_canghe # speaker:sr_canghe # mood:sr_canghe=neutral # camera:portrait # action:沧鹤 · 赢完呢
  你第一次没能接上下一句。 # beat:sr_ninety_seven_14 # scene:sr_lonelyisle # cast:sr_canghe # speaker:narrator
  -> win_after
* [先承认自己除了再打还想不出别的，不急着替远行找一个更体面的名。 # cid:sr_admit_no_answer]
  ~ sr_canghe_answer = 2
  我想再赢。还有什么，现在说不出。 # beat:sr_ninety_seven_15 # scene:sr_lonelyisle # cast:sr_canghe # speaker:you
  那便从这一句想。若赢完了呢？ # beat:sr_ninety_seven_16 # scene:sr_lonelyisle # cast:sr_canghe # speaker:sr_canghe # mood:sr_canghe=intent # camera:portrait # action:沧鹤 · 若赢完了呢
  你望着岸外还没走的海，竟没有因为它够大就得到一个答复。 # beat:sr_ninety_seven_17 # scene:sr_lonelyisle # cast:sr_canghe # speaker:narrator
  -> win_after

=== win_after ===
那你还没想好。 # beat:sr_win_after_1 # scene:sr_islandshore # cast:sr_canghe,sr_boatman # speaker:sr_canghe # mood:sr_canghe=neutral
你没有当夜顿悟。四十岁离蓬莱时，这句仍跟着。阿汀替你问好了转船：船人所谓西海是旧称，由中原要先出东海、再经蓬莱转去远海诸国，不是沿中原西岸寻一条近路。 # beat:sr_win_after_2 # scene:sr_islandshore # cast:sr_canghe,sr_boatman # speaker:narrator
你来时认的那条潮，五年后也得重问。到了那边，先认能回信的港。 # beat:sr_win_after_3 # scene:sr_islandshore # cast:sr_canghe,sr_boatman # speaker:sr_boatman # mood:sr_boatman=intent
一个多月海程，泉州登陆。你原想上岸便看看地方武馆，身子却先不答应，最后是被人抬下船。 # beat:sr_win_after_4 # scene:sr_islandshore # cast:sr_canghe,sr_boatman # speaker:narrator
{
- sr_canghe_answer == 1:
赢完呢——这一问你没能接上。海上一个多月，你没有答出；四十岁离岛，它仍跟着你，只是从逼问变成一张真买下的船票。 # beat:sr_win_after_5 # scene:sr_islandshore # cast:sr_canghe,sr_boatman # speaker:narrator
- else:
从这一句想起的问法你留着。后来每赢一场，都先往下多问一层；到真上船那日，你说得出的仍只有一句，却已经是你自己的。 # beat:sr_win_after_6 # scene:sr_islandshore # cast:sr_canghe,sr_boatman # speaker:narrator
}
* [请阿汀帮找住处与大夫，先承认站不住，不在码头硬演强者。 # cid:sr_accept_help]
  ~ sr_illness_plain = true
  先别问武馆。我现在走过去，怕要叫人以为是来讨一张床。 # beat:sr_win_after_7 # scene:sr_islandshore # cast:sr_canghe,sr_boatman # speaker:you
  肯早说，床也少替你走一段路。 # beat:sr_win_after_8 # scene:sr_islandshore # cast:sr_canghe,sr_boatman # speaker:sr_boatman # mood:sr_boatman=amused
  你躺下，连想笑都嫌胸口费力。 # beat:sr_win_after_9 # scene:sr_islandshore # cast:sr_canghe,sr_boatman # speaker:narrator
  -> twelve_days
* [先把船上该交的活说明，再请人抬到住处；不叫自己的病把整船货一并停在岸边。 # cid:sr_settle_ship_first]
  ~ sr_illness_plain = false
  你交完话，刚站一下便又坐回去。阿汀叫人抬你，自己先去接船务，这两件终于不用都挤在你一只发软的手里。 # beat:sr_win_after_10 # scene:sr_islandshore # cast:sr_canghe,sr_boatman # speaker:narrator
  今日若有人要问手，告诉他等我能端稳一碗汤。 # beat:sr_win_after_11 # scene:sr_islandshore # cast:sr_canghe,sr_boatman # speaker:you
  汤我替你问。船上的账，可得醒着同我对。 # beat:sr_win_after_12 # scene:sr_islandshore # cast:sr_canghe,sr_boatman # speaker:sr_boatman # mood:sr_boatman=amused
  -> twelve_days

=== twelve_days ===
足足十二日，水土不服。后来与南北榜和总谱交过手的你，此刻只想知道这碗汤能不能不翻。 # beat:sr_twelve_days_1 # scene:sr_quanzhou # cast:sr_innkeeper # speaker:narrator
放稳。烫的，别一口灌。 # beat:sr_twelve_days_2 # scene:sr_quanzhou # cast:sr_innkeeper # speaker:sr_innkeeper # mood:sr_innkeeper=intent
我以为凉了。 # beat:sr_twelve_days_3 # scene:sr_quanzhou # cast:sr_innkeeper # speaker:you
才从锅里舀的，哪里就凉。喝完把碗放这里，我得给外头那桌上菜。 # beat:sr_twelve_days_4 # scene:sr_quanzhou # cast:sr_innkeeper # speaker:sr_innkeeper # mood:sr_innkeeper=neutral
{
- sr_illness_plain:
早早认了站不住，床与汤都近。后来你向学生讲第一步，也先讲这个：先认自己此刻在哪里，才谈往哪里去。 # beat:sr_twelve_days_5 # scene:sr_quanzhou # cast:sr_innkeeper # speaker:narrator
- else:
船务没因你病停一日。十二日里你躺着仍把账目逐笔对了——认输的病与该交的话，你从那时起就分得清。 # beat:sr_twelve_days_6 # scene:sr_quanzhou # cast:sr_innkeeper # speaker:narrator
}
{
- sr_line_shared:
五年前那一下午对过的箱单，后来转船一直这样分。病时阿汀照单把物件和路钱交到店里，自己照开船。你少请一趟脚夫；醒来时，箱单折在药碗旁，末一只已由店家画了点。 # beat:sr_twelve_days_7 # scene:sr_quanzhou # cast:sr_innkeeper # speaker:narrator
- else:
按五年前说的，物件与路钱一直由你点收。如今站不起来，临时请店家接；阿汀得开本船，另请脚夫搬物、候一宿的费用从你行资里出。他仍帮你找好住处，把脚夫的姓名也留在箱单上。 # beat:sr_twelve_days_8 # scene:sr_quanzhou # cast:sr_innkeeper # speaker:narrator
}
* [把阿罗真写在药包旁，再写下新名罗天海。 # cid:sr_say_old_name]
  ~ sr_name_first = true
  你写得工整，店家照字又念一遍，没笑你的口音。门里汉文谱从小读，真到街上，原来连一个药包也得两个人肯听完。 # beat:sr_twelve_days_9 # scene:sr_quanzhou # cast:sr_innkeeper # speaker:narrator
  这是旧名。我自己再取个汉名，往后叫罗天海。 # beat:sr_twelve_days_10 # scene:sr_quanzhou # cast:sr_innkeeper # speaker:you
  你自己取的，我两个都记。今日先把汤喝完。 # beat:sr_twelve_days_11 # scene:sr_quanzhou # cast:sr_innkeeper # speaker:sr_innkeeper # mood:sr_innkeeper=amused
  -> name
* [报出新取的汉名罗天海，也告诉她旧名阿罗真。 # cid:sr_choose_han_name]
  ~ sr_name_first = false
  罗天海。阿罗真也是我，别把旧名那份药另算一个人。 # beat:sr_twelve_days_12 # scene:sr_quanzhou # cast:sr_innkeeper # speaker:you
  那我记同一页。多写个名字，不多算一碗汤。 # beat:sr_twelve_days_13 # scene:sr_quanzhou # cast:sr_innkeeper # speaker:sr_innkeeper # mood:sr_innkeeper=amused
  她把两名并排，药包押在纸角。你还想解释，外头又催上菜，她先应了一声，带着空盘走了。 # beat:sr_twelve_days_14 # scene:sr_quanzhou # cast:sr_innkeeper # speaker:narrator
  -> name

=== name ===
病好后，你走福建、江南、湖广、河洛。第一年先问地方榜，府榜前位多撑不到百招，路榜中段也少有能真压住你的。 # beat:sr_name_1 # scene:sr_mainlandyard # cast:sr_guest # speaker:narrator
江南八府会，有人在南榜末段人物面前起哄，西海罗天海敢不敢问南榜。 # beat:sr_name_2 # scene:sr_mainlandyard # cast:sr_guest # speaker:narrator
很强？ # beat:sr_name_3 # scene:sr_mainlandyard # cast:sr_guest # speaker:you
场中有人笑。对手却先让开一处能站的坪，手里的来招也没有跟那阵笑一同变轻。 # beat:sr_name_4 # scene:sr_mainlandyard # cast:sr_guest # speaker:narrator
{
- sr_name_first:
阿罗真三个字你到底写在了前头。后来榜录写罗天海，你从不让旧名从纸上消失——两个名字，一个是你来的地方，一个是你走出来的地方。 # beat:sr_name_5 # scene:sr_mainlandyard # cast:sr_guest # speaker:narrator
- else:
罗天海在前，阿罗真也在。中原的榜自此只记新名，你自己记账，仍旧一页两名。 # beat:sr_name_6 # scene:sr_mainlandyard # cast:sr_guest # speaker:narrator
}
* [先认他一步能进到哪里，接住第一轮真招，再把自己的问递过去。 # cid:sr_answer_with_distance]
  ~ sr_first_mainland = 1
  你没追笑声，眼睛一直在他的肩与脚。第一下比地方榜快，第二下却给你看清了一处转路；等他换回来，你已经跟到那一边。 # beat:sr_name_7 # scene:sr_mainlandyard # cast:sr_guest # speaker:narrator
  -> two_ten
* [主动换一次远近，看对方肯不肯随你走，不在自己熟的一圈里把两百招重打一遍。 # cid:sr_test_full_ground]
  ~ sr_first_mainland = 2
  你把距离放开又贴回，对手没有被一个新口音的人气得抢招。你得一次次换，到真能从他身侧续出的那一手才敢压过去。 # beat:sr_name_8 # scene:sr_mainlandyard # cast:sr_guest # speaker:narrator
  -> two_ten

=== two_ten ===
两百一十余招，罗天海胜。第二日以后，没人再拿你的口音起哄。 # beat:sr_two_ten_1 # scene:sr_mainlandyard # cast:sr_guest # speaker:narrator
以后你问前位，还会有别人。 # beat:sr_two_ten_2 # scene:sr_mainlandyard # cast:sr_guest # speaker:sr_guest # mood:sr_guest=intent
前十是不是更强？ # beat:sr_two_ten_3 # scene:sr_mainlandyard # cast:sr_guest # speaker:you
当然。差多少，自己去看。 # beat:sr_two_ten_4 # scene:sr_mainlandyard # cast:sr_guest # speaker:sr_guest # mood:sr_guest=amused
你并非总赢。后来胜过南榜三十余位与北榜末段，平过南榜中段，两百七十余招胜北榜二十余位；真正遇前位输下来，却仍只想知道再往上是哪一层。 # beat:sr_two_ten_5 # scene:sr_mainlandyard # cast:sr_guest # speaker:narrator
{
- sr_first_mainland == 1:
先接住再问——这法子后来你用了一辈子。连太极山上那位老人，也是先看你接得住，才肯反过来问你一句。 # beat:sr_two_ten_6 # scene:sr_mainlandyard # cast:sr_guest # speaker:narrator
- else:
肯把距离换开再贴回，这一手你后来教给学生。能随你换的人不多，肯随的，后来都成了值得再去的门。 # beat:sr_two_ten_7 # scene:sr_mainlandyard # cast:sr_guest # speaker:narrator
}
* [照对方指的地方继续找，不拿一场胜当所有中原武人的同一种答复。 # cid:sr_go_find_more]
  ~ sr_more_questions = true
  你去了，吃过败，也遇过打完肯讲两句的人。走回住处时，脚下反而比来前快，怕明日又错过能见一个人的时辰。 # beat:sr_two_ten_8 # scene:sr_mainlandyard # cast:sr_guest # speaker:narrator
  -> forty_eight
* [先回头重试自己没接明的一手，再往前，肯承认同一个人也值得再问。 # cid:sr_return_to_test]
  ~ sr_more_questions = false
  你多留几日，把那一下不肯完全懂的来路又试了。再走出去，旧对手没有因为你已赢过南榜便自动成了只配被略过的一页。 # beat:sr_two_ten_9 # scene:sr_mainlandyard # cast:sr_guest # speaker:narrator
  -> forty_eight

=== forty_eight ===
四十八岁，你来中原第八年，三百余招胜过总谱末段一位高手。这场私下问手没叫海外来客立刻被塞进南北榜的格子，你也没有等一个名次下来才再出门。 # beat:sr_forty_eight_1 # scene:sr_mainlandyard # cast:sr_oldfriend # speaker:narrator
还要问前面？ # beat:sr_forty_eight_2 # scene:sr_mainlandyard # cast:sr_oldfriend # speaker:sr_oldfriend # mood:sr_oldfriend=intent
要。 # beat:sr_forty_eight_3 # scene:sr_mainlandyard # cast:sr_oldfriend # speaker:you
五十一，对总谱中后段败；五十二再来，仍败；五十四第三次，才打成平手。那个人没有因见你第三次便少走自己真正会的路。 # beat:sr_forty_eight_4 # scene:sr_mainlandyard # cast:sr_oldfriend # speaker:narrator
{
- sr_more_questions:
照人指的地方一路找下去，你吃过败，也带回过肯讲两句的对手。这场三百余招的胜，头一个该谢的，是那些没把你当口音的院子。 # beat:sr_forty_eight_5 # scene:sr_mainlandyard # cast:sr_oldfriend # speaker:narrator
- else:
多留几日重试没接明的那一手，你把这习惯也带了回来。旧对手今天还在变，你便还在他身上有得问。 # beat:sr_forty_eight_6 # scene:sr_mainlandyard # cast:sr_oldfriend # speaker:narrator
}
* [把两次败里同一处没接住的变化再摆出来，不拿后来一平擦掉以前。 # cid:sr_admit_repeat]
  ~ sr_repeat_plain = true
  第二次我以为已经改了，其实只多换一门。 # beat:sr_forty_eight_7 # scene:sr_mainlandyard # cast:sr_oldfriend # speaker:you
  第三次才没忙着给我认你的门。 # beat:sr_forty_eight_8 # scene:sr_mainlandyard # cast:sr_oldfriend # speaker:sr_oldfriend # mood:sr_oldfriend=amused
  他在你肘外一碰，你才笑着让开，想请他再来。对方却收了手，指指天色：饭过了两顿，先吃。 # beat:sr_forty_eight_9 # scene:sr_mainlandyard # cast:sr_oldfriend # speaker:narrator
  -> wudang
* [再接他今日改过的一手，承认老对手也还在变。 # cid:sr_ask_present]
  ~ sr_repeat_plain = false
  你原想重走上回的位置，他却换了进路。你跟着退半步，第三次的平也没能替第四次先备好答案。 # beat:sr_forty_eight_10 # scene:sr_mainlandyard # cast:sr_oldfriend # speaker:narrator
  下回来，别只带一张三年前的我。 # beat:sr_forty_eight_11 # scene:sr_mainlandyard # cast:sr_oldfriend # speaker:sr_oldfriend # mood:sr_oldfriend=intent
  -> wudang

=== wudang ===
五十四岁，你到武当，和一位百余岁的玄门老人问手。百余招，你自己先停。他的脚还没移到你原来想逼去的位置，你再多送一掌，也只是把手肘递给他。 # beat:sr_wudang_1 # scene:sr_mountainyard # cast:sr_xuanmen # speaker:narrator
武当很深。 # beat:sr_wudang_2 # scene:sr_mountainyard # cast:sr_xuanmen # speaker:you
下山先歇歇腿。后面那几级石阶，雨刚停，比院里滑。 # beat:sr_wudang_3 # scene:sr_mountainyard # cast:sr_xuanmen # speaker:sr_xuanmen # mood:sr_xuanmen=neutral
少林也去过，没有公开战绩可拿来补一串胜名。五十五岁，江湖有人告诉你，太极山上赵无极还在。他百余岁，早退江湖，既非当代掌门，也不在现今总谱里。 # beat:sr_wudang_4 # scene:sr_mountainyard # cast:sr_xuanmen # speaker:narrator
{
- sr_repeat_plain:
两次败里同一处没接住，你当面摆过，没有拿第三次那场平盖过去。武当停手时你想起这件事——老人不问你的平，问的还是你输的样子。 # beat:sr_wudang_5 # scene:sr_mountainyard # cast:sr_xuanmen # speaker:narrator
- else:
老对手也在变——这一课你带上了武当。百余招你自己先停，因为你看见他的脚，正往你原来想逼去的位置外多走半寸。 # beat:sr_wudang_6 # scene:sr_mountainyard # cast:sr_xuanmen # speaker:narrator
}
* [照老人的住处上山，请问手，也请问自己的路。 # cid:sr_seek_zhao_plain]
  ~ sr_zhao_request = 1
  你上山时还以为，只要他够强，自己便能再学一门。过门第一眼却看见老人搬石头，一块一块，放到他要的地方。 # beat:sr_wudang_7 # scene:sr_mountainyard # cast:sr_xuanmen # speaker:narrator
  -> five_visits
* [先看看这位退居老人每日做什么，再开口，不把他的退隐当一座等你攻的榜。 # cid:sr_watch_zhao_work]
  ~ sr_zhao_request = 2
  老人正在搬石头。你看了半日，没看出一套暗藏的拳；石头确实从这边搬到了那边，院里空出一块能走的地。 # beat:sr_wudang_8 # scene:sr_mountainyard # cast:sr_xuanmen # speaker:narrator
  -> five_visits

=== five_visits ===
前辈练什么？ # beat:sr_five_visits_1 # scene:sr_zhaoyard # cast:sr_zhao # speaker:you
搬石头。 # beat:sr_five_visits_2 # scene:sr_zhaoyard # cast:sr_zhao # speaker:sr_zhao # mood:sr_zhao=neutral
年轻时呢？ # beat:sr_five_visits_3 # scene:sr_zhaoyard # cast:sr_zhao # speaker:you
什么都练。 # beat:sr_five_visits_4 # scene:sr_zhaoyard # cast:sr_zhao # speaker:sr_zhao # mood:sr_zhao=amused
你问能不能学，他不收。第一日如此，第二日如此，连着五日，都没因你能报出多少场战绩便改口。第五日，他终于反过来问。 # beat:sr_five_visits_5 # scene:sr_zhaoyard # cast:sr_zhao # speaker:narrator
你为什么要跟我学？ # beat:sr_five_visits_6 # scene:sr_zhaoyard # cast:sr_zhao # speaker:sr_zhao # mood:sr_zhao=intent
{
- sr_zhao_request == 1:
上山那日你直接请问手，也问自己的路。老人不收，五日不改口——你后来才懂，他把这两问当一问：答不出第二句，第一句便不算数。 # beat:sr_five_visits_7 # scene:sr_zhaoyard # cast:sr_zhao # speaker:narrator
- else:
你先看了半日他搬石头。第五日他反过来问你要什么时，你答得出他每日做什么——这半日，比二十几场胜更先让他抬头。 # beat:sr_five_visits_8 # scene:sr_zhaoyard # cast:sr_zhao # speaker:narrator
}
* [实说因为他比自己强，愿意从这里学起。 # cid:sr_zhao_stronger]
  ~ sr_zhao_honest = true
  因为你强，所以我想学。 # beat:sr_five_visits_9 # scene:sr_zhaoyard # cast:sr_zhao # speaker:you
  你学了这么多，哪一家是你的？ # beat:sr_five_visits_10 # scene:sr_zhaoyard # cast:sr_zhao # speaker:sr_zhao # mood:sr_zhao=neutral
  天都门。 # beat:sr_five_visits_11 # scene:sr_zhaoyard # cast:sr_zhao # speaker:you
  那是陆玄都的，是你师父的，是蓬莱和中原许多人的。你的呢？ # beat:sr_five_visits_12 # scene:sr_zhaoyard # cast:sr_zhao # speaker:sr_zhao # mood:sr_zhao=neutral
  -> whose_road
* [说自己每次遇到难处又换所学，却仍不知道哪里算自己的。 # cid:sr_zhao_lost]
  ~ sr_zhao_honest = false
  我从前以为学得够多，就总能再换一条。现在说不出哪一条是我。 # beat:sr_five_visits_13 # scene:sr_zhaoyard # cast:sr_zhao # speaker:you
  总算说到这里。天都是陆玄都和你师父的，你在蓬莱、中原又学了别人的。你的呢？ # beat:sr_five_visits_14 # scene:sr_zhaoyard # cast:sr_zhao # speaker:sr_zhao # mood:sr_zhao=neutral
  -> whose_road

=== whose_road ===
你答不上来。赵无极允许你留半年，不正式收你做弟子，也没拿一部完整秘谱替这半年包出一个结果。 # beat:sr_whose_road_1 # scene:sr_zhaoyard # cast:sr_zhao # speaker:narrator
他问你为什么退，你换了一式；他把木棍搁回原处，仍问为什么退。你再进一次，他侧过肩，你的棍头便撞到晾布的横杆。 # beat:sr_whose_road_2 # scene:sr_zhaoyard # cast:sr_zhao # speaker:narrator
这一回你没换式。你把木棍放下，直看着他。 # beat:sr_whose_road_3 # scene:sr_zhaoyard # cast:sr_zhao # speaker:narrator
你直接说对的不行？ # beat:sr_whose_road_4 # scene:sr_zhaoyard # cast:sr_zhao # speaker:you
我要知道，我就能替你返真？ # beat:sr_whose_road_5 # scene:sr_zhaoyard # cast:sr_zhao # speaker:sr_zhao # mood:sr_zhao=amused
你气得伸手去取棍，碰到晾布，又停下。赵无极已经把湿布移到另一头，回头仍在等你的答复。 # beat:sr_whose_road_6 # scene:sr_zhaoyard # cast:sr_zhao # speaker:narrator
{
- sr_zhao_honest:
因为他强——这一句你说出口便没收回。赵无极留你半年，不是被这句话打动，是这句里没有一个替自己遮的名字。 # beat:sr_whose_road_7 # scene:sr_zhaoyard # cast:sr_zhao # speaker:narrator
- else:
说不出哪一条是我。这句话你不肯换个体面的说法，半年里他也不再替你换。 # beat:sr_whose_road_8 # scene:sr_zhaoyard # cast:sr_zhao # speaker:narrator
}
* [下山后开个小馆，让普通学生把每天真能做的练习带回来，先听他们怎样用。 # cid:sr_teach_daily]
  ~ sr_teaching_daily = true
  你原本会让人多站半个时辰。第一个学徒说，站完还得去扛料；你看他回去举木，才知道自己说的松肩，在他的日子里到底卡在哪里。 # beat:sr_whose_road_9 # scene:sr_school # cast:none # speaker:narrator
  你把时辰拆短，叫他明日带着自己的难处再来。改课的工夫比你原想得长。 # beat:sr_whose_road_10 # scene:sr_school # cast:none # speaker:narrator
  -> twelve_students
* [下山后开个小馆，让学生两两接住对方的步，教他们能指出彼此真正站错的地方。 # cid:sr_teach_pair]
  ~ sr_teaching_daily = false
  你把一次练习停在两人之间，没替较慢的那人迈完。他们先互说哪里难，再请你看。收工迟的学生只能另约一班，课得分成两次，能跟上的人却开始自己接着练。 # beat:sr_whose_road_11 # scene:sr_school # cast:none # speaker:narrator
  -> twelve_students

=== twelve_students ===
这一留便是两年。江南小馆，十二名普通弟子，站、走、拳、刀。木工把扛料的搭肩布搭在门边，卖鱼人挪开凳子，先问今日几时散。 # beat:sr_twelve_students_1 # scene:sr_school # cast:sr_carpenter,sr_seller # speaker:narrator
师父，做活能抬，一来这里就僵。再站半个时辰，明早那副门框怕抬不稳。 # beat:sr_twelve_students_2 # scene:sr_school # cast:sr_carpenter,sr_seller # speaker:sr_carpenter # mood:sr_carpenter=uneasy
那就先看他这一下。我今日也不能多留，集上欠的秤钱还没收。 # beat:sr_twelve_students_3 # scene:sr_school # cast:sr_carpenter,sr_seller # speaker:sr_seller # mood:sr_seller=intent
先放下来。你今天做活那一下，走给我看。 # beat:sr_twelve_students_4 # scene:sr_school # cast:sr_carpenter,sr_seller # speaker:you
他走得比你说的短，放下木料时，后脚还要再挪一次。你跟着试，第一回也多挪了那一步。 # beat:sr_twelve_students_5 # scene:sr_school # cast:sr_carpenter,sr_seller # speaker:narrator
木工以为做错，赶忙要从头走。你拉住他，叫卖鱼人把凳子移过来：再抬一次，慢些。两年的课，常常这样拖过原定时辰。 # beat:sr_twelve_students_6 # scene:sr_school # cast:sr_carpenter,sr_seller # speaker:narrator
{
- sr_teaching_daily:
木工带回扛料时压住的一步，卖鱼人带来湿地收脚的急。你花更多时辰跟到门外去看；他们能来馆里的日子不齐，轮到同练时仍常要你从头接起。 # beat:sr_twelve_students_7 # scene:sr_school # cast:sr_carpenter,sr_seller # speaker:narrator
- else:
他们开始互看脚下，卖鱼人帮木工指出退时先转肩，木工替她试进身。两人能自己接一轮，轮班不能来的第三人却落了几课，你另抽两晚补回，没把互练当人人已有空闲。 # beat:sr_twelve_students_8 # scene:sr_school # cast:sr_carpenter,sr_seller # speaker:narrator
}
* [再出门问手前，把下一班怎样接清楚，留下自己会回来的日子。 # cid:sr_leave_class_in_turn]
  ~ sr_class_return = true
  我出去也会输。回来，你们照旧问，别见我带一场赢就把不会的都吞回去。 # beat:sr_twelve_students_9 # scene:sr_school # cast:sr_carpenter,sr_seller # speaker:you
  那师父也别见我们没练好，就说出门回来再问。 # beat:sr_twelve_students_10 # scene:sr_school # cast:sr_carpenter,sr_seller # speaker:sr_seller # mood:sr_seller=amused
  你把归期写在门边，留给下一班真能看见。 # beat:sr_twelve_students_11 # scene:sr_school # cast:sr_carpenter,sr_seller # speaker:narrator
  -> fifty_eight
* [给每人留一项够得着的小练习，再出门；回来先看这项，不许用一堆新招盖过去。 # cid:sr_leave_short_work]
  ~ sr_class_return = false
  你逐个看过才留，没写一本能叫人照着熬满半年的大谱。十二个人的难处不同，回来的时候也得逐个接。 # beat:sr_twelve_students_12 # scene:sr_school # cast:sr_carpenter,sr_seller # speaker:narrator
  师父得认自己写的字。我替你在门里收好，别回来装不认识。 # beat:sr_twelve_students_13 # scene:sr_school # cast:sr_carpenter,sr_seller # speaker:sr_carpenter # mood:sr_carpenter=amused
  -> fifty_eight

=== fifty_eight ===
五十八复出，一百八十余招胜总谱二十余位；两百余招平前二十。第三位原定问手的人，见过两场，自己不问了。 # beat:sr_fifty_eight_1 # scene:sr_mainlandyard # cast:sr_challenger # speaker:narrator
以前你身上有很多家，现在像你自己。 # beat:sr_fifty_eight_2 # scene:sr_mainlandyard # cast:sr_challenger # speaker:sr_challenger # mood:sr_challenger=intent
哪里像？ # beat:sr_fifty_eight_3 # scene:sr_mainlandyard # cast:sr_challenger # speaker:you
以前看你换手，认得出几家。今日那两场，我等你换，等完了，也没等到。 # beat:sr_fifty_eight_4 # scene:sr_mainlandyard # cast:sr_challenger # speaker:sr_challenger # mood:sr_challenger=neutral
你没有因为这句话就当已经跨过去。回到小馆，还有十二个人等你看上次留下的脚步。 # beat:sr_fifty_eight_5 # scene:sr_mainlandyard # cast:sr_challenger # speaker:narrator
{
- sr_teaching_daily:
卖鱼人照着自己湿地收脚的难处练，终于敢把一筐鱼放稳再转身。木工却还等你来认，几次代课接不下去。你少接了一次远处的邀约，留在馆里把普通同练也重新教给他们。 # beat:sr_fifty_eight_6 # scene:sr_school # cast:sr_carpenter,sr_seller # speaker:narrator
- else:
木工与卖鱼人能替下一班看一轮，你回来先听他们讲，再亲手接没讲通的地方。晚班那人仍缺课，你留下原定访友的一夜补他；能代课不等于能把每个人都托给两个熟手。 # beat:sr_fifty_eight_7 # scene:sr_school # cast:sr_carpenter,sr_seller # speaker:narrator
}
{
- sr_class_return:
门边的归期我没擦。你这一回倒早了一晚。 # beat:sr_fifty_eight_8 # scene:sr_school # cast:sr_carpenter,sr_seller # speaker:sr_seller # mood:sr_seller=intent
你没接会散后再问一场的邀请，赶上这班课。她把旧日期抹去，等你写下一次，才肯让开门边。 # beat:sr_fifty_eight_9 # scene:sr_school # cast:sr_carpenter,sr_seller # speaker:narrator
- else:
各人的纸都在这里。师父先看，别忙着出下一题。 # beat:sr_fifty_eight_10 # scene:sr_school # cast:sr_carpenter,sr_seller # speaker:sr_carpenter # mood:sr_carpenter=intent
十二张纸摊开，有两张把同一处都练反了。你收起会场带回的新谱，先蹲下来，请那两人把错的一步走给你看。 # beat:sr_fifty_eight_11 # scene:sr_school # cast:sr_carpenter,sr_seller # speaker:narrator
}
-> sixty_one

=== sixty_one ===
六十一，旧对手再来。前五十余招，他把你从前会换出的几家一一逼出来；你没急着选一门给他看，他反而一次次接不到原来等着的那个转法。 # beat:sr_sixty_one_1 # scene:sr_mainlandyard # cast:sr_oldfriend # speaker:narrator
这一手哪来的？ # beat:sr_sixty_one_2 # scene:sr_mainlandyard # cast:sr_oldfriend # speaker:sr_oldfriend # mood:sr_oldfriend=intent
第六十余招，他在你肘外一扣，问得很快。你刚要报名字，才发现报不出一个能把眼前动作装进去的名字。 # beat:sr_sixty_one_3 # scene:sr_mainlandyard # cast:sr_oldfriend # speaker:narrator
{
- sr_loss_question:
当年在蓬莱，你为免剑脱手往后退半掌。如今空着的手收回来，那半掌已在身侧；旧对手贴进来，你没再往脚后找。 # beat:sr_sixty_one_4 # scene:sr_mainlandyard # cast:sr_oldfriend # speaker:narrator
- else:
当年在蓬莱，你丢开剑重走一遍，才看清肩先挡了转身。如今对方又压这一侧，你肩头未动，脚已在他能跟来的地方落稳。 # beat:sr_sixty_one_5 # scene:sr_mainlandyard # cast:sr_oldfriend # speaker:narrator
}
* [不追着给招取名，先接眼前的人，把这一下真正走完。 # cid:sr_follow_person]
  ~ sr_own_answer = 1
  你顺着那只仍会变的手向侧边走，他肩一转，你也不留在上一刻的路里。又二十余招，掌从侧面递出，停在他后颈之前。 # beat:sr_sixty_one_6 # scene:sr_mainlandyard # cast:sr_oldfriend # speaker:narrator
  -> own_hand
* [让脑里争着抢先的各家名字过去，脚下只留还能接到对方的那一步。 # cid:sr_release_school]
  ~ sr_own_answer = 2
  你没有凭一句放空就忽然多出力气。来招仍真，脚下仍得接。二十余招后，手从身侧续上，终于停在他已不及转身的后颈。 # beat:sr_sixty_one_7 # scene:sr_mainlandyard # cast:sr_oldfriend # speaker:narrator
  -> own_hand

=== own_hand ===
这次，好像是我的。 # beat:sr_own_hand_1 # scene:sr_mainlandyard # cast:sr_oldfriend # speaker:you
歇过再问，第二轮四十余招，旧对手自己停下。 # beat:sr_own_hand_2 # scene:sr_mainlandyard # cast:sr_oldfriend # speaker:narrator
你进去了。 # beat:sr_own_hand_3 # scene:sr_mainlandyard # cast:sr_oldfriend # speaker:sr_oldfriend # mood:sr_oldfriend=intent
什么时候？ # beat:sr_own_hand_4 # scene:sr_mainlandyard # cast:sr_oldfriend # speaker:you
我怎么知道。刚才只剩你一个。 # beat:sr_own_hand_5 # scene:sr_mainlandyard # cast:sr_oldfriend # speaker:sr_oldfriend # mood:sr_oldfriend=amused
六十一，返真。你还站在原处，旧对手先走到水缸边，拿走了你本来伸手要取的那只碗。 # beat:sr_own_hand_6 # scene:sr_mainlandyard # cast:sr_oldfriend # speaker:narrator
都这岁数了，你这回连什么时候进去的都要问我。 # beat:sr_own_hand_7 # scene:sr_mainlandyard # cast:sr_oldfriend # speaker:sr_oldfriend # mood:sr_oldfriend=amused
{
- sr_own_answer == 1:
不追名字，先接眼前的人。后来立门分三条主传，你说这便是那天的第二层：接人，不是接谱。 # beat:sr_own_hand_8 # scene:sr_mainlandyard # cast:sr_oldfriend # speaker:narrator
- else:
各家的名字过去了，脚下那一步留下了。你后来说学我者，不得终于我——那一掌停在后颈之前，就是终了你自己的地方。 # beat:sr_own_hand_9 # scene:sr_mainlandyard # cast:sr_oldfriend # speaker:narrator
}
-> new_gate

=== new_gate ===
你写信往天都门。祖师出了中原，你进了中原；走到这里，却不想再只替一个已经有的名字添下去。 # beat:sr_new_gate_1 # scene:sr_school # cast:sr_carpenter,sr_seller # speaker:narrator
回信过海来，只有一句正中你要问的地方：开你自己的门。 # beat:sr_new_gate_2 # scene:sr_school # cast:sr_carpenter,sr_seller # speaker:narrator
那我们往后叫哪家？ # beat:sr_new_gate_3 # scene:sr_school # cast:sr_carpenter,sr_seller # speaker:sr_carpenter # mood:sr_carpenter=intent
天海宗。 # beat:sr_new_gate_4 # scene:sr_school # cast:sr_carpenter,sr_seller # speaker:you
江淮一处有山、有水、商路四通的地方，不占六大根本之地。天海宗不是天都门中原分舵，更不是东极归潮岛的海天门。你立拳、兵、行三条主传，不让每个人都把自己的身子练成一份罗天海。 # beat:sr_new_gate_5 # scene:sr_school # cast:sr_carpenter,sr_seller # speaker:narrator
* [请两名学生各把自己能续的一步走出来，再谈新门要留下什么。 # cid:sr_rule_try]
  ~ sr_rule_demonstrate = true
  木工先走，卖鱼人没照着他的脚去站。你轮流接，手里试出的距离不同，后退的位置也不同。 # beat:sr_new_gate_6 # scene:sr_school # cast:sr_carpenter,sr_seller # speaker:narrator
  不必先问像不像我。先看这一回，自己能不能接住下一个人。 # beat:sr_new_gate_7 # scene:sr_school # cast:sr_carpenter,sr_seller # speaker:you
  -> gate_rule
* [请他们说哪一种教法还让人跟不上，开门第一日先给改法留位置。 # cid:sr_rule_ask]
  ~ sr_rule_demonstrate = false
  不能来同一班的人，也要有地方问。 # beat:sr_new_gate_8 # scene:sr_school # cast:sr_carpenter,sr_seller # speaker:sr_seller # mood:sr_seller=intent
  还有已经学过的人，别一句知道了就把后面的话堵回去。 # beat:sr_new_gate_9 # scene:sr_school # cast:sr_carpenter,sr_seller # speaker:sr_carpenter # mood:sr_carpenter=neutral
  你听完，把本来准备先挂上去的旧课表取下来，三个人在门边改到天黑。 # beat:sr_new_gate_10 # scene:sr_school # cast:sr_carpenter,sr_seller # speaker:narrator
  -> gate_rule

=== gate_rule ===
你写下门规：学我者，不得终于我。卖鱼人看完，说得了，明早她那班先照新时辰来，别等匾漆干才开门。 # beat:sr_gate_rule_1 # scene:sr_newhall # cast:sr_carpenter,sr_seller # speaker:narrator
开门头三年，问手不断。三百余招平总谱前十五，一百二十余招胜南榜前五。有六大长老留七日，没人替那七日捏出一张公开胜负单，只留一句，这个门立得住。 # beat:sr_gate_rule_2 # scene:sr_newhall # cast:sr_carpenter,sr_seller # speaker:narrator
{
- sr_teaching_daily:
旧馆那次代课接不下去，没被你藏在新匾后面。你把出门请客的时辰分一半给普通同练，亲手教两人怎样看第三个人，不能每次都说等宗主回来。木工终于能带一班，自己也少接了几日整活。 # beat:sr_gate_rule_3 # scene:sr_newhall # cast:sr_carpenter,sr_seller # speaker:narrator
- else:
旧馆两人接得住的课，在新门还接着。可分班时的缺口也一同带来，你给晚班留了固定时辰，不因新客来问就总挪。卖鱼人愿意代看早班，却说清赶集日不能来，你得另找肯接的人。 # beat:sr_gate_rule_4 # scene:sr_newhall # cast:sr_carpenter,sr_seller # speaker:narrator
}
{
- sr_rule_demonstrate:
开门先让两人各走各的一步——门规头一条便是这么来的。学我者，不得终于我，写的不是客气，是那天你轮流接手时量出的两段不同距离。 # beat:sr_gate_rule_5 # scene:sr_newhall # cast:sr_carpenter,sr_seller # speaker:narrator
- else:
哪一种教法还跟不上，第一日就有人当众答了。门规写在改完的课表后头，所以它一挂上去，就有人能照着走。 # beat:sr_gate_rule_6 # scene:sr_newhall # cast:sr_carpenter,sr_seller # speaker:narrator
}
* [有人要称第七大派时，说新门还太年轻，留给后人来证明。 # cid:sr_admit_young_gate]
  ~ sr_gate_answer = 1
  因为我还没死。等我死一百年，它还站着，再谈。 # beat:sr_gate_rule_7 # scene:sr_newhall # cast:sr_carpenter,sr_seller # speaker:you
  那这匾先不替你多添一字。饭总不能等一百年，里头那桌先吃。 # beat:sr_gate_rule_8 # scene:sr_newhall # cast:sr_carpenter,sr_seller # speaker:sr_seller # mood:sr_seller=amused
  -> seventh
* [有人要称第七大派时，先问自己不在以后谁还能继续教。 # cid:sr_ask_next_teacher]
  ~ sr_gate_answer = 2
  我还活着，哪里就算到头了。等我死一百年，你再看它还站不站着。 # beat:sr_gate_rule_9 # scene:sr_newhall # cast:sr_carpenter,sr_seller # speaker:you
  那先叫后边那班进来，别把一百年的人都堵在今天门外。 # beat:sr_gate_rule_10 # scene:sr_newhall # cast:sr_carpenter,sr_seller # speaker:sr_carpenter # mood:sr_carpenter=amused
  -> seventh

=== seventh ===
你笑着把来客带进门，没把江湖抬来的大称呼用来压住眼前这些还要吃饭、赶集、交班的人。 # beat:sr_seventh_1 # scene:sr_newhall # cast:sr_carpenter,sr_seller # speaker:narrator
往后的岁月，你到返真中段附近，并未走到后段。年长后，排行的帖子渐渐少接；真有人远来，你常指向院里，让他先找徒弟。 # beat:sr_seventh_2 # scene:sr_newhall # cast:sr_carpenter,sr_seller # speaker:narrator
{
- sr_gate_answer == 1:
太年轻，留给后人——这句话后来常被引。引的人多半不知道，你说时心里想的是祖堂那两幅旧图：没有一幅占满整面墙。 # beat:sr_seventh_3 # scene:sr_newhall # cast:sr_carpenter,sr_seller # speaker:narrator
- else:
你先问了自己不在以后谁教。门人追问下一代还能不能接住，你没有替尚未发生的事许诺，只叫他明日来接一班课，自己留下看他怎样教。 # beat:sr_seventh_4 # scene:sr_newhall # cast:sr_carpenter,sr_seller # speaker:narrator
}
* [晚年少接远行，把能教的日子留在院中，亲眼看别人怎样不再照你走。 # cid:sr_late_teach]
  ~ sr_legacy = 1
  先找我徒弟。找完觉得我教得不对，再来问我。 # beat:sr_seventh_5 # scene:sr_newhall # cast:sr_carpenter,sr_seller # speaker:you
  年轻时总想多打一场，今日你把一张请帖翻过来，记下明早院里谁还要来。 # beat:sr_seventh_6 # scene:sr_newhall # cast:sr_carpenter,sr_seller # speaker:narrator
  推掉这一次，就少见一个也许值得见的人。你没有把留下说成天下所有路都已看完。 # beat:sr_seventh_7 # scene:sr_newhall # cast:sr_carpenter,sr_seller # speaker:narrator
  -> late_choice
* [晚年把自己走过的海路讲给后来的出行人，让他们问清自己的下一程。 # cid:sr_late_sea]
  ~ sr_legacy = 2
  你少去一班自己还想看的课，坐到来信人与年轻弟子之间，讲怎样转船、怎样问一个陌生人真正肯说的话。 # beat:sr_seventh_8 # scene:sr_newhall # cast:sr_carpenter,sr_seller # speaker:narrator
  我走过的只够把你送到那里。到了以后，别拿我这封信当所有人都欠你的请帖。 # beat:sr_seventh_9 # scene:sr_newhall # cast:sr_carpenter,sr_seller # speaker:you
  弟子把下一班接起来，你得忍住不每隔一刻便回头改他的手。 # beat:sr_seventh_10 # scene:sr_newhall # cast:sr_carpenter,sr_seller # speaker:narrator
  -> late_choice

=== late_choice ===
一位八十余岁的总谱旧友来访。你们问过一百余招，没留下胜负，便坐下喝酒。 # beat:sr_late_choice_1 # scene:sr_lateyard # cast:sr_latefriend # speaker:narrator
还有什么遗憾？ # beat:sr_late_choice_2 # scene:sr_lateyard # cast:sr_latefriend # speaker:sr_latefriend # mood:sr_latefriend=amused
来中原晚了。能多打十年。 # beat:sr_late_choice_3 # scene:sr_lateyard # cast:sr_latefriend # speaker:you
话出口，你自己先笑。 # beat:sr_late_choice_4 # scene:sr_lateyard # cast:sr_latefriend # speaker:narrator
也不对。早十年，我还是从前那个我。 # beat:sr_late_choice_5 # scene:sr_lateyard # cast:sr_latefriend # speaker:you
旧友还在笑，笑得桌边酒洒了，伸袖去擦又被你拦住。你把盏往自己这边挪，他便把壶拿过去，没再让你先倒。 # beat:sr_late_choice_6 # scene:sr_lateyard # cast:sr_latefriend # speaker:narrator
* [留旧友再坐一阵，明早的课照常，不把这一夜急着写成后世定论。 # cid:sr_keep_old_visit]
  ~ sr_old_visit = true
  你们说起从前接错的一步，谁也不替谁少记。说累了便停，院外人听见的笑比招名多。 # beat:sr_late_choice_7 # scene:sr_lateyard # cast:sr_latefriend # speaker:narrator
  -> old_pages
* [请他留到明早看后辈接课，散课后再喝。 # cid:sr_show_next_class]
  ~ sr_old_visit = false
  第二日，旧友陪你在门边看课。年轻人接得有不稳的地方，也有你没先教的转法。旧友才抬手，你便按住他，等那两人走完。 # beat:sr_late_choice_8 # scene:sr_lateyard # cast:sr_latefriend # speaker:narrator
  散课以后，昨夜没喝完的酒重新温上。旧友说早知还要看半天，昨夜就不该让你先收酒壶。 # beat:sr_late_choice_9 # scene:sr_lateyard # cast:sr_latefriend # speaker:narrator
  -> old_pages

=== old_pages ===
又过了一些年，你已百余岁。一份据说是陆玄都晚年所记的残卷辗转来到，只有几十页。转交的人说不清它何时成卷；真伪与最后年代都没有全证，更不能证明祖师尚在人世。 # beat:sr_old_pages_1 # scene:sr_lateyard # cast:sr_successor # speaker:narrator
其中一页写着：不是没有路，只是我站在自己的地图尽头。纸角已经残了，下一行还辨得出几个字：走自己的。 # beat:sr_old_pages_2 # scene:sr_lateyard # cast:sr_successor # speaker:narrator
祖师，我没给你丢人。 # beat:sr_old_pages_3 # scene:sr_lateyard # cast:sr_successor # speaker:you
这卷要放在最前面么？ # beat:sr_old_pages_4 # scene:sr_lateyard # cast:sr_successor # speaker:sr_successor # mood:sr_successor=intent
年轻人抱着那几十页，等你一句。你看见他手上仍带今早练过的薄灰。 # beat:sr_old_pages_5 # scene:sr_lateyard # cast:sr_successor # speaker:narrator
{
- sr_old_visit:
那一夜留旧友多坐的一阵，谁也没少记谁接错的一步。后来残卷到你手里，你先想起的也是这个：真话都在没急着散的桌上说过。 # beat:sr_old_pages_6 # scene:sr_lateyard # cast:sr_successor # speaker:narrator
- else:
旧友看了半日后辈接课才走，临别说你院里的人不像你。你答本来就不该像——这句你后来也用来回那句学我者，不得终于我。 # beat:sr_old_pages_7 # scene:sr_lateyard # cast:sr_successor # speaker:narrator
}
* [让他把来历与疑处一并留下，卷可以读，不能替祖师编一个已经证明的终局。 # cid:sr_pages_as_question]
  ~ sr_pages_plain = true
  疑处也写进去。我走过的，你能问我；我没见过的，不替我说见过。 # beat:sr_old_pages_8 # scene:sr_lateyard # cast:sr_successor # speaker:you
  他取一张旁注，记下转交来路。写到成卷年月，笔尖停住，抬头看你；你摇头，他便把那一格空下。 # beat:sr_old_pages_9 # scene:sr_lateyard # cast:sr_successor # speaker:narrator
  -> last_room
* [把残卷同后来人的新路记放在一处，注明据说，不让后来的脚步全停在一个旧名下。 # cid:sr_pages_beside_routes]
  ~ sr_pages_plain = false
  注明据说。再把你们新走的那几条也放来，别叫这一叠把后面的都压住。 # beat:sr_old_pages_10 # scene:sr_lateyard # cast:sr_successor # speaker:you
  他把旧卷轻轻放平，旁边留出能再添纸的地方。你看了一会，叫他明早照常去练，别为摆卷误了自己的脚。 # beat:sr_old_pages_11 # scene:sr_lateyard # cast:sr_successor # speaker:narrator
  -> last_room

=== last_room ===
你合上残卷，指尖还压着纸角。院外有人来，你先问他带了什么，后来弟子却说那人是来请你看课的。你才把卷交给他，起身往门外走。 # beat:sr_last_room_1 # scene:sr_lateyard # cast:sr_successor # speaker:narrator
{
- sr_legacy == 1:
晚来的学生走一手与你不同的拳。你想开口，先停了；他把下一步接上，才问你方才为什么皱眉。你让他再走，自己也起身试了一次。今日少去的一场远游，换成这一步能当面问完。 # beat:sr_last_room_2 # scene:sr_lateyard # cast:sr_successor # speaker:narrator
不是照你做的。 # beat:sr_last_room_3 # scene:sr_lateyard # cast:sr_successor # speaker:sr_successor # mood:sr_successor=amused
我看见了。再来。 # beat:sr_last_room_4 # scene:sr_lateyard # cast:sr_successor # speaker:you
- else:
年轻出行人带来一封海上回信，不是你旧日认得的船。你问清谁接下一港，他把自己的安排讲完，没照你当年的时辰出发。你把信还给他，回头去听弟子已经带完的那班课，几处改法得等下课再问。 # beat:sr_last_room_5 # scene:sr_lateyard # cast:sr_successor # speaker:narrator
他问的港，旧图上还没有。 # beat:sr_last_room_6 # scene:sr_lateyard # cast:sr_successor # speaker:sr_successor # mood:sr_successor=amused
那就把地方留给他写。 # beat:sr_last_room_7 # scene:sr_lateyard # cast:sr_successor # speaker:you
}
-> after_life

=== after_life ===
罗天海一生一百二十余年。他身后，第二代宗主入化很深，却未返真；第三代再出返真。门没有因为少一个祖师就把每张椅子空着等他回来，后面一代代接下去，天海宗才成八家之一。 # beat:sr_after_life_1 # scene:sr_afterhall # cast:none # speaker:narrator
祖堂悬两幅旧图，陆玄都由中原而海，罗天海由海而中原。没有一幅占满整面墙。门中人经过时，外院仍有拳声，临行的人仍在问下一班船。 # beat:sr_after_life_2 # scene:sr_afterhall # cast:none # speaker:narrator
{
- sr_pages_plain:
残卷前留着那张成卷年月未填的旁注。后来借卷的人问过那一格，门里仍答不知道；抄本就连空格和转交来路一同抄去。 # beat:sr_after_life_3 # scene:sr_afterhall # cast:none # speaker:narrator
- else:
残卷与新路记同架。有人寻最新的一条航路，先抽走了后添的纸；要问祖师的旧路，还得回来翻那几十页上写着据说的来历。 # beat:sr_after_life_4 # scene:sr_afterhall # cast:none # speaker:narrator
}
{
- sr_legacy == 1:
你留下的院门没有把人关在你的那一步。后来有人问祖师最会什么，学生先走出自己的拳，再说：他肯看我们重来。 # beat:sr_after_life_5 # scene:sr_afterhall # cast:none # speaker:narrator # ending:sr_open_courtyard
-> END
- else:
地图被后来人的手添出一处新港。那里不必叫罗天海，也不必有你的塑像；有人肯继续走，便有人会把回信送到下一岸。 # beat:sr_after_life_6 # scene:sr_afterhall # cast:none # speaker:narrator # ending:sr_next_harbor
-> END
}
