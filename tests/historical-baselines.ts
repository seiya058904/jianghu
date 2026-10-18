import {existsSync,readFileSync} from 'node:fs';
import {posix} from 'node:path';
import {createHash} from 'node:crypto';
import {frozenBytes} from './frozen-baselines.ts';

const sourceCommit='7a2c22f74c46d74f07af8bd1a45893ec15daa49b';
const expected:Record<string,string>={
 'story/qian-kun-slow.mjs':'46b1696c27607aee422f5eba5557dd592155a4dac8142ee7de32fc375c8fcd29',
 'story/north.ink':'c0c7772ca9c62d0a982a7c9d86743074ff9a7046a8acebcd4e9d554cc3d7ca26',
 'src/generated/north.json':'c1ea622badd0efa7517cd646238d996ebc77255773a3b3292bc937ec58d22d48',
 'story/north-after.mjs':'0156373b150bc2cd4ba93cbf7137c31389ff30b42f2b2542bd0e830b6babcfa1',
 'story/twelfth.ink':'a2d37f61c06837d9764166c7f16dc304761557bcd2fbcd663bada87c46e0c6d3',
 'src/generated/twelfth.json':'6be09fe05fc2df85fced816bc68dba68761c0c3d9c20189c5fdbc637661afb2e',
 'src/generated/sea.json':'c7192b4fe96828648fef52c076315bbd20ac5fa3baf7b3117c983061443456f3',
};

// Historical identity assertions use genuine pre-audit bytes, never the edited live file.
// Current story behavior and build consistency are checked independently.
export function historicalBytes(target:string):Buffer|null {
 const path=posix.normalize(target.replace(/\\/g,'/'));
 if(!Object.hasOwn(expected,path))return frozenBytes(path);
 if(!existsSync(path))throw new Error(`Required current source missing: ${path}`);
 const manifest=JSON.parse(readFileSync('docs/audits/independent-final/preservation-map.json','utf8'));
 if(manifest.sourceCommit!==sourceCommit||Object.keys(manifest.entries??{}).sort().join('\n')!==Object.keys(expected).sort().join('\n'))throw new Error('Invalid historical preservation map');
 for(const [key,hash]of Object.entries(expected)){
  const entry=manifest.entries[key];
  if(entry.sourcePath!==key||entry.target!==`docs/archives/independent-pre-audit/${key}`||entry.sha256!==hash||!Number.isSafeInteger(entry.bytes)||entry.bytes<=0)throw new Error(`Invalid historical preservation map: ${key}`);
 }
 const entry=manifest.entries[path],bytes=frozenBytes(entry.target);
 if(bytes&&(bytes.length!==entry.bytes||createHash('sha256').update(bytes).digest('hex')!==expected[path]))throw new Error(`Historical baseline bytes changed: ${path}`);
 return bytes;
}
