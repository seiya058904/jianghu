
=== last_boat ===
许竞川跑来，把干护腕塞进你手里。 # beat:c_last_boat_1 # scene:levee # cast:du,zhaoli,xu # speaker:narrator
不是拿去硬撑。护住擦伤，真疼还得喊。 # beat:c_last_boat_2 # scene:levee # cast:du,zhaoli,xu # speaker:xu # mood:xu=intent
余枫替你捡的那只？ # beat:c_last_boat_3 # scene:levee # cast:du,zhaoli,xu # speaker:you
另一只，我又不只一只手。 # beat:c_last_boat_4 # scene:levee # cast:du,zhaoli,xu # speaker:xu # mood:xu=uneasy
练剑的，脸皮也练护腕？ # beat:c_last_boat_5 # scene:levee # cast:du,zhaoli,xu # speaker:zhaoli # mood:zhaoli=amused
你也别笑。红绳活口再拆一回。 # beat:c_last_boat_6 # scene:levee # cast:du,zhaoli,xu # speaker:du # mood:du=neutral
她认真拆开再绑。手在抖，结比上回清楚。 # beat:c_last_boat_7 # scene:levee # cast:du,zhaoli,xu # speaker:narrator
我怕的是没来得及叫人，自己就冲了。 # beat:c_last_boat_8 # scene:levee # cast:du,zhaoli,xu # speaker:zhaoli # mood:zhaoli=intent
我也怕。但能问的话，不该全咽着。 # beat:c_last_boat_9 # scene:levee # cast:du,zhaoli,xu # speaker:you
我还在，不是给你们壮胆的一尊泥像。 # beat:c_last_boat_10 # scene:levee # cast:du,zhaoli,xu # speaker:du # mood:du=calm
* [先空走一遍退回的路线。 # cid:boat_rehearse]
  ~ signal = true
  我退到石边，照鲤松船，老杜最后撤。别拿真浪排第一次。 # beat:c_last_boat_11 # scene:levee # cast:du,zhaoli,xu # speaker:you
  你喊停，我听。不是没救到才停，是还有人要救。 # beat:c_last_boat_12 # scene:levee # cast:du,zhaoli,xu # speaker:zhaoli # mood:zhaoli=calm
  -> last_boat_after
* [复述松绳信号，安排岸上守灯。 # cid:boat_signal]
  ~ signal = true
  一声退，二声松。听不见看灯，不自行改。 # beat:c_last_boat_13 # scene:levee # cast:du,zhaoli,xu # speaker:you
  再叫一个岸上人守灯。灯不能跟你们一起忙灭。 # beat:c_last_boat_14 # scene:levee # cast:du,zhaoli,xu # speaker:du # mood:du=intent
  -> last_boat_after

=== last_boat_after ===
许竞川退到岸上接下一队，没有坚持自己也去。 # beat:c_last_boat_after_1 # scene:levee # cast:du,zhaoli,xu # speaker:narrator
回来还护腕。别让我跟师弟解释，怎么又丢了。 # beat:c_last_boat_after_2 # scene:levee # cast:du,zhaoli,xu # speaker:xu # mood:xu=calm
烂了也当面说，不偷偷往河里扔。 # beat:c_last_boat_after_3 # scene:levee # cast:du,zhaoli,xu # speaker:you
好。现在船在等，人也等。 # beat:c_last_boat_after_4 # scene:levee # cast:du,zhaoli,xu # speaker:zhaoli # mood:zhaoli=amused
你看了一眼岸上的灯。有人将它举高，稳在所有人看得见的地方。 # beat:c_last_boat_after_5 # scene:levee # cast:du,zhaoli,xu # speaker:narrator
-> storm_choice
