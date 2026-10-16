import {test,expect,type Page} from '@playwright/test';
import {routes} from './routes';
const shot=(name:string)=>`docs/evidence/legacy-${name}.png`;
async function start(page:Page){await page.goto('/legacy.html');await page.getByRole('button',{name:'开始故事',exact:true}).click();await expect(page.locator('#scene-title')).toHaveText('雨夜来信');}
async function choose(page:Page,id:string){await page.locator(`[data-choice="${id}"]`).click();await expect(page.locator('#scene-title')).toBeVisible();}
for(const [ending,path] of Object.entries(routes))test(`complete ${ending} from cover, save reload, ending prose`,async({page})=>{
  if(ending==='quiet')await page.setViewportSize({width:390,height:844});
  const errors:string[]=[];page.on('pageerror',e=>errors.push(e.message));page.on('console',m=>{if(m.type()==='error')errors.push(m.text());});
  await page.goto('/legacy.html');await expect(page).toHaveTitle('Jianghu · 渡口无碑');
  if(ending==='public')await page.screenshot({animations: 'disabled',path:shot('cover-1440')});
  await page.getByRole('button',{name:'开始故事',exact:true}).click();
  if(ending==='public')await page.screenshot({animations: 'disabled',path:shot('opening-1440')});
  for(const [index,id] of path.entries()){
    await choose(page,id);
    expect(await page.evaluate(()=>document.documentElement.scrollWidth<=innerWidth)).toBe(true);
    if(index===3){const text=await page.locator('article.prose').textContent();await page.reload();await expect(page.locator('article.prose')).toHaveText(text!);}
    if(ending==='public'&&id==='observe')await page.screenshot({animations: 'disabled',path:shot('dialogue'),fullPage:true});
    if(ending==='public'&&id==='rescue')await page.screenshot({animations: 'disabled',path:shot('conflict'),fullPage:true});
    if(ending==='public'&&id==='consent')await page.screenshot({animations: 'disabled',path:shot('decision'),fullPage:true});
  }
  const titles:Record<string,string>={public:'留痕',quiet:'灯下人',common:'众人之渡',leave:'过江'};
  await expect(page.locator('#scene-title')).toHaveText(titles[ending]);await expect(page.getByText('全篇完',{exact:true})).toBeVisible();
  await page.screenshot({animations: 'disabled',path:shot(`ending-${ending}`),fullPage:true});
  await page.getByRole('button',{name:'回到封面',exact:true}).click();await expect(page.getByRole('button',{name:'继续阅读',exact:true})).toBeVisible();
  expect(errors).toEqual([]);
});
test('subpath build and unavailable artwork leave the story playable',async({page,context})=>{
  await context.route('**/art/ferry.png',route=>route.abort());
  await page.goto('http://127.0.0.1:4175/Jianghu/legacy.html');await page.getByRole('button',{name:'开始故事',exact:true}).click();
  await expect(page.locator('#scene-title')).toHaveText('雨夜来信');await choose(page,'reserve');await page.reload();await expect(page.locator('#scene-title')).toHaveText('一碗没有盐的粥');
});
test('corrupt automatic data stays exportable; double click does not advance two choices',async({page})=>{
  await page.addInitScript(()=>{localStorage.setItem('jianghu:v1:auto','{broken');localStorage.setItem('jianghu:v1:endings','{broken');});
  await page.goto('/legacy.html');await page.getByRole('button',{name:'存档',exact:true}).click();await expect(page.getByText('数据损坏或版本不兼容 · 原始数据已保留',{exact:true})).toBeVisible();
  const downloaded=page.waitForEvent('download');await page.locator('[data-action="slot-export"][data-slot="auto"]').click();await downloaded;
  await page.keyboard.press('Escape');await page.getByRole('button',{name:'开始故事',exact:true}).click();await page.getByRole('button',{name:'备份并开始',exact:true}).click();
  await page.locator('[data-choice="promise"]').dblclick();await expect(page.locator('#scene-title')).toHaveText('一碗没有盐的粥');
});
test('manual slots, read-only panels, protected restart, export/import, corrupt input',async({page})=>{
  await start(page);await choose(page,'promise');
  const before=await page.locator('article.prose').textContent();
  await page.getByRole('button',{name:'见闻',exact:true}).click();await expect(page.getByText('二十八贯与四贯',{exact:true})).toHaveCount(0);await page.screenshot({animations: 'disabled',path:shot('knowledge')});await page.keyboard.press('Escape');
  await page.getByRole('button',{name:'回顾',exact:true}).click();await page.locator('summary').first().click();await page.keyboard.press('Escape');await expect(page.locator('article.prose')).toHaveText(before!);
  await page.getByRole('button',{name:'存档',exact:true}).click();await page.locator('[data-action="slot-save"][data-slot="slot1"]').click();
  const downloading=page.waitForEvent('download');await page.getByRole('button',{name:'导出本次进度',exact:true}).click();const file=await (await downloading).path();
  await page.keyboard.press('Escape');await choose(page,'archive');
  await page.getByRole('button',{name:'存档',exact:true}).click();await page.locator('[data-action="slot-load"][data-slot="slot1"]').click();await expect(page.locator('#scene-title')).toHaveText('一碗没有盐的粥');
  await page.getByRole('button',{name:'Jianghu 封面'}).click();await page.getByRole('button',{name:'另起一程',exact:true}).click();await expect(page.getByRole('heading',{name:'另起一程',exact:true})).toBeVisible();await page.keyboard.press('Escape');await page.getByRole('button',{name:'继续阅读',exact:true}).click();await expect(page.locator('article.prose')).toHaveText(before!);
  await page.getByRole('button',{name:'Jianghu 封面'}).click();await page.getByRole('button',{name:'另起一程',exact:true}).click();await page.getByRole('button',{name:'备份并开始',exact:true}).click();await expect(page.locator('#scene-title')).toHaveText('雨夜来信');
  await page.getByRole('button',{name:'存档',exact:true}).click();await page.locator('[data-action="slot-load"][data-slot="previous"]').click();await expect(page.locator('#scene-title')).toHaveText('一碗没有盐的粥');
  await page.getByRole('button',{name:'存档',exact:true}).click();await page.locator('#import-file').setInputFiles({name:'bad.json',mimeType:'application/json',buffer:Buffer.from('{bad')});await page.keyboard.press('Escape');await expect(page.locator('article.prose')).toHaveText(before!);
  await choose(page,'river');await page.getByRole('button',{name:'存档',exact:true}).click();await page.locator('#import-file').setInputFiles(file!);await expect(page.locator('#scene-title')).toHaveText('一碗没有盐的粥');
});
for(const viewport of [{width:1366,height:768},{width:390,height:844},{width:360,height:800}])test(`responsive keyboard and large type ${viewport.width}`,async({page})=>{
  await page.setViewportSize(viewport);await page.emulateMedia({reducedMotion:'reduce'});await page.goto('/legacy.html');await page.screenshot({animations: 'disabled',path:shot(`cover-${viewport.width}`)});
  await page.getByRole('button',{name:'开始故事',exact:true}).focus();await page.keyboard.press('Enter');
  await expect(page.locator('#scene-title')).toBeFocused();await page.screenshot({animations: 'disabled',path:shot(`reading-${viewport.width}`)});
  await page.getByRole('button',{name:'设置',exact:true}).click();await page.getByRole('button',{name:'24 字号',exact:true}).click();await page.getByRole('button',{name:'夜读',exact:true}).click();await page.keyboard.press('Escape');
  expect(await page.evaluate(()=>document.documentElement.scrollWidth<=innerWidth)).toBe(true);
  await page.locator('[data-choice="reserve"]').focus();await page.keyboard.press('Space');await expect(page.locator('#scene-title')).toHaveText('一碗没有盐的粥');
  expect(await page.evaluate(()=>document.documentElement.scrollWidth<=innerWidth)).toBe(true);await page.screenshot({animations: 'disabled',path:shot(`large-dark-${viewport.width}`),fullPage:true});
});
test('production cache supports reload offline',async({page,context})=>{
  await start(page);await choose(page,'promise');
  await page.evaluate(async()=>{await navigator.serviceWorker.ready;});
  await page.reload();await expect(page.locator('#scene-title')).toHaveText('一碗没有盐的粥');
  await context.setOffline(true);await page.reload();await expect(page.locator('#scene-title')).toHaveText('一碗没有盐的粥');await choose(page,'river');await expect(page.locator('#scene-title')).toHaveText('河有两岸');
  await context.setOffline(false);
});
