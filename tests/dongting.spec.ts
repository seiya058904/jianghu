import {test,expect} from '@playwright/test';
import {writeFileSync} from 'node:fs';
import {VNRuntime} from '../src/vn-runtime.ts';
import content from '../src/generated/dongting.json' with {type:'json'};
test.describe.configure({mode:'parallel'});
for(const cargo of [false,true])test(`Dongting full actual browser ${cargo?'cargo':'company'}, vote and different personal aftermath`,async({page})=>{
 test.setTimeout(120000);const errors:string[]=[];page.on('pageerror',e=>errors.push(e.message));
 await page.addInitScript(()=>localStorage.setItem('jianghu:chronicle:dongting:v1:settings',JSON.stringify({speed:0,reduced:true,size:20})));
 await page.goto('/');await page.getByRole('button',{name:'选篇',exact:true}).click();await page.getByRole('link',{name:'照水刀 · 问席',exact:true}).click();
 await page.getByRole('button',{name:'接住船边那根绳',exact:true}).click();
 const s=new VNRuntime(content,'dongting-1.0.0');let choices=0;
 while(!s.frame.ending){
  await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);
  if(s.frame.choices.length){const selected=(cargo?s.frame.choices.find(c=>c.id==='dt_save_cargo'):undefined)??s.frame.choices[0];const button=page.locator(`[data-choice="${selected.id}"]`);await expect(button).toBeEnabled();if(selected.id.startsWith('dt_save_'))await page.screenshot({path:`docs/evidence/v6/dongting-choice-${cargo}.png`});await button.click();s.choose(selected.id);choices++}
  else{const next=page.locator('#advance-button');await expect(next).toBeEnabled();await next.click();s.advance()}
 }
 await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);expect(s.frame.ending).toBe(cargo?'dt_cargo':'dt_company');
 await page.reload();await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);await expect(page.locator('#scene-time')).toContainText('三年后');
 expect(errors).toEqual([]);await page.screenshot({path:`docs/evidence/v6/dongting-ending-${cargo}.png`});
 writeFileSync(`docs/evidence/v6/dongting-browser-${cargo}.json`,JSON.stringify({actualInputs:true,humanPlaytest:false,ending:s.frame.ending,beats:s.frames.length,choices,errors},null,2));
});
