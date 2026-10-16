
=== workshop_gate ===
修船坞里一锅汤滚得很响。何铆把门板架成桌，汤二娘还在嫌碗不够大。 # beat:c_workshop_gate_1 # scene:workshop # cast:he,aunt,qiao # speaker:narrator
你们出趟门，回来个个像晒坏的腌菜。先喝，喝完再吹牛。 # beat:c_workshop_gate_2 # scene:workshop # cast:he,aunt,qiao # speaker:aunt # mood:aunt=neutral
我没吹。刚才只说他们怎么还没到。 # beat:c_workshop_gate_3 # scene:workshop # cast:he,aunt,qiao # speaker:qiao # mood:qiao=amused
问了十九次。第十次以后，门都快被他看穿了。 # beat:c_workshop_gate_4 # scene:workshop # cast:he,aunt,qiao # speaker:he # mood:he=neutral
你怎么不来接？ # beat:c_workshop_gate_5 # scene:workshop # cast:he,aunt,qiao # speaker:you
师父叫我等在这儿。说有人回来，总得看见一个没乱跑的。 # beat:c_workshop_gate_6 # scene:workshop # cast:he,aunt,qiao # speaker:qiao # mood:qiao=uneasy
他抬了抬右腕，又很快放下。你们的两条路，终于落在同一锅热汤边。 # beat:c_workshop_gate_7 # scene:workshop # cast:he,aunt,qiao # speaker:narrator
{
- route == 1:
听说你们桥边耽搁了。河上也是，没谁特别轻松。 # beat:c_workshop_gate_8 # scene:workshop # cast:zhaoli,he,aunt # speaker:zhaoli # mood:zhaoli=neutral
我只知道回来的人还在。你的那段，吃完慢慢说。 # beat:c_workshop_gate_9 # scene:workshop # cast:zhaoli,he,aunt # speaker:you
- else:
你们的船灯整夜没出现。砚生最后把碗都端凉了。 # beat:c_workshop_gate_10 # scene:workshop # cast:pei,zhaoli,he # speaker:pei # mood:pei=neutral
我们在等水。你们桥上那段，等下从头讲。 # beat:c_workshop_gate_11 # scene:workshop # cast:pei,zhaoli,he # speaker:you
}
* [先讲自己做错的那一下。 # cid:reunion_honest]
  ~ honest = true
  我不是每步都做对。最想省工夫的时候，差点让别人替我付。 # beat:c_workshop_gate_12 # scene:workshop # cast:pei,zhaoli,he # speaker:you
  你肯回来讲，我就敢告诉你我也有没做好的。先吃，别抢着认罪。 # beat:c_workshop_gate_13 # scene:workshop # cast:qiao,pei,zhaoli # speaker:qiao # mood:qiao=calm
  -> workshop_people
* [先讲最好笑的一件，让大家喘口气。 # cid:reunion_light]
  ~ honest = false
  先说不疼的。陆汀舟能把回函压在饼下面，江湖上还有什么不能发生？ # beat:c_workshop_gate_14 # scene:workshop # cast:qiao,pei,zhaoli # speaker:you
  我已赔礼，怎么这桩旧事比师门三百年还难翻篇？ # beat:c_workshop_gate_15 # scene:workshop # cast:lu,qiao,pei # speaker:lu # mood:lu=amused
  -> workshop_people

=== workshop_people ===
雁秋，你肩上的旧伤还发不发？ # beat:c_workshop_people_1 # scene:workshop # cast:pei,ling,he # speaker:ling # mood:ling=neutral
你现在问，是按朋友问，还是按大夫问？ # beat:c_workshop_people_2 # scene:workshop # cast:pei,ling,he # speaker:pei # mood:pei=neutral
按有眼睛的人问。你抬箱子时，把左边先让给别人了。 # beat:c_workshop_people_3 # scene:workshop # cast:pei,ling,he # speaker:ling # mood:ling=sharp
裴雁秋伸手去端汤，何铆把重碗换成一只小的。 # beat:c_workshop_people_4 # scene:workshop # cast:pei,ling,he # speaker:narrator
当年我让你走，是怕车队再误，不是觉得你只会添乱。 # beat:c_workshop_people_5 # scene:workshop # cast:pei,ling,he # speaker:pei # mood:pei=neutral
我知道。但你替我决定了。我那时候已经能自己说走不走。 # beat:c_workshop_people_6 # scene:workshop # cast:pei,ling,he # speaker:ling # mood:ling=neutral
你们还一起护药？ # beat:c_workshop_people_7 # scene:workshop # cast:pei,ling,he # speaker:you
正因为一起，才不能永远绕着这句。 # beat:c_workshop_people_8 # scene:workshop # cast:pei,ling,he # speaker:pei # mood:pei=neutral
* [让两人自己讲完，接下眼前的杂活。 # cid:healer_speak]
  ~ ally = true
  汤我去添，你们别拿谁的碗空了当话头躲过去。 # beat:c_workshop_people_9 # scene:workshop # cast:pei,ling,he # speaker:you
  听见了？今天连躲的地方都被你的人堵上了。 # beat:c_workshop_people_10 # scene:workshop # cast:pei,ling,he # speaker:ling # mood:ling=amused
  那就讲完。下回我先问你，再定车队怎么走。 # beat:c_workshop_people_11 # scene:workshop # cast:pei,ling,he # speaker:pei # mood:pei=calm
  -> two_swords
* [问一次以后该怎样分工，不替谁判对错。 # cid:healer_question]
  ~ ally = false
  下次又有人受伤，你们先问什么？ # beat:c_workshop_people_12 # scene:workshop # cast:pei,ling,he # speaker:you
  先问她需要几个人、多久。我报清车队能等多久。 # beat:c_workshop_people_13 # scene:workshop # cast:pei,ling,he # speaker:pei # mood:pei=neutral
  再一起决定。别拿体谅当成不必开口。 # beat:c_workshop_people_14 # scene:workshop # cast:pei,ling,he # speaker:ling # mood:ling=calm
  -> two_swords

=== workshop_qiao ===
明日我跟你同组。你手要是没好，现在告诉我。 # beat:c_workshop_qiao_1 # scene:workshop # cast:qiao,xu,ling # speaker:xu # mood:xu=neutral
好没好，你上场不就知道？ # beat:c_workshop_qiao_2 # scene:workshop # cast:qiao,xu,ling # speaker:qiao # mood:qiao=sharp
他要的是能不能打，不是你会不会顶嘴。 # beat:c_workshop_qiao_3 # scene:workshop # cast:qiao,xu,ling # speaker:ling # mood:ling=neutral
乔砚生盯着许竞川的刀鞘，过了片刻，终于把右腕放在桌上。 # beat:c_workshop_qiao_4 # scene:workshop # cast:qiao,xu,ling # speaker:narrator
不能连抢三次。两次以后，我得换。 # beat:c_workshop_qiao_5 # scene:workshop # cast:qiao,xu,ling # speaker:qiao # mood:qiao=uneasy
够了。我知道你留什么，也告诉你，我右脚转身慢。别说我没给你看。 # beat:c_workshop_qiao_6 # scene:workshop # cast:qiao,xu,ling # speaker:xu # mood:xu=neutral
你这算让招？ # beat:c_workshop_qiao_7 # scene:workshop # cast:qiao,xu,ling # speaker:you
算把丑话讲在前面。真打的时候，各自想办法。 # beat:c_workshop_qiao_8 # scene:workshop # cast:qiao,xu,ling # speaker:xu # mood:xu=intent
* [约定明日协作试，由他守你攻。 # cid:qiao_team]
  ~ team = true
  守的时候喊我。我不把你的剑拿走，也不假装你的手没伤。 # beat:c_workshop_qiao_9 # scene:workshop # cast:qiao,xu,ling # speaker:you
  行。你别把攻全吞了，该我走的时候，我自己会走。 # beat:c_workshop_qiao_10 # scene:workshop # cast:qiao,xu,ling # speaker:qiao # mood:qiao=calm
  -> workshop_rong
* [支持他独立完成有限目标，你去自己的场。 # cid:qiao_single]
  ~ team = false
  你自己选能做到的那一段。我在自己的场上，也不会拿你当借口。 # beat:c_workshop_qiao_11 # scene:workshop # cast:qiao,xu,ling # speaker:you
  这回听着舒服。谁先完事，谁去看另一场。 # beat:c_workshop_qiao_12 # scene:workshop # cast:qiao,xu,ling # speaker:qiao # mood:qiao=calm
  -> workshop_rong

=== workshop_rong ===
东仓能多拿十袋，再多就得动雇工的口粮。 # beat:c_workshop_rong_1 # scene:workshop # cast:rong,deng,aunt # speaker:deng # mood:deng=neutral
我知道。不是我一句送米，后面的人就不用吃。 # beat:c_workshop_rong_2 # scene:workshop # cast:rong,deng,aunt # speaker:rong # mood:rong=uneasy
你爹年轻时也这样。想做一桩大善事，把洗锅的米都捐了。 # beat:c_workshop_rong_3 # scene:workshop # cast:rong,deng,aunt # speaker:aunt # mood:aunt=neutral
后来呢？ # beat:c_workshop_rong_4 # scene:workshop # cast:rong,deng,aunt # speaker:rong # mood:rong=neutral
后来在我这儿赊了七顿。 # beat:c_workshop_rong_5 # scene:workshop # cast:rong,deng,aunt # speaker:aunt # mood:aunt=amused
那明日怎么办？ # beat:c_workshop_rong_6 # scene:workshop # cast:rong,deng,aunt # speaker:you
我出十袋，工钱照付。有人说我拿钱买好名声，你若真这么想，就当面说。 # beat:c_workshop_rong_7 # scene:workshop # cast:rong,deng,aunt # speaker:rong # mood:rong=intent
* [出自己的劳力，把十袋的用处做足。 # cid:grain_work]
  ~ grain_help = true
  你出米，我们来搬。谁干过活，册上写谁，不拿你名字盖过去。 # beat:c_workshop_rong_8 # scene:workshop # cast:rong,deng,aunt # speaker:you
  好。也别把我的名字擦掉。出了力的人，没必要假装没出。 # beat:c_workshop_rong_9 # scene:workshop # cast:rong,deng,aunt # speaker:rong # mood:rong=calm
  -> workshop_night
* [要求公开米数和用途，免得善意变成人情债。 # cid:grain_terms]
  ~ grain_help = false
  账公开，少了谁能问，多了别拿来逼谁让招。 # beat:c_workshop_rong_10 # scene:workshop # cast:rong,deng,aunt # speaker:you
  可以。我也要你们以后别用家财两个字，抹掉我练棍的十几年。 # beat:c_workshop_rong_11 # scene:workshop # cast:rong,deng,aunt # speaker:rong # mood:rong=sharp
  -> workshop_night

=== workshop_night ===
饭后，苏晚澄在灯下誊记，陆汀舟把干净回函放到她面前，压纸的是一块洗过的卵石。 # beat:c_workshop_night_1 # scene:workshop # cast:zhaoli,lu,su # speaker:narrator
终于不是饼了。 # beat:c_workshop_night_2 # scene:workshop # cast:zhaoli,lu,su # speaker:su # mood:su=amused
石头不能吃，我少一个能送的人情。 # beat:c_workshop_night_3 # scene:workshop # cast:zhaoli,lu,su # speaker:lu # mood:lu=neutral
明日会前都有点心慌？我刚才连平时走惯的踏板，都多看了一眼。 # beat:c_workshop_night_4 # scene:workshop # cast:zhaoli,lu,su # speaker:zhaoli # mood:zhaoli=neutral
有。最怕别人说我今天做的，只是碰巧。 # beat:c_workshop_night_5 # scene:workshop # cast:zhaoli,lu,su # speaker:you
碰巧也有前因。你明天不用把过去都证明一遍。 # beat:c_workshop_night_6 # scene:workshop # cast:zhaoli,lu,su # speaker:su # mood:su=neutral
你想试的那一手，只要到场，真试过就行。别顺便试着替一生争个结论。 # beat:c_workshop_night_7 # scene:workshop # cast:zhaoli,lu,su # speaker:lu # mood:lu=calm
{
- medicine:
药棚的人还问起你。你肯听他们说完，省下的不只我一口气。 # beat:c_workshop_night_8 # scene:workshop # cast:ling,zhaoli,lu # speaker:ling # mood:ling=neutral
我也才知道，同一种发热，后面可能是不同的日子。 # beat:c_workshop_night_9 # scene:workshop # cast:ling,zhaoli,lu # speaker:you
- else:
床和药车有人守着，我才能在里面看人。你不站在最前面，也没少帮忙。 # beat:c_workshop_night_10 # scene:workshop # cast:ling,zhaoli,lu # speaker:ling # mood:ling=neutral
}
{
- supplies:
药箱是干的，村里能用到最后一包。出门时肯挪那半刻，到地方就不用追着湿纸捡药。 # beat:c_workshop_night_11 # scene:workshop # cast:pei,ling,zhaoli # speaker:pei # mood:pei=neutral
- else:
有箱角沾了水，药没全坏。何铆在修底，下回装货不能只想着多一袋。 # beat:c_workshop_night_12 # scene:workshop # cast:pei,ling,zhaoli # speaker:pei # mood:pei=neutral
}
* [找照鲤核对明日的停手信号。 # cid:night_friend]
  ~ zhaoli_trust = true
  你喊我名字，我停。也请你听我喊，别最后还嫌我多嘴。 # beat:c_workshop_night_13 # scene:workshop # cast:pei,ling,zhaoli # speaker:you
  说定了。明天不管在岸上还是船上，都算。 # beat:c_workshop_night_14 # scene:workshop # cast:pei,ling,zhaoli # speaker:zhaoli # mood:zhaoli=calm
  -> morning_roof
* [找苏晚澄把自己的失误补进记录。 # cid:night_record]
  ~ su_trust = true
  好听的写了，难听的也得在。别让下个学徒照着我错的那一步学。 # beat:c_workshop_night_15 # scene:workshop # cast:pei,ling,zhaoli # speaker:you
  我不删。你也别只记错的，把真正做到的那一段留住。 # beat:c_workshop_night_16 # scene:workshop # cast:su,pei,ling # speaker:su # mood:su=calm
  -> morning_roof
