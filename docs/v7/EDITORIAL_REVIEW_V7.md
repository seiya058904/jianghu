# V7 编辑审查汇总（三轮编辑 + 无聊审计）

> **本轮的诚实定位**（历史记录，第五、六轮之前）：V7 这一轮的实际改动**主要是产品外壳与信息架构重做**（首页、作品库、路由、归档分区、离线归属），**其次**是对 8 篇点名作品的定向改写（§6.1–6.10）。它**在当时没有**对任何一篇完成委托 §8.1 的三轮编辑。
> **第六轮更新（2026-10-17）**：委托点名的 9 篇三轮文学编辑已在 Gate B 补齐（每篇 Round1 结构 / Round2 声线 / Round3 互动+原典复测，逐篇 JSON 见 `docs/evidence/v7/*-editorial-rounds.json`，总表 `gate-b-summary.json`）；23/23 三强三弱现行版终审见 `PLAYTHROUGH_REVIEW.md` §10。本文 §1 的覆盖表保留为第五轮前的历史口径。
> 本文做四件真实的事：(1) 把 V6 已存在的三轮编辑覆盖**逐篇列清**；(2) 补上**机器「无聊报警器」**实测（含第三轮重测）；(3) **点名仍缺三轮的 9 部作品**，不冒充完成；(4) 逐篇登记**本轮实际改了什么、测出什么、哪一次是退步、哪一处明确没做**。

---

## 1. 三轮编辑的实际覆盖（逐篇，来源可查）

委托 §8.1 要求三轮：**情节因果轮 / 文学与人物轮 / 互动与演出轮**，且每轮要给出 `作品 / beat ID / 原问题 / 修改后结果 / 复测证据`。

| 作品 | 编辑文档 | 该文档自报的三轮条数 | 自报状态 |
|---|---|---|---|
| 枯河谷 | `docs/v6/KUHE_V3_EDITORIAL.md` | 29 条（结构/因果 10、人物口吻 10、替代分支与回响 9） | 三轮完成（内部） |
| 龙门问刀 | `docs/v6/LONGMEN_V3_EDITORIAL.md` | 35 条（13 + 12 + 10） | 三轮完成（内部） |
| 北枪 | `docs/v6/NORTH_V3_EDITORIAL.md` | 41 条修订（见 `NORTH_EDITORIAL_DRAFT.md`） | 三轮完成（内部） |
| 乾坤 | `docs/v6/QIAN_KUN_V3_EDITORIAL.md` | 47 条（14 + 12 + 21） | 三轮完成（内部） |
| 青石五友 | `docs/v6/QINGSHI_V3_EDITORIAL.md` | 38 条（17 + 12 + 9） | 三轮完成（内部，含定点复核） |
| 太华试序 | `docs/v6/TAIHUA_V3_EDITORIAL.md` | 49 条（23 + 16 + 10） | 三轮完成（内部） |
| 第十二席 | `docs/v6/TWELFTH_LIFE_V3_EDITORIAL.md` | 34 条（12 + 12 + 10） | `VERSIONED_LOCAL_INTEGRATION_VERIFIED_NOT_FULL_GOAL_ACCEPTANCE` |
| 密库双贼 | `docs/v6/JADE_THIEVES_V2_EDITORIAL.md` | 51 条（16 + 13 + 22） | 同上 |
| 十三文 | `docs/v6/JADE_V2_EDITORIAL.md` | 43 条（13 + 12 + 18） | 同上 |
| 中原以外 | `docs/v6/SEA_V2_EDITORIAL.md` | 63 条（10 + 34 + 19） | 三轮完成（内部） |
| 归潮岛 | `docs/v6/SEA_TIDE_V2_EDITORIAL.md` | 58 条（10 + 28 + 20） | 三轮完成（内部） |
| 门外七问 | `docs/v6/SEVEN_QUESTIONS_V2_EDITORIAL.md` | 三轮分节（结构 / 人物 / 跨分支） | 三轮完成（内部） |
| 旧本归还 | `docs/v6/TWO_SWORDS_V2_EDITORIAL.md` | 三轮分节（时间与行动承诺 / …） | 三轮完成（内部） |

**合计 13 篇有编辑文档，各文档均自报三轮完成**，并附 `docs/evidence/v6/*-editorial-changes.json` 或 `*-editorial-round{1,2,3}-records.json` 逐条前后对照。

### 1.1 仍缺三轮汇总的 9 部（❌）

| 作品 | 拍数 | 缺什么 |
|---|---|---|
| **死人争榜** `dead-ranking` | 325 | 无任何编辑文档；`docs/v6/EDITORIAL_REVIEW.md` 亦记「未进行」 |
| **照水刀** `luhua` | 256 | 无编辑文档（只有 `LUHUA_ADAPTATION_BRIEF.md`） |
| **问席** `dongting` | 155 | 无编辑文档（只有 `LONGMEN_ADAPTATION_BRIEF.md` 邻近内容） |
| **洛阳龙虎** `luoyang` | 76 | 无编辑文档（只有 `LUOYANG_BAMBOO_ADAPTATION_BRIEF.md`） |
| **竹院夜论** `bamboo` | 86 | 同上 |
| **玄门旧史** `xuanmen` | 114 | 只有 `XUANMEN_ADAPTATION_BRIEF.md` |
| **白石谷外** `white-stone` | 132 | 只有 `WHITE_STONE_ADAPTATION_BRIEF.md` |
| **榜纸之外** `beyond-ranking` | 98 | 只有 `BEYOND_RANKING_ADAPTATION_BRIEF.md` |
| **师门夜话** `north-notes` | 69 | 无（作为双卷附篇） |

> 委托 §8.1 原文点了五篇：`dead-ranking`、`luhua`、`dongting`、`luoyang`、`bamboo`。实测**这五篇确实都缺**；此外本清单还发现 `xuanmen`、`white-stone`、`beyond-ranking`、`north-notes` 也缺（这四篇是 V6 从「短触点」升级成独立篇的，编辑工作没有跟上）。
>
> **第二轮起，其中 8 篇已有可核对的定向改写记录**（不是三轮审读）：`beyond-ranking` / `luoyang`（§6.1–6.2）、`dead-ranking` / `luhua` / `dongting`（§6.4–6.6）、`xuanmen` / `white-stone` / `bamboo`（§6.8–6.10）。**唯一仍未动过正文的是 `north-notes`（69 拍，双卷附篇）。**
>
> **如实结论：V7-13 未完成。三轮审读完成数仍为 0/9。**

---

## 2. 机器「无聊报警器」（本轮新增）

委托 §8.2 要求生成每部的开场定位、旁白/对白占比、连续无选择拍数等。本轮**实际建了两个可复现脚本**：

| 脚本 | 输出 | 测什么 |
|---|---|---|
| `scripts/audit-v7-opening.mjs` | `docs/evidence/v7/opening-rhythm.json` | 开场第一个非旁白发言、玩家第一次开口、第一个选择各在第几拍；旁白占比；最长无选择段（线性上界） |
| `scripts/audit-v7-passive-run.mjs` | `docs/evidence/v7/passive-run.json` | 按**真实游玩路径**（每篇 240 次确定性随机通关）测最长连续无选择推进 |

### 2.1 开场定位：全部合格（✅）

**23 / 23 篇的第一个选择都落在前 8 拍内**（最快第 2 拍 `jade-thieves`，最慢第 8 拍 `taihua`）。第一个非旁白发言在第 1–8 拍。这满足委托 §5.1「开场 30–90 秒内体验到一次真实交互」，也直接回应委托 §10.4 的红线「开场如果仍让玩家连续点击多页旁白、还没机会说一句话，必须重写」。

### 2.2 最长无选择段：**全部在 20 拍线内**（✅，并纠正一处误报）

| 排名 | 作品 | 最长无选择段（真实路径） | 中位数 |
|---|---|---|---|
| 1 | `longmen` | 20 | 18 |
| 2–4 | `taihua` / `qian-kun` / `twelfth-life` | 17 | 16 / 16 / 17 |
| 5–6 | `jade-thieves` / `qingshi` | 16 | 16 / 15 |
| 7–9 | `kuhe` / `luhua` / `two-swords` | 15 | 15 |
| 其余 | `dead-ranking` 15、`sea` 14、`sea-tide` 14、`north` 13、`seven-questions` 13、`xuanmen` 13、`dongting` 13、`north-notes` 11、`white-stone` 11、`twelfth` 10、`beyond-ranking` 10、`bamboo` 9、`jade` 9、`luoyang` 6 | | |

**方法学纠正（重要）**：`docs/evidence/v7/works-ledger.json` 的 `longestPassiveRun` 报出 43（taihua）/ 40（longmen）/ 30（jade-thieves）。该字段由对 Ink 源码的**线性扫描**得出，会把 Ink 条件分支 `{cond: 分支A | 分支B}` 的两侧 beat **串联**计数 —— 一次通关只走其中一支。例：`taihua` 的 `{strain and not measured and carried: th_ending_19..24}` 与紧随的互斥分支被相加成 43。**43 拍不是玩家体验值。** 以 `passive-run.json` 为准。

> 这也意味着：V6 审计记录的「主篇结局段连续 74 拍、更旧版本 133 拍」很可能是同类方法学叠加的结果。**本轮未对 V6 的 74/133 重新按运行时路径测量**（那属于原创主篇，已退出默认门面），因此不对该旧数字下结论。

### 2.3 对白占比：**0 / 23 达标**（❌）

| 指标 | 实测范围 | 委托门槛（§8.2） |
|---|---|---|
| 旁白占比 | **35.2% – 67.5%**（即对白 32.5% – 64.8%） | 对白「65% 左右或更高」 |

最接近门槛的是 `twelfth`（64.8% 对白）与 `dongting`（63.2%）；最差是 `xuanmen`（32.5% 对白）与 `white-stone`（32.6%）。

这与 V6 审计记录的「32%–50%」一致 —— **本轮既没有恶化也没有修复**，因为未改正文。

⚠️ 委托 §8.2 同时提醒：「对白比例只是定位器，不能机械切句或凑选项」「一场纯动作高潮不应为了刷对白塞假话」。因此本项应记为**未达标但需要人工判断**，而不是简单「加对白」。

### 2.4 旁白过重的必要性审查 —— 走 §10.4 允许的「或附必要性审查」路径

委托 §10.4 真正禁止的是**墙**：「连续几十拍无选择、无演出变化、几乎只有旁白总结」。而 §8.2 的 65% 是**全篇比例定位器** —— 一篇每章都用后日收束的作品，比例一定偏高，但没有任何一段是墙。**两者必须分开测。**

新增 `scripts/audit-v7-narration-runs.mjs`（120 次/篇，走真实 `VNRuntime`）实测：

| 指标 | 实测 | 委托红线 |
|---|---|---|
| **最长连续旁白段**（可被推着连读、无选择无演出） | **最大 11 拍**（`luhua`，落点 `lh_thirteen_years_3`）；23 篇**无一超过 20 拍** | §10.4「连续几十拍」= 墙 → **全部未触线** |
| **开场旁白段**（第一次有人开口之前要读多少旁白） | **最大 6 拍**（`jade-thieves`）；多数 ≤2 拍 | §10.4「开场连续点旁白」→ **全部合格** |
| 最长旁白段在故事中的位置 | 多篇落在**末尾**：`dead-ranking` 243/247 · `jade` 207/216 · `longmen` 211/224 · `luhua` 192/205 · `seven-questions` 239/241 · `two-swords` 221/227 · `twelfth-life` 306/323 · `north` 194/267 | 这是**后日/收束**，正是 §10.4 明确**优先采用**的收尾方式 |

**逐篇裁定（高旁白比的三篇 A 级作品）**：

* `dead-ranking` 60.0% 旁白 —— 最长连续段仅 **7 拍**，落在 `dr_last_page_5`（243/247，即**最后一页**）。抽查原文为结局收束（「若为同情把三个人拼成的谢重新写进现榜，又是一错」）。**裁定：比例高但不是墙，属必要收束，保留。**
* `luhua` 62.5% 旁白 —— 最长段 **11 拍**（全库最长），落点 `lh_thirteen_years_3`（192/205，**后日**），内容为孟与阿泊各自的路。**裁定：全库唯一需要留意的一段，仍属后日性质；建议下一轮把其中 2–3 拍改成信件/对话，但不改事实。**
* `luoyang` 61.8% 旁白 —— 最长段仅 **3 拍**。**裁定：比例高来自大量短旁白穿插，无墙。**
* `jade-thieves` 开场旁白 **6 拍**（全库最长开场）—— **裁定：可接受，但下一轮宜把其中 1–2 拍移到首个选择之后。**

**同时如实保留两项仍未解决的对照**：

1. **全篇对白占比 0/23 达标**（§2.3）—— 必要性审查**不等于**达标，本项**仍是 FAIL**。
2. **`beyond-ranking` 玩家首次开口在第 89 拍**（全篇 98 拍）—— 这是 §10.4 的另一条红线（「还没机会说一句话」），**须显式改写或论证**，本轮未做。

> 方法学提醒：本节的「最长连续旁白段」是**真实运行时**测量；`works-ledger.json` / `opening-rhythm.json` 里的 `longestPassiveRun`（taihua 43、longmen 40）是**对 Ink 源码的线性扫描上界**，会把 `{cond: A | B}` 互斥分支串联，**不得当作玩家体验值引用**。

---

## 3. 逐篇无聊审计的必需项：完成度

委托 §8.2 要求每部报告以下 10 项。逐项对照本轮完成情况：

| 要求项 | 本轮状态 |
|---|---|
| 开场第一个有效事件、第一个有立场的人物、第一个玩家决定在第几拍 | ✅ 已产出（`opening-rhythm.json`、`ending-coverage.json`） |
| 旁白/对白占比 | ✅ 已产出（`opening-rhythm.json`） |
| 每段连续无选择拍数、最长被动区间及前后情境 | ⚠️ 部分：数值已有（`passive-run.json`，含落点 beat ID）；**「前后情境」的逐段文字描写未写** |
| 纯讲设定/口头禅/重复语义/没有新信息的拍 | ⚠️ 部分：**「重复语义」已机器判完** —— 23 篇仅 5 处重复文本，且全部是 2–3 字刻意的简短回声（见 §3.1）；**「纯讲设定/没有新信息」仍需逐拍人工阅读** |
| 选择各选项即时区别与远期区别、同路因果、分支合并必要性 | ⚠️ 部分：**「即时区别」已机器判完** —— 23 篇 `flatChoiceGroups` **全部为 0**（没有任何两个回复的下一拍字节相同）；结构链已在 `CHOICE_AND_PAYOFF_LEDGER.md` 抽出；**孤儿变量**已由 `scripts/audit-v7-orphan-vars.mjs` 逐版本实测，全库 **223 → 202**（48.0% → 43.4%），本轮清零 `xuanmen` 6 / `white-stone` 9 / `bamboo` 6；**「是否值得合并」的判断仍未做**（待审名单见 §3.2） |
| 每章结尾是否有情感落点或值得继续看的悬念 | ❌ 未做 |
| 真实演出是否与剧情状态一致、CG 是否只做资料图展示 | ❌ 未做（见 `DIRECTION_AND_ART_V7.md`） |
| 每部最具记忆点的三段场面 / 最无趣的三段场面与编辑处理 | ⚠️ 部分（8/23）：`beyond-ranking` / `luoyang` / `dead-ranking` / `luhua` / `dongting` / `xuanmen` / `white-stone` / `bamboo` 八篇已逐篇写出（§6.1–6.6、§6.8–6.10）；**其余 15 篇未做** |

### 3.1 「重复语义」机器判定结果（✅ 通过）

`scripts/audit-v7-boring-probes.mjs` 把每一篇的全部拍文本收齐去重（走真实运行时）。**23 篇里只有 5 篇各有 1 处文本重复，全部是 2–3 字的极短应答**：

| 作品 | 重复文本 | beat 对 | 读法 |
|---|---|---|---|
| `dead-ranking` | 「怕丢人。」 | `dr_gu_silence_5` / `dr_case_read_6` | 两处不同情境下同一句心声 —— **刻意的回声**，不是复制粘贴 |
| `kuhe` | 「在。」 | `kh_years_9` / `kh_future_11` | 同上 |
| `qingshi` | 「都能用。」 | `qs_constable_4` / `qs_cut_3` | 同上 |
| `sea` | 「天都门。」 | `sr_forty_three_2` / `sr_five_visits_9` | 同上 |
| `taihua` | 「你先。」 | `th_centre_3` / `th_left_thirteen_3` | 同上 |

**结论：没有发现「口头禅灌水」或大段复制。** 这 5 处恰好都是短句回环，属于编剧手法；已给出 beat ID 供编辑确认（若某处确属误用，可直接定位）。

### 3.2 「即时区别」机器判定结果（✅ 通过）

同一脚本对每个选择点比较**各回复之后的下一拍文本**：

* **`flatChoiceGroups = 0`，23 篇全部为 0** —— 即**不存在两个回复后读者看到完全相同的一拍**。
* 这是 §8.2「选择各选项即时区别」在**即时层面**的实证通过。

⚠️ 这不等于「远期区别」也通过：远期差异由变量门控决定，见 `CHOICE_AND_PAYOFF_LEDGER.md` 的 82 条回响断言。**待审名单**：从不改动 `variablesState` 的回复（`alwaysSilentChoices`，各篇 5–33 个，如 `twelfth-life` 33、`taihua` 30）—— 这批**很可能**是纯文本分支的「即时表达」类回复（本身合法），但也是「是否值得合并」复审的**优先取样池**。

> 方法学留痕：本脚本第一版把 `save().runtime.variablesState` 直接比较 —— 但 `save().runtime` 是 `story.state.ToJson()` 返回的 **JSON 字符串**，取 `.variablesState` 恒为 `undefined`，导致「所有回复都不改变变量」的假结论（taihua 报 63/63）。改用仓库自身使用的 `JSON.parse(save.runtime).variablesState` 后数字才合理。**这是本文件把假结论拦在发布前的记录。**

**如实结论：V7-09 与 V7-13 本轮均未达标。** 已交付的是机器可复现的定位数据，不是文学验收结论。

---

## 4. 本轮新增的可核对数据（供后续编辑直接使用）

| 文件 | 内容 | 生成命令 |
|---|---|---|
| `docs/evidence/v7/works-ledger.json` | 43 个版本的拍/选项/结局/场景/人物/专属人物/最长被动段（线性上界）/源字节 | `node --experimental-strip-types scripts/audit-v7-works.mjs` |
| `docs/evidence/v7/works-current.json` | 23 个现行版本的同一组指标 | 同上 |
| `docs/evidence/v7/opening-rhythm.json` | 开场定位 + 旁白占比 + 线性被动段 | `node --experimental-strip-types scripts/audit-v7-opening.mjs` |
| `docs/evidence/v7/passive-run.json` | 真实路径最长无选择段（240 次/篇采样） | `node --experimental-strip-types scripts/audit-v7-passive-run.mjs` |
| `docs/evidence/v7/narration-runs.json` | 真实路径最长连续旁白段 / 开场旁白段 / 段落在故事中的位置（120 次/篇） | `node --experimental-strip-types scripts/audit-v7-narration-runs.mjs` |
| `docs/evidence/v7/ending-coverage.json` | 结局可达性 47/47 + 首个开口三探针（600 次/篇） | `node --experimental-strip-types scripts/audit-v7-ending-coverage.mjs` |
| `docs/evidence/v7/boring-probes.json` | 重复语义拍 + 即时无差别选择 + 不改变变量的回复名单（120 次/篇） | `node --experimental-strip-types scripts/audit-v7-boring-probes.mjs` |
| `docs/evidence/v7/fact-beat-trace.json` | `fact`/`ending` 标签 → beat 绑定 | 见 `ADAPTATION_TRACE_V7.md` |

---

## 5. 给下一轮编辑的最小可执行清单（第三轮结束后的当前状态）

按委托 §8.1 的三轮口径，下一步应按此顺序做（不改变正典）：

1. **九篇缺三轮**逐篇补 情节因果轮 → 文学人物轮 → 互动演出轮，每轮给出 `beat ID / 原问题 / 改后 / 复测`。**其中 8 篇已有定向改写记录（§6.1–6.10），但都不是三轮；`north-notes` 连定向改写都还没有。**
2. **旁白占比最高四篇**做「对白化」审读 —— 现状：`xuanmen` **62.7%**（已从 70.6% 收回，仍是全库最差）、`white-stone` **63.7%**（已从 67.4% 收回）、`dead-ranking` **58.7%**、`luhua` **59.2%**。按委托 §8.2，只在确有「NPC 只在说教」的拍上补现场动作，不为刷比例塞话。
3. ~~**`beyond-ranking` 第 89 拍才首次开口、`luoyang` 全程无玩家发言**~~ —— **已在 §6.1 / §6.2 处置完毕**：`beyond-ranking` 首次开口 **89 → 2 拍**，`luoyang` `speaker:you` **0 → 8**。
4. **`white-stone` 的双人拍为 0** —— 需要改场景结构（每场加一个正典允许的在场者），不是加台词能解决的；**明确留待下一轮**，本轮不做凑数。
5. 其余 **15 篇**补「最具记忆点三段场面 / 最无趣三段场面及处理」（已完成 8/23）。
6. **全库仍有 202 个孤儿变量**（43.4%），下一批优先 `twelfth-life` 23 / `north` 21 / `jade` 19 / `seven-questions` 16 / `dead-ranking` 15 / `sea` 15。

---

## 6. 本轮实际改写记录（2026-10-16 · 两个可控 FAIL 的第一批）

按委托 §8.1 的字段逐项记录。**必须先说清性质**：本轮做的是
「定位具体病灶 → 改剧本 → 单测全路径复测 → 浏览器定向复测」，
**不是「三轮审读」**。三轮审读的 9 篇缺口（§1.1）**仍未闭合**，本节的结论不得被当作三轮审读证据。

### 6.0 一个必须先讲的结构性事实（会直接影响后续所有剧本修改）

`story/*.ink` **不是真源**。`scripts/compile-story.mjs` 会 `import` 每一篇的
`story/<slug>-author.mjs`，而这些 author 脚本结尾用 `writeFileSync` **重新生成 `.ink`**。
因此**直接编辑 `story/*.ink` 会在下一次 `npm run story:build` 时被静默覆盖**（本轮实测踩到两次）。
所有剧情修改都必须改 `story/<slug>-author.mjs`（DSL 见 `story/chronicle-writer.mjs`：
`part / say / choose / iff / fact / end`；行格式 `speaker~mood|text`，`n`=旁白，`y`=玩家）。
另有一处连带纪律：`src/works-registry.ts` 的 `beats:` 必须等于该篇 `.ink` 的实际 `# beat:` 数，
否则 `tests/library.test.ts:24` 会红（本轮 `beyond-ranking` 已由 98 同步为 118）。

### 6.1 `beyond-ranking`《榜纸之外》

| 字段 | 内容 |
|---|---|
| 原典行段 | `宋世江湖.md` 35058–35315（太玄旧录 · 宁无极所评天下十人） |
| 游戏作品 | `beyond-ranking.html`（现行篇；解锁于《玄门旧史》+《白石谷外》各一种归宿） |
| 实际走到的 beat IDs | 开场 `br_yellow_page_1..12`；十人逐录 `br_first_two_*` / `br_third_fourth_*` / `br_fifth_sixth_*` / `br_seventh_eighth_*` / `br_ninth_tenth_*`；收束 `br_the_order_*` / `br_closed_book_*` / `br_after_copy_*`（全 118 拍，512 条路径全覆盖） |
| 病灶（旧） | 全篇 98 拍中玩家只在**第 89 拍**（`br_closed_book_3`）与第 92 拍（`br_closed_book_8`）开口两次；玩家自己的动作（"你将空纸横过来""你按住笔""你把那页两掌的旧记推过去"）**全部由旁白代述**；宁无极的十条评语由旁白以**第三人称**转述（"宁说…""宁亲见他…"）。旁白占比 58.2% |
| 最有趣三段 | ① `br_yellow_page_4–5`：同门要"准数"，宁无极一句"发怵的是你，不是他们。" ② `br_third_fourth_5–7`："第三掌未发，两人便停"→"第三掌若出，输的是我"→同门抢答"那就是三掌败……" ③ `br_seventh_eighth_9–10`："楚天雄还在用枪。燕九霄已经不太像在用枪。"→"所以谁赢？" |
| 最无趣三段（已处理） | ① 旧 `br_not_all_alive_1–2` 连续两拍纯旁白讲"生死未定"的规矩；② 旧 `br_first_two_1/3` 把周道玄、陆天行两条评语压成第三人称资料；③ 旧 `br_the_order_1/3/7` 三拍旁白收束 |
| 本轮 diff | 真源 `story/beyond-ranking-author.mjs`。① 开场第一拍改为交代玩家职务（"监院把这页黄纸交到你手上"），**第二拍玩家开口**（`br_yellow_page_2`）；② 十条评语**全部改为宁无极第一人称亲口说出**（保留原句文字，只改归属，正典口径一字未动）；③ 同门与玩家在每段当场追问／置疑／记账；④ 末幕改为"山下来取卷的已经催过第二遍"，玩家第一次决断所留的**那一栏**在 `br_the_order_8` 具体回收 |
| 三轮结论 | **未做**（本轮为定向改写 + 复测） |
| 复测 | `tests/beyond-ranking.test.ts` **4/4 通过**（512 条路径全覆盖；9 决断 / 18 选项 / 2 结局 / 最长被动 ≤18 / 24 条正典字符串逐条在位）。`opening-rhythm.json` 实测：首次开口 **89 → 2**；旁白 **58.2% → 31.4%**（对白 41.8% → **68.6%**）；`speaker:you` **2 → 7**；98 → 118 拍 |
| 浏览器 | `docs/evidence/v7/e2e-focused-rewrites.log`（本轮定向复测，含桌面 1440 与手机 390 的完整通关与截图断言） |
| 尚存问题 | 118 拍中仍有 37 拍旁白；末幕 `br_the_order_8/9/10/11` 四拍仍为旁白转述，可再对白化；玩家 7 处发言中 3 处为长问句，可再分句；**无专属立绘**（宁无极仍用 `npc-robed-elder` 通用老人） |

### 6.2 `luoyang`《洛阳龙虎风云会》

| 字段 | 内容 |
|---|---|
| 原典行段 | `宋世江湖.md` 6058–6165（龙门秋会五年后的洛阳会） |
| 游戏作品 | `luoyang.html`（龙门 companion；读完龙门一种归宿后解锁） |
| 实际走到的 beat IDs | `ly_ten_li_*` / `ly_shen_fifty_seven_*` / `ly_gun_and_knife_*` / `ly_shi_half_sword_*` / `ly_grey_robe_*` / `ly_two_weapons_*` / `ly_one_oh_six_*` / `ly_old_tea_*` / `ly_both_hands_*` / `ly_road_after_*`（全 86 拍，512 条路径全覆盖） |
| 病灶（旧） | **全篇 76 拍，玩家一句台词都没有**（`speaker:you` = 0）。玩家所有动作都由旁白代述（"你随河中来客到会""你收回追着每块名牌跑的眼""你退，别人还想挤"），九次决断的问句只挂在选项文字上，从不作为台词出现。旁白占比 61.8% |
| 最有趣三段 | ① `ly_shen_fifty_seven_1–5`：沈长庚"没断。别又一脸等我说没事。"+玩家"最后那一下，是手先软，还是脚先到？" ② `ly_both_hands_3–5`：柳"松手。收扇。"→宁"为何我更重？"→柳"因为你还想赢。" ③ `ly_one_oh_six_2–5`：主事一声"止。"，两位高手同时收手 |
| 最无趣三段（已处理） | ① 旧 `ly_ten_li_1–2` 开场两拍纯旁白报榜位；② 旧每处决断的"问 X 是否 Y"式选项标签（没有人说出口）；③ 旧 `ly_one_oh_six_*` 连续两拍旁白讲双鞭与棍的位置 |
| 本轮 diff | 真源 `story/luoyang-author.mjs`。① 开场**第三拍玩家即开口**（`ly_ten_li_3`："许师父，两张帖都写着名次。我该按哪一张记路？"）；② 九次决断的**选项标签改为玩家原话**（如 `「您是从哪一下开始，非赌不可的？」`）；③ 八处场景内新增玩家当场发问，被前辈回答、纠正或反将一军（`ly_ten_li_3` / `ly_shen_fifty_seven_5` / `ly_gun_and_knife_5` / `ly_shi_half_sword_5` / `ly_grey_robe_5` / `ly_one_oh_six_6` / `ly_both_hands_7` 等）；④ **延迟回响**：第一拍门口那一问（`ly_ask_xu`）在收束前以两种版本回收（`ly_both_hands_7–8` 或 `ly_both_hands_9–10`），再由同门之口点出"名次之后再没有一步是替你看的" |
| 三轮结论 | **未做** |
| 复测 | `tests/luoyang-bamboo.test.ts` **4/4 通过**（512 条路径全覆盖；9 决断 / 18 选项 / 2 结局 / 最长被动 ≤18 / 15 条正典字符串逐条在位；并断言全场不出现竹院 `bb_*` 场景）。实测：首次开口 **0 → 3**；`speaker:you` **0 → 8**；旁白 61.8% → 54.7%（对白 38.2% → 45.4%）；76 → 86 拍 |
| 浏览器 | 同上日志（定向复测；含 7 档视口 360/390/412/800×360/1366/1440/1920 的键盘与溢出断言） |
| 尚存问题 | 仍以旁白交代榜位与招数；`ly_old_tea_4/5` 两拍仍是玩家视角旁白；玩家 8 处发言集中在中后段，开场后第三拍到第 14 拍之间无发言 |

### 6.3 纪律说明（防止把本轮读成「已达标」）

* 本节**没有**把 V7-09 或 V7-13 改成 PASS。两篇改完后，V7-09 的对白占比达标数只从 **0/23 → 1/23**；三轮审读仍是 **0/9 篇**。
* 未做**任何**为刷数字而加的空对白或伪选择：两篇的决断数（9 / 9）、选项数（18 / 18）、结局数（2 / 2）**一字未增**，全部改动是「把已经发生的事改由该说话的人自己说」。
* 所有被测试钉死的正典字符串（`'没有见他落笔'`、`'不是历代死者'`、`'第三掌未发'`、`'此人，可以看'`、`'左搭严腕，右按宁扇骨'` 等）**逐条保留**，可用 `grep` 复核。

---

## 6.4 `dead-ranking`《死人争榜》（第二轮定向改写）

| 字段 | 内容 |
|---|---|
| 原典行段 | `宋世江湖.md` 20214–24155（江汉旧案 · 死人争榜） |
| 游戏作品 | `dead-ranking.html`（现行篇，无归档版；旗舰中篇 A，承载原典16） |
| 实际走到的 beat IDs | 全 **387** 拍、47 个段。主线 `dr_dead_letter_1..12` → `dr_old_dream_*` → `dr_liang_house_*` / `dr_liang_memory_*` → `dr_eighty_three_*` / `dr_zhao_memory_*` / `dr_sixty_nine_*` / `dr_he_memory_*` / `dr_one_fourteen_*` → `dr_shen_three_*` → `dr_white_sand_*` → `dr_doctor_*` → `dr_woodshop_*` → `dr_three_parts_*` → `dr_seventeen_petitions_*` → `dr_identity_timing_*` → **`dr_three_faces_*`（13）/ `dr_three_faces_1_*`（14）/ `dr_three_faces_2_*`（6）/ `dr_three_faces_after_*`（9）** → `dr_white_water_*` → … → `dr_two_years_*` / `dr_living_eleven_*` → … → `dr_last_page_1..10` |
| 病灶（旧） | **三个「输给一个死人」的真败者——梁启山（八十三招）、赵问川（六十九招）、何定远（一百一十四）——在全篇 325 拍里一句台词都没有。** 他们的名字只出现在旁白转述的战绩里；「谁冒了名、为什么挑这一场、被冒的人怎么想」全部由周砚与陆观棋替他们讲完。武人最在意的那一句「你为什么让我输给一个死了十八年的人」，没有任何人问出口。 |
| 最有趣三段（本轮新增，可 `grep` 复核） | ① `dr_three_faces_4–5`：梁启山不先问名字，只问「你听见满城笑我输给一个死了十八年的人，为什么一次都没站出来说不是。」谢无灯答「说过一回。在渡口。」「跟一个不认识我的人。他一听就走，我便没有再讲第二回。」——四个短句两层反击，读者不需要一段解释。<br>② `dr_three_faces_1_8–12`：赵问川「你挑我，是我那一场好写？」杜青禾「你名字笔画少。抄帖的夜里，写得快。」「你就写了。」「写了。写完那一夜没睡，一直在想我凭哪一场挑人。」——把羞辱落在具体动作上，不落在悔意上。<br>③ `dr_three_faces_2_4–6`：何定远「你留手，是怕伤我，还是怕我死。」严松「两个都有。」「哪一个排在前头。」「怕你死。说这一句比说怕伤你难。」——三问三答把武人惯用语拆成一句真话。 |
| 最无趣三段（已处理） | ① 旧 `dr_first_two_*`：三个被冒名者的战绩由旁白以「某某，第几招，败」三连句式报完，无人在场 → 本轮把这三个真人请进「三间问话屋」。<br>② 旧 `dr_shen_three_1–3`：沈霁娘的结论由旁白先讲一遍，玩家只是「接着问」 → 本轮改为她逐页说「不是一个人」，玩家那句「打法能变，十八年也能改习惯」当场被打回（「所以我没说他们不是谢藏锋。我说，不是一个人。」）。<br>③ 旧 `dr_identity_timing_1–3`：旧案与新战绩的分账由旁白总结、没有代价 → 本轮补 `choose('three_faces_2')`：九月由三位真败者自己站起来说，或由榜房按证据代念，两种后果在 `dr_council_*` 被读回。 |
| 本轮 diff（真源） | `story/dead-ranking-people.mjs`（+4 段 `three_faces` / `three_faces_1` / `three_faces_2` / `three_faces_after`，+3 决断 `three_faces_1` / `three_faces_2` / `white_water`）、`story/dead-ranking-case.mjs`（+3 组回响）、`story/dead-ranking-after.mjs`（+2 组回响）、`story/dead-ranking-council.mjs`（+1 组回响）、`story/production-direction-v6.mjs`（+8 条 `# action:`）。另：`shen_three` 段补 `iff('dr_first_sword==1 and dr_second_sword==1 and dr_third_sword==1')`、`iff('dr_first_sword==2')`、`iff('dr_wants_test')`。 |
| 三轮结论 | **未做。** 本轮是「定位病灶 → 改剧本 → 单测全路径复测 → 浏览器定向复测」，**不得**当作三轮审读证据。 |
| 复测（单元） | `node --experimental-strip-types --test tests/dead-ranking.test.ts` → **6/6 通过**；决断选项 `choices.size` 66 → 72；`src/works-registry.ts` 的 `beats` 325 → **387**（与 `.ink` 实际 `# beat:` 数一致，`tests/library.test.ts:25` 已复核）。 |
| 复测（实测） | 用 `node scripts/audit-v7-spec-metrics.mjs dead-ranking --before`（第三轮已从临时脚本 `.tmp-spec-metrics.mjs` 固化为仓库内可复现脚本）对 `git show HEAD:story/dead-ranking.ink` 与现行 `story/dead-ranking.ink` 各测一次：拍数 **325 → 387**；`speaker:you` **43 → 50**；NPC 发言 **87 → 110**；旁白 **195 → 227**；旁白占比 **60.0% → 58.7%**（对白 40.0% → 41.3%）；`cast≥2` 且有具体发言者的双人拍 **69 → 94**，新增 4 段 42 拍中 24 拍是面对面。**如实记录：比例只改善了 1.3 个百分点，本轮的结构价值主要在 25 个新增双人拍。** |
| 浏览器 | `docs/evidence/v7/e2e-round3-focused.log` —— `tests/dead-ranking.spec.ts` **5/5**（桌面与手机两档、根路径与 `Jianghu/` 子路径、未读信件与晚年资源下载、结局图解码、七档视口）。 |
| 尚存问题 | ① 旁白占比仍 **58.7%**，**远未达 §8.2 的「对白 65% 左右」**；② `dr_*` 仍有 **15 个孤儿变量**（本轮只新增并接线 3 个新决断，未动既存的 15 个：`dr_letter_hand`、`dr_claim_separate`、`dr_asked_reopen`、`dr_boat_wait`、`dr_clinic_time`、`dr_zhao_direct`、`dr_each_name`、`dr_two_accounts`、`dr_names_plain`、`dr_life_limits`、`dr_letter_private`、`dr_new_name`、`dr_mid_response`、`dr_bow_response`、`dr_lesson`）；③ 全篇 `# cg:` 触发仍为 **0**；④ 本轮新增 4 段使最长无 NPC 发言连读由 7 拍升到 **9 拍**（仍远低于 20 拍线，但**方向是变长，如实登记**）。 |

## 6.5 `luhua`《照水刀》（第二轮定向改写 + 一次自我回归修正）

| 字段 | 内容 |
|---|---|
| 原典行段 | `宋世江湖.md` 34836–35057（洞庭旧事 · 照水刀梁照水） |
| 游戏作品 | `luhua.html`（现行篇；配篇《问席》`dongting.html`） |
| 实际走到的 beat IDs | 全 **304** 拍、33 个段：`lh_eleven_*`（11 岁）→ `lh_changsha_*` / `lh_half_blade_*` → `lh_red_snake_*` → `lh_master_can_miss_*` → `lh_empty_boat_*` → `lh_five_people_*` / `lh_third_day_*` / `lh_raid_stops_trial_*` → `lh_four_three_*` / `lh_half_chi_*` / `lh_stolen_medicine_*` / `lh_only_defend_*` / `lh_seventy_odd_*` / `lh_own_sleeve_*` → `lh_jiangling_*` / `lh_black_reef_*` → `lh_learn_sea_*` / `lh_third_sea_*` / `lh_mainship_after_*` → `lh_winter_master_*` → `lh_road_two_*` / `lh_right_hand_*` → `lh_mountain_first_*` / `lh_mountain_third_*` / `lh_mountain_fifth_*` → `lh_south_gate_*` / `lh_tang_slow_blade_*` → `lh_two_bowls_*` → `lh_thirteen_years_*` → `lh_late_after_*`（21）→ `lh_finish_*`（9） |
| 病灶（旧） | 全库**孤儿变量最多的两篇之一**：25 个 `VAR` 里有 **22 个从未被任何条件读取**。也就是说，舟上站位、风浪里的取舍、许下的承诺、自己的失误、同门之间的互相维护——这些玩家在前半篇做的决定，**在文字上全部没有下文**：选完即止。 |
| 最有趣三段（本轮接线的回响，可 `grep` 复核） | ① `lh_two_bowls_7`（墓前两碗酒）：条件句把「你收我那年说，先学的是这一步」与「你收我那年，我想的是快点学成还命」做成同一句台词的两个版本——同一拍位置，两种人生读法。<br>② `lh_late_after_*` 的后日问答：小荻一句「他们问，您这七十年最不肯省的是哪几件」，梁照水逐条把长沙打伤人的账、岳阳偷药的孩子、赤蛇滩的侧线、江陵让魏隆说完、只许守的那半日、熟招只许一回、卢百川那一败、唐九龄的下回全部说完——**把 5 组此前无人读的变量变成 5 段师徒对话**。<br>③ `lh_finish_*`：最后一组回响（那年冬师祖叫他带件厚衣）读在**最后一个决断之后**，不再往后日收束里添「只能连点」的路。 |
| 最无趣三段（已处理） | ① 旧 `lh_late_after_*`：**22 个选择各自回收不到任何东西**，玩家在 60 岁以后的每一次取舍都不会在文字里留下痕迹 → 本轮 22 个全部接线，孤儿 **22 → 0**。<br>② 旧 `lh_two_bowls_*`：墓前那一场既没有回响，也没有任何条件变体，读完即过 → 本轮把 2 组回响以**替换已有台词**的方式接入（见下「自我回归修正」）。<br>③ 旧 `lh_*` 全篇 `# action:` 为 **0**，动作字幕只在台词里被提到 → 本轮新增 3 条 `# action:`（`lh_eleven_3` 孟守川 · 先吃完这碗饭 / `lh_eleven_5` 你拿什么还 / `lh_red_snake_2` 焦定海 · 退这边）。 |
| 本轮 diff（真源） | `story/luhua-seat.mjs`（+2 组回响）、`story/luhua-seven.mjs`（+1）、`story/luhua-tide.mjs`（+3）、`story/luhua-mountain.mjs`（+2，并补上缺失的 `iff` 解构）、`story/luhua-after.mjs`（+11 组回响）、`story/production-direction-v6.mjs`（+3 条 `# action:`）。 |
| **自我回归修正（必须记录）** | 第一次接线时，我把 6 组回响**追加**在后日收束之后，实测造成两项**由我自己引入**的退化：<br>① `tests/luhua.test.ts` 报 `gap 28`（允许 ≤18）——「墓前两碗酒」到最后一个决断之间变成 28 拍无选择墙；<br>② `scripts/audit-v7-narration-runs.mjs` 报最长无 NPC 发言连读 **11 → 17 拍**，成为**全库最长**。<br>根因两条：(a) 「墓前」这一场按正典不能有活人开口（孟守川已故，且「你独自去」是这场的前提），追加旁白等于只加不发问的拍；(b) `you` 的台词**不算**打断「无 NPC 发言」的连读，所以补 `y|` 也不解决问题。<br>修正方式：把「墓前」的两组回响**改成替换已有台词**（同拍位置的条件变体，拍数不增），把第三组移到有小荻在场的后日对话，并把后日对话压到「小荻一问、你答一句」的**两拍**结构。修正后：`gap` 通过、最长连读 **17 → 11 拍**（回到改写前水平）、旁白占比 **64.5% → 59.2%**。<br>**这一步不是为了过测试才做的**：28 拍连点和 17 拍无人开口，本身就是读者会遇到的墙。 |
| 三轮结论 | **未做**（同上，定向改写 + 复测，不冒充三轮审读） |
| 复测（单元） | `tests/luhua.test.ts` **5/5 通过**（512 条路径全覆盖；决断仍 **25** 条/路、选项仍 **50** 个、结局 **2** 个，一字未增；`longest<=18` 通过）。`src/works-registry.ts` 的 `beats` 256 → 301 → **304**。 |
| 复测（实测） | 对照 `git show HEAD:story/luhua.ink`：拍数 **256 → 304**；`speaker:you` **25 → 37**；NPC 发言 **71 → 87**；旁白 **160 → 180**；旁白占比 **62.5% → 59.2%**（对白 37.5% → **40.8%**，比中途那次 64.5% 的退步收回来了）；孤儿变量 **22 → 0**。 |
| 浏览器 | `docs/evidence/v7/e2e-round3-focused.log` —— `tests/luhua.spec.ts` **4/4**（完整一生两条路线、旧配篇链接与独立存档、未读资源下载、七档视口的决断与键盘操作）。 |
| 尚存问题 | ① 旁白占比 **59.2%**，仍未达 §8.2 门槛；② 最长连读 **11 拍**仍是全库最长（落点 `lh_thirteen_years_3`，属后日收束，`§10.4` 允许的收尾方式，但**是全库唯一到两位数的**）；③ 全篇 `# cg:` 触发仍为 **0**（`luhua` 与 `dead-ranking` 都没有专属 CG 触发）；④ `lh_two_bowls` 这一场因为正典限制，19 拍里没有任何活人开口，只靠替换台词压缩，**结构上没有真正解决**。 |

## 6.6 `dongting`《问席》（第二轮定向改写 · 配篇）

| 字段 | 内容 |
|---|---|
| 原典行段 | `宋世江湖.md` 34836–35057（洞庭旧事 · 照水刀梁照水；本篇取护船帮手视角） |
| 游戏作品 | `dongting.html`（《照水刀》配篇；解锁于读完《照水刀》一种归宿） |
| 实际走到的 beat IDs | 全 **167** 拍、13 个段：`dt_third_step_*`（两年前第一百零六合）→ `dt_shore_*` → `dt_dock_*` / `dt_debts_*` / `dt_old_feud_*` → `dt_candidates_*` / `dt_chen_rope_*` → `dt_third_day_*` → `dt_raid_*`（19）/ `dt_raid_return_*`（20）→ `dt_shore_after_*` / `dt_repair_*` → `dt_threeyears_*`（17，结局 `dt_company` / `dt_cargo`） |
| 病灶（旧） | 「选项当下有文本、之后无回响」的典型样本：11 个 `VAR` 里 **6 个从未被任何条件读取**。两年前那声「先别拉！」、开船前认过的分工、孟守川不投票是否事先讲明、锁颈那一段到底出自谁口、赔付与照料是否落到具体日期——玩家在船上和岸上做的这些判断，**在场面上真的起了作用，但在文字里没有一句话把它收回来**。 |
| 最有趣三段（本轮接线，可 `grep` 复核） | ① `dt_raid_return_*`：「两年前你喊过的那一声先别拉，今天轮到他不必等人提醒」／「你两年前没有先解的那个结，今天换了一双手来解」——**同一个动作在两年后被一双手重演**，两种版本指向不同责任。<br>② `dt_raid_return_*`：开船前认过分工 → 「喊到第二遍，汪苇已经在自己那一侧接上，没有回头找你在哪」；没认过 → 「他停住、换位、再起步，中间慢了一息；那一息里没有人能替他补上」。<br>③ `dt_threeyears_*`：换药、理索、代守分成各自具体哪一日 → 「有两回你到得比说的晚，也提前报过，没有人空等」；只写了谁肯担哪一份 → 「有两回没人记得该谁去，汪苇等到天黑才见人来」。<br>④（第四段一并记）`dt_repair_*` 之后：锁颈那一段是陈震自己讲给你的，还是你后来从别处听来的——**决定这段史料有没有一个可署名的出处**。 |
| 最无趣三段（已处理） | ① 旧 `dt_raid_return_*`：绳长、绳结、口令三条全部只在选项里生效，正文一个字不提 → 本轮三组回响全部插入 `raided` 段现场。<br>② 旧 `dt_after_*`：四票三票的议席结果由旁白一次报完，孟守川为什么不举手没有任何人在意 → 本轮补 `iff('dt_recusal')`：「几家候选早就知道孟守川不会举手……没有人把那张空凳当成还没落下的第五票。」<br>③ 旧 `dt_threeyears_*`：三年后陈震入第十五席位，收束由旁白连讲 → 本轮补 `iff('dt_record')` / `iff('dt_days')`，并新增 3 条 `# action:`。 |
| 本轮 diff（真源） | 仅 `story/dongting-author.mjs`：`dt_raid` 段 +2 组回响（`dt_rope_known` / `dt_names`）、`dt_after` 段 +2（`dt_recusal` / `dt_chen_help`）、`dt_three` 段 +2（`dt_record` / `dt_days`）；`story/production-direction-v6.mjs` +4 条 `# action:`。**决断数与选项数一字未增。** |
| 三轮结论 | **未做**（同上） |
| 复测（单元） | `tests/dongting.test.ts` 通过；`src/works-registry.ts` 的 `beats` 155 → **167**；孤儿变量 **6 → 0**。 |
| 复测（实测） | 拍数 **155 → 167**；`speaker:you` 29 → 29；NPC 发言 69 → 69；旁白 **57 → 69**；旁白占比 **36.8% → 41.3%**（对白 63.2% → 58.7%）。**如实记录：本篇的三项比例全部朝坏的方向动了，因为它原本就是全库对白占比第二高的篇目（63.2%），而本轮新增的全部是「事后回收」性质的收束句，性质上只能挂在旁白上。** 换来的东西是 6 个此前完全无效的变量现在真的读得到；这一取舍是明确做过的，不是数值噪音。 |
| 浏览器 | 本轮 `tests/dongting.spec.ts` **2/2**（`docs/evidence/v7/e2e-round2-rewrites.log` 与 `e2e-round3-focused.log`）：完整浏览器流程的 company / cargo 两条路线、投票与各自不同的收束。 |
| 尚存问题 | ① 旁白占比升到 **41.3%**（对白 58.7%），**低于** §8.2 门槛，虽然仍是全库对白第二高；② 6 组新回响**全部是旁白**，没有一句是船上角色的当场台词——下一次应把其中 2–3 组改成「汪苇或陈震当面问一句」；③ `# cg:` 触发仅 2 条，无专属立绘；④ `dt_raid_*` 19 拍 / `dt_raid_return_*` 20 拍是公认的高潮段，本轮没有改动其内容，最长连读 4 拍。 |

## 6.7 第二轮纪律说明

* 本节同样**没有**把 V7-09 或 V7-13 改成 PASS。三篇改完后：V7-09 的对白占比达标数仍是 **0/23**（`luhua` 40.8%、`dead-ranking` 41.3%、`dongting` 58.7%，无一到 65%）；三轮审读仍是 **0/9 篇**。
* 三篇的正典锚点（固定死亡、正式榜谱数字、历史比赛胜负、师承年代、门庭定位）**一字未动**。新增的 `dr_*` / `lh_*` / `dt_*` 场景全部是「已发生的事由该说话的人自己说」。
* **对己方回归的处置是显式的**：`luhua` 的 `gap 28` 与「最长连读 17 拍」是本次改写**自己造出来**的，写在 §6.5 的「自我回归修正」一行里，并且**没有**通过放宽 `longest<=18` 或 `gap` 阈值来处理。
* 三篇合计：孤儿变量 **28 → 15**（`dead-ranking` 仍 15、`dongting` 0、`luhua` 0）；`cast≥2` 且有具体发言者的双人拍 `dead-ranking` **69 → 94（+25）**、`luhua` **44 → 46（+2）**、`dongting` **98 → 98（±0）**；新增 `# action:` **15** 条（8+3+4）；`# cg:` 仍为 **0**。

---

## 6.8 `xuanmen`《玄门旧史》（第三轮定向改写 · 其中一次中间退步如实登记）

| 字段 | 内容 |
|---|---|
| 原典行段 | `宋世江湖.md` 7788–8251（玄门旧史 · 九席与返真不绝） |
| 游戏作品 | `xuanmen.html`（现行篇，承载原典11；后续篇《榜纸之外》需读完本篇一种归宿） |
| 实际走到的 beat IDs | 主线 `xm_mud_*` → `xm_old_name_*` → `xm_broken_roads_*` → `xm_nine_mats_*` → `xm_stone_steps_*` → `xm_simultaneous_*` → `xm_three_years_*` → `xm_another_court_*` → `xm_seventy_*` → `xm_good_morning_*` → `xm_empty_seat_*` → `xm_last_day_*`（全 142 拍 / 2048 条路径全覆盖） |
| 病灶（旧） | 11 个 `VAR` 里 **6 个从未被任何条件读取**：`xm_medicine`（那一趟去了伤药处还是经阁）、`xm_ask`（泥地里先问老人是谁还是先问师父怎么躺）、`xm_plain`（访客簿那两行有没有添字）、`xm_ground`（石阶上先看脚下还是先看对面身后）、`xm_envy`（返真那夜的嫉妒怎样处置）、`xm_job`（空席先问有没有人接还是先问谁会做）。玩家在前半篇做的六个判断，**在文字上没有一句回响**。 |
| **中间退步（必须记录）** | 第二轮把这 6 个变量**全部接成了旁白**。接线后实测：旁白占比 **67.5% → 70.6%**（对白 32.5% → **29.4%**），是全库最差。这是一个**由接线方式造成的净退化**：变量确实「被读到了」，但读它的句子仍然是旁白，等于用更长的旁白换了一个内部记账。上一轮没有把这个中间值记下来。 |
| 最有趣三段（现在，可 `grep` 复核） | ① `xm_ask` 回响：张玄度问「您先问他们在别处做什么，不问名次。这一条是从哪儿来的？」师父答「从泥地里来的。那日我只问了师父在汉水边怎么躺。」——把一百年前躺在泥里的那一刻，接成徒弟当面追问的一条门规。<br>② `xm_ground` 回响：「您教我们看那一掌，先叫站到石阶上。为什么先看地方，不先看招式？」「因为我在平地上就想错了一回。」——把石阶那一战的地方性，变成可传的问句。<br>③ `xm_envy` 回响：张无垢说「那一页手录您没另抄，也没在整理旧录时抽掉。张玄度返真那夜的嫉妒，和第二天那三个字，落在同一叠纸上。」——师父的嫉妒**没有**被涂掉，徒弟知道这件事。 |
| 最无趣三段（已处理） | ① 旧 `xm_three_years` 段之后那两拍纯旁白收束（「宋知微后来提过一次…」/「经阁缺页那件事后来还有人来问你…」）→ 改为张无垢当面开口，并说明他为什么记得。<br>② 旧 `xm_another_court` 段的三拍旁白转述（孟玄策/何青崖/访客簿/石阶）→ 改为张玄度三问、师父三答。<br>③ 旧 `xm_empty_seat` 之后两拍「手录与空席由旁白一次报完」→ 改为张无垢在灯下问，师父答。 |
| 本轮 diff（真源） | 仅 `story/xuanmen-author.mjs`：`three_years` 段 `iff('xm_medicine')` 改为 `xm_wugou` 台词；`another_court` 段 `iff('xm_ask')` / `iff('xm_plain')` / `iff('xm_ground')` 三处改为 `xm_xuandu` 与玩家的问答；`empty_seat` 之后 `iff('xm_envy')` / `iff('xm_job')` 改为 `xm_wugou` 台词，并在其前补 `stage('xm_lamp','xm_wugou')` 以恢复当场在场者。**决断 11 / 选项 22 / 结局 2 一字未增。** |
| 三轮结论 | **未做**（定向改写 + 复测，不冒充三轮审读） |
| 复测（单元） | `tests/xuanmen.test.ts` **3/3 通过**（2048 条路径全覆盖；`choices.size===22`、`ends.size===2`、`longest<=18`；「师父死后所有舞台不再含 `xm_lu`」「死亡后无玩家指令」两条边界断言未动）。`src/works-registry.ts` 的 `beats` 114 → 126 → **142**。 |
| 复测（实测，三态对照） | 全部由 `scripts/audit-v7-spec-metrics.mjs xuanmen --before` 实测：<br>· `HEAD`（未改）：114 拍 / you 11 / npc 26 / 旁白 77 / 旁白 **67.5%**（对白 32.5%）<br>· 第二轮中间态（旁白接线）：126 拍 / you 11 / npc 26 / 旁白 89 / 旁白 **70.6%**（对白 29.4%）← **退步**<br>· 本轮：**142 拍** / you **15** / npc **38** / 旁白 89 / 旁白 **62.7%**（对白 **37.3%**）<br>孤儿变量 **6 → 0**（第二轮）→ 保持 **0**。 |
| 浏览器 | `docs/evidence/v7/e2e-round6-rewrites.log` —— `tests/xuanmen.spec.ts`：完整通关、未读资源下载、七档视口（360/390/412/800×360/1366/1440/1920）与键盘操作。 |
| 尚存问题 | ① 旁白占比 **62.7%** 仍是全库最差之一，未达 §8.2 门槛；② `xm_seventy_*` 与 `xm_empty_seat_*` 之间仍有一处 **8 拍**连续旁白（落点 `xm_empty_seat_10`，全库第二长，仅次于 `luhua` 的 11 拍），属「一百岁以后少下山」的年表式收束，本轮未拆；③ 全篇 `# cg:` 触发为 **0**，无专属立绘（`xm_lu` / `xm_wugou` / `xm_xuandu` 均为通用模板）。 |

## 6.9 `white-stone`《白石谷外》（第三轮定向改写）

| 字段 | 内容 |
|---|---|
| 原典行段 | `宋世江湖.md` 8252–11849（昆仑旧史 · 白石谷外） |
| 游戏作品 | `white-stone.html`（现行篇，承载原典12；《榜纸之外》的两把钥匙之一） |
| 实际走到的 beat IDs | 五卷：`ws_twelve_days_*` / `ws_last_step_*`（一 · 十二日）→ `ws_white_council_*` / `ws_second_person_*` / `ws_eastward_letter_*`（二 · 白石之议）→ `ws_thirteenth_day_*` / `ws_old_palm_*` / `ws_two_old_swords_*`（三 · 问山）→ `ws_six_students_*` / `ws_gu_stops_*` / `ws_forbidden_copy_*`（五 · 不许照练）→ `ws_first_crown_*` / `ws_second_crown_*` / `ws_today_after_*`（两度登首与今日；全 168 拍 / 8192 条路径全覆盖） |
| 病灶（旧） | 13 个 `VAR` 里 **9 个从未被任何条件读取**，是全库最差的一篇：`ws_gap`（缺处如实留给内议还是带同来弟子作证）、`ws_reason`（卷后记原因还是让接手人复述）、`ws_wait_name`（先问能否见还是先送妥信）、`ws_no_result`（停在双方收手处还是追问退谱多久）、`ws_today`（谢今日还是先递水）、`ws_unknown`（答天下太大还是替不愿露面的老人留白）、`ws_gu_notes`（留自己怎么硬凑还是再请另一脉看）、`ws_record_bound`（留确定与未定的边界还是记接住的支路）、`ws_slow`（在自己抢快处停还是只问自己不能解释处）。**三代人的九个取舍选完即止**，同时它对白占比 **32.6%** 也是全库最低、**双人拍 0**。 |
| 最有趣三段（现在，可 `grep` 复核） | ① `ws_gap` 回响（白石内议）：老剑师说「你把不会的那一处也摆到议事上。省了我再问一遍的功夫。」——把一个「诚实留白」的选项，变成**对手当场承认它省了自己的事**；反支则是「你说带了当日同来的人。那我只问他一句：老人最后那一下，是不是也没做完。」<br>② `ws_no_result` 回响（问山）：司马洞玄说「你带走的是见过的手，不是一个胜字。那我今日也不必给你一个。」——把「不强索胜负」接成老人口头的认可，而不是旁白替他说。<br>③ `ws_slow` 回响（两度登首）：来客说「您方才提剑，慢了半息。是故意的？」——公孙无我第二次坐榜首时那个「不再急着证一个快字」的停，由看客当场点出来。 |
| 最无趣三段（已处理） | ① 旧 `ws_white_council` 之后的议事结果纯旁白 → 改为老剑师开口。<br>② 旧 `ws_thirteenth_day` 的「等了十三日」之后直接跳到试手，中间没有一句「你为见人上山还是为送信上山」的追问 → 补 `ws_wait_name` 回响，并**把它放在 `stage('ws_trial','ws_fahui')` 之前**（同一场景内、换场之前），避免与法晦的通用立绘撞脸（测试要求同拍立绘文件互不相同）。<br>③ 旧 `ws_first_crown` / `ws_second_crown` / `ws_forbidden_copy` 三段结尾各有一拍「榜上换了名字」「后来你渐入深山」式旁白 → 各补一句来客或祁玄岳的当场反应。 |
| 本轮 diff（真源） | 仅 `story/white-stone-author.mjs`：新增 9 处 `iff` 回响（`ws_gap` / `ws_reason` / `ws_wait_name` / `ws_no_result` / `ws_today` / `ws_unknown` / `ws_gu_notes` / `ws_record_bound` / `ws_slow`），全部落在**该选择之后的下一个 `part` 区内**（可达位置），并把两处 `part` 体拆成 `part + iff + stage + say` 以便在场者发言。**决断 13 / 选项 26 / 结局 2 一字未增。** |
| 三轮结论 | **未做**（同上） |
| 复测（单元） | `tests/white-stone.test.ts` **3/3 通过**（8192 条路径全覆盖；`choices.size===26`、`r.n===13`、`longest<=18`；「祁玄岳 POV 各段不得含 `ws_qi`」「同拍立绘文件互不相同」「`ws_two_crowns` 等 29 条正典字符串逐条在位」全部保留）。`src/works-registry.ts` 的 `beats` 132 → **168**。 |
| 复测（实测） | 对照 `git show HEAD:story/white-stone.ink`：拍数 **132 → 168**；`speaker:you` 16 → 16；NPC 发言 **27 → 45**；旁白 89 → 107；旁白占比 **67.4% → 63.7%**（对白 **32.6% → 36.3%**，全库最低的一篇有实质回升）；孤儿变量 **9 → 0**；最长连续旁白段 **7 拍**（开场段 3 拍，均未触 20 拍线）。 |
| 浏览器 | 同上日志 —— `tests/white-stone.spec.ts`：从《太华试序》页面的「昆仑旧史 · 白石谷外」入口进入、完整通关两条路线、离线资源下载、根路径与 `Jianghu/` 子路径、七档视口与键盘操作、302 处结局图解码。 |
| 尚存问题 | ① **双人拍仍为 0** —— 本篇每个场景在正典里都只有一个具名在场者（十二日的老人、白石之议的老剑师、法晦、洞玄、藏山公、归藏、顾寒声、来客），**我没有为了让这个指标动而硬塞一个多余角色进单人对白场**（那正是「为通过数值阈值堆砌」）。要动它必须先改场景结构，属下一轮的编排工作。<br>② 旁白占比 **63.7%** 仍未达 §8.2 门槛；③ `ws_first_crown` / `ws_second_crown` / `ws_forbidden_copy` 仍各有一段年表式旁白；④ 全篇 `# cg:` 触发 **0**，无专属立绘。 |

## 6.10 `bamboo`《竹院夜论》（第三轮定向改写）

| 字段 | 内容 |
|---|---|
| 原典行段 | `宋世江湖.md` 6166–6361（竹院夜论 · 当夜） |
| 游戏作品 | `bamboo.html`（龙门 companion；读完《龙门问刀》一种归宿后解锁） |
| 实际走到的 beat IDs | `bb_closed_gate_*` → `bb_three_steps_*` → `bb_thirty_six_*` → `bb_han_twelve_*` → `bb_north_south_*` → `bb_waist_next_day_*` → `bb_tea_cup_*` → `bb_night_ends_*` → `bb_after_*`（全 110 拍 / 128 条路径全覆盖） |
| 病灶（旧） | 7 个 `VAR` 里 **6 个从未被任何条件读取**：`bb_own_place`、`bb_less_question`、`bb_han_record`、`bb_compare`、`bb_unseen`、`bb_fought`——**这一整夜六次追问，问完就没有下文**。玩家在席上问出什么、柳成章怎样回应，只存在于选项文字里。 |
| 最有趣三段（现在，可 `grep` 复核） | ① `bb_han_record` 回响：柳说「你把亲见战绩和江湖替他说的话分开了。这一分，比多知道一场胜负要紧。」——把「要求分清亲见与传闻」这个略带冒犯的追问，接成柳**主动给的评价**。<br>② `bb_unseen` 回响：「你问我为何不替他留一个大概。留了，你们出去就说我看过；他若变了，是我把他按在七年前。」——一句话交代「七年没见就不说如今」的伦理，而不是旁白替他解释。<br>③ `bb_fought` 回响：「你问我有没有跟山打过一架。问完自己先笑了——这一笑比答话实在。」——把「肯接受不以交手为承认前提」接成柳反过来笑玩家。 |
| 最无趣三段（已处理） | ① 旧 `bb_three_steps` 之后「柳说完旧事便直接进下一问」→ 补 `bb_own_place` 回响。<br>② 旧 `bb_thirty_six` / `bb_han_twelve` / `bb_north_south` 三处**每问完一句就翻页**，中间没有柳的收束 → 各补一拍柳本人或罗继祖的当场回应。<br>③ 旧 `bb_tea_cup` 结尾「柳没说。你也没从杯沿替他猜出一套…」纯旁白收束 → 补 `bb_fought` 回响，把「敢只认能确定两个」接成柳的回答。 |
| 本轮 diff（真源） | 仅 `story/bamboo-author.mjs`：新增 6 处 `iff` 回响，全部落在**该选择之后的下一个 `part` 区内**；发言者为柳成章（5 处）与罗继祖（1 处），两者与在场诸人的通用立绘文件互不相同。**决断 7 / 选项 14 / 结局 2 一字未增。** |
| 三轮结论 | **未做**（同上） |
| 复测（单元） | `tests/luoyang-bamboo.test.ts` **4/4 通过**（两种子跑通；`choices.size===14`、`r.decisions===7`、`longest<=18`、`cast.length<=3`；「严仲山是 POV、不与自己对面而立」「不出现 `lm_xu` / `lm_shi` / `ly_guo` / `ly_ye`」两条边界断言保留）。 |
| 复测（实测） | 对照 `git show HEAD:story/bamboo.ink`：拍数 **86 → 110**；`speaker:you` 15 → 15；NPC 发言 **32 → 44**；旁白 39 → 51；旁白占比 **45.3% → 46.4%**（对白 54.7% → 53.6%，**如实记录：因为新增的全是 NPC 一问与旁白一答，旁白也跟着涨了，比例基本持平**）；`cast≥2` 且有具体发言者的双人拍 **43 → 53（+10）**；孤儿变量 **6 → 0**；最长连续旁白段 **3 拍**。 |
| 浏览器 | 同上日志 —— `tests/luoyang-bamboo.spec.ts`：两个短篇的完整通关与七档视口。 |
| 尚存问题 | ① 旁白占比基本未动（54.7% → 53.6%），本轮换到的是一整夜六次追问**终于有回应**，不是比例；② 本篇是**资料型夜谈**，按委托 §7.2 的裁定不为它硬塞战斗场面或 CG，`# cg:` 保持 **0**；③ `bb_after` 的两条收束仍是旁白（`bb_palm_after` / `bb_tea_after`），本轮未改。 |

## 6.11 第三轮纪律说明（与前两轮同一口径）

* 本节**没有**把 V7-09 或 V7-13 改成 PASS。三篇改完后：V7-09 的对白占比达标数仍是 **0/23**（`white-stone` 36.3%、`bamboo` 53.6%、`xuanmen` 37.3%，无一到 65%）；三轮审读仍是 **0/9 篇**。
* **一次净退步被显式登记而不是抹掉**：`xuanmen` 上一轮的「旁白式接线」使旁白占比从 67.5% 升到 **70.6%**（§6.8）。本轮把它改回台词，才回到 62.7%。这是同一篇目上「接线」与「接线方式」两件事的区别。
* **一次不做的取舍也显式登记**：`white-stone` 的双人拍仍是 **0**，因为该篇正典里每个场景只有一个具名在场者。我没有为了让这个指标好看而加一个旁人在场。
* 三篇的正典锚点（陆照寒「人可以少，路不能只剩一个人」、法晦九十七手先止无胜负、祁玄岳无可确认寿命、公孙无我两次第一、韩世雄二十年十二场八胜两平两负、柳成章「如今我没见」等）**逐条保留**，可用 `grep` 复核；本轮所有新增文本均为「该说话的人自己说」，未新增任何事实。
* 本轮三篇合计：孤儿变量 **21 → 0**；拍数 **132+86+126 → 168+110+142**（+166）；NPC 发言 **+44**；`# cg:` 仍为 **0**。全库孤儿变量由 **223 → 202**（465 个 `VAR` 中，48.0% → **43.4%**）。

## 6.12 `north-notes`《三师一枪 · 笔记》（第四轮定向改写）

> 这是九篇缺三轮里**唯一连定向改写都还没有**的一篇（§5 清单第 1 条）。它是 `north` 与 `qian-kun` 的双卷附篇，69 拍，本身对白占比 58.0% 并不差；缺的是**四个孤儿变量**——四个「问完了当场有记录、之后却没有任何回响」的选择。

| 项 | 内容 |
|---|---|
| 原典行段 | 《宋世江湖》`north`/`qian-kun` 相关附卷（ compatible addition：新访谈对白是合规的作者材料，不是逐字原典 —— `docs/evidence/v6/heng-north-notes-content-audit.json` 同一口径） |
| 游戏作品 | 《三师一枪 · 笔记》（`north-notes`，注册版 `north-notes-1.0.0`） |
| 实际走到的 beat IDs | `nn_two_books_1..`、`nn_different_pupils_1..`、`nn_not_same_scale_1..2`、`nn_qin_visit_1..`、`nn_sima_visit_1..`、`nn_notes_remain_1..4`（完整 trace 见 `docs/evidence/v7/fact-beat-trace.json`） |
| 病灶（机器判） | `scripts/audit-v7-orphan-vars.mjs`：`nn_scale` / `nn_open_questions` / `nn_three_names` / `nn_person` 四个 `VAR` 被选项赋值但从未被任何条件读取 —— **问完即止** |
| 本轮 diff（真源 `story/north-notes-author.mjs`） | ① `nn_open_questions` → 六合馆段（秦天岳在场）：页边留问的人**当面把那个问题问出口**，留实事的人把「三年才懂一点」补在实事旁（1 拍，`y|` 玩家复述）；② `nn_scale` / `nn_three_names` → 太极茶廊段（司马天岳在场）：司马翻到终南旧页，评页边怎么排、并让玩家复述秦的话（2 拍，NPC 开口）；③ `nn_person` → 装订段：**条件变体替换原旁白行**（不添无选择拍），写页边留下的是「那一个肩骨不一样的人」还是「那句没数尽的话」。决断 6 / 选项 12 **一个未增** |
| 落点纪律 | 三处 `iff` 全部落在「`part(...)` 之后、该 knot 的 `choose(...)` 之前」（§6.0 的不可达陷阱不复犯）；装订场无活人在场，回响用替换式而不是追加式（§6.5 的自我回归教训） |
| 复测（单元） | 拍数 **69 → 77**；`speaker:you` **14 → 18**；NPC 发言 **26 → 28**；旁白占比 **42.0% → 40.3%**；孤儿变量 **4 → 0**（全库 202 → **198**）。`tests/qian-kun.test.ts`（64 路径全遍历、选项 12、最长被动 ≤18、秦与司马不同场）等 5 个文件 **42/42**；全量 `npm test` **297/297**。preservation 基线（`docs/evidence/v6/*preservation*.json` 中的 `story/north-notes.ink` 与 `src/generated/north-notes.json` 哈希）随**有意改动**同步更新——这与 §7.1 记录的 `production-direction-v6.mjs` 意外破坏不同：那是不该动的文件被碰，这次是对该篇的有意修改，基线随之前进 |
| 浏览器 | `tests/heng-art.spec.ts` / `tests/north-editorial.spec.ts` / `tests/qian-kun.spec.ts`（north-notes 页面与锁定逻辑在内）：在 SW 修复后单独复跑通过（见 §6.13 与 `e2e-retry-*.log`） |
| 尚存问题 | 本篇仍是**一次定向改写，不是三轮审读**。九篇缺三轮至此全部至少有定向改写记录；`nn_gun_first`（已有 `iff`）与 `nn_keep`（终局分支）本轮无需改动 |

**末注（如实登记时序）**：本篇的编译与复测**必须**排在全量 E2E 之后 —— `tests/north-editorial.spec.ts` / `tests/qian-kun.spec.ts` 直接 `import ../src/generated/north-notes.json` 与页面比对，E2E 运行中重编译会制造假失败（§0 纪律 3 的同类项）。author 源文件先改、后编译，是刻意的顺序，不是遗漏。

## 6.13 全量 E2E（round6）的诊断与处置：440 通过 / 31 失败，31 条全部归因并处置

> 这是**第一次**有完整的全量 E2E 结果 —— 上一轮报告口径里的「471 项仅完成约 29 项」在本轮兑现为一次 2.5h 的完整运行（`docs/evidence/v7/e2e-full-round6.log`，471 项 = 440 ok + 31 x）。31 个失败逐条诊断，归为四类，**没有任何一条被跳过或含糊**：

1. **产品缺陷（1 条，已修产品）**：`default-entry.spec` root/subpath —— 测试把旧的坏页面塞进 shell 入口缓存（`./`、`./index.html`）后下载《潮生有约》，按篇下载**只刷新按篇清单内的条目**，shell 入口的坏缓存永远不被修复 → 离线打开首页永远是坏页面。修复：`public/sw.js` 的 `cache-work` 处理在按篇刷新后**同批次顺带刷新 `./` 与 `./index.html`**（`tests/offline-work-gate.test.ts` 的 vm 断言同步）。修后 `default-entry` **4/4**。
2. **spec 落后于内容升版（24 条）**：`qingshi`/`kuhe`/`taihua`/`longmen` 现行版已是 **3.0.0（v3 前缀）**、jade 第二卷已是 **2.0.0**、检视页人物数随 catalog 聚合而变 —— 而 `v6-cg.spec`（24）、`short-landscape.spec` 的 qingshi 组（3）、`jade-thieves-editorial-integrity.spec` 封面（1）、`campaign-visual.spec` 的 32（1）仍在用 2.0.0/v1/32。**症状不是猜的**：探针实测存档 `storyContentVersion: qingshi-2.0.0` 对页面 `qingshi-3.0.0`，存档迁移保护拒绝恢复（`data-beat` 恒空）。全部改为跟随现行版/catalog 实时值。
3. **spec 落后于信息架构（1 条）**：`campaign.spec:49` 在 V7 作品库首页找 v5 的「启程 · 青蒲渡」按钮 —— v5 的入口现在在「历史版本与旧存档」面板的「原创旧篇」分区里。改为：导航栏按钮打开面板 → 点「潮生有约 · V5」→ 启程（测试意图是子路径离线可达，不是首页必须印着按钮）。
4. **长跑状态污染（4 条，重跑即过）**：`north-editorial-cold-offline` root/subpath、`qian-kun-editorial-cold-offline` root、`taihua` 离线组两条同类 —— 单独重跑全部通过，2.5h 连跑下 SW/缓存状态互相污染。

**修复后的验证**：`v6-cg` **28/28**；`taihua`+`taihua-v2`+`campaign-visual`+`short-landscape`+`jade-thieves-editorial-integrity` **26/26**；`default-entry` **4/4**；`campaign.spec:49` 通过；north-notes 编译进 dist 后 `north-editorial`+`qian-kun`+`heng-art`+`default-entry` **25/25**（第一次跑此组暴露 dist 未含新 north-notes 的三条失败，重建 dist 后通过 —— 这正是 §6.12 末注所说「编译必须排在全量之后」的镜像：**编译之后也必须重建 dist 才能跑页面测试**）。**这些修复发生在全量运行之后，全量日志本身保留原样作为未修复时的记录。**
