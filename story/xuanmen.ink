// Canon 7788–8251. POV Zhang Shouyi; after death narrator only. No invented ages/realm for unnamed elders.
VAR xm_ask = false
VAR xm_plain = false
VAR xm_handover = false
VAR xm_receipt = false
VAR xm_ground = false
VAR xm_medicine = false
VAR xm_copy = false
VAR xm_allow = false
VAR xm_envy = false
VAR xm_job = false
VAR xm_after = 0
-> mud

=== mud ===
二十三岁，你叫张守一。昨日襄阳武会上，俞玄峰二十一剑胜了号称三州第一剑的名宿。今日，灰衣老人百余招断了俞的剑。 # beat:xm_mud_1 # scene:xm_street # cast:xm_lu,xm_grey # speaker:narrator
你追出去请教，十四招后躺在街边。泥进了领口，手指还在找剑。 # beat:xm_mud_2 # scene:xm_street # cast:xm_lu,xm_grey # speaker:narrator
回去问陆松年。当年汉水边，他也是这么躺的。 # beat:xm_mud_3 # scene:xm_street # cast:xm_lu,xm_grey # speaker:xm_grey # mood:xm_grey=neutral
师父赶到，没有先替你拂衣上的泥。老人已走远，街上看热闹的人让开半步。 # beat:xm_mud_4 # scene:xm_street # cast:xm_lu,xm_grey # speaker:narrator
* [先问老人是谁，承认昨日见过二十一剑，仍没看懂今日。 # cid:xm_ask_his_name]
  ~ xm_ask = true
  旧总谱最前一列的人。退榜二十多年了。 # beat:xm_mud_5 # scene:xm_street # cast:xm_lu # speaker:xm_lu # mood:xm_lu=neutral
  那我怎么从未听过？ # beat:xm_mud_6 # scene:xm_street # cast:xm_lu # speaker:you
  他不入你听过的那些名字，便不用你听过的本事了？ # beat:xm_mud_7 # scene:xm_street # cast:xm_lu # speaker:xm_lu # mood:xm_lu=neutral
  -> old_name
* [问师父当年在汉水边怎么躺，肯先听一件不体面的旧事。 # cid:xm_ask_his_mud]
  ~ xm_ask = false
  比你离水近一点。衣裳还得多晾一日。 # beat:xm_mud_8 # scene:xm_street # cast:xm_lu # speaker:xm_lu # mood:xm_lu=amused
  你笑不出来，又觉得师父竟肯说，泥里的这一刻便不必藏到只有你知道。 # beat:xm_mud_9 # scene:xm_street # cast:xm_lu # speaker:narrator
  -> old_name

=== old_name ===
夜里师父说完旧事，你把刚抄的榜纸折回去。那个人并未因退榜而衰弱，昨日的名宿也没有因一败便从未会剑。 # beat:xm_old_name_1 # scene:xm_night # cast:xm_lu # speaker:narrator
以后来一个没有名次的，我们怎么接？ # beat:xm_old_name_2 # scene:xm_night # cast:xm_lu # speaker:you
先当一个活人接。要试手，再问他愿不愿。 # beat:xm_old_name_3 # scene:xm_night # cast:xm_lu # speaker:xm_lu # mood:xm_lu=neutral
这一夜你还不知道，往后山里排位置，也会用到这句话。 # beat:xm_old_name_4 # scene:xm_night # cast:xm_lu # speaker:narrator # fact:xm_unlisted
* [在访客簿记俞断剑、自己十四招负，不拿老人无名替两场遮过去。 # cid:xm_keep_result]
  ~ xm_plain = true
  墨未干，你想给十四前添一个仅字，停了笔。师父没站在背后催。 # beat:xm_old_name_5 # scene:xm_night # cast:xm_lu # speaker:narrator
  -> broken_roads
* [先写下想请俞再示的一剑，等他自己愿讲，不拿败后的伤口索一篇教训。 # cid:xm_keep_request]
  ~ xm_plain = false
  你把请字留在页边，没替他答应明早。昨日仍有你看不懂的二十一剑。 # beat:xm_old_name_6 # scene:xm_night # cast:xm_lu # speaker:narrator
  -> broken_roads

=== broken_roads ===
再回到山门，已是你四十余岁。武当七院俱强，却争起谁才是正宗。有人索性说各传各法，不必再强称一门。 # beat:xm_broken_roads_1 # scene:xm_gate # cast:xm_wugou # speaker:narrator
汉水旧争此时爆发。来者不过数百，真正压得住山的，是石苍和最上面十几个人：旧总谱人物、南北前列、诸宗最深处的人。 # beat:xm_broken_roads_2 # scene:xm_gate # cast:xm_wugou # speaker:narrator
武当原是次顶尖大宗，缺的不是地方榜上多几个名字；多年没人跨进返真，今日便有人把这道门堵到了山前。 # beat:xm_broken_roads_3 # scene:xm_gate # cast:xm_wugou # speaker:narrator
第一日山门失，第二日紫霄外院破。第三日双方停战，山路上仍在抬人。 # beat:xm_broken_roads_4 # scene:xm_gate # cast:xm_wugou # speaker:narrator
这边断了。药走西路，伤员从下头绕，别再往同一个口挤！ # beat:xm_broken_roads_5 # scene:xm_gate # cast:xm_wugou # speaker:xm_wugou # mood:xm_wugou=sharp
张无垢三十一岁，武功未必进全山前二十。你叫来的两个弟子，却都先在等他的手势。 # beat:xm_broken_roads_6 # scene:xm_gate # cast:xm_wugou # speaker:narrator
* [先将诸院能通的侧路交给张无垢，和他逐处点明换班的人。 # cid:xm_make_handover]
  ~ xm_handover = true
  路我知道。换班的人是谁？ # beat:xm_broken_roads_7 # scene:xm_gate # cast:xm_wugou # speaker:xm_wugou # mood:xm_wugou=neutral
  你补上名字，叫对方亲自来接。张无垢没因你肯帮忙就把没交清的差事算完。 # beat:xm_broken_roads_8 # scene:xm_gate # cast:xm_wugou # speaker:narrator
  -> nine_mats
* [先把最能打的弟子都送去正门，再回来补问抬伤的路线。 # cid:xm_send_strongest]
  ~ xm_handover = false
  正门要人，这里也要。谁把药送过去？ # beat:xm_broken_roads_9 # scene:xm_gate # cast:xm_wugou # speaker:xm_wugou # mood:xm_wugou=sharp
  你折回叫住两个人，脚程已多走一趟。够强的两只手，也不能同时站在两条路上。 # beat:xm_broken_roads_10 # scene:xm_gate # cast:xm_wugou # speaker:narrator
  -> nine_mats

=== nine_mats ===
第四日清晨，陆松年叫九个人进太和宫。九张蒲团，没有按谁昨日多杀了一人来摆。 # beat:xm_nine_mats_1 # scene:xm_hall # cast:xm_lu,xm_wugou # speaker:narrator
今日开始，九个人，各管一件事。 # beat:xm_nine_mats_2 # scene:xm_hall # cast:xm_lu,xm_wugou # speaker:xm_lu # mood:xm_lu=neutral
你统合诸院，俞玄峰领剑脉，郑鹤年守太和正门，赤脚道人游走诸峰。周伯阳守经阁，宋知微主伤药，葛玄同联络外援，岳归真执戒律。 # beat:xm_nine_mats_3 # scene:xm_hall # cast:xm_lu,xm_wugou # speaker:narrator
最后是张无垢，调度弟子。没人让他先胜过殿里另外八个，才准他指山路。 # beat:xm_nine_mats_4 # scene:xm_hall # cast:xm_lu,xm_wugou # speaker:narrator
各院的人，今日先问守哪里。 # beat:xm_nine_mats_5 # scene:xm_hall # cast:xm_lu,xm_wugou # speaker:you
还得问，何时有人来接。 # beat:xm_nine_mats_6 # scene:xm_hall # cast:xm_lu,xm_wugou # speaker:xm_wugou # mood:xm_wugou=neutral # fact:xm_nine_jobs
* [请每处回一张接班条，让伤药与经阁都知道下一个人到了没有。 # cid:xm_send_receipt]
  ~ xm_receipt = true
  宋知微要留一个识字的，不只要跑得快的。你留下人，把原想带去前头的一双手交给伤药处。 # beat:xm_nine_mats_7 # scene:xm_hall # cast:xm_lu,xm_wugou # speaker:narrator
  -> stone_steps
* [暂用口信，自己先去宫前；请张无垢代追未到的换班。 # cid:xm_take_verbal]
  ~ xm_receipt = false
  可以。我代追这一趟，你回来要把人领认。 # beat:xm_nine_mats_8 # scene:xm_hall # cast:xm_lu,xm_wugou # speaker:xm_wugou # mood:xm_wugou=neutral
  你应下来。职责分开以后，欠下的事也有人记得向谁讨。 # beat:xm_nine_mats_9 # scene:xm_hall # cast:xm_lu,xm_wugou # speaker:narrator
  -> stone_steps

=== stone_steps ===
石苍亲到太和宫前。俞玄峰二十九招败，郑鹤年十九招败，胸口中掌吐血。轮到你，十七招，剑落。 # beat:xm_stone_steps_1 # scene:xm_steps # cast:xm_shi,xm_lu # speaker:narrator
第一招你其实已经输了，只是身体还不知道。石苍尚未返真，却已在门外极深处；极近不是多赢几招，是你收不回来的这一整步。 # beat:xm_stone_steps_2 # scene:xm_steps # cast:xm_shi,xm_lu # speaker:narrator
陆松年上前。近两百招，他右肩中掌，左臂受伤，越到后来越要想；石苍始终留着余地。 # beat:xm_stone_steps_3 # scene:xm_steps # cast:xm_shi,xm_lu # speaker:narrator
雨后的石阶湿着，石苍身后也有人。师父没有忽然比他更深，只将这些都放进了最后一次换手。 # beat:xm_stone_steps_4 # scene:xm_steps # cast:xm_shi,xm_lu # speaker:narrator
* [看师父怎样借湿地、石阶和石苍旧伤，记得这一战发生在什么地方。 # cid:xm_watch_feet]
  ~ xm_ground = true
  脚下只容这么宽。你早先只追着掌剑，如今才看见师父让出的那一线，并非平地上随时能再有。 # beat:xm_stone_steps_5 # scene:xm_steps # cast:xm_shi,xm_lu # speaker:narrator
  -> simultaneous
* [看石苍身后同伴的位置，承认两位高手也仍站在一群人中间。 # cid:xm_watch_company]
  ~ xm_ground = false
  师父换手时没只算眼前这一掌。你想喊侧路，喉头先痛起来，剑落后的这一刻仍得忍住不闯进去。 # beat:xm_stone_steps_6 # scene:xm_steps # cast:xm_shi,xm_lu # speaker:narrator
  -> simultaneous

=== simultaneous ===
剑先贴到石苍胸前半线；石苍的手指也到师父咽喉之前。两人同时停。 # beat:xm_simultaneous_1 # scene:xm_steps # cast:xm_shi,xm_lu # speaker:narrator
武当差的不是人多。 # beat:xm_simultaneous_2 # scene:xm_steps # cast:xm_shi,xm_lu # speaker:xm_shi # mood:xm_shi=neutral
差的是一个真正走进去的人。 # beat:xm_simultaneous_3 # scene:xm_steps # cast:xm_shi,xm_lu # speaker:xm_shi # mood:xm_shi=neutral
石苍退了。不是师父在平地死斗中胜过他，更不是此刻已有人返真。你去扶师父左臂，他先叫你轻些。 # beat:xm_simultaneous_4 # scene:xm_steps # cast:xm_shi,xm_lu # speaker:narrator
这边也伤了。 # beat:xm_simultaneous_5 # scene:xm_steps # cast:xm_shi,xm_lu # speaker:xm_lu # mood:xm_lu=neutral
你原只盯着右肩的掌印。下山的人已远，山上的伤还要一处处看。 # beat:xm_simultaneous_6 # scene:xm_steps # cast:xm_shi,xm_lu # speaker:narrator # fact:xm_stone_stop
{
- xm_handover:
西路接班的人带伤员回来，报的是你亲自领认过的名字。张无垢先让他们歇，才来问宫前怎样。 # beat:xm_simultaneous_7 # scene:xm_gate # cast:xm_wugou # speaker:narrator
- else:
你回来时，正门那两名弟子还在等人补接西路。张无垢把路再指一遍，叫你亲领新班走一趟；方才多走的脚程没有因危局已退便自行省掉。 # beat:xm_simultaneous_8 # scene:xm_gate # cast:xm_wugou # speaker:narrator
}
{
- xm_receipt:
伤药处回条了。你留的那个人，今夜还不能跟你走。 # beat:xm_simultaneous_9 # scene:xm_gate # cast:xm_wugou # speaker:xm_wugou # mood:xm_wugou=neutral
你本想叫他去取自己的剑，手抬一下，又放下。 # beat:xm_simultaneous_10 # scene:xm_gate # cast:xm_wugou # speaker:narrator
- else:
我替你追的口信，最后一处还没领认。 # beat:xm_simultaneous_11 # scene:xm_gate # cast:xm_wugou # speaker:xm_wugou # mood:xm_wugou=neutral
你答现在去。陆松年已经有人照应，欠下的这一趟不能再说都是为了宫前。 # beat:xm_simultaneous_12 # scene:xm_gate # cast:xm_wugou # speaker:narrator
}
* [去伤药处认回需要的人，把私事交给同伴，自己留下等最后一班。 # cid:xm_help_medicine]
  ~ xm_medicine = true
  药的分量由宋知微来定，你只管把领药的人和去处对上。天黑前，终于有人能坐下来吃一口。 # beat:xm_simultaneous_13 # scene:xm_gate # cast:xm_wugou # speaker:narrator
  -> three_years
* [去经阁查断路前搬出的谱，先问尚有谁知道缺页，不急着领功。 # cid:xm_help_books]
  ~ xm_medicine = false
  周伯阳把两份卷放开，叫你先别叠。一样的封面里，第二份多出三行，正是另一院还认得的手法。 # beat:xm_simultaneous_14 # scene:xm_gate # cast:xm_wugou # speaker:narrator
  -> three_years

=== three_years ===
太和之变后三年，陆松年正式提出玄门内议九席。仍是那九个人：你第一，俞玄峰第二，郑鹤年第三，赤脚第四，周伯阳第五，宋知微第六，葛玄同第七，岳归真第八，张无垢第九。 # beat:xm_three_years_1 # scene:xm_hall # cast:xm_lu,xm_wugou # speaker:narrator
若只论正面交手，张无垢排不到第九。可没人主张撤掉他，大家都记得第四日为什么还站得住。 # beat:xm_three_years_2 # scene:xm_hall # cast:xm_lu,xm_wugou # speaker:narrator
不为世榜所动。不以一场胜负换席。 # beat:xm_three_years_3 # scene:xm_hall # cast:xm_lu,xm_wugou # speaker:xm_lu # mood:xm_lu=neutral
九席不是九个人的荣耀，是九件不能没人做的事。 # beat:xm_three_years_4 # scene:xm_hall # cast:xm_lu,xm_wugou # speaker:xm_lu # mood:xm_lu=neutral
真改成最能打的九个，药还是得有人送。别说得像药自己会上山。 # beat:xm_three_years_5 # scene:xm_hall # cast:xm_lu,xm_wugou # speaker:xm_wugou # mood:xm_wugou=amused
你笑了一下，没将第九改称第九高手。掌门也不会因坐了那个位置，便自动成为全山第一。 # beat:xm_three_years_6 # scene:xm_hall # cast:xm_lu,xm_wugou # speaker:narrator # fact:xm_seat
{
- xm_medicine:
头几日你留在伤药处。药的分量是宋知微定的，你只管把人名和去处对上——这件事后来没人替你记，我替你记着。 # beat:xm_three_years_7 # scene:xm_hall # cast:xm_lu,xm_wugou # speaker:xm_wugou # mood:xm_wugou=amused
三年后再排九件事，谁管哪一件，仍按当时谁真的站在那里，不按谁的名字排在前面。 # beat:xm_three_years_8 # scene:xm_hall # cast:xm_lu,xm_wugou # speaker:narrator
- else:
你那天先去的是经阁。缺页那件事后来还有人问你；药那边，是宋知微自己撑到天黑的。 # beat:xm_three_years_9 # scene:xm_hall # cast:xm_lu,xm_wugou # speaker:xm_wugou # mood:xm_wugou=neutral
这个先后留了下来，没有人把它说成你当时已经算准了轻重。 # beat:xm_three_years_10 # scene:xm_hall # cast:xm_lu,xm_wugou # speaker:narrator
}
* [先把七院藏谱副本互通，找别院的人来认自己抄不明白的字。 # cid:xm_copy_methods]
  ~ xm_copy = true
  你在封面写好院名，翻开里面，又将那几个以为同义的字圈出来。副本一样多，不代表已抄对。 # beat:xm_three_years_11 # scene:xm_hall # cast:xm_lu,xm_wugou # speaker:narrator
  -> another_court
* [先领内院年轻人去别院住，要求他们回来讲那条路为什么能走。 # cid:xm_send_students]
  ~ xm_copy = false
  一个弟子问是否要改投别脉。你说先去住，别急着拿没学过的东西替人分高下。他把带来的那本小谱也带上了。 # beat:xm_three_years_12 # scene:xm_hall # cast:xm_lu,xm_wugou # speaker:narrator
  -> another_court

=== another_court ===
此后十余年，山里多了些不同的年轻人。孟玄策十九能问府榜宗师，三十余冲北榜失败，回山五年再出，胜过北榜末席。何青崖三十五以前不显，五十以后剑道骤深。 # beat:xm_another_court_1 # scene:xm_court # cast:xm_xuandu # speaker:narrator
你的弟子张玄度天资高，性子也狂。你骂他最多，打他也最多；他来挨骂时，脚步从不轻。 # beat:xm_another_court_2 # scene:xm_court # cast:xm_xuandu # speaker:narrator
别院的事我问完了。自己的剑，今日还练不练？ # beat:xm_another_court_3 # scene:xm_court # cast:xm_xuandu # speaker:xm_xuandu # mood:xm_xuandu=sharp
练。你别站那么远，省得我过去还得先喘口气。 # beat:xm_another_court_4 # scene:xm_court # cast:xm_xuandu # speaker:you
{
- xm_copy:
张玄度带来副本上改过的字。另一院老人不肯让一个含糊字流给后人，他才知道你那日请人来认，没请错。 # beat:xm_another_court_5 # scene:xm_court # cast:xm_xuandu # speaker:narrator
我原以为看字不用这么久。 # beat:xm_another_court_6 # scene:xm_court # cast:xm_xuandu # speaker:xm_xuandu # mood:xm_xuandu=neutral
- else:
张玄度讲另院起手，说到第三处忽然停下，回头又问了住过那里的弟子。你等他讲清，没有替他把停顿说成已全会了。 # beat:xm_another_court_7 # scene:xm_court # cast:xm_xuandu # speaker:narrator
我回去再问一遍。 # beat:xm_another_court_8 # scene:xm_court # cast:xm_xuandu # speaker:xm_xuandu # mood:xm_xuandu=neutral
}
{
- xm_ask:
孟玄策、何青崖进山，您先问他们在别处做什么，不问名次。这一条是从哪儿来的？ # beat:xm_another_court_9 # scene:xm_court # cast:xm_xuandu # speaker:xm_xuandu # mood:xm_xuandu=neutral
从泥地里来的。那日我先问那位老人是谁，才知道旧榜上的名字，不能替今日认人。 # beat:xm_another_court_10 # scene:xm_court # cast:xm_xuandu # speaker:you
要试手，仍先问本人愿不愿；这条规矩此后一直挂在排位置之前。 # beat:xm_another_court_11 # scene:xm_court # cast:xm_xuandu # speaker:narrator
- else:
有人拿一份旧总谱来问最前一列那个名字，您答不上来。我在旁边听着，也答不上。 # beat:xm_another_court_12 # scene:xm_court # cast:xm_xuandu # speaker:xm_xuandu # mood:xm_xuandu=uneasy
当年我只问了师父在汉水边怎么躺。 # beat:xm_another_court_13 # scene:xm_court # cast:xm_xuandu # speaker:you
孟玄策、何青崖进山时，山里便只能照着他们今日的手来判，纸上的名次帮不上忙。 # beat:xm_another_court_14 # scene:xm_court # cast:xm_xuandu # speaker:narrator
}
{
- xm_plain:
访客簿上那两行是您自己记的，一字没添。别院的老人都拿它教我们：败了就是败了，不替它找一个方便的说法。 # beat:xm_another_court_15 # scene:xm_court # cast:xm_xuandu # speaker:xm_xuandu # mood:xm_xuandu=neutral
有人问起那位无名老人，你把簿子递过去，没有另添一句话。 # beat:xm_another_court_16 # scene:xm_court # cast:xm_xuandu # speaker:narrator
- else:
访客簿上那一页您后来不翻了。我原以为您是不想再看见那一负。 # beat:xm_another_court_17 # scene:xm_court # cast:xm_xuandu # speaker:xm_xuandu # mood:xm_xuandu=neutral
十四前那个没落下的字，你也没把它说成年轻时不得不这么做。 # beat:xm_another_court_18 # scene:xm_court # cast:xm_xuandu # speaker:narrator
}
{
- xm_ground:
您教我们看那一掌，先叫站到石阶上。为什么先看地方，不先看招式？ # beat:xm_another_court_19 # scene:xm_court # cast:xm_xuandu # speaker:xm_xuandu # mood:xm_xuandu=neutral
因为我在平地上就想错了一回。 # beat:xm_another_court_20 # scene:xm_court # cast:xm_xuandu # speaker:you
湿地与退路只容那么宽，这一战发生在什么地方，比谁多了哪一招更要紧。 # beat:xm_another_court_21 # scene:xm_court # cast:xm_xuandu # speaker:narrator
- else:
您教我们看那一掌，先问对面身后还站着谁。这一句，您是从哪儿学来的？ # beat:xm_another_court_22 # scene:xm_court # cast:xm_xuandu # speaker:xm_xuandu # mood:xm_xuandu=neutral
从喉咙里。我当年先想喊侧路。 # beat:xm_another_court_23 # scene:xm_court # cast:xm_xuandu # speaker:you
两位高手也都站在一群人中间；这一条你没有替后来的门人省掉。 # beat:xm_another_court_24 # scene:xm_court # cast:xm_xuandu # speaker:narrator
}
* [让他把没问明白的带回去，今日少练一遍，不替徒弟抢着答完。 # cid:xm_let_him_ask]
  ~ xm_allow = true
  他真走了。院里一下安静，你抬手试刚才未完的一剑，仍须自己把它练到落脚。 # beat:xm_another_court_25 # scene:xm_court # cast:xm_xuandu # speaker:narrator
  -> seventy
* [先请他做给你看，再让他自己去问；你也承认有一处不知为何这样转。 # cid:xm_try_first]
  ~ xm_allow = false
  师父也有不知道的？ # beat:xm_another_court_26 # scene:xm_court # cast:xm_xuandu # speaker:xm_xuandu # mood:xm_xuandu=amused
  你若全知道，明日便别来问。 # beat:xm_another_court_27 # scene:xm_court # cast:xm_xuandu # speaker:you
  他笑完才肯重做，没有因你承认不知道便省了脚下那一步。 # beat:xm_another_court_28 # scene:xm_court # cast:xm_xuandu # speaker:narrator
  -> seventy

=== seventy ===
陆松年百余岁临终，还问九个人是否都在，那时第一代已少了两人。 # beat:xm_seventy_1 # scene:xm_lamp # cast:xm_lu # speaker:narrator
补。别只选最强的。 # beat:xm_seventy_2 # scene:xm_lamp # cast:xm_lu # speaker:xm_lu # mood:xm_lu=neutral
这句话留下，你的师父没有留下。七十岁，你已是天下最顶尖的入化人物之一；九十岁，比七十又深许多。收徒、送葬、扫阶、教剑，十年，又十年，那道门仍在前头。 # beat:xm_seventy_3 # scene:xm_lamp # cast:none # speaker:narrator
有一阵，你听见别人说迟早，心里便松一下。后来连那一下，也不愿再靠了。近，不等于一定能到。 # beat:xm_seventy_4 # scene:xm_lamp # cast:none # speaker:narrator
旧录也记着一件更早的事：张玄度六十八岁，认真看过紫霄许无尘的剑，回来告诉你，这个人会进去。许三十余平平，四十以后一年一个样。 # beat:xm_seventy_5 # scene:xm_court # cast:xm_xuandu # speaker:narrator # look:xm_xuandu=elder
他说这句话时，还没有后来那夜的拆手。你当日问他看见什么，他比了两下，没替许无尘定一个明年。 # beat:xm_seventy_6 # scene:xm_court # cast:xm_xuandu # speaker:narrator
张玄度七十余以后，他自己先有了你也没有的东西。夜里拆手，你故意留一个用了几十年的小局。他既不进，也不避，只站在那里。 # beat:xm_seventy_7 # scene:xm_court # cast:xm_xuandu # speaker:narrator
你用来收下一步的所有位置，忽然失去意义。 # beat:xm_seventy_8 # scene:xm_court # cast:xm_xuandu # speaker:narrator
什么时候进去的？ # beat:xm_seventy_9 # scene:xm_court # cast:xm_xuandu # speaker:you
不知道。 # beat:xm_seventy_10 # scene:xm_court # cast:xm_xuandu # speaker:xm_xuandu # mood:xm_xuandu=neutral
那一晚，你先是嫉妒。你练了一百多年没有跨过，徒弟先过去了。张玄度看着你收手，没立刻再来请教。 # beat:xm_seventy_11 # scene:xm_court # cast:xm_xuandu # speaker:narrator # fact:xm_first
* [在自己的手录写下嫉妒，不将那一夜涂成从未有过的欢喜。 # cid:xm_write_envy]
  ~ xm_envy = true
  写罢，你把笔搁开。徒弟已走进去了，纸上少一个难看的字，也不会叫你跟着进去。 # beat:xm_seventy_12 # scene:xm_court # cast:xm_xuandu # speaker:narrator
  -> good_morning
* [先收好拆手的灯，等明早再去见他，不逼自己当夜说一句好听的。 # cid:xm_leave_lamp]
  ~ xm_envy = false
  灯芯剪了，院中便暗下去。你没叫他回来多拆一遍，证明自己其实只是没看清。 # beat:xm_seventy_13 # scene:xm_court # cast:xm_xuandu # speaker:narrator
  -> good_morning

=== good_morning ===
第二日醒来，你先去找徒弟。他以为还要问昨夜。 # beat:xm_good_morning_1 # scene:xm_court # cast:xm_xuandu # speaker:narrator
太好了。 # beat:xm_good_morning_2 # scene:xm_court # cast:xm_xuandu # speaker:you
这三个字比昨夜那几下轻得多。你说出口，才知道这回不需要他再使一次。武当终于有返真了。 # beat:xm_good_morning_3 # scene:xm_court # cast:xm_xuandu # speaker:narrator
五年后，一位退隐旧总谱前列登山，七十余招自行收手，问张玄度进去几年。山外才真正认得这道门已开。 # beat:xm_good_morning_4 # scene:xm_court # cast:xm_xuandu # speaker:narrator
{
- xm_allow:
张玄度又来问一件别院旧事，你叫他去问当时教的人。他没有因自己已返真，就说再也用不着跑那一趟。 # beat:xm_good_morning_5 # scene:xm_court # cast:xm_xuandu # speaker:narrator
- else:
你又请张玄度试那一处转身。他做完，仍留着你说不知道的地方，等你自己的下一句。你们没有从此便无话可问。 # beat:xm_good_morning_6 # scene:xm_court # cast:xm_xuandu # speaker:narrator
}
* [九席有空时，先问还有哪件事没人接，再问候选人会不会做。 # cid:xm_ask_successor]
  ~ xm_job = true
  有人先报一位胜绩极盛的人。你没说他不能坐，只请再说他肯留多久，能教谁接下去。对方只得回去再问。 # beat:xm_good_morning_7 # scene:xm_court # cast:xm_xuandu # speaker:narrator
  -> empty_seat
* [先去问已退下的人哪处最容易断，把他们知道的失手也留下。 # cid:xm_ask_oldest]
  ~ xm_job = false
  退下的老人讲得很慢，还在意后人会不会只记自己那一错。你先把他改过的那一步复述清，他才肯继续。 # beat:xm_good_morning_8 # scene:xm_court # cast:xm_xuandu # speaker:narrator
  -> empty_seat

=== empty_seat ===
你一百岁以后少下山，一百二十以后几乎不问门务。第一代九席死去、退下，第二代、第三代坐上来。张无垢也到了九十余，山里大事仍有人来问他。 # beat:xm_empty_seat_1 # scene:xm_lamp # cast:xm_wugou # speaker:narrator # look:xm_wugou=elder
当年说我排不到第九的人，如今也不在这里同我争了。 # beat:xm_empty_seat_2 # scene:xm_lamp # cast:xm_wugou # speaker:xm_wugou # mood:xm_wugou=amused
你们现在能强，就是因为当年那九个人没死绝。 # beat:xm_empty_seat_3 # scene:xm_lamp # cast:xm_wugou # speaker:you
又一个年轻人问能否改成七席、十二席。你先看他是不是真来问一件事。 # beat:xm_empty_seat_4 # scene:xm_lamp # cast:xm_wugou # speaker:narrator
祖制是拿来养祖宗的，还是拿来养活人的？ # beat:xm_empty_seat_5 # scene:xm_lamp # cast:xm_wugou # speaker:you
他又问九席最重要是哪席。你说空的那一席。有人死、退、不够；有人更强，却不适合坐。宁可空着，也不能乱放一个进去。 # beat:xm_empty_seat_6 # scene:xm_lamp # cast:xm_wugou # speaker:narrator # fact:xm_empty
许无尘在那次张玄度看剑十七年后返真，张玄度仍在。武当第一次同时有两位；以后还有周玄照，还有不掌门、不入世榜或早已退席的人。 # beat:xm_empty_seat_7 # scene:xm_lamp # cast:none # speaker:narrator
山里有两个人，不是把两张名帖叠起来便成。副本有人认，别院有人住，空下的差事有人再问，留下的东西才没有只随一个人去。 # beat:xm_empty_seat_8 # scene:xm_lamp # cast:none # speaker:narrator
后来百余年，只要当代最高人物肯入总谱，武当前五几乎未缺。张玄度曾进前三，许无尘入前五，周玄照一代又有旧谱第二；退谱、闭关、禁榜仍会留下纸面空白。 # beat:xm_empty_seat_9 # scene:xm_lamp # cast:none # speaker:narrator
这些是传承后来证成的事，并非你在泥地里便全看见的未来。你手录的字，已越来越抖。 # beat:xm_empty_seat_10 # scene:xm_lamp # cast:none # speaker:narrator
{
- xm_envy:
那一页手录您没另抄，也没在整理旧录时抽掉。张玄度返真那夜的嫉妒，和第二天那三个字，落在同一叠纸上。 # beat:xm_empty_seat_11 # scene:xm_lamp # cast:xm_wugou # speaker:xm_wugou # mood:xm_wugou=uneasy
你答他：难看的东西也归他自己，不必先擦干净才留给后人。 # beat:xm_empty_seat_12 # scene:xm_lamp # cast:xm_wugou # speaker:narrator
- else:
拆手那夜您先收了灯，第二天去找徒弟。整理手录时，还是把那一夜的嫉妒补记下来了。 # beat:xm_empty_seat_13 # scene:xm_lamp # cast:xm_wugou # speaker:xm_wugou # mood:xm_wugou=neutral
你翻到后补的那行，旁边记着写下的日子。它不是当夜落笔，也没有把嫉妒改成只是没看清。 # beat:xm_empty_seat_14 # scene:xm_lamp # cast:xm_wugou # speaker:narrator
}
{
- xm_job:
有个空席空了两年。来问的人先报三位胜绩极盛的名字，您先问的是同一句：这件事今日谁在接。 # beat:xm_empty_seat_15 # scene:xm_lamp # cast:xm_wugou # speaker:xm_wugou # mood:xm_wugou=neutral
对方答不出，只得回去再问一次。 # beat:xm_empty_seat_16 # scene:xm_lamp # cast:xm_wugou # speaker:narrator
- else:
有个空席空了两年，您先去问退下的老人哪一处最容易断，把他们的失手也留下。报上来的名字便少一个。 # beat:xm_empty_seat_17 # scene:xm_lamp # cast:xm_wugou # speaker:xm_wugou # mood:xm_wugou=calm
宁可空着，也不是先找一个名字坐进去。 # beat:xm_empty_seat_18 # scene:xm_lamp # cast:xm_wugou # speaker:narrator
}
* [把旧录里各处如何接手留给后来人读，允许他们按今日重新分工。 # cid:xm_leave_duties]
  ~ xm_after = 1
  年轻人来问一处旧调度，你先问今日路断在哪里。他去画现在的路，没把三十一岁张无垢那一笔照抄成永远不改。 # beat:xm_empty_seat_19 # scene:xm_lamp # cast:xm_wugou # speaker:narrator
  -> last_day
* [请后来人留一页空处，记尚未接妥的差事，不急着写满九个名字。 # cid:xm_leave_blank]
  ~ xm_after = 2
  有人嫌空页不好看。你说先留着。他隔日带来需要补问的两件事，没有为了整齐先选一个人坐进去。 # beat:xm_empty_seat_20 # scene:xm_lamp # cast:xm_wugou # speaker:narrator
  -> last_day

=== last_day ===
一百四十一岁最后一日，张玄度坐在床边，问你还有什么要交代。 # beat:xm_last_day_1 # scene:xm_lamp # cast:xm_xuandu # speaker:narrator
九席…… # beat:xm_last_day_2 # scene:xm_lamp # cast:xm_xuandu # speaker:you
停了许久，你改口。 # beat:xm_last_day_3 # scene:xm_lamp # cast:xm_xuandu # speaker:narrator
算了。你们自己看着办。 # beat:xm_last_day_4 # scene:xm_lamp # cast:xm_xuandu # speaker:you
这是你最后一句完整的话。此后不再由你看见、不再由你替他们作决定。 # beat:xm_last_day_5 # scene:xm_lamp # cast:xm_xuandu # speaker:narrator
{
- xm_after == 1:
后来翻旧录的门人，将一页旧分工放在今日新图旁边。他没照旧路搬药，先去问新接班的人是否真到了；页上仍留着张无垢那个并非第九高手的名字。 # beat:xm_last_day_6 # scene:xm_archive # cast:none # speaker:narrator # ending:xm_handover_after
-> END
- else:
后来翻旧录的门人，在空页上写下一件尚无人肯接的差事，带去问内议。那天九席没有为了坐满便多一个人，次日却终于有人去认那条一直没人领的路。 # beat:xm_last_day_7 # scene:xm_archive # cast:none # speaker:narrator # ending:xm_blank_after
-> END
}
