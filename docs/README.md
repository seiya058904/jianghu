# 文档导航

**2026-10-18 当前入口：[独立终审基线](audits/independent-final/BASELINE.md) · [问题台账](audits/independent-final/ISSUE_LEDGER.md) · [最终QA](audits/independent-final/FINAL_QA.md) · [F01–F30验收](audits/independent-final/FINAL_ACCEPTANCE.md) · [发布验证](audits/independent-final/RELEASE_VALIDATION.md)。** 下方V7/V6为历史迭代材料，不将旧状态与数字当成本轮实测。

本目录是项目全部文档与证据的根。**第一次来请先读仓库根的 [README.md](../README.md) 与 [AGENTS.md](../AGENTS.md)**，本页只负责告诉你去哪找。

导航速查：**`v7/` 是当前世代**（原典纪事集）· `lore/` 讲原典与改编边界 · `v6/` 是上一世代工作文档（历史，口径不可与 V7 混用）· `art/` 是素材清单 · `evidence/` 是原始证据 · 本目录根 `docs/*.md` 是 V5 世代存档 · [PUBLISHING.md](PUBLISHING.md) 讲公开快照怎么生成。

---

## 一、先读这五份

| 文档 | 作用 |
|---|---|
| [../AGENTS.md](../AGENTS.md) | 面向 AI 代理的入口：当前定位、作者入口、正典与冻结保护、验证及发布约束 |
| [v7/V7_DELIVERY.md](v7/V7_DELIVERY.md) | **V7 交付总览**：改了什么、原创怎么归档、覆盖率分子分母、未达项、能否发布 |
| [v7/V7_ACCEPTANCE_MATRIX.md](v7/V7_ACCEPTANCE_MATRIX.md) | 历史17项P0与各轮追加证据；本轮以F01–F30为当前结论 |
| [v7/V7_QA.md](v7/V7_QA.md) | 构建、单测、E2E、离线与子路径、多视口、已知边界 |
| [lore/CANON_RULES.md](lore/CANON_RULES.md) | 编剧硬约束，改剧情前必读 |

## 二、当前世代交付（`v7/`，12 份）

委托点名的 12 份正式交付文件：

| 文档 | 内容 |
|---|---|
| [v7/BASELINE_AUDIT.md](v7/BASELINE_AUDIT.md) | 本机 HEAD/公开镜像、原典 SHA、现行作品清单、V6 六类缺口裁定、改动边界、基线测试 |
| [v7/CANON_WORKS_MATRIX.md](v7/CANON_WORKS_MATRIX.md) | 22 组原典逐组矩阵：原文段位、玩家视角、游戏入口、锁定事实、可选行动、改编缺口、完成状态 |
| [v7/ADAPTATION_TRACE_V7.md](v7/ADAPTATION_TRACE_V7.md) | 原典事件 ↔ beat/choice/后日 双向追溯；区分忠实改编与必要原创补白 |
| [v7/WORKS_AND_VERSIONS.md](v7/WORKS_AND_VERSIONS.md) | 16 作品 / 23 现行版本 / 20 归档；存档前缀、静态深链、展示与隐藏规则、兼容性 |
| [v7/CHARACTER_DRAMA_BIBLE.md](v7/CHARACTER_DRAMA_BIBLE.md) | 立绘总账与 24 位核心人物语气规约；天都门/天海宗/海天门防混淆实测 |
| [v7/CHOICE_AND_PAYOFF_LEDGER.md](v7/CHOICE_AND_PAYOFF_LEDGER.md) | 三类选择、六篇旗舰变量链、82 条跨幕回响断言 |
| [v7/DIRECTION_AND_ART_V7.md](v7/DIRECTION_AND_ART_V7.md) | 舞台/站位/动作/立绘/年段/表情/CG 总账与真实截图证据；生图阻断说明 |
| [v7/EDITORIAL_REVIEW_V7.md](v7/EDITORIAL_REVIEW_V7.md) | 三轮编辑与「无聊审计」汇总；长被动段整改与保留理由 |
| [v7/PLAYTHROUGH_REVIEW.md](v7/PLAYTHROUGH_REVIEW.md) | **真实浏览器**路径 / 截图 / 错误记录；哪些路线真玩到结局、哪些只是运行时回放 |
| [v7/V7_QA.md](v7/V7_QA.md) | 构建、测试、离线、存档、Pages 子路径、多视口、环境与已知边界 |
| [v7/V7_ACCEPTANCE_MATRIX.md](v7/V7_ACCEPTANCE_MATRIX.md) | 17 项 P0 逐行真实状态（不允许「之前未验证、后面可能通过」不收敛） |
| [v7/V7_DELIVERY.md](v7/V7_DELIVERY.md) | 面向使用者的最终交付说明 |

机读证据在 [evidence/v7/](evidence/v7)：`works-ledger.json`（43 版本）、`works-current.json`（23 现行）、`ending-coverage.json`（47/47 结局可达）、`opening-rhythm.json`、`passive-run.json`、`fact-beat-trace.json`。
生成命令：`node --experimental-strip-types scripts/audit-v7-works.mjs`、`scripts/audit-v7-opening.mjs`、`scripts/audit-v7-passive-run.mjs`、`scripts/audit-v7-ending-coverage.mjs`。

## 三、原典与改编（`lore/`，11 份）

| 文档 | 内容 |
|---|---|
| [lore/CANON_MASTER_INDEX.md](lore/CANON_MASTER_INDEX.md) | 原典 29 个二级单元的逐段索引、行号范围、区别性事实；含原典 SHA-256 |
| [lore/V6_READING_NOTES.md](lore/V6_READING_NOTES.md) | 全文逐段阅读笔记与候选玩法 |
| [lore/CANON_RULES.md](lore/CANON_RULES.md) | 编剧硬约束（榜谱层级、境界、死亡、武学、地理等） |
| [lore/CANON_MATRIX.md](lore/CANON_MATRIX.md) | 原典素材矩阵 |
| [lore/CANON_CAST_AND_FACTIONS.md](lore/CANON_CAST_AND_FACTIONS.md) | 人物与门派谱系 |
| [lore/CANON_TIMELINE.md](lore/CANON_TIMELINE.md) | 时间线 |
| [lore/CANON_CONFLICT_AUDIT.md](lore/CANON_CONFLICT_AUDIT.md) | 与原典的冲突排查 |
| [lore/ADAPTATION_COVERAGE_MATRIX.md](lore/ADAPTATION_COVERAGE_MATRIX.md) | 22 组素材群覆盖（**V6 口径：A 16 / B 6**；V7 重算为 A 18 / B 4，见 `v7/CANON_WORKS_MATRIX.md`） |
| [lore/ADAPTATION_TRACEABILITY.md](lore/ADAPTATION_TRACEABILITY.md) | 作品到原典段落的可追溯对照（V6 版） |
| [lore/LORE_INDEX.md](lore/LORE_INDEX.md) | lore 目录自身索引 |
| [lore/source-index.json](lore/source-index.json) | 机器可读的原典索引 |

## 四、上一世代工作文档（`v6/` · 历史）

> **口径提醒**：V6 判断的是「原创主篇继续扩写」，V7 已把产品定位改为「原典纪事集」。引用 V6 数字时不要当作 V7 结论（见 [../AGENTS.md](../AGENTS.md) 的当前定位与历史数字说明）。

### 4.1 进度与交接

- [v6/WORK_PROGRESS.md](v6/WORK_PROGRESS.md) —— 总进度（**追加段为最新**）
- [v6/SUPPLEMENT_EXECUTION.md](v6/SUPPLEMENT_EXECUTION.md) —— 剧情专项追加执行记录
- [v6/HANDOFF_2026-10-16_QIAN_KUN_V3.md](v6/HANDOFF_2026-10-16_QIAN_KUN_V3.md) —— 乾坤 V3 紧急交接检查点
- [v6/AUDIT_BASELINE.md](v6/AUDIT_BASELINE.md) —— V6 修改前基线（历史）
- [v6/MAIN_EXPANSION_PROGRESS.md](v6/MAIN_EXPANSION_PROGRESS.md) —— 主篇扩写进度（**已过期**）

### 4.2 验收与审计

- [v6/ACCEPTANCE_MATRIX.md](v6/ACCEPTANCE_MATRIX.md) —— **主表已过期，见文末提示节**
- [v6/V6_REQUIREMENTS_AUDIT_20261016.md](v6/V6_REQUIREMENTS_AUDIT_20261016.md) —— 对照两份委托文档的完成度审计（结论：未完成）
- [v6/CONTENT_AND_UX_AUDIT_20261016.md](v6/CONTENT_AND_UX_AUDIT_20261016.md) —— 可玩性审计：旧稿入口、原典命中率、枯燥与门槛的量化诊断
- [v6/NAMED_CHARACTER_CENSUS_V6.md](v6/NAMED_CHARACTER_CENSUS_V6.md) —— 具名 NPC 普查
- [v6/CANON_PLAYABLE_COVERAGE.md](v6/CANON_PLAYABLE_COVERAGE.md) —— 原典可玩覆盖
- [v6/CAUSAL_LEDGER.md](v6/CAUSAL_LEDGER.md) —— 因果台账
- [v6/DEFAULT_ENTRY_V6.md](v6/DEFAULT_ENTRY_V6.md) —— 默认入口切换记录（**已被 V7 取代：默认入口现为作品库**）
- [v6/MAIN_CURRENT_20261016_QA.md](v6/MAIN_CURRENT_20261016_QA.md) —— 主篇现行 QA
- [v6/MAIN_ENDING_STAGING_V6.md](v6/MAIN_ENDING_STAGING_V6.md) —— 结局分段

### 4.3 各篇三轮编辑记录（`<WORK>_V3_EDITORIAL.md` 为最终稿）

太华 [V3](v6/TAIHUA_V3_EDITORIAL.md) · 枯河谷 [V3](v6/KUHE_V3_EDITORIAL.md) · 龙门 [V3](v6/LONGMEN_V3_EDITORIAL.md) · 青石 [V3](v6/QINGSHI_V3_EDITORIAL.md) · 第十二席 [V3](v6/TWELFTH_LIFE_V3_EDITORIAL.md) · 北枪 [V3](v6/NORTH_V3_EDITORIAL.md) · 乾坤 [V3](v6/QIAN_KUN_V3_EDITORIAL.md) · 山河璧 [V2](v6/JADE_V2_EDITORIAL.md) / [盗玉篇](v6/JADE_THIEVES_V2_EDITORIAL.md) · 海路两世 [V2](v6/SEA_V2_EDITORIAL.md) / [潮生](v6/SEA_TIDE_V2_EDITORIAL.md) · 一剑两脉 [V2](v6/TWO_SWORDS_V2_EDITORIAL.md) / [门外七问](v6/SEVEN_QUESTIONS_V2_EDITORIAL.md)

同名 `*_EDITORIAL_DRAFT.md` 是接入前的草稿，保留为历史。**V7 的全站汇总见 [v7/EDITORIAL_REVIEW_V7.md](v7/EDITORIAL_REVIEW_V7.md)**（第六轮 Gate B 后 9 篇缺项已补齐，见 `docs/evidence/v7/gate-b-summary.json`）。

### 4.4 改编委托书（`*_ADAPTATION_BRIEF.md`）

枯河谷 · 龙门 · 太华 · 青石 · 第十二席 · 一剑两脉 · 死人争榜 · 芦花渡 · 洛阳竹院 · 北枪 · 玄门 · 白石谷 · 榜外 · 山河璧 · 海路

### 4.5 美术

- [v6/ART_DIRECTION.md](v6/ART_DIRECTION.md) · [v6/ART_PROVENANCE.md](v6/ART_PROVENANCE.md) · [v6/ASSET_REUSE_MAP.md](v6/ASSET_REUSE_MAP.md) · [v6/CORE_ART_TRIGGER_AUDIT.md](v6/CORE_ART_TRIGGER_AUDIT.md)
- `v6/*-provenance.json` —— 逐图来源凭据（约 60 份）
- [v6/art-candidates/](v6/art-candidates) —— 候选素材
- **V7 总账见 [v7/DIRECTION_AND_ART_V7.md](v7/DIRECTION_AND_ART_V7.md)**

### 4.6 复用与兼容（改素材前必读）

[v6/REUSABLE_CHILD_AND_COMPAT.md](v6/REUSABLE_CHILD_AND_COMPAT.md) · [v6/JADE_REUSABLE_ART_AND_COMPAT.md](v6/JADE_REUSABLE_ART_AND_COMPAT.md) · [v6/SEA_REUSABLE_RIGGING_AND_COMPAT.md](v6/SEA_REUSABLE_RIGGING_AND_COMPAT.md) · [v6/SWORDS_REUSABLE_ART_AND_COMPAT.md](v6/SWORDS_REUSABLE_ART_AND_COMPAT.md) · [v6/KUHE_V2_ART_BRIEF.md](v6/KUHE_V2_ART_BRIEF.md) · [v6/QINGSHI_V2_ART_BRIEF.md](v6/QINGSHI_V2_ART_BRIEF.md) · [v6/TWELFTH_LIFE_V2_ART_BRIEF.md](v6/TWELFTH_LIFE_V2_ART_BRIEF.md) · [v6/ROYAL_LETTERS_CG_AND_OFFLINE.md](v6/ROYAL_LETTERS_CG_AND_OFFLINE.md) · [v6/HENG_IDENTITY_AND_TEA_V2.md](v6/HENG_IDENTITY_AND_TEA_V2.md)

### 4.7 叙事设计

- [v6/STORY_BLUEPRINT.md](v6/STORY_BLUEPRINT.md) —— 故事蓝图
- [v6/EDITORIAL_REVIEW.md](v6/EDITORIAL_REVIEW.md) —— V6 编辑审读（**V7 汇总见 `v7/EDITORIAL_REVIEW_V7.md`**）

## 五、素材台账（`art/`）

- [art/ASSET_MANIFEST_V6.md](art/ASSET_MANIFEST_V6.md) —— 人读版清单
- [art/ASSET_MANIFEST_V6.json](art/ASSET_MANIFEST_V6.json) —— 机读版清单
- [art/asset-usage-v6.json](art/asset-usage-v6.json) —— 素材使用归属
- 生成命令：`python scripts/build-art-manifest-v6.py`

## 六、原始证据（`evidence/`）

- **`evidence/v7/*.json` + `e2e-full.log`** —— V7 审计原始输出（见上 §二）
- `evidence/v6/*.log` —— 构建 / 单元 / 浏览器 / 离线测试日志
- `evidence/v6/*summary*.json` —— 28 份各篇统计汇总
- `evidence/v6/qian-kun-editorial-integration-preservation.json` —— 28 个冻结保护路径的字节校验清单
- `evidence/v6/offline-bundle-ownership-audit.json` —— 离线包归属审计
- 详见 [evidence/README.md](evidence/README.md)

## 七、V5 世代存档（本目录根）

- [V5_DELIVERY.md](V5_DELIVERY.md) —— V5 交付说明（**已被 V6/V7 取代**）
- [V5_QA.md](V5_QA.md) —— V5 QA
- [V5_WORKLOG.md](V5_WORKLOG.md) —— V5 工作日志
- [CANON_ADAPTATION_MAP.md](CANON_ADAPTATION_MAP.md) —— 早期原典对照表

## 八、仓库根的设计文档

`ARCHITECTURE_REVIEW.md` · `DESIGN.md` · `NARRATIVE_DESIGN.md` · `DIALOGUE_AUTHORING_GUIDE.md` · `CHARACTER_ROSTER.md` · `BRANCH_MATRIX.md` · `CONSEQUENCE_LEDGER.md` · `CONTENT_MIGRATION.md` · `ART_ASSET_MANIFEST.md` · `ART_DIRECTION.md` · `LORE_BIBLE.md` · `CANON_AND_ADAPTATION.md` · `INTERACTION_QA.md` · `QA.md` · `PRODUCT.md` · `DEPENDENCIES.md` · `ASSETS.md`

## 九、发布与公开快照

- [PUBLISHING.md](PUBLISHING.md) —— 公开快照的生成步骤、排除策略、发布后配置与更新方式
- [evidence/README.md](evidence/README.md) —— 证据索引，含截图未随快照发布的说明

## 十、阅读本目录的注意事项

1. **文档是叠加式迭代的**，历史段与最新段会同时存在，通常**追加段为最新**。不要只看文件开头。
2. **`v7/` 与 `v6/` 的产品定位不同**：V7 是「原典纪事集」，V6 是「原创主篇扩写」。**不要把 V6 的完成度结论当作 V7 的**，反之亦然。当前定位与证据入口见根 [AGENTS.md](../AGENTS.md)。
3. **`ACCEPTANCE_MATRIX.md`（v6）/ `MAIN_EXPANSION_PROGRESS.md` 已有过期内容**，当前状态须回到 [独立终审矩阵](audits/independent-final/FINAL_ACCEPTANCE.md) 核对。
4. **历史批量PNG不随公开快照发布**：原公开说明的1930张/约1.4GiB是旧口径。本次实际外置2121张，其中2109项原已追踪，逐SHA与恢复清单见 [证据说明](evidence/README.md) 和 [体积报告](audits/independent-final/SIZE_SUMMARY.md)。本轮精选≤800px WebP与白名单文本另行公开；旧PNG路径在公共检出中不可直接打开。
5. **旧作者谱系的裸SHA通常不能在公共库解析**；公共main从原策展快照继续普通增量历史，后续公共提交可正常解析。不要把作者与公共两个SHA混为同一提交，来源对应见 [发布回执](audits/independent-final/RELEASE_VALIDATION.md)。
6. 当前未提供四份旧委托文件 `V6_DELIVERY.md` / `V6_QA.md` / `DIRECTION_BEATS.md` / `AUTHORING_WORKFLOW.md`。V7阶段资料见 `v7/`，本轮交付以 [独立终审报告](audits/independent-final/FINAL_DELIVERY.md) 为准；不依赖README已移除的旧缺口段。
