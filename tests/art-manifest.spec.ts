import {test,expect} from '@playwright/test';
import {readFileSync,writeFileSync} from 'node:fs';
import {createHash} from 'node:crypto';
type Asset={assetId:string;file:string;technical:{sha256:string;bytes:number;width:number;height:number}};
const manifest=JSON.parse(readFileSync('docs/art/ASSET_MANIFEST_V6.json','utf8')) as {assets:Asset[]};
const digest=(bytes:Buffer)=>createHash('sha256').update(bytes).digest('hex');
const fingerprint=digest(Buffer.from(JSON.stringify(manifest.assets.map(a=>[a.file,a.technical.sha256]))));
for(const [label,root]of [['root','http://127.0.0.1:4173/'],['subpath','http://127.0.0.1:4175/Jianghu/']])test(`Asset manifest: every raster has exact built bytes and browser decode on ${label}`,async({page})=>{
 test.setTimeout(120000);const errors:string[]=[];page.on('pageerror',error=>errors.push(error.message));
 for(const asset of manifest.assets){expect(digest(readFileSync(asset.file)),asset.file+' source drift').toBe(asset.technical.sha256);expect(digest(readFileSync('dist/'+asset.file.slice('public/'.length))),asset.file+' dist drift').toBe(asset.technical.sha256)}
 await page.goto(root+'gallery.html');const rows:unknown[]=[];
 for(let offset=0;offset<manifest.assets.length;offset+=12){const result=await page.evaluate(async({assets,root})=>Promise.all(assets.map(async asset=>{
  const url=new URL(asset.file.slice('public/'.length),root).href;
  const response=await fetch(url),bytes=await response.arrayBuffer(),sha256=[...new Uint8Array(await crypto.subtle.digest('SHA-256',bytes))].map(b=>b.toString(16).padStart(2,'0')).join('');
  const object=URL.createObjectURL(new Blob([bytes]));let width=0,height=0;
  try{const image=new Image();image.src=object;await image.decode();width=image.naturalWidth;height=image.naturalHeight}finally{URL.revokeObjectURL(object)}
  return{file:asset.file,url,status:response.status,bytes:bytes.byteLength,sha256,width,height};
 })),{assets:manifest.assets.slice(offset,offset+12),root});
  for(const row of result){const expected=manifest.assets.find(a=>a.file===row.file)!;expect(row.status,row.file).toBe(200);expect(row.sha256,row.file).toBe(expected.technical.sha256);expect(row.bytes,row.file).toBe(expected.technical.bytes);expect([row.width,row.height],row.file).toEqual([expected.technical.width,expected.technical.height])}rows.push(...result);
 }
 expect(errors).toEqual([]);writeFileSync(`docs/evidence/v6/asset-manifest-browser-${label}.json`,JSON.stringify({status:'ALL_RASTER_BYTES_AND_BROWSER_DECODE_VERIFIED',assetFingerprint:fingerprint,root,files:rows.length,rows,errors,limits:'Image fetch and decode only; no claim of per-scene crop, expression quality, identity/canon correctness, offline completeness or human aesthetic acceptance.'},null,2)+'\n');
});
