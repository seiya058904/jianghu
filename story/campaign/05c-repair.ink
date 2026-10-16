
=== morning_roof ===
兰老实送来八只竹筐，说临时坐、装湿衣都能用，就是毛边还得削。 # beat:c_morning_roof_1 # scene:workshop # cast:he,lan,qiao # speaker:narrator
你一夜没睡？ # beat:c_morning_roof_2 # scene:workshop # cast:he,lan,qiao # speaker:qiao # mood:qiao=neutral
睡了半会儿。老又不是不用睡，别学。 # beat:c_morning_roof_3 # scene:workshop # cast:he,lan,qiao # speaker:lan # mood:lan=neutral
没报试艺，也忙到现在。 # beat:c_morning_roof_4 # scene:workshop # cast:he,lan,qiao # speaker:you
我拿修棚钱，他拿筐钱。做事不是没拿钱，才值得一句谢谢。 # beat:c_morning_roof_5 # scene:workshop # cast:he,lan,qiao # speaker:he # mood:he=neutral
那筐钱你什么时候给？ # beat:c_morning_roof_6 # scene:workshop # cast:he,lan,qiao # speaker:lan # mood:lan=amused
我只是木匠，找主事去！ # beat:c_morning_roof_7 # scene:workshop # cast:he,lan,qiao # speaker:he # mood:he=uneasy
笑完，何铆继续削毛边，没有急着挂上棚。 # beat:c_morning_roof_8 # scene:workshop # cast:he,lan,qiao # speaker:narrator
要帮忙吗？ # beat:c_morning_roof_9 # scene:workshop # cast:he,lan,qiao # speaker:qiao # mood:qiao=neutral
先吃面。绑索不是给饿的人练轻功的。 # beat:c_morning_roof_10 # scene:workshop # cast:he,lan,qiao # speaker:he # mood:he=neutral
* [吃完帮忙试索，再上场。 # cid:tools_test]
  ~ rope = true
  我只绑一处。你查完，再让人踩。 # beat:c_morning_roof_11 # scene:workshop # cast:he,lan,qiao # speaker:you
  会了还肯让人查，比绑着自夸好。 # beat:c_morning_roof_12 # scene:workshop # cast:he,lan,qiao # speaker:he # mood:he=calm
  -> morning_roof_after
* [请主事补派人手，自己休息。 # cid:tools_delegate]
  试艺后还要用手。再抢就两边做不好。 # beat:c_morning_roof_13 # scene:workshop # cast:he,lan,qiao # speaker:you
  去。讲清不来抢，也省我半路喊停。 # beat:c_morning_roof_14 # scene:workshop # cast:he,lan,qiao # speaker:he # mood:he=neutral
  -> morning_roof_after

=== morning_roof_after ===
总以为师父不上场，是没有机会。看他查门轴，好像没少做什么。 # beat:c_morning_roof_after_1 # scene:workshop # cast:he,lan,qiao # speaker:qiao # mood:qiao=calm
你还想赢？ # beat:c_morning_roof_after_2 # scene:workshop # cast:he,lan,qiao # speaker:you
想。吃完就去。不拿赢一场解释自己为什么面都顾不上。 # beat:c_morning_roof_after_3 # scene:workshop # cast:he,lan,qiao # speaker:qiao # mood:qiao=amused
你们吃到最后，一起收碗。隔着河湾传来第一声锣。 # beat:c_morning_roof_after_4 # scene:workshop # cast:he,lan,qiao # speaker:narrator
-> arena_open
