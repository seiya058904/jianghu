---
name: jianghu-audit-evidence
description: Use when running independent audits, checking Jianghu art/Alpha/CG rendering, managing externalized PNG evidence, or verifying frozen/historical baseline rules.
---

# Jianghu Audit, Art & Evidence Rules

- **Frozen & historical baselines**: `frozenBytes` allows missing-file warnings ONLY for intentionally excluded full canon text and `docs/archives`; any other missing source/asset must fail. `historicalBytes` must verify source commit, path, bytes, and SHA after confirming live files still exist — never substitute live files for old snapshots.
- **Art & compositing**: backgrounds and transparent single-character sprites composite independently. Verify actual Alpha, age, weapon, identity, co-presence, focus, CG show/hide, and restore — RGBA headers or HTTP 200 do not prove visual correctness. Legacy multi-character CGs may stay; unbound candidates do not count as runtime assets.
- **Externalized evidence**: tests write via `tests/evidence-path.ts` to `JIANGHU_EVIDENCE_DIR` (defaults to OS temp dir); keep one out-of-repo batch per RC without overwriting prior evidence. On 2026-10-18, 2,121 PNGs were SHA-verified and externalized (2,109 untracked; mapping/restore in `docs/evidence/README.md`).
- **Committed screenshots**: include only essential frames, WebP width ≤800 px, never commit >1 MB binaries. Never permanently delete canon sources, legacy drafts, user assets, or audit evidence without verified backup.
- **Delivery honesty**: sync README, navigation, and acceptance rows; targeted force-add only needed audit `.log` files (no noisy dumps, never paste full canon text). Report actual PASS/FAIL/SKIP/FLAKY, exit codes, RC, and asset hashes; mark untested human playtest, reading time, Android, Safari/Firefox, and screen readers as `EXTERNAL NOT VERIFIED`.
