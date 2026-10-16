import {test,expect} from '@playwright/test';
import {readFileSync,writeFileSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {VNRuntime} from '../src/vn-runtime.ts';
import content from '../src/generated/campaign-v6.json' with {type:'json'};
import {campaignRoutes,pickChoice} from './campaign-routes.ts';
test.describe.configure({mode:'parallel'});
const routes={...campaignRoutes,stay:['route_stay']};
for(const [route,preferred] of Object.entries(routes))test(`default V6 actual browser complete ${route}`,async({page})=>{
 test.setTimeout(300000);
 const errors:string[]=[];page.on('pageerror',e=>errors.push(e.message));
 await page.addInitScript(()=>{
  localStorage.setItem('jianghu:campaign:tide:v2:settings',JSON.stringify({speed:0,reduced:true,size:20}));
  localStorage.setItem('jianghu:campaign:tide:v1:auto','frozen-v5-sentinel');
  localStorage.setItem('jianghu:vn:v2:auto','old-half-sentinel');
 });
 await page.setViewportSize({width:['scar','lost'].includes(route)?390:1440,height:['scar','lost'].includes(route)?844:900});
 await page.goto('/');await page.getByRole('button',{name:'启程 · 青蒲渡',exact:true}).click();
 const s=new VNRuntime(content,'tide-promise-2.0.0');const scenes=new Set<string>();let decisions=0;const restoredCheckpoints:string[]=[];
 while(!s.frame.ending){
  await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);
  await expect(page.locator('#dialogue-visible')).toHaveText(s.frame.text);
  const scene=s.frame.stage.scene;
  if(!scenes.has(scene)){
   scenes.add(scene);
   if(['v6_depart','v6_contract','v6_wind','v6_levee'].includes(scene)){
    await expect.poll(()=>page.evaluate(()=>JSON.parse(localStorage.getItem('jianghu:campaign:tide:v2:auto')!).presentation.beatId)).toBe(s.frame.id);
    await page.reload();await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);await expect(page.locator('#dialogue-visible')).toHaveText(s.frame.text);restoredCheckpoints.push(scene);
   }
   if(route==='stay'&&s.frame.choices.length)await page.screenshot({path:`docs/evidence/v6/default-entry-main-stay-${scene}.png`});
  }
  if(s.frame.choices.length){
   const selected=pickChoice(s.frame.choices,preferred);
   const button=page.locator(`[data-choice="${selected.id}"]`);await expect(button).toBeEnabled();await button.click();s.choose(selected.id);decisions++;
  }else{const next=page.locator('#advance-button');await expect(next).toBeEnabled();await next.click();s.advance()}
 }
 await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);
 expect(s.frame.ending).toBe(route==='stay'?'harbor':route);
 await page.reload();await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);
 expect(await page.evaluate(()=>localStorage.getItem('jianghu:campaign:tide:v1:auto'))).toBe('frozen-v5-sentinel');
 expect(await page.evaluate(()=>localStorage.getItem('jianghu:vn:v2:auto'))).toBe('old-half-sentinel');
 expect(errors).toEqual([]);expect(restoredCheckpoints).toHaveLength(4);
 const stored=await page.evaluate(()=>JSON.parse(localStorage.getItem('jianghu:campaign:tide:v2:auto')!));expect(stored.commands).toEqual(s.commands);expect(stored.presentation).toEqual(JSON.parse(JSON.stringify(s.save().presentation)));expect(JSON.parse(stored.runtime).variablesState).toEqual(JSON.parse(s.save().runtime).variablesState);
 expect(await page.evaluate(()=>document.documentElement.scrollWidth<=innerWidth)).toBe(true);
 await page.locator('.scene-background,.portrait').evaluateAll(async ns=>{for(const n of ns)for(const m of getComputedStyle(n).backgroundImage.matchAll(/url\(["']?([^"')]+)["']?\)/g)){const im=new Image();im.src=m[1];await im.decode();if(im.naturalWidth<100)throw Error(im.src)}});
 await page.screenshot({path:`docs/evidence/v6/default-entry-main-ending-${route}.png`});
 writeFileSync(`docs/evidence/v6/default-entry-main-browser-${route}.json`,JSON.stringify({version:'tide-promise-2.0.0',route,actualInputs:true,humanPlaytest:false,contentSHA256:createHash('sha256').update(readFileSync('src/generated/campaign-v6.json')).digest('hex'),restoredCheckpoints,assertedProductionTextEveryBeat:true,assertedEndingVariablesAndCommands:true,beats:s.frames.length,decisions,scenes:[...scenes],ending:s.frame.ending,errors},null,2));
});
