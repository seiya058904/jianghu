import test from 'node:test';
import assert from 'node:assert/strict';
import {mkdtempSync} from 'node:fs';
import {tmpdir} from 'node:os';
import {join,resolve} from 'node:path';
import {pathToFileURL} from 'node:url';
import {spawnSync} from 'node:child_process';

test('only explicitly private baseline omissions can skip; slash normalization cannot broaden the allowlist',()=>{
  const location=mkdtempSync(join(tmpdir(),'jianghu-frozen-policy-'));
  const helper=pathToFileURL(resolve('tests/frozen-baselines.ts')).href;
  const source=`import assert from 'node:assert/strict';
    const {frozenBytes,asRepoPath}=await import(${JSON.stringify(helper)});
    for(const path of ['宋世江湖.md','./宋世江湖.md','docs/archives/missing.bin','docs\\\\archives\\\\missing.bin','./docs/archives/folder/../missing.bin'])assert.equal(frozenBytes(path),null,path);
    for(const path of ['src/missing.ts','story/missing.ink','public/art/missing.webp','docs/archives/../../src/missing.ts','docs\\\\archives\\\\..\\\\..\\\\src\\\\missing.ts','docs/archives-neighbor/missing.bin','missing.json','',null,undefined])assert.throws(()=>frozenBytes(path),/missing/,String(path));
    assert.equal(asRepoPath('docs\\\\archives\\\\..\\\\..\\\\src\\\\missing.ts'),'src/missing.ts');`;
  const result=spawnSync(process.execPath,['--experimental-strip-types','--input-type=module','-e',source],{cwd:location,encoding:'utf8'});
  assert.equal(result.status,0,result.stdout+'\n'+result.stderr);
});
