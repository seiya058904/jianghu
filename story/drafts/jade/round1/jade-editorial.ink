// Source: 宋世江湖24156–28497; second volume, fixed nine stores and separate seventh/ninth nights.
VAR jd_asked_origin = false
VAR jd_letter_care = false
VAR jd_full_names = false
VAR jd_sent_sources = false
VAR jd_sima_archive = false
VAR jd_admitted_pickle = false
VAR jd_surface = false
VAR jd_route_check = false
VAR jd_report_empty = false
VAR jd_later_work = 0
VAR jd_next_with_relief = false
VAR jd_family_list = false
VAR jd_paid_shift = false
VAR jd_tools_check = false
VAR jd_use_record = false
VAR jd_clans_plain = false
VAR jd_prep_water = false
VAR jd_post = 0
VAR jd_grain_work = 0
VAR jd_people_lane = false
VAR jd_grain_after = 0
VAR jd_records_work = 0
VAR jd_notes_kept = false
VAR jd_records_after = 0
VAR jd_credit_shared = false
VAR jd_qiao_work = false
VAR jd_career = 0
VAR jd_wedding_kept = false
VAR jd_best_letter = false
VAR jd_kept_breaks = false
-> cat

=== cat ===
陆先生，缸盖先按住。你蹲那里看半天，猫倒快看明白怎么进去了。 # beat:jd_cat_1 # scene:jd_pickle # cast:jd_he # speaker:jd_he # mood:jd_he=sharp
你赶紧把那块沉石压回盖上。你是陆文简，穷书生，今日来何家赊一点菜；眼前这块黑青东西，西角却有一道像旧信里写过的银补。 # beat:jd_cat_2 # scene:jd_pickle # cast:jd_he # speaker:narrator
石头也认得你？还是你欠它的也有账？ # beat:jd_cat_3 # scene:jd_pickle # cast:jd_he # speaker:jd_he # mood:jd_he=amused
这是玉。 # beat:jd_cat_4 # scene:jd_pickle # cast:jd_he # speaker:you
玉能压缸，石也能。你先接菜，我还得称下一份。 # beat:jd_cat_5 # scene:jd_pickle # cast:jd_he # speaker:jd_he # mood:jd_he=neutral
你记起柳观河晚年信里那句玉坠地、崩西角、银补。手开始抖，先把缸盖按实了，才敢再问。 # beat:jd_cat_6 # scene:jd_pickle # cast:jd_he # speaker:narrator
* [先问何时买的桌、这块压了多久，不急着当街喊重宝。 # cid:jd_ask_origin]
  ~ jd_asked_origin = true
  它来了多久？同桌子一起？ # beat:jd_cat_7 # scene:jd_pickle # cast:jd_he # speaker:you
  当铺旧桌里翻的。我拿来压缸，十三年。你若想听前头的，我只能替原掌柜编。 # beat:jd_cat_8 # scene:jd_pickle # cast:jd_he # speaker:jd_he # mood:jd_he=neutral
  你请他别编，心里反而更乱：外面每一块所谓真品都来历齐全，这块的来历却到一只旧抽屉就断。 # beat:jd_cat_9 # scene:jd_pickle # cast:jd_he # speaker:narrator
  -> thirteen
* [先问卖不卖，钱不够便直说，别拿鉴宝人架势压这家卖菜的。 # cid:jd_offer_price]
  ~ jd_asked_origin = false
  卖么？我先问价，不白拿你的压缸石。 # beat:jd_cat_10 # scene:jd_pickle # cast:jd_he # speaker:you
  二十文。 # beat:jd_cat_11 # scene:jd_pickle # cast:jd_he # speaker:jd_he # mood:jd_he=neutral
  你摸遍衣袋，铜钱只数出十三。何老板望着你的手，已经猜到下一句不是再称两份菜。 # beat:jd_cat_12 # scene:jd_pickle # cast:jd_he # speaker:narrator
  -> thirteen

=== thirteen ===
何老板要二十文，你全身十三。你说十三，他说二十，再说十三，他把玉放回缸盖。 # beat:jd_thirteen_1 # scene:jd_pickle # cast:jd_he # speaker:narrator
这就不卖。明日猫把盖掀了，你那句好玉替我看缸？ # beat:jd_thirteen_2 # scene:jd_pickle # cast:jd_he # speaker:jd_he # mood:jd_he=intent
你儿子是不是快成亲？ # beat:jd_thirteen_3 # scene:jd_pickle # cast:jd_he # speaker:you
你怎么知道？ # beat:jd_thirteen_4 # scene:jd_pickle # cast:jd_he # speaker:jd_he # mood:jd_he=surprised
前几日听嫂子说。我替他写婚书。十三文，加一封。 # beat:jd_thirteen_5 # scene:jd_pickle # cast:jd_he # speaker:you
他没有听见皇家两个字，只在想原本还得另花钱请谁。 # beat:jd_thirteen_6 # scene:jd_pickle # cast:jd_he # speaker:narrator
* [先写一小段给他看，婚书的字和期限由自己答应，不拿玉价替喜事凑字。 # cid:jd_show_hand]
  ~ jd_letter_care = true
  你蘸墨写下两行，何老板拿远又拿近，终于点头。 # beat:jd_thirteen_7 # scene:jd_pickle # cast:jd_he # speaker:narrator
  字写好点。日子别写错。 # beat:jd_thirteen_8 # scene:jd_pickle # cast:jd_he # speaker:jd_he # mood:jd_he=intent
  我明日核两家的名字，再交全篇。 # beat:jd_thirteen_9 # scene:jd_pickle # cast:jd_he # speaker:you
  十三文落在柜上，他把那块用了十三年的压缸石交到你手里。 # beat:jd_thirteen_10 # scene:jd_pickle # cast:jd_he # speaker:narrator
  -> marriage_letter
* [先问两家名姓与吉日，按明白的约重写，今日就收十三文不再讨一文。 # cid:jd_confirm_names]
  ~ jd_letter_care = false
  我听过成亲，不知道姑娘名字，不能先替她写一个。 # beat:jd_thirteen_11 # scene:jd_pickle # cast:jd_he # speaker:you
  这句倒比你夸玉像先生。名字去问我媳妇，别问猫。 # beat:jd_thirteen_12 # scene:jd_pickle # cast:jd_he # speaker:jd_he # mood:jd_he=amused
  他收下十三文，把玉交你，婚书仍得由你真写，不是用一句许诺把差额白抹掉。 # beat:jd_thirteen_13 # scene:jd_pickle # cast:jd_he # speaker:narrator
  -> marriage_letter

=== marriage_letter ===
回屋洗三日，盐垢才去。图却越洗越不对：有些河走错，有些位置又准得不像随手刻花。你想的是图，不是绝学。 # beat:jd_marriage_letter_1 # scene:jd_luroom # cast:jd_cousin # speaker:narrator
我在旧档房只管理纸，不是能把内府都搬给你的官。你这半盆酱水，倒先把我请来了。 # beat:jd_marriage_letter_2 # scene:jd_luroom # cast:jd_cousin # speaker:jd_cousin # mood:jd_cousin=uneasy
这儿若是山河，哪条河该这样回头？ # beat:jd_marriage_letter_3 # scene:jd_luroom # cast:jd_cousin # speaker:you
你先把婚书写完。我帮你找纸，不替你被卖菜的追债。 # beat:jd_marriage_letter_4 # scene:jd_luroom # cast:jd_cousin # speaker:jd_cousin # mood:jd_cousin=neutral
你把两家名字核定，交了那封字认真写过的婚书，才同堂兄找那些少有人要的旧册。 # beat:jd_marriage_letter_5 # scene:jd_luroom # cast:jd_cousin # speaker:narrator
* [按旧物前后称名逐册找，连九库总验璧与后来只叫山河璧的空栏都抄。 # cid:jd_sort_old_names]
  ~ jd_full_names = true
  同物换名数次，短名那本用途已空。堂兄把你先前弃在一旁的旧册取回，半夜灯只剩一截。 # beat:jd_marriage_letter_6 # scene:jd_luroom # cast:jd_cousin # speaker:narrator
  下回别只找写得像宝的名。档房里最会丢的，就是以为大家都知道做什么那一栏。 # beat:jd_marriage_letter_7 # scene:jd_luroom # cast:jd_cousin # speaker:jd_cousin # mood:jd_cousin=intent
  -> half_year
* [先从柳家银补信往内库旧物追，没见过的前代去处只列待问，不补成完整传奇。 # cid:jd_follow_repair]
  ~ jd_full_names = false
  修补信给了一个真物的痕，不给全部用途。堂兄把旧物清册找来，让你逐条对，不拿像那个角便说每条传闻都真。 # beat:jd_marriage_letter_8 # scene:jd_luroom # cast:jd_cousin # speaker:narrator
  找到你这块以前，何老板的婚书倒是我们手里最像完整来历的东西。 # beat:jd_marriage_letter_9 # scene:jd_luroom # cast:jd_cousin # speaker:jd_cousin # mood:jd_cousin=amused
  -> half_year

=== half_year ===
半年，残破内府抄件终于翻出九库总验、山河璧一，下面还有璧半、册半。你一夜没睡，堂兄却先问，报给谁。 # beat:jd_half_year_1 # scene:jd_archive # cast:jd_cousin # speaker:narrator
地方官若不信，外面先听到宝；若信，也未必保得住。你得连哪份册一同报，不只报你认出一块玉。 # beat:jd_half_year_2 # scene:jd_archive # cast:jd_cousin # speaker:jd_cousin # mood:jd_cousin=intent
最后层层上报，消息到京。百年前的旧档又有人翻开，不只问一块玉该由谁拿回。 # beat:jd_half_year_3 # scene:jd_archive # cast:jd_cousin # speaker:narrator
* [物与残档分封、互注明来路，自己愿随核验，不卖一句九库藏金。 # cid:jd_send_objects_separate]
  ~ jd_sent_sources = true
  图与册各一半。没对明白的地方，我跟着答，不让抬箱的人替我说已经全懂。 # beat:jd_half_year_4 # scene:jd_archive # cast:jd_cousin # speaker:you
  你去。我把这里能核的留着，家里也有人等我，不能同你一夜都不回。 # beat:jd_half_year_5 # scene:jd_archive # cast:jd_cousin # speaker:jd_cousin # mood:jd_cousin=uneasy
  堂兄第一次没陪到下一程，不因他早先肯帮，便成了你到哪儿都能叫来的人。 # beat:jd_half_year_6 # scene:jd_archive # cast:jd_cousin # speaker:narrator
  -> in_palace
* [自己带玉与核过的残件去，堂兄留原查簿，防一份路上丢便只剩口说。 # cid:jd_take_verified_copy]
  ~ jd_sent_sources = false
  我带这一份，你留哪册找出的页码。问不到我时，也还能找到不是我写的旧字。 # beat:jd_half_year_7 # scene:jd_archive # cast:jd_cousin # speaker:you
  婚书那一笔你已经交清，后面的别又只靠一双熬红的眼睛。 # beat:jd_half_year_8 # scene:jd_archive # cast:jd_cousin # speaker:jd_cousin # mood:jd_cousin=intent
  你把找册的位置交回他手里，往京城去，不把一个旧物谜换成自己独占的秘密。 # beat:jd_half_year_9 # scene:jd_archive # cast:jd_cousin # speaker:narrator
  -> in_palace

=== in_palace ===
御前先问真找到了么，再问还能用么。没人敢答。最后一道命令不是先看天命，是先别管玉，查库。 # beat:jd_in_palace_1 # scene:jd_inner # cast:jd_attendant # speaker:narrator
有人说民间传它象征皇权。上面说让他们传。你要报的是哪处能换粮。 # beat:jd_in_palace_2 # scene:jd_inner # cast:jd_attendant # speaker:jd_attendant # mood:jd_attendant=intent
目前只知璧与册同读，还没敢把旧线认成今日的粮路。 # beat:jd_in_palace_3 # scene:jd_inner # cast:jd_attendant # speaker:you
那就照这个报。不要有人等着听好话，你便先替他多报一库。 # beat:jd_in_palace_4 # scene:jd_inner # cast:jd_attendant # speaker:jd_attendant # mood:jd_attendant=neutral
同一件皇家旧物，有人想护先朝原样，有人想先握九库。密议还没开始，你先被叫去另一处：当世总谱第一司马天岳也要看。 # beat:jd_in_palace_5 # scene:jd_inner # cast:jd_attendant # speaker:narrator
* [玉与旧档一起呈，不先给他递自己抄的武学传说。 # cid:jd_bring_archive]
  ~ jd_sima_archive = true
  旧档放在内官手边，还没递到司马面前。你看着玉上没尽的盐痕，越等越想是不是漏洗了一角。 # beat:jd_in_palace_6 # scene:jd_inner # cast:jd_attendant # speaker:narrator
  真人可看出柳观河当年的武理？ # beat:jd_in_palace_7 # scene:jd_inner # cast:jd_attendant # speaker:jd_attendant # mood:jd_attendant=uneasy
  内官没敢先把纸递过去，端着等司马开口。 # beat:jd_in_palace_8 # scene:jd_inner # cast:jd_attendant # speaker:narrator
  -> sima
* [先说图不对的地方，再拿旧档，请他看自己确实知道的疑问。 # cid:jd_say_map_wrong]
  ~ jd_sima_archive = false
  晚辈不懂剑，只觉得几条河路不像画给人看山水的。 # beat:jd_in_palace_9 # scene:jd_inner # cast:jd_attendant # speaker:you
  你把图不对的几处指给内官，他让你先留在手里。等着听绝学的人看你，像你递错了该请天下第一看的东西。 # beat:jd_in_palace_10 # scene:jd_inner # cast:jd_attendant # speaker:narrator
  -> sima

=== sima ===
司马天岳把玉翻来覆去看足一刻钟，众人屏息，没人听见一句武学评点。 # beat:jd_sima_1 # scene:jd_inner # cast:jd_sima,jd_attendant # speaker:narrator
还有那张旧档么？ # beat:jd_sima_2 # scene:jd_inner # cast:jd_sima,jd_attendant # speaker:jd_sima # mood:jd_sima=neutral
真人不先说武功？柳观河…… # beat:jd_sima_3 # scene:jd_inner # cast:jd_sima,jd_attendant # speaker:jd_attendant # mood:jd_attendant=uneasy
柳观河从这里悟剑，所以呢？他看见的是柳观河，不是玉。 # beat:jd_sima_4 # scene:jd_inner # cast:jd_sima,jd_attendant # speaker:jd_sima # mood:jd_sima=intent
一屋等着高深话的人都停了。你把残件移近，他又拿玉，眉头突然皱起。 # beat:jd_sima_5 # scene:jd_inner # cast:jd_sima,jd_attendant # speaker:narrator
这里怎么一股酱味？ # beat:jd_sima_6 # scene:jd_inner # cast:jd_sima,jd_attendant # speaker:jd_sima # mood:jd_sima=uneasy
你低头。十三文和一封婚书就在舌边，终于没在这一刻抢着报出来。 # beat:jd_sima_7 # scene:jd_inner # cast:jd_sima,jd_attendant # speaker:narrator
* [承认它压过缸，答洗了三日还未尽，别把酱味也写成皇家古香。 # cid:jd_answer_pickle]
  ~ jd_admitted_pickle = true
  何家压咸菜缸十三年。晚辈洗了三日。 # beat:jd_sima_8 # scene:jd_inner # cast:jd_sima,jd_attendant # speaker:you
  那你问过它原来怎么用，已经比等它教剑近了一步。 # beat:jd_sima_9 # scene:jd_inner # cast:jd_sima,jd_attendant # speaker:jd_sima # mood:jd_sima=amused
  旁边人笑又不敢笑，你索性把黑青的旧补角朝灯下放，没再偷偷擦它。 # beat:jd_sima_10 # scene:jd_inner # cast:jd_sima,jd_attendant # speaker:narrator
  -> gold
* [把盐渍与银补来路先说明，十三文暂不抢答，仍承认它在酱菜铺。 # cid:jd_show_salt]
  ~ jd_admitted_pickle = false
  盐渍在这一侧。它从何记铺里取出，压过缸，不是另受了哪种武火。 # beat:jd_sima_11 # scene:jd_inner # cast:jd_sima,jd_attendant # speaker:you
  问玉的不必替它怕丢脸。先看那张册。 # beat:jd_sima_12 # scene:jd_inner # cast:jd_sima,jd_attendant # speaker:jd_sima # mood:jd_sima=amused
  你把最难看的那面摊平。这一刻没有人因为总谱第一看过，就把盐味当成有第二种神功。 # beat:jd_sima_13 # scene:jd_inner # cast:jd_sima,jd_attendant # speaker:narrator
  -> gold

=== gold ===
第二层极细暗刻压在错金下，非剥开部分金线不能看。过去百年抢的人都默认玉该完整，真正知道它能干什么，第一件事反倒要把那幅山河毁掉。 # beat:jd_gold_1 # scene:jd_council # cast:jd_attendant,jd_craftheir # speaker:narrator
我家前人造的工，如今由我家后人来刮。你看着这角，舍得？ # beat:jd_gold_2 # scene:jd_council # cast:jd_attendant,jd_craftheir # speaker:jd_craftheir # mood:jd_craftheir=uneasy
宗室老亲王说先朝御物不可轻毁，户部问灾区缺多少粮，武将问旧军械若尚存、一玉算什么；另有人怕库早空，玉又先坏。 # beat:jd_gold_3 # scene:jd_council # cast:jd_attendant,jd_craftheir # speaker:narrator
你一直坐末席，直到皇帝问你觉得呢。你喉间干得很，最后答，它本来就是拿来找库的。上面点头：刮。 # beat:jd_gold_4 # scene:jd_council # cast:jd_attendant,jd_craftheir # speaker:narrator
* [先描现存表层再刮，花三日与自己的纸料钱，留下可对读的旧线。 # cid:jd_keep_surface]
  ~ jd_surface = true
  请准三日，先把还在的这一层描下，再按命剥。纸料我想法子，过三日不再请拖。 # beat:jd_gold_5 # scene:jd_council # cast:jd_attendant,jd_craftheir # speaker:you
  那就别画成你希望它完整的样子。断的也断着，补的也补着。 # beat:jd_gold_6 # scene:jd_council # cast:jd_attendant,jd_craftheir # speaker:jd_craftheir # mood:jd_craftheir=intent
  上面准了三日。到时原面仍要剥，别拿画了一半又来求情。 # beat:jd_gold_7 # scene:jd_council # cast:jd_attendant,jd_craftheir # speaker:jd_attendant # mood:jd_attendant=intent
  三日里你少睡，自己垫掉一笔纸钱。表层不是保住了，真剥去时仍会少；你留到的是它曾怎样接在另一半册上的线。 # beat:jd_gold_8 # scene:jd_council # cast:jd_attendant,jd_craftheir # speaker:narrator
  -> first_cut
* [先开暗刻，赶上首批勘队；表层旧注有缺，后面愿离队补核。 # cid:jd_read_dark_first]
  ~ jd_surface = false
  先看暗刻。我随首批去，遇上旧注对不出的，回来补，不拦着等画全。 # beat:jd_gold_9 # scene:jd_council # cast:jd_attendant,jd_craftheir # speaker:you
  这层刮了便不能再照原面描。以后回档房，也得承认少过这一份。 # beat:jd_gold_10 # scene:jd_council # cast:jd_attendant,jd_craftheir # speaker:jd_craftheir # mood:jd_craftheir=intent
  细刃先下，暗刻更早露出。你拿到第一批对读页，也欠下一段可能要折回旧档的路。 # beat:jd_gold_11 # scene:jd_council # cast:jd_attendant,jd_craftheir # speaker:narrator
  -> first_cut

=== first_cut ===
细刃一点点剥金，画得像山水的那层断开，暗刻才连上册中验记。二十四点、二十四边痕与孔边八字不是口诀，几道假痕也终于能分出去。 # beat:jd_first_cut_1 # scene:jd_cutting # cast:jd_craftheir,jd_attendant # speaker:narrator
你的手也在疼？ # beat:jd_first_cut_2 # scene:jd_cutting # cast:jd_craftheir,jd_attendant # speaker:jd_craftheir # mood:jd_craftheir=uneasy
十三文买的。 # beat:jd_first_cut_3 # scene:jd_cutting # cast:jd_craftheir,jd_attendant # speaker:you
什么？ # beat:jd_first_cut_4 # scene:jd_cutting # cast:jd_craftheir,jd_attendant # speaker:jd_attendant # mood:jd_attendant=surprised
没什么。 # beat:jd_first_cut_5 # scene:jd_cutting # cast:jd_craftheir,jd_attendant # speaker:you
几个时辰，九处与转运路线明了。金线不能贴回原来的样子，没有哪一道暗纹忽然让你握笔的手多出内力。 # beat:jd_first_cut_6 # scene:jd_cutting # cast:jd_craftheir,jd_attendant # speaker:narrator
* [先同勘队对旧河与今日道路，把能看清的标给带路人，不把地图当山河自己搬回来。 # cid:jd_match_route]
  ~ jd_route_check = true
  一处旧河早改，册中要按验点重认。带路人把你指的水线推回半寸，问你真走过没有，你说没有，明日一起走。 # beat:jd_first_cut_7 # scene:jd_cutting # cast:jd_craftheir,jd_attendant # speaker:narrator
  外面已传九库有金有神兵。你们背走的是尺、绳、灯，不是一套等着出土的绝学。 # beat:jd_first_cut_8 # scene:jd_cutting # cast:jd_craftheir,jd_attendant # speaker:narrator
  -> first_three
* [先问能存什么、怎样验能不能用，跟勘队带空筐和试验器物，不按藏宝传闻准备金匣。 # cid:jd_match_supplies]
  ~ jd_route_check = false
  灾务官让人加了验粮的小筛，军中要看弓材与弦，不要描金的宝函。你发现真问到该怎样用，自己原来准备的纸反倒少了一摞。 # beat:jd_first_cut_9 # scene:jd_cutting # cast:jd_craftheir,jd_attendant # speaker:narrator
  街上仍有人恭喜你要见到先朝黄金，筐担在旁边，轻得很。 # beat:jd_first_cut_10 # scene:jd_cutting # cast:jd_craftheir,jd_attendant # speaker:narrator
  -> first_three

=== first_three ===
第一库挖开，塌了，空。第二库石室早被误挖，现在当酒窖。带路人还问能不能先把自家的酒抬走，仿佛你们是来征他这一窖。 # beat:jd_first_three_1 # scene:jd_first # cast:jd_fieldclerk # speaker:narrator
陆先生，宝在这边，先别踩人家的坛。 # beat:jd_first_three_2 # scene:jd_first # cast:jd_fieldclerk # speaker:jd_fieldclerk # mood:jd_fieldclerk=amused
你若再叫一声宝，我真要先替他们找个价。 # beat:jd_first_three_3 # scene:jd_first # cast:jd_fieldclerk # speaker:you
第三库进水，仓里一层黑泥，原来的粮已烂。你在门边站太久，闻见一点气味就想吐。 # beat:jd_first_three_4 # scene:jd_first # cast:jd_fieldclerk # speaker:narrator
出来。不是站得久些，底下就能长回粮。 # beat:jd_first_three_5 # scene:jd_first # cast:jd_fieldclerk # speaker:jd_fieldclerk # mood:jd_fieldclerk=uneasy
皇家被骗、真璧仍假的话传到耳边。你夜里发冷，差点病倒，十三文的笑话这一次也没能先说出来。 # beat:jd_first_three_6 # scene:jd_first # cast:jd_fieldclerk # speaker:narrator
* [把前三处实况报回，愿认自己认出了索引、没有许过库仍满，不替任何一边编好消息。 # cid:jd_tell_empty]
  ~ jd_report_empty = true
  塌、酒窖、黑泥，就按这三处报。还能找的在后面，不在我一句这回一定有。 # beat:jd_first_three_7 # scene:jd_first # cast:jd_fieldclerk # speaker:you
  我也具名。泥是我先下去看的，别只让朝里看见一个书生捧着错图。 # beat:jd_first_three_8 # scene:jd_first # cast:jd_fieldclerk # speaker:jd_fieldclerk # mood:jd_fieldclerk=intent
  你们等来继续两字，夜里多喝下一碗热水，次晨仍要出发。 # beat:jd_first_three_9 # scene:jd_first # cast:jd_fieldclerk # speaker:narrator
  -> fourth_route
* [请亲入库的带路人共同说明，自己把不懂的土层和改道交给真懂的人答。 # cid:jd_take_witness]
  ~ jd_report_empty = false
  路没假，库却真坏了。请他一起答，我不能替他把什么时候渗水说全。 # beat:jd_first_three_10 # scene:jd_first # cast:jd_fieldclerk # speaker:you
  那你也别自己先认成活该毁了玉。旧库还剩几处，查完再说。 # beat:jd_first_three_11 # scene:jd_first # cast:jd_fieldclerk # speaker:jd_fieldclerk # mood:jd_fieldclerk=intent
  报回去仍有人骂，带路人的话也一同到了。继续的命令没有附上一句保证下一处一定是金山。 # beat:jd_first_three_12 # scene:jd_first # cast:jd_fieldclerk # speaker:narrator
  -> fourth_route

=== fourth_route ===
第四、五库的旧注还要对一次。表层与残档先前怎么留过，现在决定你能不能一直跟这支队。 # beat:jd_fourth_route_1 # scene:jd_road # cast:jd_fieldclerk # speaker:narrator
{
- jd_surface:
你先前描过表层，沿旧验点把册上的转口对出，能继续跟队。第四库干净得只剩木架，不知几十年前谁搬空。 # beat:jd_fourth_route_2 # scene:jd_fourth # cast:jd_fieldclerk # speaker:narrator
搬得这样齐，反倒连哪一袋从哪儿出去也问不到。 # beat:jd_fourth_route_3 # scene:jd_fourth # cast:jd_fieldclerk # speaker:jd_fieldclerk # mood:jd_fieldclerk=uneasy
第五库有药，已坏。你亲手取一包打开，原来以为可救急的东西，散在掌中只剩粉与霉味。 # beat:jd_fourth_route_4 # scene:jd_fourth # cast:jd_fieldclerk # speaker:narrator
* [把木架尺寸与坏药分清写下，留给真管仓的人，不用一声空就把两库抹成同一种空。 # cid:jd_keep_material_record]
  ~ jd_later_work = 1
  县中管仓的带你量了通风口，讲药为什么会坏。你抄到一半，又把先前只写空的那格改了，不敢说自己这一夜便能教他管几十年仓。 # beat:jd_fourth_route_5 # scene:jd_fourth # cast:jd_fieldclerk # speaker:narrator
  -> sixth
* [帮队里清出可走的路，坏药由验药人收管，自己不拿穷书生识字就当能认一切药材。 # cid:jd_help_remove_rot]
  ~ jd_later_work = 2
  你挪空筐，验药人拦下想把霉药拿回去的人，说这不是捡漏的时辰。你腾出门侧，让他们一包包真验，不先拿好心把坏东西再发一回。 # beat:jd_fourth_route_6 # scene:jd_fourth # cast:jd_fieldclerk # speaker:narrator
  -> sixth
- else:
你先开暗刻，最早随队到过前三库，表层旧注却少一份可对。只得回档房补核，第四、五库没有跟到现场。 # beat:jd_fourth_route_7 # scene:jd_returnarchive # cast:jd_cousin # speaker:narrator
你只送回来说像这里。我怎么隔着三处山知道你指哪一寸？坐下，原册一起看。 # beat:jd_fourth_route_8 # scene:jd_returnarchive # cast:jd_cousin # speaker:jd_cousin # mood:jd_cousin=sharp
两夜后才对上。第四只剩木架、第五药坏，是同队后来送回的亲见报；你没有把那两页又抄成自己也站在里面。 # beat:jd_fourth_route_9 # scene:jd_returnarchive # cast:jd_cousin # speaker:narrator
* [付自己补抄与回程的费用，按已核页追队，不叫堂兄把他的夜也永远让给你。 # cid:jd_pay_return_work]
  ~ jd_later_work = 1
  你留这一份，我把原出处带上。今夜先回家，后面抄完的给我留到门边。 # beat:jd_fourth_route_10 # scene:jd_returnarchive # cast:jd_cousin # speaker:you
  你也睡。不是见过三处空库，就只能把自己熬成第四处空的。 # beat:jd_fourth_route_11 # scene:jd_returnarchive # cast:jd_cousin # speaker:jd_cousin # mood:jd_cousin=uneasy
  你多走的回程真从行囊里花钱，明日追队，鞋底已薄一层。 # beat:jd_fourth_route_12 # scene:jd_returnarchive # cast:jd_cousin # speaker:narrator
  -> sixth
* [先让快脚送核对页，自己晚一日走，把堂兄剩下的两册誊完后交值房。 # cid:jd_send_verified_page]
  ~ jd_later_work = 2
  快脚先去，队里不必全等你。你留到第二日晚，交完那一份才走；与第四、五库相关的亲见名仍是别人，没有因为自己多抄两册就变成亲到。 # beat:jd_fourth_route_13 # scene:jd_returnarchive # cast:jd_cousin # speaker:narrator
  -> sixth
}

=== sixth ===
第六库你又随队进去。可能原储车具、弓材，剩的不多。朝中有人后悔毁玉，老亲王说果然得不偿失，皇帝只令继续。 # beat:jd_sixth_1 # scene:jd_sixth # cast:jd_relief # speaker:narrator
我来以前，外面都问你这块宝还值多少。可给灾区报回去，等的是下一车米什么时候到。 # beat:jd_sixth_2 # scene:jd_sixth # cast:jd_relief # speaker:jd_relief # mood:jd_relief=uneasy
我连下一库是不是粮，也还不知道。 # beat:jd_sixth_3 # scene:jd_sixth # cast:jd_relief # speaker:you
那就先把今天能转的转出来。空车轴也未必一根没用。 # beat:jd_sixth_4 # scene:jd_sixth # cast:jd_relief # speaker:jd_relief # mood:jd_relief=neutral
他叫你帮记还能验过的那几件，自己去问马和路。还没到第七库，队里已没有人只等着你抬出一个漂亮答案。 # beat:jd_sixth_5 # scene:jd_sixth # cast:jd_relief # speaker:narrator
* [随粮务这一路继续开库，已经没东西可夸也亲去，不把余下三处只交给别人等好消息。 # cid:jd_take_duty]
  ~ jd_next_with_relief = true
  你接了一份今晚的转报，走完再睡。灾务官把验粮小筛带上，没叫你先承诺明日一进门就能翻身。 # beat:jd_sixth_6 # scene:jd_sixth # cast:jd_relief # speaker:narrator
  -> seventh
* [先把六处实况送全，再赶第七开门前的班，亲见与听报各保留来处。 # cid:jd_send_plain_report]
  ~ jd_next_with_relief = false
  你把六处各由谁亲入、自己哪些能答写清，报给值房。下一班赶上，第七库的石门还埋在旧河边深土里，你手里不再只有那一张让人来恭喜的买玉故事。 # beat:jd_sixth_7 # scene:jd_sixth # cast:jd_relief # speaker:narrator
  -> seventh

=== seventh ===
第七库在旧河边。第一道石门打开，里面干燥；第二道再开，层层旧仓堆到灯照不全的地方。 # beat:jd_seventh_1 # scene:jd_seventh # cast:jd_relief # speaker:narrator
不是百年粮都能吃。外层许多坏了，内层有后代维护的痕迹，验过能用的，仍多得惊人。你扶着门边石壁，没立刻想起自己那十三文。 # beat:jd_seventh_2 # scene:jd_seventh # cast:jd_relief # speaker:narrator
灾务官站了很久，转身眼睛是红的。他没看玉，只说开仓。 # beat:jd_seventh_3 # scene:jd_seventh # cast:jd_relief # speaker:narrator
验一批，出一批。坏的别混，路上会下雨，棚布先搭。 # beat:jd_seventh_4 # scene:jd_seventh # cast:jd_relief # speaker:jd_relief # mood:jd_relief=intent
一辆、十辆、百辆，粮车沿灾区分送。路边来领粥的人不认识你，也不知道玉在哪里，先问今日能不能给一家人都盛上。 # beat:jd_seventh_5 # scene:jd_seventh # cast:jd_relief # speaker:narrator
* [先接近处人，问一碗粥怎样送到没来的那口人手里，发粥请另一班接锅。 # cid:jd_receive_people]
  ~ jd_family_list = true
  你把锅交给已到的伙计，自己蹲到端空碗的母女旁。母亲阿荞说父亲手麻，走得慢，先在上游木亭等；孩子怕你以为他不来便不算一口。 # beat:jd_seventh_6 # scene:jd_seventh # cast:jd_relief # speaker:narrator
  哪座木亭？你来回多远？ # beat:jd_seventh_7 # scene:jd_seventh # cast:jd_relief # speaker:you
  她指给你看，你在交班木牌边另标这一家去处，交阿荞自己核。少发的一轮由你稍后补班，不白叫锅边人替你多站。 # beat:jd_seventh_8 # scene:jd_seventh # cast:jd_relief # speaker:narrator
  -> porridge
* [先把热粥发过雨前这一班，阿荞一家由后班再问，承认自己还没认全不在场的人。 # cid:jd_keep_porridge_hot]
  ~ jd_family_list = false
  雨要落，你先帮锅边人一碗碗送。阿荞问能否给父亲带一份，你答能，让她先拿热的走；他在哪里、谁还同等，要请下一班再问。 # beat:jd_seventh_9 # scene:jd_seventh # cast:jd_relief # speaker:narrator
  她带孩子走了。你多发完一轮热粥，木牌上仍没她父亲那处木亭，空的这一项并没有因为眼前人少了就补上。 # beat:jd_seventh_10 # scene:jd_seventh # cast:jd_relief # speaker:narrator
  -> porridge

=== porridge ===
别给孩子再添了，这碗要给我爹。她吃过，不是我舍不得给她。 # beat:jd_porridge_1 # scene:jd_roadside # cast:jd_qiao # speaker:jd_qiao # mood:jd_qiao=intent
我帮你端一程？ # beat:jd_porridge_2 # scene:jd_roadside # cast:jd_qiao # speaker:you
给我一块布就好，碗太烫。你那边还排着。 # beat:jd_porridge_3 # scene:jd_roadside # cast:jd_qiao # speaker:jd_qiao # mood:jd_qiao=neutral
你把干布递她。小女孩先揪住布角，替母亲让出一只手提包；两人不是在你眼前等哭完，便会自己安全回家的背景。 # beat:jd_porridge_4 # scene:jd_roadside # cast:jd_qiao # speaker:narrator
你们明日还在这里么？ # beat:jd_porridge_5 # scene:jd_roadside # cast:jd_qiao # speaker:jd_qiao # mood:jd_qiao=uneasy
这班按车来。我把下一班到哪儿告诉你，不许一个我还不知道的永远。 # beat:jd_porridge_6 # scene:jd_roadside # cast:jd_qiao # speaker:you
她问到能找人的地方才走。外面仍有人争玉归谁，这一碗却得趁热送到一个握不了碗的人手里。 # beat:jd_porridge_7 # scene:jd_roadside # cast:jd_qiao # speaker:narrator
* [补完自己让出的班，把来车时辰交给能问到的人，不在开仓欢喜时忽然全走。 # cid:jd_finish_shift]
  ~ jd_paid_shift = true
  你站回锅边，一班真做完才离。阿荞后来带着空碗来，不先谢宝，问有没有一段绳把包扎牢。 # beat:jd_porridge_8 # scene:jd_roadside # cast:jd_qiao # speaker:narrator
  你们找了绳，她把湿布搭在车边，自己去帮后来那家拿碗。 # beat:jd_porridge_9 # scene:jd_roadside # cast:jd_qiao # speaker:narrator
  -> eighth
* [先替下一批找接手的人，自己随勘队继续，给未见的去处留下真能接问的一班。 # cid:jd_find_next_team]
  ~ jd_paid_shift = false
  接班人走到锅边应了，你才跟队去第八库。阿荞回来找的是那个能答车次的人，没有因为你不在就只剩一张写过字的木牌。 # beat:jd_porridge_10 # scene:jd_roadside # cast:jd_qiao # speaker:narrator
  -> eighth

=== eighth ===
第八库是军械。旧弓、箭簇、甲片、弩机，很多废了，密封好的还有可用。更要紧的是靠近边境转运线，位置本身也要守。 # beat:jd_eighth_1 # scene:jd_eighth # cast:jd_fieldclerk # speaker:narrator
你摸这根弦，别拉。有些看着还在，一用就断。 # beat:jd_eighth_2 # scene:jd_eighth # cast:jd_fieldclerk # speaker:jd_fieldclerk # mood:jd_fieldclerk=intent
那这一架也得拆开验。 # beat:jd_eighth_3 # scene:jd_eighth # cast:jd_fieldclerk # speaker:you
他叫来真会验的人。你帮移箱，把坏与好的分开，不拿成排弓架给外面讲又找到多少先朝神兵。 # beat:jd_eighth_4 # scene:jd_eighth # cast:jd_fieldclerk # speaker:narrator
边境敌对势力终于认出这不是普通寻宝。朝廷加强守备，几条线另一端的人，却开始想怎样把能给前线与灾区的粮烧掉。 # beat:jd_eighth_5 # scene:jd_eighth # cast:jd_fieldclerk # speaker:narrator
* [跟验械者逐件分可用、待修、报废，送去的是能上路的数，不是整库数量。 # cid:jd_note_usable]
  ~ jd_tools_check = true
  你搬到第三箱，肩已酸。验械者拿回你误放好筐的一只弩机，说里边卡着锈。你把数减回去，那一格不像初入库时那么好看。 # beat:jd_eighth_6 # scene:jd_eighth # cast:jd_fieldclerk # speaker:narrator
  -> ninth
* [先核装车与替换弦材，请验械者留件数，自己去看车轮能否真载出门。 # cid:jd_note_transfer]
  ~ jd_tools_check = false
  一只轴销松，你同车夫卸掉半车再装。方才第六库没多少人看得上的车具，这回替一辆真要往边地走的车补住了轮。 # beat:jd_eighth_7 # scene:jd_eighth # cast:jd_fieldclerk # speaker:narrator
  -> ninth

=== ninth ===
第九库最小，没有金，没有神兵，也没有粮。你看见的是档案：初建、维护、备用路线，以及山河璧原来那份用途。 # beat:jd_ninth_1 # scene:jd_ninth # cast:jd_fieldclerk # speaker:narrator
一百六十余年前，内府、枢密与户部为边患、水灾、断漕设九处互不相知的储备。玉是索引半图，与册同读，验粮道与旧库，不是天命。 # beat:jd_ninth_2 # scene:jd_ninth # cast:jd_fieldclerk # speaker:narrator
旧批上，最初的皇帝说玉丢不算大事，库丢才算。你看了很久，递到旁边，没人笑。 # beat:jd_ninth_3 # scene:jd_ninth # cast:jd_fieldclerk # speaker:narrator
我原先也想，找到了可以先叫一回宝。这句若早有人记着，能少死多少？ # beat:jd_ninth_4 # scene:jd_ninth # cast:jd_fieldclerk # speaker:jd_fieldclerk # mood:jd_fieldclerk=uneasy
旧档不替一百年算清答案。韩慎因改两页账怕罪南逃，顺手拿玉；清江门第三夜破、韩死，柳观河后以玉想通自己的剑。人一直替它添意义，工具那一栏却空了。 # beat:jd_ninth_5 # scene:jd_ninth # cast:jd_fieldclerk # speaker:narrator
* [先抄原用途与维护条目，留给接仓的人，不将初批只抄作一句骂后人的漂亮话。 # cid:jd_copy_use]
  ~ jd_use_record = true
  哪条路改过、谁维护过，这些也留。不能只有最早那一句，后面又忘怎么接。 # beat:jd_ninth_6 # scene:jd_ninth # cast:jd_fieldclerk # speaker:you
  我找本地真认路的来。你读，我问，别再一册抄全便说这一库从此不会丢。 # beat:jd_ninth_7 # scene:jd_ninth # cast:jd_fieldclerk # speaker:jd_fieldclerk # mood:jd_fieldclerk=intent
  -> clans
* [先核各层旧字由谁写、哪年添，不把后修补当最初都已经计划好。 # cid:jd_copy_origin]
  ~ jd_use_record = false
  你认出几处不同的手，找当年维护的痕迹来对。第七库能存下内层粮，原来也不只靠一百年前一把神奇的锁。 # beat:jd_ninth_8 # scene:jd_ninth # cast:jd_fieldclerk # speaker:narrator
  -> clans

=== clans ===
完整图已经抄开，真玉暂留第九库待回京。第七库的守备却越来越紧，敌方联黑道与内应，目标不是抢玉，是烧粮。 # beat:jd_clans_1 # scene:jd_muster # cast:jd_red,jd_kite # speaker:narrator
红叶庄与铁鹞门的年轻人也来了。官府先前问两家为何查玉，一边说杀太师祖，另一边说是对方先杀；追问最初为何抢，停了半天，只剩山河璧。 # beat:jd_clans_2 # scene:jd_muster # cast:jd_red,jd_kite # speaker:narrator
东西六十多年早丢了。可他们去年伤过我师兄。 # beat:jd_clans_3 # scene:jd_muster # cast:jd_red,jd_kite # speaker:jd_red # mood:jd_red=uneasy
你们前年先伤的人。说到今年，你还要我替你那口气先认全？ # beat:jd_clans_4 # scene:jd_muster # cast:jd_red,jd_kite # speaker:jd_kite # mood:jd_kite=sharp
四代仇不是一句笑话就能停。两人都带着兵器，也都知道今夜真让粮烧了，死的不会只剩他们认得的两个师门。 # beat:jd_clans_5 # scene:jd_muster # cast:jd_red,jd_kite # speaker:narrator
* [问今夜各守哪一处，把眼前要接的车与人说明，不替四代伤亡一笔判清。 # cid:jd_ask_present]
  ~ jd_clans_plain = true
  旧仇我没资格替你们消。今夜这辆车从谁那边过？让抬伤的人知道往哪儿喊。 # beat:jd_clans_6 # scene:jd_muster # cast:jd_red,jd_kite # speaker:you
  我守西口。他们若肯接东边，车能绕。 # beat:jd_clans_7 # scene:jd_muster # cast:jd_red,jd_kite # speaker:jd_red # mood:jd_red=intent
  东口我在。不是答应明日看见你就当去年没事。 # beat:jd_clans_8 # scene:jd_muster # cast:jd_red,jd_kite # speaker:jd_kite # mood:jd_kite=neutral
  两人把今夜的地方说清，没有人替他们提前写成多年世仇从此全无。 # beat:jd_clans_9 # scene:jd_muster # cast:jd_red,jd_kite # speaker:narrator
  -> thieves
* [先替两边挪开堵路的车轴，让他们自己向对面报守位，不把谁站错写成祖训。 # cid:jd_move_cart]
  ~ jd_clans_plain = false
  你要抬轴，红叶少主先抓另一头，铁鹞弟子也搭手。轴挪开，两人才互报东西口，手松时又各看对方一眼，没有笑成一对早已没伤过彼此的人。 # beat:jd_clans_10 # scene:jd_muster # cast:jd_red,jd_kite # speaker:narrator
  -> thieves

=== thieves ===
皇家侍卫、地方军、商队护卫、门派、盗门都进守库的班。有人笑盗门最会偷，怎么开始替朝廷看东西。 # beat:jd_thieves_1 # scene:jd_muster # cast:jd_thief # speaker:narrator
我们偷的是有主的东西。 # beat:jd_thieves_2 # scene:jd_muster # cast:jd_thief # speaker:jd_thief # mood:jd_thief=intent
粮不是？ # beat:jd_thieves_3 # scene:jd_muster # cast:jd_thief # speaker:you
老人看远处灾民车队，不看侍卫腰牌。 # beat:jd_thieves_4 # scene:jd_muster # cast:jd_thief # speaker:narrator
现在它有太多主。 # beat:jd_thieves_5 # scene:jd_muster # cast:jd_thief # speaker:jd_thief # mood:jd_thief=neutral
你想到沈与江那些旧传闻：不是把谁一夜改成圣人，眼前这一车总要有人真接住。老人自己挑了一处能守的门角，不等你给他安排一句受感动的差事。 # beat:jd_thieves_6 # scene:jd_muster # cast:jd_thief # speaker:narrator
* [把取水、挪车与接民的缺人处给当值者看，自己认一处能补的班。 # cid:jd_help_water]
  ~ jd_prep_water = true
  你同人搬水，发现一担下去才能浇湿半张布。有人叫你先别把衣裳都淋没，后面接伤者还得有干的。你留了一捆到外廊，记下交谁取。 # beat:jd_thieves_7 # scene:jd_muster # cast:jd_thief # speaker:narrator
  -> choose_post
* [先认七库与九库往来的转报人，粮路和档路分开，不让两处都等同一个快脚。 # cid:jd_help_signal]
  ~ jd_prep_water = false
  你把两路分给真能跑的人，自己只认到最后一个转口。再远的地方请本人报，不把一声传到了当两处都已有人答。 # beat:jd_thieves_8 # scene:jd_muster # cast:jd_thief # speaker:narrator
  -> choose_post

=== choose_post ===
最后分岗。第七库要守粮车与接民，第九库要护完整图、旧档与待回京真璧。你不领兵，也不能站在两处同时看见每一刀。 # beat:jd_choose_post_1 # scene:jd_muster # cast:jd_relief,jd_fieldclerk # speaker:narrator
来七库，就接车和人。刀口留给能守的，别为看一位老前辈出手走空自己这一班。 # beat:jd_choose_post_2 # scene:jd_muster # cast:jd_relief,jd_fieldclerk # speaker:jd_relief # mood:jd_relief=intent
来九库，就跟我护档。玉旁有侍卫，不是请你用抄字的手去夺刺客的刀。 # beat:jd_choose_post_3 # scene:jd_muster # cast:jd_relief,jd_fieldclerk # speaker:jd_fieldclerk # mood:jd_fieldclerk=neutral
* [留第七库，接粮车、近处民众与回报；第九库消息由亲历者带来。 # cid:jd_stay_grain]
  ~ jd_post = 1
  我在第七这边。若那边有讯，报到外廊这班，不说我也在原处看见了。 # beat:jd_choose_post_4 # scene:jd_muster # cast:jd_relief,jd_fieldclerk # speaker:you
  你把九库那份副图交出去，随粮车回到真正要守的门外。 # beat:jd_choose_post_5 # scene:jd_muster # cast:jd_relief,jd_fieldclerk # speaker:narrator
  -> post_gate
* [留第九库，护档接转报；第七库的战与救援等那里的人回来核。 # cid:jd_stay_records]
  ~ jd_post = 2
  我在第九。粮务问来的那一家去处，也交第七的人，别因为我走便把他们从木牌上擦掉。 # beat:jd_choose_post_6 # scene:jd_muster # cast:jd_relief,jd_fieldclerk # speaker:you
  你把锅边与车路那一份托出，留在真正有档可护的那扇门。 # beat:jd_choose_post_7 # scene:jd_muster # cast:jd_relief,jd_fieldclerk # speaker:narrator
  -> post_gate

=== post_gate ===
入夜，两路都起了急声。你站到自己答应的位置上，先认那一声到底从哪边来。 # beat:jd_post_gate_1 # scene:jd_muster # cast:none # speaker:narrator
{
- jd_post == 1:
-> grain_night
- else:
-> records_night
}

=== grain_night ===
你回第七库，入夜外路先乱。官军守门，粮车仍得过，近处一个老人却说自己不替朝廷看仓。 # beat:jd_grain_night_1 # scene:jd_grainnight # cast:jd_relief,jd_retired # speaker:narrator
不是替朝廷。有人要烧粮，给灾民，也给前线。 # beat:jd_grain_night_2 # scene:jd_grainnight # cast:jd_relief,jd_retired # speaker:jd_relief # mood:jd_relief=intent
早说。 # beat:jd_grain_night_3 # scene:jd_grainnight # cast:jd_relief,jd_retired # speaker:jd_retired # mood:jd_retired=neutral
这位退下总谱的老人物留下了。你没得空问他的旧席次，脚边刚停一辆车，轮后还跟着两个找不到本班的人。 # beat:jd_grain_night_4 # scene:jd_grainnight # cast:jd_relief,jd_retired # speaker:narrator
* [守车转弯处，先让慢的人离轮，不因老前辈到了就以为所有口都有人接。 # cid:jd_hold_cart_turn]
  ~ jd_grain_work = 1
  你把两个人领到墙边，车才能拐。另一侧刀碰声已到，能挡刀的没有因此替你多长出一只接包的手。 # beat:jd_grain_night_5 # scene:jd_grainnight # cast:jd_relief,jd_retired # speaker:narrator
  -> two_fighters
* [接水担与湿布，分给真正迎敌的人，自己不提一根木杠便往高手中间挤。 # cid:jd_carry_water]
  ~ jd_grain_work = 2
  你接到第二担，手掌已发麻。老人从你身旁拿一条湿布往门后抛，叫那边先压住火种，自己继续看近处来人。 # beat:jd_grain_night_6 # scene:jd_grainnight # cast:jd_relief,jd_retired # speaker:narrator
  -> two_fighters

=== two_fighters ===
来敌两名顶尖高手，一人刀开近线，一人长剑压老人退处。他先让过刀锋，不同那一刀硬争，身已站到长剑要转回的位置。 # beat:jd_two_fighters_1 # scene:jd_grainfight # cast:jd_retired,jd_blade,jd_sword # speaker:narrator
别叫他把我们拆开。绕！ # beat:jd_two_fighters_2 # scene:jd_grainfight # cast:jd_retired,jd_blade,jd_sword # speaker:jd_sword # mood:jd_sword=sharp
刀客换侧，老人先收半步，把身后门留在自己肩后。两个人能逼他，却始终没把他从粮路前调开。 # beat:jd_two_fighters_3 # scene:jd_grainfight # cast:jd_retired,jd_blade,jd_sword # speaker:narrator
后面火一起，你还守哪一边？ # beat:jd_two_fighters_4 # scene:jd_grainfight # cast:jd_retired,jd_blade,jd_sword # speaker:jd_blade # mood:jd_blade=intent
先过我这边。 # beat:jd_two_fighters_5 # scene:jd_grainfight # cast:jd_retired,jd_blade,jd_sword # speaker:jd_retired # mood:jd_retired=sharp
你看得见的是门前始终有个人，自己若为看清每次换手再凑近半丈，车就得从两个高手的余势边上挤。 # beat:jd_two_fighters_6 # scene:jd_grainfight # cast:jd_retired,jd_blade,jd_sword # speaker:narrator
* [把人行与车行分到已喊应的两处，放掉看完每招的机会。 # cid:jd_keep_people_lane]
  ~ jd_people_lane = true
  慢的跟这边，车等这一班脚过去！ # beat:jd_two_fighters_7 # scene:jd_grainfight # cast:jd_retired,jd_blade,jd_sword # speaker:you
  红叶少主在西口应，铁鹞弟子在东边接。两个人都看见对方仍在，没人趁他去救近处人便补一剑四代旧仇。 # beat:jd_two_fighters_8 # scene:jd_grainfight # cast:jd_retired,jd_blade,jd_sword # speaker:narrator
  -> grain_held
* [先把卡住的粮车往安全处卸半担，给护送者留路，叫慢的人由另一班接。 # cid:jd_keep_grain_lane]
  ~ jd_people_lane = false
  这半担先卸，我同你抬。那边谁接？应一声！ # beat:jd_two_fighters_9 # scene:jd_grainfight # cast:jd_retired,jd_blade,jd_sword # speaker:you
  东口应了，西边才挪。你抬到肩酸，掌风响在门外，没有拿一车没翻当自己也能接住老人那一掌。 # beat:jd_two_fighters_10 # scene:jd_grainfight # cast:jd_retired,jd_blade,jd_sword # speaker:narrator
  -> grain_held

=== grain_held ===
老人独拦两名高手近百招，留出转车与接人的时间。夜里火种被压，门始终在守者后面；第七库最终没有烧，敌方撤走，粮仍往外走。 # beat:jd_grain_held_1 # scene:jd_grainnight # cast:jd_relief,jd_red,jd_kite # speaker:narrator
打完再算旧账。 # beat:jd_grain_held_2 # scene:jd_grainnight # cast:jd_relief,jd_red,jd_kite # speaker:jd_red # mood:jd_red=uneasy
还有旧账？ # beat:jd_grain_held_3 # scene:jd_grainnight # cast:jd_relief,jd_red,jd_kite # speaker:jd_kite # mood:jd_kite=amused
两人望一眼，没再说。并肩不等于去年那道伤没了，今夜却真没有把另一个当自己该先打倒的人。 # beat:jd_grain_held_4 # scene:jd_grainnight # cast:jd_relief,jd_red,jd_kite # speaker:narrator
第九库有火讯。把这里已守住报过去，别叫那边还以为粮一车没出。 # beat:jd_grain_held_5 # scene:jd_grainnight # cast:jd_relief,jd_red,jd_kite # speaker:jd_relief # mood:jd_relief=neutral
* [先送粮路实况与未到的车次，自己留到这班交完，不报全线都已无事。 # cid:jd_send_grain_status]
  ~ jd_grain_after = 1
  快脚带走的是第七库已守住、哪班仍在路上。你守在外廊，等最后一辆慢车到，才把自己的这班交出去。 # beat:jd_grain_held_6 # scene:jd_grainnight # cast:jd_relief,jd_red,jd_kite # speaker:narrator
  -> night_reports
* [先同近处民众认人、认车，回报交给本来负责的快脚，不让每一件小事都等自己。 # cid:jd_check_displaced]
  ~ jd_grain_after = 2
  你走到灶棚边找阿荞，先看到她女儿抱着空碗。母亲没有先问你玉怎么样，张口问的是她爹被送到哪一边。 # beat:jd_grain_held_7 # scene:jd_grainnight # cast:jd_relief,jd_red,jd_kite # speaker:narrator
  -> night_reports

=== night_reports ===
转车时，一班粮路往南，一班护病者先送县里。阿荞父亲也在其中，腿能慢走，手却拿不了自己的行囊。 # beat:jd_night_reports_1 # scene:jd_grainafter # cast:jd_qiao # speaker:narrator
{
- jd_family_list:
你先前问清木亭，把不在锅边的人记上，交阿荞本人核过。两班一认名，先把老人接回同一路。她拿热布裹住父亲的手，让女儿扶包，没再被人流分开。 # beat:jd_night_reports_2 # scene:jd_grainafter # cast:jd_qiao # speaker:narrator
我认得你写哪一口人。不是你问过以后就都听你的，是我真能拿着去问。 # beat:jd_night_reports_3 # scene:jd_grainafter # cast:jd_qiao # speaker:jd_qiao # mood:jd_qiao=intent
她把木牌递回交班处，自己又去帮下一家认名。 # beat:jd_night_reports_4 # scene:jd_grainafter # cast:jd_qiao # speaker:narrator
- else:
你先发了热粥，那一项没问全，也没由后班及时补到。粮路南行，护病车北送，阿荞到木亭时父亲已不在，问到最后只知道被接走，并不知道是哪一班。 # beat:jd_night_reports_5 # scene:jd_grainafter # cast:jd_qiao # speaker:narrator
你别叫我先放心。我得先知道他在哪儿。 # beat:jd_night_reports_6 # scene:jd_grainafter # cast:jd_qiao # speaker:jd_qiao # mood:jd_qiao=uneasy
你把两班已走的地方逐个问出。阿荞带孩子去接报处等下一程消息，今晚仍未找到父亲；护病车往北，粮车往南，两边都得请真到的人接问。 # beat:jd_night_reports_7 # scene:jd_grainafter # cast:jd_qiao # speaker:narrator
}
* [交清仍未认到的人，不拿库守住便说每个家庭都同样完整，后面再接第九库报。 # cid:jd_close_local_shift]
  你把这班交完。报捷的纸没有抹掉旁边那一份未认到的名字，大家能把门守住，仍有人得替走散的一家多问几处。 # beat:jd_night_reports_8 # scene:jd_grainafter # cast:jd_qiao # speaker:narrator
  -> rejoin
* [先找真往返两库的人问火讯，自己的未交事项请当值者认接后再走。 # cid:jd_go_to_witness]
  当值者接下了你手里的最后两问，你才去见第九库回来的快脚。那一夜别处的刀与碎裂，到此还是他的亲见，不是你的。 # beat:jd_night_reports_9 # scene:jd_grainafter # cast:jd_qiao # speaker:narrator
  -> rejoin

=== records_night ===
你留第九库。完整图已抄，真璧待送回京，架上还有初建与维护的旧档。风从门外灌进来，火光先在外侧翻了一下。 # beat:jd_records_night_1 # scene:jd_recordsnight # cast:jd_fieldclerk # speaker:narrator
低下！ # beat:jd_records_night_2 # scene:jd_recordsnight # cast:jd_fieldclerk # speaker:jd_fieldclerk # mood:jd_fieldclerk=sharp
一支燃箭落在空筐，侍卫扑开近处火。你抱起正在核的册，旁边一名刺客已从另一侧抢到真玉，转身要出。 # beat:jd_records_night_3 # scene:jd_recordsnight # cast:jd_fieldclerk # speaker:narrator
你认出旧银补，却没有因此变得比刀快。侍卫去截，刀锋到近处，逼得持玉者先向石阶退。 # beat:jd_records_night_4 # scene:jd_recordsnight # cast:jd_fieldclerk # speaker:narrator
* [压湿帘护住档案出口，把仍能走的人带向已经有人接的外廊。 # cid:jd_wet_screen]
  ~ jd_records_work = 1
  湿帘浇到你袖口，你仍先试外廊有没有人应。县吏把开着的匣推给你，门内的刀由侍卫接，你不为看一块旧物便站到两人中间。 # beat:jd_records_night_5 # scene:jd_recordsnight # cast:jd_fieldclerk # speaker:narrator
  -> three_impacts
* [先挪开堵门的书箱，让护卫与抱档人有退步处，自己不追那只持玉手。 # cid:jd_clear_stack]
  ~ jd_records_work = 2
  你同县吏抬箱，肩顶到架脚，终于挪出一人能过的口。身后兵器一碰，玉落声比你想得更闷，你仍得先接住眼前这只箱。 # beat:jd_records_night_6 # scene:jd_recordsnight # cast:jd_fieldclerk # speaker:narrator
  -> three_impacts

=== three_impacts ===
真璧第一次落到石阶，没碎。刺客还想抢，侍卫刀背随后击中，旧银补脱开，那道补过的西角先露出缝。 # beat:jd_three_impacts_1 # scene:jd_ninthfire # cast:none # speaker:narrator
第三下冲撞，玉又落向下一段硬阶。几大片、数小片，沿阶散开。剥过的金线在火光里一闪，没人再能抱起一块完整的真山河璧。 # beat:jd_three_impacts_2 # scene:jd_ninthfire # cast:none # speaker:narrator
你手里的册边也热起来。人正往外退，侍卫还要截近处来敌；谁也没为捡一片玉，把能过人的门重新堵上。 # beat:jd_three_impacts_3 # scene:jd_ninthfire # cast:none # speaker:narrator
* [带出自己唯一一份勘库旁注，先把近处伤者交给已应声的护卫，再穿湿帘。 # cid:jd_take_private_notes]
  ~ jd_notes_kept = true
  护卫接了人，你才抱自己的旁注过去。帘边一片烧木擦到右手，皮肉燎伤，你没再多拿一匣；原档与完整图已由别班接出去。 # beat:jd_three_impacts_4 # scene:jd_ninthfire # cast:none # speaker:narrator
  稿保住了，手要养一月，你后面的几页得请人代笔，不能再说只有字写得好，便从头到尾全靠自己。 # beat:jd_three_impacts_5 # scene:jd_ninthfire # cast:none # speaker:narrator
  -> ninth_out
* [放下自己那册旁注，先扶近处伤者出门；原档和图已有别班接，不拿一册私稿挡路。 # cid:jd_leave_private_notes]
  ~ jd_notes_kept = false
  你松开自己的稿，扶人穿出门。回头火已压过那一角，几页勘库私注没了，原档与完整图仍在外廊，没因你放掉自己那册就一同失去。 # beat:jd_three_impacts_6 # scene:jd_ninthfire # cast:none # speaker:narrator
  手没受重伤，回去要从还能核的人与原册重做，不把自己忘了的那几句补成原来一字不差。 # beat:jd_three_impacts_7 # scene:jd_ninthfire # cast:none # speaker:narrator
  -> ninth_out

=== ninth_out ===
外廊，原档与完整图接到人手里。最大残片后来才由守者拾出，准备送回宫，不是你们破火时人人抢在前面分了一片。 # beat:jd_ninth_out_1 # scene:jd_ninthafter # cast:jd_fieldclerk # speaker:narrator
你那十三文，真没了。 # beat:jd_ninth_out_2 # scene:jd_ninthafter # cast:jd_fieldclerk # speaker:jd_fieldclerk # mood:jd_fieldclerk=uneasy
粮那边怎样？ # beat:jd_ninth_out_3 # scene:jd_ninthafter # cast:jd_fieldclerk # speaker:you
回报还没到。别让我猜你最想听的那句。 # beat:jd_ninth_out_4 # scene:jd_ninthafter # cast:jd_fieldclerk # speaker:jd_fieldclerk # mood:jd_fieldclerk=neutral
你把衣袖浸湿，坐下等，第一次很想有人立刻给一个好消息，却只能让那一程路真有人跑完。 # beat:jd_ninth_out_5 # scene:jd_ninthafter # cast:jd_fieldclerk # speaker:narrator
* [先报第九库档与图已出、真玉碎，伤者另列，不拿原片在便说玉完整无失。 # cid:jd_send_records_status]
  ~ jd_records_after = 1
  回信一份份送。你报的是亲手交到外廊的人与物，不补第七库今夜怎样；给别人一个能继续问的收件处，胜过替没见的那头先报平安。 # beat:jd_ninth_out_6 # scene:jd_ninthafter # cast:jd_fieldclerk # speaker:narrator
  -> seventh_report
* [帮院外等讯的人找当值者，自己的稿或伤先交一份真实说明，不让大家围着一块残片猜。 # cid:jd_help_waiting]
  ~ jd_records_after = 2
  你把人带到接报处。有位抱着旧匣的守者问该不该先修角，你还没答，第七库的快脚终于到了。 # beat:jd_ninth_out_7 # scene:jd_ninthafter # cast:jd_fieldclerk # speaker:narrator
  -> seventh_report

=== seventh_report ===
第七库回报：粮守住，库没有烧，敌方撤。退总谱的老人物独拦两名高手近百招，红叶与铁鹞同守车路，不是你在第九库也亲见过的那一夜。 # beat:jd_seventh_report_1 # scene:jd_return # cast:jd_red # speaker:narrator
老人后来听人问是不是为璧，骂谁管那块破玉。你可别给我抄成他嫌粮不值钱。 # beat:jd_seventh_report_2 # scene:jd_return # cast:jd_red # speaker:jd_red # mood:jd_red=intent
你请他把自己站的西口和东口怎么相接讲清，没把近百招演得像自己能逐手辨认。 # beat:jd_seventh_report_3 # scene:jd_return # cast:jd_red # speaker:narrator
{
- jd_family_list:
阿荞带来一张口信。你先前问过的木亭和家人已交到第七库本人手里，夜里转车时对上名，老人跟母女到同一路，没有被粮车与护病车分开。 # beat:jd_seventh_report_4 # scene:jd_return # cast:jd_red # speaker:narrator
她写得不好看，仍特意添了自己核过那一行。那张木牌能用，不只是因为你当时肯多写几个字。 # beat:jd_seventh_report_5 # scene:jd_return # cast:jd_red # speaker:narrator
- else:
快脚另报阿荞父亲被护病车北送，母女随粮路向南。锅边那项未补全，夜里转车来不及相认。你把两路本人真走过的地方逐个托问，此刻还只有去向，没有重逢的回信。 # beat:jd_seventh_report_6 # scene:jd_return # cast:jd_red # speaker:narrator
你将尚未核到的人另记一页，等两路继续回话，没把粮守住就当找人这一项也做完。 # beat:jd_seventh_report_7 # scene:jd_return # cast:jd_red # speaker:narrator
}
* [将两处报合在一册，亲见与转闻各留名字，不把自己留九就写成同时守过七。 # cid:jd_take_mixed_report]
  红叶少主核了他那一页，县吏核第九库那一页。你把笔留在中间，各有一段真从他人手里接来的事。 # beat:jd_seventh_report_8 # scene:jd_return # cast:jd_red # speaker:narrator
  -> rejoin
* [先接走散人家的后续，旧档交本人看守，等同伴回来再合报，不因玉已碎便无事可做。 # cid:jd_follow_missing_family]
  你没有再摸那只装残片的匣。要找的人还在别条路上，今日能问到哪一班，先从那一班问起。 # beat:jd_seventh_report_9 # scene:jd_return # cast:jd_red # speaker:narrator
  -> rejoin

=== rejoin ===
天亮后，两处的报终于并在一起：第七粮守住，军械随后转出；第九真璧碎，原档与完整图已在。每一份都有人亲到，没一份能只靠旧物的名自己成立。 # beat:jd_rejoin_1 # scene:jd_return # cast:jd_relief,jd_fieldclerk # speaker:narrator
{
- jd_post == 1:
第九库县吏向你讲三次冲撞：先落石阶未碎，刀背打中旧银补脱，再一次硬碰后裂开。你在粮路听到这个次序，没有把他手上焦黑的匣说成自己在火中抢下的。 # beat:jd_rejoin_2 # scene:jd_return # cast:jd_relief,jd_fieldclerk # speaker:narrator
原片还像你当初那十三文买的么？ # beat:jd_rejoin_3 # scene:jd_return # cast:jd_relief,jd_fieldclerk # speaker:jd_fieldclerk # mood:jd_fieldclerk=uneasy
没见，不能替它答。你说最大的那片收好，我想先看你手里这份图。 # beat:jd_rejoin_4 # scene:jd_return # cast:jd_relief,jd_fieldclerk # speaker:you
- else:
你把第九库自己所见交出，粮路那一份由灾务官与守口的人核。有人来夸你一夜两处都保全，你只得先把这句拆开，告诉他自己没站过第七库的刀口。 # beat:jd_rejoin_5 # scene:jd_return # cast:jd_relief,jd_fieldclerk # speaker:narrator
}
* [两地各留真接手的人，自己能核的核，不让上报只剩陆文简三个字。 # cid:jd_keep_two_witnesses]
  ~ jd_credit_shared = true
  县吏、粮务、守口与接民的各报一段。你依次让开笔的位置，手里仍有自己的职责，不因愿意交出名字便自动做完未交的活。 # beat:jd_rejoin_6 # scene:jd_return # cast:jd_relief,jd_fieldclerk # speaker:narrator
  -> family_return
* [先补交没到的物、没问清的人，合报交当值者，自己不留在残片匣前等恭喜。 # cid:jd_finish_unreturned]
  ~ jd_credit_shared = false
  你离开装残片的匣，去找走散人的回信与尚未到的车。晚一日交完，回报里你那一段短了，未了的却真少了几件。 # beat:jd_rejoin_7 # scene:jd_return # cast:jd_relief,jd_fieldclerk # speaker:narrator
  -> family_return

=== family_return ===
二十余日以后，你们再到转粮处，阿荞一家也在。她先看下一车往哪里，不再只看谁拿着官署的纸。 # beat:jd_family_return_1 # scene:jd_roadside # cast:jd_qiao # speaker:narrator
{
- jd_family_list:
爹同我们在一处。明日有工，我能去，孩子先同他等。我不是要你一直送粥，先问到哪儿还有一家人能接的活。 # beat:jd_family_return_2 # scene:jd_roadside # cast:jd_qiao # speaker:jd_qiao # mood:jd_qiao=intent
你把干粮分包的几个时段给她看，按工算。她问哪班能回去照应父亲，还没有答应接下哪一班。 # beat:jd_family_return_3 # scene:jd_roadside # cast:jd_qiao # speaker:narrator
- else:
二十日后父女才重逢。找人的路费和投宿都在，这回冬粮得少一截。我收你的补差，但不是收你一句从此都好。 # beat:jd_family_return_4 # scene:jd_roadside # cast:jd_qiao # speaker:jd_qiao # mood:jd_qiao=uneasy
你拿后来能领到的酬钱先补找人路费，另给真能上车的去处让她自己选。她认自己那一家的数，不肯替所有走散的人说已安顿。 # beat:jd_family_return_5 # scene:jd_roadside # cast:jd_qiao # speaker:narrator
}
* [给她可选的有酬班和能回家的时辰，缺的差自己补，不把受过救济当终身人情。 # cid:jd_offer_paid_shift]
  ~ jd_qiao_work = true
  她选了半日，你把另半日交别班。女儿替祖父拿着那块布，不再只在排队时攥住母亲的衣角。 # beat:jd_family_return_6 # scene:jd_roadside # cast:jd_qiao # speaker:narrator
  下回来，你若只夸我爹认得字，他照样拿不了滚烫的碗。记得先把布给他。 # beat:jd_family_return_7 # scene:jd_roadside # cast:jd_qiao # speaker:jd_qiao # mood:jd_qiao=amused
  -> palace_fragments
* [先把下一车与接工的人当面介绍，自己留确能问到的官署，不许永远由自己来。 # cid:jd_leave_real_contact]
  ~ jd_qiao_work = false
  你让两人当面说定，不隔着一句陆先生准了。阿荞指明哪天不能来，接工人换一班，活才真正落在她能过的日子里。 # beat:jd_family_return_8 # scene:jd_roadside # cast:jd_qiao # speaker:narrator
  -> palace_fragments

=== palace_fragments ===
最大的真残片送回宫。金线剥去大半、边裂、银补脱、再添火熏。皇帝看很久，说不像宝。 # beat:jd_palace_fragments_1 # scene:jd_inner # cast:jd_attendant # speaker:narrator
有人答正因经历百年。上面说不是，是因为真正有用过。 # beat:jd_palace_fragments_2 # scene:jd_inner # cast:jd_attendant # speaker:jd_attendant # mood:jd_attendant=neutral
原片没有奉命修新，照旧收入内库。九库体系另整，该废的废，该纳入正常仓制的纳入，从此不靠一块玉替所有人记住粮在哪里。 # beat:jd_palace_fragments_3 # scene:jd_inner # cast:jd_attendant # speaker:narrator
那第七库往后由谁接？ # beat:jd_palace_fragments_4 # scene:jd_inner # cast:jd_attendant # speaker:you
常仓自有接手人，图有副，册有副。你也得把真做过的交回去，不只写一句终于明白了。 # beat:jd_palace_fragments_5 # scene:jd_inner # cast:jd_attendant # speaker:jd_attendant # mood:jd_attendant=intent
你听完，想到自己手里还有何家的婚书底稿，那上面两家的名字一直比所谓唯一真品更清楚。 # beat:jd_palace_fragments_6 # scene:jd_inner # cast:jd_attendant # speaker:narrator
* [接下地方常仓的实差，继续跟粮路点验、交班，愿从普通官署的琐事做起。 # cid:jd_choose_storework]
  ~ jd_career = 1
  我去做能查到人、查到车的那份。不懂的请管仓人教，不能拿发现过旧库就算懂所有仓。 # beat:jd_palace_fragments_7 # scene:jd_inner # cast:jd_attendant # speaker:you
  那就按实差走。不是给你封一个见过山河便能管天下粮的名。 # beat:jd_palace_fragments_8 # scene:jd_inner # cast:jd_attendant # speaker:jd_attendant # mood:jd_attendant=neutral
  -> next_work
* [留近郡整理常仓旧册与修订来源，让下一班不用再靠一个古物猜图，不抢取宝之功。 # cid:jd_choose_archivework]
  ~ jd_career = 2
  我接旧册。哪处有改道，哪处维护过，找真走过的人同改，不只抄给后来人一句当年有九库。 # beat:jd_palace_fragments_9 # scene:jd_inner # cast:jd_attendant # speaker:you
  那也得真去问。档房里的空栏，不会因为现在有人知道原来的用途便自己补齐。 # beat:jd_palace_fragments_10 # scene:jd_inner # cast:jd_attendant # speaker:jd_attendant # mood:jd_attendant=neutral
  -> next_work

=== next_work ===
你后来做了不大不小的官，因整理九库有功，不是十三文买物便一步升到谁都要听你的地方。各地还会问宝物，常仓却已经得按今日有多少粮、谁来接、何时能到一处处管。 # beat:jd_next_work_1 # scene:jd_work # cast:none # speaker:narrator
{
- jd_surface:
先前花三日、垫纸料留下的表层描本还在。第四、五库你亲进去，木架与坏药的那几处写得很慢；留给接手者的，也有真能再去核的地方。 # beat:jd_next_work_2 # scene:jd_work # cast:none # speaker:narrator
- else:
你先开暗刻，赶过首批，又回档房补两夜，错过第四、五库现场。后来两页仍留同队见者姓名，不会因为你已做官，便把那一段旧闻改成自己当年亲入。 # beat:jd_next_work_3 # scene:jd_work # cast:none # speaker:narrator
}
{
- jd_post == 2 and jd_notes_kept:
右手养了一月，你只能口述几页。代笔者有一句听得不同，你请他停下重问，不拿这是我保出来的稿便不许他再问。原稿在，手痛也在，后面的字终究有人同写。 # beat:jd_next_work_4 # scene:jd_work # cast:none # speaker:narrator
}
{
- jd_post == 2 and not jd_notes_kept:
火里丢的几页私稿没有又在箱底奇迹般找到。你拿原档与同行人的那份重核，重写到哪儿记不清，便把没记全的留下，没人因此又少吃一碗已经运出的粮。 # beat:jd_next_work_5 # scene:jd_work # cast:none # speaker:narrator
}
* [把何家婚书底稿收好，走访旧识时不只给他们讲自己如今管什么。 # cid:jd_return_wedding_copy]
  ~ jd_wedding_kept = true
  你把那一页铺平，想起当日何老板只说字写好点。自己原来怕的许多质问里，竟是这句最早真答上了。 # beat:jd_next_work_6 # scene:jd_work # cast:none # speaker:narrator
  -> he_late
* [按原欠过的饭菜旧情去何家，带普通礼，不拿一份宝物来历替当年十三文补成豪富。 # cid:jd_visit_without_treasure]
  ~ jd_wedding_kept = false
  你带一包寻常干货，没把旧玉今日身价折作一份送不出去的大礼。何家还在开门做生意，来的人先得让出称菜的位置。 # beat:jd_next_work_7 # scene:jd_work # cast:none # speaker:narrator
  -> he_late

=== he_late ===
又过些年，何老板也老了。来访的人问为何当年没认出皇家重宝，你正好在柜边，听他把缸盖按回去。 # beat:jd_he_late_1 # scene:jd_pickle_late # cast:jd_he # speaker:narrator # look:jd_he=late
你看得出？我拿它压缸，压得很好，怎么不算看出用途？ # beat:jd_he_late_2 # scene:jd_pickle_late # cast:jd_he # speaker:jd_he # mood:jd_he=amused
若早知值多少？ # beat:jd_he_late_3 # scene:jd_pickle_late # cast:jd_he # speaker:you
那肯定卖。 # beat:jd_he_late_4 # scene:jd_pickle_late # cast:jd_he # speaker:jd_he # mood:jd_he=neutral
旁人问会不会后悔十三文，他想得很认真，终于望向你。 # beat:jd_he_late_5 # scene:jd_pickle_late # cast:jd_he # speaker:narrator
十三文又不是我卖的。我是二十文没卖成。 # beat:jd_he_late_6 # scene:jd_pickle_late # cast:jd_he # speaker:jd_he # mood:jd_he=intent
你笑起来，何老板也笑。柜边一份菜还没称完，曾经所谓受命山河，就这样空出一点让日子继续的地方。 # beat:jd_he_late_7 # scene:jd_pickle_late # cast:jd_he # speaker:narrator
* [有人问一生最得意是不是十三文，认真答婚书，不拿一句谦辞抹掉后来众人做过的活。 # cid:jd_name_best_work]
  ~ jd_best_letter = true
  何老板儿子的婚书。字真写得不错。 # beat:jd_he_late_8 # scene:jd_pickle_late # cast:jd_he # speaker:you
  那人先当玩笑，你又说，山河璧只是自己认出；后来真让它有用的，是很多人。何老板翻出婚书，偏要旁人看看你当年有没有写错名字。 # beat:jd_he_late_9 # scene:jd_pickle_late # cast:jd_he # speaker:narrator
  -> sima_late
* [给问者看婚书原字，直认这一份自己的好，再将查库与守粮功分还真做的人。 # cid:jd_show_best_work]
  ~ jd_best_letter = false
  你把那页拿出，说自己最得意这一份。旁人以为只是谦虚，你指了认真核过的两家姓名；那些送粮、护档、守门的人，不能由一个买玉故事全换成你的功。 # beat:jd_he_late_10 # scene:jd_pickle_late # cast:jd_he # speaker:narrator
  -> sima_late

=== sima_late ===
多年后司马天岳又看残片。有人问是不是毁了才看不出柳观河武道，他答自己又不是柳观河。 # beat:jd_sima_late_1 # scene:jd_inner_late # cast:jd_sima # speaker:narrator
另有人说，研究拓印十几年还真创出好剑，岂非仍有武学。他说那是人自己练的。问者不肯停，若没有玉，也不会那样想。 # beat:jd_sima_late_2 # scene:jd_inner_late # cast:jd_sima # speaker:narrator
那也对。 # beat:jd_sima_late_3 # scene:jd_inner_late # cast:jd_sima # speaker:jd_sima # mood:jd_sima=uneasy
来人一下高兴，追问所以真的有？ # beat:jd_sima_late_4 # scene:jd_inner_late # cast:jd_sima # speaker:narrator
你怎么又绕回去了？ # beat:jd_sima_late_5 # scene:jd_inner_late # cast:jd_sima # speaker:jd_sima # mood:jd_sima=sharp
你听着，想到那股洗三日仍没去净的酱味。人可以从一个东西想到很多，却未必能替下一个人省掉真正要练、要做的那些年。 # beat:jd_sima_late_6 # scene:jd_inner_late # cast:jd_sima # speaker:narrator
* [在旧记录保留剥金、脱补、碎裂与各自发生处，不把有用过的真物重新画成完整宝璧。 # cid:jd_keep_old_breaks]
  ~ jd_kept_breaks = true
  第七守住粮，第九碎的是玉。这两处别画成同一扇门。银补脱掉，也别因旧图好看便再补上。 # beat:jd_sima_late_7 # scene:jd_inner_late # cast:jd_sima # speaker:you
  画者重看两地路程，终于留两幅不同的图，不拿你一句话就说自己已画懂一百年。 # beat:jd_sima_late_8 # scene:jd_inner_late # cast:jd_sima # speaker:narrator
  -> later_records
* [把后来维护与交接接着写，不用一块残片的传奇替代真正还在用的常仓。 # cid:jd_keep_maintenance]
  ~ jd_kept_breaks = false
  你找来新接手的人，问今年路改没改、仓验没验。讲古的人等你讲玉的结局，你先把这一季的粮数听完。 # beat:jd_sima_late_9 # scene:jd_inner_late # cast:jd_sima # speaker:narrator
  -> later_records

=== later_records ===
两家后记里，仍有那句祖训没写：红叶与铁鹞争过四代，师门追问以后又过十二年，才在共同抗一次水匪时真正和解。守粮这一夜被记在并肩的旧事里，不是一句话便让前年的伤全没了。 # beat:jd_later_records_1 # scene:jd_after # cast:none # speaker:narrator
九库之后重查沈玉娘，后人才发现她又活多年，隐在南方。木盒里是江十七旧铜钱与造假试片，纸背那句真的太重、假的轻些，没人能替她定说的只是玉。 # beat:jd_later_records_2 # scene:jd_after # cast:none # speaker:narrator
二十余年后的另一处地下拍卖，黑青完整金线的璧又被举起。有人问真货不是碎了么，卖家说当年碎的是皇家赝品；问证据，他笑着反问没证据怎敢拿来。 # beat:jd_later_records_3 # scene:jd_after # cast:none # speaker:narrator
竞价仍起。连钱九真的赝品也成有历史的假宝，酱香旧本又添一重价。真正残片没有修成那样新，图与仓也早不必等谁重新抢回唯一完整的一块。 # beat:jd_later_records_4 # scene:jd_after # cast:none # speaker:narrator
{
- jd_career == 1:
你这一路，后来还要回到仓门前，查一辆车的轴、问一户没到场的人、把能用的粮交给真接手者。别人夸十三文，你仍记得何老板的婚书。所谓宝物到谁手里才算宝，今晨先问的，是下一车给谁吃。 # beat:jd_later_records_5 # scene:jd_after # cast:none # speaker:narrator # ending:jd_storework
-> END
- else:
你这一路，后来仍会坐回普通档桌。册能重抄，未核的字要问人，图不再锁在一块新玉里。窗外有人来请写婚书，你洗手另取一张好纸，问清两家姓名；这一份，也得写得真不错。 # beat:jd_later_records_6 # scene:jd_after # cast:none # speaker:narrator # ending:jd_archivework
-> END
}
