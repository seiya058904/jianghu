# Jianghu（宋世江湖）Agent Guide

先核当前代码与验收事实，不沿用历史 PASS。

## 定位与核心入口
- `/`（`index.html`）为原典互动武侠纪事集作品库（16 作品、23 现行版本、20 纪事归档）；原创《潮生有约》仅在 `tide-v6.html`（V5/半步/渡口及各篇 V1/V2 为历史入口，勿混入推荐门面）。
- 当前独立审计：`docs/audits/independent-final/`（`BASELINE` / `ISSUE_LEDGER` / `FINAL_QA` / `FINAL_ACCEPTANCE` / `RELEASE_VALIDATION`），缺席或未执行不得判 PASS；`docs/v7`、`docs/v6` 旧数据须注明代际与版本。
- 本机受保护原典材料 `宋世江湖.md`（579,299 bytes，SHA256 `2e2b665657543e81c6b06c121307c9f13685d2c535f762a5b921949aaa8af393`，35,314 行）：不得改写，未经授权不得公开全文；私档通过 `.gitignore` / `.git/info/exclude` 隔离，禁止进入公开索引。

| 责任 | 入口 |
| --- | --- |
| 一手作者源 / 流水线 | `story/*-author.mjs`（历史 `story/main.ink`, `duel.ink`）→ `scripts/compile-story.mjs` → `story/*.ink` → `src/generated/*.json` |
| 阅读、存档与作品库 | `src/player.ts`, `vn-runtime.ts`, `vn-ui.ts`, `storage.ts`, `library.ts`, `works-registry.ts`, `work-index.ts`, `edition.ts` |
| 人物/CG 与演出锚点 | `src/*-catalog.ts`, `presentation.ts`, `public/art/`; `story/production-direction-v6.mjs`（冻结不追加）, `production-direction-v7.mjs` |
| 离线、正典、冻结与发布 | `public/sw.js`, `scripts/offline-manifest.mjs`, `docs/lore/CANON_RULES.md`, `tests/frozen-baselines.ts`, `docs/PUBLISHING.md` |

## 正典、冻结与运行时硬红线
- 绝不手改生成 Ink/JSON 冒充作者源修复；插句会改变动态 beat 编号，须复核 CID/VAR、look/camera/action 与存档恢复。
- 严守 `docs/lore/CANON_RULES.md` 16 条红线：固定历史生死/重残/胜负/年龄/门派/榜次不随意改；入化/返真不作公开等级或自报层数；山河璧无增功/疗伤/延寿/武学。
- 不改 `story/archive`、`story/drafts`、`docs/archives` 既有字节；不篡改冻结哈希以过测（旧伴篇快照见 `preservation-map.json`）；不混用作品/版本命名空间；拒绝损坏/跨版存档并保留原字节，替换前备份失败必须阻止替换。
- 共享作者源、生成物、证据、SW 禁止多代理并发修改。

## 构建、测试与按需 Skills
- Node 24（锁死 `package.json`）；Playwright 固定 `1.64.1`（Chromium build `1248`，`%LOCALAPPDATA%\ms-playwright`），未经依赖授权严禁升降级或另装。
- 命令：`npm ci` / `npm run build` / `npm test` / `npm run test:editorial` / `npm run test:e2e` / `npm run audit:independent`（需 Python/Pillow）。
- 不得删除失败测试、降低断言或用旧日志冒充新通过；不得拼接不同构建的定向通过结果冒称最终全量通过。
- Playwright 端口根 `4173`、子路径 `4175`；运行前清 `HTTP/HTTPS/ALL` 代理并确认服务读取当前 `dist`。完整 E2E 期间不得改 `story`/`generated`/`runtime`/`assets`/`dist`，否则本轮作废。按真实分支路径测被动段，不线性串互斥分支。
- **独立审计、美术/Alpha、外置证据与诚实边界**：加载 `.agents/skills/jianghu-audit-evidence/SKILL.md`。
- **1GiB 体积控制、安全删 `dist` 与 Pages 发布核验**：加载 `.agents/skills/jianghu-release/SKILL.md`。
