import { test, expect, type Page } from '@playwright/test';
import { writeFileSync } from 'node:fs';
import { vnRoutes } from './vn-routes';
import { Session as LegacySession } from '../src/runtime';
import { VNRuntime } from '../src/vn-runtime';
import draft from '../src/generated/duel-1.0.0.json' with { type: 'json' };
const PREFIX = 'jianghu:vn:v2:';
const shot = (name: string) => `docs/evidence/vn-${name}.png`;
test.beforeEach(async ({page}) => {
  await page.addInitScript(() => localStorage.setItem('jianghu:vn:v2:settings', JSON.stringify({size:20,dark:false,speed:0,reduced:true})));
  await page.emulateMedia({reducedMotion:'reduce'});
});
async function ready(page: Page) {
  await expect(page.locator('#app')).not.toHaveAttribute('data-phase','presenting');
  const phase=await page.locator('#app').getAttribute('data-phase');
  if(phase==='awaitingChoice') await expect(page.locator('[data-choice]').first()).toBeEnabled();
  if(phase==='awaitingAdvance') await expect(page.getByRole('button',{name:'继续对白',exact:true})).toBeEnabled();
}
async function start(page: Page) { await page.goto('/half-step.html'); await expect(page).toHaveTitle('Jianghu · 半步之约'); await page.getByRole('button',{name:'走进院子',exact:true}).click(); await ready(page); }
async function advance(page: Page) {
  await ready(page); await page.waitForTimeout(190);
  const before = await page.locator('#app').getAttribute('data-beat');
  await page.getByRole('button',{name:'继续对白',exact:true}).click();
  await expect(page.locator('#app')).not.toHaveAttribute('data-beat',before!); await ready(page);
}
async function choose(page: Page, id: string) {
  await ready(page); await page.waitForTimeout(190);
  await page.locator(`[data-choice="${id}"]`).click(); await ready(page);
}
async function walk(page: Page, ids: string[], stop?: string) {
  let decisions = 0, steps = 0;
  while (await page.locator('#app').getAttribute('data-phase') !== 'ending') {
    if (await page.locator('#app').getAttribute('data-beat') === stop) return decisions;
    if (++steps > 100) throw new Error('route did not finish');
    if (await page.locator('#app').getAttribute('data-phase') === 'awaitingChoice') await choose(page, ids[decisions++]); else await advance(page);
  }
  return decisions;
}
async function noPageScroll(page: Page) {
  expect(await page.evaluate(() => ({wide:document.documentElement.scrollWidth > innerWidth,tall:document.documentElement.scrollHeight > innerHeight + 1}))).toEqual({wide:false,tall:false});
  const clipped = await page.locator('.dialogue-panel,.choices-panel:not([hidden])').evaluateAll(nodes => nodes.some(node => {const r=node.getBoundingClientRect();return r.bottom > innerHeight + 1 || r.left < 0 || r.right > innerWidth + 1;}));
  expect(clipped).toBe(false);
}
for (const [ending, ids] of Object.entries(vnRoutes)) test(`new story completes ${ending}; real reply, reload and ending`, async ({page}) => {
  if (ending === 'practice') await page.setViewportSize({width:390,height:844});
  const errors: string[] = []; page.on('pageerror', error => errors.push(error.message)); page.on('console', message => {if(message.type()==='error')errors.push(message.text());});
  await page.goto('/half-step.html');
  if (ending === 'together') await page.screenshot({path:shot('cover-1440'),animations:'disabled'});
  const started = Date.now(); await page.getByRole('button',{name:'走进院子',exact:true}).click(); await ready(page); await advance(page);
  await expect(page.locator('#app')).toHaveAttribute('data-beat','challenge'); await expect(page.locator('[data-choice]')).toHaveCount(3); await noPageScroll(page);
  const firstChoiceMs = Date.now()-started;
  if (ending === 'together') await page.screenshot({path:shot('choice-1440'),animations:'disabled'});
  await choose(page,ids[0]);
  const reaction = await page.locator('#dialogue-visible').textContent();
  const expected: Record<string,string> = {together:'口气挺大',practice:'林见微。院门不打架',road:'那你拿稳'};
  expect(reaction).toContain(expected[ending]);
  await page.screenshot({path:shot(`reply-${ids[0]}`),animations:'disabled'});
  const before = await page.locator('.play-stage').innerText(); const beat = await page.locator('#app').getAttribute('data-beat');
  await page.reload(); await ready(page); await expect(page.locator('#app')).toHaveAttribute('data-beat',beat!); expect(await page.locator('.play-stage').innerText()).toBe(before);
  expect(await walk(page,ids.slice(1))).toBe(7); await noPageScroll(page);
  await expect(page.locator('#app')).toHaveAttribute('data-beat',`ending_${ending}`);
  await expect(page.getByText('此篇已完',{exact:true})).toBeVisible();
  await page.screenshot({path:shot(`ending-${ending}`),animations:'disabled'});
  writeFileSync(`docs/evidence/vn-feedback-${ending}.json`,JSON.stringify({viewport:page.viewportSize(),reply:ids[0],reaction,firstChoiceMs,measurement:'automated interaction with immediate text; not human reading time',errors},null,2));
  expect(errors).toEqual([]);
});

test('manual slot restores a choice, read-only panels pause, export/import and protected restart', async ({page}) => {
  await start(page); await advance(page);
  const choiceText = await page.locator('#dialogue-visible').textContent();
  await page.getByRole('button',{name:'存档',exact:true}).click(); await page.locator('[data-action="slot-save"][data-slot="slot1"]').click();
  const downloading = page.waitForEvent('download'); await page.getByRole('button',{name:'导出本次进度',exact:true}).click(); const file = await (await downloading).path();
  await page.screenshot({path:shot('saves-1440'),animations:'disabled'}); await page.keyboard.press('Escape'); await choose(page,'bold');
  const runtimeBefore = await page.evaluate(() => JSON.parse(localStorage.getItem('jianghu:vn:v2:auto')!).runtime);
  for (const title of ['回顾','见闻','设置']) {
    await page.getByRole('button',{name:title,exact:true}).click(); await expect(page.locator('#app')).toHaveAttribute('data-phase','modalOpen');
    await page.keyboard.press('Enter'); await page.keyboard.press('Escape');
    expect(await page.evaluate(() => JSON.parse(localStorage.getItem('jianghu:vn:v2:auto')!).runtime)).toBe(runtimeBefore);
  }
  await page.getByRole('button',{name:'存档',exact:true}).click(); await page.locator('[data-action="slot-load"][data-slot="slot1"]').click();
  await expect(page.locator('#app')).toHaveAttribute('data-phase','awaitingChoice'); await expect(page.locator('#dialogue-visible')).toHaveText(choiceText!);
  await choose(page,'courteous'); await page.getByRole('button',{name:'存档',exact:true}).click(); await page.locator('#import-file').setInputFiles(file!);
  await expect(page.locator('#app')).toHaveAttribute('data-beat','challenge');
  await page.getByRole('button',{name:'Jianghu 封面'}).click(); await page.getByRole('button',{name:'重新开始',exact:true}).click(); await page.getByRole('button',{name:'备份并开始',exact:true}).click();
  await page.getByRole('button',{name:'存档',exact:true}).click(); await page.locator('[data-action="slot-load"][data-slot="previous"]').click();
  await expect(page.locator('#app')).toHaveAttribute('data-beat','challenge');
});

test('old auto/manual/previous/endings remain byte-for-byte intact and playable', async ({page}) => {
  const s = new LegacySession(); s.choose('reserve'); const raw = JSON.stringify(s.save(120));
  await page.addInitScript(raw => {for(const key of ['auto','slot1','slot2','slot3','previous'])localStorage.setItem('jianghu:v1:'+key,raw);localStorage.setItem('jianghu:v1:endings','["quiet"]');},raw);
  await start(page); await advance(page); await choose(page,'bold');
  for (const key of ['auto','slot1','slot2','slot3','previous']) expect(await page.evaluate(key=>localStorage.getItem('jianghu:v1:'+key),key)).toBe(raw);
  expect(await page.evaluate(()=>localStorage.getItem('jianghu:v1:endings'))).toBe('["quiet"]');
  await page.getByRole('button',{name:'存档',exact:true}).click();
  const downloading=page.waitForEvent('download'); await page.locator('[data-action="legacy-export"][data-slot="slot1"]').click(); await downloading;
  await page.getByRole('link',{name:'打开旧篇与旧存档',exact:true}).click(); await expect(page.locator('#scene-title')).toHaveText('一碗没有盐的粥');
});

test('damaged data and invalid imports stay exportable without replacing current play', async ({page}) => {
  await page.addInitScript(()=>localStorage.setItem('jianghu:vn:v2:auto','{broken'));
  await page.goto('/half-step.html'); await page.getByRole('button',{name:'存档',exact:true}).click();
  await expect(page.getByText('数据损坏或版本不兼容 · 原始数据保留',{exact:true})).toBeVisible();
  const downloading=page.waitForEvent('download'); await page.locator('[data-action="slot-export"][data-slot="auto"]').click(); await downloading;
  await page.keyboard.press('Escape'); await page.getByRole('button',{name:'走进院子',exact:true}).click(); await page.getByRole('button',{name:'备份并开始',exact:true}).click();
  expect(await page.evaluate(()=>localStorage.getItem('jianghu:vn:v2:previous'))).toBe('{broken');
  await advance(page); const before=await page.evaluate(()=>localStorage.getItem('jianghu:vn:v2:auto'));
  await page.getByRole('button',{name:'存档',exact:true}).click();
  for (const [name,raw] of [['broken','{bad'],['old',JSON.stringify({saveSchemaVersion:1})],['large',' '.repeat(1000001)]]) {
    await page.locator('#import-file').setInputFiles({name:name+'.json',mimeType:'application/json',buffer:Buffer.from(raw)});
    await expect(page.locator('.panel-feedback')).toBeVisible(); expect(await page.evaluate(()=>localStorage.getItem('jianghu:vn:v2:auto'))).toBe(before);
  }
  await page.keyboard.press('Escape'); await expect(page.locator('#app')).toHaveAttribute('data-beat','challenge');
});

test('typing click completes first; stage/keyboard cannot skip a reply; double click settles once', async ({page}) => {
  await page.emulateMedia({reducedMotion:'no-preference'});
  await page.addInitScript(()=>localStorage.setItem('jianghu:vn:v2:settings',JSON.stringify({size:20,speed:36,reduced:false})));
  await page.goto('/half-step.html'); await page.getByRole('button',{name:'走进院子',exact:true}).click();
  await expect(page.locator('#app')).toHaveAttribute('data-phase','presenting');
  await expect(page.locator('#dialogue-announcement')).toBeEmpty(); await page.locator('#dialogue-panel').dblclick({delay:40});
  await expect(page.locator('#app')).toHaveAttribute('data-beat','gate'); await expect(page.locator('#app')).toHaveAttribute('data-phase','awaitingAdvance');
  await advance(page); const before=await page.evaluate(()=>localStorage.getItem('jianghu:vn:v2:auto'));
  await page.locator('.scene').click({position:{x:5,y:5}}); await page.locator('#dialogue-panel').focus(); await page.keyboard.press('Space'); expect(await page.evaluate(()=>localStorage.getItem('jianghu:vn:v2:auto'))).toBe(before);
  await page.waitForTimeout(190); await page.locator('[data-choice="bold"]').dblclick({delay:40}); await ready(page);
  await expect(page.locator('#app')).toHaveAttribute('data-beat','bold_react');
  await page.reload(); await expect(page.locator('#app')).toHaveAttribute('data-phase','awaitingAdvance');
});

test('auto and read skip stop at choices, unvisited reactions are not skipped', async ({page}) => {
  await start(page); await page.getByRole('button',{name:'自动',exact:true}).click();
  await expect(page.locator('#app')).toHaveAttribute('data-beat','challenge',{timeout:7000}); await expect(page.getByRole('button',{name:'自动',exact:true})).toHaveAttribute('aria-pressed','false');
  await page.waitForTimeout(2500); await expect(page.locator('#app')).toHaveAttribute('data-beat','challenge');
  await page.getByRole('button',{name:'Jianghu 封面'}).click(); await page.getByRole('button',{name:'重新开始',exact:true}).click(); await page.getByRole('button',{name:'备份并开始',exact:true}).click();
  await page.getByRole('button',{name:'已读快进',exact:true}).click(); await expect(page.locator('#app')).toHaveAttribute('data-beat','challenge');
  await expect(page.getByRole('button',{name:'已读快进',exact:true})).toHaveAttribute('aria-pressed','false');
  await choose(page,'courteous'); await page.getByRole('button',{name:'已读快进',exact:true}).click();
  await expect(page.getByRole('button',{name:'已读快进',exact:true})).toHaveAttribute('aria-pressed','false'); await page.waitForTimeout(500); await expect(page.locator('#app')).toHaveAttribute('data-beat','courteous_react');
});

test('storage write failure keeps the old snapshot and current progress can still export', async ({page}) => {
  await start(page); await advance(page);
  const before=await page.evaluate(()=>localStorage.getItem('jianghu:vn:v2:auto'));
  await page.evaluate(()=>{Storage.prototype.setItem=function(){throw new DOMException('quota','QuotaExceededError');};});
  await choose(page,'bold'); await expect(page.locator('#app')).toHaveAttribute('data-beat','bold_react');
  await expect(page.locator('.toast')).toContainText('浏览器未能保存');
  expect(await page.evaluate(()=>localStorage.getItem('jianghu:vn:v2:auto'))).toBe(before);
  await page.getByRole('button',{name:'存档',exact:true}).click();
  const downloaded=page.waitForEvent('download'); await page.getByRole('button',{name:'导出本次进度',exact:true}).click(); await downloaded;
});

test('draft correction keeps raw slots, migrates the current beat and preserves an exportable original', async ({page}) => {
  const old=new VNRuntime(draft); old.advance(); old.choose('bold');
  const raw=JSON.stringify({...old.save(),storyContentVersion:'half-step-1.0.0'});
  await page.addInitScript(raw=>{localStorage.setItem('jianghu:vn:v2:auto',raw);localStorage.setItem('jianghu:vn:v2:slot1',raw);},raw);
  await page.goto('/half-step.html#play'); await ready(page); await expect(page.locator('#app')).toHaveAttribute('data-beat','bold_react');
  expect(await page.evaluate(()=>localStorage.getItem('jianghu:vn:v2:auto'))).toBe(raw);
  await advance(page); await expect(page.locator('#app')).toHaveAttribute('data-beat','xie_enter'); await expect(page.locator('#dialogue-visible')).toContainText('谢行舟');
  expect(await page.evaluate(()=>localStorage.getItem('jianghu:vn:v2:slot1'))).toBe(raw);
  expect(await page.evaluate(()=>JSON.parse(localStorage.getItem('jianghu:vn:v2:auto')!).storyContentVersion)).toBe('half-step-1.0.1');
  await page.getByRole('button',{name:'存档',exact:true}).click();
  await expect(page.getByRole('heading',{name:'兼容前样章原始备份',exact:true})).toBeVisible();
  const downloading=page.waitForEvent('download'); await page.locator('[data-action="slot-export"][data-slot^="draft-"]').click(); await downloading;
});

for (const viewport of [{width:1440,height:900},{width:1366,height:768},{width:390,height:844},{width:360,height:800}]) test(`stage, choices, three actors and 24px night mode ${viewport.width}`, async ({page}) => {
  await page.setViewportSize(viewport); await page.goto('/half-step.html'); await page.screenshot({path:shot(`cover-${viewport.width}`),animations:'disabled'}); await start(page); await advance(page); await noPageScroll(page);
  await page.screenshot({path:shot(`choice-${viewport.width}`),animations:'disabled'});
  await walk(page,vnRoutes.together,'wen_question'); await expect(page.locator('.actor')).toHaveCount(3); await noPageScroll(page);
  await page.screenshot({path:shot(`three-actors-${viewport.width}`),animations:'disabled'});
  await page.getByRole('button',{name:'设置',exact:true}).click(); await page.getByRole('button',{name:'24 字号',exact:true}).click(); await page.getByRole('button',{name:'夜读',exact:true}).click(); await page.keyboard.press('Escape');
  await noPageScroll(page); expect(await page.locator('.dialogue-copy').evaluate(node=>getComputedStyle(node).fontSize)).toBe('24px');
  await page.locator('[data-choice="admit_limit"]').focus(); await page.keyboard.press('Space'); await ready(page); await expect(page.locator('#app')).toHaveAttribute('data-beat','admit_react');
  await page.screenshot({path:shot(`night-24-${viewport.width}`),animations:'disabled'});
});

test('touch simulation, rotation and enlarged long content use local scrolling', async ({browser}) => {
  const context=await browser.newContext({viewport:{width:360,height:800},isMobile:true,hasTouch:true,reducedMotion:'reduce'});
  const page=await context.newPage(); await page.addInitScript(()=>localStorage.setItem('jianghu:vn:v2:settings',JSON.stringify({size:24,speed:0,reduced:true})));
  await page.goto('/half-step.html'); await page.getByRole('button',{name:'走进院子',exact:true}).tap(); await page.waitForTimeout(190); await page.getByRole('button',{name:'继续对白',exact:true}).tap(); await noPageScroll(page);
  await page.setViewportSize({width:800,height:360}); await noPageScroll(page);
  await page.screenshot({path:shot('landscape-800'),animations:'disabled'});
  await page.locator('[data-choice="bold"]').tap(); await ready(page); await expect(page.locator('#app')).toHaveAttribute('data-beat','bold_react'); await page.waitForTimeout(190); await advance(page);
  await page.evaluate(()=>{document.getElementById('speaker-name')!.textContent='来自华阴松风剑馆的临时教习闻铮先生'; const text='这是一段用于检验字号扩大与短视窗的排版测试文字。'.repeat(5); document.getElementById('dialogue-measure')!.textContent=text; document.getElementById('dialogue-visible')!.textContent=text;});
  await noPageScroll(page); await page.getByRole('button',{name:'继续对白',exact:true}).tap(); await expect(page.locator('#app')).toHaveAttribute('data-beat','xie_protest');
  await context.close();
});

test('subpath and all art unavailable still support real choices', async ({browser}) => {
  const context=await browser.newContext({serviceWorkers:'block',reducedMotion:'reduce'}); const page=await context.newPage();
  await context.route('**/art/**',route=>route.abort()); await page.goto('http://127.0.0.1:4175/Jianghu/half-step.html');
  await page.getByRole('button',{name:'走进院子',exact:true}).click(); await advance(page); await choose(page,'courteous');
  await expect(page.locator('#speaker-name')).toHaveText('林见微'); await page.reload(); await expect(page.locator('#app')).toHaveAttribute('data-beat','courteous_react'); await noPageScroll(page); await context.close();
});

test('root and subpath production cache reload offline and accept a new choice', async ({browser}) => {
  for (const url of ['http://127.0.0.1:4173/half-step.html','http://127.0.0.1:4175/Jianghu/half-step.html']) {
    const context=await browser.newContext({reducedMotion:'reduce'}), page=await context.newPage(); await page.goto(url); await page.getByRole('button',{name:'走进院子',exact:true}).click();
    await page.evaluate(async()=>{await navigator.serviceWorker.ready;}); await page.reload(); await advance(page);
    await context.setOffline(true); await page.reload(); await expect(page.locator('#app')).toHaveAttribute('data-beat','challenge'); await choose(page,'bold'); await expect(page.locator('#app')).toHaveAttribute('data-beat','bold_react');
    await context.setOffline(false); await context.close();
  }
});

