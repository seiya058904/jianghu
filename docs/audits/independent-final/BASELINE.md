# 独立终审基线 · 2026-10-18

本次从作者完整工作区实测，不沿用旧报告的 PASS。

- 作者分支 `master`，HEAD `7a2c22f74c46d74f07af8bd1a45893ec15daa49b`。审计前 `git status --short` 空；无 stash、无额外 worktree。
- 远端 `origin/main` 经 `git fetch origin main` 确认为 `a6e5d5947ce2d06c6c2ab83e1cfd515c95191959`。`git merge-base HEAD origin/main` 无共同祖先；禁止向公开 main 推送作者历史。
- `gh api user --jq .login`：`seiya058904`。公开仓库报告体积 37,253 KiB；既有 Verify / Pages 在上述公开 SHA 成功，属于旧版本证据。
- 原典 `宋世江湖.md`：579,299 bytes，SHA-256 `2e2b665657543e81c6b06c121307c9f13685d2c535f762a5b921949aaa8af393`；Python `splitlines()` 与换行计数均 35,314。项目外只读副本已复制并验哈希。全文禁止公开。
- Node v24.15.0 / npm 11.12.1 / Python 3.12.10 / Git 2.54.0 / gh 2.95.0 / Pillow 12.2.0 / Chrome 155.0.8059.40。
- 工作区文件逻辑字节（不含 `.git`）：1,942,475,638；`.git`：1,146,900,830；合计 **3,089,376,468 bytes**。6,660 文件，4,382 追踪对象。测量发生在移动旧 dist 和生成新测试日志之前，逐文件见 [SIZE_INVENTORY_BEFORE.csv](SIZE_INVENTORY_BEFORE.csv)。压缩数据大小与逻辑大小相同；文件系统分配簇口径另复核，不将前者冒称实际 allocation。
- `npm run build`：exit 0；`npm test`：**297 passed / 0 failed**，exit 0；`node --experimental-strip-types --test tests/*-draft.test.ts`：**80 passed / 0 failed**，exit 0。原始日志位于同目录 `baseline-*.log`。构建前原 dist 已移入项目外保留，生成后追踪源码无差异。
- 本轮生产资源与离线归属审计输出见 `baseline-production.json`、`baseline-offline-resources.json`，只证明资源登记，不等同浏览器离线可用。
- 真实 Chrome 打开线上首页和六旗舰入口均 HTTP 200、无 pageerror，见 [baseline-live.json](baseline-live.json)。**线上首页仍为《潮生有约》，并非本地 V7 作品库**；《死人争榜》线上仍显示“制作中”。这是版本未同步的确认缺陷，不能引用作者本地 17/17 当线上验收。
- Browser plugin 不在本次技能列表；依照 frontend-testing-debugging 使用仓库现有 Playwright。全量最终 E2E、渲染质量、22 组原典回源、一手源码逐行审计均待本轮执行。
- 代码图 generation `2026-10-16T08:11:06Z`，抽查核心文件 coverage unavailable / metadata_changed，V7 library 等不在旧图；图只用于定位，所有结论须回读当前源码。

保护边界：不改原典、不改 `story/archive/**`、不改 `docs/archives/**` 来源字节、不改冻结预期哈希。候选素材与历史截图先保留。发布必须基于当前公开 main 作普通增量提交；历史重写与强推未获授权。

Gate A：完成环境、分支、保密边界、原典、体积、构建/单测/编辑和线上入口基线。后续结果统一写本目录，不覆盖历史审计结论。
