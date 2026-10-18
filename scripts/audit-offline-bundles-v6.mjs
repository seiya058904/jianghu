import assert from 'node:assert/strict';
import {readFileSync,readdirSync,writeFileSync} from 'node:fs';
import {chronicleWorks} from '../src/chronicle-catalog.ts';
const files=readdirSync('dist/assets'),works=[...chronicleWorks.map(w=>({slug:w.slug,source:w.slug})),{slug:'tide-v6',source:'campaign-v6'}],rows=[];
for(const work of works){
 const primary=files.find(file=>new RegExp('^'+work.source+'-[A-Za-z0-9_-]{8}\\.js$').test(file));assert.ok(primary,`No primary data chunk for ${work.slug}`);
 const url='./assets/'+primary,manifest=JSON.parse(readFileSync(`dist/offline-${work.slug}.json`,'utf8'));assert.ok(manifest.includes(url),`${work.slug} omitted its own story data`);
 const owners=works.filter(other=>JSON.parse(readFileSync(`dist/offline-${other.slug}.json`,'utf8')).includes(url)).map(other=>other.slug);assert.deepEqual(owners,[work.slug],`Primary data assigned to wrong work: ${primary}`);rows.push({work:work.slug,primary:url,owners});
}
const mainEntryFiles=JSON.parse(readFileSync('dist/offline-tide-v6.json','utf8'));
// V7: `/` and `/index.html` are the works collection shell, not a story entry.
// The original main story keeps its own URL and its own package.
assert.ok(mainEntryFiles.includes('./tide-v6.html'),'Main V6 package omitted ./tide-v6.html');
const shellFiles=JSON.parse(readFileSync('dist/offline-manifest.json','utf8'));
for(const entry of ['./','./index.html'])assert.ok(shellFiles.includes(entry),`Library shell omitted ${entry}`);
assert.ok(!mainEntryFiles.includes('./index.html'),'The library shell must not travel inside the V6 story package');
const frozenFiles=[];
for(const [work,prefix]of [['jade-thieves-v1','jade-thieves-before-cg-'],['jade-v1','jade-before-cg-'],['tide-v6','campaign-v6-before-ending-staging-'],['twelfth-life-v2','twelfth-life-before-cg-'],['two-swords-v1','two-swords-before-art-'],['seven-questions','seven-questions-before-books-cg-'],['sea-v1','sea-before-rigging-'],['sea-tide-v1','sea-tide-before-rigging-'],['sea-tide','sea-tide-before-child-']]){
 const file=files.find(file=>file.startsWith(prefix)&&file.endsWith('.js'));assert.ok(file,prefix);assert.ok(JSON.parse(readFileSync(`dist/offline-${work}.json`,'utf8')).includes('./assets/'+file),`${work} omitted frozen migration data`);frozenFiles.push({work,file});
}
writeFileSync('docs/evidence/v6/offline-bundle-ownership-audit.json',JSON.stringify({status:'PRIMARY_DATA_AND_FROZEN_MIGRATION_CHUNKS_VERIFIED',registeredWorkCount:rows.length,rows,frozenFiles,scope:'Current Rolldown build data files, independent of preliminary browser visits. Shell and work packages are used together.'},null,2)+'\n');
console.log(JSON.stringify({verifiedWorks:rows.length,wrongPrimaryOwners:0,frozenMigrationChunks:frozenFiles.length}));
