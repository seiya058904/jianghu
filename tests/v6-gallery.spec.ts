import {test,expect} from '@playwright/test';
test('author gallery distinguishes real image states, deduplicates environments and shows declared CG assets',async({page})=>{
 const errors:string[]=[];page.on('pageerror',e=>errors.push(e.message));await page.goto('/gallery.html');
 const shen=page.locator('[data-character="th_shen"]');await shen.scrollIntoViewIfNeeded();
 await expect(shen.locator('img')).toHaveAttribute('src',/v6\/th-shen.webp/);
 await page.locator('#mood').selectOption('amused');await expect(shen.locator('img')).toHaveAttribute('src',/v6\/th-shen-amused.webp/);
 await page.locator('#mood').selectOption('intent');await expect(shen.locator('img')).toHaveAttribute('src',/v6\/th-shen-intent.webp/);
 await page.locator('#kind').selectOption('scenes');await expect(page.locator('#mood')).toBeDisabled();
 const files=await page.locator('#gallery img').evaluateAll(images=>images.map(image=>(image as HTMLImageElement).src));expect(new Set(files).size).toBe(files.length);
 await page.locator('#kind').selectOption('cgs');expect(await page.locator('#gallery figure').count()).toBeGreaterThanOrEqual(4);
 expect(errors).toEqual([]);
});
