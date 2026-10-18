import {test,expect} from '@playwright/test';

test('offline download times out before worker ready and a late ready cannot start an old attempt',async({page})=>{
  await page.addInitScript(()=>{
    let finish:(value:unknown)=>void=()=>{};let sent=0;
    const ready=new Promise(resolve=>{finish=resolve});
    Object.defineProperty(navigator.serviceWorker,'ready',{get:()=>ready});
    Object.assign(window,{finishWorker:()=>finish({active:{postMessage:()=>{sent++}}}),workerMessages:()=>sent});
  });
  await page.goto('/taihua.html');await page.clock.install();
  await page.locator('[data-action="settings"]').click();
  const button=page.locator('[data-action="offline"]');await button.click();await expect(button).toBeDisabled();
  await page.clock.fastForward(30001);
  await expect(page.locator('.panel-feedback')).toContainText('离线资源未备齐');await expect(button).toBeEnabled();
  await page.evaluate(()=>(window as any).finishWorker());
  expect(await page.evaluate(()=>(window as any).workerMessages())).toBe(0);
  await button.click();
  await expect.poll(()=>page.evaluate(()=>(window as any).workerMessages())).toBe(1);
  await page.clock.fastForward(30001);await expect(button).toBeEnabled();
  await expect(page.locator('.panel-feedback')).toContainText('离线资源未备齐');
});
