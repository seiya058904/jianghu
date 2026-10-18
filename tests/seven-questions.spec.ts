import {evidencePath} from './evidence-path.ts';
import {test,expect} from '@playwright/test';
import {writeFileSync} from 'node:fs';
import {VNRuntime} from '../src/vn-runtime.ts';
import content from '../src/generated/seven-questions.json' with {type:'json'};
const version='seven-questions-2.0.0',prefix='jianghu:chronicle:seven-questions:v2:';
for(const route of [0,1])test(`Seven Questions V2 actual complete route ${route}: separate witnessed locations and independent save`,async({page})=>{
 test.setTimeout(210000);const errors:string[]=[];page.on('pageerror',e=>errors.push(e.message));
 await page.addInitScript(()=>{localStorage.setItem('jianghu:chronicle:seven-questions:v2:settings',JSON.stringify({speed:0,reduced:true,size:20}));localStorage.setItem('jianghu:chronicle:two-swords:v1:sentinel','first-book-kept');localStorage.setItem('jianghu:campaign:tide:v1:sentinel','v5-kept')});
 await page.setViewportSize({width:route?390:1440,height:route?844:900});await page.goto('/');await page.getByRole('button',{name:'选篇',exact:true}).click();await page.getByRole('link',{name:'一剑两脉 · 门外七问',exact:true}).click();await page.getByRole('button',{name:'展开没有签完的收件单',exact:true}).click();
 const s=new VNRuntime(content,version),scenes=new Set<string>();let choices=0;
 while(!s.frame.ending){await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);await expect(page.locator('#dialogue-visible')).toHaveText(s.frame.text);
  if(!scenes.has(s.frame.stage.scene)){scenes.add(s.frame.stage.scene);if(['sq_chairs','sq_depart','sq_valley','sq_court','sq_court_fire','sq_east','sq_east_record'].includes(s.frame.stage.scene))await page.screenshot({path:evidencePath(`docs/evidence/v6/swords-art-second-${s.frame.stage.scene}-${route}.png`)})}
  if(s.frame.choices.length){const id=s.frame.choices[route].id;await page.locator(`[data-choice="${id}"]`).click();s.choose(id);choices++}else{await page.locator('#advance-button').click();s.advance()}
 }
 await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);expect(choices).toBe(route?26:27);await expect(page.locator('#ending-actions')).toContainText(route?'鹿门一堂课':'下一班接信人');await page.screenshot({path:evidencePath(`docs/evidence/v6/swords-art-second-ending-${route}.png`)});await page.reload();await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);
 expect(await page.evaluate(()=>localStorage.getItem('jianghu:chronicle:two-swords:v1:sentinel'))).toBe('first-book-kept');expect(await page.evaluate(()=>localStorage.getItem('jianghu:campaign:tide:v1:sentinel'))).toBe('v5-kept');expect(errors).toEqual([]);
 expect(scenes.has('sq_valley')).toBe(!route);expect(scenes.has('sq_court')).toBe(Boolean(route));expect(scenes.has('sq_east')).toBe(Boolean(route));
 writeFileSync(evidencePath(`docs/evidence/v6/swords-art-second-browser-${route}.json`),JSON.stringify({actualBrowserInputs:true,externalHuman:false,beats:s.frames.length,choices,ending:s.frame.ending,scenes:[...scenes],errors},null,2));
});
test('Seven Questions work download includes an unvisited final chapter offline on root and subpath',async({browser})=>{
 for(const root of ['http://127.0.0.1:4173/','http://127.0.0.1:4175/Jianghu/']){
  const context=await browser.newContext({reducedMotion:'reduce'}),page=await context.newPage();await page.goto(root+'seven-questions.html');await page.evaluate(async()=>{await navigator.serviceWorker.ready});await page.reload();await page.getByRole('button',{name:'设置',exact:true}).click();await page.getByRole('button',{name:'下载《一剑两脉 · 门外七问》离线资源',exact:true}).click();await expect(page.getByRole('dialog')).toContainText('离线资源已备好');await page.keyboard.press('Escape');
  const s=new VNRuntime(content,version);while(s.frame.id!=='sq_at_the_door_1')s.frame.choices.length?s.choose(s.frame.choices[0].id):s.advance();await page.evaluate(raw=>{localStorage.setItem('jianghu:chronicle:seven-questions:v2:auto',raw);localStorage.setItem('jianghu:chronicle:seven-questions:v2:settings',JSON.stringify({speed:0,reduced:true,size:20}))},JSON.stringify(s.save()));
  await context.setOffline(true);await page.goto(root+'seven-questions.html#play');await page.reload();await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);await page.locator('#advance-button').click();await expect(page.locator('#app')).not.toHaveAttribute('data-beat',s.frame.id);await context.close();
 }
});
test('Seven Questions two locations and injury branches fit seven sizes at 24px',async({browser})=>{
 const targets=[{id:'sq_chairs_1',picks:[]},{id:'sq_valley_map_1',picks:[]},{id:'sq_hui_turn_1',picks:[]},{id:'sq_eighty_one_1',picks:['sq_hold_courtyard']},{phrase:'右臂烫伤，养伤三个月',picks:['sq_hold_courtyard']},{phrase:'腿撞在石棱',picks:['sq_set_relay']}];
 for(const target of targets){const s=new VNRuntime(content,version);while(target.id?s.frame.id!==target.id:!s.frame.text.includes(target.phrase!)){if(s.frame.ending)throw new Error(JSON.stringify(target));s.frame.choices.length?s.choose(s.frame.choices.find(c=>target.picks.includes(c.id))?.id??s.frame.choices[0].id):s.advance()}
  const context=await browser.newContext({reducedMotion:'reduce'}),page=await context.newPage();await page.addInitScript(raw=>{localStorage.setItem('jianghu:chronicle:seven-questions:v2:auto',raw);localStorage.setItem('jianghu:chronicle:seven-questions:v2:settings',JSON.stringify({speed:0,reduced:true,size:24}))},JSON.stringify(s.save()));
  for(const [width,height]of [[360,800],[390,844],[412,915],[800,360],[1366,768],[1440,900],[1920,1080]]){await page.setViewportSize({width,height});await page.goto('/seven-questions.html#play');await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);expect(await page.evaluate(()=>document.documentElement.scrollWidth<=innerWidth)).toBe(true);
   for(const locator of ['#dialogue-panel','#advance-button']){const b=await page.locator(locator).boundingBox();expect(b&&b.x>=0&&b.y>=0&&b.x+b.width<=width+1&&b.y+b.height<=height+1).toBeTruthy()}
   if([360,800,1440].includes(width))await page.screenshot({path:evidencePath(`docs/evidence/v6/swords-art-second-layout-${s.frame.id}-${width}.png`)});
  }await context.close();
 }
});
test('Seven Questions long location choices remain clickable at seven viewport sizes',async({browser})=>{
 const s=new VNRuntime(content,version);while(!s.frame.choices.some(c=>c.id==='sq_follow_valley'))s.frame.choices.length?s.choose(s.frame.choices[0].id):s.advance();
 for(const [width,height]of [[360,800],[390,844],[412,915],[800,360],[1366,768],[1440,900],[1920,1080]]){const context=await browser.newContext({viewport:{width,height},reducedMotion:'reduce'}),page=await context.newPage();await page.addInitScript(raw=>{localStorage.setItem('jianghu:chronicle:seven-questions:v2:auto',raw);localStorage.setItem('jianghu:chronicle:seven-questions:v2:settings',JSON.stringify({speed:0,reduced:true,size:24}))},JSON.stringify(s.save()));await page.goto('/seven-questions.html#play');await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);
  for(const choice of s.frame.choices){const b=await page.locator(`[data-choice="${choice.id}"]`).boundingBox();expect(b&&b.x>=0&&b.y>=0&&b.x+b.width<=width+1&&b.y+b.height<=height+1).toBeTruthy()}
  await page.locator('[data-choice="sq_hold_courtyard"]').click();await expect(page.locator('#app')).not.toHaveAttribute('data-beat',s.frame.id);await context.close();
 }
});
