import test from 'node:test';
import assert from 'node:assert/strict';
import {spawnSync} from 'node:child_process';
import {cpSync, existsSync, mkdirSync, mkdtempSync, readFileSync, rmSync, writeFileSync} from 'node:fs';
import {tmpdir} from 'node:os';
import {dirname, join} from 'node:path';
import {fileURLToPath} from 'node:url';

// Regression tests for the fail-closed public snapshot policy. The private
// cleanup/switch records, the canon text and machine paths must never reach the
// public mirror; unknown tracked paths must stop the plan instead of silently
// entering it. Fixtures are tiny throwaway Git repositories outside this repo.

const repoRoot = join(dirname(fileURLToPath(import.meta.url)), '..');
const scriptPath = join(repoRoot, 'scripts', 'public-snapshot.py');

function findPython(): string | null {
  for (const candidate of ['python3', 'python']) {
    const result = spawnSync(candidate, ['--version'], {encoding: 'utf8'});
    const text = String(result.stdout ?? '') + String(result.stderr ?? '');
    if (result.status === 0 && /Python 3/.test(text)) return candidate;
  }
  return null;
}

const python = findPython();
const skip = python ? false : 'python3 is required to run the public snapshot policy tests';
const env = {...process.env, PYTHONIOENCODING: 'utf-8', PYTHONUTF8: '1'};

function git(cwd: string, args: string[], input?: string): string {
  const result = spawnSync('git', ['-C', cwd, ...args], {encoding: 'utf8', input});
  assert.equal(result.status, 0, 'git ' + args.join(' ') + ' failed: ' + String(result.stderr ?? ''));
  return String(result.stdout ?? '').trim();
}

function initRepo(path: string): void {
  mkdirSync(path, {recursive: true});
  git(path, ['init', '--quiet', '-b', 'main']);
  git(path, ['config', 'user.name', 'Snapshot Policy Test']);
  git(path, ['config', 'user.email', 'snapshot@example.invalid']);
}

function writeFiles(repo: string, files: Record<string, string | Buffer>): void {
  for (const [relative, content] of Object.entries(files)) {
    const target = join(repo, relative);
    mkdirSync(dirname(target), {recursive: true});
    writeFileSync(target, content);
  }
}

function makePrivate(root: string, files: Record<string, string | Buffer>): string {
  const repo = join(root, 'private');
  initRepo(repo);
  mkdirSync(join(repo, 'scripts'), {recursive: true});
  cpSync(scriptPath, join(repo, 'scripts', 'public-snapshot.py'));
  writeFiles(repo, files);
  git(repo, ['add', '-A']);
  git(repo, ['commit', '--quiet', '-m', 'fixture']);
  return repo;
}

function makePublic(root: string, files: Record<string, string | Buffer>): string {
  const repo = join(root, 'public');
  initRepo(repo);
  writeFiles(repo, files);
  git(repo, ['add', '-A']);
  git(repo, ['commit', '--quiet', '-m', 'public fixture']);
  return repo;
}

type SnapshotResult = {status: number; stdout: string; stderr: string};

function runSnapshot(privateRepo: string, publicRepo: string, planPath: string, extra: string[] = []): SnapshotResult {
  const result = spawnSync(python as string, [
    join(privateRepo, 'scripts', 'public-snapshot.py'),
    '--source-ref', 'HEAD',
    '--destination', publicRepo,
    '--plan', planPath,
    ...extra,
  ], {encoding: 'utf8', cwd: privateRepo, env});
  return {status: result.status ?? -1, stdout: String(result.stdout ?? ''), stderr: String(result.stderr ?? '')};
}

function classify(paths: string[]): Map<string, {decision: string; reason: string}> {
  const result = spawnSync(python as string, [scriptPath, '--classify', ...paths], {encoding: 'utf8', env});
  assert.equal(result.status, 0, String(result.stderr ?? ''));
  const parsed = JSON.parse(result.stdout) as {results: {path: string; decision: string; reason: string}[]};
  return new Map(parsed.results.map(row => [row.path, row]));
}

function readText(path: string): string {
  return readFileSync(path, 'utf8').replace(/\r\n/g, '\n');
}

// Compose machine-looking paths at runtime: the test source itself must not embed a
// real absolute path, because the policy blocks machine paths in non-documentation files.
const winMachinePath = 'C' + ':' + '\\Users\\admin\\x';
const winNotePath = 'D' + ':' + '\\work\\private\\note.md';

function tempRoot(prefix: string): string {
  return mkdtempSync(join(tmpdir(), prefix));
}

test('policy classifies private, public and unknown paths fail-closed', {skip}, () => {
  const cases = classify([
    'src/player.ts',
    'story/main.ink',
    'public/art/asset.webp',
    'docs/PUBLISHING.md',
    '宋世江湖.md',
    'docs/archives/heng-draft.md',
    'docs/audits/independent-final/2026-10-18-cleanup/478-private-files-manifest.json',
    'docs/audits/independent-final/DAILY_REPO_ADOPTION-20261018.md',
    'docs/audits/independent-final/DAILY_REPO_SWITCH_PLAN.md',
    'docs/audits/independent-final/FINAL_CLOSEOUT.md',
    'docs/audits/independent-final/PRIVATE_REPO_BOUNDARY-20261018.md',
    'docs/art/candidates-2026-10-17/x.webp',
    'docs/audits/independent-final/canon-early-probe.mjs',
    'art-handoff.zip',
    '.env.local',
    'docs/art/huge.bin',
    'notes/local.md',
    '..\\escape.md',
    'docs/Archives/x.md',
    'docs/art/CANDIDATES-2026-10-17/x.webp',
    'SRC/CON.ts',
    'docs/trailing.md.',
    'docs/a:b.md',
  ]);
  const decision = (path: string) => cases.get(path)?.decision;
  assert.equal(decision('src/player.ts'), 'candidate');
  assert.equal(decision('story/main.ink'), 'candidate');
  assert.equal(decision('public/art/asset.webp'), 'candidate');
  assert.equal(decision('docs/PUBLISHING.md'), 'candidate');
  for (const privatePath of [
    '宋世江湖.md',
    'docs/archives/heng-draft.md',
    'docs/audits/independent-final/2026-10-18-cleanup/478-private-files-manifest.json',
    'docs/audits/independent-final/DAILY_REPO_ADOPTION-20261018.md',
    'docs/audits/independent-final/DAILY_REPO_SWITCH_PLAN.md',
    'docs/audits/independent-final/FINAL_CLOSEOUT.md',
    'docs/audits/independent-final/PRIVATE_REPO_BOUNDARY-20261018.md',
    'docs/art/candidates-2026-10-17/x.webp',
    'docs/audits/independent-final/canon-early-probe.mjs',
    'art-handoff.zip',
    '.env.local',
    'docs/Archives/x.md',
    'docs/art/CANDIDATES-2026-10-17/x.webp',
  ]) {
    assert.equal(decision(privatePath), 'excluded', privatePath + ' must be excluded from the public snapshot');
  }
  assert.equal(decision('docs/art/huge.bin'), 'blocked');
  assert.equal(decision('notes/local.md'), 'blocked');
  assert.equal(decision('..\\escape.md'), 'blocked');
  assert.equal(decision('SRC/CON.ts'), 'blocked');
  assert.equal(decision('docs/trailing.md.'), 'blocked');
  assert.equal(decision('docs/a:b.md'), 'blocked');
});

test('every tracked path of this repository is classified by the public policy', {skip}, () => {
  const tracked = git(repoRoot, ['ls-files', '-z']).split('\0').filter(Boolean);
  assert.ok(tracked.length > 100, 'expected a real tracked tree');
  const blocked: string[] = [];
  for (let start = 0; start < tracked.length; start += 200) {
    const chunk = tracked.slice(start, start + 200);
    for (const [path, row] of classify(chunk)) {
      if (row.decision === 'blocked') blocked.push(path + ' :: ' + row.reason);
    }
  }
  assert.deepEqual(blocked, [], 'unclassified tracked paths must be reviewed into the explicit allow or deny policy');
});

test('plan excludes private records, redacts documentation paths and reports public-only removals', {skip}, () => {
  const root = tempRoot('snapshot-plan-');
  try {
    const privateRepo = makePrivate(root, {
      'src/ok.ts': 'export const value = 1;\n',
      'docs/audits/independent-final/2026-10-18-cleanup/478-private-files-manifest.json': '{"private":true}\n',
      '宋世江湖.md': 'canon text must never be published\n',
      'art-handoff.zip': 'PK fake archive\n',
      'docs/note.md': 'local path ' + winNotePath + ' here\n',
    });
    const publicRepo = makePublic(root, {
      'src/ok.ts': 'export const value = 0;\n',
      'src/public-only.ts': 'export const legacy = 1;\n',
    });
    const planPath = join(root, 'plan.json');
    const result = runSnapshot(privateRepo, publicRepo, planPath);
    assert.equal(result.status, 0, result.stderr);
    const plan = JSON.parse(readFileSync(planPath, 'utf8'));
    assert.equal(plan.status, 'OK');
    assert.deepEqual(plan.blocked, []);
    assert.equal(plan.sourceCommit, git(privateRepo, ['rev-parse', 'HEAD']));
    const excluded = new Set(plan.excluded.map((row: {path: string}) => row.path));
    assert.ok(excluded.has('宋世江湖.md'));
    assert.ok(excluded.has('docs/audits/independent-final/2026-10-18-cleanup/478-private-files-manifest.json'));
    assert.ok(excluded.has('art-handoff.zip'));
    const files = new Set(plan.files.map((row: {path: string}) => row.path));
    assert.ok(files.has('src/ok.ts'));
    assert.ok(!files.has('宋世江湖.md'));
    assert.ok(plan.changed.includes('src/ok.ts'));
    assert.ok(!plan.changed.includes('docs/audits/independent-final/2026-10-18-cleanup/478-private-files-manifest.json'));
    assert.deepEqual(plan.removed, ['src/public-only.ts']);
    assert.ok(
      plan.redactions.some((row: {path: string}) => row.path === 'docs/note.md'),
      'documentation paths must be redacted in the plan',
    );
  } finally {
    rmSync(root, {recursive: true, force: true});
  }
});

test('unknown, secret, private-record and large-binary candidates block the plan', {skip}, () => {
  const cases: {name: string; files: Record<string, string | Buffer>; expected: RegExp}[] = [
    {name: 'unknown directory', files: {'notes/private.md': 'hi\n'}, expected: /unclassified top-level directory/},
    {name: 'unclassified extension', files: {'docs/data.bin': 'x'}, expected: /unclassified file type/},
    {name: 'secret material', files: {'docs/leak.md': 'token ghp_' + 'a'.repeat(36) + '\n'}, expected: /secret material/},
    {name: 'machine path in code', files: {'src/paths.ts': 'export const p = "' + winMachinePath + '";\n'}, expected: /machine absolute path in a non-documentation file/},
    {name: 'new private record reference', files: {'docs/ops.md': 'see 2026-10-18-cleanup/README.md\n'}, expected: /introduces private record reference/},
    {name: 'unreviewed large binary', files: {'public/art/huge.webp': Buffer.alloc(1_000_001, 1)}, expected: /unreviewed large binary/},
    {name: 'unreviewed large icon', files: {'public/art/big.ico': Buffer.alloc(1_000_001, 1)}, expected: /unreviewed large binary/},
    {name: 'new private audit record name', files: {'docs/audits/independent-final/repo-backup-manifest.json': '{"x":1}\n'}, expected: /unreviewed new audit operational record name/},
    {name: 'machine path only in a JSON key', files: {'docs/map.json': JSON.stringify({[winMachinePath]: 'provenance'}) + '\n'}, expected: /unredactable machine path remains|invalid JSON/},
  ];
  for (const item of cases) {
    const root = tempRoot('snapshot-block-');
    try {
      const privateRepo = makePrivate(root, item.files);
      const publicRepo = makePublic(root, {'README.md': 'public\n'});
      const planPath = join(root, 'plan.json');
      const result = runSnapshot(privateRepo, publicRepo, planPath);
      assert.equal(result.status, 3, item.name + ' must exit 3: ' + result.stdout + result.stderr);
      const plan = JSON.parse(readFileSync(planPath, 'utf8'));
      assert.equal(plan.status, 'BLOCKED');
      assert.ok(plan.blocked.length >= 1);
      assert.match(plan.blocked.map((row: {reason: string}) => row.reason).join(' | '), item.expected, item.name);
    } finally {
      rmSync(root, {recursive: true, force: true});
    }
  }
});

test('symlink entries in the source commit are rejected', {skip}, () => {
  const root = tempRoot('snapshot-link-');
  try {
    const privateRepo = makePrivate(root, {'src/ok.ts': 'export const value = 1;\n'});
    const blob = spawnSync('git', ['-C', privateRepo, 'hash-object', '-w', '--stdin'], {encoding: 'utf8', input: 'src/ok.ts'});
    assert.equal(blob.status, 0);
    const sha = String(blob.stdout).trim();
    git(privateRepo, ['update-index', '--add', '--cacheinfo', '120000,' + sha + ',link.md']);
    git(privateRepo, ['commit', '--quiet', '-m', 'symlink']);
    const publicRepo = makePublic(root, {'README.md': 'public\n'});
    const planPath = join(root, 'plan.json');
    const result = runSnapshot(privateRepo, publicRepo, planPath);
    assert.equal(result.status, 3, result.stdout + result.stderr);
    const plan = JSON.parse(readFileSync(planPath, 'utf8'));
    assert.match(plan.blocked.map((row: {reason: string}) => row.reason).join(' | '), /symlink or special file/);
  } finally {
    rmSync(root, {recursive: true, force: true});
  }
});

test('apply refuses unapproved public deletions and then applies the reviewed plan', {skip}, () => {
  const root = tempRoot('snapshot-apply-');
  try {
    const privateRepo = makePrivate(root, {'src/ok.ts': 'export const value = 1;\n'});
    const publicRepo = makePublic(root, {
      'src/ok.ts': 'export const value = 0;\n',
      'src/public-only.ts': 'export const legacy = 1;\n',
    });
    const planPath = join(root, 'plan.json');
    assert.equal(runSnapshot(privateRepo, publicRepo, planPath).status, 0);
    const plan = JSON.parse(readFileSync(planPath, 'utf8'));
    assert.deepEqual(plan.removed, ['src/public-only.ts']);

    const refused = runSnapshot(privateRepo, publicRepo, planPath, ['--apply']);
    assert.equal(refused.status, 3, refused.stdout + refused.stderr);
    assert.equal(readText(join(publicRepo, 'src/public-only.ts')), 'export const legacy = 1;\n');
    assert.equal(readText(join(publicRepo, 'src/ok.ts')), 'export const value = 0;\n');

    const applied = runSnapshot(privateRepo, publicRepo, planPath, ['--apply', '--allow-remove', 'src/public-only.ts']);
    assert.equal(applied.status, 0, applied.stdout + applied.stderr);
    assert.equal(readText(join(publicRepo, 'src/ok.ts')), 'export const value = 1;\n');
    assert.equal(existsSync(join(publicRepo, 'src/public-only.ts')), false);
  } finally {
    rmSync(root, {recursive: true, force: true});
  }
});

test('apply refuses a plan reviewed against a moved public checkout', {skip}, () => {
  const root = tempRoot('snapshot-stale-');
  try {
    const privateRepo = makePrivate(root, {'src/ok.ts': 'export const value = 1;\n'});
    const publicRepo = makePublic(root, {'src/ok.ts': 'export const value = 0;\n'});
    const planPath = join(root, 'plan.json');
    assert.equal(runSnapshot(privateRepo, publicRepo, planPath).status, 0);
    writeFiles(publicRepo, {'src/other.ts': 'export const other = 1;\n'});
    git(publicRepo, ['add', '-A']);
    git(publicRepo, ['commit', '--quiet', '-m', 'move public main']);
    const result = runSnapshot(privateRepo, publicRepo, planPath, ['--apply']);
    assert.equal(result.status, 3, result.stdout + result.stderr);
    assert.match(result.stdout + result.stderr, /Public checkout moved since the reviewed plan/);
  } finally {
    rmSync(root, {recursive: true, force: true});
  }
});
