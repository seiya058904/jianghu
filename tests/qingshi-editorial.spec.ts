import {test,expect} from '@playwright/test';
import {writeFileSync} from 'node:fs';
import {VNRuntime} from '../src/vn-runtime.ts';
import content from '../src/generated/qingshi.json' with {type:'json'};
import old from '../src/generated/qingshi-v2.json' with {type:'json'};
function at(id:string){const s=new VNRuntime(content,'qingshi-3.0.0');while(s.frame.id!==id){if(s.frame.ending)throw Error(id);s.frame.choices.length?s.choose(s.frame.choices[0].id):s.advance()}return s}
test('Qingshi missing old-knife CG keeps duty room and controllable words',async({page})=>{
 const s=at('qs_oldknife_1');await page.route('**/art/v6/cg-qingshi-old-knife.webp',route=>route.abort());await page.addInitScript(raw=>{localStorage.setItem('jianghu:chronicle:qingshi:v3:auto',raw);localStorage.setItem('jianghu:chronicle:qingshi:v3:settings',JSON.stringify({speed:0,reduced:true}))},JSON.stringify(s.save()));await page.goto('/qingshi.html#play');await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);await expect(page.locator('#dialogue-visible')).toHaveText(s.frame.text);expect(await page.locator('.scene-background').getAttribute('style')).toContain('longmen-hall.webp');await page.locator('#advance-button').click();s.advance();await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);
});
test('Qingshi old knife CG and reused elderly closeup decode and restore at seven sizes',async({page})=>{
 for(const [width,height] of [[360,800],[390,844],[412,915],[800,360],[1366,768],[1440,900],[1920,1080]])for(const id of ['qs_oldknife_1','qs_oldknife_6']){
  await page.goto('/qingshi.html');await page.setViewportSize({width,height});const s=at(id);
  await page.evaluate(raw=>{localStorage.setItem('jianghu:chronicle:qingshi:v3:auto',raw);localStorage.setItem('jianghu:chronicle:qingshi:v3:settings',JSON.stringify({speed:0,reduced:true,size:24}))},JSON.stringify(s.save()));
  await page.goto('/qingshi.html#play');await page.reload();await expect(page.locator('#app')).toHaveAttribute('data-beat',id);
  await page.locator('.scene-background,.portrait').evaluateAll(async ns=>{for(const n of ns)for(const m of getComputedStyle(n).backgroundImage.matchAll(/url\(["']?([^"')]+)["']?\)/g)){const im=new Image();im.src=m[1];await im.decode();if(im.naturalWidth<100)throw Error(im.src)}});
  if(id==='qs_oldknife_6'){await expect(page.locator('.actor:visible')).toHaveCount(1);const box=await page.locator('.actor:visible').boundingBox();expect(box!.width).toBeGreaterThanOrEqual(Math.min(width*.6,600))}
  expect(await page.evaluate(()=>document.documentElement.scrollWidth<=innerWidth)).toBe(true);
  if([360,800,1440].includes(width))await page.screenshot({path:`docs/evidence/v6/qingshi-editorial-${id}-${width}.png`});
  await page.reload();await expect(page.locator('#app')).toHaveAttribute('data-beat',id);await page.locator('#advance-button').click();s.advance();await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);
  await page.getByRole('button',{name:'Jianghu 封面',exact:true}).click();
 }
});
test('Qingshi archive keeps pending auto and slots, new edition rejects old import',async({page})=>{
 const s=new VNRuntime(old,'qingshi-2.0.0');while(!s.frame.choices.length)s.advance();const raw=JSON.stringify(s.save());
 await page.addInitScript(raw=>{for(const key of ['auto','slot1','previous'])localStorage.setItem('jianghu:chronicle:qingshi:v2:'+key,raw);localStorage.setItem('jianghu:chronicle:qingshi:v2:settings',JSON.stringify({dark:true,speed:0,reduced:true}))},raw);
 await page.goto('/qingshi.html');await page.getByRole('link',{name:'上一版及旧存档',exact:true}).click();await expect(page).toHaveTitle('Jianghu · 青石五友 · 第二版旧稿');await page.getByRole('button',{name:/继续这一场/}).click();await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);await page.reload();await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);
 await page.getByRole('button',{name:'Jianghu 封面',exact:true}).click();await page.getByRole('link',{name:'修订篇 · 守一天',exact:true}).click();await page.getByRole('button',{name:'坐上粮仓后的矮墙',exact:true}).click();await page.getByRole('button',{name:'存档',exact:true}).click();await page.locator('#import-file').setInputFiles({name:'old.json',mimeType:'application/json',buffer:Buffer.from(raw)});await expect(page.getByRole('dialog')).toContainText('作品或版本不兼容');
 expect(await page.evaluate(()=>['slot1','previous'].map(k=>localStorage.getItem('jianghu:chronicle:qingshi:v2:'+k)))).toEqual([raw,raw]);
});
test('Qingshi actual old-knife resource works offline at root and subpath',async({browser})=>{
 for(const root of ['http://127.0.0.1:4173/','http://127.0.0.1:4175/Jianghu/']){const context=await browser.newContext(),page=await context.newPage();await page.goto(root+'qingshi.html');await page.evaluate(async()=>{await navigator.serviceWorker.ready});await page.reload();await page.getByRole('button',{name:'设置',exact:true}).click();await page.getByRole('button',{name:'下载《青石五友 · 守一天》离线资源',exact:true}).click();await expect(page.getByRole('dialog')).toContainText('离线资源已备好');await page.keyboard.press('Escape');const s=at('qs_oldknife_1');await page.evaluate(raw=>{localStorage.setItem('jianghu:chronicle:qingshi:v3:auto',raw);localStorage.setItem('jianghu:chronicle:qingshi:v3:settings',JSON.stringify({speed:0,reduced:true}))},JSON.stringify(s.save()));await context.setOffline(true);await page.goto(root+'qingshi.html#play');await page.reload();await expect(page.locator('.play-stage')).toHaveAttribute('data-cg','oldKnife');expect(await page.evaluate(async()=>{const im=new Image();im.src=new URL('art/v6/cg-qingshi-old-knife.webp',location.href).href;await im.decode();return im.naturalWidth})).toBeGreaterThan(1000);await context.close()}
});
for(const route of [0,1])test(`Qingshi actual complete life route ${route}: explicit ages, fixed sacrifice, personal aftermath and independent save`,async({page})=>{
 test.setTimeout(210000);const errors:string[]=[];page.on('pageerror',e=>errors.push(e.message));
 await page.addInitScript(()=>{localStorage.setItem('jianghu:chronicle:qingshi:v3:settings',JSON.stringify({speed:0,reduced:true,size:20}));localStorage.setItem('jianghu:campaign:tide:v1:sentinel','v5-kept');localStorage.setItem('jianghu:chronicle:kuhe:v1:sentinel','kuhe-kept')});
 await page.setViewportSize({width:route?390:1440,height:route?844:900});
 await page.goto('/');await page.getByRole('button',{name:'选篇',exact:true}).click();await page.getByRole('link',{name:'青石五友 · 守一天',exact:true}).click();
 await page.getByRole('button',{name:'坐上粮仓后的矮墙',exact:true}).click();
 const s=new VNRuntime(content,'qingshi-3.0.0');const scenes=new Set<string>();let choices=0;
 while(!s.frame.ending){
  await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);await expect(page.locator('#dialogue-visible')).toHaveText(s.frame.text);if(['qs_driver_settlement_1','qs_home_visit_1','qs_oldknife_6'].includes(s.frame.id)){await page.reload();await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);await expect(page.locator('#dialogue-visible')).toHaveText(s.frame.text)}
  if(!scenes.has(s.frame.stage.scene)){
   scenes.add(s.frame.stage.scene);
   if(['qs_yard17','qs_wall32','qs_wei46','qs_home70','qs_wall92','qs_after'].includes(s.frame.stage.scene)){
    await page.screenshot({path:`docs/evidence/v6/qingshi-editorial-${s.frame.stage.scene}-${route}.png`});
   }
   if(s.frame.stage.scene==='qs_wall92')await expect(page.locator('#scene-time')).toContainText('九十二岁');
  }
  if(s.frame.choices.length){const id=s.frame.choices[route].id;await page.locator(`[data-choice="${id}"]`).click();s.choose(id);choices++}else{await page.locator('#advance-button').click();s.advance()}
 }
 await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);expect(choices).toBe(30);await expect(page.locator('#ending-actions')).toContainText(route?'下一道门':'五个人的旧录');
 expect(await page.evaluate(()=>document.documentElement.scrollWidth<=innerWidth)).toBe(true);await page.screenshot({path:`docs/evidence/v6/qingshi-editorial-ending-${route}.png`});
 await page.reload();await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);
 expect(await page.evaluate(()=>localStorage.getItem('jianghu:campaign:tide:v1:sentinel'))).toBe('v5-kept');expect(await page.evaluate(()=>localStorage.getItem('jianghu:chronicle:kuhe:v1:sentinel'))).toBe('kuhe-kept');expect(errors).toEqual([]);const saved=await page.evaluate(()=>JSON.parse(localStorage.getItem('jianghu:chronicle:qingshi:v3:auto')!));expect(saved.commands).toEqual(s.commands);expect(saved.presentation).toEqual(s.save().presentation);await expect(page.locator('#dialogue-visible')).toHaveText(s.frame.text);expect(await page.locator('vite-error-overlay').count()).toBe(0);
 writeFileSync(`docs/evidence/v6/qingshi-editorial-browser-${route}.json`,JSON.stringify({actualBrowserInputs:true,fullVisibleTextCompared:true,commandsAndFinalStageCompared:true,refreshPoints:['qs_driver_settlement_1','qs_home_visit_1','qs_oldknife_6'],externalHuman:false,beats:s.frames.length,choices,ending:s.frame.ending,scenes:[...scenes],errors},null,2));
});
test('Qingshi work download retains an unvisited late chapter offline on root and subpath',async({browser})=>{
 for(const root of ['http://127.0.0.1:4173/','http://127.0.0.1:4175/Jianghu/']){
  const context=await browser.newContext({reducedMotion:'reduce'}),page=await context.newPage();await page.goto(root+'qingshi.html');await page.evaluate(async()=>{await navigator.serviceWorker.ready});await page.reload();
  await page.getByRole('button',{name:'设置',exact:true}).click();await page.getByRole('button',{name:'下载《青石五友 · 守一天》离线资源',exact:true}).click();await expect(page.getByRole('dialog')).toContainText('离线资源已备好');await page.keyboard.press('Escape');
  const s=new VNRuntime(content,'qingshi-3.0.0');while(s.frame.stage.scene!=='qs_wall92')s.frame.choices.length?s.choose(s.frame.choices[0].id):s.advance();
  await page.evaluate(raw=>{localStorage.setItem('jianghu:chronicle:qingshi:v3:auto',raw);localStorage.setItem('jianghu:chronicle:qingshi:v3:settings',JSON.stringify({speed:0,reduced:true,size:20}))},JSON.stringify(s.save()));
  await context.setOffline(true);await page.goto(root+'qingshi.html#play');await page.reload();await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);await page.locator('#advance-button').click();await expect(page.locator('#app')).not.toHaveAttribute('data-beat',s.frame.id);await context.close();
 }
});
test('Qingshi age phases and empty frontier gate render at seven sizes; deceased POV is absent',async({browser})=>{
 for(const [target,age]of [['qs_grain_1','age17'],['qs_chop46_1','age46'],['qs_city92_1','age92'],['qs_after_1',null]] as const){
  const s=new VNRuntime(content,'qingshi-3.0.0');while(s.frame.id!==target){if(s.frame.ending)throw new Error(target);s.frame.choices.length?s.choose(s.frame.choices[0].id):s.advance()}
  const context=await browser.newContext({reducedMotion:'reduce'}),page=await context.newPage();await page.addInitScript(raw=>{localStorage.setItem('jianghu:chronicle:qingshi:v3:auto',raw);localStorage.setItem('jianghu:chronicle:qingshi:v3:settings',JSON.stringify({speed:0,reduced:true,size:24}))},JSON.stringify(s.save()));
  for(const [width,height]of [[360,800],[390,844],[412,915],[800,360],[1366,768],[1440,900],[1920,1080]]){
   await page.setViewportSize({width,height});await page.goto('/qingshi.html#play');await expect(page.locator('#app')).toHaveAttribute('data-beat',target);
   if(age){expect(await page.locator('[data-character="qs_xu"]').getAttribute('style')).toContain(`qs-xu-${age}.webp`);expect(await page.locator('[data-character="qs_xu"] .portrait').evaluate(n=>getComputedStyle(n).backgroundSize)).toBe('auto 150%');expect(await page.evaluate(async file=>{const img=new Image();img.src='./art/v6/'+file;await img.decode();return img.naturalWidth>500&&img.naturalHeight>800},`qs-xu-${age}.webp`)).toBe(true)}else await expect(page.locator('[data-character="qs_xu"]')).toHaveCount(0);
   if(age==='age92')expect(await page.locator('.scene-background').getAttribute('style')).toContain('reusable-stone-inner-gate.webp');
   const boxes=await page.locator('#dialogue-panel,#choices-panel:not([hidden])').evaluateAll(nodes=>nodes.map(n=>{const r=n.getBoundingClientRect();return{x:r.x,right:r.right,y:r.y,bottom:r.bottom}}));
   expect(boxes.every(r=>r.x>=0&&r.right<=width+1&&r.y>=0&&r.bottom<=height+1)).toBe(true);if(boxes.length===2)expect(boxes[0].bottom).toBeLessThanOrEqual(boxes[1].y+1);
   expect(await page.evaluate(()=>document.documentElement.scrollWidth<=innerWidth)).toBe(true);
   if([360,800,1440].includes(width))await page.screenshot({path:`docs/evidence/v6/qingshi-editorial-ages-${target}-${width}.png`});
  }
  await context.close();
 }
});
