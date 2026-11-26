---
name: jianghu-release
description: Use when building/cleaning dist safely, auditing the 1GiB repository size target, or verifying GitHub Verify and Pages releases for Jianghu.
---

# Jianghu Release, Size Budget & Safe Build Rules

- **Git & publishing**: local `main` and `origin/main` share public history (dual-lineage curated publishing is retired; see `docs/PUBLISHING.md`). Before committing, check `git diff --cached` to ensure ignored local canon/private files never enter the index. Use `git pull --ff-only` only when authorized; pushes, merges, deploys, and dependency updates require explicit authorization. Never force-push, rewrite history, delete objects/reflog, empty Recycle Bin, or add a new `LICENSE`.
- **Safe `dist/` cleanup**: `npm run build` clears `dist/`. If a local bulk-delete guard blocks clearing `dist/`, validate the exact absolute path and move `dist/` outside the repo — never run blanket recursive delete commands.
- **1 GiB repository budget**: includes `.git`; report worktree, `.git`, root logical bytes, and allocation separately. Never fake compliance by ignoring screenshots or temporarily uninstalling dependencies. Slimming requires exact inventory and verifiable backup first.
- **Live verification**: verify GitHub Actions `Verify` and `Deploy Pages` for the exact public commit SHA; open the live homepage, deep links, images, and choices and compare asset hashes with CI artifacts. Workflow trigger or HTTP 200 alone does not prove release.
