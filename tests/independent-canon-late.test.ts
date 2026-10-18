import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import {Story} from 'inkjs';

// Read existing compiled editions only. This suite never regenerates evidence.
function route(slug:string, overrides:string[]=[]){
 const story=new Story(JSON.parse(readFileSync(`src/generated/${slug}.json`,'utf8')));
 const frames:{id:string,text:string}[]=[];let ending='';
 const selectedOverrides=new Set<string>();
 for(let i=0;i<4000;i++){
  if(story.canContinue){const text=story.Continue().trim(),tags=story.currentTags??[];frames.push({id:tags.find(t=>t.startsWith('beat:'))?.slice(5)??'',text});ending=tags.find(t=>t.startsWith('ending:'))?.slice(7)??ending;continue;}
  if(!story.currentChoices.length){assert.ok(ending,`${slug}: missing ending`);assert.deepEqual(overrides.filter(id=>!selectedOverrides.has(id)),[],`${slug}: requested choice overrides were not selected`);return {frames,text:frames.map(f=>f.text).join('\n')};}
  const choice=story.currentChoices.find(c=>overrides.includes(c.tags?.find(t=>t.startsWith('cid:'))?.slice(4)??''))??story.currentChoices[0];
  const id=choice.tags?.find(t=>t.startsWith('cid:'))?.slice(4);if(id&&overrides.includes(id))selectedOverrides.add(id);
  story.ChooseChoiceIndex(choice.index);
 }
 throw Error(`${slug}: route did not terminate`);
}

for(const career of [1,2])for(const lesson of [1,2])test(`CL21: career ${career} lesson ${lesson} recalls its own activity`,()=>{
 const choices=career===1?[lesson===1?'dr_room_let_next_answer':'dr_room_show_limits']:['dr_career_visit',lesson===1?'dr_road_separate_views':'dr_road_let_next_ask'];
 const text=route('dead-ranking',choices).frames.filter(f=>f.id.startsWith('dr_later_teacher_')).map(f=>f.text).join('\n');
 if(career===2){assert.doesNotMatch(text,/让抄手自己答第一句|示范与原战你在场也分开/);assert.ok(text.includes(lesson===1?'位置':'一晚'));}
 else assert.ok(text.includes(lesson===1?'答第一句':'示范'));
});
for(const money of [true,false])for(const plain of [true,false])test(`CL22: money ${money} and interview ${plain} retain separate methods`,()=>{
 const text=route('dead-ranking',[...(money?[]:['dr_ask_road_changes']),...(plain?[]:['dr_ask_in_front_of_heirs'])]).frames.filter(f=>f.id.startsWith('dr_living_benefit_')).map(f=>f.text).join('\n');
 if(money)assert.doesNotMatch(text,/你从接路往来反推回来/);
 else assert.ok(text.includes('接路'));
 if(!plain)assert.ok(text.includes('继业门人'));
});
for(const foot of [1,2])for(const eye of [1,2])for(const hand of [1,2])test(`CL23: reconstructed swords ${foot}/${eye}/${hand} do not invent a different foot choice`,()=>{
 const choices=[foot===2?'dr_hold_bad_foot':'dr_borrow_chase',eye===2?'dr_leave_false_opening':'dr_watch_actual_person',hand===2?'dr_keep_last_hand':'dr_turn_small'];
 const text=route('dead-ranking',choices).frames.filter(f=>f.id.startsWith('dr_shen_three_')).map(f=>f.text).join('\n');
 if(foot===1)assert.doesNotMatch(text,/有一场你把自己的重脚交出去了/);
 if(foot===2)assert.ok(text.includes('左脚'));
 const allFirst=foot===1&&eye===1&&hand===1;
 assert.ok(text.includes(foot===2?'你把承重的左脚真交出去':allFirst?'借追势':'你借追来的力转回右侧'),`foot ${foot}: missing own reconstruction`);
 assert.ok(text.includes(eye===2?'你留空看他真怎样试':allFirst?'等递手':'你先等他真正递手'),`eye ${eye}: missing own reconstruction`);
 assert.ok(text.includes(hand===2?'你留着能停的一手':allFirst?'从刀背细处转开':'你从刀背细处转开'),`hand ${hand}: missing own reconstruction`);
});
for(const box of [true,false])for(const child of [true,false])test(`CL24: box ${box} child ${child} preserves actual work`,()=>{
 const text=route('luhua',[...(box?[]:['lh_finish_box_then_return']),...(child?[]:['lh_walk_to_shop'])]).frames.filter(f=>f.id.startsWith('lh_seventy_odd_')).map(f=>f.text).join('\n');
 assert.doesNotMatch(text,/两件都只做对一半|哪一手不再图省事/);
 if(!box)assert.ok(text.includes('折返'));if(!child)assert.ok(text.includes('药铺'));
});
for(const signal of [true,false])for(const positions of [true,false])test(`CL25: signal ${signal} positions ${positions} names the actual coordination limit`,()=>{
 const text=route('dongting',[signal?'dt_share_channel':'dt_keep_channel',positions?'dt_take_positions':'dt_go_report']).frames.filter(f=>f.id.startsWith('dt_raid_return_')).map(f=>f.text).join('\n');
 if(!positions)assert.ok(text.includes('停试'));
 if(!signal&&positions)assert.ok(text.includes('内外'));
 if(signal&&positions){assert.match(text,/听见你报内，我才知道让哪条艇过/);assert.match(text,/那一声不是替你喊的，要照约定报给谁，都别换/);}
});
const counterexamples:[string,string,string[],RegExp][]=[
 ['CL01','dead-ranking',['dr_ask_what_she_knows'],/三人还没有在沈面前真走一遍/],
 ['CL02','dead-ranking',['dr_face_all_together'],/第二间是|第三间是|三间屋走完/],
 ['CL03','dead-ranking',[],/早年同谢藏锋学过几年剑/],
 ['CL04','jade',[],/你帮院外那些人找到接报处/],
 ['CL05','twelfth',[],/薛直这一败没人作证/],
 ['CL06','twelfth-life',[],/四十多年，最上那一页没换过/],
 ['CL07','qian-kun',['qk_show_half_year'],/你落败后问的第一句/],
 ['CL08','luhua',['lh_follow_plain_turns'],/成都那年你多半站在路边看/],
 ['CL09','luhua',['lh_return_wounded_first'],/有一艘没人来报/],
 ['CL10','luhua',['lh_ask_gap_later'],/赤蛇滩我先抢过近处/],
 ['CL11','luhua',['lh_wait_full_record'],/卢那一段我在门里演得比原样利落/],
 ['CL12','luhua',['lh_share_road_first'],/黑竹寨那趟药，我也只到了问清楚一段/],
 ['CL13','luhua',['lh_thank_other_school'],/我没跟门人讲过/],
 ['CL14','luhua',[],/蒋的篙尖|不是我的篙/],
 ['CL15','luhua',['lh_keep_both_results'],/江陵那一手你收得干净/],
 ['CL16','luhua',['lh_walk_raft_again'],/你没把黑礁错在哪一处告诉他/],
 ['CL17','north',[],/三百零一那半拍你带到茶席上想|你在茶席上又走了一遍/],
 ['CL18','luhua',[],/陈震抬过左肩/],
 ['CL19','luhua',['lh_ask_why_only_once'],/我先觉得是别人不该研究我的手/],
 ['CL20','dongting',['dt_set_people'],/脚不能用/],
];
for(const [id,slug,choices,bad] of counterexamples)test(`${id}: later testimony does not invent or reverse the witnessed event`,()=>assert.doesNotMatch(route(slug,choices).text,bad));

// Each pair's four combinations must remember each choice independently.
for(const [left,right,leftNeedle,rightNeedle] of [
 ['lh_clear_boat_tail','lh_ask_gap_later','先送开挡阿泊后退的人','另约魏隆'],
 ['lh_ask_new_opponents','lh_wait_full_record','不同路数','半年'],
 ['lh_say_what_waits','lh_share_road_first','三处','窄石'],
 ['lh_hold_without_show','lh_ask_why_only_once','守','研究'],
] as const){
 for(const a of [false,true])for(const b of [false,true])test(`independent recall ${left}/${right} ${a}/${b}`,()=>{
  const r=route('luhua',[...(a?[left]:[]),...(b?[right]:[])]);
  const late=r.frames.filter(f=>f.id.startsWith('lh_late_after_')).map(f=>f.text).join('\n');
  if(a)assert.ok(late.includes(leftNeedle),`${left}: missing faithful recall`);
  if(b)assert.ok(late.includes(rightNeedle),`${right}: missing faithful recall`);
  assert.doesNotMatch(late,/我先抢过近处|我眼睛跟着人群走，魏隆那次没有问完|演得比原样利落|我也只到了问清楚一段|别人不该研究我的手/);
 });
}
