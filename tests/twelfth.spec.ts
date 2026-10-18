import {evidencePath} from './evidence-path.ts';
import {test,expect} from '@playwright/test';
import {writeFileSync} from 'node:fs';
import {VNRuntime} from '../src/vn-runtime.ts';
import content from '../src/generated/twelfth.json' with {type:'json'};
test.describe.configure({mode:'parallel'});
for(const route of [0,1])test(`Twelfth complete career ${route}, visible age changes and no deceased teacher on stage`,async({page})=>{
 test.setTimeout(150000);const errors:string[]=[];page.on('pageerror',e=>errors.push(e.message));
 await page.addInitScript(()=>localStorage.setItem('jianghu:chronicle:twelfth:v1:settings',JSON.stringify({speed:0,reduced:true,size:20})));
 await page.goto('/');await page.getByRole('button',{name:'选篇',exact:true}).click();await page.getByRole('link',{name:'第十二席',exact:true}).click();await page.getByRole('button',{name:'领一份陪练差事',exact:true}).click();
 const s=new VNRuntime(content,'twelfth-1.0.0'),looks=new Set<string>();let decisions=0;
 while(!s.frame.ending){
  await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);
  const look=s.frame.stage.looks?.qw_zhao;
  if(look&&s.frame.stage.cast.includes('qw_zhao')&&!looks.has(look)){
   looks.add(look);const actor=page.locator('[data-character="qw_zhao"]');await expect(actor).toHaveAttribute('style',new RegExp('qw-zhao-'+look.slice(3)+'(?:-[a-z]+)?\\.webp'));
   await page.screenshot({path:evidencePath(`docs/evidence/v6/twelfth-${look}-${route}.png`)});
  }
  if(s.frame.text.includes('三日后陈去世'))await expect(page.locator('[data-character="qw_chen"]')).toHaveCount(0);
  if(s.frame.choices.length){const selected=s.frame.choices[route],button=page.locator(`[data-choice="${selected.id}"]`);await expect(button).toBeEnabled();await button.click();s.choose(selected.id);decisions++}
  else{const next=page.locator('#advance-button');await expect(next).toBeEnabled();await next.click();s.advance()}
 }
 await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);expect(s.frame.ending).toBe(route?'qw_palace':'qw_school');expect([...looks]).toEqual(['age44','age52','age58']);
 await page.reload();await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);
 expect(errors).toEqual([]);await page.screenshot({path:evidencePath(`docs/evidence/v6/twelfth-ending-${route}.png`)});
 writeFileSync(evidencePath(`docs/evidence/v6/twelfth-browser-${route}.json`),JSON.stringify({actualInputs:true,humanPlaytest:false,ending:s.frame.ending,looks:[...looks],beats:s.frames.length,decisions,errors},null,2));
});
