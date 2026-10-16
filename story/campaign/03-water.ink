
=== water_load ===
你是昨晚说自己肩膀能扛的？上船先把肩膀放松。 # beat:c_water_load_1 # scene:reeds # cast:zhaoli,du,cheng # speaker:cheng # mood:cheng=neutral
程阿笠，管桨。别看她比你小，船上你得听她。 # beat:c_water_load_2 # scene:reeds # cast:zhaoli,du,cheng # speaker:zhaoli # mood:zhaoli=neutral
绳解哪一根，先问。最显眼的那根，往往不是最该解的。 # beat:c_water_load_3 # scene:reeds # cast:zhaoli,du,cheng # speaker:du # mood:du=neutral
船头药箱放得高，米袋压在一边。船离岸半尺，便往左沉了一点。 # beat:c_water_load_4 # scene:reeds # cast:zhaoli,du,cheng # speaker:narrator
这样装一路，会不会越来越偏？ # beat:c_water_load_5 # scene:reeds # cast:zhaoli,du,cheng # speaker:you
会。现在改，还是到汊口再改？岸上等着咱们的还有两袋。 # beat:c_water_load_6 # scene:reeds # cast:zhaoli,du,cheng # speaker:zhaoli # mood:zhaoli=intent
* [重排药米，让最怕湿的箱子居中。 # cid:balance_load]
  ~ supplies = true
  药先居中，重米分两边。后上的两袋另找低位。 # beat:c_water_load_7 # scene:reeds # cast:zhaoli,du,cheng # speaker:you
  我帮你挪。慢一会儿，总比在河心追箱子强。 # beat:c_water_load_8 # scene:reeds # cast:zhaoli,du,cheng # speaker:cheng # mood:cheng=calm
  -> water_oars
* [多带两袋，自己一路负责压住偏重。 # cid:load_more]
  ~ supplies = false
  ~ labor = true
  带上。我坐右边压着，到了汊口再搬。 # beat:c_water_load_9 # scene:reeds # cast:zhaoli,du,cheng # speaker:you
  可以，但这不是你坐到最后的保证。水变了，得听口令换位。 # beat:c_water_load_10 # scene:reeds # cast:zhaoli,du,cheng # speaker:zhaoli # mood:zhaoli=neutral
  -> water_oars

=== water_oars ===
程阿笠的桨划得不快，每次入水却都留一点斜角。你一用力，船头反而横了。 # beat:c_water_oars_1 # scene:reeds # cast:du,cheng,zhaoli # speaker:narrator
先停！你划得有力，我改方向就得多一倍力。 # beat:c_water_oars_2 # scene:reeds # cast:du,cheng,zhaoli # speaker:cheng # mood:cheng=sharp
我以为快一点就不耽误你。 # beat:c_water_oars_3 # scene:reeds # cast:du,cheng,zhaoli # speaker:you
你要是往灶里倒一缸水，也不能说是帮着煮饭。 # beat:c_water_oars_4 # scene:reeds # cast:du,cheng,zhaoli # speaker:du # mood:du=amused
老杜一开口，船都饿了。阿笠教他，我看前头。 # beat:c_water_oars_5 # scene:reeds # cast:du,cheng,zhaoli # speaker:zhaoli # mood:zhaoli=neutral
桨不是棍。你感觉一下，水往哪边带，不用先赢它。 # beat:c_water_oars_6 # scene:reeds # cast:du,cheng,zhaoli # speaker:cheng # mood:cheng=neutral
芦苇扫过船舷，水里没有坪上那种固定的中线。 # beat:c_water_oars_7 # scene:reeds # cast:du,cheng,zhaoli # speaker:narrator
* [收力跟阿笠的节奏，学控制方向。 # cid:oar_listen]
  ~ water_read = true
  你喊一次，我走一次。别为了给我面子说对了。 # beat:c_water_oars_8 # scene:reeds # cast:du,cheng,zhaoli # speaker:you
  第二下对了，第一下没有。你肯听，已经少走半个圈。 # beat:c_water_oars_9 # scene:reeds # cast:du,cheng,zhaoli # speaker:cheng # mood:cheng=calm
  -> water_net
* [把桨还给熟手，自己守住货绳。 # cid:oar_rope]
  ~ water_read = false
  ~ rope = true
  我今天划不好，先不添乱。哪根绳要留活口？ # beat:c_water_oars_10 # scene:reeds # cast:du,cheng,zhaoli # speaker:you
  人手够就不用人人会划。来，指给我看，哪根不能死勒。 # beat:c_water_oars_11 # scene:reeds # cast:du,cheng,zhaoli # speaker:du # mood:du=neutral
  -> water_net

=== water_net ===
姑娘，前头网兜里卡了一根大枝，水越冲越紧，我一个人提不起来。 # beat:c_water_net_1 # scene:reeds # cast:zhaoli,po,du # speaker:po # mood:po=neutral
这张网挡着副汊，我们不拆就得绕到主流。 # beat:c_water_net_2 # scene:reeds # cast:zhaoli,po,du # speaker:zhaoli # mood:zhaoli=uneasy
拆了，我这半月的菜钱就没了。 # beat:c_water_net_3 # scene:reeds # cast:zhaoli,po,du # speaker:po # mood:po=neutral
不是鱼钱？ # beat:c_water_net_4 # scene:reeds # cast:zhaoli,po,du # speaker:you
鱼也吃菜呀？是拿鱼换菜。你们年轻人别笑，我算得清。 # beat:c_water_net_5 # scene:reeds # cast:zhaoli,po,du # speaker:po # mood:po=neutral
水还没大，能慢慢解。可会误到白苇村送药的时辰。 # beat:c_water_net_6 # scene:reeds # cast:zhaoli,po,du # speaker:du # mood:du=neutral
网绳已绷出细响，断在水里，比割在手上更难捞。 # beat:c_water_net_7 # scene:reeds # cast:zhaoli,po,du # speaker:narrator
* [割开一角保船，留下赔网的承诺。 # cid:net_cut]
  ~ net_cut = true
  ~ debt = true
  网我赔。先开一角，断绳别放进水里。 # beat:c_water_net_8 # scene:reeds # cast:zhaoli,po,du # speaker:you
  你记得回来。说赔网的人，往往游得比鱼还远。 # beat:c_water_net_9 # scene:reeds # cast:zhaoli,po,du # speaker:po # mood:po=uneasy
  我作证。青蒲渡找我，不让你只追一个路过的人。 # beat:c_water_net_10 # scene:reeds # cast:zhaoli,po,du # speaker:zhaoli # mood:zhaoli=neutral
  -> marsh_lantern
* [靠岸慢慢解，不把老人的生计扔掉。 # cid:net_untie]
  ~ net_cut = false
  药怕晚，网也不能说没就没。我们一起解，能省一点是一点。 # beat:c_water_net_11 # scene:reeds # cast:zhaoli,po,du # speaker:you
  我稳住船。阿笠递刀，别割，先挑那处结。 # beat:c_water_net_12 # scene:reeds # cast:zhaoli,po,du # speaker:du # mood:du=neutral
  -> marsh_lantern

=== water_healer ===
白苇村的药棚比你想得小。觉茂正用门板搭床，凌苇卷着袖子在水里洗手。 # beat:c_water_healer_1 # scene:reeds # cast:ling,jue,zhaoli # speaker:narrator
药到了？先放干处，别一进门都问我有没有救。 # beat:c_water_healer_2 # scene:reeds # cast:ling,jue,zhaoli # speaker:ling # mood:ling=neutral
有个老人不肯吃，说省给孩子。 # beat:c_water_healer_3 # scene:reeds # cast:ling,jue,zhaoli # speaker:jue # mood:jue=neutral
他的病不是孩子那一种。药省错了，两个都耽误。 # beat:c_water_healer_4 # scene:reeds # cast:ling,jue,zhaoli # speaker:ling # mood:ling=sharp
我帮什么？ # beat:c_water_healer_5 # scene:reeds # cast:ling,jue,zhaoli # speaker:you
坐下听他们说完。别把所有人都听成同一种病。 # beat:c_water_healer_6 # scene:reeds # cast:ling,jue,zhaoli # speaker:ling # mood:ling=neutral
她忙的时候最凶，等会儿她记不得自己没喝水，你得凶回去。 # beat:c_water_healer_7 # scene:reeds # cast:ling,jue,zhaoli # speaker:zhaoli # mood:zhaoli=neutral
* [留在药棚帮分诊记人，听凌苇安排。 # cid:medicine_listen]
  ~ medicine = true
  一个一个说。我写得慢，别替旁边那位抢话。 # beat:c_water_healer_8 # scene:reeds # cast:ling,jue,zhaoli # speaker:you
  这样好。人不是药箱上一个数，问清楚才能往下做。 # beat:c_water_healer_9 # scene:reeds # cast:ling,jue,zhaoli # speaker:ling # mood:ling=calm
  -> water_change
* [帮觉茂加固门板床，照鲤去问诊。 # cid:medicine_boat]
  ~ medicine = false
  ~ labor = true
  名字你们问。我把床抬高，夜里涨水别让人睡水上。 # beat:c_water_healer_10 # scene:reeds # cast:ling,jue,zhaoli # speaker:you
  劳烦。木楔放那儿，不用剑来削，削歪了还得补。 # beat:c_water_healer_11 # scene:reeds # cast:ling,jue,zhaoli # speaker:jue # mood:jue=neutral
  -> water_change

=== water_change ===
回程时，来路的苇根露出更多。杜汀叟忽然叫住了准备解缆的照鲤。 # beat:c_water_change_1 # scene:reeds # cast:du,zhaoli,cheng # speaker:narrator
不是退潮。回水在借低处走，等前头一满，这里就会涨得更快。 # beat:c_water_change_2 # scene:reeds # cast:du,zhaoli,cheng # speaker:du # mood:du=intent
去旧桩湾等一夜？那就耽误头场。 # beat:c_water_change_3 # scene:reeds # cast:du,zhaoli,cheng # speaker:zhaoli # mood:zhaoli=neutral
我听杜师傅的。水声不对，船底都空。 # beat:c_water_change_4 # scene:reeds # cast:du,zhaoli,cheng # speaker:cheng # mood:cheng=neutral
你想回去试艺，不只是想领船的工钱吧？ # beat:c_water_change_5 # scene:reeds # cast:du,zhaoli,cheng # speaker:you
我想他们写江照鲤。不是某人带来的一条船。可我也不能拿阿笠替我赌。 # beat:c_water_change_6 # scene:reeds # cast:du,zhaoli,cheng # speaker:zhaoli # mood:zhaoli=uneasy
* [进旧桩湾等水，接受错过头场。 # cid:water_wait]
  ~ wait_tide = true
  晚一点到，名字还在。人少一个，写再大也没用。 # beat:c_water_change_7 # scene:reeds # cast:du,zhaoli,cheng # speaker:you
  好。我去报晚，不让你替我背。阿笠，转桨。 # beat:c_water_change_8 # scene:reeds # cast:du,zhaoli,cheng # speaker:zhaoli # mood:zhaoli=calm
  -> night_moor
* [沿岸试探一段，发现不对立即入湾。 # cid:water_probe]
  ~ wait_tide = false
  不进主流，探到第三根桩就停。你定什么叫不对，现在说清。 # beat:c_water_change_9 # scene:reeds # cast:du,zhaoli,cheng # speaker:you
  船尾先空，桨声两下不接，就退。不是等看见浪才说不对。 # beat:c_water_change_10 # scene:reeds # cast:du,zhaoli,cheng # speaker:du # mood:du=neutral
  -> night_moor
