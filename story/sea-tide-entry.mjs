export function writeEntry(w){
 const {part,choose,iff,stage,say,go}=w;
 part('first_boat','st_approach','st2_boatkeeper',`n|第五日清晨，雾后露出黑崖，浪碎成白线。你趴在船边，肚里早已没有什么可吐，一抬头，胃里又跟着船晃。
n|你叫沈见潮，十二岁，白螺屿人。父亲捕鱼，母亲晒盐。第一次去归潮岛，船走五日，你吐了三日；崖顶楼没有旗，只悬望海二字。
st2_boatkeeper~intent|到了。海天门。
n|你想站起来，好让他知道自己不是只会吐的小孩。船却先摇了一下。`);
 choose('trial',[
  ['st_take_rail','抓住栏杆，顺着船摇站起来。','st_first_rail = true',`n|手心沾了一点湿木屑。你站起时没比船快，反倒真看清黑崖上那两个字。
st2_boatkeeper~amused|今日先别把早饭也送给望海楼。`],
  ['st_wait_wave','再坐一会，等这波落下去才站。','st_first_rail = false',`n|老人把你身旁的空桶推远一点，自己仍扶着舷。船身回落，你才把脚移到刚才放桶的地方。
y|我现在能看了。
st2_boatkeeper~amused|楼又不走。`],
 ]);
 part('trial','st_trialshore','st_coach,st_an',`n|东极群岛更偏南、更深，大小四十余岛，常住的十余座。归潮岛有山、有田、三处大港。船上的老人说，北去蓬莱还得换船；你到的这座岛，山脚已有人把田分成一格一格。
n|三年一次试门，四十七个孩子排在水边。阿岑也是白螺屿来的，挤在你旁边，扯袖问木刀是不是等下要发。他看中了靠边那柄，怕先叫别人拿去。
st_coach|第一关，游水。
st_an~surprised|不先打？
st_coach~intent|你倒先游到那边，再问第二句。`);
 choose('four_tests',[
  ['st_swim_breath','先换足一口气，按自己的快慢游。','st_trial_breath = true',`n|你落后一截，转身时却还能换气。阿岑在前面呛了一口，听你呼气，终于也慢下来。
n|教头沿水边跟着那口咳声走，叫近处两个看护者下到浅水。阿岑站起来时，他已经等在岸边。`],
  ['st_swim_line','绕开教头指的回流，从外侧游。','st_trial_breath = false',`n|你比阿岑绕得远，却没被回流带回去。他到岸时咳着问为什么，你指向刚才反复转白的水。
st_coach~intent|认得一回，别当下回还在原处。`],
 ]);
 part('four_tests','st_trialshore','st_coach,st_an',`n|第二关攀崖，第三关认风。到第四关，才有人推你们三次，看谁少摔两跤。你仍摔得满手砂，抬起来，教头先看你指节还能不能动。
st_coach|会打，可以慢慢学。海上先看你会不会活。
n|四十七个孩子最后留下十六个，你和阿岑都在其中。没有人因游得快便免掉攀崖，也没人因最后站稳一次就不再学水。`);
 choose('outer_years',[
  ['st_learn_shared_knot','把自己绑的扣交给阿岑，让他解一次。','st_shared_knot = true',`n|他扯半晌解不开，索性拿膝顶住绳圈。你笑他，又看他真急了，只得凑过去同他拆开；轮到他绑，倒也卡住了你的指头。
st_an~amused|别怪我手笨。你下回掉水里，绳也不能只认你的手。`],
  ['st_learn_fast_knot','先练湿手快解，再同阿岑换一回。','st_shared_knot = false',`n|你练到手指发热，自己解扣越来越快。阿岑拿来却还打不开，木刀那边已经叫人，你答应明早再同他换。
st_an~uneasy|那你明早叫我。我不替你占前面那柄刀。
n|你说好，先跑去排队。他把这扣留下，没肯让你替他解。`],
 ]);
 part('outer_years','st_outeryard','st_coach,st_an',`n|外院六年，海潮拳、短刀、步法、基础吐纳，也学掌船、绑绳、识潮、修帆、救溺。十七岁的你把断帆补好，终于忍不住问，这些哪里像武功。
st_an~amused|我今日绑绳比你快，算不算赢？
y|我问的是正经的。
`);
 stage('st_outeryard','st_coach');say(`st_coach~intent|你若在海上把人打赢，船却沉了，算谁赢？`);
 stage('st_outeryard','st_coach,st_an');say(`n|你手里还拿针，半天才把没说完的那句吞回去。`);
 iff('st_shared_knot',`n|早年你肯同阿岑互解一扣，这几年忙起来，却也常由最快的人一把做完。教头这回的问，把那项已经会过却没一直做的事又放回眼前。`,`n|十二岁那回，你第二日真去叫过阿岑，一扣也教过了。十七岁再回头看，换了新人，还是得让他从头试，不能指着自己和阿岑都会，就算这班人都能接。`);
 choose('tide_step',[
  ['st_practice_exchange','以后收工留一轮换手，让别人解绳、自己来接，不总由最快的人做完。','st_exchange_drill = true',`n|阿岑真把绳递回来，你才发现他留的扣与你习惯不同。两人拆到指头发酸，回去时饭已经温了。他抢走碗底那块鱼，说早来就有热的，偏要留这会儿。`],
  ['st_practice_alone','以后把自己的湿手解扣练得更熟，另找时辰问接手的办法。','st_exchange_drill = false',`n|你一人练到绳股磨热，收放确实更快。别人来接时，你仍惯于自己抢回来做完。那句以后问没有消失，只是被每天最急的活挤到后头。`],
 ]);
 stage('st_smallboat','st_tidemaster');
 part('tide_step','st_smallboat','st_tidemaster',`n|十八岁过潮试，入正传。刀、掌、棍、长兵器开始分路，人人却都学潮行。老师把你带到小船上，只说站稳。
n|你才站好，他一脚踹船舷，你便落水。连续七日，你终于能在晃船上纹丝不动，刚要抬头看他。
st_tidemaster~intent|错了。
y|还不够稳？
st_tidemaster|船本来在动。下一步呢？`);
 choose('eleven_years',[
  ['st_follow_motion','松开死顶的膝，试着让船带动自己，再从这一下迈出去。','st_tide_follow = true',`n|你又跌一次，手还没摸到舷，船已往另一边沉。老师挪开脚，给你留了爬回来的地方；你刚上来，膝盖便又得跟着松。
y|刚才还能走，是我不肯松。
st_tidemaster|那再来。`],
  ['st_release_fixed','不再求七日练成的姿势，先退让半步，看不稳以后还有哪里能落脚。','st_tide_follow = false',`n|一退，船头又翘起来，你只得把刚找的地方也放掉。第二步落下时，老师才点头。
st_tidemaster|不是永远稳，是不稳时还能走。
n|你喘着气，把船沿上的水抹掉，给下一次留了位置。`],
 ]);
 part('eleven_years','st_workshore','st_an',`n|随后十一年，练武也跟船，潮行不是会背这两句话就不再落水。你与阿岑从候潮的小孩长到能在船上接班的大人，饭桌上已经有人问下次工钱何时结。
st_an~intent|明早外海船回来，先接缆再查帆。你别一上船又只问有没有高手。
y|我若问，你叫我先把绳交了。
n|你说着，把明日用的绳移到两人都能摸到的地方。二十九岁那年，东极的大风先到了。`);
 go('storm');
}
