import {evidencePath} from './evidence-path.ts';
import {test,expect} from '@playwright/test';
import {writeFileSync} from 'node:fs';
import {VNRuntime} from '../src/vn-runtime.ts';
import content from '../src/generated/two-swords.json' with {type:'json'};
import archived from '../src/generated/two-swords-v1.json' with {type:'json'};
test('Two Swords V2 opening preserves V1 raw auto and slot and links to the playable old edition',async({page})=>{
 const old=new VNRuntime(archived,'two-swords-1.0.0');while(old.frame.id!=='ss_token_4')old.frame.choices.length?old.choose(old.frame.choices[0].id):old.advance();const raw=JSON.stringify(old.save());
 await page.addInitScript(raw=>{if(!localStorage.getItem('jianghu:chronicle:two-swords:v1:auto'))localStorage.setItem('jianghu:chronicle:two-swords:v1:auto',raw);localStorage.setItem('jianghu:chronicle:two-swords:v1:slot1',raw);for(const version of ['v1','v2'])localStorage.setItem(`jianghu:chronicle:two-swords:${version}:settings`,JSON.stringify({speed:0,reduced:true}))},raw);
 await page.goto('/two-swords.html');await page.getByRole('button',{name:'抓住山路上的那只手',exact:true}).click();await expect(page.locator('#app')).toHaveAttribute('data-beat','ss_ridge_1');
 for(const key of ['auto','slot1'])expect(await page.evaluate(key=>localStorage.getItem(key),'jianghu:chronicle:two-swords:v1:'+key)).toBe(raw);
 await page.goto('/two-swords.html');await page.getByRole('link',{name:'旧稿及旧存档',exact:true}).click();await expect(page).toHaveURL(/two-swords-v1.html/);await page.locator('[data-action="continue"]').click();await expect(page.locator('#app')).toHaveAttribute('data-beat',old.frame.id);await expect(page.locator('#dialogue-visible')).toHaveText(old.frame.text);
});
for(const route of [0,1])test(`Two Swords actual full first-book route ${route}`,async({page})=>{
 test.setTimeout(210000);const errors:string[]=[];page.on('pageerror',e=>errors.push(e.message));
 await page.addInitScript(()=>{localStorage.setItem('jianghu:chronicle:two-swords:v2:settings',JSON.stringify({speed:0,reduced:true,size:20}));localStorage.setItem('jianghu:campaign:tide:v1:sentinel','v5-kept');localStorage.setItem('jianghu:chronicle:qingshi:v1:sentinel','qingshi-kept')});
 await page.setViewportSize({width:route?390:1440,height:route?844:900});await page.goto('/');await page.getByRole('button',{name:'选篇',exact:true}).click();await page.getByRole('link',{name:'一剑两脉 · 旧本归还',exact:true}).click();await page.getByRole('button',{name:'抓住山路上的那只手',exact:true}).click();
 const s=new VNRuntime(content,'two-swords-2.0.0'),scenes=new Set<string>();let choices=0;
 while(!s.frame.ending){await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);await expect(page.locator('#dialogue-visible')).toHaveText(s.frame.text);
  if(!scenes.has(s.frame.stage.scene)){scenes.add(s.frame.stage.scene);if(['ss_ridge','ss_duel','ss_fire','ss_cart','ss_guiboard'].includes(s.frame.stage.scene))await page.screenshot({path:evidencePath(`docs/evidence/v6/two-swords-editorial-${s.frame.stage.scene}-${route}.png`)})}
  if(s.frame.choices.length){const id=s.frame.choices[route].id;await page.locator(`[data-choice="${id}"]`).click();s.choose(id);choices++}else{await page.locator('#advance-button').click();s.advance()}
 }
 await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);expect(choices).toBe(24);await expect(page.locator('#ending-actions')).toContainText(route?'两本一同借':'山下还有一课');await page.screenshot({path:evidencePath(`docs/evidence/v6/two-swords-editorial-ending-${route}.png`)});
 await page.reload();await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);expect(await page.evaluate(()=>localStorage.getItem('jianghu:campaign:tide:v1:sentinel'))).toBe('v5-kept');expect(await page.evaluate(()=>localStorage.getItem('jianghu:chronicle:qingshi:v1:sentinel'))).toBe('qingshi-kept');expect(errors).toEqual([]);
 writeFileSync(evidencePath(`docs/evidence/v6/two-swords-editorial-browser-${route}.json`),JSON.stringify({actualBrowserInputs:true,externalHuman:false,beats:s.frames.length,choices,ending:s.frame.ending,scenes:[...scenes],errors},null,2));
});
test('Two Swords downloads unvisited late chapter for root and subpath offline use',async({browser})=>{
 for(const root of ['http://127.0.0.1:4173/','http://127.0.0.1:4175/Jianghu/']){
  const context=await browser.newContext({reducedMotion:'reduce'}),page=await context.newPage();await page.goto(root+'two-swords.html');await page.evaluate(async()=>{await navigator.serviceWorker.ready});await page.reload();await page.getByRole('button',{name:'设置',exact:true}).click();await page.getByRole('button',{name:'下载《一剑两脉 · 旧本归还》离线资源',exact:true}).click();await expect(page.getByRole('dialog')).toContainText('离线资源已备好');await page.keyboard.press('Escape');
  const s=new VNRuntime(content,'two-swords-2.0.0');while(s.frame.stage.scene!=='ss_guiboard')s.frame.choices.length?s.choose(s.frame.choices[0].id):s.advance();await page.evaluate(raw=>{localStorage.setItem('jianghu:chronicle:two-swords:v2:auto',raw);localStorage.setItem('jianghu:chronicle:two-swords:v2:settings',JSON.stringify({speed:0,reduced:true,size:20}))},JSON.stringify(s.save()));
  await context.setOffline(true);await page.goto(root+'two-swords.html#play');await page.reload();await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);await page.locator('#advance-button').click();await expect(page.locator('#app')).not.toHaveAttribute('data-beat',s.frame.id);await context.close();
 }
});
test('Two Swords three-generation scenes fit all seven viewports with usable controls',async({browser})=>{
 for(const target of ['ss_ridge_1','ss_tea_1','ss_rain_work_1','ss_fire_1','ss_guihong_1']){
  const s=new VNRuntime(content,'two-swords-2.0.0');while(s.frame.id!==target){if(s.frame.ending)throw new Error(target);s.frame.choices.length?s.choose(s.frame.choices[0].id):s.advance()}
  const context=await browser.newContext({reducedMotion:'reduce'}),page=await context.newPage();await page.addInitScript(raw=>{localStorage.setItem('jianghu:chronicle:two-swords:v2:auto',raw);localStorage.setItem('jianghu:chronicle:two-swords:v2:settings',JSON.stringify({speed:0,reduced:true,size:24}))},JSON.stringify(s.save()));
  for(const [width,height]of [[360,800],[390,844],[412,915],[800,360],[1366,768],[1440,900],[1920,1080]]){await page.setViewportSize({width,height});await page.goto('/two-swords.html#play');await expect(page.locator('#app')).toHaveAttribute('data-beat',target);expect(await page.evaluate(()=>document.documentElement.scrollWidth<=innerWidth)).toBe(true);
   for(const locator of ['#dialogue-panel','#advance-button']){const box=await page.locator(locator).boundingBox();expect(box&&box.x>=0&&box.y>=0&&box.x+box.width<=width+1&&box.y+box.height<=height+1).toBeTruthy()}
   if([360,800,1440].includes(width))await page.screenshot({path:evidencePath(`docs/evidence/v6/two-swords-editorial-layout-${target}-${width}.png`)});
  }await context.close();
 }
});
test('Two Swords long choice labels remain reachable at 24px on seven sizes',async({browser})=>{
 const s=new VNRuntime(content,'two-swords-2.0.0');while(!s.frame.choices.some(c=>c.id==='ss_delegate_and_save'))s.frame.choices.length?s.choose(s.frame.choices[0].id):s.advance();
 for(const [width,height]of [[360,800],[390,844],[412,915],[800,360],[1366,768],[1440,900],[1920,1080]]){
  const context=await browser.newContext({viewport:{width,height},reducedMotion:'reduce'}),page=await context.newPage();await page.addInitScript(raw=>{localStorage.setItem('jianghu:chronicle:two-swords:v2:auto',raw);localStorage.setItem('jianghu:chronicle:two-swords:v2:settings',JSON.stringify({speed:0,reduced:true,size:24}))},JSON.stringify(s.save()));await page.goto('/two-swords.html#play');await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);
  for(const choice of s.frame.choices){const b=await page.locator(`[data-choice="${choice.id}"]`).boundingBox();expect(b&&b.x>=0&&b.y>=0&&b.x+b.width<=width+1&&b.y+b.height<=height+1).toBeTruthy()}
  await page.locator('[data-choice="ss_delegate_and_save"]').click();await expect(page.locator('#app')).not.toHaveAttribute('data-beat',s.frame.id);await context.close();
 }
});
