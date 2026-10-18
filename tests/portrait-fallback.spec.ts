import {test,expect} from '@playwright/test';
import {VNRuntime} from '../src/vn-runtime.ts';
import current from '../src/generated/twelfth-life.json' with {type:'json'};
import frozen from '../src/generated/twelfth-life-v2.json' with {type:'json'};
import {evidencePath} from './evidence-path.ts';

for(const [slug,content,version,prefix,image] of [
 ['twelfth-life',current,'twelfth-life-3.0.0','jianghu:chronicle:twelfth-life:v3:','rl-lu-mid.webp'],
 ['twelfth-life-v2',frozen,'twelfth-life-2.0.0','jianghu:chronicle:twelfth-life:v2:','rl-lu-mid-amused.webp'],
] as const)test(`${slug} keeps the intended same-age Lu portrait after refresh`,async({page})=>{
 const state=new VNRuntime(content,version);
 while(state.frame.id!=='rl_seal_books_3'){
  if(state.frame.ending)throw Error('Missing portrait scene');
  state.frame.choices.length?state.choose(state.frame.choices[0].id):state.advance();
 }
 expect(state.frame.stage.moods.rl2_lu).toBe('amused');
 await page.addInitScript(({raw,prefix})=>{
  localStorage.setItem(prefix+'auto',raw);
  localStorage.setItem(prefix+'settings',JSON.stringify({speed:0,reduced:true,size:20}));
 },{raw:JSON.stringify(state.save()),prefix});
 await page.goto(`/${slug}.html#play`);
 const actor=page.locator('[data-character="rl2_lu"]');
 await expect(page.locator('#app')).toHaveAttribute('data-beat',state.frame.id);
 await expect(actor).toHaveAttribute('data-look','mid');
 await expect(actor).toBeVisible();
 await expect(page.locator('.play-stage')).toHaveAttribute('data-cg','');
 await expect(actor).toHaveAttribute('style',new RegExp(image.replaceAll('.','\\.')));
 await page.screenshot({path:evidencePath(`docs/evidence/independent-lu-${slug}.png`)});
 await page.reload();
 await expect(page.locator('#app')).toHaveAttribute('data-beat',state.frame.id);
 await expect(actor).toHaveAttribute('style',new RegExp(image.replaceAll('.','\\.')));
});
