# 江湖 · Jianghu

> 《宋世江湖》世界中的武侠互动视觉小说 —— 一部主篇、九部核心纪事、两部中篇与五组支线触点，跑在自研的 Ink 驱动网页阅读器上。

[![Deploy site](https://github.com/seiya058904/jianghu/actions/workflows/deploy-pages.yml/badge.svg)](https://github.com/seiya058904/jianghu/actions/workflows/deploy-pages.yml)
[![Verify](https://github.com/seiya058904/jianghu/actions/workflows/verify.yml/badge.svg)](https://github.com/seiya058904/jianghu/actions/workflows/verify.yml)

**在线试玩 · <https://seiya058904.github.io/jianghu/>**

---

## 目录

- [这是什么](#这是什么)
- [当前状态](#当前状态)
- [在线试玩](#在线试玩)
- [本机运行](#本机运行)
- [操作方式](#操作方式)
- [仓库结构](#仓库结构)
- [作品清单](#作品清单)
- [原典与改编边界](#原典与改编边界)
- [证据与可复现性](#证据与可复现性)
- [公开快照说明](#公开快照说明)
- [已知缺口](#已知缺口)
- [文档索引](#文档索引)

---

## 这是什么

一个可直接在浏览器里玩的武侠互动小说。玩家是石梁馆学徒，陪同伴去青蒲水陆小会，想赢一次真胜，也想兑现一起回来的约。木剑会输，药要送到，船上的人要回岸；所学、伤势与说过的话会留下后果。

技术上是三层叠在一起：

| 层 | 内容 |
|---|---|
| **叙事源** | `story/` 下的 Ink 剧本。作者源是 `story/campaign/author.mjs`、`interludes.mjs`；分章 `.ink` 是可审阅的生成产物，`src/generated/*.json` 是编译后的运行时数据 |
| **运行时** | `src/` 下的 TypeScript 阅读器（`player.ts`、`vn-runtime.ts`、`vn-ui.ts`）：舞台/对白/回复分离、逐字打字、存读档、见闻与回响、离线 Service Worker |
| **外壳** | Vite 8（rolldown）+ inkjs 2.4.0。47 个静态入口共用一套引擎；vite `base` 是相对路径 `'./'`，因此可部署在任何子路径下 |

## 当前状态

**未完成（INCOMPLETE）。** 这是本仓库最重要的一句话，请不要把它读成已完成的项目。

数量型门槛基本达标（28 张独立专属立绘、19 位可见三状态人物、12 组通用原型、30 张正式背景、19 张关键 CG、原典 22 组素材群 A 级 16 组、九部核心纪事 + 两部中篇全部有独立可玩入口），但仍有实质缺口 —— 详见[需求完成度审计](docs/v6/V6_REQUIREMENTS_AUDIT_20261016.md)与[内容与体验审计](docs/v6/CONTENT_AND_UX_AUDIT_20261016.md)。

同时提醒：`docs/v6/ACCEPTANCE_MATRIX.md` 的**主表仍停在 2026-10-15**，其中 25 项写着 `NOT VERIFIED`，与文件后半部分 2026-10-16 的通过记录不一致。**照主表读会得出错误结论**；矩阵末尾已有过期提示节，但主表尚未逐项收敛。

## 在线试玩

| 内容 | 链接 |
|---|---|
| 首页（选一段江湖） | <https://seiya058904.github.io/jianghu/> |
| 主篇《潮生有约》 | `…/jianghu/tide-v6.html` |
| 乾坤 V3 | `…/jianghu/qian-kun.html` |
| 北枪 V3 | `…/jianghu/north.html` |
| 师门夜话（配对流程） | `…/jianghu/north-notes.html` |
| 作者素材检视页 | `…/jianghu/gallery.html` |

站点由 GitHub Actions 从 `main` 分支构建并发布（[deploy-pages.yml](.github/workflows/deploy-pages.yml)），无需手工上传产物。

## 本机运行

需要 Node.js 24（本仓库在 v24.15.0 上验证）。

```bash
npm ci                 # 依赖锁定在 package-lock.json
npm run build          # story:build -> tsc --noEmit -> vite build -> offline-manifest
npm start              # 本机服务 http://127.0.0.1:4173/
```

其他命令：

```bash
npm run dev            # Vite 开发服务 http://127.0.0.1:5173/
npm test               # 全量单元与叙事契约测试
npm run test:e2e       # Playwright 浏览器验收（需要 4173 / 4175 两个服务器）
npm run story:build    # 只从作者源重新生成 ink 与 JSON
```

审计用脚本（都输出 JSON，可复现）：

```bash
node --experimental-strip-types scripts/audit-production-v6.mjs   # 全项目内容台账
node --experimental-strip-types scripts/audit-v6.mjs              # 主篇路线统计
node --experimental-strip-types scripts/audit-named-characters-v6.mjs
node --experimental-strip-types scripts/audit-offline-bundles-v6.mjs
python scripts/build-art-manifest-v6.py                           # 素材清单（需要 Pillow）
```

> 本机若开了 HTTP 代理，Playwright 的就绪探测会走代理并必然 60 秒超时退出。跑 E2E 前清空 `http_proxy` / `https_proxy`。

## 操作方式

- 点击舞台/对白，或按 Enter、空格推进；打字时首次点击补全文。
- 回复必须自己选；**自动与已读快进不会替你作答**。
- 见闻只收相遇人物与已知事实；章节回顾只读，不撤回选择、不泄露另一条路。
- 设置支持 18/20/22/24 字号、纸本/夜读、文字速度与减弱动态。没有 BGM 或配音，无声音也能通关。
- Tab 切换按钮，Esc 关面板。极矮横屏允许回复/对白区域内部滚动。

存档：每句后自动保存，另有 3 个手动槽、上一程备份与 JSON 导出/导入。各作品使用独立存档前缀，版本之间不互迁剧情节点。

## 仓库结构

```
├─ index.html, *.html          # 49 个静态入口（其中 47 个在 vite 构建输入里）
├─ src/
│  ├─ player.ts, vn-runtime.ts, vn-ui.ts   # 阅读器与界面
│  ├─ *-catalog.ts             # 各作品的场景/人物/选项登记（改这里，不要改 UI）
│  ├─ edition.ts, chronicle-catalog.ts     # 版本与入口登记
│  └─ generated/*.json         # 58 份编译后的运行时剧情数据（由 story:build 生成）
├─ story/
│  ├─ campaign/author.mjs, interludes.mjs  # 主篇作者源（唯一应手写的地方）
│  ├─ *.ink                    # 编译产物：可审阅的分章/合并 Ink
│  └─ archive/                 # 冻结的旧版原始字节（north-v2, qian-kun-v2）
├─ public/
│  ├─ art/v5, art/v6           # 155 张 webp 运行时美术（共 27 MB）
│  └─ sw.js                    # 离线 Service Worker（全部相对路径）
├─ tests/                      # 145 个测试文件：单元、叙事契约、Playwright 验收
├─ scripts/                    # 编译、离线清单、审计与统计
├─ docs/                       # 全部文档与证据，入口见 docs/README.md
└─ .github/workflows/          # Pages 部署与 Verify 门禁
```

## 作品清单

主篇《潮生有约》（`tide-v6` / `tide-promise-2.0.0`）：**1325 拍 / 182 选项 / 8 类结局**，序 + 第一至第九章 + 终章；中段分陆路（枫岭）、水路（白苇）、留守三线。

| 作品 | 入口 | 版本 | 拍 / 选项 / 结局 / CG |
|---|---|---|---|
| 枯河谷·门后有人 | `kuhe.html` | 3.0.0 | 326 / 40 / 2 / 1 |
| 龙门问刀 | `longmen.html` | 3.0.0 | 356 / 50 / 2 / 2 |
| 太华试序·三年之约 | `taihua.html` | 3.0.0 | 465 / 63 / 3 / 2 |
| 青石五友·守一天 | `qingshi.html` | 3.0.0 | 447 / 60 / 2 / 1 |
| 第十二席 | `twelfth-life.html` | 3.0.0 | 393 / 68 / 2 / 1 |
| 一剑两脉（+ 门外七问） | `two-swords.html` + `seven-questions.html` | 2.0.0 | 334/50/2/1 + 382/62/2/1 |
| 山河璧·真假人间（双卷） | `jade-thieves.html` + `jade.html` | 2.0.0 | 320/45/2/1 + 322/68/2/1 |
| 海路两世·天外遗脉（双册） | `sea.html` + `sea-tide.html` | 2.0.0 | 257/46/2/1 + 239/42/2/1 |
| 北枪与乾坤（双卷） | `north.html` + `qian-kun.html` | 3.0.0 | 342/62/2/1 + 318/50/2/1 |
| 中篇 · 死人争榜 | `dead-ranking.html` | 1.0.0 | 325 / 66 / 2 / **0** |
| 中篇 · 照水刀·芦花渡 | `luhua.html` | 1.0.0 | 256 / 50 / 2 / **0** |

五组 B 触点：`luoyang.html`（76/18/2）、`bamboo.html`（86/14/2）、`xuanmen.html`（114/22/2）、`white-stone.html`（132/26/2）、`beyond-ranking.html`（98/18/2）。

每部作品都有独立的版本号与存档前缀；旧版（`-v1` / `-v2` 入口）以冻结原字节保留，**目的是让旧存档仍能打开**。它们与当前版并排在「选一段江湖」面板里、没有分组 —— 这个体验问题已记录在[内容与体验审计](docs/v6/CONTENT_AND_UX_AUDIT_20261016.md)第 1 节，尚未修复。

## 原典与改编边界

本项目是 `宋世江湖.md`（579,299 字节 / 35,315 行，SHA-256 `2e2b665657543e81c6b06c121307c9f13685d2c535f762a5b921949aaa8af393`）的同人改编。原典全文**不随本公开快照发布**（见下节），但其逐段审读台账、改编对照与哈希校验都在仓库里：

- [docs/lore/CANON_MASTER_INDEX.md](docs/lore/CANON_MASTER_INDEX.md) —— 29 个二级单元逐段索引与行号范围
- [docs/lore/V6_READING_NOTES.md](docs/lore/V6_READING_NOTES.md) —— 全文阅读笔记
- [docs/lore/CANON_RULES.md](docs/lore/CANON_RULES.md) —— 16 条编剧硬约束（榜谱层级、境界不外显、死亡不可无标识救活、武不玄幻等）
- [docs/lore/ADAPTATION_COVERAGE_MATRIX.md](docs/lore/ADAPTATION_COVERAGE_MATRIX.md) —— 22 组素材群覆盖（A 16 / B 6 / C 0 / D 0）
- [docs/lore/CANON_CONFLICT_AUDIT.md](docs/lore/CANON_CONFLICT_AUDIT.md) —— 与原典的冲突排查

改编原则：玩家改变现场态度、准备、同伴与小人物命运和未锁定旁支；**历史胜负与创派结果锁定**。默认忠实改编或正典补白，另史若制作须单独显式标注，不混正式正史。

值得注意的是：默认首页主篇《潮生有约》是**原创地方篇**（`story/campaign/author.mjs` 首行自注"不改写原作名家历史"），其人物与地名在原典中出现 0 次。这一点已在内容审计中量化记录。

## 证据与可复现性

仓库里被追踪的文本证据全部可复现：

| 证据 | 位置 |
|---|---|
| 需求完成度审计 | `docs/v6/V6_REQUIREMENTS_AUDIT_20261016.md` |
| 内容与体验审计 | `docs/v6/CONTENT_AND_UX_AUDIT_20261016.md` |
| 验收矩阵（含过期提示） | `docs/v6/ACCEPTANCE_MATRIX.md` |
| 各篇三轮编辑记录 | `docs/v6/<WORK>_V3_EDITORIAL.md` 等 |
| 冻结字节校验清单 | `docs/evidence/v6/qian-kun-editorial-integration-preservation.json` |
| 素材清单与来源 | `docs/art/ASSET_MANIFEST_V6.json/.md`、`docs/art/*-provenance.json` |
| 测试与构建日志 | `docs/evidence/v6/*.log` |
| 内容台账 JSON | `docs/evidence/v6/*summary*.json` |

`Verify` 工作流在每次推送时重跑 `npm run build` + `npm test`，并输出全项目内容台账，可用来独立复核上面的数字。**CI 变绿只说明仓库内部自洽，不等于验收矩阵通过。**

## 公开快照说明

这是作者本机 Git 仓库的**公开镜像**，不是逐字节副本。为了让仓库落在 GitHub 的合理体积内、并避免公开发布原典全文，以下内容**不在公开快照中**：

下表口径为 `master` 的**追踪对象**（也就是快照里实际被排除的东西），可用 [docs/PUBLISHING.md](docs/PUBLISHING.md) §3 的命令逐条复现：

| 排除项 | 体积 / 数量 | 原因 |
|---|---|---|
| `docs/evidence/**/*.png` | 约 1.4 GiB / 1930 张 1920×1080 浏览器截图 | 超出 GitHub 仓库建议上限；文本证据（1062 份日志 / JSON / TXT / MD）已完整保留 |
| `docs/archives/**` | 约 3.4 MiB / 114 文件 | 冻结的旧版原始源码与基线副本，本地保留备查 |
| `宋世江湖.md` | 579,299 B | 原典全文，不公开发布；公开仓库保留哈希与审读台账 |

> 工作区另有未入库的同名素材（`docs/evidence` 下 12 张截图、`docs/archives` 下 227 个归档文件，后者含 3 个 zip 共约 10 MB），它们从来不在 `master` 里，因此不属于「被排除」。

因此：

- 文档里指向 `docs/evidence/**.png` 的截图链接在公开仓库中**无法打开**；文字结论与 JSON 证据不受影响。
- 文档里引用的裸提交 SHA（如 `79aa3c0`、`c7b21cd`）属于作者本机提交谱系，公开快照为单次导入提交，**这些 SHA 在此不可解析**。
- `docs/archives/` 的路径在公开仓库中不存在，相关说明段落属于历史记录。
- **16 处"字节冻结"断言在此只做部分验证。** 它们必须读到原典与 `docs/archives/` 才能比对哈希；这些基线缺席时，`tests/frozen-baselines.ts` 会跳过对应条目并写出 `docs/evidence/v6/frozen-baselines-missing.json`（实测汇总 34 条），而不是报假失败。作者本机携带全部基线，因此本机是逐条全验证。

除此之外，源码、剧本、测试、脚本、运行时美术与全部文档均与作者本机一致。

## 已知缺口

按优先级（完整清单见两份审计文档）：

1. **验收矩阵未收敛** —— 主表 25 项 `NOT VERIFIED` 停留在 10-15，与 10-16 的通过证据矛盾。
2. **四份指定交付文档不存在** —— `V6_DELIVERY.md`、`V6_QA.md`、`DIRECTION_BEATS.md`、`AUTHORING_WORKFLOW.md`。
3. **两部中篇与全部 B 触点 CG 为 0** —— `dead-ranking`、`luhua` 与五个 B 触点均无剧情 CG；现有 19 张 CG 中多张是无人物道具图。
4. **美术定性项未完成** —— 跨年龄区分（20 岁 vs 90 岁）、真实枪棍刀剑动作、火态 / 伤态、雨夜素材、碎玉物理状态。
5. **逐篇三轮文学未覆盖全部作品** —— `dead-ranking`、`luhua`、`dongting`、`luoyang`、`bamboo` 缺三轮汇总。
6. **入口与体验问题** —— 38 条入口平铺、其中 18 条标着"旧稿"；主篇结局段连续 74–133 拍无选择且首次游玩不能快进；多数作品对白占比仅 32%–50%。
7. **外部验证全部 NOT VERIFIED** —— 真人试读、真人阅读耗时、Android 真机、Safari / Firefox 均未做。

## 文档索引

完整导航见 **[docs/README.md](docs/README.md)**。几条常用入口：

- 交接与进度：`docs/v6/WORK_PROGRESS.md`、`docs/v6/SUPPLEMENT_EXECUTION.md`、`docs/v6/HANDOFF_2026-10-16_QIAN_KUN_V3.md`
- 架构与设计：`ARCHITECTURE_REVIEW.md`、`DESIGN.md`、`NARRATIVE_DESIGN.md`、`DIALOGUE_AUTHORING_GUIDE.md`
- 人物与分支：`CHARACTER_ROSTER.md`、`BRANCH_MATRIX.md`、`CONSEQUENCE_LEDGER.md`、`docs/v6/CAUSAL_LEDGER.md`
- 素材与美术：`ART_ASSET_MANIFEST.md`、`ART_DIRECTION.md`、`docs/v6/ART_PROVENANCE.md`
- 供 AI 审阅的入口说明：**[AGENTS.md](AGENTS.md)**
