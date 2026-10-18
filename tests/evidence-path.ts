import {mkdirSync} from 'node:fs';
import {tmpdir} from 'node:os';
import {dirname,resolve,sep} from 'node:path';

// Full runs are reproducible output, not new versions of frozen evidence.
// Publish only explicitly selected, compressed evidence from these runs.
export function evidencePath(relative:string):string {
  const prefix='docs/evidence/';
  if(!relative.startsWith(prefix))throw new Error('Expected an evidence-relative path');
  const root=resolve(process.env.JIANGHU_EVIDENCE_DIR??resolve(tmpdir(),'jianghu-evidence'));
  const target=resolve(root,relative.slice(prefix.length));
  if(!target.startsWith(root+sep))throw new Error('Evidence path escapes its output directory');
  mkdirSync(dirname(target),{recursive:true});
  return target;
}
