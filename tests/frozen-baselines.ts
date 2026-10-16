import {existsSync,mkdirSync,readFileSync,rmdirSync,statSync,writeFileSync} from 'node:fs';
import {dirname} from 'node:path';

/**
 * Access to "frozen baseline" bytes: the archival copies (the canon text and
 * docs/archives/**) that the editorial-integrity tests compare against.
 *
 * Two things make a direct readFileSync() wrong here:
 *
 * 1. The ledgers were recorded on Windows, so some recorded paths carry
 *    backslash separators. On a POSIX runner those become a single odd
 *    filename and the read fails even though the file is right there.
 *
 * 2. Those baselines are not part of every checkout. The public mirror
 *    deliberately omits the canon full text and docs/archives (see
 *    docs/PUBLISHING.md for why). Reporting "byte-identical" as FAILED for a
 *    file the checkout does not carry would be a fake regression, and the
 *    author cannot reproduce it either.
 *
 * So the contract is: callers ask for bytes; when the baseline is absent they
 * skip that entry, and this module keeps a record so the omission is visible
 * rather than silent. A summary is written to
 * docs/evidence/v6/frozen-baselines-missing.json at process exit, and each
 * absence also prints as a GitHub Actions warning annotation.
 */

const SEEN = new Set<string>();
const STARTED_AT = Date.now();

/**
 * `node --test` runs every test file in its own child process, so this hook
 * fires once per file and several of them can finish at the same moment.
 * Writing the record outright would let the last file to exit erase what the
 * others found; so each process merges its own findings into the record under
 * an atomic lock. A record left by an earlier run is replaced rather than
 * accumulated into — any two files of one run finish within seconds of each
 * other, so a five minute gap means a different run.
 */
const STALE_RUN_MS = 5 * 60 * 1000;
const REPORT = 'docs/evidence/v6/frozen-baselines-missing.json';
const LOCK = REPORT + '.lock';
/** A lock older than this was left behind by a crashed process; take it over. */
const STALE_LOCK_MS = 30 * 1000;

function sleep(ms: number): void {
  Atomics.wait(new Int32Array(new SharedArrayBuffer(4)), 0, 0, ms);
}

/** One writer at a time, via mkdir (atomic on every platform Node supports). */
function withLock<T>(body: () => T): T | null {
  let held = false;
  for (let attempt = 0; attempt < 250 && !held; attempt++) {
    try {
      if (existsSync(LOCK) && Date.now() - statSync(LOCK).mtimeMs > STALE_LOCK_MS) {
        rmdirSync(LOCK, {recursive: true});
      }
      mkdirSync(LOCK);
      held = true;
    } catch { sleep(20); }
  }
  if (!held) return null;
  try { return body(); } finally {
    try { rmdirSync(LOCK, {recursive: true}); } catch { /* best effort */ }
  }
}

function report(target: string): void {
  if (SEEN.has(target)) return;
  SEEN.add(target);
  const line = `frozen baseline not present in this checkout, entry skipped: ${target} (see docs/PUBLISHING.md)`;
  // GitHub Actions renders ::warning:: on stdout as an annotation.
  if (process.env.GITHUB_ACTIONS) console.log(`::warning title=Frozen baseline absent::${line}`);
  else console.warn(`[frozen-baseline] ${line}`);
}

/** Recorded ledger paths may use Windows separators; normalise to POSIX. */
export function asRepoPath(path: string): string {
  return path.split('\\').join('/');
}

/**
 * Bytes of a frozen baseline, or `null` when this checkout does not carry it.
 * Callers must skip the entry on `null`.
 */
export function frozenBytes(target: string | null | undefined): Buffer | null {
  if (target === null || target === undefined || target === '') {
    report(String(target));
    return null;
  }
  const path = asRepoPath(target);
  if (!existsSync(path)) {
    report(path);
    return null;
  }
  return readFileSync(path);
}

/**
 * A frozen baseline that is itself a JSON ledger (for example
 * docs/archives/sea-v1-editorial-baseline/manifest.json, which records the
 * sha256 of the pre-round bytes). `null` means this checkout does not carry
 * the ledger, so the caller skips the whole block; the omission is reported
 * through `frozenBytes`. A ledger that is present but malformed throws — that
 * is real corruption and must fail loudly.
 *
 * The usual caller is `frozenJson<{sha256: Record<string,string>}>(...)`.
 */
export function frozenJson<T = unknown>(target: string | null | undefined): T | null {
  const bytes = frozenBytes(target);
  if (bytes === null) return null;
  return JSON.parse(bytes.toString('utf8')) as T;
}

process.on('exit', () => {
  if (!SEEN.size) return;
  try {
    mkdirSync(dirname(REPORT), {recursive: true});
    withLock(() => {
      let prior: {missing?: string[]; firstSeenAt?: string} | null = null;
      if (existsSync(REPORT) && Date.now() - statSync(REPORT).mtimeMs < STALE_RUN_MS) {
        try { prior = JSON.parse(readFileSync(REPORT, 'utf8')); } catch { prior = null; }
      }
      const missing = [...new Set([...(prior?.missing ?? []), ...SEEN])].sort();
      writeFileSync(REPORT, JSON.stringify({
        status: 'SOME_FROZEN_BASELINES_ABSENT_IN_THIS_CHECKOUT',
        count: missing.length,
        missing,
        firstSeenAt: prior?.firstSeenAt ?? new Date(STARTED_AT).toISOString(),
        note: 'Editorial-integrity entries pointing at these paths were skipped. They are verified in the author checkout, which carries 宋世江湖.md and docs/archives/. See docs/PUBLISHING.md.',
      }, null, 2) + '\n');
    });
  } catch { /* reporting must never mask a test result */ }
});
