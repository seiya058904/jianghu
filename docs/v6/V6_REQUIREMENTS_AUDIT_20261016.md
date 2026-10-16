# V6 需求完成度审计（对照两份源需求文件）

2026-10-16。审计人：本轮接手者。目的：回答"两份源需求文件的 P0 是否已经完成"。

- 源需求一 `Jianghu-Codex-v6-...ADBBE690A4E88D.md`（主 v6 委托，1411 行，第 15 节 34 项验收矩阵 L01–R02）。
- 源需求二 `Jianghu-Codex-v6-...E796BFE8BEB8E595.md`（剧情专项追加，672 行，第 20 节 13 项验收矩阵 N01–N13）。

## 0. 结论

**未完成（INCOMPLETE — FAILURES REMAIN）。**

数量型 P0 门槛基本已经达到（见 §1），缺口集中在**最终交付物、验收矩阵收敛、两中篇与 B 触点美术、逐篇三轮文学、以及全部外部验证**（见 §2）。按源需求一 §15 与 §18 的口径，本地可控 P0 项尚未全部 `PASS`，不能宣布 v6 完工。

本审计的全部数字来自本轮实际运行 `scripts/audit-production-v6.mjs` 与 `scripts/audit-v6.mjs`，不是抄录历史报告。

## 1. 已达成（有当前运行证据）

### 1.1 全项目内容台账（audit-production-v6.mjs 实际输出）

| 项 | 门槛 | 当前实测 | 判定 |
|---|---|---|---|
| 登记作品数 | — | 44（含各版归档） | — |
| 发言 NPC | ≥60 实际出场 | 308 个发言 ID；`NAMED_CHARACTER_CENSUS_V6.md` 给出 60 位具名正向下限 | **达标**（下界口径，非全量去重） |
| 独立专属立绘 | ≥20 | 28 | **达标** |
| 可见三状态人物 | ≥16 | 19（同一外观下三张不同图） | **达标** |
| 通用 NPC 原型 | ≥12 | 12（8 复用 + 4 新增），全部实际使用 | **达标** |
| 正式环境/背景 | ≥24 | 30 个不同文件 | **达标** |
| 关键 CG | ≥10 | 19 个登记并触发 | **达标**（但见 §2.4 质量口径） |
| 素材归属冲突 / 同屏撞脸 | 0 | 0 / 0 | **达标** |
| 引用素材体积 | — | 23,816,294 字节 | — |

### 1.2 主篇《潮生有约》

- `tide-v6` / `tide-promise-2.0.0`：**1325 拍 / 182 选项 / 8 类结局**，九条完整实际浏览器路线覆盖全部八类结局（`main-current-20261016-summary.json`）。
- 章节：序 + 第一至第九章 + 终章，满足 S01 的"≥10 正式章节"。
- 中段三线：陆路（枫岭）、水路（白苇）、留守线，满足 S02 的"≥3 条明显不同中段线"。
- 八结局可达，满足 S03。

### 1.3 九部核心纪事 + 两部中篇（源需求二 §02/§12 指定）

九部**全部存在独立可玩入口、独立版本号、独立存档前缀、≥2 个个人结局**：

| 指定篇 | 现行入口 | 拍/选项/结局/CG | 最长被动 |
|---|---|---|---|
| 枯河谷·门后有人 | `kuhe.html`（kuhe-3.0.0） | 326 / 40 / 2 / 1 | 15 |
| 龙门问刀 | `longmen.html`（longmen-3.0.0） | 356 / 50 / 2 / 2 | 20 |
| 太华试序·三年之约 | `taihua.html`（taihua-3.0.0） | 465 / 63 / **3** / 2 | 16 |
| 青石五友·守一天 | `qingshi.html`（qingshi-3.0.0） | 447 / 60 / 2 / 1 | 16 |
| 第十二席 | `twelfth-life.html`（3.0.0） | 393 / 68 / 2 / 1 | 18 |
| 一剑两脉（含第二册门外七问） | `two-swords.html`(2.0.0) + `seven-questions.html`(2.0.0) | 334/50/2/1 + 382/62/2/1 | 15 / 13 |
| 山河璧·真假人间（双卷） | `jade-thieves.html`(2.0.0) + `jade.html`(2.0.0) | 320/45/2/1 + 322/68/2/1 | 16 / 9 |
| 海路两世·天外遗脉（双册） | `sea.html`(2.0.0) + `sea-tide.html`(2.0.0) | 257/46/2/1 + 239/42/2/1 | 14 / 15 |
| 北枪与乾坤（双卷） | `north.html`(3.0.0) + `qian-kun.html`(3.0.0) | 342/62/2/1 + 318/50/2/1 | 13 / 18 |
| **中篇 死人争榜** | `dead-ranking.html`(1.0.0) | 325 / 66 / 2 / **0** | 16 |
| **中篇 照水刀·芦花渡** | `luhua.html`(1.0.0)（另有 `dongting.html` 155/22/2/1） | 256 / 50 / 2 / **0** | 15 |

五组 B 触点也已落地为可玩入口：`luoyang.html`(76/18/2)、`bamboo.html`(86/14/2)、`xuanmen.html`(114/22/2)、`white-stone.html`(132/26/2)、`beyond-ranking.html`(98/18/2)。

### 1.4 原典覆盖

`docs/lore/ADAPTATION_COVERAGE_MATRIX.md`：22 组素材群 **A=16 / B=6 / C=0 / D=0**，A 级 16/22 超过源需求二 §13.1 的"≥15 组 A"门槛。29 个二级单元的全文审读在 `CANON_MASTER_INDEX.md` / `V6_READING_NOTES.md`，原典 SHA-256 保持 `2e2b6656…8af393` 未变（L01、R01 PASS）。

## 2. 未达成（缺口清单）

### 2.1 交付文档缺失（硬缺口）

以下四份源需求点名的文件在**整个仓库中不存在**（已用 `find` 全库搜索确认）：

- `docs/v6/V6_DELIVERY.md` — 源需求一 §17.2/§17.3 的最终交接说明，是"是否宣布完成"的载体。
- `docs/v6/V6_QA.md` — 可复现 QA 命令清单。
- `docs/v6/DIRECTION_BEATS.md` — 源需求一 §11.2 要求 ≥12 处正式场景的分镜/演出设计（U03）。
- `docs/v6/AUTHORING_WORKFLOW.md` — 源需求一 §12.3 要求，并由 T05 要求"实际照此新增一篇"验证。

→ 直接导致 **T05、U03、R02、N13 无法判 PASS**。

### 2.2 验收矩阵未收敛（文档与事实矛盾）

`docs/v6/ACCEPTANCE_MATRIX.md` 的**主表仍停在 2026-10-15**：L02–R02 共 **25 项**写着 `NOT VERIFIED`，而其后 30 余条 10-16 追加段已提供大量通过证据（各篇版本号、单测数、浏览器用例数、离线与尺寸证据）。主表与实际状态不一致，任何人照主表读会得到"几乎没做"的错误结论。同样问题见 `MAIN_EXPANSION_PROGRESS.md`（仍写"默认 index.html 仍为旧主篇"，而 `DEFAULT_ENTRY_V6.md` 记录根/index 已切换真实 V6）。

→ L02、L03、S05、C03、G01–G04、U01、U02、T01–T04、R02 目前**既未 PASS 也未被真正复核**，属于"证据散落、矩阵未收敛"，不能算通过。

### 2.3 两中篇与全部 B 触点无 CG

`dead-ranking`、`luhua` 的 `storyCGs` 为 **0**；`luoyang`、`bamboo`、`xuanmen`、`white-stone`、`beyond-ranking`、`north-notes` 也为 0。源需求二 §02 要求每部"至少一处真正剧情 CG"，§12 明确两部中篇"不能简化成一页资料或 5 分钟试玩"。现有 19 张 CG 中多张是**无人物可复用道具图**（茶具、空匣、粮斗、绳帆、书卷、来信、木料），项目自己的追加段也承认"九核心都有至少 1 实际 CG 不等于 N10 完成"。

→ N10 未过。

### 2.4 美术的定性部分未完成

项目追加段反复自陈：主角与重要人物的**跨年龄区分**（20 岁 vs 90 岁）、**真实枪棍刀剑动作**、旧观修椅与三物状态、火态/伤态、雨夜素材、碎玉物理状态、拍卖/破庙/守粮等场面仍未完成。数值门槛虽已达标，但"20/30/19"这些计数不能替代这些定性项。

### 2.5 逐篇三轮文学未覆盖全部作品

`docs/evidence/v6/` 下有 28 份 summary JSON，但 `dead-ranking`、`luhua`、`dongting`、`luoyang`、`bamboo` **没有对应的三轮编辑汇总**。矩阵多次自陈"所有三轮文学……未完成""完整三轮文学与整体艺术终验未过"。

→ S05、N12 未过。

### 2.6 外部验证全部 NOT VERIFIED（按规范不得报 PASS）

真人试读、真人阅读耗时（主篇 90–150 分钟、纪事 35–70 分钟）、Android 真机、Safari/Firefox —— 源需求一 §13.7/§16.2 与源需求二 §19.3 均要求如实标注，不得以自动化结果代替。

### 2.7 被动段长度需人工复审

实测最长连续无选择：主篇 28 拍、龙门 20 拍、青森/北枪/乾坤 18 拍。源需求一 §5.2 的经验目标是 4–9 拍一次参与机会，长段允许但"需事件推进与人工复审"。目前只有自动统计，没有逐段人工结论。

## 3. 本轮（2026-10-16 接手）实际推进的部分

- 修好了浏览器测试基础设施：沙箱代理导致 Playwright `webServer` 必然 60 秒超时退出（表现为"跑一小时无输出"），清空 `http_proxy`/`https_proxy` 后恢复正常。
- `npm run build` 对齐最终源码；核验 `qk_gate.time`「九日之后」→「门前等候」确实进入产物。
- 补齐两个从未执行的 spec：冷离线 + 离线包 **56 passed / 0 failed（38.4 秒）**。
- 重跑主浏览器批次 **24 passed / 0 failed（11.2 分钟）**，覆盖乾坤 V3 双完整路线与 Notes 配对流程。
- 重生成 `ASSET_MANIFEST_V6.json/.md`（156 栅格 / 155 运行时引用 / 0 字节差异）。
- 新增 `QIAN_KUN_V3_EDITORIAL.md`、`qian-kun-editorial-summary.json`，并更新三份进度文档。
- 提交 `79aa3c0`，工作区干净；`.workbuddy/` 已加入 `.gitignore`。

## 4. 建议的下一步（按依赖顺序）

1. **收敛验收矩阵**：把 ACCEPTANCE_MATRIX 主表逐项改写为当前状态，每项附文件/日志/截图证据路径；把散落在追加段的事实提上来。
2. **补四份缺失文档**：V6_DELIVERY.md、V6_QA.md、DIRECTION_BEATS.md、AUTHORING_WORKFLOW.md（后者须以一次真实新增角色/场景验证）。
3. **补两中篇与 B 触点美术**：至少各一处真剧情 CG + 核心人物专属身份/年龄图。
4. **补齐 dead-ranking / luhua / dongting / luoyang / bamboo 的三轮文学审读**，产出对应 summary。
5. **被动段人工复审**：对 28/20/18 拍的长段逐段给结论，该拆的拆。
6. 全部完成后才写 V6_DELIVERY.md 并声称达标；外部验证项继续如实标 NOT VERIFIED。

## 5. 证据索引

- 内容统计：`scripts/audit-production-v6.mjs`、`scripts/audit-v6.mjs`（本轮实跑）
- 矩阵与进度：`docs/v6/ACCEPTANCE_MATRIX.md`、`docs/v6/WORK_PROGRESS.md`、`docs/v6/SUPPLEMENT_EXECUTION.md`
- 原典台账：`docs/lore/ADAPTATION_COVERAGE_MATRIX.md`、`docs/lore/CANON_MASTER_INDEX.md`
- 人物：`docs/v6/NAMED_CHARACTER_CENSUS_V6.md`
- 素材：`docs/art/ASSET_MANIFEST_V6.json`、`docs/art/ASSET_MANIFEST_V6.md`
- 各篇证据：`docs/evidence/v6/*summary*.json`（28 份）、`docs/evidence/v6/*.log`
