import {evidencePath} from './evidence-path.ts';
import {test,expect,type Locator} from '@playwright/test';
import {readFileSync} from 'node:fs';
import {workEntries,resolveEdition,editionPrefix} from '../src/works-registry.ts';
import {workEditionLinks,workArchiveLinks} from '../src/work-index.ts';

// V7-02 / V7-03 / V7-05 / V7-06 / V7-14: what a new reader actually meets.
const roots=['http://127.0.0.1:4173/','http://127.0.0.1:4175/Jianghu/'];
const href=async(link:Locator)=>link.evaluate((node:HTMLAnchorElement)=>node.href);

for(const root of roots)test(`Collection front page at ${root} opens on the canon works, not the original local story`,async({browser})=>{
 const context=await browser.newContext(),page=await context.newPage();
 await page.goto(root);
 await expect(page.locator('body')).not.toHaveAttribute('data-content-version','tide-promise-2.0.0');
 expect(await page.title()).toBe('Jianghu · 宋世江湖 · 互动纪事集');
 await expect(page.getByRole('heading',{name:/JIANGHU · 同一片江湖/})).toBeVisible();
 await expect(page.locator('.lib-hero-eyebrow')).toHaveText('宋世江湖 · 互动武侠纪事集');
 expect(await href(page.getByRole('link',{name:'从《太华试序》开始',exact:true}))).toBe(new URL('taihua.html',root).href);
 await expect(page.getByRole('button',{name:'启程 · 青蒲渡'})).toHaveCount(0);
 await expect(page.locator('.lib-card').first()).toHaveAttribute('data-work','taihua');
 const text=await page.locator('body').innerText();
 expect(text).not.toContain('旧稿');
 expect(text).not.toContain('潮生有约');
 await context.close();
});

for(const root of roots)test(`Every registered edition is reachable and each archive link resolves at ${root}`,async({browser})=>{
 const context=await browser.newContext(),page=await context.newPage();
 await page.goto(root);
 await page.getByRole('button',{name:'选篇',exact:true}).click();
 const dialog=page.getByRole('dialog');
 await expect(dialog).toContainText('现行作品');
 // 同一部现行篇在面板里合法地出现多次：作品自己的标题，以及别篇的"另见"一行。
 // 例如《太华试序 · 三年之约》同时是《太华试序》的标题、《太华试序》的卷册，与《白石谷外》的另见。
 // 因此按**目标文件**核对可达性，而不是假定全库链接文字唯一。
 const hrefsNamed=async(name:string)=>dialog.getByRole('link',{name,exact:true})
  .evaluateAll(nodes=>nodes.map(node=>(node as HTMLAnchorElement).href));
 for(const work of workEntries){
  const entry=resolveEdition(work.entry)!;
  expect(await hrefsNamed(entry.title),`${work.id} entry ${entry.title}`).toContain(new URL(entry.file,root).href);
  for(const link of [...workEditionLinks(work),...workArchiveLinks(work)])
   expect(await hrefsNamed(link.title),`${work.id} → ${link.title}`).toContain(new URL(link.file,root).href);
 }
 await dialog.getByRole('link',{name:'龙门问刀 · 第二版旧稿',exact:true}).click();
 await expect(page.locator('body')).toHaveAttribute('data-content-version','longmen-2.0.0');
 await expect(page.getByRole('heading',{name:'龙门问刀 · 第二版旧稿'})).toBeVisible();
 await page.getByRole('link',{name:'回到作品库'}).click();
 await expect(page).toHaveURL(/index\.html$/);
 await expect(page.locator('.lib-card').first()).toBeVisible();
 await context.close();
});

test('Flagship works are one click from the front page and each returns to the collection',async({browser})=>{
 const context=await browser.newContext(),page=await context.newPage();
 await page.goto('/');
 for(const work of workEntries.filter(entry=>entry.recommended)){
  await page.goto('/');
  await page.getByRole('link',{name:new RegExp(`(开始|继续|重读)《${work.title}》`)}).click();
  await expect(page.getByRole('heading',{name:resolveEdition(work.entry)!.title})).toBeVisible();
  await expect(page.getByText('原典纪事',{exact:false}).first()).toBeVisible();
  await page.getByRole('link',{name:'回到作品库'}).click();
  await expect(page.locator('.lib-card').first()).toBeVisible();
 }
 await context.close();
});

test('Filtering by theme, progress and length changes what a reader sees, and progress never leaks between works',async({browser})=>{
 const context=await browser.newContext(),page=await context.newPage();
 await page.addInitScript(({prefix})=>{localStorage.setItem(prefix+'settings',JSON.stringify({size:20,speed:0,reduced:true}));localStorage.setItem(prefix+'endings','["lm_travel","lm_home"]')},{prefix:editionPrefix('longmen')});
 await page.goto('/');
 await expect(page.locator('.lib-card[data-work="longmen"] .lib-card-state')).toHaveText('已完成 · 2/2 归宿');
 await expect(page.locator('.lib-card[data-work="qingshi"] .lib-card-state')).toHaveText('未开始');
 await page.getByRole('button',{name:'远海行记',exact:true}).click();
 await expect(page.locator('.lib-card')).toHaveCount(1);
 await expect(page.locator('.lib-card').first()).toHaveAttribute('data-work','sea');
 expect(await page.locator('#lib-start').count()).toBe(0);
 await page.getByRole('button',{name:'全部',exact:true}).first().click();
 await page.getByRole('button',{name:'已完成',exact:true}).click();
 await expect(page.locator('.lib-card')).toHaveCount(1);
 await expect(page.locator('.lib-card').first()).toHaveAttribute('data-work','longmen');
 await page.getByRole('button',{name:'全部',exact:true}).nth(1).click();
 await page.getByRole('button',{name:'篇幅由短到长',exact:true}).click();
 const groups=await page.locator('#lib-catalog .lib-grid').evaluateAll(grids=>grids.map(grid=>[...grid.querySelectorAll('.lib-card')].map(card=>Number((card as HTMLElement).dataset.beats))));
 for(const beats of groups)for(let i=1;i<beats.length;i++)expect(beats[i]).toBeGreaterThanOrEqual(beats[i-1]);
 await expect(page.locator('.lib-empty')).toHaveCount(0);
 await context.close();
});

test('The collection shell holds up at seven viewports with no overflow, no blocked call to action and a keyboard theme switch',async({browser})=>{
 for(const [width,height]of [[360,800],[390,844],[412,915],[800,360],[1366,768],[1440,900],[1920,1080]]){
  const context=await browser.newContext({viewport:{width,height}}),page=await context.newPage();
  await page.goto('/');
  expect(await page.evaluate(()=>document.documentElement.scrollWidth<=innerWidth),`${width} horizontal overflow`).toBe(true);
  for(const locator of [page.getByRole('link',{name:'从《太华试序》开始',exact:true}),page.getByRole('button',{name:'选篇',exact:true})]){
   await locator.scrollIntoViewIfNeeded();
   const box=await locator.boundingBox();
   expect(box&&box.width>0&&box.height>0,`${width} ${await locator.textContent()}`).toBeTruthy();
   expect(await locator.evaluate(node=>{const rect=node.getBoundingClientRect(),hit=document.elementFromPoint(rect.x+rect.width/2,rect.y+rect.height/2);return node===hit||Boolean(hit&&node.contains(hit))}),`${width} blocked control`).toBe(true);
  }
  const card=page.locator('.lib-card').first();
  await card.scrollIntoViewIfNeeded();
  const cardBox=await card.boundingBox();
  expect(cardBox&&cardBox.x>=0&&cardBox.x+cardBox.width<=width+1,`${width} card overflows`).toBeTruthy();
  if([360,800,1440].includes(width))await page.screenshot({path:evidencePath(`docs/evidence/v7/library-${width}.png`)});
  await context.close();
 }
 const context=await browser.newContext(),page=await context.newPage();
 await page.goto('/');
 await page.getByRole('button',{name:'夜读',exact:true}).focus();
 await page.keyboard.press('Enter');
 await expect(page.locator('html')).toHaveAttribute('data-theme','dark');
 await expect(page.getByRole('button',{name:'纸本',exact:true})).toBeVisible();
 await page.getByRole('button',{name:'纸本',exact:true}).focus();
 await page.keyboard.press('Enter');
 await expect(page.locator('html')).toHaveAttribute('data-theme','paper');
 await context.close();
});

test('The archive deep link and the archive button keep historical saves reachable without listing them up front',async({browser})=>{
 const context=await browser.newContext(),page=await context.newPage();
 await page.goto('/index.html#archive');
 const dialog=page.getByRole('dialog');
 await expect(dialog).toBeVisible();
 await expect(dialog).toContainText('历史版本与旧存档');
 await expect(dialog).not.toContainText('现行作品');
 // 归档面板里的标题以注册表为准，不写字面量：`qingshi-v1` 的注册标题是「青石五友 · 旧稿」。
 const qingshiOld=workArchiveLinks(workEntries.find(work=>work.id==='qingshi')!).find(link=>link.file==='qingshi-v1.html');
 expect(qingshiOld,`qingshi-v1 must stay listed as an archive of 青石五友`).toBeTruthy();
 expect(await href(dialog.getByRole('link',{name:qingshiOld!.title,exact:true}))).toBe(new URL('qingshi-v1.html','http://127.0.0.1:4173/').href);
 expect(await href(dialog.getByRole('link',{name:'潮生有约 · V6',exact:true}))).toBe(new URL('tide-v6.html','http://127.0.0.1:4173/').href);
 expect(await href(dialog.getByRole('link',{name:'潮生有约 · V5',exact:true}))).toBe(new URL('tide-v5.html','http://127.0.0.1:4173/').href);
 expect(await href(dialog.getByRole('link',{name:'半步之约',exact:true}))).toBe(new URL('half-step.html','http://127.0.0.1:4173/').href);
 await page.getByRole('button',{name:'关闭',exact:true}).click();
 await expect(dialog).not.toBeVisible();
 expect(await page.evaluate(()=>document.activeElement?.closest('dialog')===null)).toBe(true);
 const archiveButton=page.getByRole('button',{name:'历史版本与旧存档',exact:true}).first();
 await archiveButton.click();
 await expect(dialog).toBeVisible();
 await page.getByRole('button',{name:'关闭',exact:true}).click();
 await expect(archiveButton).toBeFocused();
 await context.close();
});

test('Seeded progress on a frozen edition never counts as progress on the current edition',async({browser})=>{
 const context=await browser.newContext(),page=await context.newPage();
 await page.addInitScript(()=>{localStorage.setItem('jianghu:chronicle:qingshi:v1:endings','["qs_records"]');localStorage.setItem('jianghu:chronicle:qingshi:v1:auto','{}')});
 await page.goto('/');
 await expect(page.locator('.lib-card[data-work="qingshi"] .lib-card-state')).toHaveText('未开始');
 expect(await page.evaluate(()=>localStorage.getItem('jianghu:chronicle:qingshi:v1:endings'))).toBe('["qs_records"]');
 await context.close();
});

// The collection page must not ship the canon source, the private archives or a story payload it never opens.
test('The built collection page does not embed the canon source, private archives or story data',async()=>{
 const html=readFileSync('dist/index.html','utf8');
 expect(html).not.toContain('宋世江湖.md');
 expect(html).not.toContain('docs/archives');
 for(const work of workEntries)expect(html).not.toContain(`offline-${resolveEdition(work.entry)!.slug}.json`);
});
