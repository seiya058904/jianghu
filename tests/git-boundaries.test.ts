import test from 'node:test';
import assert from 'node:assert/strict';
import {spawnSync} from 'node:child_process';
import {readdirSync} from 'node:fs';
import {dirname, join, relative} from 'node:path';
import {fileURLToPath} from 'node:url';

const root = join(dirname(fileURLToPath(import.meta.url)), '..');
function git(args: string[], input?: string) {
  return spawnSync('git', ['-c', 'core.fsmonitor=false', ...args], {
    cwd: root, encoding: 'utf8', input,
    env: {...process.env, GIT_OPTIONAL_LOCKS: '0'},
  });
}
const localOnly = [
  '宋世江湖.md', 'docs/archives/baseline/story.json', '.local-originals/README.md',
  '.impeccable/review/desktop.png', '.workbuddy/memory/MEMORY.md', '.env.local',
  'backup/recovery.json', 'backups/history.bundle', 'output/playwright/trace.zip',
  'docs/audits/independent-final/2026-10-18-cleanup/478-private-files-manifest.json',
  'docs/audits/independent-final/DAILY_REPO_ADOPTION-20261018.md',
  'docs/audits/independent-final/DAILY_REPO_SWITCH_PLAN.md',
  'docs/audits/independent-final/FINAL_CLOSEOUT.md',
  'docs/audits/independent-final/PRIVATE_REPO_BOUNDARY-20261018.md',
  'docs/audits/experience-2026-10-18/PUBLIC_RELEASE_VALIDATION.md',
  'docs/audits/future/recovery-manifest.json', 'docs/audits/future/private-notes.md',
  'docs/audits/future/switch-journal.json', 'docs/audits/future/raw.png',
  'docs/art/candidates-new/portrait.webp', 'secrets/private.key', 'history.bundle',
];
test('ordinary git add excludes local author material, recovery records and raw evidence', () => {
  const result = git(['check-ignore', '--no-index', '--stdin', '-z'], localOnly.join('\0') + '\0');
  assert.equal(result.status, 0, result.stderr);
  assert.deepEqual(new Set(result.stdout.split('\0').filter(Boolean)), new Set(localOnly));
});
test('the public index contains no private canon, archives, machine configuration or cleanup records', () => {
  const result = git(['ls-files', '-z']);
  assert.equal(result.status, 0, result.stderr);
  const forbidden = /^(宋世江湖\.md$|docs\/archives\/|\.local-originals\/|\.impeccable\/|\.workbuddy\/|\.env(?:\.|$)|docs\/audits\/independent-final\/(?:2026-10-18-cleanup\/|DAILY_REPO_ADOPTION-|DAILY_REPO_SWITCH_PLAN\.|FINAL_CLOSEOUT\.|PRIVATE_REPO_BOUNDARY-))/;
  assert.deepEqual(result.stdout.split('\0').filter(p => forbidden.test(p) && p !== '.env.example'), []);
});
test('runtime sources, authoring inputs, art and entry pages remain tracked and are not ignored', () => {
  const result = git(['ls-files', '-z']);
  assert.equal(result.status, 0, result.stderr);
  const tracked = new Set(result.stdout.split('\0').filter(Boolean));
  const paths: string[] = [];
  function walk(dir: string) {
    for (const entry of readdirSync(dir, {withFileTypes: true})) {
      const p = join(dir, entry.name);
      if (entry.isDirectory()) walk(p);
      else if (entry.isFile()) paths.push(relative(root, p).replaceAll('\\', '/'));
    }
  }
  for (const scope of ['src', 'story', 'public']) walk(join(root, scope));
  for (const entry of readdirSync(root)) if (entry.endsWith('.html')) paths.push(entry);
  assert.ok(paths.length > 600);
  assert.deepEqual(paths.filter(p => !tracked.has(p)), []);
  const ignored = git(['check-ignore', '--no-index', '--stdin', '-z'], paths.join('\0') + '\0');
  assert.equal(ignored.status, 1, ignored.stdout + ignored.stderr);
});
