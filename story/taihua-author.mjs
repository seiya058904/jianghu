// Authored adaptation of 宋世江湖.md:2022–6057. Choices alter commitments,
// fatigue and relationships; canonical bouts and the two orders are locked.
import {writeFileSync} from 'node:fs';
import {writeLayout,writeMing,writeHuo} from './taihua-observation.mjs';
import {writeOldWatch,writeOldFinal,writeMu} from './taihua-elders.mjs';
const out=[];let scene='',cast=[],knot='',index=0;
function part(id,where,people,lines){knot=id;index=0;scene=where;cast=people.split(',').filter(Boolean);out.push(`\n=== ${id} ===`);say(lines)}
function say(lines){for(const raw of lines.trim().split('\n')){if(!raw.trim())continue;const split=raw.indexOf('|');const who=raw.slice(0,split);const text=raw.slice(split+1);let [speaker,mood='neutral']=who.split('~');speaker=({n:'narrator',y:'you'})[speaker]??speaker;if(!['narrator','you'].includes(speaker)&&!cast.includes(speaker))cast=[speaker,...cast].slice(0,3);out.push(`${text} # beat:th_${knot}_${++index} # scene:${scene} # cast:${cast.join(',')||'none'} # speaker:${speaker}${!['narrator','you'].includes(speaker)?` # mood:${speaker}=${mood}`:''}`)}}
function go(id){out.push(`-> ${id}`)}
function stage(where,people){scene=where;cast=people.split(',').filter(Boolean)}
function choose(next,items){for(const [id,text,effect,lines,condition] of items){out.push(`* ${condition?`{${condition}} `:''}[${text} # cid:th_${id}]`);if(effect)for(const change of effect.split(';'))out.push(`  ~ ${change}`);const start=out.length;say(lines);for(let i=start;i<out.length;i++)out[i]='  '+out[i];out.push(`  -> ${next}`)}}
function iff(expression,yes,no){out.push(`{\n- ${expression}:`);say(yes);if(no){out.push('- else:');say(no)}out.push('}')}
function fact(id){out[out.length-1]+=` # fact:${id}`}
function end(id,line){say(`n|${line}`);out[out.length-1]+=` # ending:${id}`;out.push('-> END')}

const w={part,say,stage,choose,iff,fact,go,end,out};
part('called','th_guest','th_leader,th_bro',`n|你含着一口水，听见领队老人说：明日青序，你补。
y|……我？
th_leader~sharp|这屋里还有第二个陆青珩？
n|你咳得袖口都湿了。床边师兄的右膝肿起，绑腿搁在盆沿，他看着自己的鞋，没有看你。
y|可是我没准备。
th_leader|练了二十年，你想再准备几日？
th_bro~uneasy|我的护腕在箱里。合用便拿，不合用别硬戴。
n|那只箱子刚收好。他为这十七日封岭，备了远不止十七日。`);
choose('packing',[
 ['care','先把水盆移到师兄够得着的地方。','care = true',`y|护腕先放着。水凉了，我去换。药什么时候敷？
th_bro|你明日上场，别围着我转。
y|我只问什么时候敷，又没说替你疼。
n|他用没伤的脚，把挡路的鞋往床下一拨。`],
 ['ask','接过护腕，直说我怕拖武当的后腿。','care = false',`y|我怕补进去，反而让人觉得你该硬撑上去。
th_bro~sharp|我的膝盖不是拿你输赢治的。
n|他把护腕塞进你手里，却没有替你绑好。
th_bro|你打你的。我退了，就是退了。`],
]);
part('packing','th_guest','th_bro,th_leader',`th_leader|明早认席位，别认成对面太极的。他们也有人姓司马，不是人人都一样。
y|我还不至于连衣服都认错。
th_bro~amused|你刚才把我的护腕套反了。
n|你低头，把系带从掌心翻到手背。师兄笑了一下，笑完又按住右膝。
th_leader|青序六十人，正序二十八。五位返真上座，不下场抢他们的序。
y|榜上那些人……
th_leader|这是六门内的旧会。你先把明日叫到的名字听清。`);fact('th_closed');
choose('first_morning',[
 ['promise','答应回来把每一场亲眼看到的讲给师兄。','promise = true',`y|你不能到场，我回来讲。看不懂的，也照实讲。
th_bro~intent|别只讲高手。说说你第一场，哪只脚先乱。
y|还没打就咒我？
th_bro|不乱也讲。那我更要听。`],
 ['quiet','今晚先睡，不许自己临时多练。','promise = false',`y|我再练到天亮，明日只会多个打哈欠的人。
th_leader~amused|总算有一句像练过二十年的。
n|你吹了灯，黑暗里仍听见师兄解开又绑紧药布的声音。
y|有事叫我。我睡得未必着。`],
]);
part('first_morning','th_stone','th_shen,th_huo',`n|藏云台三面石壁、一面临谷，云往上涌。长棚前旧木牌很小，没有山外大会的旗阵；报帖声从石坪另一边传来。
n|你坐进武当青序十人的席里。太极认得四个，八卦三个；昆仑一张脸也叫不出名字。
n|偏瘦的人靠昆仑边坐，旧剑鞘放得很静。武当白发老人掰核桃，叫出霍停云，三十三，十四入白石谷，最早跟陆寒石。
th_walnut~amused|六年前见过，不一样了。现在多强？不知道。
y|您不是见过？
th_walnut|六年前的你，同今日一样？
n|你闭嘴，掌中汗却松了些。正要再看，八卦棚那边有人先笑了。
th_shen~amused|看他没用，第一场跟你打的是我。
y|陆青珩。刚补进来。
th_shen|沈照微。补进来的人也要占一个位置，你别先替我让。
n|八卦棚里有人剥胡桃，说起她二十二岁改师父旧步的事，笑声连成一片。
th_shen~sharp|师叔。
n|剥胡桃的老人立刻埋头。你掌心的汗忽然没那么凉了。`);
choose('fache_open',[
 ['tease','低声问她：胡桃好吃，还是改步好玩？','shen_open = true',`y|他们笑得这样热闹，你改步的时候也笑？
th_shen~amused|我师父追着打我的时候，我可忙着跑。
y|所以练成了这套？
th_shen|你上来试试，就知道是不是光会跑。`],
 ['bow','认真行礼，请她不必顾及替补的面子。','shen_open = false',`y|既然进了场，按真本事来。
th_shen~intent|好。待会儿你若被绕晕了，也不算我欺负你。
n|她把袖口收齐，脚跟却没有停在你预想的那条线上。`],
]);
writeLayout(w);
part('chase','th_stone','th_shen',`n|第一掌落空。你跟上半步，她已经切到右外；你转肩，她又从原先的空处穿走。
n|几次相接，手里竟一下也没真碰到她。你想快，她的影子就更像水。
th_shen~intent|刚才说不让，你追得倒客气。
n|右肩发紧，你还有一口力。追人还是守路，已不能同时做。`);
choose('centre',[
 ['rush','再追一个身位，逼她露出停步。','strain = true',`y|总得有落地的时候！
n|你探手，她忽然不绕，掌心已到胸前。你急收半步，肩背绷得发疼。
th_shen~sharp|有。你没站在那儿。
n|这一下没把你打倒，却把那口急气打散了。`],
 ['hold','停下追人，先占住中间。','strain = false',`y|不跟你跑了。
th_shen~amused|现在才想起站住？
n|你没有答，肩沉下去，让她下一步要经过的地方先变窄。
n|她第一次稍顿，随即直进。胸口仍挨了一下，能感觉到距离了。`],
]);
part('centre','th_stone','th_shen',`n|你揉了一下胸口，重新占中。她仍比你快，你便不再抢着碰到她的人。
n|第一百零二手，她封你肩，你脚下一错，以肩抵入；她的手也停在你颈侧。
th_shen~calm|你先。
y|先了多少？
th_shen|半息。够记这一场。
n|判手报胜，你才发现自己的手在抖。沈照微没有摊手争，她只是把刚才那条路又走了一遍。`);fact('th_first');
choose('after_first',[
 ['admit','承认自己仍在抖，不把胜场说得轻松。','honest = true',`y|我以为赢了会稳一点。
th_shen~amused|等你抖完，我还要问那一下肩。
y|现在问也行，反正我手暂时没别的用。
n|她笑出声，伸手指你仍在抖的袖口，随后把自己的脚又摆回第一步。`],
 ['shield','把手藏在袖里，说下次再打过。','honest = false',`y|下一场再见。
th_shen~sharp|好。袖里那只手也一起带来。
n|你脸热了一下。她没再追问，转身去看别人的场。`],
]);
part('after_first','th_guest','th_bro',`n|你回客舍，门槛上摆着一双朝外的鞋。师兄已把药换过，护腕留下了汗的颜色。
th_bro|哪只脚先乱？`);
iff('promise',`y|答应回来讲的。先说丢人的：我追她追得什么也没碰着。
th_bro~intent|然后呢？别从赢的那手开始倒着吹。`,`y|我赢了一场。
th_bro|我听说了。没听说你怎样赢。
n|他将饭碗往床边挪了挪，等你坐下。你张了两次嘴，还是先从追着她转的第一掌说起。`);
choose('ming_open',[
 ['demonstrate','拿护腕摆出双方的脚位，把失败也讲全。','shared = true',`y|这块是我。这块是她，先别动——不，她已经不在这儿了。
th_bro~amused|那你该摆六块。
n|他伸手挪了一寸布角。膝上不能做的步子，在床沿一点点摆出来。`],
 ['limit','说胸前挨了掌，今晚先养气，不复盘。','shared = false',`y|我怕讲着讲着，又忍不住去院里试。
th_bro~calm|那就先吃。你不能把每一场都压到今晚。
n|他把一碗尚温的饭推过来。你捧着碗，没再起身比那一下，先吃了一口。`],
]);
writeMing(w);
part('supper','th_night','th_xie,th_sima,th_ming',`n|夜里，谢临川在侧院重走白日那三剑。司马承一路过，站住看了一回。
th_sima~calm|你第六十招以后太想收。
th_xie~sharp|你打过他？
th_sima|没有。看得出来。
th_xie|那来。
n|原说只试两手。到二十余招，院门已经围上人，谁也没先收。
th_ming~amused|让一让，汤端不进去了。
n|明澄端着碗站在门边，并没有急着喝。沈照微已蹲到墙上，冲你腾出一点位置。
th_shen~amused|你白天追我，晚上看人追。划算。
n|院中脚步越来越密，你看见一片竹叶被剑风切下来。`);
choose('sixty',[
 ['tray','替明澄拿住汤碗，留门口一条退路。','soup = true',`y|我端着。你站门边，剑再过来，至少别烫着人。
th_ming~amused|你这理由听着，比我想看完要像样。
n|你把汤放到背风的矮台，顺手挪开门前的小凳。
th_ming|只是别指望他们领情。现在谁也不肯先停。`],
 ['watch','留在墙边，看谢临川越来越快的剑。','soup = false',`y|刚才败的那一剑，他还在找？
th_shen~intent|你问他去。我只看今晚这一场。
n|你险些把白天听来的评语套上去，又咽了回去。
th_shen|看不懂可以慢慢看，别急着替他们判。`],
]);
part('sixty','th_night','th_xie,th_sima,th_guestelder',`n|六十招，谢临川更快，司马承一更稳。屋檐下嗑瓜子的前辈终于出了声。
th_guestelder~sharp|再打下去，想不想让我给你们记一场？
n|两人同时收住，剑尖离开对方的衣襟。
th_guestelder|明天还上场。真想在这儿分生死，我替你们找块远点的地。
th_sima~amused|不劳您搬椅子。
th_xie~uneasy|没到那一步。
th_shen~amused|那谁赢？
th_guestelder|汤凉了，谁也没赢。`);
choose('after_night',[
 ['no_result','承认自己也想看，别把停手全推给他们。','night_honest = true',`y|我也没叫停。刚才还嫌墙头不够高。
th_xie~sharp|你们倒看得开心。
y|开心。后来见竹叶下来，才想起明天还要见你们上场。
n|谢临川将剑鞘靠上墙，接碗时碰得沿口一响。他低头喝了一口，仍盯着院里刚才站过的位置。`],
 ['challenge','笑问明日正式场能不能也留一口汤的工夫。','night_honest = false',`y|明日打完再争，先把这碗喝了？
th_sima~amused|你是怕没热闹看，还是怕碗砸了？
y|碗是借的。热闹不收钱。
n|谢临川哼了一声，还是接过碗。`],
]);
part('after_night','th_night','th_ming,th_shen,th_xie',`th_ming|白日我赢了他，刚才也有点想看他在别人手里吃亏。
th_xie~sharp|你倒肯说。
th_ming~amused|不说，你也看出来了。
n|明澄把碗里的葱拨到一边。谢伸手指他破开的袖口，和尚把那只袖子往身后一藏，又笑了。`);
iff('soup',`th_ming|多谢替我守碗。下回你若想试，我也替你端。
th_shen~amused|听见没有？赢明澄还太远，先赢到有人端汤。`,`th_shen|墙头坐得舒服？下回换你在下头，我带汤来。
y|至少今晚没替谁算胜场。
th_xie|那就好。真要记，我自己打。`);
iff('not xie_room',`th_xie~intent|你要问第三剑？先站远点。
n|他把剑停在尚未伸足的地方，用空手指给你看明澄已贴近的位置。你原想追问怎样补赢，见他还在重摆，便只按自己看见的距离问了一回。
th_xie|我还没想好怎么接。你先让一让，我把第三剑再走一次。`);
choose('huo_open',[
 ['practice','约沈照微轮战后再拆那半息，不约让招。','rematch = true',`y|正式的归正式。打完你若还愿意，我们再摆一遍。
th_shen~intent|愿意。你别因为先赢一场，就怕下一场没了脸。
y|现在就知道丢脸，比届时强。
th_shen|明日见。`],
 ['ownwork','不另约私试，回去练自己的起手。','rematch = false',`y|我得先把今日看清的练稳。不能见谁都欠一场。
th_shen~calm|也好。正式场上我仍找你。
n|她跳下墙，没有因为你拒了私约而收起明日的认真。`],
]);
writeHuo(w);
part('round_open','th_round','th_sima',`n|三轮六十取二十四，再取十二，后来取六。你已输过一场，司马承一前面四战全胜。
n|轮到你对司马承一。你还记得夜里他越打越稳的样子，站进场时，背上先绷了起来。
th_sima~amused|{soup:我今日没碗在你手里，别客气。|今日不用坐墙头。过来，我也想看看你那一下。}`);
choose('sima_result',[
 ['patience','不催自己抢胜，守过前几十手再找机会。','measured = true',`y|那我慢一点，不算客气。
n|你压住追人的冲动，挨过他几次牵引；机会没有马上来，呼吸却还在自己身上。
n|一百手以后，你才敢让步幅略大一点。`],
 ['force','想起夜里那阵剑声，主动抢他半步。','measured = false',`y|看了一夜，总得试点真东西。
n|你抢进去，没能把他带乱。右肩的紧又浮上来，只好一寸寸收回那半步。
th_sima~intent|你看见我稳，也别以为我不会先动。
n|这一场比你想的长。`],
]);
part('sima_result','th_round','th_sima,th_shen',`n|第二百一十八手后，你终于赢过司马承一。两个人喘得都没空接夜里的玩笑。
th_sima~calm|这回归你。先容我喘匀，刚才你等的那一下，我还要问。
n|轮战再对沈照微，她没有沿用第一天的退路。
th_shen~intent|你以为我还站在原来的半息里？
n|你想守住中间，她先把你要占的那一点引开。等你觉出脚底空了，她已到你另一侧。
n|这一回，你败。`);
iff('shen_open',`th_shen~amused|胡桃和改步，你现在觉得哪样好玩？
y|胡桃至少不用我追。
th_shen|下回借你一袋。今天这一步可别拿它抵。`);
choose('after_loss',[
 ['credit_shen','认她这次改了路，问她从哪里看出你的习惯。','respect_shen = true',`y|不是我第一场赢得侥幸，也不是你这一场占便宜。你看出我下一步了。
th_shen~calm|你肯这么问，我才能答。你守中之后，眼睛总往右外看。
y|我以为自己藏得挺好。
th_shen~amused|嗯，藏在眼睛里。`],
 ['sulk','承认不服，先离场，留一点冷静的工夫。','respect_shen = false',`y|我知道这回输了。现在不想立刻听自己哪里错。
th_shen~sharp|那就等你想听。别回去把我的那一下改成你自己滑倒。
n|你点头，把到嘴边的理由咽下去。她也没追过来替你高兴。`],
]);
part('after_loss','th_guest','th_bro',`n|你回到客舍，护腕放在掌心，输了那场反而比赢时更难讲。
th_bro|你今天坐了多久？
y|你怎么不问输赢？
th_bro|别人报得响，我在这里也听得到。
n|窗外正报霍停云一百七十一手先明澄。你听见“先”字，胸口又缩了一下。`);
iff('care',`th_bro|你给我换过的那盆水，今日我自己够到了。下山不用你背。
y|还没问你要不要背。
th_bro~amused|那就当我先赢你一句。`,`th_bro|护腕用得还合适？
y|系带有点磨。
th_bro|你一直绑得太紧。它不是替你把输赢攥住的。
n|他伸手替你把结松了一扣。`);
choose('order',[
 ['keep_promise','把输了的一场也从第一步讲给他。','kept_promise = true',`y|{promise:我前一回答应讲，是还不知道自己会输得这样难受。|这回我想从头讲，自己也还没想清。}
th_bro~intent|鞋给我。先摆第一步。
n|你把两只鞋摆到床前。这次没有跳过被引开的那一步。`],
 ['tomorrow','先问他的膝伤，今晚不复盘，明日留一张图。','kept_promise = false',`y|今晚说不清。我画在纸上，明日你挑错。
th_bro~intent|可以。但别把纸留在枕下，自己走了。
n|你从行囊取出纸，压到最上面，没有说一句很远的保证。`],
]);
part('order','th_youngorder','th_shen,th_ming,th_huo',`n|青序最后列出六人：霍停云、明澄、谢临川、司马承一、陆青珩、沈照微。
th_shen~sharp|你赢我一场，我赢你一场。册子还让你在前。
y|你不是要找写册的人算账吧？
th_shen~amused|找你。三年，先记着。
th_ming|记得饭也约上。再端汤，我想要一碗热的。
n|门分不是这六人的排法：昆仑十八，少林十七。你若只数眼前几个人，便把别的场都抹去了。`);fact('th_order');
choose('old_watch',[
 ['ask_huo','问霍停云：你想赢到哪里才算够？','huo_question = true',`y|青序第一拿到了，你会松口气么？
th_huo~uneasy|会。也还想看正序。
y|看完更想打？
th_huo|看完再说。我如今说的，多半不准。`],
 ['ask_ming','问明澄：只差一个先字，会不会不甘心？','huo_question = false',`y|你刚才还笑，现在呢？
th_ming~calm|不甘心。笑又不耽误不甘心。
n|他把空碗放稳，指了指正序那边。
th_ming|先看。那边有些人，连不甘心都比我们练得久。`],
]);
writeOldWatch(w);
part('chestnut','th_old','th_murong,th_chensima',`th_chensima|腿又不舒服？
th_murong~sharp|不许把刚才那一场往腿上算。
n|一百四十九招，司马沉岳胜。现在两人坐得很近，栗糕只剩一块。
th_chensima~amused|我还没说。
th_murong|你一张嘴，我就知道你要说什么。
n|慕容怀真把那块糕掰开，较大的半块塞到对方手里。你忽然不想拿“胜者让着败者”解释这一下。`);
choose('old_final',[
 ['plain','只问糕还有没有，不替任何人解释旧伤。','plain = true',`y|两位前辈，弟子只问一件：后厨还有糕么？
th_murong~amused|有。你若说来看剑，其实来问糕，倒很诚实。
th_chensima|拿两块，别又替我们掰。
n|你记住后厨的方向，也记住别人的伤不一定等着你的宽解。`],
 ['compare','把青序和正序的败场并排记，不写旧伤借口。','plain = false',`y|我也输了给沈照微。她换了路，不是我忽然变成另一个人。
th_murong|那就写她换了路。写别人，也照这样。
n|你把纸上一个“或因腿伤”划掉，保留第一百四十九招。`],
]);
writeOldFinal(w);
part('six_open','th_old','th_huo,th_zhang',`n|正序最后陆栖真居首，季闻鹤、慧觉、张玄岳、法舟、司马沉岳依次列后。
n|临散前，霍停云走到张玄岳面前，问一场手。他不是要把青序第一换进正序，只想亲自知道。
th_huo~intent|请前辈十手。
n|第一手你还能跟上。第四手，霍的剑忽然像离自己远了半步；第六手，他停。
th_zhang|第四手已经没有原先那条路。
th_huo~uneasy|弟子到了第六手才知道。
n|霍没有把剑再抬起来。你听见半寸，却说不出是哪一个半寸。`);fact('th_six');
choose('mu_front',[
 ['public_question','承认自己更早便看不懂，请霍说第一手在找什么。','open_question = true',`y|你第四手失路。我第一手就在追剑尖，能先从那里问么？
th_huo~calm|我想先把他带到右边。他没过去。
y|我当时以为他退了。
th_huo|我当时也这样以为。
n|这句话让问题落到一只脚上，却没有让你忽然懂完那六手。`],
 ['private_question','不围住霍追问，把疑问留给自己和同门。','open_question = false',`y|我先记着。不把刚听见的“半寸”当成已经会了。
th_huo~calm|我也要记。
n|他蹲下，把场边一块被踩歪的小石放回。你留给他的安静，比再一句佩服具体。`],
]);
writeMu(w);
part('after_six','th_steps','th_shen,th_ming,th_sima',`n|封岭十七日将尽，客舍门口全是绳结、箱子和没吃完的干粮。你从人堆里听见有人争下回谁先请饭。
th_sima~amused|三年后，别又说没准备。
th_shen~sharp|是跟我说，还是跟青珩说？
th_ming|先说饭。我不想三年后还端着凉汤。
n|你手里的纸有第一场脚位，也有正序看不懂的空白。师兄的行李尚在屋内，你自己的路也还没定。`);
iff('rematch',`th_shen|你约的复手，我记得。回山前先说来不来，不占你的正式序次。
y|{respect_shen:也不拿第五第六堵你。|上回说暂时不想听，不等于把先前的约算没了。}
th_shen~intent|{respect_shen:堵不住。你已经试过。|那就当面说。我今日也有自己要找的人。}`,`th_shen|你没欠我一场私打。正式的账，三年后再说。
y|那我也别欠一封没地址的信。写哪里？
n|她接过纸，在留白的边上写下能收到信的地方。`);
iff('huo_question',`th_huo~intent|回山以后，你第一场的起手，画一页寄我。
y|我追着沈照微跑那一场？你看过了。
th_huo|有一面没看见。一页，多了先不看。
n|他把自己起手的两步画在纸背，画到第二步停了很久，才把能收信的门人名字写上。`,`th_ming~intent|你问我甘不甘，我还是不甘。回去前再找霍试半晌，不记青序。
y|还打一百七十一手？
th_ming~amused|不数。数到一百，我又只顾着想能不能撑过上一回了。`);
choose('last_pack',[
 ['together','留下半日，与同辈复手，再陪受伤师兄下山。','future = 1',`y|今日不抢早路。我还有半日，够把两件答应的事做完。
th_ming~amused|那我把汤先放下，省得又没人端。
th_sima|我来。你们先把昨日那一下摆出来。`],
 ['letter','先陪师兄回山，把不懂的留作自己的课业，并写明回信之期。','future = 2',`y|这次不留下。我想先练清自己看见的，也该把师兄带回去。
th_shen~calm|{rematch:那今晨这一次取消，我另找人。改约也写清，别把先约过的略掉。|不来就写不来。别等三年才让人猜。}
y|回山一个月内写第一封。没练明白，也写没明白。`],
 ['guidance','将半日留给张玄岳的一炷香指点，请同门先整理行李，午后仍同师兄下山。','future = 3',`y|同辈这一回我不在。问前辈也只问眼前这一脚，不求替我补完穆宗主的剑。
th_sima~intent|好。三年后另约，我可不因你听过前辈就少问一场。
n|你把时辰与地点写在纸上。半日只有一回，错过的复手不再另算自己也到过。
n|{rematch:你当面将原约改去问张。沈没说无妨，只答自己先走；那半息今天不拆了，你得在信里把改约也说清。|你没另约成沈这一回，也不拿一句同辈再见替她许下今天会等。}`,'front_page'],
]);
part('last_pack','th_steps','',`n|回客舍之前，你先把今日去处与答应的人交代清。`);
out.push('{\n- front_page and future != 3:');stage('th_steps','th_zhang');say(`y|前辈留的一炷香，我今日不来了。{future == 1:改去同辈那里复手。|先陪师兄回山。}
th_zhang~calm|知道了。我照自己的时辰走。
n|张收好那页排过时辰的纸，没有把这一回说成往后随时可补。`);out.push('}');
stage('th_guest','th_bro');say(`n|你推开屋门，师兄已把衣物扎好，护腕压在最上头。同门答应在第一处宽石阶接箱；师兄只提药包，伤膝不替你接重的。
th_bro|还我？还是再借一程？`);

iff('kept_promise',`y|先还。{promise:答应讲的讲了。|输了那场，我也从头讲过了。}一起回去的事，还得把行李交清。
th_bro~amused|谁答应让你背了？你先把门槛边的箱子抬开。`,`y|先还。那张补过的图收好，回去再把改的那一脚真走给你看。
th_bro~calm|纸我收着。先把今日的行李交清。`);
iff('strain and not measured',`n|你抬箱时右肩一紧，只好放下换手。早两场的急，没因为说了几句明白话便消失。
th_bro~sharp|你拿轻的。我腿伤，不是连眼也坏了。`,`n|箱底离开地面，你先试了试肩背才站直。师兄把自己的药包拎起，没有把所有重量都交给你。`);
choose('ending',[
 ['carry','{strain and not measured:右肩已经发紧，仍接重箱抬到第一处交接再换人。|先接重箱到第一处交接，只把药包留给师兄。}','carried = true',`y|我先到宽石阶。同门在那里接，不让你拿伤腿替我换。
th_bro~calm|累了就原地放，别非要撑到他说好的地方。
n|你把箱带松了一格。{strain and not measured:右肩仍紧，这一段也得用它承重。|箱子提起，肩背暂时还能稳住。}`],
 ['share_load','叫来同门轮换抬箱，自己先去认石阶。','carried = false',`y|让同门从屋门就接。我去认石阶，不等走到宽处才换。
th_bro~amused|我先跨门槛，你别只顾看石阶，把门替我关了。
n|门外同门应声进屋，先接住重箱。你空出手开门，沿石阶查看哪处能落箱，再回来扶师兄过门槛。`],
]);
part('ending','th_steps','th_shen,th_bro',`n|六份旧录归各门，没有给你单独多开第七份。下山之前，你把自己写过的纸重新折好。`);
out.push('{\n- future == 1:');
out.push('{\n- rematch and respect_shen:');
stage('th_leavepractice','th_shen,th_sima');
say(`n|复手那半日没有报胜负。沈照微先摆第一场，你摆第二场，各自指认自己没看见的那一步。
th_shen~intent|你看我的脚，我看你的眼。别又同时抢着证明自己。
y|那先只走步。
n|你们把剑放下。{strain and not measured:右肩仍紧，沈只让你把那只脚摆回去，手不追她。|沈把第一场收掌的位置再摆给你，这次先停在那里，等你看清两个人谁先到。}`);
out.push('- else:');
stage('th_leavepractice','th_shen');
iff('rematch',`th_shen~intent|你今天不拆那半息了？
y|先同司马摆那半步。早先约了你，是我改；不让你等在这里。
th_shen|好。我找明澄，三年后的正式场仍记着。`,`n|你先前没另约沈照微，也不临到散席就叫她把半日腾给你。`);
stage('th_leavepractice','th_sima');
say(`th_sima~amused|我可以。不过先说好，还是不记场。
y|好。{measured:先拆你带我转出去时，我哪只脚没能收回。|先拆我对你时抢的那半步。}
n|司马承一把箱子挪到墙根，留出刚好两个人的地方。{rematch:沈照微去找明澄，不在这里等你；三年后的正式场仍是另一回事。|沈照微已先行下山，告别时约的是三年后的正式场。}`);
out.push('}');
iff('honest and night_honest',`th_ming~amused|这回抖不抖？
y|抖。端汤和端剑，看来得分开练。
n|院里有人笑，明澄把新端来的热汤往外移了移。`,`th_sima~intent|你这回问得比第一日慢。
y|第一日急着赢。今天也想，但先问清楚。
n|司马承一让你再走一遍，停在你刚才想省略的地方。`);
function shoulderAftermath(){iff('strain and not measured and carried',`n|还没到交接的宽石阶，右肩的紧已变成刺痛。你就地放箱，叫同门来接；这次没有再撑，前一段承重却已经压在两场急用的肩上。回山后，你有一个月不能抬剑。
th_bro~sharp|我坐着看，你练脚下。两个人的伤都别假装好了。
y|没好。那今天不抬剑。`,`n|{carried:到第一处宽石阶，同门接过重箱。|同门从屋门接去的重箱先到宽石阶，你过去查看下一段。}师兄拎着自己的药包，慢慢走来，没有拿伤膝替谁接班。`)}
stage('th_steps','th_bro');shoulderAftermath();
stage('th_home','th_bro');
iff('huo_question',`n|回山第七日，你寄出霍要的那一页，写明哪一步还不能试。他寄来的纸上也有一处留白，回函没替谁把路补全。`);
end('th_company','回山后，你和师兄把这半日续成两个人能做的练习。下一届的约不保证再赢，却有具体的人、有收信的地址，也有需要你真正到场的一天。');
out.push('- future == 3:');
go('guidance_trial');
out.push('- else:');
stage('th_steps','th_bro');
say(`n|你没有参加那半日复手。到山下时，院里那一场大约才开始；你确实错过了，不能靠一封信把自己也写成在场。`);
shoulderAftermath();
stage('th_home','th_bro');
iff('open_question',`y|信先写第一手。我问过他，也还是没看全。
th_bro|那空着。回去我们试。
n|你把“六手”写在纸边，下面留了六处不同的空。`,`y|我给沈照微写信，也给自己留一张。不懂的地方，不从别人的评语里抄。
th_bro~amused|记得落款。屋里如今只有一个陆青珩，信可未必。
n|你把名字写正，没有把第五名添在后面。`);
iff('huo_question',`n|给霍的信另夹了一页，画的是你追人的起手，不是那一百零二手的最后一下。`);
end('th_letter','一个月内，你寄出第一封信，写清练到哪里、哪里仍错，也写这半日为何先走。信封上是沈留下的地址，三年后的再会仍需到时再问。回信到的那天，师兄将它放在你练脚的空地旁，等你先收住这一步。');
out.push('}');
part('guidance_trial','th_guidanceyard','th_zhang',`n|一炷香，张没问你第五，先叫你把纸上那只脚真放到地上。你一转，原想用来回身的地方，恰被自己前一步挤住。
th_zhang~intent|图上能挪，脚下先得让得出。
n|张让你停在将转未转的地方。香还在烧，你得先选怎样用这一小段工夫。`);
choose('guidance_continue',[
 ['guidance_repeat','请张仍站原处，自己退回起手，再真走一次。','guidance_repeated = true',`y|您别替我让。我从前一步重走。
n|你少进一点，再回身，脚后终于空出原先挤住的地方；手却还追旧图里的落点。
th_zhang|脚有路了。手还要自己找，今日不替你接完。`],
 ['guidance_mark','先把脚下两处位置画准，不急着连第二次，留下能回山验证的图。','guidance_repeated = false',`y|我先认清是哪一步挤住，不连着走给您看好看。
n|你将两脚落处画到纸边，请张只认自己刚才真实站过的位置。第二次没走，不在旁边写已经会了。
th_zhang|带回去，照这个先试。纸上留得出，脚下还不算。`],
]);
part('guidance_continue','th_guidanceyard','th_zhang',`n|你收起纸，不再把穆那一剑添到自己的动作后头。`);
iff('ask_limit',`n|正式场后你向他比过三处，这一回他还记得你那一下。先前真站过的半步，如今才有了能接着问的一点。
y|那时以为手还能去，没想到脚已经把自己封住。
th_zhang|今日看见这里。下次不一定同一处。`,`n|你没在第六十四手后当场试过，张从最普通的回身问。纸上空白还多，先补这一处，其余留待你回去试。
y|原来先问自己站不站得进去。
th_zhang|还得真试。问明白不等于已经能走。`);
say(`n|香尽，张还有自己的事，准时收问。你没有多求两招，也没有从这一炷香拿回一场同辈复手。`);
stage('th_steps','th_bro');shoulderAftermath();
stage('th_home','th_bro');
say(`n|回山后，你给司马的信写明那半日不在，另画了试给张看的回身。后来回信到了，他只圈出你图上的落脚处，约再见时真接一次。
th_bro~amused|有人肯问，也有人不肯凭一张图夸你。挺好。
y|{guidance_repeated:先前在张面前真走的那回，手还在追旧落点。{strain and not measured and carried:手还要歇，今日先看脚下。|你先看手与脚接在何处。}|第二次还没走，图在这里。我先只试脚下，你看哪只脚又挤住。}`);
iff('huo_question',`n|第七日，霍要的那页也寄出，仍是追沈时的起手，不拿张刚指过的回身替换他要看的那一面。{rematch:给沈的信另写原约怎样取消，不把改约藏在听指点的热闹后面。|给沈的信只说今晨去了短问，不虚写她原本在等。}`);
end('th_guidance','得到一炷香，错过同辈一场。你带回的不是一招越级的剑，而是一处可以由自己反复验证的回身；下一次见面，仍要将脚真放到别人来手之前。');
const vars={guidance_repeated:false,layout_fast:false,layout_draw:false,ming_distance:false,xie_room:false,huo_feet:false,read_stop:false,old_unknown:false,half_distance:false,four_breaths:false,old_stop_plain:false,front_page:false,meal_question:false,care:false,promise:false,shen_open:false,strain:false,honest:false,shared:false,soup:false,night_honest:false,rematch:false,measured:false,respect_shen:false,kept_promise:false,huo_question:false,ask_limit:false,plain:false,open_question:false,future:0,carried:false};
writeFileSync('story/taihua.ink','// 太华试序：原典锁定历史，玩家改变承诺与相处\n'+Object.entries(vars).map(([key,value])=>`VAR ${key} = ${value}`).join('\n')+'\n-> called\n'+out.join('\n')+'\n');
console.log(`Taihua authored: ${out.filter(line=>line.includes('# beat:')).length} beats`);
