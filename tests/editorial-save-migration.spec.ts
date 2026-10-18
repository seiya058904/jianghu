import {test,expect} from '@playwright/test';
import {readFileSync} from 'node:fs';
import {VNRuntime} from '../src/vn-runtime.ts';
import {chronicleWorks} from '../src/chronicle-catalog.ts';

const work=chronicleWorks.find(work=>work.slug==='longmen')!;
const old=JSON.parse(readFileSync('src/generated/independent-pre-audit/longmen.json','utf8'));
const current=JSON.parse(readFileSync('src/generated/longmen.json','utf8'));
function oldSave(){
 const state=new VNRuntime(old,work.version),wanted=new Set(['lm_route_guest','lm_deliver_exact']),hit=new Set<string>();
 while(state.frame.id!=='lm_sore_14'){
  if(state.frame.ending)throw Error('old target unreachable');
  if(state.frame.choices.length){const id=state.frame.choices.find(c=>wanted.has(c.id))?.id??state.frame.choices[0].id;hit.add(id);state.choose(id);}else state.advance();
 }
 expect([...wanted].every(id=>hit.has(id))).toBeTruthy();
 expect(state.frame.text).toContain('看见我输这一回');
 return JSON.stringify(state.save());
}
async function originals(page:import('@playwright/test').Page){return page.evaluate(prefix=>Object.entries(localStorage).filter(([key])=>key.startsWith(prefix+'draft-')).map(([,raw])=>raw),work.prefix);}

test('real pre-audit auto is corrected, raw manual and downloaded backup stay byte exact',async({page})=>{
 const raw=oldSave();await page.addInitScript(({raw,prefix})=>{
  if(localStorage.getItem(prefix+'auto')!==null)return;
  localStorage.setItem(prefix+'auto',raw);localStorage.setItem(prefix+'slot1',raw);
  localStorage.setItem(prefix+'settings',JSON.stringify({speed:0,reduced:true}));
 },{raw,prefix:work.prefix});
 await page.goto('/longmen.html#play');
 await expect(page.locator('#app')).toHaveAttribute('data-beat','lm_sore_14');
 await expect(page.locator('#dialogue-visible')).toContainText('看见我只同罗先生打平');
 expect(await originals(page)).toContain(raw);
 expect(await page.evaluate(prefix=>localStorage.getItem(prefix+'slot1'),work.prefix)).toBe(raw);
 const migrated=await page.evaluate(prefix=>localStorage.getItem(prefix+'auto')!,work.prefix);
 expect(migrated).not.toBe(raw);expect(JSON.parse(migrated).commands).toEqual(JSON.parse(raw).commands);
 await page.getByRole('button',{name:'存档',exact:true}).click();
 const downloaded=page.waitForEvent('download');
 await page.locator('[data-action="slot-export"][data-slot^="draft-"]').first().click();
 expect(readFileSync((await(await downloaded).path())!,'utf8')).toBe(raw);
 await page.keyboard.press('Escape');await page.reload();
 await expect(page.locator('#dialogue-visible')).toContainText('看见我只同罗先生打平');
});

test('old manual load and file import preserve original bytes while applying corrected text',async({page})=>{
 const raw=oldSave(),fresh=JSON.stringify(new VNRuntime(current,work.version).save());
 await page.addInitScript(({raw,fresh,prefix})=>{
  localStorage.setItem(prefix+'auto',fresh);localStorage.setItem(prefix+'slot1',raw);
  localStorage.setItem(prefix+'settings',JSON.stringify({speed:0,reduced:true}));
 },{raw,fresh,prefix:work.prefix});
 await page.goto('/longmen.html#play');await page.getByRole('button',{name:'存档',exact:true}).click();
 await page.locator('[data-action="slot-load"][data-slot="slot1"]').click();
 await expect(page.locator('#dialogue-visible')).toContainText('看见我只同罗先生打平');
 expect(await page.evaluate(prefix=>localStorage.getItem(prefix+'slot1'),work.prefix)).toBe(raw);
 expect(await page.evaluate(prefix=>localStorage.getItem(prefix+'previous'),work.prefix)).toBe(fresh);
 expect(await originals(page)).toContain(raw);
 await page.getByRole('button',{name:'存档',exact:true}).click();
 await page.locator('#import-file').setInputFiles({name:'real-old-longmen.json',mimeType:'application/json',buffer:Buffer.from(raw)});
 await expect(page.locator('#dialogue-visible')).toContainText('看见我只同罗先生打平');
 expect(await originals(page)).toContain(raw);
});

test('failed editorial backup cannot replace either old auto or occupied manual slot',async({page})=>{
 const raw=oldSave();await page.addInitScript(({raw,prefix})=>{
  localStorage.setItem(prefix+'auto',raw);localStorage.setItem(prefix+'slot1',raw);
  localStorage.setItem(prefix+'settings',JSON.stringify({speed:0,reduced:true}));
  const set=Storage.prototype.setItem;Storage.prototype.setItem=function(key,value){
   if(key.startsWith(prefix+'draft-'))throw new DOMException('backup quota','QuotaExceededError');
   return set.call(this,key,value);
  };
 },{raw,prefix:work.prefix});
 await page.goto('/longmen.html#play');
 await expect(page.locator('#dialogue-visible')).toContainText('看见我只同罗先生打平');
 expect(await page.evaluate(prefix=>localStorage.getItem(prefix+'auto'),work.prefix)).toBe(raw);
 await page.locator('#advance-button').click();
 await expect(page.locator('#app')).not.toHaveAttribute('data-beat','lm_sore_14');
 expect(await page.evaluate(prefix=>localStorage.getItem(prefix+'auto'),work.prefix)).toBe(raw);
 await page.getByRole('button',{name:'存档',exact:true}).click();
 await page.locator('[data-action="slot-save"][data-slot="slot1"]').click();
 await page.getByRole('button',{name:'确认替换',exact:true}).click();
 expect(await page.evaluate(prefix=>localStorage.getItem(prefix+'slot1'),work.prefix)).toBe(raw);
 await page.getByRole('button',{name:'返回存档',exact:true}).click();
 const downloaded=page.waitForEvent('download');await page.locator('[data-action="export"]').click();
 expect(JSON.parse(readFileSync((await(await downloaded).path())!,'utf8')).commands.length).toBeGreaterThan(JSON.parse(raw).commands.length);
});

test('auto-only quota keeps authentic old auto and a downloadable original backup',async({page})=>{
 const raw=oldSave();await page.addInitScript(({raw,prefix})=>{
  localStorage.setItem(prefix+'auto',raw);localStorage.setItem(prefix+'settings',JSON.stringify({speed:0,reduced:true}));
  const set=Storage.prototype.setItem;Storage.prototype.setItem=function(key,value){
   if(key===prefix+'auto')throw new DOMException('auto quota','QuotaExceededError');
   return set.call(this,key,value);
  };
 },{raw,prefix:work.prefix});
 await page.goto('/longmen.html#play');await expect(page.locator('#dialogue-visible')).toContainText('看见我只同罗先生打平');
 expect(await page.evaluate(prefix=>localStorage.getItem(prefix+'auto'),work.prefix)).toBe(raw);expect(await originals(page)).toContain(raw);
 await page.getByRole('button',{name:'存档',exact:true}).click();const downloaded=page.waitForEvent('download');
 await page.locator('[data-action="slot-export"][data-slot^="draft-"]').first().click();
 expect(readFileSync((await(await downloaded).path())!,'utf8')).toBe(raw);
});

test('import backup failure preserves the current session and raw auto',async({page})=>{
 const raw=oldSave(),fresh=JSON.stringify(new VNRuntime(current,work.version).save());
 await page.addInitScript(({fresh,prefix})=>{
  localStorage.setItem(prefix+'auto',fresh);localStorage.setItem(prefix+'settings',JSON.stringify({speed:0,reduced:true}));
  const set=Storage.prototype.setItem;Storage.prototype.setItem=function(key,value){
   if(key.startsWith(prefix+'draft-'))throw new DOMException('backup quota','QuotaExceededError');
   return set.call(this,key,value);
  };
 },{fresh,prefix:work.prefix});
 const beat=new VNRuntime(current,work.version).frame.id;
 await page.goto('/longmen.html#play');await expect(page.locator('#app')).toHaveAttribute('data-beat',beat);
 await page.getByRole('button',{name:'存档',exact:true}).click();
 await page.locator('#import-file').setInputFiles({name:'real-old-longmen.json',mimeType:'application/json',buffer:Buffer.from(raw)});
 await expect(page.getByRole('dialog')).toContainText('backup quota');
 await expect(page.locator('#app')).toHaveAttribute('data-beat',beat);
 expect(await page.evaluate(prefix=>localStorage.getItem(prefix+'auto'),work.prefix)).toBe(fresh);
});

test('ordinary current manual replacement does not require or accumulate migration backups',async({page})=>{
 const fresh=JSON.stringify(new VNRuntime(current,work.version).save());
 await page.addInitScript(({fresh,prefix})=>{
  localStorage.setItem(prefix+'auto',fresh);localStorage.setItem(prefix+'slot1',fresh);localStorage.setItem(prefix+'settings',JSON.stringify({speed:0,reduced:true}));
  const set=Storage.prototype.setItem;Storage.prototype.setItem=function(key,value){
   if(key.startsWith(prefix+'draft-'))throw new DOMException('unnecessary backup','QuotaExceededError');
   return set.call(this,key,value);
  };
 },{fresh,prefix:work.prefix});
 await page.goto('/longmen.html#play');await page.locator('#advance-button').click();
 await expect(page.locator('#app')).not.toHaveAttribute('data-beat',new VNRuntime(current,work.version).frame.id);
 await page.getByRole('button',{name:'存档',exact:true}).click();await page.locator('[data-action="slot-save"][data-slot="slot1"]').click();
 await page.getByRole('button',{name:'确认替换',exact:true}).click();
 await expect(page.getByRole('heading',{name:'存档与备份',exact:true})).toBeVisible();
 const saved=await page.evaluate(prefix=>localStorage.getItem(prefix+'slot1')!,work.prefix);
 expect(JSON.parse(saved).commands.length).toBeGreaterThan(JSON.parse(fresh).commands.length);expect(await originals(page)).toEqual([]);
});

test('root and subpath work downloads retain old-save compatibility through cold offline reload',async({browser})=>{
 for(const root of ['http://127.0.0.1:4173/','http://127.0.0.1:4175/Jianghu/']){
  const context=await browser.newContext(),page=await context.newPage(),raw=oldSave();
  await page.goto(root+'longmen.html');await page.evaluate(async()=>{await navigator.serviceWorker.ready});await page.reload();
  await page.getByRole('button',{name:'设置',exact:true}).click();
  await page.getByRole('button',{name:'下载《龙门问刀》离线资源',exact:true}).click();
  await expect(page.getByRole('dialog')).toContainText('离线资源已备好');await page.keyboard.press('Escape');
  await page.evaluate(({raw,prefix})=>{localStorage.setItem(prefix+'auto',raw);localStorage.setItem(prefix+'settings',JSON.stringify({speed:0,reduced:true}));},{raw,prefix:work.prefix});
  await context.setOffline(true);await page.goto(root+'longmen.html#play');await page.reload();
  await expect(page.locator('#dialogue-visible')).toContainText('看见我只同罗先生打平');expect(await originals(page)).toContain(raw);
  await context.close();
 }
});
