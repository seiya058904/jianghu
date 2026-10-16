import {test,expect} from '@playwright/test';
test.beforeEach(async({page})=>{await page.addInitScript(()=>localStorage.setItem('jianghu:campaign:tide:v1:settings',JSON.stringify({size:20,speed:0,reduced:true})));await page.emulateMedia({reducedMotion:'reduce'})});
test('visible expression assets change and return with the authored mood',async({page})=>{
 await page.goto('/tide-v5.html');await page.getByRole('button',{name:'启程 · 青蒲渡',exact:true}).click();
 for(let i=0;i<5;i++){await page.waitForTimeout(185);await page.getByRole('button',{name:'继续对白',exact:true}).click()}
 await page.waitForTimeout(185);const actor=page.locator('[data-character="zhaoli"] .portrait');await expect(actor).toHaveCSS('background-image',/zhaoli-intent/);
 await page.screenshot({path:'docs/evidence/v6/default-entry-v5-expression-intent.png',animations:'disabled'});await page.locator('[data-choice="save_rope"]').click();
 for(let i=0;i<6;i++){await page.waitForTimeout(185);await page.getByRole('button',{name:'继续对白',exact:true}).click()}
 await expect(actor).toHaveCSS('background-image',/zhaoli\.webp/);await page.screenshot({path:'docs/evidence/v6/default-entry-v5-expression-amused.png',animations:'disabled'});
});
test('asset gallery loads all registered portraits and has no console or image failures',async({page})=>{
 const errors:string[]=[];page.on('pageerror',e=>errors.push(e.message));page.on('console',m=>{if(m.type()==='error')errors.push(m.text())});await page.goto('/gallery.html');await expect(page.locator('#gallery figure')).toHaveCount(32);
 await page.locator('#gallery img').evaluateAll(async nodes=>{await Promise.all(nodes.map(n=>{const img=n as HTMLImageElement;img.loading='eager';return img.decode()}))});
 await page.screenshot({path:'docs/evidence/v6/default-entry-v5-gallery-core.png',animations:'disabled'});await page.selectOption('#mood','amused');await page.locator('#gallery figure').nth(20).scrollIntoViewIfNeeded();await page.screenshot({path:'docs/evidence/v6/default-entry-v5-gallery-npc.png',animations:'disabled'});expect(errors).toEqual([]);
});
test('campaign long-name, long-text and many-choice stress remains reachable with 24px night type',async({page})=>{
 await page.setViewportSize({width:360,height:800});await page.goto('/tide-v5.html');await page.getByRole('button',{name:'启程 · 青蒲渡',exact:true}).click();await page.getByRole('button',{name:'设置',exact:true}).click();await page.getByRole('button',{name:'24 字号',exact:true}).click();await page.getByRole('button',{name:'夜读',exact:true}).click();await page.keyboard.press('Escape');
 await page.evaluate(()=>{document.querySelector('#speaker-name')!.textContent='青蒲渡东堤临时接应总领船人江照鲤';const text='这是一段明确标为压力测试的长文本，不属于正式剧情。'.repeat(12);document.querySelector('#dialogue-visible')!.textContent=text;document.querySelector('#dialogue-measure')!.textContent=text;const choices=document.querySelector<HTMLElement>('#choices-panel')!;choices.hidden=false;choices.innerHTML='<p>排版压力测试</p>'+Array.from({length:8},(_,i)=>'<button class="choice">第'+i+'项：一段较长但仍须可访问的行动选择</button>').join('')});
 expect(await page.evaluate(()=>document.documentElement.scrollWidth>innerWidth||document.documentElement.scrollHeight>innerHeight+1)).toBe(false);
 await page.locator('#dialogue-panel').evaluate(n=>n.scrollTop=n.scrollHeight);await expect(page.getByRole('button',{name:'继续对白',exact:true})).toBeInViewport();await page.screenshot({path:'docs/evidence/v6/default-entry-v5-stress-360.png',animations:'disabled'});
});
