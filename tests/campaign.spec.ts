import {evidencePath} from './evidence-path.ts';
import {test,expect,type Page} from '@playwright/test';
import {writeFileSync} from 'node:fs';
import {campaignRoutes,pickChoice} from './campaign-routes';
const PREFIX='jianghu:campaign:tide:v1:';
test.describe.configure({mode:'parallel'});
test.setTimeout(240000);
test.beforeEach(async({page})=>{await page.addInitScript(()=>localStorage.setItem('jianghu:campaign:tide:v1:settings',JSON.stringify({size:20,speed:0,reduced:true})));await page.emulateMedia({reducedMotion:'reduce'})});
async function ready(page:Page){await expect(page.locator('#app')).not.toHaveAttribute('data-phase','presenting');await page.waitForTimeout(185)}
async function next(page:Page,preferred:string[]){
 await ready(page);const options=await page.locator('[data-choice]').evaluateAll(nodes=>nodes.map(n=>({id:(n as HTMLElement).dataset.choice!})));
 if(options.length)await page.locator(`[data-choice="${pickChoice(options,preferred).id}"]`).click();else await page.getByRole('button',{name:'继续对白',exact:true}).click();
}
async function bounds(page:Page){expect(await page.evaluate(()=>({wide:document.documentElement.scrollWidth>innerWidth,tall:document.documentElement.scrollHeight>innerHeight+1}))).toEqual({wide:false,tall:false});for(const selector of ['.dialogue-panel','.choices-panel:not([hidden])']){const n=page.locator(selector);if(await n.count()){const r=await n.boundingBox();expect(r!.y+r!.height).toBeLessThanOrEqual((page.viewportSize()?.height??900)+1)}}}
for(const [ending,preferred] of Object.entries(campaignRoutes))test(`v5 full ${ending}: actual input, choice reload, chapter, CG and ending`,async({page})=>{
 const mobile=['captain','teacher'].includes(ending);if(mobile)await page.setViewportSize({width:390,height:844});
 const errors:string[]=[];page.on('pageerror',e=>errors.push(e.message));page.on('console',m=>{if(m.type()==='error')errors.push(m.text())});
 await page.addInitScript(()=>{localStorage.setItem('jianghu:vn:v2:auto','old-halfstep-bytes');localStorage.setItem('jianghu:v1:auto','old-reader-bytes')});
 await page.goto('/tide-v5.html');await expect(page).toHaveTitle('Jianghu · 潮生有约');
 if(ending==='harbor')await page.screenshot({path:evidencePath('docs/evidence/v6/default-entry-v5-cover-desktop.png'),animations:'disabled'});
 await page.getByRole('button',{name:'启程 · 青蒲渡',exact:true}).click();let steps=0,decisions=0;const scenes=new Set<string>();let reloaded=false,cg=false;
 while(await page.locator('#app').getAttribute('data-phase')!=='ending'){
  if(++steps>1100)throw new Error('route did not finish');
  const stage=page.locator('.play-stage'),scene=await stage.getAttribute('data-scene');scenes.add(scene!);
  if(await page.locator('#app').getAttribute('data-phase')==='awaitingChoice'){
   decisions++;
   if(!reloaded&&decisions===2){const before=await stage.innerText();const saved=await page.evaluate(p=>{const s=JSON.parse(localStorage.getItem(p+'auto')!);delete s.savedAt;return JSON.stringify(s)},PREFIX);await page.reload();await expect.poll(()=>stage.innerText()).toBe(before);const after=await page.evaluate(p=>{const s=JSON.parse(localStorage.getItem(p+'auto')!);delete s.savedAt;return JSON.stringify(s)},PREFIX);expect(after===saved,'reload preserves Ink, commands and stage; pagehide may update savedAt').toBe(true);reloaded=true}
   if(decisions===1&&ending==='harbor'){await ready(page);await bounds(page);await page.screenshot({path:evidencePath('docs/evidence/v6/default-entry-v5-first-choice-desktop.png'),animations:'disabled'})}
  }
  if(!cg&&(await stage.getAttribute('data-cg'))){cg=true;const before=await stage.getAttribute('data-cg');await page.reload();await expect(stage).toHaveAttribute('data-cg',before!);await page.screenshot({path:evidencePath(`docs/evidence/v6/default-entry-v5-cg-${ending}.png`),animations:'disabled'})}
  if(scene==='workshop'&&ending==='harbor'&&!scenes.has('workshop-shot')){scenes.add('workshop-shot');await page.getByRole('button',{name:'章节',exact:true}).click();await expect(page.getByRole('dialog')).toContainText('只读回顾');await page.keyboard.press('Escape');await page.getByRole('button',{name:'见闻',exact:true}).click();await page.screenshot({path:evidencePath('docs/evidence/v6/default-entry-v5-people.png'),animations:'disabled'});await page.keyboard.press('Escape')}
  await next(page,preferred);
 }
 await expect(page.locator('#app')).toHaveAttribute('data-beat',new RegExp('^c_ending_'+ending+'_'));
 await bounds(page);await page.screenshot({path:evidencePath(`docs/evidence/v6/default-entry-v5-ending-${ending}.png`),animations:'disabled'});
 expect(decisions).toBeGreaterThanOrEqual(50);expect(cg).toBe(true);
 expect(await page.evaluate(()=>[localStorage.getItem('jianghu:vn:v2:auto'),localStorage.getItem('jianghu:v1:auto')])).toEqual(['old-halfstep-bytes','old-reader-bytes']);
 expect(errors).toEqual([]);writeFileSync(evidencePath(`docs/evidence/v6/default-entry-v5-browser-${ending}.json`),JSON.stringify({steps,decisions,scenes:[...scenes],viewport:page.viewportSize(),errors,actualInput:true,humanPlaytest:false},null,2));
});
test('campaign viewport, real early replies, local scrolling and failed artwork',async({page,browser})=>{
 for(const [width,height] of [[1440,900],[1366,768],[390,844],[360,800],[800,360]]){
  await page.setViewportSize({width,height});await page.goto('/tide-v5.html');await page.screenshot({path:evidencePath(`docs/evidence/v6/default-entry-v5-cover-${width}.png`),animations:'disabled'});
  const start=page.getByRole('button',{name:'启程 · 青蒲渡',exact:true});if(await start.count())await start.click();else{await page.getByRole('button',{name:'重新启程',exact:true}).click();await page.getByRole('button',{name:'备份并开始',exact:true}).click()}for(let i=0;i<5;i++)await next(page,[]);
  await expect(page.locator('[data-choice]')).toHaveCount(2);await ready(page);await bounds(page);await page.screenshot({path:evidencePath(`docs/evidence/v6/default-entry-v5-choice-${width}.png`),animations:'disabled'});
  await page.locator('[data-choice="save_child"]').click();await expect(page.locator('#dialogue-visible')).toContainText('过来，先松开');
  await page.getByRole('button',{name:'设置',exact:true}).click();await page.getByRole('button',{name:'24 字号',exact:true}).click();await page.getByRole('button',{name:'夜读',exact:true}).click();await page.keyboard.press('Escape');await bounds(page);await page.screenshot({path:evidencePath(`docs/evidence/v6/default-entry-v5-night-${width}.png`),animations:'disabled'});
 }
 const broken=await browser.newContext({serviceWorkers:'block',reducedMotion:'reduce'});await broken.route('**/art/**',r=>r.abort());const bp=await broken.newPage();await bp.goto('/tide-v5.html');await bp.getByRole('button',{name:'启程 · 青蒲渡',exact:true}).click();await next(bp,[]);await expect(bp.locator('#dialogue-visible')).not.toHaveText('');await broken.close();
});
test('new story manual slot, import protection, export, old-episode link and subpath/offline',async({page,browser})=>{
 await page.goto('/tide-v5.html');await page.getByRole('button',{name:'启程 · 青蒲渡',exact:true}).click();for(let i=0;i<5;i++)await next(page,[]);
 const before=await page.locator('.play-stage').innerText();await page.getByRole('button',{name:'存档',exact:true}).click();await page.locator('[data-action="slot-save"][data-slot="slot1"]').click();
 const download=page.waitForEvent('download');await page.getByRole('button',{name:'导出本次进度',exact:true}).click();const file=await(await download).path();
 await page.keyboard.press('Escape');await next(page,[]);await page.getByRole('button',{name:'存档',exact:true}).click();await page.locator('[data-action="slot-load"][data-slot="slot1"]').click();expect(await page.locator('.play-stage').innerText()).toBe(before);
 await page.getByRole('button',{name:'存档',exact:true}).click();const raw=await page.evaluate(p=>localStorage.getItem(p+'auto'),PREFIX);
 await page.locator('#import-file').setInputFiles({name:'wrong-story.json',mimeType:'application/json',buffer:Buffer.from('{"saveSchemaVersion":2,"storyContentVersion":"half-step-1.0.1"}')});await expect(page.getByRole('dialog')).toContainText('作品或版本不兼容');expect(await page.evaluate(p=>localStorage.getItem(p+'auto'),PREFIX)).toBe(raw);
 await page.locator('#import-file').setInputFiles(file!);await expect.poll(()=>page.locator('.play-stage').innerText()).toBe(before);
 await page.getByRole('button',{name:'存档',exact:true}).click();await page.getByRole('link',{name:'打开《半步之约》与原存档',exact:true}).click();await expect(page).toHaveTitle('Jianghu · 半步之约');
 const ctx=await browser.newContext({reducedMotion:'reduce'});const p=await ctx.newPage();await p.goto('http://127.0.0.1:4175/Jianghu/');await p.evaluate(async()=>{await navigator.serviceWorker.ready});await p.reload();
 // V7 首页是作品库 shell：v5 的入口在「历史版本与旧存档」面板的「原创旧篇」分区里。
 await p.getByRole('navigation',{name:'作品库工具'}).getByRole('button',{name:'历史版本与旧存档'}).click();await p.getByRole('link',{name:'潮生有约 · V5',exact:true}).click();await p.getByRole('button',{name:'启程 · 青蒲渡',exact:true}).click();await ctx.setOffline(true);await p.reload();await expect(p.locator('#dialogue-visible')).toContainText('米');await ctx.close();
});
