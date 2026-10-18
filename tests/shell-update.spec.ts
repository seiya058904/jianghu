import {test,expect} from '@playwright/test';
import {createServer} from 'node:http';
import {readFileSync} from 'node:fs';
import {resolve,extname,sep} from 'node:path';
import {evidencePath} from './evidence-path.ts';

// A real SW with unchanged bytes must download the new hashed library module
// when a reader explicitly refreshes a story's offline resources.
for(const prefix of ['/','/jianghu/'])test(`new shell dependencies survive a per-work offline update at ${prefix}`,async({browser})=>{
 const root=resolve('dist');let updated=false;
 const oldIndex=readFileSync(resolve(root,'index.html'),'utf8');
 const oldScript=oldIndex.match(/<script[^>]+src="\.\/(assets\/[^"]+\.js)"/)?.[1];
 if(!oldScript)throw Error('Library module missing from built index');
 const newScript='assets/independent-shell-update.js';
 const server=createServer((req,res)=>{
  try{
   const pathname=new URL(req.url!,'http://localhost').pathname;
   if(!pathname.startsWith(prefix)){res.writeHead(404).end();return}
   const local=pathname.slice(prefix.length)||'index.html',file=resolve(root,local);
   if(!file.startsWith(root+sep)){res.writeHead(403).end();return}
   let data:Buffer|string;
   if(updated&&local==='index.html')data=oldIndex.replaceAll(oldScript,newScript);
   else if(updated&&local==='offline-manifest.json')data=readFileSync(file,'utf8').replaceAll(oldScript,newScript);
   else if(updated&&local===newScript)data=readFileSync(resolve(root,oldScript),'utf8')+'\nwindow.__independentShellVersion=2;';
   else data=readFileSync(file);
   const mime=({'.html':'text/html; charset=utf-8','.js':'text/javascript; charset=utf-8','.css':'text/css','.json':'application/json','.webp':'image/webp','.svg':'image/svg+xml'} as Record<string,string>)[extname(local)]??'application/octet-stream';
   res.writeHead(200,{'Content-Type':mime,'Cache-Control':'no-store'}).end(data);
  }catch{res.writeHead(404).end()}
 });
 await new Promise<void>(done=>server.listen(0,'127.0.0.1',done));
 const address=server.address();if(!address||typeof address==='string')throw Error('Server not listening');
 const origin=`http://127.0.0.1:${address.port}${prefix}`;
 const context=await browser.newContext(),page=await context.newPage();
 const errors:string[]=[];page.on('pageerror',e=>errors.push(e.message));
 try{
  await page.goto(origin);
  await page.evaluate(async()=>{await navigator.serviceWorker.ready});
  await page.reload();
  await expect(page.locator('.lib-card')).toHaveCount(16);
  updated=true;
  await page.goto(origin+'taihua.html');
  expect(await page.evaluate(async file=>Boolean(await caches.match(new URL(file,location.href).href)),newScript)).toBe(false);
  await page.getByRole('button',{name:'设置',exact:true}).click();
  await page.getByRole('button',{name:'下载《太华试序 · 三年之约》离线资源',exact:true}).click();
  await expect(page.getByRole('dialog')).toContainText('离线资源已备好');
  expect(await page.evaluate(async file=>Boolean(await caches.match(new URL(file,location.href).href)),newScript)).toBe(true);
  await context.setOffline(true);
  await page.goto(origin+'index.html');
  await expect(page).toHaveTitle('Jianghu · 宋世江湖 · 互动纪事集');
  await expect(page.locator('.lib-card')).toHaveCount(16);
  expect(await page.evaluate(()=>Reflect.get(window,'__independentShellVersion'))).toBe(2);
  await page.screenshot({path:evidencePath(`docs/evidence/independent-shell-update-${prefix==='/'?'root':'subpath'}.png`)});
  expect(errors).toEqual([]);
 }finally{
  await context.close();await new Promise<void>((done,reject)=>server.close(error=>error?reject(error):done()));
 }
});
