// Source: 宋世江湖24156–28497; first volume, fixed Jiang death and genuine-object state.
VAR jt_pov = 0
VAR jt_checked_vault = false
VAR jt_escape = 0
VAR jt_name_plain = false
VAR jt_auction_watch = false
VAR jt_took_real = false
VAR jt_plain_pack = false
VAR jt_shared_turn = false
VAR jt_bound_wound = false
VAR jt_bread_shared = false
VAR jt_truth_patience = false
VAR jt_temple_word = 0
VAR jt_waited_craft = false
VAR jt_fake_motif = 0
VAR jt_cover_apprentice = false
VAR jt_ordinary_day = false
VAR jt_cart_call = 0
VAR jt_last_action = 0
VAR jt_future = 0
VAR jt_last_trade = false
VAR jt_kept_ordinary = false
-> threshold

=== threshold ===
隔着密库的砖壁，拍卖庄园里有人正说，直指返真的秘密也不过这个价。另一个声音更低，说皇家山河，买到的未必只是一套剑。 # beat:jt_threshold_1 # scene:jt_vault # cast:none # speaker:narrator
你先听见脚步。不是竞价的人，是往库房来的守卫。盒子还扣着，进来的路得留一条出去。 # beat:jt_threshold_2 # scene:jt_vault # cast:none # speaker:narrator
* [沈玉娘 · 从地道探入。 # cid:jt_be_shen]
  ~ jt_pov = 1
  你收起衣摆，踩稳最后一层砖。上方忽然有碎灰落下来，这地方竟还有另一个人。 # beat:jt_threshold_3 # scene:jt_vault # cast:none # speaker:narrator
  -> viewpoint
* [江十七 · 从屋顶垂下。 # cid:jt_be_jiang]
  ~ jt_pov = 2
  你把绳扣压回梁后。地道口刚亮一线，有个人先你一步到了盒边。 # beat:jt_threshold_4 # scene:jt_vault # cast:none # speaker:narrator
  -> viewpoint

=== viewpoint ===
夜 · 富商庄园密库。两条路在同一只盒子前碰上，谁都没先叫守卫。 # beat:jt_viewpoint_1 # scene:jt_vault # cast:none # speaker:narrator
{
- jt_pov == 1:
你是沈玉娘，三十五岁，药材商遗孀的外衣下，是内廷密使。父亲曾在内库任职，你识旧物验记；上面给你的任务只有取璧，知道太多的人，自己判断。 # beat:jt_viewpoint_2 # scene:jt_vault # cast:jt_jiang # speaker:narrator
丈夫确实早亡。你没打算同屋顶落下的人讲这些，先看他有没有把出路堵死。 # beat:jt_viewpoint_3 # scene:jt_vault # cast:jt_jiang # speaker:narrator
你走错路？ # beat:jt_viewpoint_4 # scene:jt_vault # cast:jt_jiang # speaker:jt_jiang # mood:jt_jiang=surprised
你也是？ # beat:jt_viewpoint_5 # scene:jt_vault # cast:jt_jiang # speaker:you
他落地时很轻，手没离开衣侧。不像来替主家看盒的人。 # beat:jt_viewpoint_6 # scene:jt_vault # cast:jt_jiang # speaker:narrator
- else:
你是江十七，家里排行十七，盗门出身。父亲二十年前死于争璧，长辈说皇家杀人、璧本归江湖；你信了多年，却没亲见那一夜。 # beat:jt_viewpoint_7 # scene:jt_vault # cast:jt_shen # speaker:narrator
眼前女子的衣料是常走商会的人才肯花的钱，身法却不肯把背留给你。你不能只看一眼便知道她受谁的命。 # beat:jt_viewpoint_8 # scene:jt_vault # cast:jt_shen # speaker:narrator
你走错路？ # beat:jt_viewpoint_9 # scene:jt_vault # cast:jt_shen # speaker:you
你也是？ # beat:jt_viewpoint_10 # scene:jt_vault # cast:jt_shen # speaker:jt_shen # mood:jt_shen=intent
她没抬声叫人。你这才把落到盒边的绳尾捡起。 # beat:jt_viewpoint_11 # scene:jt_vault # cast:jt_shen # speaker:narrator
}
* [先看门闩、侧墙与守卫脚步，记住能退的一处。 # cid:jt_read_exit]
  ~ jt_checked_vault = true
  你挪到门影下，数到外面两人一前一后。侧墙后有条窄廊，闩从里面能挑，出去后却得有人压住响声。 # beat:jt_viewpoint_12 # scene:jt_vault # cast:none # speaker:narrator
  -> empty_box
* [先查盒与摆放痕迹，免得守着假位置等真货，退路只记来处。 # cid:jt_read_box]
  ~ jt_checked_vault = false
  盒底干净，尘却在旁边留一道浅印。东西确实临时挪过。你省下一回无用的找，侧墙那条路却没细看。 # beat:jt_viewpoint_13 # scene:jt_vault # cast:none # speaker:narrator
  -> empty_box

=== empty_box ===
盒盖开了。空的。真璧临时换过地方，这一趟谁也没拿到。门外靴尖停在砖缝旁，火光从缝里斜进来。 # beat:jt_empty_box_1 # scene:jt_vault # cast:none # speaker:narrator # cg:emptyBox # action:匣中 · 空
{
- jt_pov == 1:
先走错出去，还是再等它自己回来？ # beat:jt_empty_box_2 # scene:jt_vault # cast:jt_jiang # speaker:jt_jiang # mood:jt_jiang=uneasy
先出去再说。 # beat:jt_empty_box_3 # scene:jt_vault # cast:jt_jiang # speaker:you # cg:none
有道理。这回我信你一句。 # beat:jt_empty_box_4 # scene:jt_vault # cast:jt_jiang # speaker:jt_jiang # mood:jt_jiang=amused
- else:
先出去再说。 # beat:jt_empty_box_5 # scene:jt_vault # cast:jt_shen # speaker:jt_shen # mood:jt_shen=intent
有道理。盒子既然空，留给下一位先高兴一下。 # beat:jt_empty_box_6 # scene:jt_vault # cast:jt_shen # speaker:you # cg:none
她看你一眼，没笑出声，手却已摸向灯芯。 # beat:jt_empty_box_7 # scene:jt_vault # cast:jt_shen # speaker:narrator
}
* [合力熄灯、引响，各把看见的出口告诉对方。 # cid:jt_work_together]
  ~ jt_escape = 1
  你朝另一侧弹一粒碎砖，灯跟着灭了。来者先往响处转，你们从同一处门影退，两个人的脚步只留出一串。 # beat:jt_empty_box_8 # scene:jt_vault # cast:none # speaker:narrator
  往里那一步空。跟着我这边。 # beat:jt_empty_box_9 # scene:jt_vault # cast:none # speaker:you
  后面那人应得很低，手压住要弹回去的门闩。 # beat:jt_empty_box_10 # scene:jt_vault # cast:none # speaker:narrator
  -> first_escape
* [先从自己来的路退，不把没摸清的人带上备用路。 # cid:jt_go_alone]
  ~ jt_escape = 2
  你先转身走，另一人没追着抓你。出了砖墙，才发现守卫换过班，旧的安静处已有人。你躲在檐下，听见另一侧也有衣摆擦墙。 # beat:jt_empty_box_11 # scene:jt_vault # cast:none # speaker:narrator
  两个人都出来了，却各自留着半条只够自己认的路。 # beat:jt_empty_box_12 # scene:jt_vault # cast:none # speaker:narrator
  -> first_escape
* {jt_checked_vault} [假扮争执，把守卫引向已看过的门闩死角。 # cid:jt_fake_quarrel]
  ~ jt_escape = 3
  我先来的，你倒还敢说是你的？ # beat:jt_empty_box_13 # scene:jt_vault # cast:none # speaker:you
  另一人接得比你快，向盒边一推。守卫进来要抓人，脚步正被半开的门挡住；你们从侧墙错开，出门才把争的那口气放下。 # beat:jt_empty_box_14 # scene:jt_vault # cast:none # speaker:narrator
  -> first_escape

=== first_escape ===
庄园外墙，远处的席还在摆。真货明夜才要上台，两个人还得回来。 # beat:jt_first_escape_1 # scene:jt_wall # cast:none # speaker:narrator
{
- jt_pov == 1:
为什么要这东西？ # beat:jt_first_escape_2 # scene:jt_wall # cast:jt_jiang # speaker:jt_jiang # mood:jt_jiang=neutral
卖钱。 # beat:jt_first_escape_3 # scene:jt_wall # cast:jt_jiang # speaker:you
缺多少？ # beat:jt_first_escape_4 # scene:jt_wall # cast:jt_jiang # speaker:jt_jiang # mood:jt_jiang=amused
很多。 # beat:jt_first_escape_5 # scene:jt_wall # cast:jt_jiang # speaker:you
丈夫欠债？ # beat:jt_first_escape_6 # scene:jt_wall # cast:jt_jiang # speaker:jt_jiang # mood:jt_jiang=neutral
死了。 # beat:jt_first_escape_7 # scene:jt_wall # cast:jt_jiang # speaker:you
这句是真的。你停了一下，他也没顺着把死者笑下去。 # beat:jt_first_escape_8 # scene:jt_wall # cast:jt_jiang # speaker:narrator
你呢？ # beat:jt_first_escape_9 # scene:jt_wall # cast:jt_jiang # speaker:you
家传。 # beat:jt_first_escape_10 # scene:jt_wall # cast:jt_jiang # speaker:jt_jiang # mood:jt_jiang=neutral
你家传的在人家密库？ # beat:jt_first_escape_11 # scene:jt_wall # cast:jt_jiang # speaker:you
被偷了。 # beat:jt_first_escape_12 # scene:jt_wall # cast:jt_jiang # speaker:jt_jiang # mood:jt_jiang=uneasy
- else:
你为什么要这东西？ # beat:jt_first_escape_13 # scene:jt_wall # cast:jt_shen # speaker:jt_shen # mood:jt_shen=neutral
家传。 # beat:jt_first_escape_14 # scene:jt_wall # cast:jt_shen # speaker:you
你家传的在人家密库？ # beat:jt_first_escape_15 # scene:jt_wall # cast:jt_shen # speaker:jt_shen # mood:jt_shen=sharp
被偷了。你呢？ # beat:jt_first_escape_16 # scene:jt_wall # cast:jt_shen # speaker:you
卖钱。 # beat:jt_first_escape_17 # scene:jt_wall # cast:jt_shen # speaker:jt_shen # mood:jt_shen=neutral
缺多少？ # beat:jt_first_escape_18 # scene:jt_wall # cast:jt_shen # speaker:you
很多。 # beat:jt_first_escape_19 # scene:jt_wall # cast:jt_shen # speaker:jt_shen # mood:jt_shen=neutral
丈夫欠债？ # beat:jt_first_escape_20 # scene:jt_wall # cast:jt_shen # speaker:you
死了。 # beat:jt_first_escape_21 # scene:jt_wall # cast:jt_shen # speaker:jt_shen # mood:jt_shen=uneasy
你原想再接一句，见她没拿这句求你信，便把话咽回去。丈夫是真是假，你此刻仍不知道。 # beat:jt_first_escape_22 # scene:jt_wall # cast:jt_shen # speaker:narrator
}
* [先给真名字，别的还不肯讲，不拿一个姓名保证全部来历。 # cid:jt_give_name]
  ~ jt_name_plain = true
  沈玉娘。江十七。两个名字落在墙影里，至少这一次谁也没编。你们没交换门帖，约的只是明夜别先把另一人引到刀下。 # beat:jt_first_escape_23 # scene:jt_wall # cast:none # speaker:narrator
  -> old_story
* [先约明夜哪里碰面，名字随后答，承认还不愿交底。 # cid:jt_ask_way]
  ~ jt_name_plain = false
  你先报一处自己能到的门角，问另一人是否肯来。两人互不全信，仍把真名字留了下来：沈玉娘，江十七。明夜多一个能叫住的人，也多一个不能乱叫的名。 # beat:jt_first_escape_24 # scene:jt_wall # cast:none # speaker:narrator
  -> old_story

=== old_story ===
次日，地下席位还没坐满，替主家招客的人已经把玉说出了两副价钱：给江湖人讲悟剑，给贵客讲受命山河。 # beat:jt_old_story_1 # scene:jt_market # cast:jt_broker # speaker:narrator
观潮剑柳观河，三年后胜了旧对手，谁没听过？一百三十余招！他说，看这个。 # beat:jt_old_story_2 # scene:jt_market # cast:jt_broker # speaker:jt_broker # mood:jt_broker=amused
你挤在人外，先听清他少讲了哪一句。柳当年把十剑删到七剑、再到五剑，肯让位置；不是一块玉替他拿剑。返真老剑客也曾说，玉没教他，是他自己想明白。 # beat:jt_old_story_3 # scene:jt_market # cast:jt_broker # speaker:narrator
何况宁王赵元祁也认过。皇家东西，凭你能问全用途？ # beat:jt_old_story_4 # scene:jt_market # cast:jt_broker # speaker:jt_broker # mood:jt_broker=neutral
他不提御前老人那句，卖玉的若拿玉便能当皇帝，天下早乱。你也没拿宁王的名字当今日皇帝已经下过取物令。 # beat:jt_old_story_5 # scene:jt_market # cast:jt_broker # speaker:narrator
* [留意谁送匣、谁换手，让漂亮传闻先自己讲，记真货进场的路。 # cid:jt_watch_pass]
  ~ jt_auction_watch = true
  你跟的是端匣人的脚。他走到后门先等了一名护卫，没往台上直去；那一转，比台前又添的一个绝学名更有用。 # beat:jt_old_story_6 # scene:jt_market # cast:jt_broker # speaker:narrator
  -> auction
* [混进买主间问去路，把谁要抢、哪门已堵记下，再认送匣人。 # cid:jt_hear_buyers]
  ~ jt_auction_watch = false
  有人说主家收完钱还要把玉抢回。你以为他酒多，又见主家的人把外门多上了一道闩，才不笑了。 # beat:jt_old_story_7 # scene:jt_market # cast:jt_broker # speaker:narrator
  -> auction

=== auction ===
真璧终于进场。黑青，金线并不处处整齐，西角一块银补把缺口连回。有人还没把第一轮价报完，后墙先炸，灯灭了一排。 # beat:jt_auction_1 # scene:jt_auction # cast:jt_broker # speaker:narrator
诸位，东西先不要—— # beat:jt_auction_2 # scene:jt_auction # cast:jt_broker # speaker:jt_broker # mood:jt_broker=surprised
话没说完，匣已换第二个人的手。至少五方准备来抢，主家自己也算一方。你把刚才看过的门与现在涌来的火对起来，原来的退路只剩一半。 # beat:jt_auction_3 # scene:jt_auction # cast:jt_broker # speaker:narrator
* [先认银补与实际持匣的人，再接对方腾出的一步，不扑第一只漂亮盒。 # cid:jt_wait_real]
  ~ jt_took_real = true
  第一匣飞到台下，你没去追。真璧还在火光另一侧，银补一闪，手从衣袖间露出来。你向同伴点那一处，两人往同一个东西去。 # beat:jt_auction_4 # scene:jt_auction # cast:jt_broker # speaker:narrator
  -> four_hands
* [先拨开被推到台边的伙计，让同伴盯住真璧，随后接手出路。 # cid:jt_clear_person]
  ~ jt_took_real = false
  你让伙计蹲到台脚。他原以为又要被抓作挡刀的人，抬头才看见你已转去接另一侧。同伴没因你先拉一个人，便让第四次换手的璧失了踪。 # beat:jt_auction_5 # scene:jt_auction # cast:jt_broker # speaker:narrator
  -> four_hands

=== four_hands ===
玉在四人手间换过，最后落到你们这一双合起来的手里。往外的人群忽然逆着挤，沈的脚下木板断了一块。 # beat:jt_four_hands_1 # scene:jt_auction # cast:none # speaker:narrator
江十七先把她拽回台侧，自己肩撞在木柱。她站稳便去接匣，没有叫他顶着人群替自己争一句谢。第一次江救沈，不因先前那句家传是真是假而停。 # beat:jt_four_hands_2 # scene:jt_auction # cast:none # speaker:narrator
{
- jt_pov == 1:
以后若还说买卖，挑个肯真卖的。 # beat:jt_four_hands_3 # scene:jt_auction # cast:jt_jiang # speaker:jt_jiang # mood:jt_jiang=uneasy
你家传的，倒也得先向五家讨。 # beat:jt_four_hands_4 # scene:jt_auction # cast:jt_jiang # speaker:you
那不是拍卖。大家先礼貌坐一会儿。 # beat:jt_four_hands_5 # scene:jt_auction # cast:jt_jiang # speaker:jt_jiang # mood:jt_jiang=amused
- else:
她脚刚稳，你肩旁仍麻。你不打算趁这一下便问出她背后是谁。 # beat:jt_four_hands_6 # scene:jt_auction # cast:jt_shen # speaker:narrator
那不是拍卖。大家先礼貌坐一会儿。 # beat:jt_four_hands_7 # scene:jt_auction # cast:jt_shen # speaker:you
礼数完了。走。 # beat:jt_four_hands_8 # scene:jt_auction # cast:jt_shen # speaker:jt_shen # mood:jt_shen=intent
}
{
- jt_escape == 2:
你们各自留过的退路没接上。库墙那条窄廊响起追兵，另一人不知道你藏的门，你也叫不清他从哪边退。 # beat:jt_four_hands_9 # scene:jt_kitchen # cast:none # speaker:narrator
只好绕膳房，热水泼地，脚下一滑，沈袖口擦过破瓦。她用布勒住小臂，没把还能动当成没伤。你们失了一份替换衣料，才从杂物门钻出。 # beat:jt_four_hands_10 # scene:jt_kitchen # cast:none # speaker:narrator
- else:
先前共同认过的门闩还在。一个压住回弹，另一个挤过侧廊，没把后面的人留去猜。追兵听见的是另一头碰落的碗，你们从暗处出了庄墙。 # beat:jt_four_hands_11 # scene:jt_sidehall # cast:none # speaker:narrator
衣袋里少了一根早抛在库中的绳，人却都能自己用两手攀墙。那一趟先说出的退处，现在终于接成两个人的路。 # beat:jt_four_hands_12 # scene:jt_sidehall # cast:none # speaker:narrator
}
* [先把玉入普通行囊，再分清谁看路、谁换衣，不继续举着黑市匣跑。 # cid:jt_change_load]
  ~ jt_plain_pack = true
  华丽匣子被丢到另一条路。你们把真玉裹低，肩上终于只是常见的行囊；当晚仍有追兵看破，不再是人人隔半条街都能认。 # beat:jt_four_hands_13 # scene:jt_sidehall # cast:none # speaker:narrator
  -> pursuers
* [先换出城方向，把显眼匣盖拆去另藏，进城后再找普通箱。 # cid:jt_change_path]
  ~ jt_plain_pack = false
  你们没有沿最短一条官道走。拆下的匣盖引走一拨人，剩下的人问起铺家，你们又得另付一宿钱换落脚处。 # beat:jt_four_hands_14 # scene:jt_sidehall # cast:none # speaker:narrator
  -> pursuers

=== pursuers ===
一路三百里，不只一拨人追：内廷、盗门、黑市原主，还有闻风来的地方门派。你们每躲过一处，都少点干粮，也多知道另一人的一句话哪里站不住。 # beat:jt_pursuers_1 # scene:jt_road # cast:none # speaker:narrator
{
- jt_pov == 1:
你认得一处接令旧记，先把江引往另一边。他看见你认路太快，没再信你只是去找药商。 # beat:jt_pursuers_2 # scene:jt_road # cast:jt_jiang # speaker:narrator
你卖钱这条路，过关过得比送药还熟。 # beat:jt_pursuers_3 # scene:jt_road # cast:jt_jiang # speaker:jt_jiang # mood:jt_jiang=intent
你说的家传，也没带一张家里认得的旧账。 # beat:jt_pursuers_4 # scene:jt_road # cast:jt_jiang # speaker:you
你没拆他，他也没逼你当场拆自己。 # beat:jt_pursuers_5 # scene:jt_road # cast:jt_jiang # speaker:narrator
- else:
你在路上认出本门留的引路记，没告诉她全意。她从你绕开那家客店的速度，看出你并非只在找家传东西。 # beat:jt_pursuers_6 # scene:jt_road # cast:jt_shen # speaker:narrator
既是你家传，怎么连从谁手里出都要问旁人？ # beat:jt_pursuers_7 # scene:jt_road # cast:jt_shen # speaker:jt_shen # mood:jt_shen=intent
我家丢得早。你买卖做得这样熟，倒也不必每站换一家铺。 # beat:jt_pursuers_8 # scene:jt_road # cast:jt_shen # speaker:you
她收好行囊，没当街抓住这句追问。 # beat:jt_pursuers_9 # scene:jt_road # cast:jt_shen # speaker:narrator
}
* [在下一个路口把自己能说的退路讲明，承认还隐着来历。 # cid:jt_share_next_turn]
  ~ jt_shared_turn = true
  前面左侧能绕。我没把全部告诉你，这一段是真的。 # beat:jt_pursuers_10 # scene:jt_road # cast:none # speaker:you
  另一人走到分岔先等了一步，不再靠猜谁忽然变了方向。追来的三人扑进空巷，你们从后院接上了路。 # beat:jt_pursuers_11 # scene:jt_road # cast:none # speaker:narrator
  -> broken_span
* [仍留一条独退处，只约走散后哪里碰，不借共同逃命逼对方交底。 # cid:jt_keep_spare]
  ~ jt_shared_turn = false
  你把见面处说清，退路仍各留。两个人绕不同巷，夜里又在同一座桥前遇见，多走的一段让脚底磨开，谁也没说自己一直在原地等。 # beat:jt_pursuers_12 # scene:jt_road # cast:none # speaker:narrator
  -> broken_span

=== broken_span ===
旧木桥中段松了。沈先过去一半，脚下木条向河侧翘，江从桥头扑前一步，抓她后背衣带，把人拉回还能落脚的横梁。 # beat:jt_broken_span_1 # scene:jt_bridge # cast:none # speaker:narrator
第二次江救沈。桥那端有人喊你们把玉抛来，沈却先伸手拉江的腕，没拿已经站稳的一步先走。 # beat:jt_broken_span_2 # scene:jt_bridge # cast:none # speaker:narrator
追兵的暗器随后到了。沈用随身短刃挡开贴近江颈侧的一枚，另一枚擦过她衣袖。江看见袖上新口子，原先预备问的话忽然说不出来。 # beat:jt_broken_span_3 # scene:jt_bridge # cast:none # speaker:narrator
* [先替她包好袖边，再走低处涉水，不在桥上赌还能多接几枚。 # cid:jt_bind_sleeve]
  ~ jt_bound_wound = true
  布从衣里拆，勒得不算好看，至少不让血继续洇。你们绕到浅水，鞋湿透了，桥上的人再追时已得另找下脚处。 # beat:jt_broken_span_4 # scene:jt_bridge # cast:none # speaker:narrator
  -> temple_laugh
* [先扶人退到树后，挡住再来的一线，包扎请她自己选松紧。 # cid:jt_move_to_bank]
  ~ jt_bound_wound = false
  你们退到岸边树后，包布递到沈手里。她自己压住伤处，告诉江哪边还使得上力，才借他一只手继续走。 # beat:jt_broken_span_5 # scene:jt_bridge # cast:none # speaker:narrator
  -> temple_laugh

=== temple_laugh ===
废庙，夜里只剩雨。玉放在中间，黑青的边、旧银补和新沾的泥，怎么看都不像能替人解开眼前这一团。 # beat:jt_temple_laugh_1 # scene:jt_temple # cast:none # speaker:narrator
{
- jt_pov == 1:
你说，这东西到底有什么？ # beat:jt_temple_laugh_2 # scene:jt_temple # cast:jt_jiang # speaker:jt_jiang # mood:jt_jiang=neutral
不知道。 # beat:jt_temple_laugh_3 # scene:jt_temple # cast:jt_jiang # speaker:you
不知道还拼命抢？ # beat:jt_temple_laugh_4 # scene:jt_temple # cast:jt_jiang # speaker:jt_jiang # mood:jt_jiang=uneasy
你不是？ # beat:jt_temple_laugh_5 # scene:jt_temple # cast:jt_jiang # speaker:you
他想了一会儿，说也是。你们第一次一起笑，笑完，伤处仍要换布。 # beat:jt_temple_laugh_6 # scene:jt_temple # cast:jt_jiang # speaker:narrator
- else:
你说，这东西到底有什么？ # beat:jt_temple_laugh_7 # scene:jt_temple # cast:jt_shen # speaker:you
不知道。 # beat:jt_temple_laugh_8 # scene:jt_temple # cast:jt_shen # speaker:jt_shen # mood:jt_shen=neutral
不知道还拼命抢？ # beat:jt_temple_laugh_9 # scene:jt_temple # cast:jt_shen # speaker:you
你不是？ # beat:jt_temple_laugh_10 # scene:jt_temple # cast:jt_shen # speaker:jt_shen # mood:jt_shen=amused
你想了想。也是。两个人笑起来，不像终于猜到了答案，倒像头一回准自己承认没猜到。 # beat:jt_temple_laugh_11 # scene:jt_temple # cast:jt_shen # speaker:narrator
}
* [把剩下的饼分开，各认一半路费，不把救过一回算成拿玉的份额。 # cid:jt_share_bread]
  ~ jt_bread_shared = true
  饼边有点硬，你们各拿一半。江把一枚旧铜钱推给沈，说先留着，下回买软一点的，不要又把药钱也算成粮钱。 # beat:jt_temple_laugh_12 # scene:jt_temple # cast:none # speaker:narrator
  她收了钱，没收他把命也随手算进去的那种口气。 # beat:jt_temple_laugh_13 # scene:jt_temple # cast:none # speaker:narrator
  -> first_order
* [先把接下来要花的钱算清，少一宿客店，饼仍两人各有一半。 # cid:jt_count_cost]
  ~ jt_bread_shared = false
  算到最后只省得一宿客店，你们又各掰一半饼。江把一枚旧铜钱推过去，笑说剩这点，别真再拿去做大买卖。 # beat:jt_temple_laugh_14 # scene:jt_temple # cast:none # speaker:narrator
  沈把钱收在自己衣内，没随玉放。此时它只是一枚能买一点饼的钱。 # beat:jt_temple_laugh_15 # scene:jt_temple # cast:none # speaker:narrator
  -> first_order

=== first_order ===
第三个月，一封新信把能暂时不问的事推到眼前。你们都已知道对方不像最初说的那个人，还没把最后一层纸揭开。 # beat:jt_first_order_1 # scene:jt_lodging # cast:none # speaker:narrator
{
- jt_pov == 1:
你收到内廷六个字：得璧。绝旁知者。读完烧掉，灰很轻，江十七睡在几步之外。你坐了半夜，没有拔刀。 # beat:jt_first_order_2 # scene:jt_lodging # cast:jt_jiang # speaker:narrator
次日他照旧去买饼，回来把热的那面朝你放。 # beat:jt_first_order_3 # scene:jt_lodging # cast:jt_jiang # speaker:narrator
你睡觉打呼。 # beat:jt_first_order_4 # scene:jt_lodging # cast:jt_jiang # speaker:jt_jiang # mood:jt_jiang=amused
你才打。 # beat:jt_first_order_5 # scene:jt_lodging # cast:jt_jiang # speaker:you
这是你们最普通的一天。几日后，江忽然少了话，你没见他新接过什么，只看见他把掌心压在衣袋上。 # beat:jt_first_order_6 # scene:jt_lodging # cast:jt_jiang # speaker:narrator
想你丈夫。 # beat:jt_first_order_7 # scene:jt_lodging # cast:jt_jiang # speaker:jt_jiang # mood:jt_jiang=uneasy
关你什么事？ # beat:jt_first_order_8 # scene:jt_lodging # cast:jt_jiang # speaker:you
你根本没丈夫吧？ # beat:jt_first_order_9 # scene:jt_lodging # cast:jt_jiang # speaker:jt_jiang # mood:jt_jiang=neutral
有。真的死了。 # beat:jt_first_order_10 # scene:jt_lodging # cast:jt_jiang # speaker:you
你没拿这句替其他谎话作保。他也没有再问死者能不能替你保证今夜不动刀。 # beat:jt_first_order_11 # scene:jt_lodging # cast:jt_jiang # speaker:narrator
- else:
你看见沈收到一封薄纸，读完便烧。她坐了半夜，背影没动；信上究竟写什么，你不知道。 # beat:jt_first_order_12 # scene:jt_lodging # cast:jt_shen # speaker:narrator
次日你去买饼，热的那面递她，忽然觉得若只谈生意，一早不该这样安静。 # beat:jt_first_order_13 # scene:jt_lodging # cast:jt_shen # speaker:narrator
你睡觉打呼。 # beat:jt_first_order_14 # scene:jt_lodging # cast:jt_shen # speaker:you
你才打。 # beat:jt_first_order_15 # scene:jt_lodging # cast:jt_shen # speaker:jt_shen # mood:jt_shen=sharp
几日后，你自己收到盗门密信：璧归门。同行非本门者，不留。你先想她果然不是商妇，再想门里怎么知道她，最后才想自己被叫去杀谁。 # beat:jt_first_order_16 # scene:jt_lodging # cast:jt_shen # speaker:narrator
今天怎么不说话？ # beat:jt_first_order_17 # scene:jt_lodging # cast:jt_shen # speaker:jt_shen # mood:jt_shen=neutral
想你丈夫。你根本没丈夫吧？ # beat:jt_first_order_18 # scene:jt_lodging # cast:jt_shen # speaker:you
有。真的死了。 # beat:jt_first_order_19 # scene:jt_lodging # cast:jt_shen # speaker:jt_shen # mood:jt_shen=uneasy
她说完便继续包药。你把自己的密信藏好，没有趁她回头时动手，也没因为自己此刻没动，就以为明日还会有人准你不动。 # beat:jt_first_order_20 # scene:jt_lodging # cast:jt_shen # speaker:narrator
}
* [各查来路后再约见，不趁睡着翻对方的衣袋。 # cid:jt_check_before_asking]
  ~ jt_truth_patience = true
  你们分别去问各自能问的人。商会旧记与盗门暗号不再能互相遮住，等回到破庙，谁也没打算继续靠丈夫欠债或家传两字过这一关。 # beat:jt_first_order_21 # scene:jt_lodging # cast:none # speaker:narrator
  -> revealed
* [先留下一次当面谈的时辰，自己仍去核身分，不把没答当作已认。 # cid:jt_send_meeting]
  ~ jt_truth_patience = false
  你留下一句今夜在庙里见，然后走自己的核问路。回来的人都带兵器，也都知道先前那句家传或卖钱不是全部。约来的时辰，没人失约。 # beat:jt_first_order_22 # scene:jt_lodging # cast:none # speaker:narrator
  -> revealed

=== revealed ===
你们终于查明：沈玉娘是内廷密使，江十七来自盗门。她受命取璧绝旁知者，他受命归璧不留外人。这一回，两边的命令都摆到能看见的地方。 # beat:jt_revealed_1 # scene:jt_temple_reveal # cast:none # speaker:narrator # fact:jt_roles
{
- jt_pov == 1:
江站在佛座另一侧，剑柄不离手。你也没把短刃丢到够不着的地方。中间那块玉没有变重，人却都像多背了一层。 # beat:jt_revealed_2 # scene:jt_temple_reveal # cast:jt_jiang # speaker:narrator
以前哪句是真的？ # beat:jt_revealed_3 # scene:jt_temple_reveal # cast:jt_jiang # speaker:jt_jiang # mood:jt_jiang=intent
你想很久。 # beat:jt_revealed_4 # scene:jt_temple_reveal # cast:jt_jiang # speaker:narrator
名字。 # beat:jt_revealed_5 # scene:jt_temple_reveal # cast:jt_jiang # speaker:you
我的也是。 # beat:jt_revealed_6 # scene:jt_temple_reveal # cast:jt_jiang # speaker:jt_jiang # mood:jt_jiang=neutral
还有呢？ # beat:jt_revealed_7 # scene:jt_temple_reveal # cast:jt_jiang # speaker:you
我爹真死了。 # beat:jt_revealed_8 # scene:jt_temple_reveal # cast:jt_jiang # speaker:jt_jiang # mood:jt_jiang=uneasy # camera:portrait # action:江十七 · 父亲
真为山河璧？ # beat:jt_revealed_9 # scene:jt_temple_reveal # cast:jt_jiang # speaker:you
现在看来，大概不是他以为的那个理由。 # beat:jt_revealed_10 # scene:jt_temple_reveal # cast:jt_jiang # speaker:jt_jiang # mood:jt_jiang=neutral
- else:
你把兵器留在自己能先接住来招的位置，沈也一样。她没躲目光，也没先把要杀你说成是为了你好。 # beat:jt_revealed_11 # scene:jt_temple_reveal # cast:jt_shen # speaker:narrator
以前哪句是真的？ # beat:jt_revealed_12 # scene:jt_temple_reveal # cast:jt_shen # speaker:you
名字。 # beat:jt_revealed_13 # scene:jt_temple_reveal # cast:jt_shen # speaker:jt_shen # mood:jt_shen=uneasy # camera:portrait # action:沈玉娘 · 名字
我的也是。 # beat:jt_revealed_14 # scene:jt_temple_reveal # cast:jt_shen # speaker:you
还有呢？ # beat:jt_revealed_15 # scene:jt_temple_reveal # cast:jt_shen # speaker:jt_shen # mood:jt_shen=neutral
我爹真死了。 # beat:jt_revealed_16 # scene:jt_temple_reveal # cast:jt_shen # speaker:you
真为山河璧？ # beat:jt_revealed_17 # scene:jt_temple_reveal # cast:jt_shen # speaker:jt_shen # mood:jt_shen=neutral
二十多年，你没亲见过的那一夜，一直被别人拿来给你今天的路定方向。 # beat:jt_revealed_18 # scene:jt_temple_reveal # cast:jt_shen # speaker:narrator
现在看来，大概不是他以为的那个理由。 # beat:jt_revealed_19 # scene:jt_temple_reveal # cast:jt_shen # speaker:you
}
* [兵器仍在可接的位置，先问对方明日还肯不肯同行，不把不出手当全信。 # cid:jt_hold_distance]
  ~ jt_temple_word = 1
  没人先扑过去。你问的是明日怎样走，不是许诺从此不会怕。 # beat:jt_revealed_20 # scene:jt_temple_reveal # cast:none # speaker:narrator
  还要一起走么？ # beat:jt_revealed_21 # scene:jt_temple_reveal # cast:none # speaker:you
  对面的人看一眼门，点头，但没有叫你就此把自己的退处交出来。 # beat:jt_revealed_22 # scene:jt_temple_reveal # cast:none # speaker:narrator
  -> not_fighting
* [把自己的命令原话说清，承认没动刀是自己的选择，不是上面准了。 # cid:jt_show_order]
  ~ jt_temple_word = 2
  要我动手的，我没照做。后面不会因为我说不杀，就替我们换一个肯放人的上面。 # beat:jt_revealed_23 # scene:jt_temple_reveal # cast:none # speaker:you
  对面那只手慢慢松了一点，兵器仍在。沉默没有变成谁输谁赢，夜终于能往下过。 # beat:jt_revealed_24 # scene:jt_temple_reveal # cast:none # speaker:narrator
  -> not_fighting

=== not_fighting ===
最后谁也没有出手。两边都回不去，玉又不能永远抱着跑。沈说做一块假的，江问她会不会，她答不会，但认识一个会的人。 # beat:jt_not_fighting_1 # scene:jt_temple_reveal # cast:none # speaker:narrator
{
- jt_pov == 1:
你说不会这句，比卖钱倒像真话。 # beat:jt_not_fighting_2 # scene:jt_temple_reveal # cast:jt_jiang # speaker:jt_jiang # mood:jt_jiang=amused
有人会。你若还想明日也睡在这块破玉旁，就继续夸它。 # beat:jt_not_fighting_3 # scene:jt_temple_reveal # cast:jt_jiang # speaker:you
他把真玉抱回普通行囊，没再把家传当做自己可以先拿走的理由。 # beat:jt_not_fighting_4 # scene:jt_temple_reveal # cast:jt_jiang # speaker:narrator
- else:
假的能引开一阵。做得比真的像真货，你认识这种人？ # beat:jt_not_fighting_5 # scene:jt_temple_reveal # cast:jt_shen # speaker:you
认识。去到那里，先别替人自报门第。 # beat:jt_not_fighting_6 # scene:jt_temple_reveal # cast:jt_shen # speaker:jt_shen # mood:jt_shen=intent
你摸了摸父亲故事里那件所谓江湖旧物。它现在硌在行囊里，先要学会像一块不值得抢的石头。 # beat:jt_not_fighting_7 # scene:jt_temple_reveal # cast:jt_shen # speaker:narrator
}
* [带真物去见匠人，先问能不能做、要多久，愿意等手艺，不买一句当夜完工。 # cid:jt_go_by_work]
  ~ jt_waited_craft = true
  你们按约见人，先交手工的钱。老人听到皇家二字先皱眉，等看见玉，反倒愣住，指着那块银补问怎么成了这样。 # beat:jt_not_fighting_8 # scene:jt_temple_reveal # cast:none # speaker:narrator
  -> craftsman
* [先找离内府的旧识核手艺与去处，再带真物，晚一程仍不向黑市随便买新璧。 # cid:jt_go_by_oldmark]
  ~ jt_waited_craft = false
  你们多走一程，才把真物送到旧匠手里。他不先夸难得，只把玉转到窗下，看西角银补和背后火熏，叹怎么成这样。 # beat:jt_not_fighting_9 # scene:jt_temple_reveal # cast:none # speaker:narrator
  -> craftsman

=== craftsman ===
边上刀痕，背上烟，西角这补得……柳家当年崩过一角，是不是又磕了？ # beat:jt_craftsman_1 # scene:jt_workshop # cast:jt_craftsman,jt_apprentice # speaker:jt_craftsman # mood:jt_craftsman=uneasy
两点碰伤还在，逃亡细裂添了一线。玉质黑青不透，金线也没替它遮住这些。老人看的是一件被人用过的旧物，不是你们昨夜刚编出来的皇家神话。 # beat:jt_craftsman_2 # scene:jt_workshop # cast:jt_craftsman,jt_apprentice # speaker:narrator
师父，这个我会磨得更平。 # beat:jt_craftsman_3 # scene:jt_workshop # cast:jt_craftsman,jt_apprentice # speaker:jt_apprentice # mood:jt_apprentice=amused
磨平了还叫一样？ # beat:jt_craftsman_4 # scene:jt_workshop # cast:jt_craftsman,jt_apprentice # speaker:jt_craftsman # mood:jt_craftsman=sharp
江问假的能不能做一样，老人摇头：做旧容易，做这么丑难。做出来得数月，不能拿一块今夜刻完的圆石便叫别人拿命去信。 # beat:jt_craftsman_5 # scene:jt_workshop # cast:jt_craftsman,jt_apprentice # speaker:narrator
* [假璧先把金线做得完整、走向清楚，顺着追宝人最爱讲的山河图。 # cid:jt_polish_lines]
  ~ jt_fake_motif = 1
  老匠把断续处连得更漂亮，图一眼看全。真物旧刀痕和银补不照搬，假货反倒更像竞价人嘴里的皇家重宝。 # beat:jt_craftsman_6 # scene:jt_workshop # cast:jt_craftsman,jt_apprentice # speaker:narrator
  这会叫更多人信它。你们想引走的，也不只会有一拨。 # beat:jt_craftsman_7 # scene:jt_workshop # cast:jt_craftsman,jt_apprentice # speaker:jt_craftsman # mood:jt_craftsman=intent
  你记住这句，没有因为骗局是为活命，就把后来每一个信的人都当作无关。 # beat:jt_craftsman_8 # scene:jt_workshop # cast:jt_craftsman,jt_apprentice # speaker:narrator
  -> making
* [假璧先挑更纯的玉色、把补角做完整，让一眼看物的人先认它像宝。 # cid:jt_polish_jade]
  ~ jt_fake_motif = 2
  玉色更匀，边完整，没有真物那块丑银补。金线也补全，只是放消息时先让人看清玉质与整边。 # beat:jt_craftsman_9 # scene:jt_workshop # cast:jt_craftsman,jt_apprentice # speaker:narrator
  如今拿真的来，倒像来骗我师父的。 # beat:jt_craftsman_10 # scene:jt_workshop # cast:jt_craftsman,jt_apprentice # speaker:jt_apprentice # mood:jt_apprentice=amused
  他笑完仍把真物垫稳，没拿假货好看便交换匣中谁真谁假。 # beat:jt_craftsman_11 # scene:jt_workshop # cast:jt_craftsman,jt_apprentice # speaker:narrator
  -> making

=== making ===
数月里，失败的试片摞了几块。沈收下一片最早的，裂纹还没磨平；江笑说别连试坏的也算路费，最后还是替她找了一张软纸裹。 # beat:jt_making_1 # scene:jt_workshop # cast:jt_craftsman,jt_apprentice # speaker:narrator
放消息那一趟，我可以跑。你们躲着，我出去像送普通工料。 # beat:jt_making_2 # scene:jt_workshop # cast:jt_craftsman,jt_apprentice # speaker:jt_apprentice # mood:jt_apprentice=neutral
像普通，不是就没风险。买主若问来处，问到的是他，不是你们。 # beat:jt_making_3 # scene:jt_workshop # cast:jt_craftsman,jt_apprentice # speaker:jt_craftsman # mood:jt_craftsman=intent
真璧已在普通木箱，假璧要故意落进一支追兵眼里。谁去把这条线递出去，会被人记住。 # beat:jt_making_4 # scene:jt_workshop # cast:jt_craftsman,jt_apprentice # speaker:narrator
我本来也要往南边换师学艺。渡头那条山道，我还得走。若后来遇着，别又叫我只管送箱。 # beat:jt_making_5 # scene:jt_workshop # cast:jt_craftsman,jt_apprentice # speaker:jt_apprentice # mood:jt_apprentice=intent
老人让他先把这一回想清，不拿往后都要出门，替今日所有风险点头。 # beat:jt_making_6 # scene:jt_workshop # cast:jt_craftsman,jt_apprentice # speaker:narrator
* [匠徒只送木箱，假消息自己去放，多跑两日，真面目由自己承担。 # cid:jt_hide_apprentice]
  ~ jt_cover_apprentice = true
  你不去见接头人。箱子交我，后面的路我们自己走。 # beat:jt_making_7 # scene:jt_workshop # cast:jt_craftsman,jt_apprentice # speaker:you
  那你们认过的人也会认你们。 # beat:jt_making_8 # scene:jt_workshop # cast:jt_craftsman,jt_apprentice # speaker:jt_apprentice # mood:jt_apprentice=uneasy
  你没说不会。两人多留两日换接头处，匠徒没在那拨人面前留下名与住处。 # beat:jt_making_9 # scene:jt_workshop # cast:jt_craftsman,jt_apprentice # speaker:narrator
  -> substitution
* [让匠徒自愿递假货线索，赶换防前离城；把可能被追问的风险和接应处说清。 # cid:jt_send_apprentice]
  ~ jt_cover_apprentice = false
  他们若回来问，你从后门走，到渡头等。钱和去处先留给你，不说跑完便一定没事。 # beat:jt_making_10 # scene:jt_workshop # cast:jt_craftsman,jt_apprentice # speaker:you
  我去这一回。被问起，我不替你们守一辈子嘴。 # beat:jt_making_11 # scene:jt_workshop # cast:jt_craftsman,jt_apprentice # speaker:jt_apprentice # mood:jt_apprentice=intent
  他亲自答应，递出消息也确实更快。你们出了城，接头人已看见他的脸，这条代价没有因为付过工钱就消失。 # beat:jt_making_12 # scene:jt_workshop # cast:jt_craftsman,jt_apprentice # speaker:narrator
  -> substitution

=== substitution ===
你们故意让消息漏出去。一支追兵果然抢走假璧，匣子打开时，没人先问那一角为何没有银补。真货放在普通木箱，旧得不愿多看的一层布盖住了金线。 # beat:jt_substitution_1 # scene:jt_exchange # cast:none # speaker:narrator
{
- jt_fake_motif == 1:
传回来的话先夸金线完整，山河一望便明。连当年柳家那点银补，也被人解释成早年误认了假物；你们亲手补全的线，成了他们不用再问的凭据。 # beat:jt_substitution_2 # scene:jt_exchange # cast:none # speaker:narrator
- else:
传回来的话先夸玉色纯、边完整，比任何旧拓都像皇家宝。有人说当年黑青带补的未必真，你们挑出的好玉，反倒替他们把真物旧伤说成了疑点。 # beat:jt_substitution_3 # scene:jt_exchange # cast:none # speaker:narrator
}
{
- jt_pov == 1:
如今把真的拿去，怕还要先挨一顿骂。 # beat:jt_substitution_4 # scene:jt_exchange # cast:jt_jiang # speaker:jt_jiang # mood:jt_jiang=amused
别拿去试。我们没多出一条命，专给他们看眼力。 # beat:jt_substitution_5 # scene:jt_exchange # cast:jt_jiang # speaker:you
他把木箱换到不碍你伤臂的一侧，脸上的笑没一直留着。 # beat:jt_substitution_6 # scene:jt_exchange # cast:jt_jiang # speaker:narrator
- else:
假的比真的还像真的，你那位师傅得多收一份钱。 # beat:jt_substitution_7 # scene:jt_exchange # cast:jt_shen # speaker:you
他已经说过会有更多人信。我们拿到的不是从此没人追。 # beat:jt_substitution_8 # scene:jt_exchange # cast:jt_shen # speaker:jt_shen # mood:jt_shen=intent
你把笑收回一点。眼前的路确实松了，木箱里的东西却还会把人引来。 # beat:jt_substitution_9 # scene:jt_exchange # cast:jt_shen # speaker:narrator
}
* [这一夜先照各自伤处与吃住过，明日再走，不把暂缓当永远平安。 # cid:jt_share_ordinary]
  ~ jt_ordinary_day = true
  两人坐下吃一顿热的，没有再问这一口算欠谁。江嫌菜太咸，沈把水推过去，自己也喝了一碗。你们没有在这一顿谈谁会先死。 # beat:jt_substitution_10 # scene:jt_exchange # cast:none # speaker:narrator
  -> half_year
* [先给老匠补齐工钱与送箱的后话，再换一处住，不让匠徒替自己追不回的账。 # cid:jt_finish_debts]
  ~ jt_ordinary_day = false
  钱从剩下的路费里补。你们少坐一夜热屋，至少做假那几个月的活不再只剩一句以后有空再报。江说这门大买卖，怎么算都该先不赚。 # beat:jt_substitution_11 # scene:jt_exchange # cast:none # speaker:narrator
  -> half_year

=== half_year ===
半年以后，几方还是追上来。山道两头都有人，不再只按一张完整金线的图找。你们见到匠徒南去学艺那队小车时，脚步都停了一下。 # beat:jt_half_year_1 # scene:jt_mountainpass # cast:none # speaker:narrator
{
- jt_cover_apprentice:
他只送过普通木箱，没有在接头人面前留下假货线索。追兵没先找他认人，他已经从侧路把车赶出窄口，回身还叫同车人别乱站。 # beat:jt_half_year_2 # scene:jt_mountainpass # cast:none # speaker:narrator
先走，你那一程别停在这里！ # beat:jt_half_year_3 # scene:jt_mountainpass # cast:none # speaker:you
他认出声音，拉起最后一只车包。那两日由你们自己多跑的路，没替江沈买到不受追杀的一生，却少牵进这一名学徒。 # beat:jt_half_year_4 # scene:jt_mountainpass # cast:none # speaker:narrator
- else:
当初递消息的接头人早记住匠徒的脸。问了几回、逼他离城，他仍南去换师，到了山口又被人拦着要认箱。他不肯指你们，被推下车侧，腿撞上石头。 # beat:jt_half_year_5 # scene:jt_mountainpass # cast:none # speaker:narrator
先把他接过去，别再在这里问箱！ # beat:jt_half_year_6 # scene:jt_mountainpass # cast:none # speaker:you
你们同赶车人把他拖到侧路，命保住，腿要养一个月。他那一段学艺行期误了，得另外托人补路费，不能用付过工钱把它勾掉。 # beat:jt_half_year_7 # scene:jt_mountainpass # cast:none # speaker:narrator
}
* [先叫旁车从窄口出去，不拿普通行人挡在追兵前，自己退向石壁内侧。 # cid:jt_clear_other_cart]
  ~ jt_cart_call = 1
  最后一辆车转出，人也散到低处。你们把原来能混在人群里走的一步放掉，刀便从两侧清楚逼来。 # beat:jt_half_year_8 # scene:jt_mountainpass # cast:none # speaker:narrator
  -> turn_back
* [把能退的石角喊给赶车人，自己接住近处一击，叫他先带慢的人走。 # cid:jt_leave_marker]
  ~ jt_cart_call = 2
  赶车人听见你喊，先带学徒那一班撤。你们留在窄口，木箱压在脚后，不再等别人替你们的假来历站住。 # beat:jt_half_year_9 # scene:jt_mountainpass # cast:none # speaker:narrator
  -> turn_back

=== turn_back ===
打到石角，江十七本有机会走。外侧一条能下坡的路已经让出，他看见沈被两人堵回内壁，还是折身回来。 # beat:jt_turn_back_1 # scene:jt_mountainpass # cast:none # speaker:narrator
刀逼到近处，沈要换手时已少半步。江从能走的那一侧回到她身旁，替她接开前一道，又被后一道刀锋赶上。 # beat:jt_turn_back_2 # scene:jt_mountainpass # cast:none # speaker:narrator
{
- jt_pov == 1:
亏。 # beat:jt_turn_back_3 # scene:jt_mountainpass # cast:jt_jiang # speaker:jt_jiang # mood:jt_jiang=uneasy
你伸手压住他衣下涌出的血，拖他走，拖不动。风从石角灌过来，追喊就在不远，你不能把手松开，又不能让他自己站起。 # beat:jt_turn_back_4 # scene:jt_mountainpass # cast:jt_jiang # speaker:narrator
- else:
你回到她身旁，刀入后才知道这一趟没法再像桥上那回抬手过去。她压住你衣下的血，想拖你走，脚下却没能多挪一尺。 # beat:jt_turn_back_5 # scene:jt_mountainpass # cast:jt_shen # speaker:narrator
亏。 # beat:jt_turn_back_6 # scene:jt_mountainpass # cast:jt_shen # speaker:you
别再说这个。 # beat:jt_turn_back_7 # scene:jt_mountainpass # cast:jt_shen # speaker:jt_shen # mood:jt_shen=sharp
}
* [先压住伤处，让还使得上力的人接近，不先数木箱里的东西。 # cid:jt_press_wound]
  ~ jt_last_action = 1
  布一下便湿透。沈把另一只手也压上去，江看了她一会儿，不再催她先看箱。 # beat:jt_turn_back_8 # scene:jt_mountainpass # cast:none # speaker:narrator
  路上没替他们换来一个突然能止住这一刀的医者，追声却又近了一段。 # beat:jt_turn_back_9 # scene:jt_mountainpass # cast:none # speaker:narrator
  -> last_question
* [先借石壁遮开再来的刀，把人扶到还能靠住的一处，药与布都拿出来。 # cid:jt_pull_to_rock]
  ~ jt_last_action = 2
  沈把江扶到石后，药沾在指上，手却仍要压住血。两个人挪出的这一点阴影，挡得住目光，挡不住已经留下的伤。 # beat:jt_turn_back_10 # scene:jt_mountainpass # cast:none # speaker:narrator
  江喘了一声，抬眼去找她，不再去找那条自己原来能走的路。 # beat:jt_turn_back_11 # scene:jt_mountainpass # cast:none # speaker:narrator
  -> last_question

=== last_question ===
木箱还在，真玉仍旧得不像宝。江抬眼问，璧还在么。 # beat:jt_last_question_1 # scene:jt_mountainpass # cast:none # speaker:narrator
{
- jt_pov == 1:
在。 # beat:jt_last_question_2 # scene:jt_mountainpass # cast:jt_jiang # speaker:you
那就行。 # beat:jt_last_question_3 # scene:jt_mountainpass # cast:jt_jiang # speaker:jt_jiang # mood:jt_jiang=uneasy
什么叫那就行？ # beat:jt_last_question_4 # scene:jt_mountainpass # cast:jt_jiang # speaker:you
折腾这么久，总不能人和东西都没了。 # beat:jt_last_question_5 # scene:jt_mountainpass # cast:jt_jiang # speaker:jt_jiang # mood:jt_jiang=neutral
闭嘴。 # beat:jt_last_question_6 # scene:jt_mountainpass # cast:jt_jiang # speaker:you
你那边的人要杀我，我这边也要杀你。早知道，第一次密库里就该各走各的。 # beat:jt_last_question_7 # scene:jt_mountainpass # cast:jt_jiang # speaker:jt_jiang # mood:jt_jiang=neutral
你没有回答。他停了一会儿，又看你。 # beat:jt_last_question_8 # scene:jt_mountainpass # cast:jt_jiang # speaker:narrator
不过。也还行。 # beat:jt_last_question_9 # scene:jt_mountainpass # cast:jt_jiang # speaker:jt_jiang # mood:jt_jiang=intent
- else:
在。 # beat:jt_last_question_10 # scene:jt_mountainpass # cast:jt_shen # speaker:jt_shen # mood:jt_shen=neutral
那就行。 # beat:jt_last_question_11 # scene:jt_mountainpass # cast:jt_shen # speaker:you
什么叫那就行？ # beat:jt_last_question_12 # scene:jt_mountainpass # cast:jt_shen # speaker:jt_shen # mood:jt_shen=sharp
折腾这么久，总不能人和东西都没了。 # beat:jt_last_question_13 # scene:jt_mountainpass # cast:jt_shen # speaker:you
闭嘴。 # beat:jt_last_question_14 # scene:jt_mountainpass # cast:jt_shen # speaker:jt_shen # mood:jt_shen=neutral
你那边的人要杀我，我这边也要杀你。早知道，第一次密库里就该各走各的。 # beat:jt_last_question_15 # scene:jt_mountainpass # cast:jt_shen # speaker:you
她没有答。你再看她，声音已比自己想的小。 # beat:jt_last_question_16 # scene:jt_mountainpass # cast:jt_shen # speaker:narrator
不过。也还行。 # beat:jt_last_question_17 # scene:jt_mountainpass # cast:jt_shen # speaker:you
}
-> gone

=== gone ===
江十七死了。沈玉娘没能再把他拖起。那句也还行没有替他换回下一口气。 # beat:jt_gone_1 # scene:jt_afterpass # cast:none # speaker:narrator
从这里起，你是带着木箱独行的沈玉娘。江的那条路已经停下。你没有回内廷领功，等取回真璧的人也没等到你。 # beat:jt_gone_2 # scene:jt_afterpass # cast:none # speaker:narrator
旧铜钱仍放在贴身衣内。木箱里的玉压着肩，江已不在，没再有人问里面那件东西还在不在。 # beat:jt_gone_3 # scene:jt_afterpass # cast:none # speaker:narrator
* [把暂能送到的工钱与伤者后话交清，往南方找不靠旧命令过日子的活。 # cid:jt_take_living_work]
  ~ jt_future = 1
  沈托可信的普通行路人带一份钱与口信，不带自己的新住处。她能交还的只交还这一份，不用一句亏欠要求谁替她永远守秘密。 # beat:jt_gone_4 # scene:jt_afterpass # cast:none # speaker:narrator
  -> pawn
* [将两人共同欠过的账写成不留踪迹的私记，别把同行者姓名再卖成宝物来历。 # cid:jt_keep_private_record]
  ~ jt_future = 2
  沈把路费、药费和未还的工钱一笔笔另记，不写取璧的密令作凭。哪里能托人交清，便托人；写下的纸不再交给等她杀人领功的人。 # beat:jt_gone_5 # scene:jt_afterpass # cast:none # speaker:narrator
  -> pawn

=== pawn ===
后来又一次重伤，钱用尽，南方小城里，沈把真璧送到当铺。黑青，旧刀痕、火熏、缺角银补；逃亡细裂也在，掌柜翻了两面，只嫌不好看。 # beat:jt_pawn_1 # scene:jt_pawn # cast:jt_pawnbroker # speaker:narrator
这角补成这样。你急着用？ # beat:jt_pawn_2 # scene:jt_pawn # cast:jt_pawnbroker # speaker:jt_pawnbroker # mood:jt_pawnbroker=uneasy
买药。 # beat:jt_pawn_3 # scene:jt_pawn # cast:jt_pawnbroker # speaker:you
价格很低，她没争。玉放到柜里，江给的旧铜钱却没从她衣内取出，造假时的失败试片也仍另裹着。 # beat:jt_pawn_4 # scene:jt_pawn # cast:jt_pawnbroker # speaker:narrator
赎么？ # beat:jt_pawn_5 # scene:jt_pawn # cast:jt_pawnbroker # speaker:jt_pawnbroker # mood:jt_pawnbroker=neutral
赎。 # beat:jt_pawn_6 # scene:jt_pawn # cast:jt_pawnbroker # speaker:you
沈最终没有回来。掌柜后来用它压账，十一年后连桌卖去何家；再压咸菜缸十三年。这些后来的日子，已经不在她这一次说赎的时候。 # beat:jt_pawn_7 # scene:jt_pawn # cast:jt_pawnbroker # speaker:narrator
* [离柜后先问今日能换药钱的零工，不再拿另一块漂亮假玉替自己翻身。 # cid:jt_ask_today_work]
  ~ jt_last_trade = true
  她找的是清洗药筛、抄一张普通药单的活。能做的先做，不能做的请人教，没有把内廷旧识变成新招牌。 # beat:jt_pawn_8 # scene:jt_pawn # cast:jt_pawnbroker # speaker:narrator
  -> hidden_years
* [把当钱先付药与欠食，留真实能还的数，不让旧物再替眼前债变出十倍价。 # cid:jt_finish_old_account]
  ~ jt_last_trade = false
  她付清一笔最急的药钱，剩下的分到欠过饭的人手里。对方问以后去哪，她只道有处住，不再报一个能被追到的姓名。 # beat:jt_pawn_9 # scene:jt_pawn # cast:jt_pawnbroker # speaker:narrator
  -> hidden_years

=== hidden_years ===
沈在南方隐居，后来仍活了很多年，没有再入江湖。追真玉的人听不到她的去处，追假玉的人却越来越多。 # beat:jt_hidden_years_1 # scene:jt_hidden # cast:none # speaker:narrator
外面最高时有七块唯一真品，来历从柳家、宁王府到盗门祖传都齐全；还有一块说沈临终相托，她那时分明还活着。白玉被夸年久返璞，黑青旧角反倒没人愿信。 # beat:jt_hidden_years_2 # scene:jt_hidden # cast:none # speaker:narrator
{
- jt_fake_motif == 1:
那条金线完整便最真的夸法也流下去，仿者把每条线描得更齐。沈后来听见，只把旧试片翻到粗糙的一面，没有再去替自己那一块报唯一。 # beat:jt_hidden_years_3 # scene:jt_hidden # cast:none # speaker:narrator
- else:
玉色纯、边完整的价钱仍往上涨，仿者把银补彻底从传闻中删掉。沈后来听见，摸过试片没磨平的一角，没有拿它换回一个鉴真人的名号。 # beat:jt_hidden_years_4 # scene:jt_hidden # cast:none # speaker:narrator
}
{
- not jt_cover_apprentice:
学徒腿养了一个月才继续南去，另走的路费与代下的活也有人接。沈托去的那份确实到了，不用他的伤替自己留一个终身该追问的人。 # beat:jt_hidden_years_5 # scene:jt_hidden # cast:none # speaker:narrator
- else:
学徒后来南去学艺，换过师，也有没做好的活。那支追兵没有因为自己与沈江见过一面，就知道该去找他要哪个人的命。 # beat:jt_hidden_years_6 # scene:jt_hidden # cast:none # speaker:narrator
}
* [留下能查清的普通欠账，宝物与身世不替后来人编成一份全知说明。 # cid:jt_leave_ordinary]
  ~ jt_kept_ordinary = true
  她留一张家常账纸。旧路上真正肯做过的事，有些能记，有些仍不愿给外人一句解释。 # beat:jt_hidden_years_7 # scene:jt_hidden # cast:none # speaker:narrator
  -> box
* [把写了一半的说明收回盒底，不替死者补他没有说过的心事。 # cid:jt_leave_silence]
  ~ jt_kept_ordinary = false
  她把笔搁下，没将最后一句续成替两人都选定的答案。纸背还能用，先记了明日要付的药钱。 # beat:jt_hidden_years_8 # scene:jt_hidden # cast:none # speaker:narrator
  -> box

=== box ===
多年以后，后人看见她留下的木盒。里面不是山河璧，是江十七的一枚旧铜钱，和最早高仿留下的失败试片。 # beat:jt_box_1 # scene:jt_hidden # cast:none # speaker:narrator
一页账纸背面写着，真的太重，假的轻些。说玉还是别的，没人能确定。她没有替后来每一个猜的人，先留好同一个答案。 # beat:jt_box_2 # scene:jt_hidden # cast:none # speaker:narrator
{
- jt_future == 1:
在仍属于她的日子里，沈接过一只洗好的药筛，等新收的衣裳晒干。有人来问那位药材商遗孀，她只说这里缺一个肯做活的人。旧钱与试片仍在盒中，明日的饼不必再靠抢一块玉才买得来。 # beat:jt_box_3 # scene:jt_hidden # cast:none # speaker:narrator # ending:jt_unmarked_life
-> END
- else:
沈把最后一笔能托到的旧账交清，收起私记。旧铜钱没有拿去抵这一笔，试片也没有写成给谁的保证。她仍记得有人买饼时先抱怨一句打呼；往后的纸，终于可以先写她自己还要过的日子。 # beat:jt_box_4 # scene:jt_hidden # cast:none # speaker:narrator # ending:jt_private_account
-> END
}
