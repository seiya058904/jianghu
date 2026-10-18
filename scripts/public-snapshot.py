"""Plan/apply a curated tracked snapshot onto a clean clone of public main.

The snapshot is a *curated mirror*, not a copy of the private repository: only
explicitly allowed public scopes are read, and a fail-closed policy decides for
every tracked path whether it is public (candidate), private (excluded with a
reason) or unclassified (blocked until a human reviews the policy).

Safety contract
---------------
* Reads only committed Git objects of --source-ref (never the working tree).
* Never pushes, never changes remotes, never rewrites history.
* Writes only the plan file and (with --apply) files inside --destination.
* --apply refuses a stale plan, a dirty public checkout, any blocked path and
  any deletion that was not explicitly approved with --allow-remove.
* Every candidate is checked for path, content and size privacy before the plan
  is written; secrets, machine absolute paths in code, new private records and
  unreviewed large binaries stop the plan instead of reaching the commit.

Exit codes: 0 = plan OK (status OK or NO_PUBLIC_CHANGE), 2 = usage/environment
error, 3 = policy block / refused apply.

Usage:
  python scripts/public-snapshot.py --source-ref HEAD --destination <public-clone> \
      --plan <outside-plan.json> [--apply] [--allow-remove PATH] [--require-head]
  python scripts/public-snapshot.py --classify <path>...   # policy probe, no git
"""
import argparse, hashlib, io, json, re, subprocess, sys, tarfile
from pathlib import Path

POLICY_VERSION = 2
CANON = '宋世江湖.md'

# Already public, reviewed runtime art. Exact-byte preservation only: this is
# not permission to add or replace large binaries in a new release.
LEGACY_BINARIES = {'public/art/ferry.png': '3afd0d4d63d4b77745b5cf7aa567d18ec053ec5dd5562afe7b187fc09568ba9e'}
MAX_FILE_BYTES = 1_000_000

# Public scopes: top-level directory -> suffixes that may be published.
SCOPES = {
    'src': {'.ts', '.css', '.json'},
    'story': {'.mjs', '.ink', '.json', '.md'},
    'public': {'.js', '.json', '.svg', '.webp', '.png', '.txt', '.ico'},
    'scripts': {'.mjs', '.py', '.ps1', '.sh'},
    'tests': {'.ts', '.json'},
    'docs': {'.md', '.json', '.log', '.txt', '.csv', '.webp'},
    '.github/workflows': {'.yml', '.yaml'},
}
ROOT_FILES = {'.gitignore', '.gitattributes', 'package.json', 'package-lock.json',
              'tsconfig.json', 'vite.config.ts', 'playwright.config.ts'}
ROOT_SUFFIXES = {'.html', '.md'}

# Explicit private denials. Checked before any allow rule, so a private record
# can never be published just because its extension looks document-like.
DENY_FILES = {
    CANON: 'private canon text',
    'docs/audits/independent-final/DAILY_REPO_ADOPTION-20261018.md': 'private repository adoption record',
    'docs/audits/independent-final/DAILY_REPO_SWITCH_PLAN.md': 'private repository switch plan',
    'docs/audits/independent-final/FINAL_CLOSEOUT.md': 'private closeout receipt',
    'docs/audits/independent-final/PRIVATE_REPO_BOUNDARY-20261018.md': 'private/public release boundary record',
}
DENY_PREFIXES = (
    ('docs/archives/', 'private frozen archive bytes'),
    ('.workbuddy/', 'local agent workspace'),
    ('.impeccable/', 'local design review workspace'),
    ('docs/audits/independent-final/2026-10-18-cleanup/', 'private cleanup/recovery receipts'),
    ('docs/art/candidates-', 'unbound candidate art'),
)
DENY_SUFFIXES = {
    '.zip': 'archive backup', '.tar': 'archive backup', '.gz': 'archive backup', '.tgz': 'archive backup',
    '.7z': 'archive backup', '.rar': 'archive backup', '.bundle': 'git bundle backup',
    '.pem': 'key material', '.key': 'key material', '.pfx': 'key material', '.p12': 'key material',
    '.exe': 'executable', '.dll': 'executable', '.msi': 'executable', '.bat': 'executable',
    '.cmd': 'executable', '.sqlite': 'database', '.db': 'database',
}
DENY_NAME_RE = re.compile(r'(^|/)(\.env(\..*)?|id_(rsa|ed25519|ecdsa)(\..*)?|\.DS_Store|Thumbs\.db|.*\.(pem|key|pfx|p12))$', re.I)
# Executable files inside the documentation tree are local probes, not docs.
DOC_EXECUTABLE_SUFFIXES = {'.mjs', '.js', '.ts', '.sh', '.ps1', '.py'}

# Documentation text may have machine paths redacted. Source, story, generated
# data, tests and scripts never are: a machine path there is a release blocker.
DOC_SUFFIXES = {'.md', '.txt', '.log', '.csv'}
DOC_JSON_SCOPE = 'docs'

SECRET_PATTERNS = (
    (re.compile(r'-----BEGIN [A-Z ]*PRIVATE KEY-----'), 'private key block'),
    (re.compile(r'\bgh[pousr]_[A-Za-z0-9]{20,}'), 'GitHub token'),
    (re.compile(r'\bgithub_pat_[A-Za-z0-9_]{20,}'), 'GitHub token'),
    (re.compile(r'\bAKIA[0-9A-Z]{16}\b'), 'AWS access key'),
    (re.compile(r'\bsk-[A-Za-z0-9]{24,}'), 'API key'),
    (re.compile(r'(?i)(api[_-]?key|secret|password|passwd|token)\s*[:=]\s*["\x27]?[A-Za-z0-9_\-]{16,}'), 'credential assignment'),
)
ABS_WIN_RE = re.compile(r'(?<![A-Za-z0-9_])[A-Za-z]:[\\/][^\n\r"<>\x60|]*')
ABS_POSIX_RE = re.compile(r'(?<![A-Za-z0-9_:/])/(?:Users|home)/([A-Za-z0-9._-]+)(?:/[^\s"\'<>\x60|]*)?')
POSIX_CI_USERS = {'runner', 'ubuntu', 'node', 'user', 'root'}
# Identifiers of private operational records. A candidate that introduces one
# of them (relative to what public main already carries) is blocked.
PRIVATE_RECORD_MARKERS = (
    'Jianghu-author-history', '2026-10-18-cleanup', '478-private-files',
    'recycle-receipt', 'switch-journal', 'repo-manifest-2026-10-18',
    'Jianghu-independent-20261018', 'S-1-5-21-', 'RECYCLE.BIN',
)
# A new operational record under docs/audits must not enter the mirror just
# because its extension is document-like; private inventories keep such names.
AUDIT_RECORD_NAME_RE = re.compile(
    r'(journal|manifest|private|backup|switch|cleanup|recovery|recycle|inventory|preservation|adoption)',
    re.I,
)
# Files that define or test the policy itself must be able to name the records
# they exclude; they are reviewed source, not mirrored operational records.
POLICY_SELF_FILES = {
    'scripts/public-snapshot.py',
    'scripts/publish-public.ps1',
    'tests/public-snapshot.test.ts',
}


def fail(message, code=2):
    print(json.dumps({'status': 'ERROR', 'error': message}, ensure_ascii=False))
    raise SystemExit(code)


def invalid_path_reason(name):
    if not name or name.startswith('/') or re.match(r'^[A-Za-z]:', name):
        return 'absolute path'
    if '\\' in name:
        return 'backslash path separator'
    parts = name.split('/')
    if any(part in ('', '.', '..') for part in parts):
        return 'path traversal or empty segment'
    if any(ord(ch) < 32 for ch in name):
        return 'control character in path'
    if ':' in name:
        return 'Windows alternate data stream or drive syntax'
    for part in name.split('/'):
        base = part.split('.')[0].upper()
        if base in ('CON', 'PRN', 'AUX', 'NUL') or re.fullmatch(r'(COM|LPT)[1-9]', base):
            return 'Windows reserved device name'
        if part.endswith('.') or part.endswith(' '):
            return 'Windows-unsafe trailing dot or space'
    return None


def deny_reason(name):
    folded = name.casefold()
    for known, reason in DENY_FILES.items():
        if folded == known.casefold():
            return reason
    for prefix, reason in DENY_PREFIXES:
        if folded.startswith(prefix.casefold()):
            return reason
    suffix = Path(name).suffix.lower()
    if suffix in DENY_SUFFIXES:
        return DENY_SUFFIXES[suffix]
    if DENY_NAME_RE.search(name):
        return 'credential/backup file name'
    return None


def allow_decision(name):
    """Return (decision, reason) with decision in {'candidate','excluded','blocked'}."""
    bad = invalid_path_reason(name)
    if bad:
        return 'blocked', bad
    denied = deny_reason(name)
    if denied:
        return 'excluded', denied
    suffix = Path(name).suffix.lower()
    if '/' not in name:
        if name in ROOT_FILES or suffix in ROOT_SUFFIXES:
            return 'candidate', 'root file'
        return 'blocked', 'unclassified root file'
    scope = None
    for candidate in sorted(SCOPES, key=len, reverse=True):
        if name.startswith(candidate + '/'):
            scope = candidate
            break
    if scope is None:
        return 'blocked', 'unclassified top-level directory'
    if suffix in SCOPES[scope]:
        return 'candidate', 'public scope ' + scope
    if scope == 'docs' and suffix in DOC_EXECUTABLE_SUFFIXES:
        return 'excluded', 'executable file inside documentation tree'
    return 'blocked', 'unclassified file type in public scope ' + scope


def is_doc_text(name):
    suffix = Path(name).suffix.lower()
    if suffix in DOC_SUFFIXES:
        return True
    return suffix == '.json' and (name.startswith(DOC_JSON_SCOPE + '/'))


SOURCE_ROOT = None


def redact_text(text):
    # Keep the historical replacements first so already-published receipts stay
    # byte-stable; they document project-external evidence by relative name.
    if SOURCE_ROOT is not None:
        archive = SOURCE_ROOT.parent / 'Jianghu-independent-20261018'
        for path, replacement in ((archive, '../Jianghu-independent-20261018'), (SOURCE_ROOT, '.')):
            text = text.replace(str(path), replacement).replace(path.as_posix(), replacement)
    text = ABS_WIN_RE.sub('[author-local-path]', text)

    def _posix(match):
        if match.group(1).lower() in POSIX_CI_USERS:
            return match.group(0)
        return '[author-local-path]'

    return ABS_POSIX_RE.sub(_posix, text)


def redact_json_value(value):
    if isinstance(value, str):
        return redact_text(value)
    if isinstance(value, list):
        return [redact_json_value(item) for item in value]
    if isinstance(value, dict):
        return {key: redact_json_value(item) for key, item in value.items()}
    return value


def find_secret(text):
    for pattern, label in SECRET_PATTERNS:
        if pattern.search(text):
            return label
    return None


def private_markers(text):
    return {marker for marker in PRIVATE_RECORD_MARKERS if marker in text}


def scanner():
    parser = argparse.ArgumentParser(
        description='Plan/apply a curated public snapshot from committed private sources.',
        epilog='Policy version %d. Exit codes: 0 ok, 2 usage/environment, 3 blocked/refused.' % POLICY_VERSION,
        formatter_class=argparse.RawDescriptionHelpFormatter,
        add_help=True,
    )
    parser.add_argument('--source-ref', help='private commit (SHA/ref) to snapshot')
    parser.add_argument('--destination', help='clean public Git checkout root (outside the private repo)')
    parser.add_argument('--plan', help='plan JSON path, outside both checkouts')
    parser.add_argument('--apply', action='store_true', help='apply an reviewed plan to the destination')
    parser.add_argument('--allow-remove', action='append', default=[], metavar='PATH',
                        help='explicitly approve deleting this public-only path (repeatable)')
    parser.add_argument('--require-head', action='store_true',
                        help='refuse unless --source-ref resolves to the private repo HEAD')
    parser.add_argument('--classify', nargs='+', metavar='PATH',
                        help='print the policy decision for each path and exit (no git access)')
    parser.add_argument('--policy-version', action='store_true', help='print the policy version and exit')
    return parser


def run_git(cwd, *items):
    try:
        return subprocess.check_output(['git', *items], cwd=cwd, stderr=subprocess.PIPE)
    except subprocess.CalledProcessError as error:
        detail = (error.stderr or b'').decode('utf-8', 'replace').strip()
        fail('git %s failed in %s: %s' % (' '.join(items), cwd, detail), 2)


def main(argv=None):
    args = scanner().parse_args(argv)
    if args.policy_version:
        print(POLICY_VERSION)
        return 0
    if args.classify:
        rows = []
        for name in args.classify:
            decision, reason = allow_decision(name)
            rows.append({'path': name, 'decision': decision, 'reason': reason})
        print(json.dumps({'policyVersion': POLICY_VERSION, 'results': rows}, ensure_ascii=False, indent=2))
        return 0
    if not (args.source_ref and args.destination and args.plan):
        fail('--source-ref, --destination and --plan are required unless --classify/--policy-version is used', 2)

    global SOURCE_ROOT
    root = Path(__file__).resolve().parent.parent
    SOURCE_ROOT = root
    destination = Path(args.destination).resolve()
    if destination == root or root in destination.parents:
        fail('Refusing to use a destination inside the private repository', 2)
    if Path(run_git(root, 'rev-parse', '--show-toplevel').decode().strip()).resolve() != root:
        fail('This script must live in the private repository it snapshots', 2)
    if Path(run_git(destination, 'rev-parse', '--show-toplevel').decode().strip()).resolve() != destination:
        fail('Destination must be the public Git checkout root', 2)
    plan_path = Path(args.plan).resolve()
    if plan_path == root or root in plan_path.parents or plan_path == destination or destination in plan_path.parents:
        fail('Keep the review plan outside both checkouts', 2)
    if run_git(destination, 'status', '--porcelain').strip():
        fail('Public checkout is dirty', 2)

    source_sha = run_git(root, 'rev-parse', args.source_ref + '^{commit}').decode().strip()
    head_sha = run_git(root, 'rev-parse', 'HEAD').decode().strip()
    if args.require_head and source_sha != head_sha:
        fail('--require-head: source %s is not the private HEAD %s' % (source_sha[:12], head_sha[:12]), 2)
    public_before = run_git(destination, 'rev-parse', 'HEAD').decode().strip()
    public_branch = run_git(destination, 'rev-parse', '--abbrev-ref', 'HEAD').decode().strip()

    data = run_git(root, 'archive', '--format=tar', source_sha)
    candidates = {}
    excluded = []
    blocked = []
    redactions = []
    retained_legacy = []
    old_files = set(run_git(destination, 'ls-files', '-z').decode('utf-8').split('\0')) - {''}
    public_bytes = {}
    for name in old_files:
        target = (destination / name).resolve()
        if target.is_file():
            public_bytes[name] = target.read_bytes()

    seen = set()
    by_lower = {}
    with tarfile.open(fileobj=io.BytesIO(data), mode='r:') as archive:
        for member in archive.getmembers():
            name = member.name
            if member.isdir():
                continue
            if not member.isfile():
                blocked.append({'path': name, 'reason': 'symlink or special file'})
                continue
            bad = invalid_path_reason(name)
            if bad:
                blocked.append({'path': name, 'reason': bad})
                continue
            lowered = name.lower()
            if lowered in by_lower:
                blocked.append({'path': name, 'reason': 'case-insensitive duplicate of ' + by_lower[lowered]})
                continue
            by_lower[lowered] = name
            if name in seen:
                blocked.append({'path': name, 'reason': 'duplicate archive entry'})
                continue
            seen.add(name)
            decision, reason = allow_decision(name)
            if decision == 'excluded':
                excluded.append({'path': name, 'reason': reason})
                continue
            if decision == 'blocked':
                blocked.append({'path': name, 'reason': reason})
                continue
            blob = archive.extractfile(member).read()
            suffix = Path(name).suffix.lower()
            if (name.startswith('docs/audits/') and name not in public_bytes
                    and AUDIT_RECORD_NAME_RE.search(Path(name).name)):
                blocked.append({'path': name, 'reason': 'unreviewed new audit operational record name'})
                continue
            if is_doc_text(name):
                try:
                    text = blob.decode('utf-8-sig')
                except UnicodeDecodeError:
                    blocked.append({'path': name, 'reason': 'documentation file is not valid UTF-8'})
                    continue
                secret = find_secret(text)
                if secret:
                    blocked.append({'path': name, 'reason': 'secret material: ' + secret})
                    continue
                if name.endswith('.json'):
                    try:
                        value = json.loads(text)
                    except json.JSONDecodeError as error:
                        blocked.append({'path': name, 'reason': 'invalid JSON: %s' % error})
                        continue
                    cleaned = redact_json_value(value)
                    blob = blob if cleaned == value else (json.dumps(cleaned, ensure_ascii=False, indent=2) + '\n').encode('utf-8')
                else:
                    blob = redact_text(text).encode('utf-8')
                if blob != archive.extractfile(member).read():
                    redactions.append({'path': name, 'kind': 'documentation path redaction'})
                residual = blob.decode('utf-8-sig', 'replace')
                if ABS_WIN_RE.search(residual) or ABS_POSIX_RE.search(residual):
                    blocked.append({'path': name, 'reason': 'unredactable machine path remains in documentation'})
                    continue
            else:
                if suffix not in ('.png', '.webp', '.ico'):
                    text = blob.decode('utf-8-sig', 'replace')
                    secret = find_secret(text)
                    if secret:
                        blocked.append({'path': name, 'reason': 'secret material: ' + secret})
                        continue
                    if ABS_WIN_RE.search(text) or ABS_POSIX_RE.search(text):
                        blocked.append({'path': name, 'reason': 'machine absolute path in a non-documentation file'})
                        continue
            if len(blob) > MAX_FILE_BYTES and not is_doc_text(name):
                previous = public_bytes.get(name)
                if LEGACY_BINARIES.get(name) != hashlib.sha256(blob).hexdigest() or previous != blob:
                    blocked.append({'path': name, 'reason': 'unreviewed large binary (%d bytes)' % len(blob)})
                    continue
                retained_legacy.append(name)
            # A candidate that introduces a private record identifier must be
            # reviewed: block instead of silently mirroring private operations.
            markers = set() if name in POLICY_SELF_FILES else private_markers(blob.decode('utf-8-sig', 'replace'))
            if markers:
                previous = public_bytes.get(name)
                old_markers = private_markers(previous.decode('utf-8-sig', 'replace')) if previous else set()
                introduced = sorted(markers - old_markers)
                if introduced:
                    blocked.append({'path': name, 'reason': 'introduces private record reference: ' + ', '.join(introduced)})
                    continue
            candidates[name] = blob

    manifest = [{'path': name, 'bytes': len(blob), 'sha256': hashlib.sha256(blob).hexdigest()}
                for name, blob in sorted(candidates.items())]
    changed = sorted(name for name, blob in candidates.items() if public_bytes.get(name) != blob)
    blocked_paths = {row['path'] for row in blocked}
    removed = sorted(old_files - set(candidates) - blocked_paths)
    status = 'BLOCKED' if blocked else ('NO_PUBLIC_CHANGE' if not changed and not removed else 'OK')
    result = {
        'policyVersion': POLICY_VERSION,
        'status': status,
        'sourceCommit': source_sha,
        'publicBefore': public_before,
        'publicBranch': public_branch,
        'trackedFiles': len(candidates),
        'trackedBytes': sum(len(blob) for blob in candidates.values()),
        'maximumFile': max(manifest, key=lambda row: row['bytes']),
        'changed': changed,
        'removed': removed,
        'excluded': sorted(excluded, key=lambda row: row['path']),
        'blocked': sorted(blocked, key=lambda row: row['path']),
        'redactions': sorted(redactions, key=lambda row: row['path']),
        'retainedLegacyBinaries': retained_legacy,
        'files': manifest,
    }
    if args.apply and plan_path.exists():
        try:
            reviewed = json.loads(plan_path.read_text(encoding='utf-8'))
        except json.JSONDecodeError:
            fail('Reviewed plan on disk is not valid JSON', 3)
        if reviewed.get('sourceCommit') != source_sha:
            fail('Source commit moved since the reviewed plan; re-plan before applying', 3)
        if reviewed.get('publicBefore') != public_before:
            fail('Public checkout moved since the reviewed plan; re-plan before applying', 3)
        if reviewed.get('status') == 'BLOCKED':
            fail('Reviewed plan is BLOCKED; fix the policy or the source first', 3)
    plan_path.parent.mkdir(parents=True, exist_ok=True)
    encoded = json.dumps(result, ensure_ascii=False, indent=2) + '\n'
    plan_path.write_text(encoded, encoding='utf-8')
    digest = hashlib.sha256(encoded.encode('utf-8')).hexdigest()

    summary = {key: result[key] for key in
               ('status', 'policyVersion', 'sourceCommit', 'publicBefore', 'trackedFiles',
                'trackedBytes', 'maximumFile')}
    summary['changedCount'] = len(changed)
    summary['removedCount'] = len(removed)
    summary['excludedCount'] = len(excluded)
    summary['blockedCount'] = len(blocked)
    summary['redactionCount'] = len(redactions)
    summary['plan'] = str(plan_path)
    summary['planSha256'] = digest
    print(json.dumps(summary, ensure_ascii=False, indent=2))

    if blocked:
        print('BLOCKED: %d path(s) violate the public snapshot policy; see %s' % (len(blocked), plan_path), file=sys.stderr)
        return 3
    if not args.apply:
        return 0

    # --apply: re-validate the reviewed plan and the public checkout state.
    if run_git(destination, 'rev-parse', 'HEAD').decode().strip() != public_before:
        fail('Public checkout moved after the plan was reviewed', 3)
    if run_git(destination, 'status', '--porcelain').strip():
        fail('Public checkout became dirty after the plan was reviewed', 3)
    unapproved = sorted(set(removed) - set(args.allow_remove))
    if unapproved:
        print(json.dumps({'status': 'BLOCKED', 'reason': 'unapproved public-only deletions', 'paths': unapproved},
                         ensure_ascii=False, indent=2))
        return 3
    for name in removed:
        target = (destination / name).resolve()
        if destination not in target.parents:
            fail('Removal escapes the public checkout', 3)
        if target.is_file():
            target.unlink()
    for name, blob in candidates.items():
        target = (destination / name).resolve()
        if destination not in target.parents:
            fail('Write escapes the public checkout', 3)
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes(blob)
    print(json.dumps({'status': 'APPLIED', 'changed': len(changed), 'removed': len(removed),
                      'planSha256': digest}, ensure_ascii=False))
    return 0


if __name__ == '__main__':
    sys.exit(main())
