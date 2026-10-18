import test from 'node:test';
import assert from 'node:assert/strict';
import {mkdtempSync,mkdirSync,readFileSync,writeFileSync} from 'node:fs';
import {tmpdir} from 'node:os';
import {join,resolve,dirname} from 'node:path';
import {pathToFileURL} from 'node:url';
import {spawnSync} from 'node:child_process';
import {historicalBytes} from './historical-baselines.ts';

test('historical source identity uses independent old bytes and refuses map tampering or missing live source',()=>{
 const path='story/north.ink',old=historicalBytes(path);
 if(old)assert.notDeepEqual(old,readFileSync(path),'edited current source must not masquerade as the old baseline');
 const helper=pathToFileURL(resolve('tests/historical-baselines.ts')).href;
 const base=JSON.parse(readFileSync('docs/audits/independent-final/preservation-map.json','utf8'));
 for(const githubActions of [false,true]){
  const executed:string[]=[];
  for(const mode of ['missing-current','changed-map','changed-commit','extra-path','missing-archive','wrong-archive']){
  const cwd=mkdtempSync(join(tmpdir(),'jianghu-historical-policy-'));
  function put(p:string,b:string|Buffer){mkdirSync(dirname(join(cwd,p)),{recursive:true});writeFileSync(join(cwd,p),b)}
  const manifest=structuredClone(base);
  if(mode!=='missing-current')put(path,'current source sentinel');
  if(mode==='changed-map')manifest.entries[path].target='story/north.ink';
  if(mode==='changed-commit')manifest.sourceCommit='0'.repeat(40);
  if(mode==='extra-path')manifest.entries['story/unapproved.ink']=manifest.entries[path];
  if(mode==='wrong-archive')put(manifest.entries[path].target,'forged old source');
  put('docs/audits/independent-final/preservation-map.json',JSON.stringify(manifest));
  const script=`import assert from 'node:assert/strict';import {historicalBytes} from ${JSON.stringify(helper)};`+(mode==='missing-archive'?`assert.equal(historicalBytes(${JSON.stringify(path)}),null);`:`assert.throws(()=>historicalBytes(${JSON.stringify(path)}),/missing|Invalid|changed/);`);
  const env={...process.env};
  delete env.GITHUB_ACTIONS;
  if(githubActions)env.GITHUB_ACTIONS='true';
  const result=spawnSync(process.execPath,['--experimental-strip-types','--input-type=module','-e',script],{cwd,encoding:'utf8',env});
  assert.equal(result.status,0,`${mode}: ${result.stderr}`);
  if(mode==='missing-archive'){
   const missing=manifest.entries[path].target;
   const message=`frozen baseline not present in this checkout, entry skipped: ${missing} (see docs/PUBLISHING.md)`;
   assert.equal(result.stdout.trimEnd(),githubActions?`::warning title=Frozen baseline absent::${message}`:'');
   assert.equal(result.stderr.trimEnd(),githubActions?'':`[frozen-baseline] ${message}`);
   const report=JSON.parse(readFileSync(join(cwd,'docs/evidence/v6/frozen-baselines-missing.json'),'utf8'));
   assert.equal(report.status,'SOME_FROZEN_BASELINES_ABSENT_IN_THIS_CHECKOUT');
   assert.equal(report.count,1);
   assert.deepEqual(report.missing,[missing]);
  }
  executed.push(mode);
  }
  assert.deepEqual(executed,['missing-current','changed-map','changed-commit','extra-path','missing-archive','wrong-archive']);
 }
});
