
=== last_lesson ===
天擦黑，包小满来问学费，手里攥着几枚铜钱，没敢先递。 # beat:c_last_lesson_1 # scene:hall # cast:han,qiao,bao # speaker:narrator
我娘说我笨，别去糟蹋好木剑。这些钱，够学怎么站吗？ # beat:c_last_lesson_2 # scene:hall # cast:han,qiao,bao # speaker:bao # mood:bao=uneasy
谁说学站就得先聪明？我小时候也—— # beat:c_last_lesson_3 # scene:hall # cast:han,qiao,bao # speaker:qiao # mood:qiao=sharp
也拿牙顶门。别总让孩子听这一件，换件不丢人的。 # beat:c_last_lesson_4 # scene:hall # cast:han,qiao,bao # speaker:han # mood:han=amused
那没有太多能换的。 # beat:c_last_lesson_5 # scene:hall # cast:han,qiao,bao # speaker:qiao # mood:qiao=uneasy
韩鹭石取一把最旧的木剑，没给孩子，先让他把门口那盆水端进来。 # beat:c_last_lesson_6 # scene:hall # cast:han,qiao,bao # speaker:narrator
不是要学剑吗？ # beat:c_last_lesson_7 # scene:hall # cast:han,qiao,bao # speaker:bao # mood:bao=neutral
是。你端着盆还记得看脚下，待会儿拿着剑也别忘。水洒了，先擦，不能让下一个人摔。 # beat:c_last_lesson_8 # scene:hall # cast:han,qiao,bao # speaker:han # mood:han=neutral
师父，这一课你当年没这么说。 # beat:c_last_lesson_9 # scene:hall # cast:han,qiao,bao # speaker:you
当年你把盆扣在头上，我没来得及。 # beat:c_last_lesson_10 # scene:hall # cast:han,qiao,bao # speaker:han # mood:han=neutral
* [陪小满端水，讲自己摔过的地方。 # cid:lesson_stand]
  ~ bao_help = true
  你不用学我。我先把我掉过的坑给你指明白。 # beat:c_last_lesson_11 # scene:hall # cast:han,qiao,bao # speaker:you
  真掉过水沟？不是为了哄我编的？ # beat:c_last_lesson_12 # scene:hall # cast:han,qiao,bao # speaker:bao # mood:bao=amused
  真掉。还不止一回。 # beat:c_last_lesson_13 # scene:hall # cast:han,qiao,bao # speaker:qiao # mood:qiao=amused
  -> last_lesson_after
* [让他自己试，在旁边等他开口。 # cid:lesson_ask]
  ~ bao_help = false
  你先走。走不稳就停，想问的时候我在这儿。 # beat:c_last_lesson_14 # scene:hall # cast:han,qiao,bao # speaker:you
  小满一路盯水，险些撞柱，自己停了下来。没有人先笑他。 # beat:c_last_lesson_15 # scene:hall # cast:han,qiao,bao # speaker:narrator
  不是只看盆，也不是只看脚。得看看前头。 # beat:c_last_lesson_16 # scene:hall # cast:han,qiao,bao # speaker:bao # mood:bao=intent
  -> last_lesson_after

=== last_lesson_after ===
水盆放稳，孩子终于松开了手。韩鹭石只收一枚铜钱，让他回去先跟母亲讲清。 # beat:c_last_lesson_after_1 # scene:hall # cast:han,qiao,bao # speaker:narrator
别让她等到天黑，以为你把学剑当失踪。 # beat:c_last_lesson_after_2 # scene:hall # cast:han,qiao,bao # speaker:han # mood:han=neutral
明日先搬米，后日你们回来，我再来。 # beat:c_last_lesson_after_3 # scene:hall # cast:han,qiao,bao # speaker:bao # mood:bao=intent
嗯，我们也不是出了门，就能忘记谁在等。 # beat:c_last_lesson_after_4 # scene:hall # cast:han,qiao,bao # speaker:qiao # mood:qiao=calm
木剑留在门边。你想起自己第一次来时，也没敢先摸它。 # beat:c_last_lesson_after_5 # scene:hall # cast:han,qiao,bao # speaker:narrator
-> hall_leave
