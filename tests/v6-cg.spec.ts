import {evidencePath} from './evidence-path.ts';
import {test,expect} from '@playwright/test';
import {readFileSync} from 'node:fs';
import {VNRuntime} from '../src/vn-runtime.ts';
import {cgs} from '../src/cg-catalog.ts';
// 现行版自 V7 起是 3.0.0（qingshi/kuhe/taihua/longmen 的 v3 前缀）；2.0.0 是冻结旧稿，
// 存档迁移保护会拒绝把 2.0.0 存档恢复到 3.0.0 页面上（data-beat 恒空），因此这里跟着升版。
const cases=[
 {work:'qingshi',version:'qingshi-3.0.0',cg:'oldKnife'},
 {work:'kuhe',version:'kuhe-3.0.0',cg:'oldPillars'},
 {work:'taihua',version:'taihua-3.0.0',cg:'nightCompany'},
 {work:'taihua',version:'taihua-3.0.0',cg:'mountainInquiry'},
 {work:'longmen',version:'longmen-3.0.0',cg:'woodenInquiry'},
 {work:'longmen',version:'longmen-3.0.0',cg:'longmenNight'},
 {work:'dongting',version:'dongting-1.0.0',cg:'lakeRest'},
 {work:'twelfth',version:'twelfth-1.0.0',cg:'notice'},
 {work:'campaign-v6',version:'tide-promise-2.0.0',cg:'timber'},
];
function atCG(item:typeof cases[number]){
 const s=new VNRuntime(JSON.parse(readFileSync(`src/generated/${item.work}.json`,'utf8')),item.version);
 while(s.frame.stage.cg!==item.cg){
  if(s.frame.ending)throw new Error(`Missing playable CG ${item.cg}`);
  if(s.frame.choices.length){const chosen=s.frame.choices.find(c=>['route_stay','v6_tie_flag'].includes(c.id))??s.frame.choices[0];s.choose(chosen.id)}else s.advance();
 }
 return s;
}
function seed(item:typeof cases[number],story:VNRuntime){
 const main=item.work==='campaign-v6';return{file:main?'tide-v6.html':item.work+'.html',prefix:main?'jianghu:campaign:tide:v2:':`jianghu:chronicle:${item.work}:v${['taihua','longmen','kuhe','qingshi'].includes(item.work)?3:1}:`,raw:JSON.stringify(story.save())};
}
for(const item of cases)for(const width of [360,800,1440])test(`${item.cg}: existing illustration loads, restores and returns to reusable stage at ${width}`,async({page})=>{
 const errors:string[]=[];page.on('pageerror',e=>errors.push(e.message));
 const story=atCG(item),data=seed(item,story);await page.setViewportSize({width,height:width===360?800:width===800?360:900});
 await page.addInitScript(({prefix,raw})=>{if(!localStorage.getItem(prefix+'auto'))localStorage.setItem(prefix+'auto',raw);localStorage.setItem(prefix+'settings',JSON.stringify({speed:0,reduced:true,size:24}))},data);
 await page.goto('/'+data.file+'#play');await expect(page.locator('#app')).toHaveAttribute('data-beat',story.frame.id);
 await expect(page.locator('.play-stage')).toHaveAttribute('data-cg',item.cg);
 const style=await page.locator('.scene-background').getAttribute('style');expect(style).toContain(cgs[item.cg].file);
 expect(await page.evaluate(file=>new Promise<boolean>(resolve=>{const img=new Image();img.onload=()=>resolve(img.naturalWidth>=1000);img.onerror=()=>resolve(false);img.src=new URL('art/'+file,location.href).href}),cgs[item.cg].file)).toBe(true);
 expect(await page.evaluate(()=>document.documentElement.scrollWidth<=innerWidth)).toBe(true);
 const panel=await page.locator('#dialogue-panel').boundingBox();expect(panel&&panel.x>=0&&panel.y>=0&&panel.x+panel.width<=width+1).toBe(true);
 if(await page.locator('#choices-panel').isVisible()){
  const choice=await page.locator('#choices-panel').boundingBox();expect(choice&&panel&&choice.y+choice.height<=panel.y+1).toBe(true);
 }
 if(!story.frame.choices.length){
  const next=await page.locator('#advance-button').boundingBox();expect(next&&next.y>=0&&next.y+next.height<=(width===360?800:width===800?360:900)+1).toBe(true);
 }
 await page.screenshot({path:evidencePath(`docs/evidence/v6/cg-${item.cg}-${width}.png`)});
 await page.reload();await expect(page.locator('#app')).toHaveAttribute('data-beat',story.frame.id);
 for(let step=0;story.frame.stage.cg===item.cg&&step<6;step++){
  if(story.frame.choices.length){const choice=story.frame.choices[0];await page.locator(`[data-choice="${choice.id}"]`).click();story.choose(choice.id)}else{await page.locator('#advance-button').click();story.advance()}
  await expect(page.locator('#app')).toHaveAttribute('data-beat',story.frame.id);
 }
 expect(story.frame.stage.cg).not.toBe(item.cg);await expect(page.locator('.play-stage')).toHaveAttribute('data-cg','');expect(errors).toEqual([]);
});

test('failed illustration retains the scene fallback and playable text',async({page})=>{
 const item=cases.find(item=>item.cg==='nightCompany')!,story=atCG(item),data=seed(item,story);
 await page.route('**/art/v6/cg-taihua-night.webp',route=>route.abort());
 await page.addInitScript(({prefix,raw})=>{localStorage.setItem(prefix+'auto',raw);localStorage.setItem(prefix+'settings',JSON.stringify({speed:0,reduced:true}))},data);
 await page.goto('/'+data.file+'#play');await expect(page.locator('#app')).toHaveAttribute('data-beat',story.frame.id);
 const style=await page.locator('.scene-background').getAttribute('style');expect(style).toContain('cg-taihua-night.webp');expect(style).toContain('taihua-night.webp');
 await expect(page.locator('#dialogue-visible')).toHaveText(story.frame.text);
 await page.locator('#advance-button').click();story.advance();await expect(page.locator('#app')).toHaveAttribute('data-beat',story.frame.id);
});
