import {readdirSync,readFileSync,writeFileSync,mkdirSync,copyFileSync,existsSync} from 'node:fs';
import {join,dirname} from 'node:path';
import {createHash} from 'node:crypto';
const root='docs/archives/v6-baseline-20261015';
if(existsSync(`${root}/manifest.json`)) throw new Error('Baseline already exists; refusing to replace it.');
const files=[];
function scan(dir){for(const e of readdirSync(dir,{withFileTypes:true})){const p=join(dir,e.name);if(e.isSymbolicLink())throw new Error(`Unexpected link: ${p}`);if(e.isDirectory())scan(p);else files.push(p);}}
for(const dir of ['src','story','public','scripts','tests'])scan(dir);
for(const e of readdirSync('.',{withFileTypes:true}))if(e.isFile())files.push(e.name);
for(const e of readdirSync('docs',{withFileTypes:true}))if(e.isFile())files.push(join('docs',e.name));
scan('docs/lore');
const manifest=[];
for(const path of files){const data=readFileSync(path), target=join(root,path);mkdirSync(dirname(target),{recursive:true});copyFileSync(path,target);const sha256=createHash('sha256').update(data).digest('hex');if(createHash('sha256').update(readFileSync(target)).digest('hex')!==sha256)throw new Error(`Copy mismatch: ${path}`);manifest.push({path,bytes:data.length,sha256});}
writeFileSync(`${root}/manifest.json`,JSON.stringify({createdAt:new Date().toISOString(),files:manifest},null,2));
writeFileSync(`${root}/RESTORE.md`,'# V6 修改前基线\n\n此目录保留原相对路径及字节；manifest.json 是 SHA-256 校验表。恢复前停止本项目服务，先另备份当前改动，再仅复制需要恢复的明确文件到项目相同路径。不要整体覆盖用户后续工作。浏览器存档未读取或修改；恢复源码不恢复浏览器数据。排除 node_modules、dist、历史备份和测试临时物。\n');
console.log(JSON.stringify({backup:root,files:manifest.length,bytes:manifest.reduce((n,f)=>n+f.bytes,0),verified:true}));
