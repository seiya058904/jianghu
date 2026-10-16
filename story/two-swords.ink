// Source: 宋世江湖 11850–13918. Three explicitly separated viewpoints, fixed canon losses.
VAR ss_help_body = false
VAR ss_old_use = false
VAR ss_show_compare = false
VAR ss_letter_plain = false
VAR ss_roof = false
VAR ss_lineage_clear = false
VAR ss_duel_read = 0
VAR ss_passage = false
VAR ss_read_whole = false
VAR ss_own_notes = 0
VAR ss_saved_notes = false
VAR ss_loss_open = false
VAR ss_path = 0
VAR ss_lesson = 0
VAR ss_kept_question = false
VAR ss_gui_method = 0
VAR ss_last_kept = false
-> ridge

=== ridge ===
师父，右边没地！ # beat:ss_ridge_1 # scene:ss_ridge # cast:ss_pupil # speaker:ss_pupil # mood:ss_pupil=surprised
你伸手攥住他的腕，剑柄撞在石上。按金陵旧式先收右脚、再换左步，这块碎石却没等他收稳。山路下面只有雨雾。 # beat:ss_ridge_2 # scene:ss_ridge # cast:ss_pupil # speaker:narrator
此刻你是沈照岳。四十三岁奉命南来，本想半月便回，如今先要把一个活人拉回能站的地方。 # beat:ss_ridge_3 # scene:ss_ridge # cast:ss_pupil # speaker:narrator
别松。我还踩不到。 # beat:ss_ridge_4 # scene:ss_ridge # cast:ss_pupil # speaker:ss_pupil # mood:ss_pupil=uneasy
* [先让他贴住自己的肩，把两人的重量一起压回里侧。 # cid:ss_pull_body]
  ~ ss_help_body = true
  手别找剑，先抓我衣领。左脚往我脚边落。 # beat:ss_ridge_5 # scene:ss_ridge # cast:ss_pupil # speaker:you
  他一把揪住领口，你们几乎坐到一起。人稳了，剑还横在石缝里。 # beat:ss_ridge_6 # scene:ss_ridge # cast:ss_pupil # speaker:narrator
  衣领…… # beat:ss_ridge_7 # scene:ss_ridge # cast:ss_pupil # speaker:ss_pupil # mood:ss_pupil=uneasy
  先喘气。领子没有脚重要。 # beat:ss_ridge_8 # scene:ss_ridge # cast:ss_pupil # speaker:you
  -> first_step
* [仍抓紧他的腕，用自己脚尖探稳一块能落脚的石头。 # cid:ss_clear_stone]
  ~ ss_help_body = false
  先别再收右脚。左脚落我踩住的这块。 # beat:ss_ridge_9 # scene:ss_ridge # cast:ss_pupil # speaker:you
  你一手没松，等他真正踩稳才往回拉。碎石滚下去许久，没听见落底。 # beat:ss_ridge_10 # scene:ss_ridge # cast:ss_pupil # speaker:narrator
  平地上从没这样。 # beat:ss_ridge_11 # scene:ss_ridge # cast:ss_pupil # speaker:ss_pupil # mood:ss_pupil=uneasy
  这里不是平地。先回来。 # beat:ss_ridge_12 # scene:ss_ridge # cast:ss_pupil # speaker:you
  -> first_step

=== first_step ===
当夜你把那一步改了。第二日再走，快了，也稳了。学徒急着连下一剑，你却让他先在干石和湿石上各试一回。 # beat:ss_first_step_1 # scene:ss_mountain # cast:ss_pupil # speaker:narrator
我记住新步，旧的还练么？ # beat:ss_first_step_2 # scene:ss_mountain # cast:ss_pupil # speaker:ss_pupil # mood:ss_pupil=neutral
城里那一块平地，它仍能站住。 # beat:ss_first_step_3 # scene:ss_mountain # cast:ss_pupil # speaker:you
那我岂不是多学了一样，回家还得多扫一处地才能练？ # beat:ss_first_step_4 # scene:ss_mountain # cast:ss_pupil # speaker:ss_pupil # mood:ss_pupil=amused
他把鞋底泥刮在石边，真去借一块平整的地方。你手里两张纸，一张画旧步，一张画山路。 # beat:ss_first_step_5 # scene:ss_mountain # cast:ss_pupil # speaker:narrator
* [先花一课让他比较旧步在平地为何仍稳，留下两种适用处。 # cid:ss_keep_old_use]
  ~ ss_old_use = true
  两张都留。不是今天有了新步，昨日便全错。 # beat:ss_first_step_6 # scene:ss_mountain # cast:ss_pupil # speaker:you
  学徒在纸边画了一小方院子，又怕画得比他家还大。你让他在院子那边画出原来的收脚，斜路这边另画一条；两张画完，午课只剩半个时辰。 # beat:ss_first_step_7 # scene:ss_mountain # cast:ss_pupil # speaker:narrator
  这处不收钱借我站就好。您别先替我添一座院。 # beat:ss_first_step_8 # scene:ss_mountain # cast:ss_pupil # speaker:ss_pupil # mood:ss_pupil=amused
  -> six_years
* [先陪他把雨后山步练熟，平地旧步的解释等回门再补。 # cid:ss_train_new_ground]
  ~ ss_old_use = false
  今天先把回家的路走稳。那张旧步我带回门里，请人重新演给你看。 # beat:ss_first_step_9 # scene:ss_mountain # cast:ss_pupil # speaker:you
  那您得带回来。我不想每回换地方，都像从没练过。 # beat:ss_first_step_10 # scene:ss_mountain # cast:ss_pupil # speaker:ss_pupil # mood:ss_pupil=intent
  你在旧步旁写了个“问”字。学徒抢过笔，又在后面添一小横，像给没回来的课记账。 # beat:ss_first_step_11 # scene:ss_mountain # cast:ss_pupil # speaker:narrator
  -> six_years

=== six_years ===
六年以后，你回金陵，带了厚厚几册。最重的十五个改式，后来才被叫作南行十五变。 # beat:ss_six_years_1 # scene:ss_hall # cast:ss_xiezhibai,ss_recorder # speaker:narrator
谢知白年过七十，花三个月看完，让你在几位老人前逐剑演。前十一剑没人说话，第十二剑后，有人终于停下笔。 # beat:ss_six_years_2 # scene:ss_hall # cast:ss_xiezhibai,ss_recorder # speaker:narrator
若一个弟子只学这剑，不学原剑呢？ # beat:ss_six_years_3 # scene:ss_hall # cast:ss_xiezhibai,ss_recorder # speaker:ss_recorder # mood:ss_recorder=intent
只要知道为什么这样改，也可以。 # beat:ss_six_years_4 # scene:ss_hall # cast:ss_xiezhibai,ss_recorder # speaker:you
笔停得更多。谢知白扶着椅背起身，让人撤开中间两张席，问你先拿哪一种地方来试。 # beat:ss_six_years_5 # scene:ss_hall # cast:ss_xiezhibai,ss_recorder # speaker:narrator
* [先让同门在平地按原式接，再把同一式移上斜势。 # cid:ss_show_flat]
  ~ ss_show_compare = true
  先照旧走。别为我带回几册纸，就故意让旧式显得慢。 # beat:ss_six_years_6 # scene:ss_hall # cast:ss_xiezhibai,ss_recorder # speaker:you
  平地那一剑接得稳，移到斜板，右脚一收便失了半分。谢知白亲自换脚再试，没叫弟子替他遮那一下。 # beat:ss_six_years_7 # scene:ss_hall # cast:ss_xiezhibai,ss_recorder # speaker:narrator
  此处改得好。后面的人，知道何时不用你这一步么？ # beat:ss_six_years_8 # scene:ss_hall # cast:ss_xiezhibai,ss_recorder # speaker:ss_xiezhibai # mood:ss_xiezhibai=intent
  -> fifteen
* [先在斜板演改式，让老人自己指出换回平地的缺处。 # cid:ss_show_slope]
  ~ ss_show_compare = false
  新步一过，原来转不开的窄处让了出来。谢知白等你收剑，指向没有斜势的另一头。 # beat:ss_six_years_9 # scene:ss_hall # cast:ss_xiezhibai,ss_recorder # speaker:narrator
  那里也照这个走？ # beat:ss_six_years_10 # scene:ss_hall # cast:ss_xiezhibai,ss_recorder # speaker:ss_xiezhibai # mood:ss_xiezhibai=neutral
  不全一样。 # beat:ss_six_years_11 # scene:ss_hall # cast:ss_xiezhibai,ss_recorder # speaker:you
  那就把不一样的先留下。不能只靠你站旁边时，他才知道变。 # beat:ss_six_years_12 # scene:ss_hall # cast:ss_xiezhibai,ss_recorder # speaker:ss_xiezhibai # mood:ss_xiezhibai=intent
  -> fifteen

=== fifteen ===
剑没有问题。 # beat:ss_fifteen_1 # scene:ss_hall # cast:ss_xiezhibai,ss_recorder # speaker:ss_xiezhibai # mood:ss_xiezhibai=neutral
那为什么不能入正录？ # beat:ss_fifteen_2 # scene:ss_hall # cast:ss_xiezhibai,ss_recorder # speaker:you
你能用，不代表后面的人都能用。 # beat:ss_fifteen_3 # scene:ss_hall # cast:ss_xiezhibai,ss_recorder # speaker:ss_xiezhibai # mood:ss_xiezhibai=neutral
不能用，便再改。 # beat:ss_fifteen_4 # scene:ss_hall # cast:ss_xiezhibai,ss_recorder # speaker:you
再下一代呢？ # beat:ss_fifteen_5 # scene:ss_hall # cast:ss_xiezhibai,ss_recorder # speaker:ss_xiezhibai # mood:ss_xiezhibai=intent
他把录剑人手下的旧式抽出，压在新页旁。纸边错了一寸，他亲手对齐。你看着一张张纸，最怕的却是每个后来者都得先向这张桌子求一次许可。 # beat:ss_fifteen_6 # scene:ss_hall # cast:ss_xiezhibai,ss_recorder # speaker:narrator
* [请他正面回答，明知旧式不合适，是否仍要弟子照练。 # cid:ss_question_after]
  只怕以后改得太多，今日便让他在斜路上再收一次脚？ # beat:ss_fifteen_7 # scene:ss_hall # cast:ss_xiezhibai,ss_recorder # speaker:you
  我没叫他再往崖边走。 # beat:ss_fifteen_8 # scene:ss_hall # cast:ss_xiezhibai,ss_recorder # speaker:ss_xiezhibai # mood:ss_xiezhibai=uneasy
  可原式若只剩一道不能改的门令，教他的人会怎样讲？ # beat:ss_fifteen_9 # scene:ss_hall # cast:ss_xiezhibai,ss_recorder # speaker:you
  谢知白也沉默了。录剑人的笔悬到墨将干，仍等他答这一次。 # beat:ss_fifteen_10 # scene:ss_hall # cast:ss_xiezhibai,ss_recorder # speaker:narrator
  -> separate_record
* [让录剑人按你写的去教，自己先不站旁边补话。 # cid:ss_ask_teacher]
  请他照这几页带一个新人。我先不答。 # beat:ss_fifteen_11 # scene:ss_hall # cast:ss_xiezhibai,ss_recorder # speaker:you
  录剑人到第二处便问原式从何而来。你几乎要接话，谢知白抬手拦住。 # beat:ss_fifteen_12 # scene:ss_hall # cast:ss_xiezhibai,ss_recorder # speaker:narrator
  你不在的那日，他也会问。今日先听完。 # beat:ss_fifteen_13 # scene:ss_hall # cast:ss_xiezhibai,ss_recorder # speaker:ss_xiezhibai # mood:ss_xiezhibai=intent
  你忍住了。录剑人拿笔点着第二行，仍等你的答复。你把准备好的下一册放回膝上，先补这一行。 # beat:ss_fifteen_14 # scene:ss_hall # cast:ss_xiezhibai,ss_recorder # speaker:narrator
  -> separate_record

=== separate_record ===
七日争论，后来又谈了一年。十五改式入别录，可看可学，却不列正传。你不肯把疑问只缩成多写十五剑。 # beat:ss_separate_record_1 # scene:ss_hall # cast:ss_xiezhibai # speaker:narrator
改可以。先把原剑走尽，留下改了什么。 # beat:ss_separate_record_2 # scene:ss_hall # cast:ss_xiezhibai # speaker:ss_xiezhibai # mood:ss_xiezhibai=neutral
有时先这样、再那样本身，就把人拦住了。 # beat:ss_separate_record_3 # scene:ss_hall # cast:ss_xiezhibai # speaker:you
你没有说他嫉妒。临近五十，旧录记作四十九的那一年，你提出辞门。 # beat:ss_separate_record_4 # scene:ss_hall # cast:ss_xiezhibai # speaker:narrator
* [说明自己要摆脱的约束，不把留下的人都说成守旧。 # cid:ss_explain_leave]
  我以后每改一剑，都先想它还算不算金陵。我不想再这样想了。 # beat:ss_separate_record_5 # scene:ss_hall # cast:ss_xiezhibai # speaker:you
  回南岳？另立一门？ # beat:ss_separate_record_6 # scene:ss_hall # cast:ss_xiezhibai # speaker:ss_xiezhibai # mood:ss_xiezhibai=uneasy
  回南边。会不会立门，我还不知道。 # beat:ss_separate_record_7 # scene:ss_hall # cast:ss_xiezhibai # speaker:you
  谢知白问到这里便停了。你等了一会儿，堂外有人催录剑人领纸，两人都没有应。 # beat:ss_separate_record_8 # scene:ss_hall # cast:ss_xiezhibai # speaker:narrator
  -> token
* [先把别录交清，再说明自己仍要走，不拿留下纸当交换。 # cid:ss_ask_book_leave]
  改式在这里。留录不是请门里准我出门的价钱。 # beat:ss_separate_record_9 # scene:ss_hall # cast:ss_xiezhibai # speaker:you
  我也没有扣你。问的是去哪里。 # beat:ss_separate_record_10 # scene:ss_hall # cast:ss_xiezhibai # speaker:ss_xiezhibai # mood:ss_xiezhibai=neutral
  南边。以后在哪里教，到了再找。 # beat:ss_separate_record_11 # scene:ss_hall # cast:ss_xiezhibai # speaker:you
  他把最上那页扶平，让录剑人照数收下。 # beat:ss_separate_record_12 # scene:ss_hall # cast:ss_xiezhibai # speaker:narrator
  -> token

=== token ===
祖堂中，谢无咎的牌位在上。你拜三次，解门中剑令放案上。 # beat:ss_token_1 # scene:ss_ancestral # cast:ss_xiezhibai # speaker:narrator
你可以带着。 # beat:ss_token_2 # scene:ss_ancestral # cast:ss_xiezhibai # speaker:ss_xiezhibai # mood:ss_xiezhibai=neutral
别人见我使剑，还是会说这是金陵。 # beat:ss_token_3 # scene:ss_ancestral # cast:ss_xiezhibai # speaker:you
难道不是？ # beat:ss_token_4 # scene:ss_ancestral # cast:ss_xiezhibai # speaker:ss_xiezhibai # mood:ss_xiezhibai=intent # camera:portrait # action:谢知白 · 难道不是
今日还是。以后不知道。 # beat:ss_token_5 # scene:ss_ancestral # cast:ss_xiezhibai # speaker:you # camera:portrait
门令仍在案上。你拢好衣襟踏出门，谢知白站在堂内，没有再叫你留。 # beat:ss_token_6 # scene:ss_ancestral # cast:ss_xiezhibai # speaker:narrator
{
- ss_old_use:
包里有两种地形的旧笔记。你要带回去给那名学徒看，曾花过的半日，不能只在堂上用来证明自己说得完整。 # beat:ss_token_7 # scene:ss_ancestral # cast:ss_xiezhibai # speaker:narrator
- else:
包里添了重新抄下的平地起步。未写完的那页仍在，回去要亲自补，不把答应带回去当成已经教过。 # beat:ss_token_8 # scene:ss_ancestral # cast:ss_xiezhibai # speaker:narrator
}
* [写信给等在山里的弟子，只说已辞门，未许诺自此皆可随心。 # cid:ss_send_plain]
  ~ ss_letter_plain = true
  我回去。旧式照旧收着，山步也继续试。别先把门牌换成一座新大宗。 # beat:ss_token_9 # scene:ss_ancestral # cast:ss_xiezhibai # speaker:you
  信封不够大，你把后半页另折了两次。写到让他们先收拾哪间屋，笔尖停住，又添一句：床不用给我换新的。 # beat:ss_token_10 # scene:ss_ancestral # cast:ss_xiezhibai # speaker:narrator
  -> cottage
* [先按约回去，当面讲清辞门，来不及提前抄好一份新规矩。 # cid:ss_return_direct]
  ~ ss_letter_plain = false
  你先收拾行囊。那一页预备写下的堂规只写了两行，又被你折起来。 # beat:ss_token_11 # scene:ss_ancestral # cast:ss_xiezhibai # speaker:narrator
  先回去见人。别让他们等着我带一部更大的门令回来。 # beat:ss_token_12 # scene:ss_ancestral # cast:ss_xiezhibai # speaker:you
  行囊里旧谱挤着那张折过的堂规。扣子扣不上，你把堂规抽出来，塞进外侧的小袋。 # beat:ss_token_13 # scene:ss_ancestral # cast:ss_xiezhibai # speaker:narrator
  -> cottage

=== cottage ===
山下旧观旁，几间剑庐。人最多时二十余，门前未称南岳剑派。你仍教金陵来的持剑、起落、眼法，弟子问是不是金陵剑。 # beat:ss_cottage_1 # scene:ss_cottage # cast:ss_pupil # speaker:narrator
是。我算金陵弟子，你们不算。你们拜的是我，没拜过金陵祖堂。 # beat:ss_cottage_2 # scene:ss_cottage # cast:ss_pupil # speaker:you
那门前这块牌，还刻不刻？ # beat:ss_cottage_3 # scene:ss_cottage # cast:ss_pupil # speaker:ss_pupil # mood:ss_pupil=amused
剑庐，够了。 # beat:ss_cottage_4 # scene:ss_cottage # cast:ss_pupil # speaker:you
他把预备刻得很大的山字描小，空出的木头拿去补雨檐。门里有了人，名字还没有长成后来那四个字。 # beat:ss_cottage_5 # scene:ss_cottage # cast:ss_pupil # speaker:narrator
{
- ss_letter_plain:
信里说床不换，雨檐总得换吧？昨夜您那屋先滴的。 # beat:ss_cottage_6 # scene:ss_cottage # cast:ss_pupil # speaker:ss_pupil # mood:ss_pupil=amused
先带我看看。信上这一项倒漏了。 # beat:ss_cottage_7 # scene:ss_cottage # cast:ss_pupil # speaker:you
- else:
怎么连封信也没先来？昨日师弟还在山下等。 # beat:ss_cottage_8 # scene:ss_cottage # cast:ss_pupil # speaker:ss_pupil # mood:ss_pupil=uneasy
我去找他。先别让他再等今日。 # beat:ss_cottage_9 # scene:ss_cottage # cast:ss_pupil # speaker:you
}
* [先帮弟子补好漏雨处，今日少演一遍新剑。 # cid:ss_help_roof]
  ~ ss_roof = true
  纸先放里面。谁踩梯，谁在下面接，说清再上。 # beat:ss_cottage_10 # scene:ss_cottage # cast:ss_pupil # speaker:you
  那一遍我自己记着，别明日说已经教了。 # beat:ss_cottage_11 # scene:ss_cottage # cast:ss_pupil # speaker:ss_pupil # mood:ss_pupil=intent
  你抬起另一端木板，答应明日仍让他真走。 # beat:ss_cottage_12 # scene:ss_cottage # cast:ss_pupil # speaker:narrator
  -> later_shen
* [先把今日的剑教完，补檐请来工匠，费用自己出。 # cid:ss_finish_class]
  ~ ss_roof = false
  我教这一趟。补檐请人做，不拿你们不熟的活换一个懂事的名声。 # beat:ss_cottage_13 # scene:ss_cottage # cast:ss_pupil # speaker:you
  那我先把最好那把锯藏起来，省得您教到一半又去试。 # beat:ss_cottage_14 # scene:ss_cottage # cast:ss_pupil # speaker:ss_pupil # mood:ss_pupil=amused
  你把钱交清，回来继续那一剑，没有因它花过钱就少教两步。 # beat:ss_cottage_15 # scene:ss_cottage # cast:ss_pupil # speaker:narrator
  -> later_shen

=== later_shen ===
又许多年，沈照岳已到晚年。当初险从碎石滑落的学徒也老了，带自己的学生来。你看他站到坪边，先认出了落脚时让开的那一处。 # beat:ss_later_shen_1 # scene:ss_lateshen # cast:ss_olderpupil # speaker:narrator
他们一出去便往中线收，说好接下一剑。 # beat:ss_later_shen_2 # scene:ss_lateshen # cast:ss_olderpupil # speaker:ss_olderpupil # mood:ss_olderpupil=neutral
下一剑在哪？ # beat:ss_later_shen_3 # scene:ss_lateshen # cast:ss_olderpupil # speaker:you
他说了一个位置。你指向还没动的人，问怎么已经知道。慢走一遍，第一剑的尽处生第二，第三又从第二继续，不是每次都先摆回原架。 # beat:ss_later_shen_4 # scene:ss_lateshen # cast:ss_olderpupil # speaker:narrator
{
- ss_old_use:
我留了那张平地和斜路的图。不是让他们只照新式背一遍，是想他们知道什么时候别照。 # beat:ss_later_shen_5 # scene:ss_lateshen # cast:ss_olderpupil # speaker:ss_olderpupil # mood:ss_olderpupil=intent
那就让他们试。图上没下今日的雨。 # beat:ss_later_shen_6 # scene:ss_lateshen # cast:ss_olderpupil # speaker:you
他自己先落脚，等年轻人看清才叫第二个来。 # beat:ss_later_shen_7 # scene:ss_lateshen # cast:ss_olderpupil # speaker:narrator
- else:
当年等您回门带来的那页，我仍收着。今天能在山路讲明白，回院里却又少一句。 # beat:ss_later_shen_8 # scene:ss_lateshen # cast:ss_olderpupil # speaker:ss_olderpupil # mood:ss_olderpupil=uneasy
少就再问。别怕你教了几十年，便不能再当一次问的人。 # beat:ss_later_shen_9 # scene:ss_lateshen # cast:ss_olderpupil # speaker:you
他约好次晨去平坪再试，今日不把没补的那句算作学生没悟性。 # beat:ss_later_shen_10 # scene:ss_lateshen # cast:ss_olderpupil # speaker:narrator
}
* [答不知新剑名，只请年轻人先说出自己为何收剑。 # cid:ss_no_name]
  没名字。先别急着记，先问为什么。 # beat:ss_later_shen_11 # scene:ss_lateshen # cast:ss_olderpupil # speaker:you
  那我回去又得多带纸。他们以为来一趟，只须领个好听剑名。 # beat:ss_later_shen_12 # scene:ss_lateshen # cast:ss_olderpupil # speaker:ss_olderpupil # mood:ss_olderpupil=amused
  你笑着将那叠纸还他。他仍拿在手里，等最年轻的弟子把刚才第二步问完。 # beat:ss_later_shen_13 # scene:ss_lateshen # cast:ss_olderpupil # speaker:narrator
  -> lin
* [让弟子亲走，叫身旁的人说哪一处看不清。 # cid:ss_walk_again]
  我再走，你们仍得自己试。只看懂我手里这三下，回去还找不到你的下一剑。 # beat:ss_later_shen_14 # scene:ss_lateshen # cast:ss_olderpupil # speaker:you
  年轻人请你慢到第二处，老弟子也蹲下看脚。门外雨又来了一阵，没人急着把新剑挂成门匾。 # beat:ss_later_shen_15 # scene:ss_lateshen # cast:ss_olderpupil # speaker:narrator
  -> lin

=== lin ===
新的年景 · 沈照岳八十余岁去世时，剑庐仍是剑庐。距他辞门四十余年，首徒林负山已六十出头，门人过百，各地开馆要有可认的名号。 # beat:ss_lin_1 # scene:ss_founding # cast:ss_foundelder # speaker:narrator
此刻视角换为林负山。你召集弟子立门，一位老人说祖师在南岳教了一辈子，便叫南岳。 # beat:ss_lin_2 # scene:ss_founding # cast:ss_foundelder # speaker:narrator
南岳剑派。 # beat:ss_lin_3 # scene:ss_founding # cast:ss_foundelder # speaker:you
辈分仍照金陵往下排么？ # beat:ss_lin_4 # scene:ss_founding # cast:ss_foundelder # speaker:ss_foundelder # mood:ss_foundelder=neutral
祖堂旧录的师承还在，你要决定先向来问的人讲哪一件。 # beat:ss_lin_5 # scene:ss_founding # cast:ss_foundelder # speaker:narrator
* [先展示未删的金陵来历，再说明从此另立辈序。 # cid:ss_lineage_first]
  ~ ss_lineage_clear = true
  师父从哪里来，不删。你们现在拜哪一门，也不能永远叫南岳那一院。 # beat:ss_lin_6 # scene:ss_founding # cast:ss_foundelder # speaker:you
  那就两件都写。别让只看新名字的人以为没有旧名。 # beat:ss_lin_7 # scene:ss_founding # cast:ss_foundelder # speaker:ss_foundelder # mood:ss_foundelder=intent
  老人另磨一砚墨，自己抄那份来历。新辈序印好时，他又抱来薄薄一叠，叫发信的人两份一起装。 # beat:ss_lin_8 # scene:ss_founding # cast:ss_foundelder # speaker:narrator
  -> tea
* [先发新辈序，旧系照录保存，另向反对者当面解释。 # cid:ss_new_order_first]
  ~ ss_lineage_clear = false
  先把各地该怎么称说清。师承那一份仍在，不会删。 # beat:ss_lin_9 # scene:ss_founding # cast:ss_foundelder # speaker:you
  两份分开传，到了山外，未必还一起回来。 # beat:ss_lin_10 # scene:ss_founding # cast:ss_foundelder # speaker:ss_foundelder # mood:ss_foundelder=uneasy
  你随后多接了几拨质问。有些人只见新辈序，你得亲自领他去看没被抹去的旧录。 # beat:ss_lin_11 # scene:ss_founding # cast:ss_foundelder # speaker:narrator
  -> tea

=== tea ===
约二百八十年前，金陵第五代谢庭松带三人上山。你迎到山下，第一日喝茶，第二日谈沈，第三日才进剑坪。 # beat:ss_tea_1 # scene:ss_tea # cast:ss_xietingsong # speaker:narrator
我想看你们如今怎样用，不是来看哪块牌写得更大。 # beat:ss_tea_2 # scene:ss_tea # cast:ss_xietingsong # speaker:ss_xietingsong # mood:ss_xietingsong=neutral
那先喝这一盏。明日剑还在，人也不用站着谈。 # beat:ss_tea_3 # scene:ss_tea # cast:ss_xietingsong # speaker:you
他笑着坐下，没有叫随行弟子先对你行金陵旧辈序的礼。 # beat:ss_tea_4 # scene:ss_tea # cast:ss_xietingsong # speaker:narrator
{
- ss_lineage_clear:
随行弟子手里带着完整新旧两份录，先问几处还看不清的称呼。你能直接指给他看，不必先证明那张旧纸从来没被藏起。 # beat:ss_tea_5 # scene:ss_tea # cast:ss_xietingsong # speaker:narrator
- else:
随行弟子先问是不是不肯认旧祖。你把两份纸并排摊开，花一晚把来路讲完。那壶茶重新烧过，试剑没有因此少一手。 # beat:ss_tea_6 # scene:ss_tea # cast:ss_xietingsong # speaker:narrator
}
* [亲自先走一段从旧式生出的变化，再请谢出剑。 # cid:ss_show_change]
  这一路起处仍在，下一步不是每回都先退回旧架。 # beat:ss_tea_7 # scene:ss_tea # cast:ss_xietingsong # speaker:you
  好。慢到转腕那一下，我要看清。 # beat:ss_tea_8 # scene:ss_tea # cast:ss_xietingsong # speaker:ss_xietingsong # mood:ss_xietingsong=intent
  你们收起茶，门人退到线外。 # beat:ss_tea_9 # scene:ss_tea # cast:ss_xietingsong # speaker:narrator
  -> duel_open
* [请谢先出一式，自己从他已给出的势里接。 # cid:ss_receive_old]
  请先赐一剑。 # beat:ss_tea_10 # scene:ss_tea # cast:ss_xietingsong # speaker:you
  你在自家山上，也先等客人？ # beat:ss_tea_11 # scene:ss_tea # cast:ss_xietingsong # speaker:ss_xietingsong # mood:ss_xietingsong=neutral
  不等，接。走到哪儿再看。 # beat:ss_tea_12 # scene:ss_tea # cast:ss_xietingsong # speaker:you
  谢提剑，没因这句话便故意给一个容易接的起手。 # beat:ss_tea_13 # scene:ss_tea # cast:ss_xietingsong # speaker:narrator
  -> duel_open

=== duel_open ===
你此刻仍是林负山。谢的剑先到肩外，不急着碰，先把你回身那一线压窄。你不把剑带回正中，直接从偏处续出，剑尖反到他袖侧。 # beat:ss_duel_open_1 # scene:ss_duel # cast:ss_xietingsong # speaker:narrator
谢退开半步，肘还收得住。你本想趁他收势再贴，才发现那不是一处等你抢进去的空门。 # beat:ss_duel_open_2 # scene:ss_duel # cast:ss_xietingsong # speaker:narrator
你若再来，我这一剑就省了回去。 # beat:ss_duel_open_3 # scene:ss_duel # cast:ss_xietingsong # speaker:ss_xietingsong # mood:ss_xietingsong=intent
那我先不替你省。 # beat:ss_duel_open_4 # scene:ss_duel # cast:ss_xietingsong # speaker:you
* [先搭他剑脊，感到力转再换线，不抢那个看着很大的空。 # cid:ss_meet_spine]
  ~ ss_duel_read = 1
  两剑一搭，谢腕微转，你指间一紧，顺势换到外线。他没能照原先那条路递出，你也没留在他转力的正前。 # beat:ss_duel_open_5 # scene:ss_duel # cast:ss_xietingsong # speaker:narrator
  也肯等了？ # beat:ss_duel_open_6 # scene:ss_duel # cast:ss_xietingsong # speaker:ss_xietingsong # mood:ss_xietingsong=amused
  等你真动，不等你照我想的退。 # beat:ss_duel_open_7 # scene:ss_duel # cast:ss_xietingsong # speaker:you
  他笑意还在，下一剑已从你刚换过的位置逼来。 # beat:ss_duel_open_8 # scene:ss_duel # cast:ss_xietingsong # speaker:narrator
  -> duel_change
* [先绕出他袖外，让那一剑走完，试自己在远处还能不能接。 # cid:ss_leave_sleeve]
  ~ ss_duel_read = 2
  你从袖外掠过，肩旁的布被剑锋轻轻挑开一线。人没受伤，却退到剑坪斜低处，原来随手可接的一剑忽然远了。 # beat:ss_duel_open_9 # scene:ss_duel # cast:ss_xietingsong # speaker:narrator
  这里也能续？ # beat:ss_duel_open_10 # scene:ss_duel # cast:ss_xietingsong # speaker:ss_xietingsong # mood:ss_xietingsong=neutral
  能不能，得先把这一步走了。 # beat:ss_duel_open_11 # scene:ss_duel # cast:ss_xietingsong # speaker:you
  你不再只追他的剑尖，从低处抬剑，给自己争回半臂的地方。 # beat:ss_duel_open_12 # scene:ss_duel # cast:ss_xietingsong # speaker:narrator
  -> duel_change

=== duel_change ===
数十合后，你们都知道对方不肯只用一套开头。谢收的是下一条能走的线，并不每次都把剑摆回胸前；你变化再多，也得顾住这一口气之后站在哪里。 # beat:ss_duel_change_1 # scene:ss_duel # cast:ss_xietingsong # speaker:narrator
日影移到坪外，观剑弟子往后一退，露出一块刚才被人挡着的湿石。谢换步，你眼前有一处能追他的肩，也有一处能护住自己后路。 # beat:ss_duel_change_2 # scene:ss_duel # cast:ss_xietingsong # speaker:narrator
* [先把后路接上，再从他换身的一刻追出下一剑。 # cid:ss_keep_after]
  你没有立刻追肩，剑先回到能接的位置。谢从另一侧进，碰到的不是刚才那条空线，只得重新改腕。 # beat:ss_duel_change_3 # scene:ss_duel # cast:ss_xietingsong # speaker:narrator
  回来的，不全是旧架。 # beat:ss_duel_change_4 # scene:ss_duel # cast:ss_xietingsong # speaker:you
  你总算肯亲口说了。 # beat:ss_duel_change_5 # scene:ss_duel # cast:ss_xietingsong # speaker:ss_xietingsong # mood:ss_xietingsong=intent
  下一剑你仍从新落点生出，他也没有再要你站回原地。 # beat:ss_duel_change_6 # scene:ss_duel # cast:ss_xietingsong # speaker:narrator
  -> three_hundred
* [从眼前落点继续，但先让开湿石，不拿一条险路赌他来不及改。 # cid:ss_make_next]
  你换到干处，放掉抢肩的一瞬。谢的剑擦身过去，袖摆一荡，下一剑由你在近处接上。 # beat:ss_duel_change_7 # scene:ss_duel # cast:ss_xietingsong # speaker:narrator
  机会放了？ # beat:ss_duel_change_8 # scene:ss_duel # cast:ss_xietingsong # speaker:ss_xietingsong # mood:ss_xietingsong=neutral
  换了一处还能走的。 # beat:ss_duel_change_9 # scene:ss_duel # cast:ss_xietingsong # speaker:you
  他回剑来试，你又得重新接。放过一招，没有让后面每一招都自动站稳。 # beat:ss_duel_change_10 # scene:ss_duel # cast:ss_xietingsong # speaker:narrator
  -> three_hundred

=== three_hundred ===
三百余合，日暮才止。弟子递巾，两人各自收剑，谁也没再抢报一声胜。 # beat:ss_three_hundred_1 # scene:ss_duel # cast:ss_xietingsong # speaker:narrator
金陵旧录后来写三百余合、日暮止；南岳旧录写两剑各尽、不复问胜。两边都没留下一个可靠的输家。 # beat:ss_three_hundred_2 # scene:ss_duel # cast:ss_xietingsong # speaker:narrator
你这路剑，骨头还是金陵的。 # beat:ss_three_hundred_3 # scene:ss_duel # cast:ss_xietingsong # speaker:ss_xietingsong # mood:ss_xietingsong=neutral
是。骨头不是整个人。 # beat:ss_three_hundred_4 # scene:ss_duel # cast:ss_xietingsong # speaker:you
他沉默很久，点头。下山时弟子问是不是叛门，他望山上剑庐，答不是，是另一门。 # beat:ss_three_hundred_5 # scene:ss_duel # cast:ss_xietingsong # speaker:narrator
你送他到山下。弟子还捧着没用上的灯，谢让人先收好，改日夜里照路也用得着。 # beat:ss_three_hundred_6 # scene:ss_duel # cast:ss_xietingsong # speaker:narrator
-> rain_work

=== rain_work ===
约一百六十年前 · 新的视角。你是金陵录剑门人，二十岁上下，眼前的同门阿棠不是沈照岳那代弟子，林负山也早已成为旧录里的名字。 # beat:ss_rain_work_1 # scene:ss_librain # cast:ss_tang,ss_librarian # speaker:narrator
这张斜岭又画成锅盖了。纸铺平些，山路就不能长一点？ # beat:ss_rain_work_2 # scene:ss_librain # cast:ss_tang,ss_librarian # speaker:ss_tang # mood:ss_tang=uneasy
你拿剑架压着，山路也只能到架脚。 # beat:ss_rain_work_3 # scene:ss_librain # cast:ss_tang,ss_librarian # speaker:you
所以我说先搬架。搬完我去长廊试剑，你替我把先生那两句记着。 # beat:ss_rain_work_4 # scene:ss_librain # cast:ss_tang,ss_librarian # speaker:ss_tang # mood:ss_tang=amused
两个人，欠我三页纸。你们若把“记着”都说给对方，明日我收哪一份？ # beat:ss_rain_work_5 # scene:ss_librain # cast:ss_tang,ss_librarian # speaker:ss_librarian # mood:ss_librarian=neutral
雨重，干纸不够。架子挡住侧廊，湿卷也得先分出来，今日只够先做一件，另一件排在明早。 # beat:ss_rain_work_6 # scene:ss_librain # cast:ss_tang,ss_librarian # speaker:narrator
* [先同阿棠移开架子，错过的讲课请同门补记。 # cid:ss_clear_passage]
  ~ ss_passage = true
  先搬。课上没听见的，我回来请教，不装成已经抄全。 # beat:ss_rain_work_7 # scene:ss_librain # cast:ss_tang,ss_librarian # speaker:you
  这边我接。别把木脚只挪半寸，又让我拿肩挤。 # beat:ss_rain_work_8 # scene:ss_librain # cast:ss_tang,ss_librarian # speaker:ss_tang # mood:ss_tang=intent
  两人把架子移进角室，侧廊能让两个人并行。先生把缺的那页夹在桌上，等你补问。 # beat:ss_rain_work_9 # scene:ss_librain # cast:ss_tang,ss_librarian # speaker:narrator
  -> old_visit
* [先核湿卷，架子排明早搬，把未做的留在值册。 # cid:ss_finish_wetlist]
  ~ ss_passage = false
  先分湿的，别把两张黏在一起。架子这一项没做，我写着。 # beat:ss_rain_work_10 # scene:ss_librain # cast:ss_tang,ss_librarian # speaker:you
  那我不从这儿挤。明早再搬，你也得来。 # beat:ss_rain_work_11 # scene:ss_librain # cast:ss_tang,ss_librarian # speaker:ss_tang # mood:ss_tang=neutral
  湿卷分了类，窄廊还窄。阿棠抱剑绕正门出去，没有因为你先做另一件事便替你把两件都办完。 # beat:ss_rain_work_12 # scene:ss_librain # cast:ss_tang,ss_librarian # speaker:narrator
  -> old_visit

=== old_visit ===
先生翻过两百余年前两派并肩应对无生之乱的旧记，讲到程问山来楼那一趟。他七十余入化、九十余返真，百余岁来楼却只看三天谱，第四日嫌照岳年轻时的字难看。 # beat:ss_old_visit_1 # scene:ss_library # cast:ss_librarian,ss_tang # speaker:narrator
我若也这样说，您会不会罚抄？ # beat:ss_old_visit_2 # scene:ss_library # cast:ss_librarian,ss_tang # speaker:ss_tang # mood:ss_tang=amused
你先把看不懂的指出来。程老还说祖堂后来那些字更差，你敢不敢一起抄？ # beat:ss_old_visit_3 # scene:ss_library # cast:ss_librarian,ss_tang # speaker:ss_librarian # mood:ss_librarian=neutral
那金陵是不是终于赢回一回？ # beat:ss_old_visit_4 # scene:ss_library # cast:ss_librarian,ss_tang # speaker:you
哪一代，哪一个人？他说楼里有南岳做不到的，也说南边有这里没有的。你只抄前一半，才该罚。 # beat:ss_old_visit_5 # scene:ss_library # cast:ss_librarian,ss_tang # speaker:ss_librarian # mood:ss_librarian=sharp
你们跟着他的指头翻页。前半句字大，后半句被阿棠剑鞘压着，她挪开鞘，把那趟访谱的记录从头读完。 # beat:ss_old_visit_6 # scene:ss_library # cast:ss_librarian,ss_tang # speaker:narrator
* [把两页都给阿棠看，问她想把哪一处真的走出来。 # cid:ss_read_whole]
  ~ ss_read_whole = true
  你总说自己的剑，先让我看这句“从眼前生”怎么走。 # beat:ss_old_visit_7 # scene:ss_library # cast:ss_librarian,ss_tang # speaker:you
  来。你别提前往我想去的那边退，我得自己找。 # beat:ss_old_visit_8 # scene:ss_library # cast:ss_librarian,ss_tang # speaker:ss_tang # mood:ss_tang=intent
  她站到长廊空处，拿剑比了一次，发现自己还没等你起手，已把下一处落点定死。 # beat:ss_old_visit_9 # scene:ss_library # cast:ss_librarian,ss_tang # speaker:narrator
  -> practice
* [先去长廊接她一剑，再把自己没看懂的带回问先生。 # cid:ss_test_before]
  ~ ss_read_whole = false
  纸先压好。我若回来还说她只是乱变，您就问我哪一剑。 # beat:ss_old_visit_10 # scene:ss_library # cast:ss_librarian,ss_tang # speaker:you
  这句我记得快，不必劳你再抄。 # beat:ss_old_visit_11 # scene:ss_library # cast:ss_librarian,ss_tang # speaker:ss_librarian # mood:ss_librarian=amused
  阿棠先让你挑一个落点，不愿在你已经替她让出路的时候表演很活。 # beat:ss_old_visit_12 # scene:ss_library # cast:ss_librarian,ss_tang # speaker:narrator
  -> practice

=== practice ===
你守好前后，她试着从一处偏线接出。第一回她只想变得不同，剑尖绕远，你还没追，她自己就停了。 # beat:ss_practice_1 # scene:ss_corridor # cast:ss_tang # speaker:narrator
你刚才若进，我这一步就没了。 # beat:ss_practice_2 # scene:ss_corridor # cast:ss_tang # speaker:ss_tang # mood:ss_tang=uneasy
我还没动。 # beat:ss_practice_3 # scene:ss_corridor # cast:ss_tang # speaker:you
所以才更丢脸。再来，别笑完就走。 # beat:ss_practice_4 # scene:ss_corridor # cast:ss_tang # speaker:ss_tang # mood:ss_tang=sharp
第二回她不先定自己该多新，等你肩转，才从那一瞬接过去。你挡得住，却失了原先预留给下一剑的位置。 # beat:ss_practice_5 # scene:ss_corridor # cast:ss_tang # speaker:narrator
* [请她再照原结构走一遍，看看自己留好的下一剑到底解决什么。 # cid:ss_ask_old_return]
  ~ ss_own_notes = 1
  这回我先不改。你看我换线时，哪里仍能接住。 # beat:ss_practice_6 # scene:ss_corridor # cast:ss_tang # speaker:you
  同一处你没有再丢，她却从另一侧贴近。你们把得失各记一条，不把上一剑赢了便说成一门剑终于全对。 # beat:ss_practice_7 # scene:ss_corridor # cast:ss_tang # speaker:narrator
  两个人三条错，先生总算有东西收了。 # beat:ss_practice_8 # scene:ss_corridor # cast:ss_tang # speaker:ss_tang # mood:ss_tang=amused
  -> fire
* [试着不抢回原来的位置，从眼前这一步继续，承认也可能丢门户。 # cid:ss_try_live_line]
  ~ ss_own_notes = 2
  你顺新线接，第一下快了，第二下却露出肋前。阿棠没继续压，剑尖在你能看清的地方停住。 # beat:ss_practice_9 # scene:ss_corridor # cast:ss_tang # speaker:narrator
  不是每回不用回来便更好。我刚才才丢过，你倒接着替我再丢一次。 # beat:ss_practice_10 # scene:ss_corridor # cast:ss_tang # speaker:ss_tang # mood:ss_tang=intent
  你把这处留在自己的课稿上，明日仍要走，不拿学南岳二字给它免问。 # beat:ss_practice_11 # scene:ss_corridor # cast:ss_tang # speaker:narrator
  -> fire

=== fire ===
那一夜，你们已从长廊回来，楼里忽然有人喊火。偏室旧棉先着，火顺木梁往上走；后来查明是炭烘纸引起，没有谁来纵火。 # beat:ss_fire_1 # scene:ss_fire # cast:ss_tang,ss_librarian # speaker:narrator
侧架！有人在里面！ # beat:ss_fire_2 # scene:ss_fire # cast:ss_tang,ss_librarian # speaker:ss_tang # mood:ss_tang=surprised
阿棠冲到楼口，看见抄手被倒下的木架挡住。你多年留下的课堂稿在另一边低架上，老师却喊亲批旧录已经上不去。 # beat:ss_fire_3 # scene:ss_fire # cast:ss_tang,ss_librarian # speaker:narrator
别从梁下穿！这一侧先退出来！ # beat:ss_fire_4 # scene:ss_fire # cast:ss_tang,ss_librarian # speaker:ss_librarian # mood:ss_librarian=sharp
梁上传来一声裂响，门外有人喊水桶到了。阿棠顶住架子，腾不出手来接。 # beat:ss_fire_5 # scene:ss_fire # cast:ss_tang,ss_librarian # speaker:narrator
* [先同阿棠接出被挡的抄手，放下自己的课堂稿。 # cid:ss_help_copyist]
  ~ ss_saved_notes = false
  这头给我。纸先别去拿，叫外面的人接。 # beat:ss_fire_6 # scene:ss_fire # cast:ss_tang,ss_librarian # speaker:you
  你们把人从架下拖开，阿棠隔着衣袖护住他。老师在门外接上，你再回头，低架上的纸已经卷进火里。 # beat:ss_fire_7 # scene:ss_fire # cast:ss_tang,ss_librarian # speaker:narrator
  出来！别拿剩两页当还能再走一回的路。 # beat:ss_fire_8 # scene:ss_fire # cast:ss_tang,ss_librarian # speaker:ss_tang # mood:ss_tang=intent
  -> ashes
* [抱出低架课堂稿，叫阿棠从侧廊接人，听见回声才退。 # cid:ss_delegate_and_save]
  ~ ss_saved_notes = true
  侧廊接人！我取这一包，出来在门口应我。 # beat:ss_fire_9 # scene:ss_fire # cast:ss_tang,ss_librarian # speaker:you
  你把近处纸包抱低，没再碰那些够不到的亲批。阿棠的应声从木架后传来，你边退边看侧廊有没有人接上。 # beat:ss_fire_10 # scene:ss_fire # cast:ss_tang,ss_librarian # speaker:narrator
  -> ashes

=== ashes ===
救了整夜，半座楼仍烧了，大量旧录成灰。谢无咎晚年亲批中，两册没有完整副本的也失了。先生拿来空册报失，笔搁上去两次，都没落下。 # beat:ss_ashes_1 # scene:ss_afterfire # cast:ss_librarian,ss_tang # speaker:narrator
那一页，改笔压在原字上，我还记得墨色。 # beat:ss_ashes_2 # scene:ss_afterfire # cast:ss_librarian,ss_tang # speaker:ss_librarian # mood:ss_librarian=uneasy
他说到这里停了，没人替他用“以后再抄”补上已不存在的原笔。 # beat:ss_ashes_3 # scene:ss_afterfire # cast:ss_librarian,ss_tang # speaker:narrator
{
- ss_saved_notes and not ss_passage:
侧廊的架子未移开。阿棠和门外的人绕过一截热梁才接出抄手，手掌烫伤，三个月里要换别人持剑示范。你抱出的课稿还在，她写自己那一半时却得由你代笔。 # beat:ss_ashes_4 # scene:ss_afterfire # cast:ss_librarian,ss_tang # speaker:narrator
我说，你写。哪儿听不明白就问，不准见我握不了笔，就把你那句添成我的。 # beat:ss_ashes_5 # scene:ss_afterfire # cast:ss_librarian,ss_tang # speaker:ss_tang # mood:ss_tang=uneasy
- else:
阿棠和门外人接出了抄手。她掌上有一处擦红，能握笔，也仍先听老师哪一箱能再移。你们救出的人醒着，身后那两册亲批却不会跟着醒来。 # beat:ss_ashes_6 # scene:ss_afterfire # cast:ss_librarian,ss_tang # speaker:narrator
还有干布么？他袖子黏住了。那两册……先生，明日我陪您报。 # beat:ss_ashes_7 # scene:ss_afterfire # cast:ss_librarian,ss_tang # speaker:ss_tang # mood:ss_tang=intent
}
* [先把毁失与原有副本分开，承认自己也有没补完的课。 # cid:ss_record_loss]
  ~ ss_loss_open = true
  原笔失了就是失了。现存的抄本，抄自哪一份也写清。 # beat:ss_ashes_8 # scene:ss_afterfire # cast:ss_librarian,ss_tang # speaker:you
  先写你真知道的。我的那一箱，我自己报，不叫你替我认全。 # beat:ss_ashes_9 # scene:ss_afterfire # cast:ss_librarian,ss_tang # speaker:ss_librarian # mood:ss_librarian=intent
  阿棠蘸着冷茶润开黏住的页角。你写到第三箱，她用胳膊肘挡了一下：这箱得等先生。 # beat:ss_ashes_10 # scene:ss_afterfire # cast:ss_librarian,ss_tang # speaker:narrator
  -> three_months
* [先替抄手找干衣和落脚处，缺册请老师核，回来再交自己的那份。 # cid:ss_first_shelter]
  ~ ss_loss_open = false
  人先安置。我的那一包未核，别先算进齐数。 # beat:ss_ashes_11 # scene:ss_afterfire # cast:ss_librarian,ss_tang # speaker:you
  去。回来拿你自己的纸，不要让我替你猜哪页是旧稿。 # beat:ss_ashes_12 # scene:ss_afterfire # cast:ss_librarian,ss_tang # speaker:ss_librarian # mood:ss_librarian=neutral
  你把落脚处报给阿棠。她替抄手换了盆水，等你回来，桌上还有那叠未核的纸。 # beat:ss_ashes_13 # scene:ss_afterfire # cast:ss_librarian,ss_tang # speaker:narrator
  -> three_months

=== three_months ===
三个月后，南岳七辆车进门，七箱书逐一抬下。头一本是无咎晚录乙本：沈照岳当年带去的抄本，南岳一直存着。 # beat:ss_three_months_1 # scene:ss_cart # cast:ss_nyelder,ss_librarian,ss_tang # speaker:narrator
全送回来？自己不留？ # beat:ss_three_months_2 # scene:ss_cart # cast:ss_nyelder,ss_librarian,ss_tang # speaker:ss_librarian # mood:ss_librarian=uneasy
已另抄。 # beat:ss_three_months_3 # scene:ss_cart # cast:ss_nyelder,ss_librarian,ss_tang # speaker:ss_nyelder # mood:ss_nyelder=neutral
里面有照岳留下的，也肯给？ # beat:ss_three_months_4 # scene:ss_cart # cast:ss_nyelder,ss_librarian,ss_tang # speaker:ss_librarian # mood:ss_librarian=neutral
这是你们的。 # beat:ss_three_months_5 # scene:ss_cart # cast:ss_nyelder,ss_librarian,ss_tang # speaker:ss_nyelder # mood:ss_nyelder=calm
你站在车边，看着本来以为只剩自己记得的一行又出现在纸上。笔不是当年那支，字也不是当年那层墨，仍是有人一直替它留着的那一份。 # beat:ss_three_months_6 # scene:ss_cart # cast:ss_nyelder,ss_librarian,ss_tang # speaker:narrator
* [问南岳长老另一套是谁抄、从哪页核，不替来人先讲一段恩情。 # cid:ss_ask_copy_work]
  这套回来，山里那套谁还在核？ # beat:ss_three_months_7 # scene:ss_cart # cast:ss_nyelder,ss_librarian,ss_tang # speaker:you
  几个人还等我回去接课。送了箱子，他们可没准我把课也送没。 # beat:ss_three_months_8 # scene:ss_cart # cast:ss_nyelder,ss_librarian,ss_tang # speaker:ss_nyelder # mood:ss_nyelder=amused
  这话我得让先生也听见。 # beat:ss_three_months_9 # scene:ss_cart # cast:ss_nyelder,ss_librarian,ss_tang # speaker:ss_tang # mood:ss_tang=neutral
  长老笑，让你把哪一箱最急写在车单上。 # beat:ss_three_months_10 # scene:ss_cart # cast:ss_nyelder,ss_librarian,ss_tang # speaker:narrator
  -> open_boxes
* [把最难开口的话问出来，归还以后，怕不怕被再叫支派。 # cid:ss_ask_branch]
  这些回来，会不会又有人拿它说南岳只是金陵一支？ # beat:ss_three_months_11 # scene:ss_cart # cast:ss_nyelder,ss_librarian,ss_tang # speaker:you
  我们已经走出去了。 # beat:ss_three_months_12 # scene:ss_cart # cast:ss_nyelder,ss_librarian,ss_tang # speaker:ss_nyelder # mood:ss_nyelder=intent
  本门老师伸手去接，没托稳书脊，又换了两只手。长老等他抱住，才去取下一册。 # beat:ss_three_months_13 # scene:ss_cart # cast:ss_nyelder,ss_librarian,ss_tang # speaker:narrator
  -> open_boxes

=== open_boxes ===
金陵重抄一套重要旧录回赠南岳，扉页写旧本归还、新本相赠。新本也要有人核，要有人跟车送到真能收下的人手里。 # beat:ss_open_boxes_1 # scene:ss_library # cast:ss_librarian,ss_tang # speaker:narrator # cg:workingBooks # action:案头书卷
你想去山里，还是留下把这楼重新理一遍？ # beat:ss_open_boxes_2 # scene:ss_library # cast:ss_librarian,ss_tang # speaker:ss_tang # mood:ss_tang=neutral
你呢？ # beat:ss_open_boxes_3 # scene:ss_library # cast:ss_librarian,ss_tang # speaker:you # cg:none
你先说你。别每次问我一句，便把自己的差事变成陪我选。 # beat:ss_open_boxes_4 # scene:ss_library # cast:ss_librarian,ss_tang # speaker:ss_tang # mood:ss_tang=amused
她想亲走那些只在纸上读过的山阶，也要把自己答应补的那堂课交清。你们不能靠一声都去，把两件留下的活全交给没答应的人。 # beat:ss_open_boxes_5 # scene:ss_library # cast:ss_librarian,ss_tang # speaker:narrator
{
- not ss_saved_notes:
你的课堂稿烧了。重写得请阿棠再演一遍，她的那一半不能由你凭记得差不多替她写完。 # beat:ss_open_boxes_6 # scene:ss_library # cast:ss_librarian,ss_tang # speaker:narrator
- else:
你的课堂稿在，边角有烟，里头原先不会的那一处还不会。阿棠让你把那一页翻出来，没让火替你把错也烧成对的。 # beat:ss_open_boxes_7 # scene:ss_library # cast:ss_librarian,ss_tang # speaker:narrator
}
* [核完自己那份，随回赠书车上山，接外路讲习和回信。 # cid:ss_go_with_books]
  ~ ss_path = 1
  我随新本走。哪天收、谁核过，回信都由我报，不替你先说一同去。 # beat:ss_open_boxes_8 # scene:ss_library # cast:ss_librarian,ss_tang # speaker:you
  那我把楼里这一趟接下。回山的路别只画得像锅盖，真走过再给我看。 # beat:ss_open_boxes_9 # scene:ss_library # cast:ss_librarian,ss_tang # speaker:ss_tang # mood:ss_tang=intent
  她抽走你压着的车单，先圈了自己的楼内值日，又把空着的收书回信推给你。 # beat:ss_open_boxes_10 # scene:ss_library # cast:ss_librarian,ss_tang # speaker:narrator
  -> new_work
* [留楼核旧录，把跨地讲习给准备出门的人，接完整讲剑录。 # cid:ss_stay_library]
  ~ ss_path = 2
  我留。山路那页请你真走，我把这边哪本能借、哪本未核写清。 # beat:ss_open_boxes_11 # scene:ss_library # cast:ss_librarian,ss_tang # speaker:you
  行。等我回来，你不能只剩一张抄得最漂亮的“还没空试”。 # beat:ss_open_boxes_12 # scene:ss_library # cast:ss_librarian,ss_tang # speaker:ss_tang # mood:ss_tang=amused
  她抱剑去追刚出门的车夫，走到门槛又折回来，把那张锅盖似的山图卷走了。你低头重排楼内值日。 # beat:ss_open_boxes_13 # scene:ss_library # cast:ss_librarian,ss_tang # speaker:narrator
  -> new_work

=== new_work ===
新抄本核定以后，你们分别接下各自那一路。先前没走过的路，不因故事讲到回礼便忽然都熟了。 # beat:ss_new_work_1 # scene:ss_newwork # cast:ss_tang # speaker:narrator
{
- ss_saved_notes and not ss_passage:
这三个月你替我写的，先拿过来。手刚养好，今日能走哪一段，我自己试，不要替我一口气补完。 # beat:ss_new_work_2 # scene:ss_newwork # cast:ss_tang # speaker:ss_tang # mood:ss_tang=intent
她把剑递给你，先空手屈伸几次，再接回来。第一下握得太紧，她自己松了，等掌心不再发白才起手。你将刚提起来的纸重新放下。 # beat:ss_new_work_3 # scene:ss_newwork # cast:ss_tang # speaker:narrator
- else:
先把你那一处再走。我接哪一剑，你也得看清，不是拿着纸说我演得与纸不同。 # beat:ss_new_work_4 # scene:ss_newwork # cast:ss_tang # speaker:ss_tang # mood:ss_tang=intent
你们真试一回，换了两行注，才把纸收入本里。 # beat:ss_new_work_5 # scene:ss_newwork # cast:ss_tang # speaker:narrator
}
{
- ss_path == 1:
南岳山下，你把新本交到授课长者手里。他先问哪些已核，再问你会不会走那一式，没把金陵来客只当抄纸的。 # beat:ss_new_work_6 # scene:ss_mountainwork # cast:ss_nyteacher # speaker:narrator
这边学生想变，快得很。昨日这一步还没走清，今日已先嫌它旧。 # beat:ss_new_work_7 # scene:ss_mountainwork # cast:ss_nyteacher # speaker:ss_nyteacher # mood:ss_nyteacher=neutral
那就都不许改？ # beat:ss_new_work_8 # scene:ss_mountainwork # cast:ss_nyteacher # speaker:you
先让他把自己的旧步走全。真不会的地方，你站旁边替他喊一声变，也不会多出一条能走的路。 # beat:ss_new_work_9 # scene:ss_mountainwork # cast:ss_nyteacher # speaker:ss_nyteacher # mood:ss_nyteacher=sharp
他叫那位学生来，不拿两家争论了多久替眼前这一课作答。 # beat:ss_new_work_10 # scene:ss_mountainwork # cast:ss_nyteacher # speaker:narrator
* [先随学徒在斜石上试，再把原式适用处写回金陵。 # cid:ss_try_mountain_lesson]
  ~ ss_lesson = 1
  年轻人一心要新，第一步便把旧步为何稳忘了。你也跟着打滑，长者让你们先把脚边的草拨开。 # beat:ss_new_work_11 # scene:ss_mountainwork # cast:ss_nyteacher # speaker:narrator
  纸上没有这丛草。两位先别争原式，谁把它清了？ # beat:ss_new_work_12 # scene:ss_mountainwork # cast:ss_nyteacher # speaker:ss_nyteacher # mood:ss_nyteacher=amused
  你蹲下去，学生在另一头接住剑，不再只等来客说一段新见识。 # beat:ss_new_work_13 # scene:ss_mountainwork # cast:ss_nyteacher # speaker:narrator
  -> years_later
* [先借一处平坪与斜石对照，少走一回远路，课后补看真山道。 # cid:ss_compare_ground]
  ~ ss_lesson = 2
  我想先把原来能站住的那一回走给他看。 # beat:ss_new_work_14 # scene:ss_mountainwork # cast:ss_nyteacher # speaker:you
  可以。下午那段窄路你还要来，不拿两块摆好的石头充一座山。 # beat:ss_new_work_15 # scene:ss_mountainwork # cast:ss_nyteacher # speaker:ss_nyteacher # mood:ss_nyteacher=intent
  两处都走过，学生才把自己改掉的第一步添回一半。你也留下下午的时辰，没从正确的对照里免掉实际的路。 # beat:ss_new_work_16 # scene:ss_mountainwork # cast:ss_nyteacher # speaker:narrator
  -> years_later
- else:
你留楼核录，先接到一位练剑人的质问：这一页改得更好，为什么借出来时还得先替旧式解释？先生把你推到坪边，让你带一名新人。 # beat:ss_new_work_17 # scene:ss_librarywork # cast:ss_librarian # speaker:narrator
你替他答，还是让他做？ # beat:ss_new_work_18 # scene:ss_librarywork # cast:ss_librarian # speaker:ss_librarian # mood:ss_librarian=neutral
先做。纸我拿着，他走。 # beat:ss_new_work_19 # scene:ss_librarywork # cast:ss_librarian # speaker:you
那弟子走到转身便把全身一起转过来，肋前空给你。你没碰他，只把木剑停在他能看见的地方。 # beat:ss_new_work_20 # scene:ss_librarywork # cast:ss_librarian # speaker:narrator
* [先让新人换一次真实来剑，再把这次为什么停写进讲剑录。 # cid:ss_teach_live]
  ~ ss_lesson = 1
  你再来。这回我不站原地等你背第二步。 # beat:ss_new_work_21 # scene:ss_librarywork # cast:ss_librarian # speaker:you
  他没背成，自己先问为什么前头那一剑还有路。先生接住你手里的纸，让你把剩下半堂教完再写。 # beat:ss_new_work_22 # scene:ss_librarywork # cast:ss_librarian # speaker:narrator
  总算有一页字，是等人真动过才长出来。 # beat:ss_new_work_23 # scene:ss_librarywork # cast:ss_librarian # speaker:ss_librarian # mood:ss_librarian=amused
  -> years_later
* [先取出同式旧本和新注，让新人自己指不同处，再试一回。 # cid:ss_mark_origin]
  ~ ss_lesson = 2
  他指得对，走时仍露门。你把两页放回，陪他慢了一趟。 # beat:ss_new_work_24 # scene:ss_librarywork # cast:ss_librarian # speaker:narrator
  能指，不等于已经能走。你这份录别只收他说对的那句。 # beat:ss_new_work_25 # scene:ss_librarywork # cast:ss_librarian # speaker:ss_librarian # mood:ss_librarian=intent
  你记了第二次仍没走成，给下一班留了要接着试的空处。 # beat:ss_new_work_26 # scene:ss_librarywork # cast:ss_librarian # speaker:narrator
  -> years_later
}

=== years_later ===
三十年过去，约一百三十年前。你已五十上下，旧先生不再守夜值，新一代门人接他的课。两派都有人肯改，也都有人怕改得太快。 # beat:ss_years_later_1 # scene:ss_thirtyyears # cast:ss_nextrecorder # speaker:narrator
金陵这一代越来越重正录，剑极整，真正走上高处的人却少了。一位年轻剑客当堂问：若祖师今日还在，发现更好的走法，改不改？ # beat:ss_years_later_2 # scene:ss_thirtyyears # cast:ss_nextrecorder # speaker:narrator
这段议录你要全收？里面有人答，因为你不是祖师。 # beat:ss_years_later_3 # scene:ss_thirtyyears # cast:ss_nextrecorder # speaker:ss_nextrecorder # mood:ss_nextrecorder=intent
你原想先抄后面已议定的条目，那句难听话夹在中间，纸角还沾一处墨。 # beat:ss_years_later_4 # scene:ss_thirtyyears # cast:ss_nextrecorder # speaker:narrator
{
- ss_path == 1:
你是在山下收到阿棠的来信，原议录另有两位亲见者核过。信没只抄她喜欢的话，还写年轻人追问要练到什么时候，才有资格不是祖师也能改。 # beat:ss_years_later_5 # scene:ss_thirtyyears # cast:ss_nextrecorder # speaker:narrator
给我原问句。别只剩他们后来准了什么。 # beat:ss_years_later_6 # scene:ss_thirtyyears # cast:ss_nextrecorder # speaker:you
阿棠回信说，你如今终于不会把一张山图画成一口锅，可别又把一场争论画成一条直线。 # beat:ss_years_later_7 # scene:ss_thirtyyears # cast:ss_nextrecorder # speaker:narrator
- else:
你在金陵听见那次追问，抄录的人转头看你。老人端着茶迟迟不喝，年轻人涨红了脸，仍站在原处等答复。 # beat:ss_years_later_8 # scene:ss_thirtyyears # cast:ss_nextrecorder # speaker:narrator
他当时怎么问，就留怎么问。 # beat:ss_years_later_9 # scene:ss_thirtyyears # cast:ss_nextrecorder # speaker:you
阿棠后来出去听另一堂讲剑，回来先问你有没有把中间那句删掉。你把完整一页推给她。 # beat:ss_years_later_10 # scene:ss_thirtyyears # cast:ss_nextrecorder # speaker:narrator
}
{
- ss_lesson == 1:
旧课簿翻到一处汗渍。那年你等学生做完才落笔，后来带新人，总有人嫌你一页写得慢；你如今还认得那位学生转身时露出的空处。 # beat:ss_years_later_11 # scene:ss_thirtyyears # cast:ss_nextrecorder # speaker:narrator
- else:
你把旧本和新注抽出来，想用当年那种并排法收这次议论。纸铺到桌沿才发现还得另添一页：练剑的两种走法，装不下堂上所有人的话。 # beat:ss_years_later_12 # scene:ss_thirtyyears # cast:ss_nextrecorder # speaker:narrator
}
* [保留原问与原答，让后来借录的人知道分歧并未当场消失。 # cid:ss_keep_question]
  ~ ss_kept_question = true
  后来扩大别录，是后来。不能拿后来那条改掉当日说过的话。 # beat:ss_years_later_13 # scene:ss_thirtyyears # cast:ss_nextrecorder # speaker:you
  那我也要把谁先说的核一回，不把最重一句挂到最不敢反驳的人名下。 # beat:ss_years_later_14 # scene:ss_thirtyyears # cast:ss_nextrecorder # speaker:ss_nextrecorder # mood:ss_nextrecorder=uneasy
  你们多核一趟，借阅晚了两日。年轻人来领时先翻到那句，隔着柜台念了一遍，问这次能不能连自己的追问也带走。 # beat:ss_years_later_15 # scene:ss_thirtyyears # cast:ss_nextrecorder # speaker:narrator
  -> two_schools
* [先交今天能用的课，把原议论另列附录，自己再补见证者核问。 # cid:ss_keep_lesson]
  ~ ss_kept_question = false
  课先用。原问不删，另放一册，我去核。 # beat:ss_years_later_16 # scene:ss_thirtyyears # cast:ss_nextrecorder # speaker:you
  那借课的人未必来取第二册，你得说清还有这一份。 # beat:ss_years_later_17 # scene:ss_thirtyyears # cast:ss_nextrecorder # speaker:ss_nextrecorder # mood:ss_nextrecorder=intent
  你在扉页添了借附录的去处，后来每授一次课，也多交代这一项，不让分册变成无声的删掉。 # beat:ss_years_later_18 # scene:ss_thirtyyears # cast:ss_nextrecorder # speaker:narrator
  -> two_schools

=== two_schools ===
后来金陵扩大别录，成熟门人可留自己的整套变化，不强并主传。南岳也早有另一场争论：原剑未会便急着改，支路越来越散。 # beat:ss_two_schools_1 # scene:ss_twoschools # cast:ss_lateteacher # speaker:narrator
岳承秋整顿基础那一代，有人质问和金陵何别，他说怕的是连旧东西都不会便以为有了新的。弟子搬祖师，他骂祖师四十多岁才改，你练四年。 # beat:ss_two_schools_2 # scene:ss_twoschools # cast:ss_lateteacher # speaker:narrator
学生们读到练四年那句都笑，抄到为什么要留原式，又各自安静，把自己的旧页翻出来。 # beat:ss_two_schools_3 # scene:ss_twoschools # cast:ss_lateteacher # speaker:narrator
金陵笑我们终于会写，我们回写下来又不是不许改。他们又说，至少先写。 # beat:ss_two_schools_4 # scene:ss_twoschools # cast:ss_lateteacher # speaker:ss_lateteacher # mood:ss_lateteacher=amused
你们倒一直有空回信。 # beat:ss_two_schools_5 # scene:ss_twoschools # cast:ss_lateteacher # speaker:you
少来认亲那封，写得尤其快。 # beat:ss_two_schools_6 # scene:ss_twoschools # cast:ss_lateteacher # speaker:ss_lateteacher # mood:ss_lateteacher=neutral
* [把两家的做法交给新来学生试，不先替他选一个永远正确的祖师。 # cid:ss_try_newstudent]
  你从这儿出。先告诉我，你想接哪一个人的下一步。 # beat:ss_two_schools_7 # scene:ss_twoschools # cast:ss_lateteacher # speaker:you
  学生一说随时变，却已在起手时决定往右。老师把另一人换到左边，他立刻卡住。 # beat:ss_two_schools_8 # scene:ss_twoschools # cast:ss_lateteacher # speaker:narrator
  你的随时，原来只等一种人。再来。 # beat:ss_two_schools_9 # scene:ss_twoschools # cast:ss_lateteacher # speaker:ss_lateteacher # mood:ss_lateteacher=intent
  -> guihong
* [请老师把改式与原式出处并排摆出来，自己负责接第一次真来剑。 # cid:ss_ask_records]
  两页都摆上，学生指得清，手上仍慢。你把木剑停在他转身后刚让出的空处。 # beat:ss_two_schools_10 # scene:ss_twoschools # cast:ss_lateteacher # speaker:narrator
  我不是你那一页纸。再换一次线。 # beat:ss_two_schools_11 # scene:ss_twoschools # cast:ss_lateteacher # speaker:you
  老师没有叫他因为读对就过课。你们多留了一回，纸仍整齐，人却终于出汗了。 # beat:ss_two_schools_12 # scene:ss_twoschools # cast:ss_lateteacher # speaker:narrator
  -> guihong

=== guihong ===
又二十年，约一百一十年前。此时你七十上下，江南剑会上，两派老人各取一式，都叫归鸿。 # beat:ss_guihong_1 # scene:ss_guiboard # cast:ss_jlold,ss_nyold,ss_newpupil # speaker:narrator
师伯，这一页上回您划掉半句。今天别又照划掉的念。 # beat:ss_guihong_2 # scene:ss_guiboard # cast:ss_jlold,ss_nyold,ss_newpupil # speaker:ss_newpupil # mood:ss_newpupil=amused
你把改过的拿近。我眼睛不如你，记错了你也别替我圆。 # beat:ss_guihong_3 # scene:ss_guiboard # cast:ss_jlold,ss_nyold,ss_newpupil # speaker:you
金陵这式可追到谢无咎，南岳从沈带出的原式已改十余次。年轻人先看，只见起手、步法、停处全不同。 # beat:ss_guihong_4 # scene:ss_guiboard # cast:ss_jlold,ss_nyold,ss_newpupil # speaker:narrator
先让他们都走。你说先看哪一处？ # beat:ss_guihong_5 # scene:ss_guiboard # cast:ss_jlold,ss_nyold,ss_newpupil # speaker:ss_jlold # mood:ss_jlold=neutral
{
- ss_kept_question:
年轻门人带着当年的整段议录，指着那句追问请两位老人看。南岳老人看完要了一份，金陵老人借走他的笔，在页边补自己今天的答法。 # beat:ss_guihong_6 # scene:ss_guiboard # cast:ss_jlold,ss_nyold,ss_newpupil # speaker:narrator
- else:
年轻门人只借到讲课正文，找不到你说的原问。你写信回楼调附册；送到已是剑会第三日，他带着信来催你先看，别再压在新课下面。 # beat:ss_guihong_7 # scene:ss_guiboard # cast:ss_jlold,ss_nyold,ss_newpupil # speaker:narrator
}
* [先守原结构，让学生看换线时如何还有下一剑。 # cid:ss_structure_test]
  ~ ss_gui_method = 1
  你先按这处收。旁边那位换身，不必等他收完。 # beat:ss_guihong_8 # scene:ss_guiboard # cast:ss_jlold,ss_nyold,ss_newpupil # speaker:you
  第一次留得住，第二次对方不从预定处转，你那页的后手便赶不上。学生回头望你，没有急着替老师把对方改成出错了。 # beat:ss_guihong_9 # scene:ss_guiboard # cast:ss_jlold,ss_nyold,ss_newpupil # speaker:narrator
  结构留的是机会，不是叫别人按机会走。 # beat:ss_guihong_10 # scene:ss_guiboard # cast:ss_jlold,ss_nyold,ss_newpupil # speaker:ss_jlold # mood:ss_jlold=intent
  -> guihong_trial
* [先从眼前转身一瞬接，不强回原来位置，再看会不会失后路。 # cid:ss_moment_test]
  ~ ss_gui_method = 2
  先看他换线，别先背我这句。来剑不过来，你也不用替它造一个转身。 # beat:ss_guihong_11 # scene:ss_guiboard # cast:ss_jlold,ss_nyold,ss_newpupil # speaker:you
  第一次截到，第二次学生急着追新线，原来的门露了。南岳老人手一停，叫他自己回头看那片空。 # beat:ss_guihong_12 # scene:ss_guiboard # cast:ss_jlold,ss_nyold,ss_newpupil # speaker:narrator
  从眼前生，也得让下一口气接得上。不是跑远了便叫活。 # beat:ss_guihong_13 # scene:ss_guiboard # cast:ss_jlold,ss_nyold,ss_newpupil # speaker:ss_nyold # mood:ss_nyold=intent
  -> guihong_trial

=== guihong_trial ===
能找到的旧谱按年代摆了一天。外形变了十余回，两式真正争的，却一直是对手转身换线的一瞬。 # beat:ss_guihong_trial_1 # scene:ss_guiboard # cast:ss_jlold,ss_nyold # speaker:narrator
所以还是同一剑。 # beat:ss_guihong_trial_2 # scene:ss_guiboard # cast:ss_jlold,ss_nyold # speaker:ss_nyold # mood:ss_nyold=neutral
不一样。你们走得太远，我们记得太多。 # beat:ss_guihong_trial_3 # scene:ss_guiboard # cast:ss_jlold,ss_nyold # speaker:ss_jlold # mood:ss_jlold=intent
可最后还在这里碰上。 # beat:ss_guihong_trial_4 # scene:ss_guiboard # cast:ss_jlold,ss_nyold # speaker:ss_nyold # mood:ss_nyold=calm
两人对视，没有谁把桌上另一半纸扫回别人怀里。你不是这一天忽然参透两宗最高剑学，只是终于知道自己这些年在记哪一个问题。 # beat:ss_guihong_trial_5 # scene:ss_guiboard # cast:ss_jlold,ss_nyold # speaker:narrator
{
- ss_path == 1:
山下等你接课的学生托人来问归期。你先前随回赠车走的路，后来成了往返两地的常差，不是拜过另一座祖堂便能替两家定一套新辈序。 # beat:ss_guihong_trial_6 # scene:ss_guiboard # cast:ss_jlold,ss_nyold # speaker:narrator
这页核完我回。来不及赶的那堂，请原班老师接，不再等我一句快了。 # beat:ss_guihong_trial_7 # scene:ss_guiboard # cast:ss_jlold,ss_nyold # speaker:you
你把老师的名字写回去，给学生一个确能找到的人。 # beat:ss_guihong_trial_8 # scene:ss_guiboard # cast:ss_jlold,ss_nyold # speaker:narrator
- else:
楼里等你核借录的人来信，问这次归鸿要收正录还是另附。你原先选择留下的差事，五十年后仍要按看过、未看过逐页交清。 # beat:ss_guihong_trial_9 # scene:ss_guiboard # cast:ss_jlold,ss_nyold # speaker:narrator
两种都写。用在哪儿、从哪儿改，也写。不替任何一位老人先宣布今天并成一家。 # beat:ss_guihong_trial_10 # scene:ss_guiboard # cast:ss_jlold,ss_nyold # speaker:you
你把两边核过的姓名留在页尾，未核处仍开着。 # beat:ss_guihong_trial_11 # scene:ss_guiboard # cast:ss_jlold,ss_nyold # speaker:narrator
}
* [先兑现已排的课或借录交接，不为自己多听一场而让别人空等。 # cid:ss_return_promised]
  ~ ss_last_kept = true
  最后一场问剑还没结束，你已起身交清手里一页。年轻人问你难道不想再看。 # beat:ss_guihong_trial_12 # scene:ss_guiboard # cast:ss_jlold,ss_nyold # speaker:narrator
  你把等候的那封信给他看，约他若记下最后一场，往后寄来。信里那个人等着接你的班，落款旁还写了值日时辰。 # beat:ss_guihong_trial_13 # scene:ss_guiboard # cast:ss_jlold,ss_nyold # speaker:narrator
  -> afterwards
* [留下再看一场，先付代课或补差的实钱，不把代价转给未答应的人。 # cid:ss_stay_one_bout]
  ~ ss_last_kept = false
  我还想看。先问代课的肯不肯，钱照给，不拿一句老交情抵。 # beat:ss_guihong_trial_14 # scene:ss_guiboard # cast:ss_jlold,ss_nyold # speaker:you
  回信肯接，你才坐下。阿棠知道以后写来一句，你年轻时欠三页纸，如今总算知道欠的是谁的一下午。 # beat:ss_guihong_trial_15 # scene:ss_guiboard # cast:ss_jlold,ss_nyold # speaker:narrator
  你留的这一回值得，补差也确实从自己的束脩里少了一份。 # beat:ss_guihong_trial_16 # scene:ss_guiboard # cast:ss_jlold,ss_nyold # speaker:narrator
  -> afterwards

=== afterwards ===
临走，年轻门人替你系紧装谱的包，发现里头还夹着没写完的回信。你请他路过两地时带去，先问了他原定的行程；他指着包说，信能带，半箱谱你自己背。 # beat:ss_afterwards_1 # scene:ss_afterward # cast:none # speaker:narrator
{
- ss_saved_notes:
当年救出的课堂稿还在。阿棠后来补的批注又密了几层，有几处竟把你原先最得意的句子划掉。你把那几处也传给学生，没有因纸经过火就准它永远正确。 # beat:ss_afterwards_2 # scene:ss_afterward # cast:none # speaker:narrator
- else:
当年课堂稿没救回来。你重抄的版本留了一个缺页记号，阿棠自己的那半边另署姓名。学生问两页为何不一样，你让他们看见不是一人记住了全部。 # beat:ss_afterwards_3 # scene:ss_afterward # cast:none # speaker:narrator
}
{
- ss_saved_notes and not ss_passage:
阿棠那三个月代笔的页角仍有她口述后改过的字。后来手养好，她自己走了山路，没让你把那一伤写成从此不能持剑的一生。 # beat:ss_afterwards_4 # scene:ss_afterward # cast:none # speaker:narrator
- else:
阿棠后来自己上过山，回楼教过课。你们仍会为一页先写哪句话争起来，没人只因为那夜互相接过一回，便从此说什么都一样。 # beat:ss_afterwards_5 # scene:ss_afterward # cast:none # speaker:narrator
}
更后的旧录里，金陵重开别录，南岳保住改式的来历；两家都出过返真、总谱与南榜人物，最终各列八家。沈在金陵旧系未被抹去，南岳祖堂的少学金陵也未删。 # beat:ss_afterwards_6 # scene:ss_afterward # cast:none # speaker:narrator
有人问源头是不是同一脉，两边都认。再问如今，答案仍是两家。后世顾南陵与沈孤鸿又会为商号的事争剑，那时还有另一代人的难处。 # beat:ss_afterwards_7 # scene:ss_afterward # cast:none # speaker:narrator
{
- ss_path == 1:
你回到山下，把归鸿那一瞬讲给仍会走错的学生。纸留着，路也去走；有人晚来一课，你先问他雨后从哪条石阶上来。那些改变能教下去，才不是只活在你自己的一剑里。 # beat:ss_afterwards_8 # scene:ss_afterward # cast:none # speaker:narrator # ending:ss_mountain_lesson
-> END
- else:
你回楼，将两份归鸿放在能一同借出的地方。门人来问哪本更正，你请他带剑到坪上；旧页有人认，新路也有人真去试。楼里的东西留住了，门外的人仍能把它带走。 # beat:ss_afterwards_9 # scene:ss_afterward # cast:none # speaker:narrator # ending:ss_library_lesson
-> END
}
