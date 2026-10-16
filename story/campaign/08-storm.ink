
=== storm_choice ===
雨把两盏灯连成模糊的一线。船尾在回水里摆动，刘篙举起空盆，又缓慢放下。 # beat:c_storm_choice_1 # scene:storm # cast:zhaoli,du,he # speaker:narrator
我们要保的是船上的人，不一定保得住船。 # beat:c_storm_choice_2 # scene:storm # cast:zhaoli,du,he # speaker:zhaoli # mood:zhaoli=intent
记得：船离桩，人先离绳。没谁能拿身子替一整条船压水。 # beat:c_storm_choice_3 # scene:storm # cast:zhaoli,du,he # speaker:du # mood:du=neutral
我知道。今天不是碰一寸衣袖。 # beat:c_storm_choice_4 # scene:storm # cast:zhaoli,du,he # speaker:you
也不是谁在看。你要用的东西，在手上，你要叫的人，在旁边。 # beat:c_storm_choice_5 # scene:storm # cast:zhaoli,du,he # speaker:he # mood:he=neutral
照鲤把红绳系在腰侧，留出能一手解开的活口。她看你，等你真正开口。 # beat:c_storm_choice_6 # scene:storm # cast:zhaoli,du,he # speaker:narrator
你定哪一段，我就接哪一段。不许临时把我也替了。 # beat:c_storm_choice_7 # scene:storm # cast:zhaoli,du,he # speaker:zhaoli # mood:zhaoli=neutral # cg:storm
{
- route == 2 and night_safe:
旧桩湾那次，我们先把绳角定清。今天照样先定，别因为有人看着，就忽然又改成拼命。 # beat:c_storm_choice_8 # scene:storm # cast:zhaoli,du,he # speaker:zhaoli # mood:zhaoli=neutral
}
{
- route == 1 and bridge_safe:
桥头你知道先清哪条路。水里一样，先留退路，不是一脚下去才问怎么回来。 # beat:c_storm_choice_9 # scene:storm # cast:zhaoli,du,he # speaker:he # mood:he=neutral
}
* [与照鲤协作接船，把最后一队人带到岸上。 # cid:end_rescue]
  ~ final = 1
  你接人，我守绳。要松的时候，我一定松，不跟船赌力气。 # beat:c_storm_choice_10 # scene:storm # cast:zhaoli,du,he # speaker:you
  好。我听你喊，也请你听我。 # beat:c_storm_choice_11 # scene:storm # cast:zhaoli,du,he # speaker:zhaoli # mood:zhaoli=calm
  -> storm_act
* [回高处组织大船，宁可慢也不再添险。 # cid:end_lead]
  ~ final = 2
  我们的小船不够稳。我回高处举灯，叫大船沿石墩进。 # beat:c_storm_choice_12 # scene:storm # cast:zhaoli,du,he # speaker:you
  我顶住这一段。跑的时候别想着快，把该说的信号先说全。 # beat:c_storm_choice_13 # scene:storm # cast:zhaoli,du,he # speaker:du # mood:du=calm
  -> storm_act
* [留给熟手救援，回坪争取重开正式试艺。 # cid:end_honor]
  ~ final = 3
  我不装能掌船。这里交给你们，另一头答应过的公平，我去要。 # beat:c_storm_choice_14 # scene:storm # cast:zhaoli,du,he # speaker:you
  去吧。记得你说的是交给我们，别回头再说自己一个人救了这条河。 # beat:c_storm_choice_15 # scene:storm # cast:zhaoli,du,he # speaker:zhaoli # mood:zhaoli=uneasy
  -> storm_act
* [陪腕伤的砚生护送最后一队回馆。 # cid:end_home]
  ~ final = 4
  我先带砚生把人送进屋。船上交给真正懂的人。 # beat:c_storm_choice_16 # scene:storm # cast:zhaoli,du,he # speaker:you
  去。屋里有人等，也得有人让等的人看见灯。 # beat:c_storm_choice_17 # scene:storm # cast:zhaoli,du,he # speaker:du # mood:du=neutral
  -> storm_act

=== storm_act ===
选择落下之后，没人再问哪条路最好。每个人都去做自己接住的那一段。 # beat:c_storm_act_1 # scene:storm # cast:zhaoli,du,he # speaker:narrator
先看脚下。断板第二块不能踩！ # beat:c_storm_act_2 # scene:storm # cast:zhaoli,du,he # speaker:he # mood:he=neutral
刘篙，把老人移到舱中！不要站船头替我们照灯！ # beat:c_storm_act_3 # scene:storm # cast:zhaoli,du,he # speaker:zhaoli # mood:zhaoli=intent
听得见！你也听我—— # beat:c_storm_act_4 # scene:storm # cast:zhaoli,du,he # speaker:you
一道浪从旧桩后绕回来，岸绳绷紧。你这一路学到的，并不会替你多长一双手。 # beat:c_storm_act_5 # scene:storm # cast:zhaoli,du,he # speaker:narrator
{
- final == 1:
{
- anchor and (rope or water_read or terrain) and wound < 3:
石墩把绳的力接住，你按口令松出半臂。照鲤借船身的转向靠拢，刘篙把老人送进她臂间。 # beat:c_storm_act_6 # scene:storm # cast:zhaoli,du,he # speaker:narrator
松！现在！ # beat:c_storm_act_7 # scene:storm # cast:zhaoli,du,he # speaker:zhaoli # mood:zhaoli=intent
你松了。那条被旧桩卡住的空船在浪里翻转，人却已经越过了最险的地方。 # beat:c_storm_act_8 # scene:storm # cast:zhaoli,du,he # speaker:narrator
- else:
岸绳突然震动，你试图多撑一瞬，伤处先替你松了力。何铆把你往后扯，自己也跪进水里。 # beat:c_storm_act_9 # scene:storm # cast:zhaoli,du,he # speaker:narrator
小船退！刘篙，留在舱中！等大船，不许跳！ # beat:c_storm_act_10 # scene:storm # cast:zhaoli,du,he # speaker:du # mood:du=sharp
照鲤退回岸侧。没有人抛下他们，可刚才还能赶上的窗口已经合拢。 # beat:c_storm_act_11 # scene:storm # cast:zhaoli,du,he # speaker:narrator
}
- final == 2:
你跑上仓前高处，先举两次灯，再指石墩外的来路。主事的大船终于看见你。 # beat:c_storm_act_12 # scene:storm # cast:zhaoli,du,he # speaker:narrator
沿右侧进，听篙声！别把岸边人当成挡路的！ # beat:c_storm_act_13 # scene:storm # cast:yan,zhaoli,du # speaker:yan # mood:yan=intent
救援比你想得慢，也比小船稳。你站在雨里数灯，第一次盼着自己什么都不必出剑。 # beat:c_storm_act_14 # scene:storm # cast:yan,zhaoli,du # speaker:narrator
- final == 3:
你回到空了一半的会坪。锣被雨打得沉闷，高秉还守着没写完的名册。 # beat:c_storm_act_15 # scene:storm # cast:yan,zhaoli,du # speaker:narrator
还有人在渡口。现在要求开试，你得让回来的人也有机会。 # beat:c_storm_act_16 # scene:storm # cast:gao,yan,zhaoli # speaker:gao # mood:gao=neutral
我来求的正是这个。不是趁他们缺席先拿走一场。 # beat:c_storm_act_17 # scene:storm # cast:gao,yan,zhaoli # speaker:you
- else:
你接过乔砚生左肩的重量。最后一队人经过汤二娘摊前时，她把整扇门板搭进泥里。 # beat:c_storm_act_18 # scene:storm # cast:gao,yan,zhaoli # speaker:narrator
我没拿到差事。还把手弄成这样。 # beat:c_storm_act_19 # scene:storm # cast:qiao,gao,yan # speaker:qiao # mood:qiao=uneasy
先把他们送进屋。回去以后，你可以坐着骂我多管闲事。 # beat:c_storm_act_20 # scene:storm # cast:qiao,gao,yan # speaker:you
}
-> storm_return

=== storm_return ===
临时药棚里，凌苇把每一块湿布换成干的。苏晚澄的册子放在梁上，陆汀舟没有碰。 # beat:c_storm_return_1 # scene:storm # cast:su,lu,ling # speaker:narrator
先喘气，再说自己还能干什么。喘不上气的人，我一律不听大话。 # beat:c_storm_return_2 # scene:storm # cast:su,lu,ling # speaker:ling # mood:ling=neutral
各处人数正在核，不说一个都不少，直到最后一个真的进门。 # beat:c_storm_return_3 # scene:storm # cast:su,lu,ling # speaker:su # mood:su=neutral
你可以坐一会儿。人不是一直站着，才算没退。 # beat:c_storm_return_4 # scene:storm # cast:su,lu,ling # speaker:lu # mood:lu=calm
等人回来，比在场上等下一招还难。 # beat:c_storm_return_5 # scene:storm # cast:su,lu,ling # speaker:you
因为这回你没有一柄剑能插进每一处。学会把手从不该抢的地方拿开，也难。 # beat:c_storm_return_6 # scene:storm # cast:su,lu,ling # speaker:ling # mood:ling=neutral
门外传来三次篙声。有人提灯，沿着泥路走近。 # beat:c_storm_return_7 # scene:storm # cast:su,lu,ling # speaker:narrator
* [先问是否有人未到，不急着说赢了。 # cid:account_all]
  ~ account = true
  慢慢数。还缺谁，我们就先说那个人的名字。 # beat:c_storm_return_8 # scene:storm # cast:su,lu,ling # speaker:you
  我和你数。不拿一句大功告成，盖住还没坐到这里的人。 # beat:c_storm_return_9 # scene:storm # cast:su,lu,ling # speaker:su # mood:su=calm
  -> storm_resolution
* [先接回受伤的人，把清点交给主事。 # cid:help_wounded]
  ~ account = false
  凌苇要干布，给我一叠。姓名你们数，我先把人接进来。 # beat:c_storm_return_10 # scene:storm # cast:su,lu,ling # speaker:you
  好。先扶肩，不要拉伤处。没查明的伤，不用一句没事替他定了。 # beat:c_storm_return_11 # scene:storm # cast:su,lu,ling # speaker:ling # mood:ling=intent
  -> storm_resolution

=== storm_resolution ===
雨停在将亮未亮的时候。会坪还在，东棚只剩木架，米袋上全是鞋印。 # beat:c_storm_resolution_1 # scene:dawn # cast:zhaoli,qiao,yan # speaker:narrator
急难记急难，试艺记试艺。不能因为救人，就把谁原本没赢的那场改成赢。 # beat:c_storm_resolution_2 # scene:dawn # cast:zhaoli,qiao,yan # speaker:yan # mood:yan=neutral
也不能因为迟到，就把送到药的人写成没来。 # beat:c_storm_resolution_3 # scene:dawn # cast:zhaoli,qiao,yan # speaker:qiao # mood:qiao=neutral
是。以后这两册分开，谁都能来看。 # beat:c_storm_resolution_4 # scene:dawn # cast:zhaoli,qiao,yan # speaker:yan # mood:yan=calm
那船上的人呢？ # beat:c_storm_resolution_5 # scene:dawn # cast:zhaoli,qiao,yan # speaker:zhaoli # mood:zhaoli=neutral
每个人都来自己报一声。该赔的、该修的，今日起一桩桩认。 # beat:c_storm_resolution_6 # scene:dawn # cast:zhaoli,qiao,yan # speaker:yan # mood:yan=neutral
你看见严平章先在损失那一栏，写下了自己的名字。 # beat:c_storm_resolution_7 # scene:dawn # cast:zhaoli,qiao,yan # speaker:narrator
{
- final == 1 and anchor and (rope or water_read or terrain) and wound < 3:
船没了，刘篙和老人都到了。这一次不是我们把水赢了，是最后那一下终于肯松手。 # beat:c_storm_resolution_8 # scene:dawn # cast:zhaoli,qiao,yan # speaker:zhaoli # mood:zhaoli=calm
我手里那段，也没只靠我。 # beat:c_storm_resolution_9 # scene:dawn # cast:zhaoli,qiao,yan # speaker:you
照鲤解下红绳，放进你掌心。这回没有急着说下次。 # beat:c_storm_resolution_10 # scene:dawn # cast:zhaoli,qiao,yan # speaker:narrator
  ~ rescued = true
- final == 1 and wound >= 3:
你肋伤不能再扛重。人靠大船接回来了，你这口气还得慢慢养。 # beat:c_storm_resolution_11 # scene:dawn # cast:ling,zhaoli,qiao # speaker:ling # mood:ling=intent
这次我扶你。你不许说自己不重，我也不会信。 # beat:c_storm_resolution_12 # scene:dawn # cast:ling,zhaoli,qiao # speaker:qiao # mood:qiao=uneasy
  ~ rescued = false
- final == 1:
刘篙最后才离船，老人被先送出来。他替船挡的一下，左腿没保住原来的利落。 # beat:c_storm_resolution_13 # scene:dawn # cast:du,ling,zhaoli # speaker:du # mood:du=neutral
我答应要把人带回来。人回来了，可我不能说一切都跟以前一样。 # beat:c_storm_resolution_14 # scene:dawn # cast:du,ling,zhaoli # speaker:zhaoli # mood:zhaoli=uneasy
那我们也不那么说。往后的事，不能因为故事到这里就算了。 # beat:c_storm_resolution_15 # scene:dawn # cast:du,ling,zhaoli # speaker:you
  ~ rescued = false
- else:
大船接到了。最后一程很慢，没人少，船损还要慢慢赔。 # beat:c_storm_resolution_16 # scene:dawn # cast:du,ling,zhaoli # speaker:du # mood:du=calm
我们也有不能一口气解决的事。这回至少都能坐下说。 # beat:c_storm_resolution_17 # scene:dawn # cast:du,ling,zhaoli # speaker:zhaoli # mood:zhaoli=neutral
  ~ rescued = true
}
* [留下修渡、还债，把未完的事做完。 # cid:aftermath_stay]
  ~ future = 1
  屋顶、破网、坏船，先做看得见的一件。欠的名字，一个个去找。 # beat:c_storm_resolution_18 # scene:dawn # cast:du,ling,zhaoli # speaker:you
  那就从拆这架棚开始。回来了，还得干活。 # beat:c_storm_resolution_19 # scene:dawn # cast:he,du,ling # speaker:he # mood:he=calm
  -> after_choice
* [准备远行，先把承诺交代清楚。 # cid:aftermath_road]
  ~ future = 2
  我想继续走。但不拿一句江湖再见，替自己还没还的账。 # beat:c_storm_resolution_20 # scene:dawn # cast:he,du,ling # speaker:you
  去每个人面前说。留下地址，比留一句漂亮话难，也有用。 # beat:c_storm_resolution_21 # scene:dawn # cast:su,he,du # speaker:su # mood:su=calm
  -> after_choice
* [回馆休养，把学来的教给后来者。 # cid:aftermath_teach]
  ~ future = 3
  包小满还等着学站稳。我先教他别怎么摔，再和师父一起补瓦。 # beat:c_storm_resolution_22 # scene:dawn # cast:su,he,du # speaker:you
  别一进门就说你什么都懂了。那半间房，还装不下你这么多道理。 # beat:c_storm_resolution_23 # scene:dawn # cast:qiao,su,he # speaker:qiao # mood:qiao=amused
  -> after_choice
