import {writeFileSync} from 'node:fs';
import {createWriter} from './chronicle-writer.mjs';
const w=createWriter('dt_');const {part,say,choose,iff,fact,go,end,out}=w;
part('third_step','dt_memory','dt_liang,dt_zhao',`n|两年前，梁照水四十五岁。你跟着听潮门登上空货船，觉得没了货，脚下该比往常好站。
dt_zhao~calm|空船也还是船。梁先生，请。
n|前四十合，梁的刀没吃亏。五十合以后，他要落的地方，总已有半截篙等着。
n|你刚扶住桅柱，赵崇山又借了这一处。梁第三步没站稳，第一百零六合，肩被铁篙点中，人跌进水里。
dt_zhao~intent|别跟着跳！把船边那根绳递来。
n|赵已经伸篙搭住梁。你手里的绳若缠到脚上，便多一个要救的人。`);
choose('shore',[
 ['dt_check_rope','先解开脚边的圈，把绳递到船沿。','dt_rope_known = true',`y|这里有一圈，先别拉！
n|你把绳绕开，赵崇山借篙把梁拉回船。湿衣压在板上，梁喘着气，先把刀放稳。
dt_zhao~calm|你在岸上还能多打几十招。今日在船上，赢不了。`],
 ['dt_hurry_rope','急着递绳，扯到脚才发现自己也被套住。','dt_rope_known = false',`y|绳来了——等一下！
n|你脚踝一紧，只好坐倒解圈。赵没有等你乱完，已经把梁拉上船。
dt_liang~sharp|先别站。轮到你把自己套住，船上就少一只好手。
n|你听见了，没有把脚边那圈绳踢到别人脚下。`],
]);
part('shore','dt_memory','dt_liang,dt_zhao',`dt_liang~uneasy|我以为前四十合没落下风，后面总能找一刀。
dt_zhao|前四十合，你还在找我。后面你得先找自己能站的地方。
n|你从船沿捞起水，才知道这里没有一块地面会因为空着，就一直等你。
dt_liang~calm|这回认输。篙上那一下，我会记。
n|两年过去，赵崇山自己退席，洞庭十六豪空出一位。不是他败给梁才空出来。`);fact('dt_106');
go('dock');

part('dock','dt_dock','dt_liang,dt_meng,dt_wang',`n|如今梁四十七，孟守川八十四。系舟处多了五个候选人的行李，却只多出一把要议的椅子。
dt_wang~intent|这次能不能也算我一份护船工钱？上回说跟师兄见世面，家里米却没多一碗。
dt_liang|算。你不是来替我添人多的。
dt_meng~sharp|那先把人和绳分好。别一说问席，就连谁守哪条船都忘。
n|一卷好绳刚够拴住两端。汪苇等你分：留作接人的活绳，还是给货舱多绑一道？`);
choose('debts',[
 ['dt_float_ready','给接人的一端留好绳，货舱少装两箱腾出余量。','dt_float = true',`y|活绳留着，先少装。少运的账写我，不从汪苇工钱里扣。
dt_wang~calm|那我先试一回能不能解开。
dt_meng|试。别等人进水以后，才知道绳结是死的。`],
 ['dt_cargo_tight','给货舱加一道稳绳，接人用旧绳另试。','dt_float = false',`y|货路答应过要送足，这道先绑。旧绳拿来，我再查。
dt_wang~uneasy|旧绳短，够不到离船太远的地方。
dt_liang~intent|那就记着短在哪儿。不是查过，就忽然变长了。`],
]);
part('debts','dt_dock','dt_liang,dt_meng',`n|孟守川要去看各船退路，没留下替徒弟的名字多压一块木牌。你问他议席那日坐哪边。
dt_meng~sharp|看归看，我不投自己徒弟。
y|您最知道他的刀，为什么——
dt_meng|也最有理由偏他。你若只想让人夸听潮门，这几日便别替我说话。
dt_liang~uneasy|我年轻时替药老人打过人，第二天整条货路都卡住。师父来问，打完人谁替我善后。
n|他指了指今日船上的绳和米，说那不是离拳脚很远的闲事。`);
choose('old_feud',[
 ['dt_accept_recusal','明确告诉其他候选，孟先生不会投票。','dt_recusal = true',`y|那我照实讲。也不替您暗示其实大家都该看得出来。
dt_liang~calm|你若听见有人借师父的名头许愿，也替我叫住。
n|你把议席那张空凳挪开，没有把它当成尚未坐下的第五票。`],
 ['dt_keep_recusal','不代长辈传话，只负责自己这条船。','dt_recusal = false',`y|我不替您说已经做过的决定。有人来问，我请他当面问。
dt_meng~calm|可以。别笑着不答，让人当成默认就好。
n|你记住这句。少说话也有别人会猜进去的分量。`],
]);
part('old_feud','dt_dock','dt_liang,dt_wang',`dt_wang|他们提黑鱼寨焦定海，说跟您有旧仇，还能一起护船？
dt_liang~uneasy|二十七那年我赢他，落水了还多出半刀。后来他找人截我，我在泥沟含着芦管伏了两个时辰。
y|那还能并船？
dt_liang|师父查出截杀不是寨主的命令。后来被逐的弟子投了赤蛇帮，又杀我门里人，焦也随我们去剿。
n|梁说起赤蛇滩，师父压住鲁魁却险中袖弩，幸得五湖铁桨救下。那年他才知道师父也会死。
dt_liang~sharp|我没说仇一笔勾销。是眼前要挡的那个人，不只靠我一条船能挡。`);fact('dt_recall');
choose('candidates',[
 ['dt_name_tasks','请汪苇把同船的人和分工逐个认清，不只记仇家名号。','dt_names = true',`y|我们今日靠谁接谁，先说。来人不是只带一张门派招牌。
dt_wang~intent|我接落绳，你守舱口。有人换位置，得叫我一声。
dt_liang~calm|这才像要护船。`],
 ['dt_check_boat','先查水面和船身，叮嘱自己别因熟悉就少看一次。','dt_names = false',`y|上回空船都站不住。这回装满，更不能说一直如此就不用查。
dt_wang~amused|那你查左，我查右，不挤在一块说小心。
n|你绕过绳圈，给两人留了一条能互换的位置。`],
]);

part('candidates','dt_trial','dt_jiang,dt_han,dt_zhuo',`n|问席不是一场擂台。五人互试，还要守船、追船、护运。蒋衡先胜梁，梁又胜韩寿山半手，与卓长河两百余招记平。
dt_han~sharp|慢半手，也不是少练半辈子。梁先生下一场若把我那步用去，得用得像样。
dt_zhuo~amused|你还肯收他学费？
dt_jiang~calm|都别闲着说。明日追船，他若先到，我也要看他怎样转弯。
n|候选的船要同时起。陈震带着一捆索，站到你们船边，没有先问刚才谁赢谁。`);
choose('chen_rope',[
 ['dt_share_channel','和陈震先定追船交错时的让路口令。','dt_chen_signal = true',`y|两船错开，谁在外谁先报。不是让赢，是别把后头送货的也拦住。
dt_chen~intent|我报外，你报内。人听清了再转，不拿索响当口令。
n|他让你听了一遍自己的喊声，直到你能隔着风认出来。`],
 ['dt_keep_channel','只守本船，承认还没练熟双船口令，不临时应承。','dt_chen_signal = false',`y|我认得自家绳，没跟您的船配过。今晚不说会，明日交错时我先收。
dt_chen~calm|好。真要我接应，喊清船名，别在水上只喊救命。
n|你把自己的船名报了一遍，让他也能认。`],
]);
part('chen_rope','dt_trial','dt_chen,dt_liang,dt_wang',`n|追船，梁第一个把货送到。汪苇跳上岸，脚底一软，险些把最后一箱也带倒。
dt_wang~uneasy|我没事，先别记我失手。
dt_chen~sharp|你要再装没事，明日守船更没地方站。
dt_liang|先坐。第一船到了，不等于每个人的力都还在。
n|明日还有护运。有人想把少运的箱子今晚补回，也有人已经连握筷子都抖。`);
choose('third_day',[
 ['dt_rest_worker','保住工钱，让汪苇休息，不在夜里补运。','dt_rest = true',`y|你的工钱照领。少的箱我认，明早我还要有个能站稳的同伴。
dt_wang~calm|那我说真话。脚后跟发麻，明早要先试。
dt_chen~calm|试的时候叫我，我看你转身，不替你说一定没事。`],
 ['dt_make_cargo','照原约补运短缺，自己陪汪苇慢慢做完。','dt_rest = false',`y|先别快。少的要补，我跟你做，不让你独自熬。
dt_liang~uneasy|做完再报人。不是做完货，就当你们也完好了。
n|箱子到齐时，汪苇坐在船沿，半天没把鞋穿好。你也没有剩多少力。`],
]);
part('third_day','dt_trial','dt_liang,dt_jiang',`n|第三日再战蒋衡，梁把前两日见过的转步、近身和收力揉进刀里。这一次，蒋没有再把他带回原先那处空位。
dt_jiang~intent|用过的东西，也得接得上。
n|梁没答，脚下让出一线，刀沿着船势换过来。到收手时，两人记平。
dt_liang~calm|前两日的债，今日没有一并抹了。只是这场没再输。
n|你还在听判手，远处忽然传来断绳声。不是下一场叫人，是系着货的船被撞歪了。`);
choose('raid',[
 ['dt_take_positions','先按认过的分工各站一处，不全追向响声。','dt_positions = true',`y|汪苇接落绳！我守舱口！陈先生，听潮门这条在内！
n|能听见的人先应声，你没把还在别船的人也算作已经到了。
dt_jiang~intent|问席停了！先护船！`],
 ['dt_go_report','去最近的旧豪处报船名，让候选停试。','dt_positions = false',`y|货道第二条系舟，船被撞歪，先停试！不是叫人来认谁输了！
n|你报出位置，才往回跑。身后的几名旧豪没有坐等再举一次牌。
dt_liang~intent|汪苇守舱！我来接前头！`],
]);

part('raid','dt_raid','dt_liang,dt_weihu,dt_wang',`n|魏虎踏到船头，另一面是持戟的魏苍。梁喊出两人的名字，叫你别往兵刃之间站。
dt_weihu~sharp|货留下，人滚开！
dt_weicang~sharp|主绳截开！别让后头的船挤上来！
dt_liang~intent|这条船的人先退后舱！
n|刀把近处的路切开。你不是能替梁接魏虎的人，汪苇也不是。岸边一艘接人的小艇只容你带一队过去。
dt_wang~uneasy|左边两个人掉进断缆，主船那边也在退粮！
n|你早上留的绳、昨夜没歇的脚，都已不是纸上安排。`);
iff('dt_float',`n|活绳还在，末端能解。汪苇一拽，够得到离船那两个人。`,`n|旧绳短了一截，末端沉进水里。要接那两个人，艇得更贴近断缆。`);
choose('raid_return',[
 ['dt_save_company','小艇先接断缆边的人，放弃这一批货。','dt_future = 1',`y|先接那两位。货留主船，我不替没到的人说一定能救。
dt_wang~intent|我接绳，你掌艇！
n|小艇转向，货船一角撞裂。你听见木板断开，没有把那声说成东西以后总有。`],
 ['dt_save_cargo','小艇保住主运粮线，请接人的队另行靠近。','dt_future = 2',`y|主运粮线这边！落水的人叫别船来接，报位置，别只喊有人！
dt_wang~sharp|断缆左侧，两人，旧绳够不到！
n|你护住一条粮道，也确实把接人的时机交给别船。没人能替你保证不会晚。`],
]);
part('raid_return','dt_raid','dt_liang,dt_chen,dt_wang',`n|梁照水第七十九招杀魏虎。你听见报数时才知道已走到这里，方才眼里全是艇和断缆。
n|另一船上，陈震右肩中戟，仍抓戟近身，断索锁住魏苍的颈，把人制下。两人的战果没有换到彼此名字下面。`);
out[out.length-1]+=' # mood:dt_chen=hurt';
out.push('{\n- dt_future == 1 and dt_float and dt_rest:');
say(`n|你们把两人接上，汪苇的脚还撑得住。那船货损了，你手里的好绳也断成两截，往后的工钱得慢慢赔。
dt_wang~uneasy|人到了。货的数我跟你一起报，不替你把答应送到的那批忘了。`);
out.push('- dt_future == 1:');
say(`n|小艇靠得更近，汪苇接人时被断缆绊住。别船终于赶到，落水者都被拖回；他回到岸上，再想站便痛得扶住船沿。
dt_wang~uneasy|我站不起来。别替我先说只是吓着。
n|他把这句说清，代价才没有被一声人都回来了盖过去。`);
out.push('- else:');
say(`n|你们保住主运粮线，别船接到落水者。两船转粮时，汪苇脚被拉紧的断缆夹住；你只能先卸这一头，才能把他的脚解出来。
dt_wang~uneasy|别再抬那箱！脚还在下面！
n|你放下粮箱，转船一度停住。最后送成了货，他也得被扶回岸上。`);out.push('}');
iff('dt_chen_signal and dt_positions',`dt_chen~intent|听见你报内，我才知道让哪条艇过。那一声不是替你喊的，要照约定报给谁，都别换。
y|记着。你肩上先别再压索。`,`dt_chen~sharp|我方才分不清谁在喊。你们若要接应，下次先报船，不要等人到了才认。
y|这回没做成的，我写清，不拿后来有人救到抵掉。`);
choose('shore_after',[
 ['dt_help_chen','替陈震固定伤肩，先听他怎样抓住魏苍。','dt_chen_help = true',`y|哪边先松？您说，我照着扶，不替您把戟拔了。
dt_chen~calm|先托这头。刚才是右肩中，不是只破了衣。
n|他能说话，也仍受着伤。你把那一段护船经过按他说的记下，没有装成自己全在旁边。`],
 ['dt_count_people','先核汪苇和落水者，把陈震交给已经到场的医者。','dt_chen_help = false',`y|大夫在这里，陈先生先跟他。我去报还有谁没点到。
dt_chen~intent|去。别拿给我帮一把，就算全船点过了。
n|你照着名字找人，没把最响的两个名字当成整条船。`],
]);

part('shore_after','dt_after','dt_meng,dt_liang,dt_chen',`n|七名旧豪议席，与你争着抬人、捞货的那一阵分开。孟守川在场，却没有举手。
n|四推梁，三推陈。梁四十七岁，第一次列洞庭十六豪第十六。
dt_chen~uneasy|三票。我听见了。
dt_liang~calm|我的四票不是你的伤白受。船上那一段，我会照实讲。
dt_chen~sharp|我自己也会讲。别只让人觉得，你肯替没入的人说一句公道话。`);fact('dt_vote');
choose('repair',[
 ['dt_chen_own_record','让陈震先讲自己那条船，我只补亲眼见的部分。','dt_record = true',`y|您先讲。我没站在那边，不能把锁戟那段讲得比您还懂。
dt_chen~calm|好。你补你的艇。掉了多少货、晚了哪一声，也写。
n|他没有因为你客气就改说三票满意，只把该记的那一段记全。`],
 ['dt_split_accounts','先分清入席记录和赔付清单，不拿一张替另一张。','dt_record = false',`y|这张写谁入席，那张写谁该赔。陈先生的药，不能从没入席那行里扣。
dt_meng~intent|两张都留。你们以后再争，这回的名字也不能改。
n|梁没有在赔付那张后面添第十六三个字。`],
]);
part('repair','dt_after','dt_wang,dt_liang,dt_chen',`n|坏船回不了原样，工钱也不能等榜册写完才问。汪苇把家里要的那袋米放在脚边。
dt_wang~uneasy|我还要回家，明日不能说谁上榜了，我便不用花钱吃饭。`);
iff('dt_future == 1',`dt_liang|这一批货没了。我出一份，你答应过的那份也得留，不由你一句下次帮忙便全算清。
y|我认。先把人回来的日子与赔货的工日分开。`,`dt_liang|主运粮线保住了。受伤的人还要养，工钱照领，别拿大家都指着粮船便把这份略过去。
y|我去陪他养，不拿送成的货替他答应不疼。`);
choose('threeyears',[
 ['dt_set_days','把赔付、照料和代守分别写到具体哪日。','dt_days = true',`y|这几日谁来，哪些钱先到。做不到我提前说，不等人已经到了岸上才没人。
dt_chen~intent|我肩好了也来。到时另算我做的，不拿今天受的伤换一辈子欠着。`],
 ['dt_set_people','先当面问各人愿担哪一份，不替别的门人许工日。','dt_days = false',`y|我先认自己能做的，再问别人。不是听潮门三个字，便谁都有空。
dt_wang~calm|那先问我。我能坐着理索，脚不能用，不是人就全没用了。`],
]);
part('threeyears','dt_three','dt_liang,dt_chen',`n|三年以后，陈震以自己的多年护船与较艺积累，正式入洞庭第十五。梁已在那张榜上，却没把这回说成自己替朋友争到。`);
out[out.length-1]+=' # mood:dt_chen=calm';
say(`dt_chen~calm|这回也把我的名字写进来了。下回拆手，别拿早进三年压我。
dt_liang~amused|会来。今日先把上回那根索拿出来，还欠一次拆手。
n|两人争过同一把椅子，后来坐到同一张榜里。当年的末席与今日的第十五，都不替普通人的日子自动还账。`);
out.push('{\n- dt_future == 1:');
say(`n|你先选的是接同行，便也留下来还那批损货的工债。不是每个新认识的人都愿替你说选得好，货主来催时，你还得自己开门。`);
iff('dt_float and dt_rest',`dt_wang~amused|今天我能搬，不是你再来替我搬。你去认箱子，别又认错一袋米。
n|那根断绳的末端还挂在库门边，接过人，也确实赔过货。`,`dt_wang~calm|脚好了些，仍不能在晃船上站太久。我先理索，等好了再去。
y|我听你的。不替你把这几个月说成一场值得的伤。`);
end('dt_company','你保住同行，也承担没保住货的余日。梁的第十六、陈的第十五是他们的路；你在船边留下的，是一个能追到你的名字和还在做的工。');
out.push('- else:');
say(`n|你保住主运粮线，粮船有人接，也有人没能像从前那样站着领工钱。你按约来岸上换药、理索，不把送成一趟货当成对方该满意的理由。
dt_wang~intent|明日你若来晚，先报。我家的人也要安排出门，不是一直能坐着等。`);
end('dt_cargo','你把粮交到该到的人手里，也把受伤同行的名字留在自己的时日里。那场较艺已经落册，接下来照约出现，仍只能由你自己来做。');out.push('}');
const vars={dt_rope_known:false,dt_float:false,dt_recusal:false,dt_names:false,dt_chen_signal:false,dt_rest:false,dt_positions:false,dt_future:0,dt_chen_help:false,dt_record:false,dt_days:false};
let rendered=w.render();
const woundedStart=rendered.indexOf('=== raid_return ==='),healedStart=rendered.indexOf('=== threeyears ===');
rendered=rendered.slice(0,woundedStart)+rendered.slice(woundedStart,healedStart).replace(/# mood:dt_chen=\w+/g,'# mood:dt_chen=hurt')+rendered.slice(healedStart);
writeFileSync('story/dongting.ink','// 照水刀·问席：34836–35057；集中45/47/50岁，不提前引入沈鹤汀或叶孤舟\n'+Object.entries(vars).map(([key,value])=>`VAR ${key} = ${value}`).join('\n')+'\n-> third_step\n'+rendered);
