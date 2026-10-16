import test from 'node:test';
import assert from 'node:assert/strict';
import {createHash} from 'node:crypto';
import {readFileSync} from 'node:fs';
import v6 from '../src/generated/campaign-v6.json' with {type:'json'};
import v5 from '../src/generated/campaign-v5-1.0.0.json' with {type:'json'};
import jade from '../src/generated/jade.json' with {type:'json'};
import jadeV1 from '../src/generated/jade-v1.json' with {type:'json'};
import north from '../src/generated/north.json' with {type:'json'};
import northV2 from '../src/generated/north-v2.json' with {type:'json'};
import northV1 from '../src/generated/north-v1.json' with {type:'json'};
import qianKun from '../src/generated/qian-kun.json' with {type:'json'};
import qianKunV2 from '../src/generated/qian-kun-v2.json' with {type:'json'};
import qianKunV1 from '../src/generated/qian-kun-v1.json' with {type:'json'};
import {campaignV6Chapters} from '../src/campaign-v6-catalog.ts';

test('Default roots and explicit index select real V6 content, chapters, saved-progress namespace and offline pack',async()=>{
 const previous=globalThis.location;
 try{for(const [i,path]of ['/','/index.html','/Jianghu/','/Jianghu/index.html','/tide-v6.html'].entries()){
  globalThis.location={pathname:path} as Location;
  const m=await import(`../src/edition.ts?default-entry=${i}`);
  assert.equal(m.isV6Edition,true);assert.strictEqual(m.campaignEdition.content,v6);assert.equal(m.campaignEdition.version,'tide-promise-2.0.0');assert.equal(m.edition.prefix,'jianghu:campaign:tide:v2:');assert.equal(m.edition.offlineWork,'tide-v6');assert.deepEqual(m.edition.chapters,campaignV6Chapters);assert.ok(m.campaignEdition.previousContent);
 }}finally{globalThis.location=previous}
});

test('Qian Kun current and both archives select exact independent content and namespaces on root and subpath',async()=>{
 const previous=globalThis.location;try{let i=0;for(const base of ['/','/Jianghu/'])for(const[slug,version,prefix,data]of [['qian-kun','qian-kun-3.0.0','v3',qianKun],['qian-kun-v2','qian-kun-2.0.0','v2',qianKunV2],['qian-kun-v1','qian-kun-1.0.0','v1',qianKunV1]]as const){globalThis.location={pathname:base+slug+'.html'}as Location;const m=await import(`../src/edition.ts?qian-kun-entry=${i++}`);assert.equal(m.chronicle?.slug,slug);assert.strictEqual(m.campaignEdition.content,data);assert.equal(m.campaignEdition.version,version);assert.equal(m.edition.prefix,`jianghu:chronicle:qian-kun:${prefix}:`);assert.equal(m.edition.offlineWork,slug);assert.equal(m.campaignEdition.previousContent,undefined)}}finally{globalThis.location=previous}
});

test('North V3, frozen V2 and V1 select exact independent data and namespaces under root and subpath',async()=>{
 const previous=globalThis.location;try{let i=0;for(const base of ['/','/Jianghu/'])for(const [slug,version,prefix,data]of [['north','north-3.0.0','v3',north],['north-v2','north-2.0.0','v2',northV2],['north-v1','north-1.0.0','v1',northV1]]as const){globalThis.location={pathname:base+slug+'.html'}as Location;const m=await import(`../src/edition.ts?north-entry=${i++}`);assert.equal(m.chronicle?.slug,slug);assert.strictEqual(m.campaignEdition.content,data);assert.equal(m.campaignEdition.version,version);assert.equal(m.edition.prefix,`jianghu:chronicle:north:${prefix}:`);assert.equal(m.edition.offlineWork,slug);assert.equal(m.campaignEdition.previousContent,undefined)}}finally{globalThis.location=previous}
});

test('Frozen V5/Half Step and both current/frozen chronicle entries keep independent content, version and prefix',async()=>{
 const previous=globalThis.location;
 try{for(const [i,path]of ['/tide-v5.html','/Jianghu/tide-v5.html','/half-step.html','/jade.html','/Jianghu/jade.html','/jade-v1.html','/Jianghu/jade-v1.html'].entries()){
  globalThis.location={pathname:path} as Location;
  const m=await import(`../src/edition.ts?old-entry=${i}`);assert.equal(m.isV6Edition,false);
  if(path.includes('tide-v5')){assert.strictEqual(m.campaignEdition.content,v5);assert.equal(m.campaignEdition.version,'tide-promise-1.0.0');assert.equal(m.edition.prefix,'jianghu:campaign:tide:v1:')}
  else if(path.includes('half-step')){assert.equal(m.isCampaign,false);assert.equal(m.edition.prefix,'jianghu:vn:v2:')}
  else if(path.includes('jade-v1')){assert.equal(m.chronicle?.slug,'jade-v1');assert.strictEqual(m.campaignEdition.content,jadeV1);assert.equal(m.campaignEdition.version,'jade-1.0.0');assert.equal(m.edition.prefix,'jianghu:chronicle:jade:v1:');assert.ok(m.campaignEdition.previousContent)}else{assert.equal(m.chronicle?.slug,'jade');assert.strictEqual(m.campaignEdition.content,jade);assert.equal(m.campaignEdition.version,'jade-2.0.0');assert.equal(m.edition.prefix,'jianghu:chronicle:jade:v2:');assert.equal(m.campaignEdition.previousContent,undefined)}
 }}finally{globalThis.location=previous}
 assert.equal(createHash('sha256').update(readFileSync('src/generated/campaign-v5-1.0.0.json')).digest('hex'),'b0c071f9cf69c22817edf712d92cd9002c9373e92905e721cb7a1a29755c63ec');
 assert.deepEqual(readFileSync('src/generated/campaign.json'),readFileSync('src/generated/campaign-v5-1.0.0.json'));
});
