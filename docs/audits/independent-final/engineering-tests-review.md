# Independent engineering test review

Reviewed on 2026-10-18 against current working sources, not historical report claims. `engineering-tests-files.csv` records the 142 additional files (5176 lines) read line by line, full ranges, current SHA256 and line counts. Combined with the 14 test files in `engineering-files.csv`, 156 of 158 files under tests were reviewed. The two independent-canon-early/late files were deliberately excluded because their owners were writing them. Enumeration and hashing were bookkeeping after actual source reads; truncated tool output was reread in bounded sections.

Graph coverage was checked in two batches (100+42 paths) for project D-xia-zai-AI-project-Project-in-Iteration-Jianghu, generation 2026-10-18T02:52:58Z. Results remained best-effort, metadata_changed, empty coverage, recommended read_source_and_reindex. This review therefore uses direct current source. The initial oversized 142-path request was rejected (maximum128), then corrected. Concurrent integration changes evidence output paths; hashes describe the recorded working snapshot, not an immutable commit.

## Confirmed findings and repairs

1. The original frozenBytes helper excused every missing file, including current source. It now normalizes slash/backslash paths and only excuses absent exact 宋世江湖.md or descendants of docs/archives/. Missing live source/public/story, path traversal out of archives, empty/null/undefined input fail. A temporary-directory subprocess regression tests both separators without mutating actual repository files. Expected hashes remain unchanged. Public archive integrity remains PARTIAL when excluded originals are absent.
2. Eight editorial draft files contained ten direct reads in frozen hash loops, bypassing the public-snapshot helper. They now use frozenBytes with unchanged path mapping, expected hashes and actual equality assertions. Missing private evidence is explicitly warned, current missing files fail. This is necessary when integration adds all80 draft/editorial checks to CI.
3. The previous 30-second offline timeout began only after serviceWorker.ready, allowing a permanently pending ready promise to leave the UI disabled forever. The timer now covers ready plus message without increasing30s; expiry blocks a late-ready cache side effect, closes message ports and reenables retry. offline-reliability.spec simulates pending ready, timeout, late resolution with zero postMessages, and a retry. Browser execution is owned by integration.
4. Historical screenshot and transcript/JSON writes existed throughout the tests. Integration redirected them to evidencePath. Firsthand review found two ternary screenshot paths missed by the initial wrapping in twelfth-life.spec and twelfth-life-v2.spec; these were reported to the parent for correction. No historical audit-writing suites were executed by this reviewer. evidencePath itself was read: it accepts only docs/evidence/ logical names, resolves to OS tmp or explicit JIANGHU_EVIDENCE_DIR, rejects targets outside root, and creates only the output parent directory. Integration must finish the final write-target scan.

## Test meaning and integrity

No confirmed fixture replacement with current live content to manufacture an old-save PASS was found. Migration/art suites import separate before-art/before-CG/before-rigging/old-edition JSON; relevant unit suites compare literal hashes or historical manifests. Raw saved JSON is compared and exported byte-for-byte in multiple browser suites. Seven Questions pre-books-CG saves are explicitly rejected after narrative rewiring, with old bytes and export retained; those tests do not falsely claim migration succeeded. Fixture hashes alone establish historical identity only where an independent expected hash or ledger exists; not every browser import independently rehashes its source.

Browser whole-route suites drive actual buttons and compare beat IDs; current major suites additionally compare full dialogue, command sequences and presentation, with reloads. Many use VNRuntime over the same compiled story as an oracle. This proves browser/runtime synchronization on those routes, not independent canon correctness, literary quality or human reading time. Mostly first-choice/second-choice routes do not cover every branch combination. The smaller binary unit enumerators explicitly assert fixed choice counts before enumerating their stated binary paths; seeded random probes declare nonexhaustive results.

Screenshots are generally adjacent to state/text/geometry/decode assertions, not sole evidence of functional PASS. The synthetic long-name/long-dialogue/eight-choice DOM injection in campaign-visual is a labeled pressure case; it is not proof those are authored story beats. Asset decode, dimensions, file selection, hash and alpha checks do not prove anatomical quality, age fidelity, weapon accuracy or visual identity. No independent screenshot-baseline pixel comparison was found. Archived suites repeat older editions: test count is not the number of distinct current-story quality checks.

Multi-tab save behavior was reread with player/storage. An implicit conflict refuses overwrite while leaving the live in-memory session, manual slots, stored-auto export and current-session export accessible. Explicit restore/load validates first, preserves the actual current auto bytes before replacement, and aborts replacement if that backup fails. preserveAuto updates observedAuto only after backup. This protects normal stale-tab/pagehide overwrites; localStorage compare/write is not a transaction across precisely simultaneous writers. Browser integration still must verify recovery/export behavior and quota failure on the final build.

## Commands and boundaries

- node --experimental-strip-types --test tests/frozen-baselines-policy.test.ts: exit0,1 passed/0 failed. It uses unique OS-temp working directories.
- node_modules/.bin/tsc --noEmit after timeout/draft/helper changes: exit0 (earlier execution recorded during repair).
- Earlier targeted13 runtime/worker/storage tests and typecheck are recorded in engineering-targeted-tests.log and engineering-typecheck.log; no full suite was rerun here.
- Attempted TypeScript AST call comparison: exit1 because installed TypeScript7 package does not expose createPrinter; the temporary scanner was removed. Do not claim a mechanical proof that every existing assertion is unchanged from HEAD. Changes were reviewed directly within the bounded repair scope; parent owns final diff verification.
- A Windows rg glob invocation against tests/*draft.test.ts exited1 due wildcard path syntax; no verification conclusion relies on it.

No npm test, build, story generation, full Playwright run, screenshot rendering, public cold-checkout execution or external browser/device testing was performed in this test-source pass. Parent integration is currently investigating seven frozen-protection failures after authorized current-text edits. Until resolved with original expected hashes and independent old bytes retained, those gates are FAIL, not waived or PASS. Separate browser/CI/exact-final-SHA evidence remains required.


## Integration freeze-failure diagnosis

Read integration-tests.log failure locations and corresponding current assertions; then hashed git-show bytes from baseline 7a2c22f without writing or modifying them. Every affected expected hash matches the genuine baseline object (git show exit0 each):

| Current path | Historical expected SHA256 |
|---|---|
| story/north.ink | c0c7772ca9c62d0a982a7c9d86743074ff9a7046a8acebcd4e9d554cc3d7ca26 |
| src/generated/north.json | c1ea622badd0efa7517cd646238d996ebc77255773a3b3292bc937ec58d22d48 |
| story/north-after.mjs | 0156373b150bc2cd4ba93cbf7137c31389ff30b42f2b2542bd0e830b6babcfa1 |
| story/twelfth.ink | a2d37f61c06837d9764166c7f16dc304761557bcd2fbcd663bada87c46e0c6d3 |
| src/generated/twelfth.json | 6be09fe05fc2df85fced816bc68dba68761c0c3d9c20189c5fdbc637661afb2e |
| src/generated/sea.json | c7192b4fe96828648fef52c076315bbd20ac5fa3baf7b3117c983061443456f3 |

Minimal proposed resolution sent to integration: an explicit historicalBytes allowlist maps just these six paths to new independent pre-audit archive copies exported as binary from that commit, with source commit/path/hash manifest. Require current path existence before accessing its historical counterpart. Existing preservation JSON hashes, counts, maps and old restore assertions remain unchanged. North exact-author comparison must explicitly describe historical reviewed identity for north-after; the other current author comparisons stay direct. Current build consistency and current-story regression assertions remain independent requirements. This section diagnoses and proposes; implementation/public-cold-checkout validation is not claimed here.


## Final repair verification (supersedes proposed/unresolved status above)

The parent authorized implementation and then the seventh path story/qian-kun-slow.mjs (SHA256 46b1696c27607aee422f5eba5557dd592155a4dac8142ee7de32fc375c8fcd29,12032 bytes). It was already changed before the first diagnosis; the first frozen assertion concealed the subsequent author comparison. This was not a new concurrent edit.

All seven archives were exported with Python subprocess.check_output git show in binary mode. No original preservation ledger or expected hash was changed. historicalBytes validates exact commit, exact seven-key allowlist, exact archive paths/hashes and byte lengths; current path existence is required before lookup; absent private archive calls frozenBytes and warns PARTIAL. It never substitutes current content for old. North north-after and Qian Kun qian-kun-slow exact-author comparisons explicitly verify historical reviewed identity; current behavior is independently asserted elsewhere.

The same seven-file targeted command (six affected suites plus historical policy) passed64/64, exit0, in engineering-historical-tests-fixed.log. Original63/64 failure is retained in engineering-historical-tests.log. The policy proves historical bytes differ from current, rejects changed commit/map/extra path/missing current/forged archive using unique temp directories, and verifies absent private archive warns. tsc --noEmit exit0 in engineering-historical-typecheck.log. engineering-preservation-proof.json proves17 existing preservation/first-pass JSON files are byte-identical to HEAD, and all7 archives exactly match the source Git objects, manifest hash and length. Scoped git diff --check exit0 after LF normalization; no product source/story generation was changed in this follow-up.

Final test-source manifest adds the two new historical helper/policy files:144 files in engineering-tests-files.csv plus14 prior=158 reviewed out of160 total;2 canon tests remain excluded by ownership. Earlier142/156/158 counts describe the pre-follow-up inventory. Public cold-checkout execution remains the parent's integration gate.
