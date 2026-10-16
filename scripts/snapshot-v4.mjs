import {readdirSync,readFileSync,writeFileSync,mkdirSync} from 'node:fs';
import {join} from 'node:path';
import {createHash} from 'node:crypto';
// Preserve paths and bytes without touching the source files.
const root='docs/archives/v4-source-20261015'; mkdirSync(root,{recursive:true});
const dirs=['src','story','public','scripts','tests'];
const files=readdirSync('.',{withFileTypes:true}).filter(e=>e.isFile()).map(e=>e.name);
function scan(dir){for(const e of readdirSync(dir,{withFileTypes:true})){const p=join(dir,e.name);e.isDirectory()?scan(p):files.push(p)}}
dirs.forEach(scan); const hashes=[];
for(const file of files){const data=readFileSync(file);const dest=join(root,file);mkdirSync(join(dest,'..'),{recursive:true});writeFileSync(dest,data);hashes.push({path:file,bytes:data.length,sha256:createHash('sha256').update(data).digest('hex')});}
writeFileSync('docs/archives/v4-source-20261015.json',JSON.stringify(hashes,null,2));
console.log(`Preserved ${files.length} files with their original paths.`);
