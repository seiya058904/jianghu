import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import {Story} from 'inkjs';

function run(slug:string,overrides:string[]=[]){
 const story=new Story(JSON.parse(readFileSync(`src/generated/${slug}.json`,'utf8')));
 const lines:string[]=[];
 const selectedOverrides=new Set<string>();
 for(let guard=0;guard<10000;guard++){
  while(story.canContinue)lines.push(story.Continue().trim());
  if(!story.currentChoices.length){
   assert.deepEqual(overrides.filter(id=>!selectedOverrides.has(id)),[],`${slug}: requested choice overrides were not selected`);
   return lines.join('\n');
  }
  const found=story.currentChoices.findIndex(choice=>choice.tags?.some(tag=>overrides.includes(tag.replace(/^cid\s*:\s*/,''))));
  const index=found<0?0:found;
  for(const tag of story.currentChoices[index].tags??[]){const id=tag.replace(/^cid\s*:\s*/,'');if(overrides.includes(id))selectedOverrides.add(id);}
  story.ChooseChoiceIndex(index);
 }
 throw new Error(`story did not terminate: ${slug}`);
}

test('罗天海不能亲口回答死后第三代宗主的成就',()=>{
 const text=run('sea',['sr_ask_next_teacher']);
 assert.doesNotMatch(text,/第三代宗主出返真那年[\s\S]*?你只答/);
 assert.match(text,/罗天海一生一百二十余年/);
 assert.match(text,/第三代再出返真/);
});
test('洞玄亲口认今日高，不被下一段旁白否认',()=>{
 const text=run('white-stone',['ws_keep_no_result']);
 assert.match(text,/今日是你高/);
 assert.doesNotMatch(text,/他自己从未这么认过/);
});
test('张守一问身份的选择不能回忆成只问师父如何躺倒',()=>{
 const text=run('xuanmen',['xm_ask_his_name']);
 assert.doesNotMatch(text,/那日我只问了师父在汉水边怎么躺/);
});
test('白石祁玄岳与藏山公不继承另一主角或洞玄的当场行动',()=>{
 const text=run('white-stone',['ws_record_reason','ws_ask_today']);
 assert.doesNotMatch(text,/卷后你添的那一句|你把今日还给我/);
 const other=run('white-stone',['ws_record_next','ws_rest_water']);
 assert.doesNotMatch(other,/你叫我复述那一段|你先递水，再谈比试/);
});
test('伏牛路线不由未走的嵩阳交班变量生成事实',()=>{
 const text=run('seven-questions',['sq_follow_valley']);
 assert.doesNotMatch(text,/接了你交接的那一班已歇下/);
 assert.match(text,/你随慢队回到院时/);
});

test('石惊川在贺门之前只经历胜平，不得提前回忆自己已败',()=>{
 const text=run('longmen',['lm_route_guest','lm_deliver_exact']);
 assert.match(text,/与罗天庆百余合后同时收招，记平/);
 assert.match(text,/看见我只同罗先生打平，还肯照原话递么/);
 assert.doesNotMatch(text,/看见我输这一回，还肯照原话递么/);
});
