import {evidencePath} from './evidence-path.ts';
import {test,expect} from '@playwright/test';
import {VNRuntime} from '../src/vn-runtime';
import frozen from '../src/generated/campaign-v5-1.0.0.json' with {type:'json'};
test('frozen v5 entry resumes actual old pending choice on root and subpath',async({page})=>{
 const s=new VNRuntime(frozen,'tide-promise-1.0.0');while(!s.frame.choices.length)s.advance();const saved=JSON.stringify(s.save());
 const errors:string[]=[];page.on('pageerror',e=>errors.push(e.message));
 await page.addInitScript(raw=>{localStorage.setItem('jianghu:campaign:tide:v1:auto',raw);localStorage.setItem('jianghu:campaign:tide:v1:settings',JSON.stringify({size:20,speed:0,reduced:true}));localStorage.setItem('jianghu:vn:v2:auto','preserve-halfstep');localStorage.setItem('jianghu:v1:auto','preserve-reader')},saved);
 await page.emulateMedia({reducedMotion:'reduce'});
 for(const url of ['/tide-v5.html#play','http://127.0.0.1:4175/Jianghu/tide-v5.html#play']){
  await page.goto(url);await expect(page.locator('#app')).toHaveAttribute('data-beat',s.frame.id);
  await expect(page.locator('[data-choice="save_child"]')).toBeEnabled();await page.waitForTimeout(190);await page.locator('[data-choice="save_child"]').click();
  await expect(page.locator('#dialogue-visible')).toContainText('过来，先松开');
  expect(await page.evaluate(()=>[localStorage.getItem('jianghu:vn:v2:auto'),localStorage.getItem('jianghu:v1:auto')])).toEqual(['preserve-halfstep','preserve-reader']);
 }
 expect(errors).toEqual([]);await page.screenshot({path:evidencePath('docs/evidence/v6/main-current-20261016-v5-frozen-resume.png'),animations:'disabled'});
});
