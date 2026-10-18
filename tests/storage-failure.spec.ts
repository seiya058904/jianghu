import {test,expect} from '@playwright/test';

for(const failure of ['denied','quota'] as const)for(const entry of ['half-step.html','taihua.html','legacy.html'])test(`${entry} can start and export when storage is ${failure}`,async({page})=>{
  await page.addInitScript(kind=>{
    Storage.prototype.setItem=function(){throw new DOMException('storage unavailable',kind==='denied'?'SecurityError':'QuotaExceededError')};
    if(kind==='denied')Storage.prototype.getItem=function(){throw new DOMException('storage unavailable','SecurityError')};
  },failure);
  await page.emulateMedia({reducedMotion:'reduce'});
  const errors:string[]=[];page.on('pageerror',error=>errors.push(error.message));
  await page.goto('/'+entry);
  await page.locator('[data-action="new"]').click();
  await expect(page.locator(entry==='legacy.html'?'.reader':'.play-stage')).toBeVisible();
  await expect(page.locator('.toast')).toContainText('浏览器未能保存');
  await page.locator('[data-action="saves"]').click();
  const downloaded=page.waitForEvent('download');
  await page.locator(entry==='legacy.html'?'[data-action="export-current"]':'[data-action="export"]').click();
  expect((await downloaded).suggestedFilename()).toMatch(/\.json$/);
  expect(errors).toEqual([]);
});

test('the works library renders when storage methods throw',async({page})=>{
  await page.addInitScript(()=>{Storage.prototype.getItem=function(){throw new DOMException('storage unavailable','SecurityError')};});
  const errors:string[]=[];page.on('pageerror',error=>errors.push(error.message));
  await page.goto('/');
  await expect(page.locator('.lib-card')).toHaveCount(16);
  await page.getByRole('button',{name:'选篇',exact:true}).click();
  await expect(page.locator('#lib-dialog')).toBeVisible();
  expect(errors).toEqual([]);
});

test('a failed backup blocks restart and preserves the existing raw auto save',async({page})=>{
  await page.emulateMedia({reducedMotion:'reduce'});await page.goto('/half-step.html');
  await page.locator('[data-action="new"]').click();
  const raw=await page.evaluate(()=>localStorage.getItem('jianghu:vn:v2:auto'));
  await page.locator('[data-action="home"]').click();
  await page.evaluate(()=>{Storage.prototype.setItem=function(){throw new DOMException('quota','QuotaExceededError')};});
  await page.locator('[data-action="new"]').click();await page.locator('[data-action="begin"]').click();
  await expect(page.locator('dialog')).toBeVisible();
  expect(await page.evaluate(()=>localStorage.getItem('jianghu:vn:v2:auto'))).toBe(raw);
});

test('a stale tab cannot overwrite another tab progress, and can export its in-memory progress',async({page,context})=>{
  await page.emulateMedia({reducedMotion:'reduce'});await page.goto('/half-step.html');
  await page.locator('[data-action="new"]').click();
  const other=await context.newPage();await other.emulateMedia({reducedMotion:'reduce'});await other.goto('/half-step.html#play');
  await other.locator('#advance-button').click();
  const newer=await other.evaluate(()=>localStorage.getItem('jianghu:vn:v2:auto'));
  await page.locator('#advance-button').click();
  await expect(page.locator('.toast')).toContainText('另一标签页已更新');
  expect(await page.evaluate(()=>localStorage.getItem('jianghu:vn:v2:auto'))).toBe(newer);
  await page.locator('[data-action="saves"]').click();const downloaded=page.waitForEvent('download');
  await page.locator('[data-action="export"]').click();await downloaded;
});
