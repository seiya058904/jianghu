import {createWriter} from '../chronicle-writer.mjs';
export function authorV6After(){
 const w=createWriter('c6_');const {part,say,choose,iff,go,out}=w;
 part('after_choice','v6_dawn','aunt,su,qiao',`n|天亮，赊账簿重新晾在竹竿上。你没有把所有相识都约在今日，也不能同时过完几种人生。
aunt|去哪儿先说。欠我的不看你今后名字多响，看你什么时候肯来。
qiao~calm|你也别一声不响就替我定了。我有自己要回的地方。
su|该赔的另记，归宿也不是拿一场好话把代价抹平。`);
 iff('v6_advance',`deng|会场把那笔路费还馆里了，收据在这里。你别再替别人垫第二回。
y|我先收好。馆里的钱不是我的脸面。`);
 iff('v6_public_cost',`su|工钱缺口公开后，今晚还是没有全凑足。严主事把不能开的那班划掉，留了重新招人的日期。
y|那写清停到哪天。有人靠这钱过冬，不能只写待定。`,`su|你不肯认的那班没有写你名字。会后若有人再说你答应全包，我留着原具结。
y|我自己也去讲，不能都等你替我证明。`);
 out.push('{\n- not v6_one_shift:');
 iff('final == 1 and not rescued and wound >= 3',`rong~intent|你答应代守的一个月，得另找人做。我先垫替工的钱，他按原价领，不从你养伤的药里挪。
y|写借条。等我能上工再约还期，这一月不冒成我自己做完的。
n|具结留着你的缺勤和另请的名字，伤没有替承诺自动销账。`,`n|修船开班以后，你按约多接了一月的代守，练剑的课表少去几日。月底回执签完，空出的时辰才重新归你。
rong|这一页签清。下一月若还缺人，我另问，不能把临时写成你以后都在。
y|这回我也不拿一句帮忙，就把自己的一整年填进去。`);
 out.push('{\n- future == 2 and not (final == 1 and not rescued and wound >= 3):');
 say(`n|原本想赶的那一趟镖已走。你等下一队，不由旁人替代守的一个月凭空挪出另一条路。`);
 out.push('}\n}');
 out.push('{\n- final == 1 and not rescued and wound >= 3:');go('v6_after_scar');
 out.push('- final == 1 and not rescued:');go('v6_after_lost');
 out.push('- final == 3 and duel == 2:');go('v6_after_name');
 out.push('- future == 3:');go('v6_after_teacher');
 out.push('- future == 2 and team and qiao_saved:');go('v6_after_together');
 out.push('- future == 2:');go('v6_after_apart');
 out.push('- route == 2 and zhaoli_trust and rescued:');go('v6_after_captain');
 out.push('- else:');go('v6_after_harbor');out.push('}');

 part('v6_after_harbor','v6_dawn','he,zhaoli,aunt',`n|何铆把船坞钥匙放在桌上，让你自己伸手拿。领了差事的人，明日得第一个开门。
he|工钱不多，漏一班就要有人补。你先选清晨还是午后，别看哪一班听着像救过人。
zhaoli~amused|清晨我在河上。你若误了，我让整条船听你喊人。
aunt|我只问，买饼要不要也给你留一份？`);
 choose('v6_harbor_shift',[
 ['v6_morning_shift','认清晨一班，练剑挪到午后。','v6_after_shift = 1',`y|给我留一份。第一班我来开门，不拿起晚说练到半夜。
he~calm|钥匙收好。先查绳，再查船，不是先给人讲你那日站哪儿。`],
 ['v6_late_shift','认午后船坞，清晨回馆教小满站稳。','v6_after_shift = 2',`y|午后我来。清晨我在馆里，若临时换班，当天先写给你。
zhaoli~calm|写也要有人接。明天我们把传话的人定下。`],
 ]);
 part('v6_harbor_shift','v6_dawn','he,zhaoli',`n|你把时辰写进册，没有把一个人的名字填满整日。`);
 iff('not v6_one_shift',`he|代守那一个月签清了。往后午后要多排班，我再问你，不拿上月那张当你一直答应。
y|一月少练的那几日我认，下一月也得自己再选。`,`zhaoli|只认的一班做稳了，再谈第二班。今天不是因为你赢过才让你拿钥匙。`);
 go('ending_harbor');

 part('v6_after_name','v6_dawn','rong,su,xu',`n|容既白把棍尾重新包好，试着走了一遍新步。你想起自己也有没练明白的地方，没先摆出赢者的样子。
rong~intent|补试我还来。你上回看见的，我会换。
xu~amused|先把饭约好，免得打完又说午饭凉了。
su|正式试手与年差具结分开，谁也别拿工钱让人让招。`);
 choose('v6_name_date',[
 ['v6_name_short','约定养好手后先拆旧招，再打补试。','',`y|先拆。你变了路，我也不拿同一招蒙你第二回。
rong~amused|怕我到时正好防住？
y|怕我自己以为你还没学会。`],
 ['v6_name_open','不约私下拆招，直接在公开补试再见。','',`y|公开场上再见。今日各练各的，届时别因为请过饭就客气。
rong~intent|好。饭还请，棍也照打。`],
 ]);
 part('v6_name_date','v6_dawn','rong,su',`n|你们各自试着落了一步，没有替下一场提前分胜负。`);
 go('ending_name');

 part('v6_after_together','v6_afterhall','qiao,pei,han',`n|再出门的包袱比来时轻，砚生的药却多了一包。裴雁秋看完他的腕，先把押前的名字划成押尾。
qiao~sharp|换差事可以，不要一路都只叫我伤着的那个。
pei|押尾也得有人试路，不是给你留一处空位歇着。
han|你们走得快，药换得慢。哪天一项赶不上，就停那一项。`);
 iff('v6_qiao_asked and v6_qiao_agency',`qiao~calm|这回我也自己填。上回你问过，没替我写，我就还敢讲。
n|他把押尾的回执收进自己的包，不再让你替他揣着。`,`qiao|我想去，是我说的。不因为你想同行，才变成我的主意。
y|听见了。哪天你不想走，也直接告诉我。`);
 choose('v6_together_depart',[
 ['v6_tail_signal','和他先定停步、换药、掉队三种口令。','',`y|你喊停，我先停。不是你每次喊，我都猜你在替我担心。
qiao~amused|那你走丢，我也喊停？
pei|走丢就喊他名字，别把整队都叫成停。`],
 ['v6_tail_schedule','把半日休整写进路线，不靠一路临时忍耐。','',`y|这半日在客栈，谁都不接急件。腕子没好不是过一夜便忘了。
pei~calm|可以。少赚的那件镖钱你们也要认。
qiao|我认我的，不都落你头上。`],
 ]);
 part('v6_together_depart','v6_afterhall','qiao,pei',`n|你们把落在纸上的约定带出门，没把别人的伤装成证明同行的记号。`);
 go('ending_together5');

 part('v6_after_teacher','v6_afterhall','bao,han,qiao',`n|包小满把水盆端到门边，等着你说下一步。你一时真想把这一趟见过的，全教给他。
bao~intent|我今日能拿剑了么？不是要把盆端到明年吧？
qiao~amused|你问得比我们当年快。
han|快没关系。问他会不会教，也该问得快。
n|你看着小满的脚，只能确定自己教得清这一段。`);
 choose('v6_teacher_first',[
 ['v6_teach_one','今天只教站稳后的第一步，让小满自己重复。','',`y|不是一直端盆。盆先放，迈这一小步，到了再说下一步。
bao~amused|终于走出门了！
han~amused|门槛还没过。看着点。`],
 ['v6_teach_ask','让小满先说哪里站不住，我不抢着示范。','',`y|你先说。你若只想学我最响的那句话，我可不收学费。
bao~uneasy|后脚老跟着前脚挤。不是我不肯站，是一动就挤。
y|好，那先只试这个。`],
 ]);
 part('v6_teacher_first','v6_afterhall','han,bao',`n|小满第一次没做好，第二次仍没做好。你没有把自己出去见过世面，拿来替他的脚走路。`);
 go('ending_teacher');

 part('v6_after_captain','v6_dawn','zhaoli,du,cheng',`n|船册上留下空格，程阿笠却先把自己的名字写在新一段水路旁。江照鲤伸手想改，她按住了纸。
cheng~sharp|我说自己掌，不是说偷偷掌。你们都在岸上，还不能让我试？
du|她这句有理。你们领船的，也得留个新人能过的地方。
zhaoli~uneasy|我知道她会。就是一想那夜，还没法不先伸手。
n|你也想替她把每个险处走完，那样她就永远只是跟船的人。`);
 choose('v6_captain_first',[
 ['v6_train_bank','岸上约好三处停靠，照鲤只在真正越线时介入。','',`y|定三处。她停错了说哪儿错，没到险处，先让她自己挽回来。
cheng~intent|好。我先把水路指给你们看。
zhaoli~calm|我听。不是等你说完，再把我的写上去。`],
 ['v6_train_cargo','先让阿笠领一趟轻货，亏下的工钱自己认份额。','',`y|这一趟少装，慢的那点别扣她工钱。我们既要教，也得肯少赚一次。
du~amused|难得。不是只肯在岸上鼓掌。
cheng|货少了，我也照规矩交清。别当玩一圈。`],
 ]);
 part('v6_captain_first','v6_dawn','zhaoli,cheng',`n|红绳仍挂在船头，末端能解。你们没有因为回来过一次，就不再重新试结。`);
 go('ending_captain');

 part('v6_after_apart','v6_dawn','qiao,su,lu',`n|你要走的那条路，不在砚生今日的包袱里。他把借来的护腕叠好，搁在桌边，没有追问为什么。
qiao~uneasy|我想让你留，也想明白这不是我一句话就该定的。
y|我也想带你。可不能把你现在养伤，说成暂时等着跟上我的人生。
su|那就把信写到能收到的地方。别只留江湖两个字。`);
 choose('v6_apart_address',[
 ['v6_letter_month','约一个月内报平安，失约前先托人传话。','',`y|一个月内。没走到原定的城，也从中途寄，不拿路远挡着。
qiao~calm|我不替你收得胜的传闻，只收你自己的字。`],
 ['v6_letter_meet','不许诺常写，约定下一次确定路过时当面来见。','',`y|我没把握月月写，不拿这个哄你。下回真知道何日经过，先送信。
qiao~sharp|那就真知道再说。今天这顿饭，先坐着吃完。
lu~amused|总算有人肯把先吃饭用在正经时候。`],
 ]);
 part('v6_apart_address','v6_dawn','qiao,su',`n|你把没能同时答应的事摊开，没有请任何一个人替你说离开最洒脱。`);
 go('ending_apart');

 part('v6_after_scar','v6_afterhall','ling,qiao,he',`n|醒来后，凌苇先让你握一只空碗。你想撑着坐起，肋下的痛便逼你重新躺回去。
ling~sharp|先别问什么时候能出剑。你连这口气都在抢。
qiao~uneasy|我来过这一套。你别把我劝你的话又还回来。
he|船坞缺量尺寸的人，不缺咬着牙替我抬梁的人。你要来，先照这个来。`);
 choose('v6_scar_work',[
 ['v6_accept_light','接受量尺寸的轻活，停下原定试艺。','',`y|我来量。疼了就停，不试自己还能硬撑几回。
ling~calm|这句我记着，不是给你一个月以后反悔的。
n|你没有在床边试握剑，只先把碗放稳。`],
 ['v6_accept_rest','先留馆专心养伤，让伙伴代办这一月的工钱。','',`y|我先不去。代办的那份记账，不把你们照顾说成我已经能干。
qiao~calm|好。明日我来说做了哪件，没做成也说。
n|少掉的工钱仍少掉，你把养伤的时日写进原来的计划。`],
 ]);
 part('v6_scar_work','v6_afterhall','ling,he',`n|这个秋天会比你想的长。你先学着把今天做完，不再用下一场胜负许诺伤口。`);
 go('ending_scar');

 part('v6_after_lost','v6_dawn','liu,zhaoli,han',`n|刘篙坐在岸上，左腿搁在矮凳。你来之前想了许多赔礼，见到他，第一句仍差点是还疼不疼。
liu~sharp|别又问。报船我会，认船号我也会。你们若是真缺人，就把册子放过来。
zhaoli~uneasy|领船的钱我分一份，不拿来买他原谅。
han|你要改，也得听他想把哪件事拿回来，不是只想着自己多难受。`);
 choose('v6_lost_report',[
 ['v6_liu_report','把报船册交给他，自己照他报的次序做。','',`y|你报，我照着做。有哪处我抢了你的话，直接叫我停。
liu~intent|三号先，五号等。别看我眼色，去看那条船。
n|你向河上转身，没有再把全岸的人都叫来听一场道歉。`],
 ['v6_liu_account','先把每月赔付日期和来源写清，再请他定想做的工作。','',`y|这笔每月到，不看你肯不肯来。你来做的活，另算工钱。
liu~calm|写清。我愿来报船，不等于你们以后就可以说伤已经不碍事。
n|你把两笔分开，拿给他自己看。`],
 ]);
 part('v6_lost_report','v6_dawn','liu,zhaoli',`n|一条船离岸，你没有把刘篙仍在岸边这件事抹去。下一条轮到谁，仍由他报。`);
 go('ending_lost');
 return w.render();
}
