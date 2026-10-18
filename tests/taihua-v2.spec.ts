import {evidencePath} from './evidence-path.ts';
import {test,expect} from '@playwright/test';
import {VNRuntime} from '../src/vn-runtime.ts';
import content from '../src/generated/taihua-v2.json' with {type:'json'};
async function decodedStage(page:any){await page.locator('.scene-background,.portrait').evaluateAll(async(nodes:Element[])=>{for(const n of nodes)for(const m of getComputedStyle(n).backgroundImage.matchAll(/url\([\"']?([^\"')]+)[\"']?\)/g)){const im=new Image();im.src=m[1];await im.decode();if(im.naturalWidth<100)throw Error(im.src)}})}
for(const route of [0,1,2])test(`Taihua complete actual browser path ${route}: independent saves, ending and reload`,async({page})=>{
 test.setTimeout(210000);
 const errors:string[]=[];page.on('pageerror',error=>errors.push(error.message));
 await page.addInitScript(()=>{
  localStorage.setItem('jianghu:chronicle:taihua:v2:settings',JSON.stringify({speed:0,reduced:true,size:20}));
  localStorage.setItem('jianghu:campaign:tide:v1:sentinel','main-progress');
  localStorage.setItem('jianghu:vn:v2:sentinel','half-progress');
 });
 await page.goto('/taihua-v2.html');await page.getByRole('button',{name:'接过替补的护腕'}).click();
 const story=new VNRuntime(content,'taihua-2.0.0');let count=0;const portraitStates=new Set<string>();
 while(!story.frame.ending){
  await expect(page.locator('#app')).toHaveAttribute('data-beat',story.frame.id);
  const mood=story.frame.stage.moods.th_shen??'neutral';
  if(route===0&&story.frame.stage.cast.includes('th_shen')&&['neutral','amused','intent'].includes(mood)&&!portraitStates.has(mood)){
   portraitStates.add(mood);await decodedStage(page);await page.screenshot({path:evidencePath(`docs/evidence/v6/taihua-editorial-archive-v2-shen-${mood}.png`)});
  }
  if(story.frame.choices.length){
   const selected=route===2?(story.frame.choices.find(c=>c.id==='th_guidance')??story.frame.choices[0]):story.frame.choices[route];
   const button=page.locator(`[data-choice="${selected.id}"]`);await expect(button).toBeEnabled();
   if(count===0)await decodedStage(page);
   if(count===0)await page.screenshot({path:evidencePath(`docs/evidence/v6/taihua-editorial-archive-v2-first-choice-${route}.png`)});
   await button.click();story.choose(selected.id);count++;
  }else{const button=page.locator('#advance-button');await expect(button).toBeEnabled();await button.click();story.advance()}
 }
 await expect(page.locator('#app')).toHaveAttribute('data-beat',story.frame.id);
 await expect(page.locator('#ending-actions')).toContainText(route===2?'一炷香的回身':route?'独行回山':'结伴复手');
 await page.reload();await expect(page.locator('#app')).toHaveAttribute('data-beat',story.frame.id);
 expect(await page.evaluate(()=>localStorage.getItem('jianghu:campaign:tide:v1:sentinel'))).toBe('main-progress');
 expect(await page.evaluate(()=>localStorage.getItem('jianghu:vn:v2:sentinel'))).toBe('half-progress');
 await decodedStage(page);await page.screenshot({path:evidencePath(`docs/evidence/v6/taihua-editorial-archive-v2-ending-${route}.png`)});expect(errors).toEqual([]);
 if(route===0)expect(portraitStates.size).toBe(3);
});
test('Taihua actual new portrait, mobile and desktop reply layout, and night background',async({page})=>{
 const story=new VNRuntime(content,'taihua-2.0.0');
 while(!story.frame.id.startsWith('th_first_morning'))story.frame.choices.length?story.choose(story.frame.choices[0].id):story.advance();
 while(!story.frame.choices.length)story.advance();
 const save=JSON.stringify(story.save());
 await page.addInitScript(raw=>{
  if(!localStorage.getItem('jianghu:chronicle:taihua:v2:auto'))localStorage.setItem('jianghu:chronicle:taihua:v2:auto',raw);
  localStorage.setItem('jianghu:chronicle:taihua:v2:settings',JSON.stringify({speed:0,reduced:true,size:24}));
 },save);
 for(const [width,height] of [[360,800],[390,844],[412,915],[800,360],[1366,768],[1440,900],[1920,1080]]){
  await page.setViewportSize({width,height});await page.goto('/taihua-v2.html#play');
  await expect(page.locator('#app')).toHaveAttribute('data-beat',story.frame.id);
  await expect(page.locator('[data-character="th_shen"]')).toBeVisible();
  expect(await page.locator('[data-character="th_shen"]').getAttribute('style')).toContain('v6/th-shen');
  const boxes=await page.locator('#dialogue-panel,#choices-panel').evaluateAll(nodes=>nodes.map(node=>{const r=node.getBoundingClientRect();return{x:r.x,y:r.y,right:r.right,bottom:r.bottom}}));
  expect(boxes.every(r=>r.x>=0&&r.right<=width+1&&r.y>=0&&r.bottom<=height+1)).toBe(true);
  expect(boxes[0].bottom).toBeLessThanOrEqual(boxes[1].y+1);
  expect(await page.evaluate(()=>document.documentElement.scrollWidth<=innerWidth)).toBe(true);
  await page.screenshot({path:evidencePath(`docs/evidence/v6/taihua-editorial-archive-v2-portrait-${width}x${height}.png`)});
 }
 while(story.frame.stage.scene!=='th_night')story.frame.choices.length?story.choose(story.frame.choices[0].id):story.advance();
 // Import through the product: pagehide deliberately persists the live session on reload.
 await page.getByRole('button',{name:'存档',exact:true}).click();
 await page.locator('#import-file').setInputFiles({name:'taihua-night.json',mimeType:'application/json',buffer:Buffer.from(JSON.stringify(story.save()))});
 await page.reload();await expect(page.locator('#app')).toHaveAttribute('data-beat',story.frame.id);
 expect(await page.locator('.scene-background').getAttribute('style')).toContain('v6/taihua-night.webp');
 await page.screenshot({path:evidencePath('docs/evidence/v6/taihua-editorial-archive-v2-night-1920.png')});
});
test('Taihua resources are requested per work and an unvisited night scene loads offline on root and subpath',async({browser})=>{
 for(const root of ['http://127.0.0.1:4173/','http://127.0.0.1:4175/Jianghu/']){
  const context=await browser.newContext({reducedMotion:'reduce'});const page=await context.newPage();
  await page.goto(root);await page.evaluate(async()=>{await navigator.serviceWorker.ready});await page.reload();
  const cached=await page.evaluate(async()=>{const names=await caches.keys();return(await Promise.all(names.map(async name=>(await(await caches.open(name)).keys()).map(request=>request.url)))).flat()});
  // V7 首页是作品库 shell：封面（art/v6/*.webp）会在首页合法出现并被缓存。
  // 「按作品请求」的断言据此收窄到该篇的 JS chunk——那些仍只应在进入 taihua-v2.html 后出现。
  expect(cached.some(url=>/\/assets\/taihua-/.test(url))).toBe(false);
  await page.goto(root+'taihua-v2.html');await page.getByRole('button',{name:'设置',exact:true}).click();
  await page.getByRole('button',{name:'下载《太华试序 · 第二版旧稿》离线资源',exact:true}).click();
  await expect(page.getByRole('dialog')).toContainText('离线资源已备好');await page.keyboard.press('Escape');
  const story=new VNRuntime(content,'taihua-2.0.0');while(story.frame.stage.scene!=='th_night')story.frame.choices.length?story.choose(story.frame.choices[0].id):story.advance();
  await page.evaluate(raw=>{
   localStorage.setItem('jianghu:chronicle:taihua:v2:auto',raw);
   localStorage.setItem('jianghu:chronicle:taihua:v2:settings',JSON.stringify({speed:0,reduced:true,size:20}));
  },JSON.stringify(story.save()));
  await context.setOffline(true);await page.goto(root+'taihua-v2.html#play');await page.reload();
  await expect(page.locator('#app')).toHaveAttribute('data-beat',story.frame.id);
  expect(await page.evaluate(async()=>{const response=await fetch('./art/v6/taihua-night.webp');return response.ok&&(await response.blob()).size>1000})).toBe(true);
  await page.locator('#advance-button').click();await expect(page.locator('#app')).not.toHaveAttribute('data-beat',story.frame.id);
  await context.close();
 }
});
