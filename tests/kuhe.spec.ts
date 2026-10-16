import {test,expect} from '@playwright/test';
import {VNRuntime} from '../src/vn-runtime.ts';
import content from '../src/generated/kuhe-v1.json' with {type:'json'};
for(const route of [0,1])test(`Kuhe actual browser full canonical route ${route}: choices, rescue aftermath, independent save and ending`,async({page})=>{
 test.setTimeout(180000);const errors:string[]=[];page.on('pageerror',e=>errors.push(e.message));
 await page.addInitScript(()=>{
  localStorage.setItem('jianghu:chronicle:kuhe:v1:settings',JSON.stringify({speed:0,reduced:true,size:20}));
  localStorage.setItem('jianghu:campaign:tide:v1:sentinel','old-main');
 });
 await page.setViewportSize({width:route?390:1440,height:route?844:900});
 await page.goto('/kuhe-v1.html');await page.getByRole('button',{name:'把药盆放稳',exact:true}).click();
 const story=new VNRuntime(content,'kuhe-1.0.0');const captured=new Set<string>();
 while(!story.frame.ending){
  await expect(page.locator('#app')).toHaveAttribute('data-beat',story.frame.id);
  if(['kh_bell_4','kh_three_old_2','kh_lock_6','kh_seventh_1'].includes(story.frame.id)&&!captured.has(story.frame.id)){
   captured.add(story.frame.id);await page.screenshot({path:`docs/evidence/v6/kuhe-editorial-archive-v1-${story.frame.id}-${route}.png`});
  }
  if(story.frame.choices.length){
   const id=story.frame.choices[route].id;await page.locator(`[data-choice="${id}"]`).click();story.choose(id);
  }else{await page.locator('#advance-button').click();story.advance()}
 }
 await expect(page.locator('#app')).toHaveAttribute('data-beat',story.frame.id);
 await expect(page.locator('#ending-actions')).toContainText(route?'带着缺页':'灯下接更');
 expect(await page.evaluate(()=>document.documentElement.scrollWidth<=innerWidth)).toBe(true);
 await page.screenshot({path:`docs/evidence/v6/kuhe-editorial-archive-v1-ending-${route}.png`});
 await page.reload();await expect(page.locator('#app')).toHaveAttribute('data-beat',story.frame.id);
 expect(await page.evaluate(()=>localStorage.getItem('jianghu:campaign:tide:v1:sentinel'))).toBe('old-main');
 expect(errors).toEqual([]);
});
test('Kuhe unvisited late scene is available through explicit per-work offline download on root and subpath',async({browser})=>{
 for(const root of ['http://127.0.0.1:4173/','http://127.0.0.1:4175/Jianghu/']){
  const context=await browser.newContext({reducedMotion:'reduce'}),page=await context.newPage();
  await page.goto(root+'kuhe-v1.html');await page.evaluate(async()=>{await navigator.serviceWorker.ready});await page.reload();
  await page.getByRole('button',{name:'设置',exact:true}).click();
  await page.getByRole('button',{name:'下载《枯河谷 · 旧稿》离线资源',exact:true}).click();
  await expect(page.getByRole('dialog')).toContainText('离线资源已备好');await page.keyboard.press('Escape');
  const story=new VNRuntime(content,'kuhe-1.0.0');while(story.frame.stage.scene!=='kh_ward')story.frame.choices.length?story.choose(story.frame.choices[0].id):story.advance();
  await page.evaluate(raw=>{localStorage.setItem('jianghu:chronicle:kuhe:v1:auto',raw);localStorage.setItem('jianghu:chronicle:kuhe:v1:settings',JSON.stringify({speed:0,reduced:true,size:20}))},JSON.stringify(story.save()));
  await context.setOffline(true);await page.goto(root+'kuhe-v1.html#play');await page.reload();
  await expect(page.locator('#app')).toHaveAttribute('data-beat',story.frame.id);await expect(page.locator('#dialogue-visible')).toContainText('孟归藏醒了');
  await page.locator('#advance-button').click();await expect(page.locator('#app')).not.toHaveAttribute('data-beat',story.frame.id);
  await context.close();
 }
});
test('Kuhe corrected reusable elder, traveler and valley decode with readable panels at seven viewport sizes',async({browser})=>{
 for(const target of ['kh_kong_trial_1','kh_lock_6','kh_future_1']){
  const story=new VNRuntime(content,'kuhe-1.0.0');while(story.frame.id!==target){if(story.frame.ending)throw new Error(target);story.frame.choices.length?story.choose(story.frame.choices[0].id):story.advance()}
  const context=await browser.newContext({reducedMotion:'reduce'}),page=await context.newPage();
  await page.addInitScript(raw=>{localStorage.setItem('jianghu:chronicle:kuhe:v1:auto',raw);localStorage.setItem('jianghu:chronicle:kuhe:v1:settings',JSON.stringify({speed:0,reduced:true,size:24}))},JSON.stringify(story.save()));
  for(const [width,height] of [[360,800],[390,844],[412,915],[800,360],[1366,768],[1440,900],[1920,1080]]){
   await page.setViewportSize({width,height});await page.goto('/kuhe-v1.html#play');await expect(page.locator('#app')).toHaveAttribute('data-beat',target);
   const boxes=await page.locator('#dialogue-panel,#choices-panel:not([hidden])').evaluateAll(nodes=>nodes.map(n=>{const r=n.getBoundingClientRect();return{x:r.x,right:r.right,y:r.y,bottom:r.bottom}}));
   expect(boxes.every(r=>r.x>=0&&r.right<=width+1&&r.y>=0&&r.bottom<=height+1)).toBe(true);
   if(boxes.length===2)expect(boxes[0].bottom).toBeLessThanOrEqual(boxes[1].y+1);
   expect(await page.evaluate(()=>document.documentElement.scrollWidth<=innerWidth)).toBe(true);
   if(target==='kh_kong_trial_1'){
    expect(await page.locator('[data-character="kh_kong"]').getAttribute('style')).toContain('npc-aged-monk.webp');
    expect(await page.locator('[data-character="kh_wusheng"]').getAttribute('style')).toContain('npc-seasoned-traveler.webp');
    const decoded=await page.evaluate(async()=>Promise.all(['./art/v6/npc-aged-monk.webp','./art/v6/npc-seasoned-traveler.webp','./art/v6/reusable-stone-valley.webp'].map(async src=>{const img=new Image();img.src=src;await img.decode();return img.naturalWidth>500&&img.naturalHeight>500})));expect(decoded).toEqual([true,true,true]);
   }
   if([360,800,1440].includes(width))await page.screenshot({path:`docs/evidence/v6/kuhe-editorial-archive-v1-reusable-${target}-${width}.png`});
  }
  await context.close();
 }
});
