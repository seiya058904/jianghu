export function writeNames(w){
 const {part,choose,stage,say,go}=w;
 part('letters','rl_letterroom','rl_gu',`n|清岳掌何东楼，退下来的府榜第一，教三月，你觉得进步快；听说旧南榜剑客进京，又觉得该写信。一封变许多，半年，顾廷安桌上四十七封。
rl_gu~uneasy|川蜀的也送？闭关的也送？
y|送，先送。
rl_gu|这一位八年前去世。
y|这封别送。
n|他终于能把一封移到另边。自荐信又来了，桌边快找不到放茶的地方。`);
 choose('old_spearman',[
  ['rl_check_letter_roads','同顾把人在何处、能否回信逐一核完，晚一晚发，不让四十七封都变成别人必须接的催令。','rl_letter_check = true',`rl_gu~amused|终于问回信往哪儿送了。
n|有一封你亲改“数日传艺”为先问是否方便，仍不保证对方肯来。`],
  ['rl_send_with_no_summons','请顾在尚能寄的信外说明可拒可不回，先送这一批；自己留下逐封读退信。','rl_letter_check = false',`n|顾把不作王府征召写清。送得快，也有收信人辗转问了两处才敢写不教，后来仍得多跑信使。
rl_gu|纸上说不必怕，路上还得有人相信。`],
 ]);
 part('old_spearman','rl_northyard','rl_spearman',`n|有人客气推，有人不回。北地老枪师直写不会教王爷。几年后见到，你请他解释。
rl_spearman|教人得敢骂。殿下脚站歪了。
n|你等下一句，他也等。
rl_spearman~amused|接着得先跪下说恕罪，再骂。太麻烦。
n|你竟被说服。老枪师将手放回膝上，等你自己把那只歪着的脚挪正，才又端起茶。`);
 choose('shen_standing',[
  ['rl_accept_not_teaching','不再追问能否破例，请他把脚歪处再指出便告辞。','rl_no_press = true',`n|他指出，没收你作徒。你出门仍不甘心，却没再留一封叫他必须来京的帖子。`],
  ['rl_ask_his_pupils','问他平日怎么教普通徒弟，听一次真骂与真改的来回，再告辞。','rl_no_press = false',`n|徒弟被他点出同一处三遍，第四遍终于走对。你站着听，发现自己从前常在第二遍便已想换一个人问。`],
 ]);
 part('shen_standing','rl_princeyard','rl_shen',`n|澄江剑翁沈履平真来了。七十多，年轻时列旧南榜二十余，先看你走剑，踢踢脚，叫别练剑。
y|前辈也是剑客，为什么不教？
rl_shen~intent|问题在脚。
n|站、走、转腰，一月。第二十七日，你终于忍不住问何时教真正剑法。
rl_shen~amused|这不就是？
n|一个月后他走。你觉学了许多，又像没学，没多久便跟军中枪将练两月，转青城身法三月，八卦名家一到又换掌。`);
 choose('seven_arts',[
  ['rl_keep_standing_page','把沈那页站步留在最上，今天仍照做一次，再去试自己又想学的枪。','rl_stand_page = true',`n|脚还会歪。新枪来时，那一处不会因为第一页放在最上便自己好。`],
  ['rl_compare_new_routes','将不同教法并排比，想找能接得上的地方，碰不通也请孙再看。','rl_stand_page = false',`n|你取纸时很有把握，真走却先犹豫哪一步该接哪一步。孙尚未说，你自己已乱了一回。`],
 ]);
 part('seven_arts','rl_palace','rl_emperor,rl_sun',`rl_sun|以前是荒，现在是乱。
n|宫里传荣王七师十三艺。兄长赵承暄召你，问会几门、可进青溪了。你说名家都正经，又恼他不懂武。
rl_emperor~amused|朕是不懂。你师父越来越强，离榜没见越来越近，这总看得出。
n|你被说得沉默，仍盘算六大皮毛总该够小榜。顾听完甚至觉得有些道理。
n|真正上路，六处的答复却没有一处肯先替你写进榜。`);
 go('shaolin');
}
