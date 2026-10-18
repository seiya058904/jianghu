import {test,expect} from '@playwright/test';
import {readFileSync} from 'node:fs';
import {VNRuntime} from '../src/vn-runtime.ts';
import {chronicleWorks} from '../src/chronicle-catalog.ts';
import {evidencePath} from './evidence-path.ts';
import {observeServiceWorkerFetchWrites} from './service-worker-cache-drain.ts';

for(const slug of ['taihua','longmen','twelfth-life','qingshi','dead-ranking','jade-thieves'])test(`short landscape ${slug}: people remain visible beside 24px replies`,async({browser})=>{
 const work=chronicleWorks.find(w=>w.slug===slug)!;
 const state=new VNRuntime(JSON.parse(readFileSync(`src/generated/${slug}.json`,'utf8')),work.version);
 while(!state.frame.choices.length){if(state.frame.ending)throw Error('missing first reply');state.advance()}
 for(const dark of [false,true]){
  const context=await browser.newContext({viewport:{width:800,height:360},reducedMotion:'reduce'}),page=await context.newPage();
  try{
   await page.addInitScript(({prefix,raw,dark})=>{if(!localStorage.getItem(prefix+'auto'))localStorage.setItem(prefix+'auto',raw);localStorage.setItem(prefix+'settings',JSON.stringify({size:24,speed:0,reduced:true,dark}))},{prefix:work.prefix,raw:JSON.stringify(state.save()),dark});
   await page.goto('/'+work.file+'#play');await expect(page.locator('#dialogue-visible')).toHaveText(state.frame.text);
   const actors=page.locator('.actor');
   for(let i=0;i<await actors.count();i++){const box=await actors.nth(i).boundingBox();expect(box!.height).toBeGreaterThanOrEqual(170);expect(box!.x).toBeGreaterThanOrEqual(0);expect(box!.x+box!.width).toBeLessThanOrEqual(410)}
   for(const id of state.frame.choices.map(c=>c.id)){
    const choice=page.locator(`[data-choice="${id}"]`);await choice.scrollIntoViewIfNeeded();const box=await choice.boundingBox();expect(box!.y).toBeGreaterThanOrEqual(0);expect(box!.y+box!.height).toBeLessThanOrEqual(360);
    expect(await choice.evaluate(n=>{const r=n.getBoundingClientRect(),hit=document.elementFromPoint(r.x+r.width/2,r.y+r.height/2);return hit!==null&&n.contains(hit)})).toBe(true);
   }
   expect(await page.evaluate(()=>document.documentElement.scrollWidth<=innerWidth)).toBe(true);
   await page.screenshot({path:evidencePath(`docs/evidence/experience-landscape-${slug}-${dark?'dark':'paper'}.png`)});
   await page.locator('[data-choice]').first().click();await expect(page.locator('#app')).not.toHaveAttribute('data-beat',state.frame.id);
   const beat=await page.locator('#app').getAttribute('data-beat');await page.reload();await expect(page.locator('#app')).toHaveAttribute('data-beat',beat!);
  }finally{await context.close()}
 }
});

test('keyboard advance reaches replies without dropping focus or selecting a reply',async({page})=>{
 const prefix='jianghu:vn:v2:';
 await page.addInitScript(p=>localStorage.setItem(p+'settings',JSON.stringify({speed:0,reduced:true})),prefix);
 await page.goto('/half-step.html');await page.getByRole('button',{name:'走进院子',exact:true}).click();
 await page.locator('#advance-button').focus();await page.keyboard.down('Enter');
 await expect(page.locator('#app')).toHaveAttribute('data-phase','awaitingChoice');
 const before=await page.evaluate(p=>localStorage.getItem(p+'auto'),prefix);
 await page.keyboard.down('Enter');
 await expect(page.locator('[data-choice]').first()).toBeFocused();
 await page.keyboard.down('Enter');await page.keyboard.up('Enter');
 expect(await page.evaluate(p=>localStorage.getItem(p+'auto'),prefix)).toBe(before);
 await expect(page.locator('[data-choice]').first()).toBeEnabled();
 await page.keyboard.press('Tab');await expect(page.locator('[data-choice]').nth(1)).toBeFocused();
 await page.keyboard.press('Shift+Tab');await expect(page.locator('[data-choice]').first()).toBeFocused();
 await page.keyboard.press('Space');await expect(page.locator('#app')).toHaveAttribute('data-beat','bold_react');
});

for(const root of ['http://127.0.0.1:4173/','http://127.0.0.1:4175/Jianghu/']){
 test(`explicit work download repairs stable art bytes and retains previous-version packs at ${root}`,async({browser})=>{
  const context=await browser.newContext(),page=await context.newPage();
  try{
   await page.goto(root+'taihua.html');const drain=await observeServiceWorkerFetchWrites(page);await page.reload();await drain();
   const resource=new URL('art/v6/taihua-guest.webp',root).href;
   const oldOnly=new URL('assets/previous-work-only.js',root).href;
   await page.evaluate(async({resource,oldOnly})=>{
    const cache=await caches.open('jianghu-v6-shell-0.2');await cache.put(resource,new Response('old deployment art'));
    await(await caches.open('jianghu-v6-shell-0.1')).put(oldOnly,new Response('previous downloaded work'));
   },{resource,oldOnly});
   await page.getByRole('button',{name:'设置',exact:true}).click();
   await page.getByRole('button',{name:'下载《太华试序 · 三年之约》离线资源',exact:true}).click();
   await expect(page.getByRole('dialog')).toContainText('离线资源已备好');
   await context.setOffline(true);
   const bytes=await page.evaluate(async url=>Array.from(new Uint8Array(await(await fetch(url)).arrayBuffer())),resource);
   expect(Buffer.from(bytes)).toEqual(readFileSync('public/art/v6/taihua-guest.webp'));
   expect(await page.evaluate(async url=>(await fetch(url)).text(),oldOnly)).toBe('previous downloaded work');
   await page.screenshot({path:evidencePath(`docs/evidence/experience-offline-repair-${root.includes('4175')?'subpath':'root'}.png`)});
  }finally{await context.close()}
 });
 for(const slug of ['dead-ranking','luhua'])test(`authentic pre-experience ${slug} auto stays exportable while text is corrected at ${root}`,async({page})=>{
  const work=chronicleWorks.find(w=>w.slug===slug)!;
  const old=JSON.parse(readFileSync(`src/generated/experience-pre-audit/${slug}.json`,'utf8'));
  const state=new VNRuntime(old,work.version),overrides=['dr_ask_night_first','dr_ask_own_words'];
  const target=slug==='dead-ranking'?'dr_living_benefit_8':'lh_own_sleeve_3';
  while(state.frame.id!==target){if(state.frame.ending)throw Error('missing target');state.frame.choices.length?state.choose(state.frame.choices.find(c=>overrides.includes(c.id))?.id??state.frame.choices[0].id):state.advance()}
  const raw=JSON.stringify(state.save());
  await page.addInitScript(({prefix,raw})=>{if(!localStorage.getItem(prefix+'auto')){localStorage.setItem(prefix+'auto',raw);localStorage.setItem(prefix+'slot1',raw)}localStorage.setItem(prefix+'settings',JSON.stringify({speed:0,reduced:true}))},{prefix:work.prefix,raw});
  await page.goto(root+work.file+'#play');await expect(page.locator('#app')).toHaveAttribute('data-beat',target);
  await expect(page.locator('#dialogue-visible')).toContainText(slug==='dead-ranking'?'先问二月十六夜':'私谈，你并未在场');
  expect(await page.evaluate(p=>localStorage.getItem(p+'slot1'),work.prefix)).toBe(raw);
  await page.getByRole('button',{name:'存档',exact:true}).click();
  const downloaded=page.waitForEvent('download');await page.locator('[data-action="slot-export"][data-slot^="draft-"]').first().click();
  expect(readFileSync((await(await downloaded).path())!,'utf8')).toBe(raw);
  await page.keyboard.press('Escape');await page.reload();await expect(page.locator('#app')).toHaveAttribute('data-beat',target);
  await page.screenshot({path:evidencePath(`docs/evidence/experience-${slug}-corrected-${root.includes('4175')?'subpath':'root'}.png`)});
 });
}
