# AGENTS.md

面向在本仓库上工作的 AI 代理（云端审计、代码修改、内容复核）。这是入口文件：**先读完这一份，再决定往哪里深入。**

仓库：<https://github.com/seiya058904/jianghu> · 在线站点：<https://seiya058904.github.io/jianghu/> · 人读说明见 [README.md](README.md) · 文档导航见 [docs/README.md](docs/README.md)。

---

## 1. 三十秒定位

《江湖·Jianghu》是一部武侠互动视觉小说的**完整源码仓库**：Ink 剧本 + TypeScript 网页阅读器 + Vite 打包 + Playwright 验收 + 大量审计文档与证据。

改编自原典 `宋世江湖.md`（579,299 字节 / 35,315 行），但**原典全文不在此公开仓库中**（见 §8）。

**当前验收结论：未完成（INCOMPLETE）。** 数量型门槛基本达标，实质缺口见 §5。任何"已完成"的表述都需要先复核 §5。

## 2. 硬事实（可直接引用，均有仓库内证据）

| 项 | 值 | 出处 |
|---|---|---|
| 原典 SHA-256 | `2e2b665657543e81c6b06c121307c9f13685d2c535f762a5b921949aaa8af393` | `docs/lore/CANON_MASTER_INDEX.md` |
| 原典规模 | 579,299 字节 / 35,315 行 / 29 个二级单元逐段审读 | 同上 |
| 主篇 | `tide-v6` / `tide-promise-2.0.0`，1325 拍 / 182 选项 / 8 类结局 | `scripts/audit-v6.mjs` |
| 作品登记 | 44 条（含各版归档），47 个静态入口 | `scripts/audit-production-v6.mjs` |
| 美术门槛 | 专属立绘 28 / 三状态人物 19 / 通用原型 12 / 背景 30 / CG 19 | 同上 |
| 原典覆盖 | 22 组素材群 A=16 / B=6 / C=0 / D=0 | `docs/lore/ADAPTATION_COVERAGE_MATRIX.md` |
| 单元测试 | 291 项（`npm test`） | 本仓库 CI（`.github/workflows/verify.yml`） |
| 素材归属冲突 / 同屏撞脸 | 0 / 0 | `scripts/audit-production-v6.mjs` |
| 技术栈 | Node 24 / Ink(inkjs) 2.4.0 / Vite 8.3.4 / TypeScript 7.0.2 / Playwright 1.64.1 | `package.json` |

## 3. 常用命令

```bash
npm ci                 # 依赖锁定（package-lock.json, lockfileVersion 3）
npm run build          # story:build -> tsc --noEmit -> vite build -> offline-manifest
npm test               # 291 项单元与叙事契约测试
npm run test:e2e       # Playwright 验收（需 4173 与 4175 两个服务）
npm start              # 本机静态服务 127.0.0.1:4173
```

可复现的内容统计（审计主要工具）：

```bash
node --experimental-strip-types scripts/audit-production-v6.mjs   # 全项目台账（主要依据）
node --experimental-strip-types scripts/audit-v6.mjs              # 主篇路线/拍数/结局
node --experimental-strip-types scripts/audit-named-characters-v6.mjs
node --experimental-strip-types scripts/audit-delayed-choices-v6.mjs
node --experimental-strip-types scripts/audit-offline-bundles-v6.mjs
python scripts/build-art-manifest-v6.py                           # 需 Pillow
```

**环境陷阱**：本机若设了 `http_proxy`/`https_proxy`，Playwright 的 webServer 就绪探测会走代理、必然 60 秒超时退出（表现为"跑了一小时没有任何输出"）。跑 E2E 前清空代理变量。

## 4. 文件地图：先看哪里

| 想了解 | 直接看 |
|---|---|
| 项目是什么、怎么跑 | [README.md](README.md) |
| 验收结论与缺口 | [docs/v6/V6_REQUIREMENTS_AUDIT_20261016.md](docs/v6/V6_REQUIREMENTS_AUDIT_20261016.md)（对照两份委托）、[docs/v6/CONTENT_AND_UX_AUDIT_20261016.md](docs/v6/CONTENT_AND_UX_AUDIT_20261016.md)（可玩性） |
| 逐项验收矩阵 | [docs/v6/ACCEPTANCE_MATRIX.md](docs/v6/ACCEPTANCE_MATRIX.md) —— **注意 §6 的过期说明** |
| 原典是什么、不能改什么 | [docs/lore/CANON_RULES.md](docs/lore/CANON_RULES.md)（16 条硬约束）、[CANON_MASTER_INDEX.md](docs/lore/CANON_MASTER_INDEX.md) |
| 改编了哪些原典段落 | [docs/lore/ADAPTATION_COVERAGE_MATRIX.md](docs/lore/ADAPTATION_COVERAGE_MATRIX.md)、[ADAPTATION_TRACEABILITY.md](docs/lore/ADAPTATION_TRACEABILITY.md) |
| 剧情文本在哪、怎么改 | `story/campaign/author.mjs`（主篇作者源）、`src/generated/*.json`（编译产物） |
| 人物/场景/选项登记在哪 | `src/<work>-catalog.ts`、`src/campaign-catalog.ts`、`src/chronicle-catalog.ts` |
| 分支与后果 | `BRANCH_MATRIX.md`、`CONSEQUENCE_LEDGER.md`、`docs/v6/CAUSAL_LEDGER.md` |
| 写作规范 | `DIALOGUE_AUTHORING_GUIDE.md`、`NARRATIVE_DESIGN.md` |
| 美术来源 | `ART_ASSET_MANIFEST.md`、`docs/v6/ART_PROVENANCE.md`、`docs/art/ASSET_MANIFEST_V6.md` |
| 进度与交接 | `docs/v6/WORK_PROGRESS.md`、`SUPPLEMENT_EXECUTION.md`、`HANDOFF_2026-10-16_QIAN_KUN_V3.md` |
| 版本迁移规则 | `CONTENT_MIGRATION.md` |

## 5. 验证状态：什么已证、什么未证

**这是审计最需要的东西。请不要把"有文档描述"当成"已通过"。**

### 5.1 已通过（有可复现证据）

- `npm run build` 退出 0；`npm test` **291 passed / 0 failed**（CI 每次推送重跑）。
- 主篇九条完整浏览器路线覆盖全部 8 类结局（`docs/evidence/v6/main-current-20261016-summary.json`）。
- 九部核心纪事 + 两部中篇各有独立入口、独立版本号、独立存档前缀、≥2 个结局。
- 乾坤 V3 双完整路线、师门夜话配对、旧存档导入、跨版本拒绝、多尺寸（360/800/1440/1920）滚动：浏览器批次 24 passed / 0 failed。
- 冷启动离线 + 离线包（27 目标 × 根路径/子路径）：56 passed / 0 failed。
- 28 个冻结保护路径的原始字节与校验清单一致（校验语义为 `pathMap[p] ?? p`，其中 8 条指向 `story/archive/` 下的归档副本）。**注意：公开镜像里 34 条归档基线断言被跳过（见 §8），此条在公开仓库中属部分验证。**
- 素材清单 156 个栅格文件、0 字节差异。
- 原典 SHA-256 未变（未被改写）。

### 5.2 未通过 / 未验证（不要报 PASS）

- **四份委托点名的交付文档不存在**：`V6_DELIVERY.md`、`V6_QA.md`、`DIRECTION_BEATS.md`、`AUTHORING_WORKFLOW.md`。
- **验收矩阵未收敛**：主表停在 2026-10-15，25 项 `NOT VERIFIED` 与后续通过证据矛盾。
- **CG 缺口**：`dead-ranking`、`luhua` 及五个 B 触点 `storyCGs` 为 0（N10 未过）。
- **美术定性项**：跨年龄区分、真实枪棍刀剑动作、火态/伤态、雨夜素材、碎玉物理状态未完成。
- **逐篇三轮文学**：`dead-ranking`、`luhua`、`dongting`、`luoyang`、`bamboo` 无三轮汇总（S05/N12 未过）。
- **外部验证全部 NOT VERIFIED**：真人试读、真人阅读耗时、Android 真机、Safari/Firefox。按项目规范不得以自动化结果代替。
- **长被动段**：主篇最长 28 拍连续无选择、龙门 20 拍；委托的经验目标是 4–9 拍一次参与机会，长段仅允许在有事件推进时存在，目前**没有逐段人工结论**。

## 6. 文档陷阱：读之前先知道

本仓库文档是**长时间迭代叠加**的，且明确保留历史表述。容易读错的地方：

1. **`docs/v6/ACCEPTANCE_MATRIX.md` 主表已过期。** 主表（L01–R02，25 项 `NOT VERIFIED`）停在 10-15，文件后半部分是 10-16 的追加通过记录，两者矛盾。矩阵末尾有"过期提示"节，但主表**尚未逐项收敛**。要判断某项真实状态，请以后半部分证据为准并回源复核。
2. **`docs/v6/MAIN_EXPANSION_PROGRESS.md` 已过期** —— 仍写"默认 index.html 是旧主篇"，而 `DEFAULT_ENTRY_V6.md` 记录根/`index.html` 已切到真实 V6。
3. **多份进度文档采用"保留历史段 + 追加新段"的写法。** 同一文件里"未接入"与"已接入"可能同时存在，后者才是当前状态。追加以 `WORK_PROGRESS.md`、`SUPPLEMENT_EXECUTION.md`、各篇 `<WORK>_V3_EDITORIAL.md` 为最新。
4. **`docs/v6/AUDIT_BASELINE.md` 自注"当前并非 v6 验收报告"**，是修改前基线，其中的 OPEN 项多数已被后续工作关闭。
5. **根目录 `README.md` 与 `docs/V5_DELIVERY.md` 描述的是 V5 世代**（7 章、12 立绘、4 CG），已被 V6 取代。

## 7. 红线：改这个仓库时不能做的事

1. **不要改冻结路径的预期哈希以让校验通过。** `docs/evidence/v6/qian-kun-editorial-integration-preservation.json` 是保护原字节的凭据；校验失败要查原因，不是改期望值。
2. **不要动 `story/archive/` 与 `docs/archives/` 的来源字节。** 那是旧存档兼容与恢复的唯一凭据。
3. **不要绕过原典硬约束。** `docs/lore/CANON_RULES.md` 的 16 条是编剧红线，例如：入化/返真不作玩家公开等级或 NPC 自报层数；死亡重残长期存在、不得无标识救活；山河璧无增功/疗伤/延寿/武学；武不玄幻（距离/落步/重心/呼吸/先后/退路/经验）；历史胜负与创派结果锁定，玩家只改变现场态度、准备、同伴命运与未锁定旁支。
4. **不要混用版本。** V6 不得复用 V5 的命令序列读取改写后的剧情；各作品版本与存档前缀互相隔离，见 `CONTENT_MIGRATION.md`。
5. **不要手改编译产物当作者源。** 正确路径是改 `story/campaign/author.mjs`，再 `npm run story:build` 重新生成 `.ink` 与 `src/generated/*.json`；`.ink` 是可审阅的生成产物，不是机械切句，它的字节受测试保护。
6. **不要声称 PASS 而没有证据。** 本项目的既有规范是：无文件/日志/截图路径支撑的通过结论不成立；外部验证统一标 `NOT VERIFIED`。
7. **不要把全部历史入口当成当前版本。** 带 `-v1`/`-v2` 的入口是冻结归档，保留原因是让旧存档仍能打开，不代表当前内容。

## 8. 公开快照说明（影响你看得到什么）

本仓库是作者本机 Git 的**公开镜像**，为控制体积与版权，以下内容**不在其中**：

下表口径为 `master` 的**追踪对象**（快照里实际被排除的东西），可用 `docs/PUBLISHING.md` §3 的命令复现：

| 排除项 | 体积 / 数量 | 影响 |
|---|---|---|
| `docs/evidence/**/*.png` | ≈1.4 GiB / 1930 张 | 全部浏览器截图缺失；**1062 份日志、JSON、TXT、MD 文本证据完整** |
| `docs/archives/**` | ≈3.4 MiB / 114 文件 | 冻结旧源与基线副本缺失，相关路径的说明段属历史记录；引用它们的冻结字节断言会跳过（见下） |
| `宋世江湖.md` | 579,299 B | 原典全文不公开；哈希与审读台账在 `docs/lore/` |

另外：文档中引用的裸提交 SHA（如 `79aa3c0`）属作者本机谱系，**在本仓库中不可解析**（公开快照为单次导入提交）。

**对测试的直接影响（重要）**：16 处"字节冻结"断言（`<WORK> *_EDITORIAL*` / `tests/*-editorial.test.ts` 的 `Object.entries(...frozen)` 循环，以及 `tests/sea-editorial.test.ts`、`tests/sea-tide-editorial.test.ts` 读取的基线台账）指向的正是被排除的 `宋世江湖.md` 与 `docs/archives/**`。这些基线缺席时，`tests/frozen-baselines.ts` 的 `frozenBytes()` / `frozenJson()` 会让该条目**跳过并在日志中告警**，而不是报一个作者也无法复现的假失败：

- 运行结束后会写出 `docs/evidence/v6/frozen-baselines-missing.json`，列出本 checkout 未携带的基线路径（`node --test` 为每个测试文件起独立子进程，写入以原子锁串行合并，不会互相覆盖）；
- 在 GitHub Actions 中同时以 `::warning::` 注解呈现，并汇总进 job summary；
- 在本仓库实测：`npm test` = **291 passed / 0 failed**，记录文件汇总 **34 条**缺席条目；
- 作者本机携带全部基线，因此**本机仍逐条断言全部路径**，且不产生记录文件（`npm test` = 291 passed / 0 failed）。

换言之：公开仓库里"归档完整性"这一项是**部分验证**，不是完全验证。审计时请把这一点计入结论，并对照 `docs/evidence/v6/frozen-baselines-missing.json` 列出被跳过的具体条目。详见 `docs/PUBLISHING.md` §6.1。

审计时请注意区分"证据缺失"与"证据不存在"：多数截图类证据在作者本机存在，只是未公开。

## 9. 建议的审计路径

1. `npm ci && npm run build && npm test` —— 确认仓库可复现（CI 已在跑同一套）。
2. 跑 `scripts/audit-production-v6.mjs` 与 `scripts/audit-v6.mjs`，把数字与 §2 表对照。
3. 用 `docs/lore/CANON_RULES.md` 抽查若干作品的剧情文本是否越界（重点：境界外显、无标识复活、历史胜负被改写）。
4. 复核 §5.1 的每条通过结论，确认证据路径真实存在且内容支持结论。
5. 逐项走 §5.2，确认缺口是否仍然存在。
6. 输出结论时，按以下粒度给状态：`PASS`（有路径级证据）/ `PARTIAL`（部分证据）/ `NOT VERIFIED`（无证据）/ `FAIL`（证据反向）。

## 10. 提交与产出规范

- 证据日志位于 `docs/evidence/`，按既有惯例**强制入库**（`.gitignore` 有 `*.log`，历史上用 `git add -f` 加入）。新增日志请沿用同一位置与命名模式（`<topic>-<stage>.log`）。
- 每篇作品的审计/编辑结论写成 `docs/v6/<WORK>_<STAGE>_EDITORIAL.md`，并在 `docs/evidence/v6/` 落一份对应 summary JSON。
- 进度写入 `docs/v6/WORK_PROGRESS.md` 与 `docs/v6/SUPPLEMENT_EXECUTION.md` 的**追加段**，不要改写历史段。
- 结论要能被独立复核：写清命令、日志路径、统计口径（例如"最大被动段"按 `->` 跳转是否算中断，两种口径差异很大）。
