# V7 作品、卷册与历史版本

> 真相单一来源：`src/chronicle-catalog.ts`（版本事实：slug / file / prefix / chapters / endingCount）+ `src/works-registry.ts`（作品分组：卷 / 配篇 / 归档）
> `tests/library.test.ts` 断言两者**永不漂移**：`groupedEditionSlugs` 与 `chronicleWorks` 的 slug 集合完全一致，任何新增版本若没被作品库收进去，测试立即失败。

---

## 1. 数据模型

### 1.1 版本（Edition）— `chronicle-catalog.ts`

```ts
{slug, file, title, version, prefix, start, hook, intro, viewpoint, note, coverArt, chapters, endingCount?}
```

- `slug` 是**稳定身份**，不随改版变更。
- `file` 是**静态深链**，历史 HTML 入口继续有效。
- `prefix` 是**独立存档前缀**，格式 `jianghu:chronicle:<slug>:v<N>:`。
- `endingCount` 缺省为 2（仅 `taihua` 显式声明 3）。

### 1.2 作品（Work）— `src/works-registry.ts`

```ts
{id, title, subtitle, entry, theme, era, viewpoint, hook, summary, fight,
 art, artAlt, beats, canon[], recommended, requires?, order,
 volumes[], companions[], archives[]}
```

- `entry`：现行可玩版本（唯一主推入口）。
- `volumes`：同一作品的分卷（含 `entry` 自身）。
- `companions`：紧密相邻的配篇（洛阳 / 竹院 / 问席 / 陪练 / 师门夜话 / 榜纸之外 / 另一座山等）。
- `archives`：`-v1` / `-v2` 冻结稿，**只出现在归档区**。
- `beats`：从 `story/<slug>.ink` 实测的 `# beat:` 数，`tests/library.test.ts` 断言与注册值一致。
- `canon[]`：本作品承载的原典组标签（与 `CANON_WORKS_MATRIX.md` 对应）。
- `requires?`：阅读锁说明（如竹院夜论）。

常量 `groupedEditionSlugs` 由上述四类 slug 去重合并而成，是**测试用的完整可达集**。

---

## 2. 16 部作品 × 23 个现行版本

| # | 作品 | 现行入口 | 卷册 | 配篇 | 冻结归档 |
|---|---|---|---|---|---|
| 1 | 太华试序 | `taihua.html` | 现行篇 · 三年之约 | 白石谷外（昆仑旧史） | `taihua-v2`, `taihua-v1` |
| 2 | 龙门问刀 | `longmen.html` | 现行篇 · 龙门问刀 | 洛阳龙虎风云会、竹院夜论（**需解锁**） | `longmen-v2`, `longmen-v1` |
| 3 | 第十二席 | `twelfth-life.html` | 现行篇 · 赵承晏 | 陪练篇 · 馆师视角（`twelfth`） | `twelfth-life-v2`, `twelfth-life-v1` |
| 4 | 山河璧 | `jade-thieves.html` | 第一卷 · 密库双贼 | — | `jade-thieves-v1` |
| | | `jade.html` | 第二卷 · 十三文 | — | `jade-v1` |
| 5 | 青石五友 | `qingshi.html` | 现行篇 · 守一天 | — | `qingshi-v2`, `qingshi-v1` |
| 6 | 死人争榜 | `dead-ranking.html` | 现行篇 | — | — |
| 7 | 照水刀 | `luhua.html` | 完整生涯 · 芦花渡 | 问席一篇 · 护船帮手视角（`dongting`） | — |
| 8 | 北枪 · 三师一枪 | `north.html` | 第一卷 · 三师一枪 | 不会算账（`qian-kun`）、师门夜话（**需解锁**） | `north-v2`, `north-v1` |
| 9 | 乾坤 · 不会算账 | `qian-kun.html` | 第二卷 · 不会算账 | 三师一枪（`north`）、师门夜话 | `qian-kun-v2`, `qian-kun-v1` |
| 10 | 一剑两脉 | `two-swords.html` | 第一册 · 旧本归还 | — | `two-swords-v1` |
| | | `seven-questions.html` | 第二册 · 门外七问 | — | `seven-questions-v1` |
| 11 | 玄门旧史 | `xuanmen.html` | 现行篇 · 九席与返真不绝 | 榜纸之外（`beyond-ranking`） | — |
| 12 | 白石谷外 | `white-stone.html` | 现行篇 | 玄门旧史、太华试序 | — |
| 13 | 海路两世 | `sea.html` | 第一册 · 中原以外 | — | `sea-v1` |
| | | `sea-tide.html` | 第二册 · 归潮岛 | — | `sea-tide-v1` |
| 14 | 枯河谷 | `kuhe.html` | 现行篇 · 门后有人 | — | `kuhe-v2`, `kuhe-v1` |
| 15 | 榜纸之外 | `beyond-ranking.html` | 现行篇（**需解锁**） | 玄门旧史、白石谷外 | — |
| 16 | 师门夜话 | `north-notes.html` | 附篇（**需解锁**） | 三师一枪、不会算账 | — |

合计：**16 部作品 / 23 个现行版本 / 20 个冻结归档**，全部 slug 与 `chronicleWorks` 的 43 个版本对象一一对应。

---

## 3. 主题分类（7 档筛选）

`src/works-registry.ts` 的 `themeOrder`：

| 主题键 | 标签 | 作品 |
|---|---|---|
| `martial` | 会武与成名 | 太华试序、龙门问刀、照水刀 |
| `lives` | 师门与人生 | 第十二席、青石五友、北枪、乾坤 |
| `mystery` | 江湖奇闻 | 山河璧、死人争榜 |
| `sects` | 门派旧事 | 一剑两脉、玄门旧史、白石谷外 |
| `sea` | 远海行记 | 海路两世 |
| `history` | 旧史与人物谱 | 枯河谷、榜纸之外、师门夜话 |

> 委托 §6.2 建议的「推荐入门」在本实现中不是独立主题，而是 `recommended:true` 标记（6 部：太华、龙门、第十二席、青石五友、死人争榜 + 山河璧按顺序落入推荐排序），首页用 `#recommended` 锚点呈现。

---

## 4. 历史版本与旧存档的展示 / 隐藏规则

**规则**：`archives[]` 里的 slug **只出现在两个地方**：
1. 作品库首页的「历史版本与旧存档」`<dialog>`（`#archive` 深链）；
2. 单篇阅读器封面上的「历史版本与旧存档」链接。

**首次浏览的正式作品库主区零归档条目**。`tests/library.spec.ts` 断言：首页正文段顺序必须是 现行作品 → 历史版本与旧存档 → 原创旧篇，且归档面板不得重述现行目录（`archiveHtml` 不含「现行作品」字样）。

**进度隔离**：`readProgress(work, storage)` 只读 `editionPrefix(work.entry)` 的 `endings` / `auto` / `readBeats` 键。测试断言：
- 单结局 = `reading`，集齐全部结局 = `finished`；
- 另一部作品**绝不继承**本篇进度；
- 冻结版进度**不算**现行版进度；
- 损坏 JSON（`{not json`）安全降级为 `new`，不抛异常；
- `storage` 为 `null` 时安全返回 `new`。

---

## 5. 路由（`src/edition.ts`）

改造后的实际判定顺序：

```ts
chronicleWorks.find(work => pathname.endsWith('/'+work.file))   // 1. 23 现行 + 20 冻结，按文件名直配
?? (pathname.endsWith('/tide-v6.html')  ? campaign-v6.json      // 2. 原创 V6 显式深链
   : pathname.endsWith('/tide-v5.html') ? campaign-v5-1.0.0.json // 3. 原创 V5 显式深链
   : isCampaign && !isLibraryPage       ? campaign.json          // 4. 半步之约 / 渡口无碑
   : null)                                                       // 5. `/` 与 `/index.html` = 作品库
```

关键改动（V7 的新路由语义）：

| 路径 | 改造前 | 改造后 |
|---|---|---|
| `/` | V6《潮生有约》 | **作品库首页**（`campaignEdition.content === undefined`） |
| `/index.html` | V6《潮生有约》 | **作品库首页** |
| `/tide-v6.html` | V6《潮生有约》 | V6《潮生有约》（不变） |
| `/taihua.html` 等 | 原典篇 | 原典篇（不变，存档前缀不变） |

`isLibraryPage` 是新增常量；`isV6Edition` 从「`/` 或 `/index.html` 或 `tide-v6.html`」收窄为**只有 `tide-v6.html`**。

断言位置：`tests/default-entry.test.ts` 第 1 条「V7 collection root is the works library，只有 `/tide-v6.html` 选原 V6」+ `tests/default-entry.spec.ts`（真实浏览器直连与首页不读战役命名空间）。

---

## 6. 离线包归属

`scripts/offline-manifest.mjs` 生成的清单：

- **共享 shell** `offline-manifest.json`：`./` + 全部通用立绘/场景/CG（实测 69 URLs）。**不再包含 `./index.html` 的故事包归属**。
- **按作品包** `offline-<slug>.json`：每个版本一份（如 `offline-taihua.json` 24 URLs、`offline-tide-v6.json` 63 URLs）。

改造点：`bundles['tide-v6']` 中原有的 `push('./','./index.html')` **已移除** —— 因为 `/` 与 `/index.html` 现在属于作品库，不属于《潮生有约》。

`scripts/audit-offline-bundles-v6.mjs` 断言：
- `offline-tide-v6.json` 必须含 `./tide-v6.html`；
- shell 必须含 `./` 与 `./index.html`；
- **故事包不再含 `./index.html`**。

→ 增删卡片**不会**让其它作品的缓存误归属。

---

## 7. 兼容性承诺

| 承诺 | 实现 |
|---|---|
| 旧入口深链继续有效 | 全部 `-v1` / `-v2` HTML 与 `tide-v5.html` / `tide-v6.html` / `half-step.html` / `legacy.html` 均未删 |
| 旧存档不被覆盖 | 每版本独立 `prefix`；归档区只读不写 |
| 旧存档不被静默转义 | 不切换前缀、不做「读任意 JSON 后把变量映射进新剧情」 |
| 旧生成故事原字节保留 | `story/archive/` 冻结；`src/generated/*-v1/-v2.json` 未改 |
| 冻结稿进度不算现行进度 | `readProgress` 只认 `work.entry` 的前缀（有测试） |
| 旧存档可导出 | 阅读器原有 JSON 导出/导入未改；归档区入口文案明确「旧存档仍按原来的作品读取与导出」 |

> **未做**（如实声明）：本轮**没有**为任何现行版本做存档 schema 迁移。改造只影响路由与目录，不改任何剧情节拍 ID，因此不需要迁移。改动边界见 `BASELINE_AUDIT.md` §8。
