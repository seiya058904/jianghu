import {evidencePath} from './evidence-path.ts';
import {test,expect} from '@playwright/test';
import {VNRuntime} from '../src/vn-runtime.ts';
import qingshi from '../src/generated/qingshi.json' with {type:'json'};
import main from '../src/generated/campaign-v6.json' with {type:'json'};
import half from '../src/generated/duel.json' with {type:'json'};
// qingshi 的现行版自 V7 起是 3.0.0（v3 前缀）；旧版存档会被迁移保护拒绝，data-beat 恒空。
const works=[{id:'qingshi',file:'qingshi.html',content:qingshi,version:'qingshi-3.0.0',prefix:'jianghu:chronicle:qingshi:v3:'},{id:'main',file:'tide-v6.html',content:main,version:'tide-promise-2.0.0',prefix:'jianghu:campaign:tide:v2:'},{id:'half',file:'half-step.html',content:half,version:'half-step-1.0.1',prefix:'jianghu:vn:v2:'}];
for(const work of works){
 const s=new VNRuntime(work.content,work.version);const snapshots:Record<string,ReturnType<VNRuntime['save']>>={};let longest=0,longestChoices=0;
 while(true){const f=s.frame;if(!f.ending&&!f.choices.length&&!f.stage.cg&&f.text.length>longest){longest=f.text.length;snapshots.long=s.save()}if(f.choices.length){const length=f.text.length+f.choices.reduce((n,c)=>n+c.text.length,0);if(length>longestChoices){longestChoices=length;snapshots.choice=s.save()}}if(f.ending){snapshots.ending=s.save();break}f.choices.length?s.choose(f.choices[0].id):s.advance()}
 for(const kind of ['long','choice','ending'])test(`short landscape ${work.id} ${kind}: real controls remain visible at 24px`,async({browser})=>{
  const save=snapshots[kind];expect(save).toBeTruthy();
  for(const width of [800,640]){
   const context=await browser.newContext({viewport:{width,height:360},reducedMotion:'reduce'}),page=await context.newPage();
   await page.addInitScript(({prefix,raw})=>{localStorage.setItem(prefix+'auto',raw);localStorage.setItem(prefix+'settings',JSON.stringify({speed:0,reduced:true,size:24}))},{prefix:work.prefix,raw:JSON.stringify(save)});
   await page.goto('/'+work.file+'#play');await expect(page.locator('#app')).toHaveAttribute('data-beat',save.presentation.beatId);
   const panel=await page.locator('#dialogue-panel').boundingBox();expect(panel!.y+panel!.height).toBeLessThanOrEqual(361);
   expect(await page.evaluate(()=>document.documentElement.scrollWidth<=innerWidth)).toBe(true);
   const control=kind==='ending'?page.getByRole('button',{name:'收好这一程',exact:true}):kind==='choice'?page.locator('[data-choice]').first():page.locator('#advance-button');
   if(kind==='long'){
    const copy=page.getByRole('region',{name:'对白正文，可滚动阅读'});await expect(copy).toHaveAttribute('tabindex','0');
    if(await copy.evaluate(n=>n.scrollHeight>n.clientHeight+1)){
     await copy.focus();await page.keyboard.press('End');await expect.poll(()=>copy.evaluate(n=>n.scrollTop)).toBeGreaterThan(0);
     await expect(page.locator('#app')).toHaveAttribute('data-beat',save.presentation.beatId);
    }
   }
   const box=await control.boundingBox();expect(box).not.toBeNull();expect(box!.y).toBeGreaterThanOrEqual(0);expect(box!.y+box!.height).toBeLessThanOrEqual(361);
   expect(await control.evaluate(n=>{const r=n.getBoundingClientRect();const hit=document.elementFromPoint(r.x+r.width/2,r.y+r.height/2);return Boolean(hit&&(n===hit||n.contains(hit)))})).toBe(true);
   if(width===800)await page.screenshot({path:evidencePath(`docs/evidence/v6/landscape-${work.id}-${kind}.png`)});
   await control.click();if(kind==='ending')await expect(page.getByRole('dialog')).toBeVisible();else await expect(page.locator('#app')).not.toHaveAttribute('data-beat',save.presentation.beatId);
   await context.close();
  }
 });
}
