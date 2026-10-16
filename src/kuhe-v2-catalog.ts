import type {Person} from './campaign-catalog.ts';
const p=(name:string,role:string,detail:string,file:string,size='contain'):Person=>({name,role,detail,portrait:{file:`v6/${file}.webp`,kind:'dedicated',position:'center bottom',size}});
export const kuheV2Characters:Record<string,Person>={
 kh2_kong:p('空劫','少林退位旧人','瘦、赤足，旧僧衣洗白。82胸口浅长痕，之后伤态持续，不将后期旧人看成新来未伤。V2外观ID与旧稿kh_kong是同一个人。','kh-kong'),
 kh2_xuan:p('司马玄极','太极镇门旧人','灰袍白发普通竹杖。150竹杖断后不再持整杖；空手状态也可用于平常授徒或对话。','kh-xuan'),
 kh2_gui:p('孟归藏','八卦镇门旧人','短小微驼，150腹侧中刀后换伤态，213锁刀时只呈脸部近景、不用按伤姿势冒充双手抱臂；倒下后离场。','kh-gui','82% auto'),
 kh2_wusheng:p('无生客','年岁来处不明的黑刀客','外貌四十余、黑发夹白、身材不高，衣非中原常式，极窄黑刀。中性持刀只作身份，不替未知师门补标志。','kh-wusheng','94% auto'),
};
kuheV2Characters.kh2_kong.portrait.looks={wounded:{file:'v6/kh-kong-wounded.webp'}};
kuheV2Characters.kh2_xuan.portrait.looks={empty:{file:'v6/kh-xuan-empty.webp'}};
kuheV2Characters.kh2_gui.portrait.position='center bottom';
kuheV2Characters.kh2_gui.portrait.looks={wounded:{file:'v6/kh-gui-wounded.webp'},locking:{file:'v6/kh-gui-wounded.webp',size:'auto 240%',position:'60% top'}};
