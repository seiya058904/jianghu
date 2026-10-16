import {test,expect} from '@playwright/test';
import {VNRuntime} from '../src/vn-runtime.ts';
import content from '../src/generated/taihua-v1.json' with {type:'json'};
async function decodedStage(page:any){await page.locator('.scene-background,.portrait').evaluateAll(async(nodes:Element[])=>{for(const n of nodes)for(const m of getComputedStyle(n).backgroundImage.matchAll(/url\([\"']?([^\"')]+)[\"']?\)/g)){const im=new Image();im.src=m[1];await im.decode();if(im.naturalWidth<100)throw Error(im.src)}})}
for(const route of [0,1])test(`Taihua complete actual browser path ${route}: independent saves, ending and reload`,async({page})=>{
 test.setTimeout(150000);
 const errors:string[]=[];page.on('pageerror',error=>errors.push(error.message));
 await page.addInitScript(()=>{
  localStorage.setItem('jianghu:chronicle:taihua:v1:settings',JSON.stringify({speed:0,reduced:true,size:20}));
  localStorage.setItem('jianghu:campaign:tide:v1:sentinel','main-progress');
  localStorage.setItem('jianghu:vn:v2:sentinel','half-progress');
 });
 await page.goto('/taihua-v1.html');await page.getByRole('button',{name:'接过替补的护腕'}).click();
 const story=new VNRuntime(content,'taihua-1.0.0');let count=0;const portraitStates=new Set<string>();
 while(!story.frame.ending){
  await expect(page.locator('#app')).toHaveAttribute('data-beat',story.frame.id);
  const mood=story.frame.stage.moods.th_shen??'neutral';
  if(route===0&&story.frame.stage.cast.includes('th_shen')&&['neutral','amused','intent'].includes(mood)&&!portraitStates.has(mood)){
   portraitStates.add(mood);await decodedStage(page);await page.screenshot({path:`docs/evidence/v6/taihua-editorial-archive-v1-shen-${mood}.png`});
  }
  if(story.frame.choices.length){
   const selected=story.frame.choices[route];
   const button=page.locator(`[data-choice="${selected.id}"]`);await expect(button).toBeEnabled();
   if(count===0)await decodedStage(page);
   if(count===0)await page.screenshot({path:`docs/evidence/v6/taihua-editorial-archive-v1-first-choice-${route}.png`});
   await button.click();story.choose(selected.id);count++;
  }else{const button=page.locator('#advance-button');await expect(button).toBeEnabled();await button.click();story.advance()}
 }
 await expect(page.locator('#app')).toHaveAttribute('data-beat',story.frame.id);
 await expect(page.locator('#ending-actions')).toContainText(route?'独行回山':'结伴复手');
 await page.reload();await expect(page.locator('#app')).toHaveAttribute('data-beat',story.frame.id);
 expect(await page.evaluate(()=>localStorage.getItem('jianghu:campaign:tide:v1:sentinel'))).toBe('main-progress');
 expect(await page.evaluate(()=>localStorage.getItem('jianghu:vn:v2:sentinel'))).toBe('half-progress');
 await decodedStage(page);await page.screenshot({path:`docs/evidence/v6/taihua-editorial-archive-v1-ending-${route}.png`});expect(errors).toEqual([]);
 if(route===0)expect(portraitStates.size).toBe(3);
});
