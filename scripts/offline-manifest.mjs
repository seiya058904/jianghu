import {readdirSync,readFileSync,writeFileSync} from 'node:fs';
import {characters,scenes,cgs} from '../src/catalog.ts';
import {chronicleWorks} from '../src/chronicle-catalog.ts';
const files=['./'];
const works=[...chronicleWorks.map(work=>({slug:work.slug,file:work.file,source:work.slug})),{slug:'tide-v6',file:'tide-v6.html',source:'campaign-v6'}];
// Prefer the complete source name: sea-tide and archived -v1 chunks are not sea/parent chunks.
const orderedWorks=[...works].sort((a,b)=>b.source.length-a.source.length);
const bundles=Object.fromEntries(works.map(work=>[work.slug,['./'+work.file]]));
function scan(path){for(const e of readdirSync('dist/'+path,{withFileTypes:true})){const relative=path+e.name;if(e.isDirectory()){scan(relative+'/');continue}if(relative.startsWith('art/v6/'))continue;const work=relative.startsWith('assets/jade-before-cg-')?orderedWorks.find(work=>work.slug==='jade-v1'):relative.startsWith('assets/jade-thieves-before-cg-')?orderedWorks.find(work=>work.slug==='jade-thieves-v1'):relative.startsWith('assets/twelfth-life-before-cg-')?orderedWorks.find(work=>work.slug==='twelfth-life-v2'):relative.startsWith('assets/sea-tide-before-rigging-')?orderedWorks.find(work=>work.slug==='sea-tide-v1'):relative.startsWith('assets/sea-before-rigging-')?orderedWorks.find(work=>work.slug==='sea-v1'):relative.startsWith('assets/two-swords-before-art-')?orderedWorks.find(work=>work.slug==='two-swords-v1'):orderedWorks.find(work=>relative===work.file||(relative.startsWith('assets/'+work.source+'-')&&relative.endsWith('.js')));if(work)bundles[work.slug].push('./'+relative);else if(!relative.endsWith('.json')&&!relative.endsWith('.png')&&relative!=='sw.js')files.push('./'+relative);else if(relative==='art/ferry.png')files.push('./'+relative)}}
scan('');
// V7: `/` and `/index.html` are the works collection and belong to the shared
// shell; the story package keeps its own explicit URL only.
writeFileSync('dist/offline-manifest.json',JSON.stringify(files));
for(const {slug:work,source:sourceFile} of works){
 const source=readFileSync(`story/${sourceFile}.ink`,'utf8');const bundle=bundles[work];
 for(const match of source.matchAll(/# scene:(\w+)/g))bundle.push('./art/'+scenes[match[1]].art);
 const cast=new Set([...source.matchAll(/# cast:([^#\r\n]+)/g)].flatMap(match=>match[1].trim().split(',')));
 for(const id of cast){if(id==='none')continue;const portrait=characters[id].portrait;bundle.push('./art/'+portrait.file);for(const file of [...Object.values(portrait.moods??{}),...Object.values(portrait.looks??{}).flatMap(look=>[look.file,...Object.values(look.moods??{})])])bundle.push('./art/'+file)}
 for(const match of source.matchAll(/# cg:(\w+)/g))if(match[1]!=='none')bundle.push('./art/'+cgs[match[1]].file);
 writeFileSync(`dist/offline-${work}.json`,JSON.stringify([...new Set(bundle)]));
 console.log(`Offline ${work}: ${new Set(bundle).size} URLs, requested by the player.`);
}
console.log(`Offline shell and legacy cache: ${files.length} URLs; new works excluded.`);
