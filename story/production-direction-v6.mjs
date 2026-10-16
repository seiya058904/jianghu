import {readFileSync,writeFileSync} from 'node:fs';
// Meaning belongs to replaceable script captions, cast focus and timing. Images
// remain independent resources. This never changes the archived v5 screenplay.
export const directionV6={
 north:{nq_too_heavy_2:{camera:'portrait',action:'修椅老人 · 你重'},nq_third_teacher_6:{camera:'portrait',action:'司马衡 · 还想改'},nq_last_tea_1:{cg:'plainTea',action:'旧日茶席'},nq_last_tea_3:{cg:'none',camera:'portrait'}},
 'qian-kun':{qk_slow_questions_3:{camera:'portrait',action:'司马衡 · 慢些看'},qk_late_way_1:{cg:'plainTea',action:'普通茶席'},qk_late_way_3:{cg:'none'}},
 'jade-thieves':{jt_empty_box_1:{cg:'emptyBox',action:'匣中 · 空'},jt_empty_box_3:{cg:'none'},jt_empty_box_6:{cg:'none'},jt_revealed_10:{camera:'portrait',action:'江十七 · 父亲'},jt_revealed_15:{camera:'portrait',action:'沈玉娘 · 名字'}},
 jade:{jd_seventh_2:{cg:'grainMeasure',action:'验过的粮'},jd_seventh_4:{cg:'none',camera:'portrait',action:'灾务官 · 开仓'}},
 sea:{sr_two_centuries_3:{cg:'rigging',action:'船位与缆'},sr_two_centuries_5:{cg:'none'},sr_ninety_seven_13:{camera:'portrait',action:'沧鹤 · 赢完呢'},sr_ninety_seven_16:{camera:'portrait',action:'沧鹤 · 若赢完了呢'}},
 'sea-tide':{st_outer_years_1:{cg:'rigging',action:'绳与帆'},st_outer_years_3:{cg:'none'},st_outer_years_4:{camera:'portrait',action:'外院教头 · 算谁赢'}},
 'two-swords':{ss_token_4:{camera:'portrait',action:'谢知白 · 难道不是'},ss_token_5:{camera:'portrait'},ss_open_boxes_1:{cg:'workingBooks',action:'案头书卷'},ss_open_boxes_3:{cg:'none'}},
 'seven-questions':{sq_eighty_one_8:{camera:'portrait',action:'司马归元 · 这只是我'},sq_three_volumes_1:{cg:'workingBooks',action:'案头书卷'},sq_three_volumes_3:{cg:'none'}},
 'twelfth-life':{rl_fair_seat_3:{cg:'royalLetters',action:'案头来信'},rl_fair_seat_5:{cg:'none'}},
 qingshi:{
  qs_oldknife_1:{cg:'oldKnife',action:'箱底旧刀'},
  qs_oldknife_6:{cg:'none',action:'六十年 · 柄上旧皮'},
  qs_grain_1:{action:'十七岁 · 青石粮仓'},
  qs_road32_1:{action:'三十二岁 · 荒道'},
  qs_seven_2:{action:'第七掌'},
  qs_chop46_1:{action:'四十六岁 · 第三次登门'},
  qs_city92_1:{action:'九十二岁 · 定塞'},
  qs_breach_1:{action:'第三日上午 · 内门'},
  qs_after_4:{action:'后日视角 · 送灵副将'},
 },
 kuhe:{
  kh_bell_13:{cg:'oldPillars',action:'三位旧人 · 来路仍空着'},
  kh_bell_14:{cg:'none'},kh_bell_17:{cg:'none'},
  kh_kong_trial_8:{action:'第八十二招 · 胸前见伤',look:'kh2_kong=wounded'},
  kh_three_old_5:{look:'kh2_xuan=empty,kh2_gui=wounded',action:'第一百五十招 · 弃杖'},
  kh_lock_2:{look:'kh2_gui=locking',action:'双手锁臂 · 不退'},
  kh_bell_4:{action:'钟后 · 来路空着'},
  kh_lock_3:{action:'以身锁刀'},
  kh_lock_6:{action:'退后'},
 },
 'campaign-v6':{
  c_cargo_1:{action:'米袋坠下'},
  c_arena_open_1:{action:'试艺开场'},
  c_storm_choice_1:{action:'回水口 · 两盏灯'},
  c6_v6_wind_1:{action:'风向先变'},
  c6_v6_evidence_1:{action:'亲见与传闻'},
  c6_v6_stay_pay_13:{cg:'timber',action:'裂处松动 · 人已回到地上'},
  c6_v6_stay_pay_14:{cg:'none'},
 },
 taihua:{
  th_ming_close_2:{look:'th_mu=v2'},
  th_fache_close_1:{action:'第四十八招 · 左门收起'},
  th_huo_fifty_three_1:{action:'第五十三招 · 下一剑无处接'},
  th_mu_front_5:{action:'前面少半寸'},
  th_supper_1:{action:'院内试手'},
  th_supper_8:{cg:'nightCompany',action:'灯下 · 门边留路'},
  th_supper_10:{cg:'none'},
  th_six_open_4:{cg:'mountainInquiry',action:'第六手 · 止'},
  th_six_open_5:{cg:'none'},
 },
 longmen:{
  lm_night_private_1:{action:'同夜 · 贺景庭视角'},
  lm_night_private_2:{cg:'longmenNight',action:'灯下 · 两位来客'},
  lm_night_private_4:{cg:'none'},
  lm_morning_trial_1:{action:'次晨 · 回到门人视角'},
  lm_qinghe_yard_1:{action:'旧事视角 · 许重山'},
  lm_qinghe_first_1:{action:'第一刀 · 右肘无处落'},
  lm_qinghe_third_1:{action:'第三刀未完 · 喉前两寸'},
  lm_wooden_1:{action:'秋会来客'},
  lm_wooden_5:{cg:'woodenInquiry',action:'木剑与真剑'},
  lm_wooden_6:{cg:'none'},lm_wooden_9:{cg:'none'},
  lm_nine_1:{action:'剑停以后'},
 },
 dongting:{
  dt_third_step_4:{action:'第一百零六合'},
  dt_raid_return_2:{action:'右肩 · 断索'},
  dt_raid_return_17:{cg:'lakeRest',action:'伤肩固定以后 · 听他自己讲'},
  dt_shore_after_1:{cg:'none'},
 },
 twelfth:{
  qw_paid_1:{action:'四十四岁 · 陪练差事'},
  qw_named_1:{cg:'notice',action:'第十二 · 赵承晏'},
  qw_named_2:{action:'第十二 · 赵承晏'},
  qw_named_3:{action:'第十二 · 赵承晏'},
  qw_named_4:{cg:'none'},
 },
};
export function applyDirectionV6(){
 for(const [work,plan] of Object.entries(directionV6)){
  const path=`story/${work}.ink`,hits=new Set();
  const source=readFileSync(path,'utf8').split('\n').map(line=>{
   const id=line.match(/# beat:(\S+)/)?.[1];if(!id||!plan[id])return line;
   if(hits.has(id))throw new Error(`Duplicate direction anchor ${work}/${id}`);hits.add(id);
   for(const [key,value] of Object.entries(plan[id])){
    if(new RegExp(`# ${key}:`).test(line))throw new Error(`Direction overwrites authored ${key}: ${work}/${id}`);
    line+=` # ${key}:${value}`;
   }
   return line;
  }).join('\n');
  for(const id of Object.keys(plan))if(!hits.has(id))throw new Error(`Missing direction anchor ${work}/${id}`);
  writeFileSync(path,source);
 }
}
