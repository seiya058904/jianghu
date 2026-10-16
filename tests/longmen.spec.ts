import {test,expect} from '@playwright/test';
import {writeFileSync} from 'node:fs';
import {VNRuntime} from '../src/vn-runtime.ts';
import content from '../src/generated/longmen-v1.json' with {type:'json'};
test.describe.configure({mode:'parallel'});
for(const route of [0,1])test(`Longmen library entry, real complete route ${route}, explicit time jump and isolated reload`,async({page})=>{
 test.setTimeout(150000);const errors:string[]=[];page.on('pageerror',e=>errors.push(e.message));
 await page.addInitScript(()=>{
  localStorage.setItem('jianghu:chronicle:longmen:v1:settings',JSON.stringify({speed:0,reduced:true,size:20}));
  localStorage.setItem('jianghu:chronicle:taihua:v1:sentinel','taihua-progress');
  localStorage.setItem('jianghu:campaign:tide:v2:sentinel','main-progress');
 });
 await page.goto('/');await page.getByRole('button',{name:'选篇',exact:true}).click();
 await page.getByRole('link',{name:'龙门秋会 · 旧稿',exact:true}).click();await expect(page).toHaveTitle('Jianghu · 龙门秋会 · 旧稿');
 await page.getByRole('button',{name:'去借那把木刀',exact:true}).click();
 const s=new VNRuntime(content,'longmen-1.0.0');const scenes=new Set<string>();let decisions=0;
 while(!s.frame.ending){
  await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);
  if(!scenes.has(s.frame.stage.scene)){
   scenes.add(s.frame.stage.scene);
   if(s.frame.stage.scene==='lm_qingheyard'){
    await expect(page.locator('#scene-time')).toContainText('许重山五十六岁');
    await expect(page.locator('[data-character="lm_qinghe"]')).toBeVisible();
    await page.screenshot({path:`docs/evidence/v6/longmen-editorial-archive-v1-qinghe-${route}.png`});
   }
   if(s.frame.stage.scene==='lm_fiveyears'){await expect(page.locator('#scene-time')).toContainText('五年后');await page.screenshot({path:`docs/evidence/v6/longmen-editorial-archive-v1-fiveyears-${route}.png`})}
  }
  if(s.frame.choices.length){const selected=s.frame.choices[route];const button=page.locator(`[data-choice="${selected.id}"]`);await expect(button).toBeEnabled();await button.click();s.choose(selected.id);decisions++}
  else{const button=page.locator('#advance-button');await expect(button).toBeEnabled();await button.click();s.advance()}
 }
 await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);
 expect(decisions).toBe(20);expect(scenes.has('lm_qingheyard')).toBe(true);
 expect(s.frame.ending).toBe(route?'lm_home':'lm_travel');await page.reload();await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);
 expect(await page.evaluate(()=>localStorage.getItem('jianghu:chronicle:taihua:v1:sentinel'))).toBe('taihua-progress');
 expect(await page.evaluate(()=>localStorage.getItem('jianghu:campaign:tide:v2:sentinel'))).toBe('main-progress');
 await page.getByRole('button',{name:'存档',exact:true}).click();const before=await page.evaluate(()=>localStorage.getItem('jianghu:chronicle:longmen:v1:auto'));
 await page.locator('#import-file').setInputFiles({name:'wrong-work.json',mimeType:'application/json',buffer:Buffer.from(JSON.stringify({...s.save(),storyContentVersion:'taihua-1.0.0'}))});
 await expect(page.getByRole('dialog')).toContainText('作品或版本不兼容');
 expect(await page.evaluate(()=>localStorage.getItem('jianghu:chronicle:longmen:v1:auto'))).toBe(before);
 await page.keyboard.press('Escape');expect(errors).toEqual([]);await page.screenshot({path:`docs/evidence/v6/longmen-editorial-archive-v1-ending-${route}.png`});
 writeFileSync(`docs/evidence/v6/longmen-editorial-archive-v1-browser-${route}.json`,JSON.stringify({actualInputs:true,humanPlaytest:false,ending:s.frame.ending,decisions,beats:s.frames.length,scenes:[...scenes],errors},null,2));
});
