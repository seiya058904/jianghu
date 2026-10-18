# Engineering independent source review

Baseline: `7a2c22f74c46d74f07af8bd1a45893ec15daa49b`. This review reads current first-party source, rather than treating historical PASS reports as proof. Original canon, frozen archives and generated screenplay data were not changed.

## Actual coverage

57 files / 3,724 lines were read across the complete core TypeScript runtime/UI/library/edition/storage modules (17 files), all 25 existing scripts, `public/sw.js`, and 14 directly relevant test files. Full per-file SHA-256, line count and reviewed range are in `engineering-files.csv`. Hashing was done after reading; it is not counted as reading. Shared test imports/evidence wrappers may subsequently change under the parent agent; the CSV is a review snapshot, not a final release hash manifest.

Core responsibilities reviewed: Ink replay and native restore; strict commands/runtime/presentation equality; legacy migration against frozen content; DOM escaping and imported JSON data flow; typography timers and choice/input guards; modal focus and paused autoplay; work edition routing and namespaces; prerequisite locks; library progress; exports and corrupt raw-slot preservation; service worker install/fetch/work-cache handling; static server scope/path containment; screenplay compilation and metadata validation; offline bundle ownership; all existing audit/backup/asset-manifest tools.

Codebase-memory was used for index status, symbol lookup, trace and source snippet. Generations advanced from 2026-10-18T02:41:54Z to 02:44:55Z during the review; every relied-on core, test and script path received check_index_coverage. The tool continued to report coverage_unavailable / metadata_changed (new test not_tracked). Consequently all material conclusions use complete current-source fallback. Graph pagination was used for discovery only; no graph completeness claim is made.

## Confirmed defects and fixes

- **ENG-01 / P1**: localStorage denial or quota failure prevented starting a new story; denied getItem also broke the whole collection page and save/export panel. Reads and draft-key enumeration now degrade safely. Fresh sessions render and remain exportable when saving fails. Restart still backs up existing raw auto before changing the active session, so failed backup does not replace old progress.
- **ENG-02 / P1**: stale same-work tabs silently overwrote newer auto progress on advance/pagehide. Implicit persistence now compares the current stored raw auto with the last observed/written snapshot. A conflict preserves storage and offers in-memory export. Explicit load/restart first preserves the actual current raw auto. This is stale-writer protection, not a cross-tab transactional lock for exactly simultaneous writes.
- **ENG-03 / P1**: work downloads refreshed root/index HTML without the current shell hashed scripts/styles. An unchanged old worker could retain old shell assets, accept new HTML, then fail offline on the collection page. Work downloads now fetch and scope-validate the current shell manifest and atomically add that shell with missing work entries. Other cached works are retained. HTTP, unsafe-manifest and cache-write failure return ok:false.

Changed production files: `src/player.ts`, `src/storage.ts`, `src/main.ts`, `src/legacy-main.ts`, `src/works-registry.ts`, `public/sw.js`. Tests added: `storage-failure.spec.ts`, `service-worker-update.test.ts`, `storage-reliability.test.ts`; existing library test adds denied storage, and offline-work-gate request expectation includes the newly required shell manifest. Existing assertions were not weakened.

## Checks actually performed here

`node --experimental-strip-types --test tests/library.test.ts tests/service-worker-update.test.ts tests/storage-reliability.test.ts`: **13 passed / 0 failed**, exit 0; raw output `engineering-targeted-tests.log`.

`npx tsc --noEmit`: exit 0; `engineering-typecheck.log`. Scoped `git diff --check` for engineering production/modified existing test paths: exit 0 after normalizing the edited offline-work-gate test to LF. A global diff check initially detected CRLF whitespace in concurrent parent test-evidence edits; it was reported to the parent, and is not claimed green here.

Browser integration command handed to parent: `npx playwright test tests/storage-failure.spec.ts --workers=1` after rebuilding current source. This agent did not build/recompile stories or run shared-evidence historical audits, whole npm test, full E2E, CI or publishing. Those would conflict with the parent integration stage. Browser and final-RC results must be recorded by that stage before marking these issues release-verified.

## Security and reliability conclusions bounded to reviewed source

Imported save JSON never becomes trusted display HTML. Runtime and presentation are reconstructed from bounded legal commands, compared to the supplied complete snapshots, then native Ink LoadJson is exercised; historical presentation migrations additionally replay frozen previousContent and compare narrative/variables. The 1 MB file/raw limit and command caps precede replay. Display dialogue, choices, history, save descriptions and error messages use textContent or escaping. Metadata-generated markup comes from first-party catalogs. No confirmed imported-save XSS or traversal was found within these reviewed paths. This is source review plus the listed tests, not a claim of a full browser penetration test.

Input logic rejects repeat keyboard events, modal/background advance, double-click detail>1, and inputs inside a 180ms cooldown; choices require awaitingChoice. Autoplay/skip stop at replies and page visibility change. Existing player.spec.ts covers these actual states, import/export, byte-preserved corrupt/old slots, missing art and offline flows. Existing long-work storage and pack tests exercise frozen/current prefixes and cold missing data chunks. Their execution belongs to final parent E2E, rather than being assumed from source presence.

Static serve resolves decoded URL paths underneath dist and checks the absolute root boundary; the worker limits fetch interception to same-origin scope. Work and shell manifest entries must be ./ relative and resolve inside scope. Cache.addAll failure prevents a success reply. Asset failures do not feed user-controlled HTML. Story tags validate cast<=3, unique IDs, known speaker/scene/mood/look/CG, and explicit endings. Runtime loops/unsupported commands throw.

## Remaining limits and maintenance observations

- No Android hardware, Safari/Firefox, screen-reader, human reading-time or human aesthetic acceptance is established here.
- This engineering agent did not read story author sources, catalog artwork data, CSS/HTML/config/CI, or the many remaining story-specific tests. They are owned by the parent/other reviewers. F11 requires merging their file indexes; 57 is not the whole repository denominator.
- Audit scripts sample paths and generally label that limitation. Linear source passive counts concatenate mutually exclusive branches and cannot prove runtime path lengths. audit-v7-works still contains a misleading comment suggesting source order equals reading order; its raw metric must remain an upper-bound locator.
- audit-v7-narration-runs treats player speech as part of its no-NPC run and ignores choice-bearing speech in first-NPC probing. Treat it as a no-NPC locator, not an exact narrator-only ratio. audit-v7-spec-metrics default includes archived editions despite its header saying 23 current; callers must filter explicitly.
- Historical snapshot-v4.mjs can overwrite its fixed archive destination if deliberately rerun; it must not be rerun on the existing protected archive. baseline-v6.mjs correctly refuses an existing manifest. Neither historical snapshot utility was executed or modified in this review.
- prepareOffline awaits navigator.serviceWorker.ready before its message timeout; a permanently failed worker registration can leave a download attempt pending. This is a recoverable UI limitation, not a stored-data loss path; final parent review may tighten the full-operation timeout.
- Storage read denial makes inaccessible old data unavailable for export until access returns. The app preserves underlying bytes and offers export of current in-memory progress; it cannot read browser-denied bytes.

Issue-level structured details and verification states are in `engineering-issues.json`. No confirmed P0 was found in this bounded engineering review; three confirmed P1 fixes require parent browser/final-RC recheck.


## Follow-up test integrity and reliability repairs

See engineering-tests-review.md and engineering-tests-files.csv: all remaining handwritten tests reviewed, including evidencePath, with two canon-owner files excluded. The 30s serviceWorker.ready gap is now fixed with one timer and no late-ready cache side effect; browser retry regression awaits parent integration. Frozen omission policy is narrowed to private canon/archives; eight draft suites now retain unchanged expected hashes via frozenBytes. Historical identity of seven explicitly edited current paths is protected by independent binary Git exports and strict historicalBytes, not by changing old hash expectations. Targeted64/64 and typecheck exit0; initial failure and archive/17-ledger proofs are retained in engineering-historical-* and engineering-preservation-proof.json. All full-browser/public-checkout/exact-final-SHA conclusions belong to parent integration.
