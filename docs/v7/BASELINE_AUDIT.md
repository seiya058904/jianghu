# V7 基线审计（开工只读事实清单）

> 命令与日期：全部条目在 **2026-10-16** 于受控本机工作区执行，逐条注明实际命令。
> 本文只记录**开工时可核对的客观事实**，不含结论性宣传。改动边界见 §8。

---

## 1. 工作区与提交谱系

| 项目 | 实测值 | 来源命令 |
|---|---|---|
| 工作目录 | `.` | 会话工作目录 |
| 当前分支 | `master` | `git rev-parse --abbrev-ref HEAD` |
| 开工 HEAD | `de8666865190ea963ba8ee8c408e3a8a52985677` | `git rev-parse HEAD` |
| 开工工作区 | **干净**（`git status --porcelain` 无输出） | `git status --porcelain` |
| 最近提交 | `de86668` Point the one screenshot link at the disclosure instead of a dead link | `git log --oneline -3` |
| 远端 | `origin  https://github.com/seiya058904/jianghu.git`（fetch + push） | `git remote -v` |

**远端与公开镜像的关系**：委托文件 §1.1 记公开 `main` 为 `a6e5d5947ce2d06c6c2ab83e1cfd515c95191959`。本地 `master` 与公开 `main` 提交谱系不同（本机为正常开发历史，公开快照为策展导入）。本轮**以本机受控工作区为准**，未对远端做任何 fetch / push / 强制覆盖。

---

## 2. 原典校验基线

| 项目 | 实测值 |
|---|---|
| 路径 | `宋世江湖.md`（仓库根） |
| 字节数 | **579,299** |
| SHA-256 | **`2e2b665657543e81c6b06c121307c9f13685d2c535f762a5b921949aaa8af393`** |
| 校验命令 | `node -e "const c=require('crypto'),f=require('fs');const b=f.readFileSync('宋世江湖.md');console.log(b.length,c.createHash('sha256').update(b).digest('hex'))"` |

**与委托文件 §1.2 给定值完全一致**（字节数与哈希逐项相符）。原典全文**不随公开快照发布**，见 §7。

---

## 3. 现行作品与旧版本（开工实测）

`chronicle-catalog.ts` 的 `chronicleWorks` 数组共 **43 个版本对象**，其中 **23 个为现行版本**（不含 `-v1` / `-v2` 冻结稿）。台账来源：`node --experimental-strip-types scripts/audit-v7-works.mjs` → `docs/evidence/v7/works-ledger.json`。

### 3.1 23 个现行版本（按台账实测）

| slug | 入口文件 | 版本 | 存档前缀 | 拍 | 选项 | 结局 | 场景 | 出场人物 | 最长无选择段 | 作者源字节 |
|---|---|---|---|---|---|---|---|---|---|---|
| `kuhe` | kuhe.html | kuhe-3.0.0 | `jianghu:chronicle:kuhe:v3:` | 326 | 40 | 2 | 6 | 9 | 22 | 61,547 |
| `qingshi` | qingshi.html | 3.0.0 | `…:qingshi:v3:` | 447 | 60 | 2 | 23 | 20 | 26 | 88,288 |
| `two-swords` | two-swords.html | 2.0.0 | `…:two-swords:v2:` | 334 | 50 | 2 | 22 | 15 | 16 | 69,502 |
| `seven-questions` | seven-questions.html | 2.0.0 | `…:seven-questions:v2:` | 382 | 62 | 2 | 19 | 16 | 16 | 84,147 |
| `jade-thieves` | jade-thieves.html | 2.0.0 | `…:jade-thieves:v2:` | 320 | 45 | 2 | 17 | 6 | 30 | 66,315 |
| `jade` | jade.html | 2.0.0 | `…:jade:v2:` | 322 | 68 | 2 | 27 | 14 | 12 | 79,130 |
| `sea` | sea.html | 2.0.0 | `…:sea:v2:` | 257 | 46 | 2 | 15 | 17 | 18 | 57,869 |
| `sea-tide` | sea-tide.html | 2.0.0 | `…:sea-tide:v2:` | 239 | 42 | 2 | 15 | 12 | 22 | 53,544 |
| `north` | north.html | 3.0.0 | `…:north:v3:` | 342 | 62 | 2 | 13 | 13 | 15 | 77,302 |
| `qian-kun` | qian-kun.html | 3.0.0 | `…:qian-kun:v3:` | 318 | 50 | 2 | 16 | 16 | 22 | 68,475 |
| `north-notes` | north-notes.html | 1.0.0 | `…:north-notes:v1:` | 69 | 12 | 2 | 4 | 3 | 12 | 14,291 |
| `dead-ranking` | dead-ranking.html | 1.0.0 | `…:dead-ranking:v1:` | 325 | 66 | 2 | 24 | 14 | 18 | 77,402 |
| `luhua` | luhua.html | 1.0.0 | `…:luhua:v1:` | 256 | 50 | 2 | 26 | 26 | 18 | 59,192 |
| `twelfth-life` | twelfth-life.html | 3.0.0 | `…:twelfth-life:v3:` | 393 | 68 | 2 | 29 | 22 | 24 | 83,991 |
| `luoyang` | luoyang.html | 1.0.0 | `…:luoyang:v1:` | 76 | 18 | 2 | 7 | 15 | 7 | 18,575 |
| `bamboo` | bamboo.html | 1.0.0 | `…:bamboo:v1:` | 86 | 14 | 2 | 5 | 4 | 12 | 18,578 |
| `xuanmen` | xuanmen.html | 1.0.0 | `…:xuanmen:v1:` | 114 | 22 | 2 | 8 | 5 | 14 | 25,115 |
| `white-stone` | white-stone.html | 1.0.0 | `…:white-stone:v1:` | 132 | 26 | 2 | 6 | 13 | 12 | 30,093 |
| `beyond-ranking` | beyond-ranking.html | 1.0.0 | `…:beyond-ranking:v1:` | 98 | 18 | 2 | 2 | 2 | 13 | 21,643 |
| `taihua` | taihua.html | 3.0.0 | `…:taihua:v3:` | 465 | 63 | **3** | 18 | 18 | 43 | 89,146 |
| `longmen` | longmen.html | 3.0.0 | `…:longmen:v3:` | 356 | 50 | 2 | 13 | 9 | 40 | 69,013 |
| `dongting` | dongting.html | 1.0.0 | `…:dongting:v1:` | 155 | 22 | 2 | 6 | 10 | 17 | 31,115 |
| `twelfth` | twelfth.html | 1.0.0 | `…:twelfth:v1:` | 236 | 36 | 2 | 8 | 11 | 15 | 45,025 |

> ⚠️ **「最长无选择段」一列的读法**：本列由 `scripts/audit-v7-works.mjs` 对 Ink **源码做线性扫描**得出，会把互斥条件分支 `{cond: A | B}` 的两侧 beat 串联计数，因此是**上界**，不是玩家体验值。
> 按**真实游玩路径**重测（`scripts/audit-v7-passive-run.mjs` → `docs/evidence/v7/passive-run.json`）：**23 篇没有一篇超过 20 拍**，最大 20（`longmen`），其次 17（`taihua` / `qian-kun` / `twelfth-life`）。**以运行时测量为准。**

### 3.2 20 个冻结旧稿（`-v1` / `-v2`）

`kuhe-v2 kuhe-v1 qingshi-v2 qingshi-v1 two-swords-v1 seven-questions-v1 jade-thieves-v1 jade-v1 sea-v1 sea-tide-v1 north-v2 north-v1 qian-kun-v2 qian-kun-v1 twelfth-life-v2 twelfth-life-v1 taihua-v2 taihua-v1 longmen-v2 longmen-v1`

全部为**只读归档**：`story/archive/` 下冻结原字节 + 独立存档前缀，用途**仅为让旧存档仍能打开**，不参与作品库现行目录。

### 3.3 原创地方篇（4 个入口）

| 入口 | 标题 | 存档前缀 | V7 定位 |
|---|---|---|---|
| `tide-v6.html` | 潮生有约 · V6（1325 拍 / 182 选项 / 8 类结局） | `jianghu:campaign:tide:v2:` | 原创地方篇 · 历史作品 |
| `tide-v5.html` | 潮生有约 · V5 | `jianghu:campaign:tide:v1:` | 原创地方篇 · 初版 |
| `half-step.html` | 半步之约 | `jianghu:vn:v2:` | 更早的原创短篇 |
| `legacy.html` | 渡口无碑 | `jianghu:v1:` | 更早的原创短篇（带证词与渡船） |

**这四个入口的源码、生成故事、素材、存档前缀在本轮全部原样保留**（委托 §2.3 明确要求不得物理删除）。

### 3.4 作者源与生成文件

| 层 | 位置 | 是否可手写 |
|---|---|---|
| 作者源 | `story/campaign/author.mjs`、`story/campaign/interludes.mjs` | ✅ 唯一应手写处 |
| 分章 Ink | `story/*.ink` | ⚠️ 编译产物，可审阅 |
| 运行时 JSON | `src/generated/*.json` | ❌ 生成物，改了下一次 build 会被覆盖 |
| 冻结原字节 | `story/archive/` | ❌ 只读 |

编译命令：`node scripts/compile-story.mjs`（`npm run story:build`）。

---

## 4. 存档前缀与人物/美术绑定

- **存档前缀**：每版本一个，格式 `jianghu:chronicle:<slug>:v<N>:`。23 个现行版本 + 20 个冻结稿 + 4 个原创篇，全部互不覆盖（`tests/library.test.ts` 断言作品间进度绝不共享）。
- **人物绑定**：`chronicle-catalog.ts` 的 `chronicleCharacters` 汇总各篇 `*-catalog.ts` 的 `Person` 记录，字段含 `name / role / detail / portrait{file,kind,moods,looks}`。
  - `kind:'dedicated'` = 专属立绘；`kind:'template'` = 通用 NPC 原型（`archetype` + `variant`）。
  - 跨年龄通过 `portrait.looks`（如 `qw_zhao` 有 `age44 / age52 / age58`），情绪通过 `portrait.moods`（如 `amused / intent / sharp / uneasy / hurt`）。
- **场景绑定**：`chronicleScenes`，每项 `{name,time,art}`，`art` 指向 `public/art/v5|v6/*.webp`。
- **结局绑定**：`chronicleEndings`，键为 ending ID（如 `lm_home / lm_travel / th_company`）。
- **事实（见闻）绑定**：`chronicleFacts`，键为 fact ID。

---

## 5. 当前推荐入口（V7 开工前 vs 开工后）

| 时点 | `/` 与 `/index.html` 的实际行为 |
|---|---|
| **开工前（V6）** | 视为 V6《潮生有约》，`campaignEdition` 默认加载 `src/generated/campaign-v6.json`；`showLibrary()` 先插 `<h3>潮生有约</h3>` 再平铺 38–43 条历史版本 |
| **本轮改造后（V7）** | `/` 与 `/index.html` = **作品库首页**（`src/library.ts` → `index.html`）；`isV6Edition` 只匹配 `tide-v6.html`；首页不再加载 `campaign-v6.json` |

V6 时点的问题（来自 `docs/v6/CONTENT_AND_UX_AUDIT_20261016.md`）：
- 默认首页主篇是原创地方篇，其人物/地名在原典中出现 **0 次**；
- 38 个目录项中约 **18 项带「旧稿」字样**，与现行版平铺混排；
- 主篇结局段出现**连续 74 拍**（更旧版本 **133 拍**）无选择；
- 部分原典短篇对白占比 **32%–40%**。

---

## 6. CI / E2E 状态

| 项目 | 开工实测 | 命令 |
|---|---|---|
| 单元/契约测试 | **291 pass / 0 fail** | `npm test` → `docs/evidence/v7-baseline-test.log` |
| 构建 | 需先清空 `dist`（Vite 的 prepare-out-dir 触发本机 bulk-delete 守卫），否则 `SAFE_DELETE_BULK_CONFIRM_REQUIRED` | `npm run build` → `docs/evidence/v7-baseline-build.log` |
| E2E | 未在本轮开工时重跑（沿用 V6 结论：Playwright 双 webServer 4173 根路径 + 4175 `/Jianghu/` 子路径；**本机有 HTTP 代理时 webServer 就绪探测必然 60s 超时**，须清空 `http_proxy`/`https_proxy`） | `npm run test:e2e` |
| CI | 仓库有 `deploy-pages.yml`（Pages 部署）与 `verify.yml`（`npm run build` + `npm test`） | `.github/workflows/` |

> 重要区分：**本机基线全跑**（原典与 `docs/archives/` 齐备，冻结断言逐条真验）与**公开镜像**（原典/归档缺席，`tests/frozen-baselines.ts` 显式跳过并在 `docs/evidence/v6/frozen-baselines-missing.json` 记 34 条）是**不同验证等级**。本报告只引用两者中**本机实测**的数字，公开镜像的跳过数单独标注。

---

## 7. 公开隐私边界

`docs/PUBLISHING.md` 规定，以下内容**不进入公开快照**：

| 排除项 | 体积 / 数量 | 原因 |
|---|---|---|
| `docs/evidence/**/*.png` | 约 1.4 GiB / 1930 张 1920×1080 截图 | 超 GitHub 体积建议；文本证据保留 |
| `docs/archives/**` | 约 3.4 MiB / 114 文件 | 冻结旧版原始源码 |
| `宋世江湖.md` | 579,299 B | 原典全文，不公开发布 |

本轮新增的 `docs/v7/*.md` 与 `docs/evidence/v7/*.json` **全部为可公开发布的派生产物**：不含原典正文、不含全文索引、不含大段未改编原文；原典证据以「章节名 + 原始行号范围 + 少量关键词」标注。

**许可状态**：仓库**没有 LICENSE**。本轮**未添加**任何许可证或版权声明（委托 §9.4 禁止未经授权添加）。

---

## 8. 改动边界（本轮实际改了什么）

`git status --porcelain` 在本轮结束时的实际输出：

```
 M index.html
 M package.json
 M scripts/audit-offline-bundles-v6.mjs
 M scripts/offline-manifest.mjs
 M src/chronicle-access.ts
 M src/edition.ts
 M src/luoyang-catalog.ts
 M src/player.ts
 M src/vn-ui.ts
 M tests/default-entry.spec.ts
 M tests/default-entry.test.ts
 M tests/luoyang-bamboo.spec.ts
 M tests/luoyang-bamboo.test.ts
?? docs/evidence/v7/
?? scripts/audit-v7-works.mjs
?? src/library.css
?? src/library.ts
?? src/work-index.ts
?? src/works-registry.ts
?? tests/library.spec.ts
?? tests/library.test.ts
```

**边界声明**：
- 未修改任何 `story/**`（剧本正文）、`src/generated/**`（运行时剧情）、`public/art/**`（美术）。本轮是**产品外壳与信息架构**改造。
- 未触碰 `docs/archives/`、`docs/evidence/v6/`、其它用户文件。
- 未删除任何旧入口、旧存档前缀、旧生成故事。
- 未对远端做 fetch / push / 强制覆盖。

---

## 9. V6 六类缺口的本轮裁定

委托 §1.3 要求对 v6 审计提出的缺口逐类裁定。裁定四档：**本轮必须修 / 原委托遗留须继续 / 被新产品决定明确取代 / 确需外部条件**。

| # | V6 缺口 | 裁定 | 依据与本轮动作 |
|---|---|---|---|
| 1 | 默认首页是原创地方篇，原典人物/地名出现 0 次 | **本轮必须修 → 已修** | `src/edition.ts` 重设路由；`src/library.ts` + `works-registry.ts` 新建作品库首页。见 `tests/default-entry.test.ts`、`tests/library.test.ts` |
| 2 | 38 条入口平铺、约 18 条标「旧稿」与现行版混排 | **本轮必须修 → 已修** | 首页分三段：现行作品 / 历史版本与旧存档（在 `<dialog>` 归档区）/ 原创旧篇。见 `tests/library.spec.ts` |
| 3 | 主篇结局段连续 74 拍（旧版 133 拍）无选择 | **被新产品决定明确取代** | 原创主篇退出默认门面，其长收束段不再构成新玩家入口问题。原典篇最长被动段台账见 `works-ledger.json`（现行版最大 43 拍：`taihua`）。**但原典篇自身的 43/40/30 拍段仍须逐段必要性审查** —— 转「原委托遗留须继续」 |
| 4 | 两部中篇（`dead-ranking` / `luhua`）与全部 B 触点 CG 为 0 | **确需外部条件** | 本机无生图/图像编辑工具可用，无法生成新 CG。台账已记录缺口数值，列入 `V7_ACCEPTANCE_MATRIX.md` V7-12 为 BLOCKED 并写明最小所需条件 |
| 5 | 逐篇三轮文学未覆盖 `dead-ranking`/`luhua`/`dongting`/`luoyang`/`bamboo` | **原委托遗留须继续** | 本轮为壳层重构，未重写剧本正文；这五篇的三轮汇总仍缺。`EDITORIAL_REVIEW_V7.md` 如实记录，不冒充已完成 |
| 6 | 外部验证全部 NOT VERIFIED（真人试读、真人耗时、Android 真机、Safari/Firefox） | **确需外部条件** | 无真人试读者、无真机、无 Safari/Firefox 环境。全部列 `EXTERNAL NOT VERIFIED` |

---

## 10. 是否存在外部改动

- `git status` 在开工时为**干净**：不存在用户未提交的改动，不存在上一次会话留下的半成品。
- 工作区**无** `.orig` / `.rej` / 冲突标记文件。
- 本轮全部改动均由本会话产生，逐文件列于 §8。
