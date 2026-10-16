VAR kh_gentle = false
VAR kh_supply = false
VAR kh_peer_ready = false
VAR kh_clear_report = false
VAR kh_detour = false
VAR kh_named_patient = false
VAR kh_handover = false
VAR kh_repair_fear = false
VAR kh_hidden = false
VAR kh_second_ready = false
VAR kh_saw_space = false
VAR kh_beds = false
VAR kh_restraint = false
VAR kh_old_path = false
VAR kh_record_honest = false
VAR kh_litter = false
VAR kh_saved_runner = false
VAR kh_final_truth = false
VAR kh_late_duty = 0
VAR kh_future = 0
-> cloth

=== cloth ===
布结才解开，凉州来的老杂役又把手缩进袖里。你端着半盆温水，没敢再拉。 # beat:kh_cloth_1 # scene:kh_shelter # cast:kh_healer # speaker:narrator
先问。他不动，你这盆水也不是非得全浇下去。 # beat:kh_cloth_2 # scene:kh_shelter # cast:kh_healer # speaker:kh_healer # mood:kh_healer=neutral
疼在里头，还是怕我再碰？ # beat:kh_cloth_3 # scene:kh_shelter # cast:kh_healer # speaker:you
老杂役把袖口挽起一点。隔屋的少年忽然叫了一声，门边几个人全停了手。 # beat:kh_cloth_4 # scene:kh_shelter # cast:kh_healer # speaker:narrator
商队留下的那个。半年了，今日才肯说整句。 # beat:kh_cloth_5 # scene:kh_shelter # cast:kh_healer # speaker:kh_healer # mood:kh_healer=neutral
少年只重复五个字：他只是路过。你端着水走到门外，他把被子蒙过了头。 # beat:kh_cloth_6 # scene:kh_shelter # cast:kh_healer # speaker:narrator
* [把水放在门外，请屋里的人先陪着他，不再追问。 # cid:kh_let_sleep]
  ~ kh_gentle = true
  水在门边。今日先别问他路上还有谁。 # beat:kh_cloth_7 # scene:kh_shelter # cast:kh_healer # speaker:you
  你得记住，他不说，不是欠你一句明白话。 # beat:kh_cloth_8 # scene:kh_shelter # cast:kh_healer # speaker:kh_healer # mood:kh_healer=calm
  你没有拿到完整口供。老杂役却肯把袖口全挽起来，让你看伤。 # beat:kh_cloth_9 # scene:kh_shelter # cast:kh_healer # speaker:narrator
  -> message
* [先问来时的路，听见他喘不过气就停下来。 # cid:kh_ask_route]
  ~ kh_gentle = false
  走的是哪条路？要是想不起来，就先不说。 # beat:kh_cloth_10 # scene:kh_shelter # cast:kh_healer # speaker:you
  少年连“西边”也没说完，气已乱了。你退到门外，药师把门轻轻掩上。 # beat:kh_cloth_11 # scene:kh_shelter # cast:kh_healer # speaker:narrator
  不是问得轻，便一定是他受得住。把这一句也记下。 # beat:kh_cloth_12 # scene:kh_shelter # cast:kh_healer # speaker:kh_healer # mood:kh_healer=sharp
  -> message

=== message ===
凉州那个门派立过六十余年，七十三人，死了六十八。你照着送来的名册点药包，五个活着的，都是杂役和孩子。 # beat:kh_message_1 # scene:kh_shelter # cast:kh_healer # speaker:narrator
墙上那两个字，别抄在他们每个人名下。 # beat:kh_message_2 # scene:kh_shelter # cast:kh_healer # speaker:kh_healer # mood:kh_healer=neutral
太弱。 # beat:kh_message_3 # scene:kh_shelter # cast:kh_healer # speaker:you
字是杀人的人留的。伤者叫什么，不由他来定。 # beat:kh_message_4 # scene:kh_shelter # cast:kh_healer # speaker:kh_healer # mood:kh_healer=neutral
你把那两个字移到另一页。药和消息都要往外送，袋里只能先装一种。 # beat:kh_message_5 # scene:kh_shelter # cast:kh_healer # speaker:narrator
* [先送药，托同行者把未核实的消息另交门房。 # cid:kh_send_medicine]
  ~ kh_supply = true
  药先走。消息我写清哪些亲见，哪些只是传来。 # beat:kh_message_6 # scene:kh_shelter # cast:kh_healer # speaker:you
  两件事不必抢同一张嘴。交到谁手里，回来报名字。 # beat:kh_message_7 # scene:kh_shelter # cast:kh_healer # speaker:kh_healer # mood:kh_healer=intent
  你第一次送出的信末尾，不是一个惊人的传闻，是收件人的姓名。 # beat:kh_message_8 # scene:kh_shelter # cast:kh_healer # speaker:narrator
  -> years
* [先递伤亡名册，药包请药师当面另派人送。 # cid:kh_send_record]
  ~ kh_supply = false
  我去报人名。药包少一个人搬，我现在请，不留到门口。 # beat:kh_message_9 # scene:kh_shelter # cast:kh_healer # speaker:you
  那你就站这里等他来。别一说另派人，自己便走了。 # beat:kh_message_10 # scene:kh_shelter # cast:kh_healer # speaker:kh_healer # mood:kh_healer=intent
  你等到另一位门人接过药，才把名册塞进干布。没有人因为分了两路，就少负一件事。 # beat:kh_message_11 # scene:kh_shelter # cast:kh_healer # speaker:narrator
  -> years

=== years ===
数年过去，来往的名册越来越厚。七门被毁，十余门元气大伤。你已能替人包扎，却没有学会把每次新来的伤者看成旧数字。 # beat:kh_years_1 # scene:kh_camp # cast:kh_peer,kh_healer # speaker:narrator
如今帖子来自三家：少林慧明、太极司马元正、八卦孟天枢。你随救护的人到嵩岳以西，谷外营火一盏盏亮着。 # beat:kh_years_2 # scene:kh_camp # cast:kh_peer,kh_healer # speaker:narrator
他们召的是各门最强的人，不是叫咱们去凑十二个。 # beat:kh_years_3 # scene:kh_camp # cast:kh_peer,kh_healer # speaker:kh_peer # mood:kh_peer=neutral
咱们抬人。 # beat:kh_years_4 # scene:kh_camp # cast:kh_peer,kh_healer # speaker:you
这三个字倒短。我想过了，若刀还在走，我可能迈不动腿。 # beat:kh_years_5 # scene:kh_camp # cast:kh_peer,kh_healer # speaker:kh_peer # mood:kh_peer=uneasy
同门把担架绳反复绕上手腕，已经勒出一道白印。药师伸手抽掉了最后一圈。 # beat:kh_years_6 # scene:kh_camp # cast:kh_peer,kh_healer # speaker:narrator
* [说自己也怕，约定听到彼此名字才抬，不叫空口号。 # cid:kh_admit_fear]
  ~ kh_peer_ready = true
  我也没抬过这样的伤者。喊我名字，我回你，再抬。你没应，我先不拖你进谷。 # beat:kh_years_7 # scene:kh_camp # cast:kh_peer,kh_healer # speaker:you
  那我叫一声，你真得回。 # beat:kh_years_8 # scene:kh_camp # cast:kh_peer,kh_healer # speaker:kh_peer # mood:kh_peer=intent
  在。 # beat:kh_years_9 # scene:kh_camp # cast:kh_peer,kh_healer # speaker:you
  他还没有胆大起来，手上的死结却解开了。 # beat:kh_years_10 # scene:kh_camp # cast:kh_peer,kh_healer # speaker:narrator
  -> three_posts
* [要他先撑住，话出口后才发现自己也说不出怎样撑。 # cid:kh_push_courage]
  ~ kh_peer_ready = false
  几家都来了，总不能到咱们这里先缩。 # beat:kh_years_11 # scene:kh_camp # cast:kh_peer,kh_healer # speaker:you
  我知道。我问的是，真迈不动时怎么办？ # beat:kh_years_12 # scene:kh_camp # cast:kh_peer,kh_healer # speaker:kh_peer # mood:kh_peer=uneasy
  你一时答不出。药师把担架放到你们脚边，让两个人先抬一只装水的桶。 # beat:kh_years_13 # scene:kh_camp # cast:kh_peer,kh_healer # speaker:narrator
  桶也不知道你们是哪一门的。先别洒。 # beat:kh_years_14 # scene:kh_camp # cast:kh_peer,kh_healer # speaker:kh_healer # mood:kh_healer=sharp
  -> three_posts

=== three_posts ===
帐中三家各带了自己的药与绳。一包止血散换了两个叫法，递药的人都以为对方还缺一样。 # beat:kh_three_posts_1 # scene:kh_camp # cast:kh_hui,kh_sima,kh_meng # speaker:narrator
先分伤处，后分药名。我的人认不出你们袋上的字，别让他猜。 # beat:kh_three_posts_2 # scene:kh_camp # cast:kh_hui,kh_sima,kh_meng # speaker:kh_meng # mood:kh_meng=neutral
撤回来的路也得认。两头都等着对方让，抬的还是同一个人。 # beat:kh_three_posts_3 # scene:kh_camp # cast:kh_hui,kh_sima,kh_meng # speaker:kh_sima # mood:kh_sima=neutral
诸位不是来替少林作证。药不够，也照实说。 # beat:kh_three_posts_4 # scene:kh_camp # cast:kh_hui,kh_sima,kh_meng # speaker:kh_hui # mood:kh_hui=neutral
你捧着两张药单站在中间，先前以为三家同帖，连行囊也该装得一样。 # beat:kh_three_posts_5 # scene:kh_camp # cast:kh_hui,kh_sima,kh_meng # speaker:narrator
你刚才在门口听见争执了？有话就报。 # beat:kh_three_posts_6 # scene:kh_camp # cast:kh_hui,kh_sima,kh_meng # speaker:kh_meng # mood:kh_meng=intent
* [照实报出缺布与两种叫法，请三家一起对一遍。 # cid:kh_report_short]
  ~ kh_clear_report = true
  不是缺两样，是同一样写了两名。布却真的不够，东帐只剩三卷。 # beat:kh_three_posts_7 # scene:kh_camp # cast:kh_hui,kh_sima,kh_meng # speaker:you
  那就先搬我的。记借三卷，不记谁失了体面。 # beat:kh_three_posts_8 # scene:kh_camp # cast:kh_hui,kh_sima,kh_meng # speaker:kh_sima # mood:kh_sima=calm
  三卷以后不必还新布。救过人的也算用对。 # beat:kh_three_posts_9 # scene:kh_camp # cast:kh_hui,kh_sima,kh_meng # speaker:kh_hui # mood:kh_hui=neutral
  孟天枢把另一张药单转向你，等你逐一指明。 # beat:kh_three_posts_10 # scene:kh_camp # cast:kh_hui,kh_sima,kh_meng # speaker:narrator
  -> road
* [先说都能接上，回帐后才去解释布为何对不上。 # cid:kh_hide_short]
  ~ kh_clear_report = false
  两边都在备。我回去再核。 # beat:kh_three_posts_11 # scene:kh_camp # cast:kh_hui,kh_sima,kh_meng # speaker:you
  这不是问你备没备。抬来一个人，你也说回去再核？ # beat:kh_three_posts_12 # scene:kh_camp # cast:kh_hui,kh_sima,kh_meng # speaker:kh_meng # mood:kh_meng=sharp
  你只得从头报出东帐三卷的数。三家重新调布，谷口出发因此迟了一趟。 # beat:kh_three_posts_13 # scene:kh_camp # cast:kh_hui,kh_sima,kh_meng # speaker:narrator
  迟了就记迟。别再写一切如常。 # beat:kh_three_posts_14 # scene:kh_camp # cast:kh_hui,kh_sima,kh_meng # speaker:kh_sima # mood:kh_sima=neutral
  -> road

=== road ===
去谷口的路在两块大石间收窄。空担架侧着能过，装上水桶，另一头立刻卡住。 # beat:kh_road_1 # scene:kh_path # cast:kh_peer,kh_healer # speaker:narrator
伤者不会替咱们把肩缩窄。 # beat:kh_road_2 # scene:kh_path # cast:kh_peer,kh_healer # speaker:kh_peer # mood:kh_peer=neutral
天黑前只够再走一遍。你想先记石缝，还是把担架多绑一层？ # beat:kh_road_3 # scene:kh_path # cast:kh_peer,kh_healer # speaker:kh_healer # mood:kh_healer=intent
只绑稳，不见得能过去。 # beat:kh_road_4 # scene:kh_path # cast:kh_peer,kh_healer # speaker:you
只走熟，也不见得抬得住。先做一件，剩的说清。 # beat:kh_road_5 # scene:kh_path # cast:kh_peer,kh_healer # speaker:kh_healer # mood:kh_healer=neutral
* [走外侧土坡，找出能平抬担架的绕路。 # cid:kh_walk_detour]
  ~ kh_detour = true
  你沿土坡走过，拔出两根扎脚的枯枝，在转弯处压下一块白布。 # beat:kh_road_6 # scene:kh_path # cast:kh_peer,kh_healer # speaker:narrator
  我记住白布。天黑了也不拿谷里那条近路当唯一的路。 # beat:kh_road_7 # scene:kh_path # cast:kh_peer,kh_healer # speaker:kh_peer # mood:kh_peer=intent
  回营时，备用肩带还没缝好。你把这件没做完的事报给药师。 # beat:kh_road_8 # scene:kh_path # cast:kh_peer,kh_healer # speaker:narrator
  -> first_array
* [留下缝宽肩带，至少先让两个人能分担伤者的重量。 # cid:kh_make_strap]
  ~ kh_detour = false
  药师教你把针从旧孔穿回去。宽带勒得没那么深，却不能把石缝缝宽。 # beat:kh_road_9 # scene:kh_path # cast:kh_peer,kh_healer # speaker:narrator
  到石缝叫我。咱们不能抬到跟前，才发现都没看路。 # beat:kh_road_10 # scene:kh_path # cast:kh_peer,kh_healer # speaker:kh_peer # mood:kh_peer=intent
  你把这句记在担架角上，没写已经查过外坡。 # beat:kh_road_11 # scene:kh_path # cast:kh_peer,kh_healer # speaker:narrator
  -> first_array

=== first_array ===
第一日，十二位宗师入谷。你以为能听见兵器碰很久，药师才铺开第一块布，已有两个人在谷口喊担架。 # beat:kh_first_array_1 # scene:kh_valley # cast:kh_peer # speaker:narrator
这么快？ # beat:kh_first_array_2 # scene:kh_valley # cast:kh_peer # speaker:kh_peer # mood:kh_peer=uneasy
四人重伤，两人死，其余退回。你抬进帐的那位一直问后面的人走没走，你没看见，不能答都走了。 # beat:kh_first_array_3 # scene:kh_valley # cast:kh_peer # speaker:narrator
我在这头，先抬您过石口。 # beat:kh_first_array_4 # scene:kh_valley # cast:kh_peer # speaker:you
伤者忽然挣起来，左手还在找已不见的剑。谁也喊不住他，担架另一端压到了地。 # beat:kh_first_array_5 # scene:kh_valley # cast:kh_peer # speaker:narrator
* [先请同行人喊他的名字，不抢着抓住那只找剑的手。 # cid:kh_name_patient]
  ~ kh_named_patient = true
  哪位认得他？叫他一声，我把剑袋放在他能看见的地方。 # beat:kh_first_array_6 # scene:kh_valley # cast:kh_peer # speaker:you
  一位同门蹲下喊了两次，伤者才看清自己不在刀前。你托住担架，等他松开扶木。 # beat:kh_first_array_7 # scene:kh_valley # cast:kh_peer # speaker:narrator
  他看见了。现在抬。 # beat:kh_first_array_8 # scene:kh_valley # cast:kh_peer # speaker:kh_peer # mood:kh_peer=intent
  -> first_return
* [先按住担架避免倾翻，肩带被他挣断一端。 # cid:kh_hold_patient]
  ~ kh_named_patient = false
  你撑住担架，伤者猛地一挣，旧绳开裂。木梁没翻，压下来的重量却把你右腕折了一下。 # beat:kh_first_array_9 # scene:kh_valley # cast:kh_peer # speaker:narrator
  别让这头落地！ # beat:kh_first_array_10 # scene:kh_valley # cast:kh_peer # speaker:you
  药师接住上肩的布，伤者终于被同门叫住。你右腕还能动，拧布时却慢了。 # beat:kh_first_array_11 # scene:kh_valley # cast:kh_peer # speaker:narrator
  -> first_return

=== first_return ===
回营换布时，你才知道最先抬来的两个人里，有一个已没有呼吸。活着的那个要认自己的剑袋，手一直探到空处。 # beat:kh_first_return_1 # scene:kh_path # cast:kh_peer,kh_healer # speaker:narrator
让他摸到袋口。别为了擦得干净，便把他认得的东西全拿走。 # beat:kh_first_return_2 # scene:kh_path # cast:kh_peer,kh_healer # speaker:kh_healer # mood:kh_healer=neutral
我刚才差点把它扔了，嫌碍事。 # beat:kh_first_return_3 # scene:kh_path # cast:kh_peer,kh_healer # speaker:kh_peer # mood:kh_peer=neutral
药师没有说无妨，把袋子交回他手里。里头的剑不是你们继续入谷的凭据。 # beat:kh_first_return_4 # scene:kh_path # cast:kh_peer,kh_healer # speaker:narrator
* [记下伤者的门派与剑袋所在，留一人专门交接。 # cid:kh_mark_return]
  ~ kh_handover = true
  人和剑袋写同一条。下一架回来，我先报清去哪个帐。 # beat:kh_first_return_5 # scene:kh_path # cast:kh_peer,kh_healer # speaker:you
  我来认袋子。手上有血也先不擦名字。 # beat:kh_first_return_6 # scene:kh_path # cast:kh_peer,kh_healer # speaker:kh_peer # mood:kh_peer=neutral
  他在布角写下两个字，又问了一次会不会写错。 # beat:kh_first_return_7 # scene:kh_path # cast:kh_peer,kh_healer # speaker:narrator
  -> six_array
* [先腾出空担架，姓名交接稍后再补。 # cid:kh_more_stretchers]
  ~ kh_handover = false
  架子先走，再来的不能等我们写。 # beat:kh_first_return_8 # scene:kh_path # cast:kh_peer,kh_healer # speaker:you
  可以，回来便补。若不认得人，别拿衣色替姓名。 # beat:kh_first_return_9 # scene:kh_path # cast:kh_peer,kh_healer # speaker:kh_healer # mood:kh_healer=neutral
  担架提早回了谷口。再回营时，多了一位找不到自己同门的伤者，你陪他认了三顶帐。 # beat:kh_first_return_10 # scene:kh_path # cast:kh_peer,kh_healer # speaker:narrator
  -> six_array

=== six_array ===
第二阵六人同时上，都是总谱或退谱旧人。极窄的黑刀终于出鞘，刀口没有响亮地撞开六件兵器。 # beat:kh_six_array_1 # scene:kh_valley # cast:kh_peer # speaker:narrator
一柄剑向左去，左边已有刀；一掌要近身，肩先露出来。你在谷口看不清全部手路，只看见原来留给退者的空地渐渐缩掉。 # beat:kh_six_array_2 # scene:kh_valley # cast:kh_peer # speaker:narrator
该往哪边退？ # beat:kh_six_array_3 # scene:kh_valley # cast:kh_peer # speaker:kh_peer # mood:kh_peer=uneasy
我不知道。他们还在动，咱们不能把担架伸进去。 # beat:kh_six_array_4 # scene:kh_valley # cast:kh_peer # speaker:you
两位重伤者被外头的接应拖到石后。一个还在回头，另一个的脚已经沾不到地。 # beat:kh_six_array_5 # scene:kh_valley # cast:kh_peer # speaker:narrator
* [喊出同门名字，确认他应声以后，一起接担架。 # cid:kh_call_names]
  ~ kh_repair_fear = true
  听见没有？我在你右手。你应一声。 # beat:kh_six_array_6 # scene:kh_valley # cast:kh_peer # speaker:you
  在。别一下提，我还没把肩穿进去。 # beat:kh_six_array_7 # scene:kh_valley # cast:kh_peer # speaker:kh_peer # mood:kh_peer=intent
  你等到他把宽带过肩，才接住两位前辈递来的人。 # beat:kh_six_array_8 # scene:kh_valley # cast:kh_peer # speaker:narrator
  -> six_return
* [怕误了这一刻，先一个人伸手去接，再叫同门补上。 # cid:kh_take_alone]
  ~ kh_repair_fear = false
  你先伸手，伤者的重量猛压到肩上。另一头还没接稳，右腕先被木梁向下扭。 # beat:kh_six_array_9 # scene:kh_valley # cast:kh_peer # speaker:narrator
  帮我一下！ # beat:kh_six_array_10 # scene:kh_valley # cast:kh_peer # speaker:you
  同门赶来，药师隔着石头喊你放低一寸。你不是把他一个人抬回来的。 # beat:kh_six_array_11 # scene:kh_valley # cast:kh_peer # speaker:narrator
  -> six_return

=== six_return ===
第二阵一人战死，三人重伤，两人靠外面接应退下。黑刀人的臂上只多了一道剑痕。 # beat:kh_six_return_1 # scene:kh_path # cast:kh_peer,kh_healer # speaker:narrator
担架来到石缝，前端进了，后端进不来。伤者呼吸极浅，不能把他折着搬。 # beat:kh_six_return_2 # scene:kh_path # cast:kh_peer,kh_healer # speaker:narrator
{
- kh_handover:
他姓魏，去西帐，剑袋也在。我交过一回。 # beat:kh_six_return_3 # scene:kh_path # cast:kh_peer,kh_healer # speaker:kh_peer # mood:kh_peer=intent
石后的人已经让开西帐那条路，不用再抬着伤者逐帐问。 # beat:kh_six_return_4 # scene:kh_path # cast:kh_peer,kh_healer # speaker:narrator
- else:
这位该送哪一帐？ # beat:kh_six_return_5 # scene:kh_path # cast:kh_peer,kh_healer # speaker:kh_peer # mood:kh_peer=uneasy
先叫药师。我去问，别让他在石口等。 # beat:kh_six_return_6 # scene:kh_path # cast:kh_peer,kh_healer # speaker:you
你拿着未填的布条再跑一趟，回来才补上伤者和袋子的去处。 # beat:kh_six_return_7 # scene:kh_path # cast:kh_peer,kh_healer # speaker:narrator
}
{
- kh_detour:
外坡，白布那条。转弯先把头抬平。 # beat:kh_six_return_8 # scene:kh_path # cast:kh_peer,kh_healer # speaker:you
我认得。 # beat:kh_six_return_9 # scene:kh_path # cast:kh_peer,kh_healer # speaker:kh_peer # mood:kh_peer=intent
你们绕过石缝，没有再把担架立起。走得长些，伤者的脊背仍平贴着木梁。 # beat:kh_six_return_10 # scene:kh_path # cast:kh_peer,kh_healer # speaker:narrator
- else:
这里过不去。先落稳，我去石外看。 # beat:kh_six_return_11 # scene:kh_path # cast:kh_peer,kh_healer # speaker:you
肩带还能撑。你看好再喊，别又一个人提。 # beat:kh_six_return_12 # scene:kh_path # cast:kh_peer,kh_healer # speaker:kh_peer # mood:kh_peer=uneasy
你绕石时滑倒，右腕撑上碎石。担架最后还是过了外坡，止血的布却迟了一段才按上伤口。 # beat:kh_six_return_13 # scene:kh_path # cast:kh_peer,kh_healer # speaker:narrator
}
* [把右腕给药师看，请她重新分工。 # cid:kh_show_wrist]
  ~ kh_hidden = false
  拧布疼。别再把需要用力的那头留给我。 # beat:kh_six_return_14 # scene:kh_path # cast:kh_peer,kh_healer # speaker:you
  现在说，还来得及换。你坐着认人，左手拿笔。 # beat:kh_six_return_15 # scene:kh_path # cast:kh_peer,kh_healer # speaker:kh_healer # mood:kh_healer=intent
  她给你留了能写字的小凳，没有把你没抬住的那一下说成没有发生。 # beat:kh_six_return_16 # scene:kh_path # cast:kh_peer,kh_healer # speaker:narrator
  -> night_camp
* [把袖口放下，先说还抬得动。 # cid:kh_hide_wrist]
  ~ kh_hidden = true
  还能用。我先不占药。 # beat:kh_six_return_17 # scene:kh_path # cast:kh_peer,kh_healer # speaker:you
  药不是按谁先说硬话发的。 # beat:kh_six_return_18 # scene:kh_path # cast:kh_peer,kh_healer # speaker:kh_healer # mood:kh_healer=sharp
  你仍把袖口放下。下一次提水时，同门看见盆沿一直向右倾，替你接了过去。 # beat:kh_six_return_19 # scene:kh_path # cast:kh_peer,kh_healer # speaker:narrator
  -> night_camp

=== night_camp ===
夜里不再派人入谷。有人把空位越排越紧，以为这样能少看见两张空担架。 # beat:kh_night_camp_1 # scene:kh_camp # cast:kh_peer,kh_healer # speaker:narrator
明日只让三位掌门去。咱们还要去谷口？ # beat:kh_night_camp_2 # scene:kh_camp # cast:kh_peer,kh_healer # speaker:kh_peer # mood:kh_peer=neutral
去接人，不去补第四位。 # beat:kh_night_camp_3 # scene:kh_camp # cast:kh_peer,kh_healer # speaker:kh_healer # mood:kh_healer=neutral
我晓得。可我一说怕，便觉得自己比别人少了一样。 # beat:kh_night_camp_4 # scene:kh_camp # cast:kh_peer,kh_healer # speaker:kh_peer # mood:kh_peer=uneasy
你们面前的桶还是昨夜那只，桶底多了一道被石头磨出的白痕。 # beat:kh_night_camp_5 # scene:kh_camp # cast:kh_peer,kh_healer # speaker:narrator
{
- kh_peer_ready or kh_repair_fear:
白天你回了我。担架过石口，是两个人抬的。 # beat:kh_night_camp_6 # scene:kh_camp # cast:kh_peer,kh_healer # speaker:you
那明日还叫名字。别忽然换一句诸位奋勇，我不知道那是在喊谁。 # beat:kh_night_camp_7 # scene:kh_camp # cast:kh_peer,kh_healer # speaker:kh_peer # mood:kh_peer=intent
- else:
白天我伸手太快。你没应，我便动了，不全是你迈不动腿。 # beat:kh_night_camp_8 # scene:kh_camp # cast:kh_peer,kh_healer # speaker:you
我明日还能去。但到了刀前，我不能先答应你一定敢。 # beat:kh_night_camp_9 # scene:kh_camp # cast:kh_peer,kh_healer # speaker:kh_peer # mood:kh_peer=uneasy
你把他能守的位置画在帐外，不再拿一句一定抹掉它。 # beat:kh_night_camp_10 # scene:kh_camp # cast:kh_peer,kh_healer # speaker:narrator
}
* [约好同门守石后，我在转弯处，每次只递一架。 # cid:kh_plan_second]
  ~ kh_second_ready = true
  你不进谷，守石后。我在转弯处，喊你再接。不是一股脑冲上去。 # beat:kh_night_camp_11 # scene:kh_camp # cast:kh_peer,kh_healer # speaker:you
  这处我守。若要换地方，先来找我。 # beat:kh_night_camp_12 # scene:kh_camp # cast:kh_peer,kh_healer # speaker:kh_peer # mood:kh_peer=intent
  你把两点之间的脚印重新踩深，没有替他许下一条看不见底的命。 # beat:kh_night_camp_13 # scene:kh_camp # cast:kh_peer,kh_healer # speaker:narrator
  -> masters
* [允许他留营，请药师另派接应，自己承担交班时间。 # cid:kh_leave_choice]
  ~ kh_second_ready = false
  你留营。我要另找一人，今夜就找，不拿你到了明日才说不行作罪名。 # beat:kh_night_camp_14 # scene:kh_camp # cast:kh_peer,kh_healer # speaker:you
  去。新来的人得走一遍路，别只交给他一张纸。 # beat:kh_night_camp_15 # scene:kh_camp # cast:kh_peer,kh_healer # speaker:kh_healer # mood:kh_healer=calm
  你带替班者走到石后。回营时同门还醒着，替你把晾的湿布翻了一面。 # beat:kh_night_camp_16 # scene:kh_camp # cast:kh_peer,kh_healer # speaker:narrator
  -> masters

=== masters ===
第二日正午，慧明、孟天枢、司马元正入谷，无人随行。你在远处候接，能听见谷壁把几句高声送回来。 # beat:kh_masters_1 # scene:kh_valley # cast:kh_hui,kh_meng,kh_sima # speaker:narrator
终于像一点样子。 # beat:kh_masters_2 # scene:kh_valley # cast:kh_wusheng,kh_hui,kh_meng # speaker:kh_wusheng # mood:kh_wusheng=neutral
施主杀得够多了。 # beat:kh_masters_3 # scene:kh_valley # cast:kh_wusheng,kh_hui,kh_meng # speaker:kh_hui # mood:kh_hui=neutral
你来劝我？ # beat:kh_masters_4 # scene:kh_valley # cast:kh_wusheng,kh_hui,kh_meng # speaker:kh_wusheng # mood:kh_wusheng=neutral
不是。来止你。 # beat:kh_masters_5 # scene:kh_valley # cast:kh_wusheng,kh_hui,kh_meng # speaker:kh_hui # mood:kh_hui=intent
黑刀先找慧明。两掌不夹刀，只让刀在掌间偏过半寸，孟天枢从侧面进，司马元正站到退路上。 # beat:kh_masters_6 # scene:kh_valley # cast:kh_wusheng,kh_hui,kh_meng # speaker:narrator
* [看三人怎样互留位置，不照着远处的手势跟练。 # cid:kh_watch_place]
  ~ kh_saw_space = true
  他没有抢那一下。他站过去，那条退路才少了。 # beat:kh_masters_7 # scene:kh_valley # cast:kh_wusheng,kh_hui,kh_meng # speaker:you
  我看见了脚，没看见掌。等会儿你别替我记成三样全懂。 # beat:kh_masters_8 # scene:kh_valley # cast:kh_peer,kh_wusheng,kh_hui # speaker:kh_peer # mood:kh_peer=intent
  你在纸上画了三个点，没有画一条自己解释不了的刀路。 # beat:kh_masters_9 # scene:kh_valley # cast:kh_peer,kh_wusheng,kh_hui # speaker:narrator
  -> sixty
* [先看慧明怎样接刀，承认太远看不清掌内变化。 # cid:kh_watch_hands]
  ~ kh_saw_space = false
  刀没有被夹住，我只能看见它偏开。 # beat:kh_masters_10 # scene:kh_valley # cast:kh_peer,kh_wusheng,kh_hui # speaker:you
  我刚才以为夹住了。 # beat:kh_masters_11 # scene:kh_valley # cast:kh_peer,kh_wusheng,kh_hui # speaker:kh_peer # mood:kh_peer=neutral
  你在那句后面添了一个问号。纸上留着疑问，谷中也没有人等你看懂才走下一手。 # beat:kh_masters_12 # scene:kh_valley # cast:kh_peer,kh_wusheng,kh_hui # speaker:narrator
  -> sixty

=== sixty ===
二十招，无生客退；四十招，刀被压住；第五十三招，孟天枢掌缘擦裂他后衣，却没有伤到肉。谷外有人已把半卷干布收起来，觉得或许用不到。 # beat:kh_sixty_1 # scene:kh_valley # cast:kh_hui,kh_meng,kh_sima # speaker:narrator
第六十招，黑刀忽然舍了侧面两人，全压向慧明。慧明开始退，另两人每次都能碰到无生客，却断不了那条刀势。 # beat:kh_sixty_2 # scene:kh_valley # cast:kh_hui,kh_meng,kh_sima # speaker:narrator
布别收。 # beat:kh_sixty_3 # scene:kh_valley # cast:kh_hui,kh_meng,kh_sima # speaker:you
第一百零七招慧明胸前见血，第一百二十三招司马元正掌中右肋，黑刀人退三步，嘴角有血，却笑着说快了。 # beat:kh_sixty_4 # scene:kh_valley # cast:kh_hui,kh_meng,kh_sima # speaker:narrator
他说谁快了？ # beat:kh_sixty_5 # scene:kh_valley # cast:kh_peer,kh_hui,kh_meng # speaker:kh_peer # mood:kh_peer=uneasy
我听见了，不知道。 # beat:kh_sixty_6 # scene:kh_valley # cast:kh_peer,kh_hui,kh_meng # speaker:you
再往后，孟天枢的判断渐渐慢了一点。不是你看出他哪里能改，是三个人原来合上的空处，一次比一次难合。 # beat:kh_sixty_7 # scene:kh_valley # cast:kh_peer,kh_hui,kh_meng # speaker:narrator
* [把已收起的布重新铺好，给三位各留一处，不先喊赢。 # cid:kh_hold_beds]
  ~ kh_beds = true
  三处都留着。药师，水还在原来位置。 # beat:kh_sixty_8 # scene:kh_valley # cast:kh_peer,kh_hui,kh_meng # speaker:you
  我听见。你把来路清开，别叫担架找空位。 # beat:kh_sixty_9 # scene:kh_valley # cast:kh_healer,kh_peer,kh_hui # speaker:kh_healer # mood:kh_healer=intent
  有人嫌你晦气，药师叫他把脚边的药箱挪到帐里。 # beat:kh_sixty_10 # scene:kh_valley # cast:kh_healer,kh_peer,kh_hui # speaker:narrator
  -> split
* [先应了旁人的快赢了，见局势转变后重新腾床。 # cid:kh_answer_hope]
  ~ kh_beds = false
  若能接住这一掌…… # beat:kh_sixty_11 # scene:kh_valley # cast:kh_healer,kh_peer,kh_hui # speaker:you
  你话还没完，谷中三人的站位已变。药师把收起的布塞回来，让你先腾出三张床。 # beat:kh_sixty_12 # scene:kh_valley # cast:kh_healer,kh_peer,kh_hui # speaker:narrator
  盼好事可以，别拿床去押。 # beat:kh_sixty_13 # scene:kh_valley # cast:kh_healer,kh_peer,kh_hui # speaker:kh_healer # mood:kh_healer=sharp
  你搬药箱时没有再往谷里看，错过的几手也不补写。 # beat:kh_sixty_14 # scene:kh_valley # cast:kh_healer,kh_peer,kh_hui # speaker:narrator
  -> split

=== split ===
第一百八十六招，孟天枢左肩中刀，退出六码。黑刀立即转向司马元正，连变七手仍后退，慧明强行出掌替他解围。 # beat:kh_split_1 # scene:kh_valley # cast:kh_meng,kh_sima,kh_hui # speaker:narrator
刀背正面接掌，黑刀弯了一瞬，没有断。二百余招，原先的优势已彻底翻过来。 # beat:kh_split_2 # scene:kh_valley # cast:kh_meng,kh_sima,kh_hui # speaker:narrator
他们还没败。 # beat:kh_split_3 # scene:kh_valley # cast:kh_peer,kh_meng,kh_sima # speaker:kh_peer # mood:kh_peer=uneasy
可是制不住。 # beat:kh_split_4 # scene:kh_valley # cast:kh_peer,kh_meng,kh_sima # speaker:you
二百四十余招，双方停下。慧明右袖尽血，孟天枢半身染红，司马元正右手轻颤。无生客也负了伤，持刀的手仍稳。 # beat:kh_split_5 # scene:kh_valley # cast:kh_peer,kh_meng,kh_sima # speaker:narrator
你们就是三家最强？ # beat:kh_split_6 # scene:kh_valley # cast:kh_wusheng,kh_peer,kh_meng # speaker:kh_wusheng # mood:kh_wusheng=neutral
三位没有答。黑刀人又问一遍，听见的还是沉默。 # beat:kh_split_7 # scene:kh_valley # cast:kh_wusheng,kh_peer,kh_meng # speaker:narrator
果然还有。 # beat:kh_split_8 # scene:kh_valley # cast:kh_wusheng,kh_peer,kh_meng # speaker:kh_wusheng # mood:kh_wusheng=neutral
* [问接应长者是否还有旧人，但不把猜测传作救兵已到。 # cid:kh_ask_old]
  ~ kh_restraint = true
  门后还有人，是不是？ # beat:kh_split_9 # scene:kh_valley # cast:kh_wusheng,kh_peer,kh_meng # speaker:you
  有些人，连我也没见过。你不能替他们先答今日一定能来。 # beat:kh_split_10 # scene:kh_valley # cast:kh_healer,kh_wusheng,kh_peer # speaker:kh_healer # mood:kh_healer=neutral
  你没有向后排喊救兵来了。三张床仍留着。 # beat:kh_split_11 # scene:kh_valley # cast:kh_healer,kh_wusheng,kh_peer # speaker:narrator
  -> bell
* [喊了一声还有救，随即收住，没有再替三门保证。 # cid:kh_say_loud]
  ~ kh_restraint = false
  既然还有人…… # beat:kh_split_12 # scene:kh_valley # cast:kh_healer,kh_wusheng,kh_peer # speaker:you
  是还有人，还是你想有？ # beat:kh_split_13 # scene:kh_valley # cast:kh_healer,kh_wusheng,kh_peer # speaker:kh_peer # mood:kh_peer=uneasy
  你停下来，把没出口的保证咽回去。掌门的沉默，不能由你擅自补成一个胜局。 # beat:kh_split_14 # scene:kh_valley # cast:kh_healer,kh_wusheng,kh_peer # speaker:narrator
  -> bell

=== bell ===
东面忽然响钟。少林来的人低了头，药师把你正要提起的药袋按回桌面。 # beat:kh_bell_1 # scene:kh_path # cast:kh_healer # speaker:narrator
不是开场。等路让出来。 # beat:kh_bell_2 # scene:kh_path # cast:kh_healer # speaker:kh_healer # mood:kh_healer=neutral
半个时辰后，一个瘦老僧赤足入谷，旧僧衣洗得发白，没人为他唱名。慧明退到一旁行礼。 # beat:kh_bell_3 # scene:kh_path # cast:kh_healer # speaker:narrator
师叔。 # beat:kh_bell_4 # scene:kh_valley # cast:kh_hui,kh_kong # speaker:kh_hui # mood:kh_hui=neutral # action:钟后 · 来路空着
站旁边。伤先按住。 # beat:kh_bell_5 # scene:kh_valley # cast:kh_hui,kh_kong # speaker:kh_kong # mood:kh_kong=neutral
这一声比方才的胜负都轻。你只见过慧明站在最前面，第一次见他退开。 # beat:kh_bell_6 # scene:kh_valley # cast:kh_hui,kh_kong # speaker:narrator
灰袍老人随后拄普通竹杖来，白发被风贴在脸旁。司马元正垂手，让出了道。 # beat:kh_bell_7 # scene:kh_valley # cast:kh_hui,kh_kong # speaker:narrator
师伯。 # beat:kh_bell_8 # scene:kh_valley # cast:kh_sima,kh_xuan # speaker:kh_sima # mood:kh_sima=neutral
手在抖，便别藏袖里。 # beat:kh_bell_9 # scene:kh_valley # cast:kh_sima,kh_xuan # speaker:kh_xuan # mood:kh_xuan=neutral
最后一位矮老人微驼，由年轻弟子扶着。孟天枢亲自迎过去，扶另一边。 # beat:kh_bell_10 # scene:kh_valley # cast:kh_sima,kh_xuan # speaker:narrator
你这边有伤。 # beat:kh_bell_11 # scene:kh_valley # cast:kh_meng,kh_gui # speaker:kh_gui # mood:kh_gui=neutral
还有这只手。 # beat:kh_bell_12 # scene:kh_valley # cast:kh_meng,kh_gui # speaker:kh_meng # mood:kh_meng=neutral
谷里许多人不认得他们。身旁最老的几位却站起来，叫出空劫、司马玄极、孟归藏三个名字。 # beat:kh_bell_13 # scene:kh_valley # cast:kh_meng,kh_gui # speaker:narrator
* [先让围观的人退开，留下三位来时的通路。 # cid:kh_clear_path]
  ~ kh_old_path = true
  看得见也别围。让来路空着。 # beat:kh_bell_14 # scene:kh_valley # cast:kh_meng,kh_gui # speaker:you
  你今日说的这句，待会儿也要做。 # beat:kh_bell_15 # scene:kh_valley # cast:kh_healer,kh_meng,kh_gui # speaker:kh_healer # mood:kh_healer=intent
  你沿谷口走回一遍，把自己放在石后，没跟着老人往里挪。 # beat:kh_bell_16 # scene:kh_valley # cast:kh_healer,kh_meng,kh_gui # speaker:narrator
  -> kong_trial
* [先问药师他们是什么席位，听见一句不是席位。 # cid:kh_ask_title]
  ~ kh_old_path = false
  他们现在列哪一席？ # beat:kh_bell_17 # scene:kh_valley # cast:kh_healer,kh_meng,kh_gui # speaker:you
  我给空劫备药的时候，你还没出生。他退首座四十多年了。 # beat:kh_bell_18 # scene:kh_valley # cast:kh_healer,kh_meng,kh_gui # speaker:kh_healer # mood:kh_healer=sharp
  你把写席位的那一栏留空，才发现身后的人已围近。让开通路又费了些工夫。 # beat:kh_bell_19 # scene:kh_valley # cast:kh_healer,kh_meng,kh_gui # speaker:narrator
  -> kong_trial

=== kong_trial ===
你比刚才那个和尚强？ # beat:kh_kong_trial_1 # scene:kh_valley # cast:kh_kong,kh_wusheng # speaker:kh_wusheng # mood:kh_wusheng=neutral
一点。 # beat:kh_kong_trial_2 # scene:kh_valley # cast:kh_kong,kh_wusheng # speaker:kh_kong # mood:kh_kong=neutral
慧明在远处苦笑。第一手，黑刀已到旧僧衣胸前，落下时却不是原来能伤人的位置。 # beat:kh_kong_trial_3 # scene:kh_valley # cast:kh_kong,kh_wusheng # speaker:narrator
你没有看懂怎么让开的，只见空劫的掌到肩前，无生客第一次没有硬进，退了一步。 # beat:kh_kong_trial_4 # scene:kh_valley # cast:kh_kong,kh_wusheng # speaker:narrator
十招、二十招、三十招。谷口没人敢再说这回稳赢。第四十一招掌落刀脊，石地裂出细纹，空劫也退一步。 # beat:kh_kong_trial_5 # scene:kh_valley # cast:kh_kong,kh_wusheng # speaker:narrator
那一下，谁占了先？ # beat:kh_kong_trial_6 # scene:kh_valley # cast:kh_peer,kh_kong,kh_wusheng # speaker:kh_peer # mood:kh_peer=uneasy
我只看见两个人都退了。 # beat:kh_kong_trial_7 # scene:kh_valley # cast:kh_peer,kh_kong,kh_wusheng # speaker:you
五十余招后，老僧慢慢落下风。第八十二招胸口一道长痕，空劫退开，向另两人说了一句。 # beat:kh_kong_trial_8 # scene:kh_valley # cast:kh_peer,kh_kong,kh_wusheng # speaker:narrator # action:第八十二招 · 胸前见伤
一起。 # beat:kh_kong_trial_9 # scene:kh_valley # cast:kh_kong,kh_xuan,kh_gui # speaker:kh_kong # mood:kh_kong=neutral
* [写下第八十二招与这一句，不替他说故意让招。 # cid:kh_record_limit]
  ~ kh_record_honest = true
  退了，胸口见伤。叫两位一同来。 # beat:kh_kong_trial_10 # scene:kh_valley # cast:kh_kong,kh_xuan,kh_gui # speaker:you
  就写这些？ # beat:kh_kong_trial_11 # scene:kh_valley # cast:kh_peer,kh_kong,kh_xuan # speaker:kh_peer # mood:kh_peer=neutral
  这些是我看见的。为什么每一步这样走，留给真能解释的人。 # beat:kh_kong_trial_12 # scene:kh_valley # cast:kh_peer,kh_kong,kh_xuan # speaker:you
  -> three_old
* [先把看招的纸交给同门，去确认接应的人能否听见退后。 # cid:kh_ask_breath]
  ~ kh_record_honest = false
  纸先替我拿。若里头叫退，石后能不能听清？ # beat:kh_kong_trial_13 # scene:kh_valley # cast:kh_peer,kh_kong,kh_xuan # speaker:you
  你叫一遍。 # beat:kh_kong_trial_14 # scene:kh_valley # cast:kh_peer,kh_kong,kh_xuan # speaker:kh_peer # mood:kh_peer=intent
  你们隔着石头试了两次，不再把听不见也算大家心里有数。 # beat:kh_kong_trial_15 # scene:kh_valley # cast:kh_peer,kh_kong,kh_xuan # speaker:narrator
  -> three_old

=== three_old ===
空劫在正面，孟归藏不断走侧，司马玄极站得最远，有时十余招不动，一动却让黑刀必须收回。 # beat:kh_three_old_1 # scene:kh_valley # cast:kh_kong,kh_xuan,kh_gui # speaker:narrator
这才对。 # beat:kh_three_old_2 # scene:kh_valley # cast:kh_wusheng,kh_kong,kh_xuan # speaker:kh_wusheng # mood:kh_wusheng=neutral
这回无生客不能只追一个人。空劫不求掌掌伤他，先把刀留住；侧面的人才有地方进去。 # beat:kh_three_old_3 # scene:kh_valley # cast:kh_wusheng,kh_kong,kh_xuan # speaker:narrator
第一百二十招，孟归藏掌擦后背，无生客踉跄两步，只得横刀接空劫。黑刀崩开一个细缺，反手让老僧右肩见血。 # beat:kh_three_old_4 # scene:kh_valley # cast:kh_wusheng,kh_kong,kh_xuan # speaker:narrator
第一百五十招，孟归藏腹侧中刀，退九步，几乎跪下。司马玄极的竹杖折了，他弃杖，空手向里走。 # beat:kh_three_old_5 # scene:kh_valley # cast:kh_wusheng,kh_kong,kh_xuan # speaker:narrator
老人要退出来？ # beat:kh_three_old_6 # scene:kh_valley # cast:kh_peer,kh_wusheng,kh_kong # speaker:kh_peer # mood:kh_peer=uneasy
先空着路。别把要，写成已经。 # beat:kh_three_old_7 # scene:kh_valley # cast:kh_peer,kh_wusheng,kh_kong # speaker:you
* [把接重伤者的担架放低，取出剪衣用的小刀，刀口朝自己收着。 # cid:kh_prepare_litter]
  ~ kh_litter = true
  你把担架的高边放平，小刀只为剪开血黏住的衣服。药师先替你收住刀口，才叫你蹲下。 # beat:kh_three_old_8 # scene:kh_valley # cast:kh_peer,kh_wusheng,kh_kong # speaker:narrator
  等人送到石后。你进去，老人还得替你留路。 # beat:kh_three_old_9 # scene:kh_valley # cast:kh_healer,kh_peer,kh_wusheng # speaker:kh_healer # mood:kh_healer=intent
  你松开往前迈的那只脚。 # beat:kh_three_old_10 # scene:kh_valley # cast:kh_healer,kh_peer,kh_wusheng # speaker:narrator
  -> lock
* [提出先往里接，听清禁令后把担架留在石后。 # cid:kh_offer_run]
  ~ kh_litter = false
  他伤那么重，我能不能先去—— # beat:kh_three_old_11 # scene:kh_valley # cast:kh_healer,kh_peer,kh_wusheng # speaker:you
  不能。你进去，他们得先救你。 # beat:kh_three_old_12 # scene:kh_valley # cast:kh_healer,kh_peer,kh_wusheng # speaker:kh_healer # mood:kh_healer=sharp
  她让你把话说完，再指给你看刀势经过的空地。那里不是一步能穿过的路。 # beat:kh_three_old_13 # scene:kh_valley # cast:kh_healer,kh_peer,kh_wusheng # speaker:narrator
  我守石后。有人送出来，我接。 # beat:kh_three_old_14 # scene:kh_valley # cast:kh_healer,kh_peer,kh_wusheng # speaker:you
  -> lock

=== lock ===
第二百一十三招，黑刀全转向伤最重的孟归藏。老人没有退，迎上去。 # beat:kh_lock_1 # scene:kh_valley # cast:kh_gui,kh_kong,kh_xuan # speaker:narrator
黑刀穿进左腹，孟归藏双手合住，抱住无生客右臂。你看不懂先前千百种变化，却看见这一回他把能退的地方全舍掉了。 # beat:kh_lock_2 # scene:kh_valley # cast:kh_gui,kh_kong,kh_xuan # speaker:narrator
现在！ # beat:kh_lock_3 # scene:kh_valley # cast:kh_gui,kh_kong,kh_xuan # speaker:kh_gui # mood:kh_gui=intent # action:以身锁刀
空劫一掌到胸，司马玄极两指点向后颈。无生客抽刀，孟归藏的手被割开，仍没松。 # beat:kh_lock_4 # scene:kh_valley # cast:kh_gui,kh_kong,kh_xuan # speaker:narrator
直到那两下都到，孟归藏才倒下。谷外有人刚吐出一口气，黑刀人又站了起来。 # beat:kh_lock_5 # scene:kh_valley # cast:kh_kong,kh_xuan # speaker:narrator
退后。 # beat:kh_lock_6 # scene:kh_valley # cast:kh_kong,kh_xuan # speaker:kh_kong # mood:kh_kong=intent # action:退后
这一句向着谷外，不是向同伴。先前接应的年轻弟子伏在外沿，另一条岔口的记录袋被乱石压住。两处隔着石脊，走过去再绕回，退路就会被刀势截断。 # beat:kh_lock_7 # scene:kh_valley # cast:kh_kong,kh_xuan # speaker:narrator
* [不去拣记录袋，先把外沿弟子拖到石后，绝不再往刀里冲。 # cid:kh_save_runner]
  ~ kh_saved_runner = true
  先接人。袋子别去拣！ # beat:kh_lock_8 # scene:kh_valley # cast:kh_kong,kh_xuan # speaker:you
  你伏低拖他的衣背，肩上的布向石后绷紧。他还有气，腿却在地上擦出一道血。 # beat:kh_lock_9 # scene:kh_valley # cast:kh_kong,kh_xuan # speaker:narrator
  到这里。再退一步。 # beat:kh_lock_10 # scene:kh_valley # cast:kh_healer,kh_kong,kh_xuan # speaker:kh_healer # mood:kh_healer=intent
  压在另一侧的纸袋留在原处。你没有第二双手。 # beat:kh_lock_11 # scene:kh_valley # cast:kh_healer,kh_kong,kh_xuan # speaker:narrator
  -> retreat
* [去另一条岔口收记录袋，同时喊人接外沿弟子。 # cid:kh_save_pages]
  ~ kh_saved_runner = false
  人还在外沿！谁能接他？ # beat:kh_lock_12 # scene:kh_valley # cast:kh_healer,kh_kong,kh_xuan # speaker:you
  你在石隙扯出袋角，转身时接应的人已退了。药师把你按到石后，外沿再没有能伸手的空处。 # beat:kh_lock_13 # scene:kh_valley # cast:kh_healer,kh_kong,kh_xuan # speaker:narrator
  退！ # beat:kh_lock_14 # scene:kh_valley # cast:kh_healer,kh_kong,kh_xuan # speaker:kh_healer # mood:kh_healer=sharp
  你仍喊那个人，没听见回应。袋里的纸没有湿，这一件事也没有救出他。 # beat:kh_lock_15 # scene:kh_valley # cast:kh_healer,kh_kong,kh_xuan # speaker:narrator
  -> retreat

=== retreat ===
此后几十招，你无法从石后完整看清。黑刀几次落地又回手，你没有资格把每一次掌影都写成某一招。 # beat:kh_retreat_1 # scene:kh_path # cast:kh_peer,kh_healer # speaker:narrator
等声响停下来，人们传回最后几句话：无生客问还有更强的么，无人答，他说中原不错，然后倒下。 # beat:kh_retreat_2 # scene:kh_path # cast:kh_peer,kh_healer # speaker:narrator
空劫前辈呢？ # beat:kh_retreat_3 # scene:kh_path # cast:kh_peer,kh_healer # speaker:kh_peer # mood:kh_peer=uneasy
也没有了。 # beat:kh_retreat_4 # scene:kh_path # cast:kh_peer,kh_healer # speaker:kh_healer # mood:kh_healer=neutral
药师把本来为老僧备的那碗水放回桌上，杯口仍是温的。你想拿另一只杯，又停住。 # beat:kh_retreat_5 # scene:kh_path # cast:kh_peer,kh_healer # speaker:narrator
{
- kh_saved_runner:
外沿弟子被安置在布上。 # beat:kh_retreat_6 # scene:kh_path # cast:kh_peer,kh_healer # speaker:narrator
- else:
外沿弟子的担架随后抬回来，布盖过了脸。你收好的那袋纸搁在另一边，不能铺到他身上说两件事一样重。 # beat:kh_retreat_7 # scene:kh_path # cast:kh_peer,kh_healer # speaker:narrator
}
{
- kh_saved_runner and (kh_second_ready or kh_peer_ready):
腿还在流血。我按这边，你剪衣。 # beat:kh_retreat_8 # scene:kh_path # cast:kh_peer,kh_healer # speaker:kh_peer # mood:kh_peer=intent
同门这回叫了你的名字，手没有再从布上离开。你们等药师回来，弟子能跟着她的声音睁眼。 # beat:kh_retreat_9 # scene:kh_path # cast:kh_peer,kh_healer # speaker:narrator
- else:
伤者这头给我。你们退到水边，报清还有谁没回来。 # beat:kh_retreat_10 # scene:kh_path # cast:kh_peer,kh_healer # speaker:kh_healer # mood:kh_healer=neutral
你没有再争自己也能做，先把三张床上的姓名报给她。 # beat:kh_retreat_11 # scene:kh_path # cast:kh_peer,kh_healer # speaker:narrator
}
* [把没看清、没接住的地方都留在记录里，请亲见者逐一核。 # cid:kh_admit_gap]
  ~ kh_final_truth = true
  最后这几十招我没看清。袋子在哪儿捡，人在哪儿接，都照实写。 # beat:kh_retreat_12 # scene:kh_path # cast:kh_peer,kh_healer # speaker:you
  问到人再补。问不到，也不要拿一句大胜替他们补上。 # beat:kh_retreat_13 # scene:kh_path # cast:kh_peer,kh_healer # speaker:kh_healer # mood:kh_healer=calm
  同门把你的笔递回。空白比你以为的重，纸却仍能拿得起来。 # beat:kh_retreat_14 # scene:kh_path # cast:kh_peer,kh_healer # speaker:narrator
  -> aftercare
* [先不写战法，只把死人、重伤者和通知去处逐一交清。 # cid:kh_first_names]
  ~ kh_final_truth = false
  招式先不写。我先认这些姓名，哪封信交给谁。 # beat:kh_retreat_15 # scene:kh_path # cast:kh_peer,kh_healer # speaker:you
  别把同姓就当一家，也别自己替家里决定哪句该瞒。 # beat:kh_retreat_16 # scene:kh_path # cast:kh_peer,kh_healer # speaker:kh_healer # mood:kh_healer=calm
  你一封封念，同门核对名册，没有把空劫写在还等回报的那列。 # beat:kh_retreat_17 # scene:kh_path # cast:kh_peer,kh_healer # speaker:narrator
  -> aftercare

=== aftercare ===
三位掌门仍活着。空劫死，无生客死；孟归藏昏迷，司马玄极左臂重伤。药师每日看伤处，不肯把谁未醒写成必定能醒。 # beat:kh_aftercare_1 # scene:kh_camp # cast:kh_healer,kh_peer # speaker:narrator
你这只腕也该拆布看看了。 # beat:kh_aftercare_2 # scene:kh_camp # cast:kh_healer,kh_peer # speaker:kh_healer # mood:kh_healer=neutral
她把你袖口掀起，同门蹲下，先把药盆放到你左手。 # beat:kh_aftercare_3 # scene:kh_camp # cast:kh_healer,kh_peer # speaker:narrator
{
- not kh_named_patient or not kh_detour or not kh_repair_fear:
这一月别提重物，写一阵就停。要替别人做事，先说你哪只手还疼。 # beat:kh_aftercare_4 # scene:kh_camp # cast:kh_healer,kh_peer # speaker:kh_healer # mood:kh_healer=sharp
你右腕一用力便紧，担架要换人，记录也得分段写。受过的伤没有因为活着回来就算清了。 # beat:kh_aftercare_5 # scene:kh_camp # cast:kh_healer,kh_peer # speaker:narrator
- else:
皮擦破了，没伤到筋。你可接着写，抬人还是要另找一头。 # beat:kh_aftercare_6 # scene:kh_camp # cast:kh_healer,kh_peer # speaker:kh_healer # mood:kh_healer=calm
你试着握笔，右腕没有被一阵锐痛拉住，才把方才没写完的姓名补齐。 # beat:kh_aftercare_7 # scene:kh_camp # cast:kh_healer,kh_peer # speaker:narrator
}
{
- kh_hidden:
你说还能用，我当真了。后面每次递东西都先递右边。 # beat:kh_aftercare_8 # scene:kh_camp # cast:kh_healer,kh_peer # speaker:kh_peer # mood:kh_peer=neutral
往后疼就说，不让你替我猜。 # beat:kh_aftercare_9 # scene:kh_camp # cast:kh_healer,kh_peer # speaker:you
他把“右腕忌重”写在你那只药袋上，字很大，没有替你藏。 # beat:kh_aftercare_10 # scene:kh_camp # cast:kh_healer,kh_peer # speaker:narrator
- else:
那时你说拧布疼，我才知道能换你下来。别等下一回全提不动才讲。 # beat:kh_aftercare_11 # scene:kh_camp # cast:kh_healer,kh_peer # speaker:kh_peer # mood:kh_peer=neutral
知道。我也会先问你。 # beat:kh_aftercare_12 # scene:kh_camp # cast:kh_healer,kh_peer # speaker:you
他把药袋放到左边，没再让你先伸疼的那只手。 # beat:kh_aftercare_13 # scene:kh_camp # cast:kh_healer,kh_peer # speaker:narrator
}
* [等亲见的前辈核对交手部分，自己负责伤员与撤路记录。 # cid:kh_write_known]
  ~ kh_late_duty = 1
  我写这条路。谁从哪里回来，谁没有，我亲自走过。 # beat:kh_aftercare_14 # scene:kh_camp # cast:kh_healer,kh_peer # speaker:you
  那就画上石口。后来的人不能只读见胜负，抬架还卡在同一个地方。 # beat:kh_aftercare_15 # scene:kh_camp # cast:kh_healer,kh_peer # speaker:kh_healer # mood:kh_healer=intent
  你展开纸，第一次把自己没懂的交手留给别人，把自己懂的路认真画完。 # beat:kh_aftercare_16 # scene:kh_camp # cast:kh_healer,kh_peer # speaker:narrator
  -> seventh
* [把未完的记录交给有手力的人代写，自己留下做伤者日常照护。 # cid:kh_keep_beds]
  ~ kh_late_duty = 2
  纸给他。我留下认药和时辰，伤好了再补我的那份。 # beat:kh_aftercare_17 # scene:kh_camp # cast:kh_healer,kh_peer # speaker:you
  别只留一个好心。夜里哪一更换水，你先认。 # beat:kh_aftercare_18 # scene:kh_camp # cast:kh_healer,kh_peer # speaker:kh_healer # mood:kh_healer=intent
  你在帐边挂好小牌，写清自己的时辰，没把留下当作一句不必继续做的承诺。 # beat:kh_aftercare_19 # scene:kh_camp # cast:kh_healer,kh_peer # speaker:narrator
  -> seventh

=== seventh ===
第七日，孟归藏醒了。消息传到营外，有人欢呼，药师先叫人别围到床边。 # beat:kh_seventh_1 # scene:kh_ward # cast:kh_healer # speaker:narrator
醒了，还要活下去。今天这一步，别替他走到一百步外。 # beat:kh_seventh_2 # scene:kh_ward # cast:kh_healer # speaker:kh_healer # mood:kh_healer=neutral
司马玄极的伤也稳下来。左臂尚不能抬，衣袖要旁人替他理。你只送药，没有拿“以后一定如常”当贺词。 # beat:kh_seventh_3 # scene:kh_ward # cast:kh_healer # speaker:narrator
{
- kh_saved_runner:
你拖出的弟子这日能饮半碗粥。他问纸袋后来拣到没有。 # beat:kh_seventh_4 # scene:kh_ward # cast:kh_healer # speaker:narrator
散了几页。剩下的正在核。 # beat:kh_seventh_5 # scene:kh_ward # cast:kh_healer # speaker:you
他没有说自己的命比纸更值，只把碗放稳，说等能走了，自己去认那条路。 # beat:kh_seventh_6 # scene:kh_ward # cast:kh_healer # speaker:narrator
- else:
你带回的纸袋终于打开。有一行字旁边溅了血，写字的人已不在。 # beat:kh_seventh_7 # scene:kh_ward # cast:kh_healer # speaker:narrator
他的名字写在这里。哪一句是他亲见，别只留下一个“诸人”。 # beat:kh_seventh_8 # scene:kh_ward # cast:kh_healer # speaker:you
药师让你把这张单独晾开，纸上没有一句话能替那副担架回营。 # beat:kh_seventh_9 # scene:kh_ward # cast:kh_healer # speaker:narrator
}
* [留下陪伤者过完眼前的日子，先承担排好的照护。 # cid:kh_choose_care]
  ~ kh_future = 1
  夜里那一更还是我。等接班的人真到了，再说告别。 # beat:kh_seventh_10 # scene:kh_ward # cast:kh_healer # speaker:you
  留下就去吃饭。你也不是喝一句愿意便能守一夜。 # beat:kh_seventh_11 # scene:kh_ward # cast:kh_healer # speaker:kh_healer # mood:kh_healer=calm
  同门把早已凉的饼掰开，递来一半。你先接在左手。 # beat:kh_seventh_12 # scene:kh_ward # cast:kh_healer # speaker:narrator
  -> future
* [交清这一更，带着核过与仍残缺的旧录走三家送信。 # cid:kh_choose_record]
  ~ kh_future = 2
  我先交清床边的事，再带记录走。哪一页没核过，封面就写没核过。 # beat:kh_seventh_13 # scene:kh_ward # cast:kh_healer # speaker:you
  收件人的名字回来报。别只说三家都知道了。 # beat:kh_seventh_14 # scene:kh_ward # cast:kh_healer # speaker:kh_healer # mood:kh_healer=calm
  你把纸袋装进干布，袋角没有缝成一块遮住缺口的新封皮。 # beat:kh_seventh_15 # scene:kh_ward # cast:kh_healer # speaker:narrator
  -> future

=== future ===
谷口的人渐渐散了。你与同门又走到那两块石头前，空担架侧着仍能过，坐上一个人便过不去。 # beat:kh_future_1 # scene:kh_after # cast:kh_peer # speaker:narrator
{
- kh_future == 1:
你留到什么时候？ # beat:kh_future_2 # scene:kh_after # cast:kh_peer # speaker:kh_peer # mood:kh_peer=neutral
先到今晚接班的人来。再往后，一天一天交。 # beat:kh_future_3 # scene:kh_after # cast:kh_peer # speaker:you
你把担架放回外坡那端。今晚先认药、换布，等下一更的人来，叫醒他再去歇。 # beat:kh_future_4 # scene:kh_after # cast:kh_peer # speaker:narrator
- else:
要几日回来？ # beat:kh_future_5 # scene:kh_after # cast:kh_peer # speaker:kh_peer # mood:kh_peer=neutral
三处都问清再报。不知道几日，不先写死。 # beat:kh_future_6 # scene:kh_after # cast:kh_peer # speaker:you
你把收件人的空栏留在最外面，走到一家，才添一个确实接过纸袋的名字。 # beat:kh_future_7 # scene:kh_after # cast:kh_peer # speaker:narrator
}
{
- kh_peer_ready and kh_second_ready:
我陪你走第一段。到转弯处，你还叫我。 # beat:kh_future_8 # scene:kh_after # cast:kh_peer # speaker:kh_peer # mood:kh_peer=intent
在。 # beat:kh_future_9 # scene:kh_after # cast:kh_peer # speaker:you
这一次没有刀在谷里等，那声应答仍没有省掉。 # beat:kh_future_10 # scene:kh_after # cast:kh_peer # speaker:narrator
- else:
我先回营，晾的布还没收。走的时候，来路上喊一声。 # beat:kh_future_11 # scene:kh_after # cast:kh_peer # speaker:kh_peer # mood:kh_peer=neutral
他没有被你一句话变成无所畏惧的人。你认得他守过的石后，也知道他如今选择回哪里。 # beat:kh_future_12 # scene:kh_after # cast:kh_peer # speaker:narrator
}
后来旧录记下，孟归藏不再与人正式交手；司马玄极左臂终身未复，此后三十年未离太极山门。不是三个人全身而退的一场大胜。 # beat:kh_future_13 # scene:kh_after # cast:kh_peer # speaker:narrator
更远的年月也有记载：慧明闭关六年，司马元正第九年入返真，孟天枢第十二年跨过。那是他们自己的后来，不是你在谷口预先知道的奖赏。 # beat:kh_future_14 # scene:kh_after # cast:kh_peer # speaker:narrator # fact:kh_after
{
- kh_future == 1:
你留下的不是一声赞叹。夜里那更有人按时起身，床边的人睁眼，能叫出你的名字。门后有人，也包括终于学会接班的人。 # beat:kh_future_15 # scene:kh_after # cast:kh_peer # speaker:narrator # ending:kh_care
-> END
- else:
你带走的旧录有缺页，有不懂，有逐一核过的姓名。下一处山门问谷中如何，你先打开撤伤那张图，而后才说三位老人的名字。 # beat:kh_future_16 # scene:kh_after # cast:kh_peer # speaker:narrator # ending:kh_record
-> END
}
