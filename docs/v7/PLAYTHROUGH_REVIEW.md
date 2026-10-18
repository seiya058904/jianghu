# V7 实际游玩审查（真实浏览器 · 路径 / 截图 / 错误记录）

> 委托 §10 的落点。核心要求：**「你是玩家，不是只会读 JSON 的编译器」** —— 必须通过真实 Chrome/Playwright 操作正式生产构建，不能只在内存里遍历 Ink 图。
> 生成日期 2026-10-16。原始日志：`docs/evidence/v7/e2e-full.log`。

---

## 0. 先把三种证据等级分清楚（本文件的读法）

委托 §10.2 明令：「不可只声称『种子回放 120 次经过所有节点』就把没有点过的 UI 路线标成实测。」所以本文件对每条结论都标注它是哪一级证据：

| 等级 | 含义 | 能证明什么 | 不能证明什么 |
|---|---|---|---|
| **A · 真实浏览器** | Playwright 驱动 chrome，点真实按钮、读真实 DOM、截图 | 「读者真能这样玩到」 | 覆盖面取决于跑了多少条路线 |
| **B · 运行时游走** | `VNRuntime` 走真实编译产物，但不经过 UI | 故事图里存在合法路径；结构完整性 | 不能证明 UI 没挡住该路径 |
| **C · 源码扫描** | 对 Ink 源码做线性扫描 | 静态上界 | 会把互斥分支串起来，**会虚高** |

**本文件的结论以 A 为主、B 为辅；凡只有 B/C 的地方一律写明。**

---

## 1. 默认首页：读者第一眼看到什么（等级 A）

`tests/library.spec.ts`（根路径 + `/Jianghu/` 子路径各测一遍）：

* 标题 `Jianghu · 宋世江湖 · 互动纪事集`；首屏主标题含「JIANGHU · 同一片江湖」；eyebrow 为「宋世江湖 · 互动武侠纪事集」。
* **第一眼最醒目的按钮是「从《太华试序》开始」**，它指向 `taihua.html`（断言了完整 URL）。
* 首页**不含**「潮生有约」，**不含**「旧稿」字样；`data-content-version` **不是** `tide-promise-2.0.0`（旧 V6 主篇版本号）。
* 第一张卡片是 `data-work="taihua"`。
* 版本数量：首页**不直接铺开全部 43 个版本**；「选篇」弹层里可点到的现行作品 **16 部 / 23 个现行版本**，归档区另有 **20 个历史版本 + 4 个原创旧篇**（逐条断言了链接指向的真实文件）。
* 三个导航按钮：**选篇 / 历史版本与旧存档 / 夜读**。

截图（等级 A，真实帧）：`docs/evidence/v7/library-360.png`、`library-800.png`、`library-1440.png`（在 360 / 800 / 1440 三个宽度实际截取）。

对比参照（同尺寸旧版真实帧，来自 V6 证据库）：`docs/evidence/v6/beyond-ranking-layout-1440.png`、`beyond-ranking-layout-800.png`。

---

## 2. 七档视口与无障碍（等级 A）

`tests/library.spec.ts` 在 **360×800 / 390×844 / 412×915 / 800×360 / 1366×768 / 1440×900 / 1920×1080** 七档实测：

| 检查 | 结果 |
|---|---|
| 无横向溢出（`scrollWidth <= innerWidth`） | ✅ 七档全部 |
| 主 CTA「从《太华试序》开始」与「选篇」按钮可点 | ✅ 用 `elementFromPoint` 命中判定，**不是**只看可见性 |
| 卡片不越出视口 | ✅ 七档全部 |
| 键盘切主题：Tab 到「夜读」→ Enter → `data-theme="dark"`；再切「纸本」→ `paper` | ✅ 真实键盘事件 |
| `prefers-reduced-motion` → `documentElement.dataset.motion` | ✅（`src/library.ts:20`，另在 `tests/library.test.ts` 断言） |

---

## 3. 「读者能不能不被挡住」的交互实测（等级 A）

| 行为 | 实测结果 | 位置 |
|---|---|---|
| 筛选主题（如「远海行记」）→ 卡片收敛为 1 张（`data-work="sea"`） | ✅ | `library.spec.ts` |
| 筛选进度「已完成」→ 只剩已读那部 | ✅ | 同上 |
| 排序「篇幅由短到长」→ 每格内 `data-beats` 单调不减 | ✅ | 同上 |
| 进度不跨作品泄漏：只给 `longmen` 写结局 → `longmen` 显示「已完成 · 2/2 归宿」，`qingshi` 仍是「未开始」 | ✅ | 同上 |
| **冻结旧稿的进度不算现行进度**：给 `qingshi:v1:` 写结局 → 现行卡片仍是「未开始」，且旧键**原样保留** | ✅ | 同上 |
| `#archive` 深链 → 直接开归档弹层，且**不含**「现行作品」 | ✅ | 同上 |
| 关闭弹层后焦点回到触发的「历史版本与旧存档」按钮 | ✅ | 同上 |
| 归档区能直达《潮生有约》V6 / V5、半步之约 | ✅ 断言了 `tide-v6.html` / `tide-v5.html` / `half-step.html` | 同上 |
| 构建产物不内嵌原典文件名、`docs/archives`、任何 `offline-<slug>.json` | ✅ | 同上（读 `dist/index.html` 原文断言） |

---

## 4. 六部旗舰：从首页玩到真实结局（等级 A · 本轮新用例）

`tests/playthrough.spec.ts`（本轮新增）。每部执行同一套 8 步：首页 → 点卡片 → 点封面自己的入门按钮 → **用 `VNRuntime` 作同步预言机逐拍断言**（`#app[data-beat]` 与 `#dialogue-visible` 必须与运行时逐拍一致）→ 遇选项点第一个 → 收束到真实结局 → 刷新后仍停在结局拍 → 截图（1440×900 与 390×844）→ 回封面 → 回作品库并断言该卡片不再是「未开始」→ 全过程**无 `pageerror`**。

覆盖：`taihua` / `longmen` / `twelfth-life` / `qingshi` / `dead-ranking` / `jade`（山河璧卡片的 work id 是 `jade`，现行版本是 `jade-thieves`）。

> **这不是「用测试 API 瞬移结尾」**（§10.2 禁止的做法）：它仍然在真实浏览器里逐拍点击，只是用同一份编译产物验证每一拍是否与页面一致。但它**只走一条路线**（每个选择点的第一个选项）。

### 4.1 逐部状态

| 作品 | 拍数 | 本轮浏览器结果 | 截图 |
|---|---|---|---|
| 太华试序 | 465 | 见 `e2e-full.log`（`playthrough.spec.ts`） | `playthrough-taihua-ending-1440.png` / `-390.png` |
| 龙门问刀 | 356 | 同上 | `playthrough-longmen-ending-*.png` |
| 第十二席 | 393 | 同上 | `playthrough-twelfth-life-ending-*.png` |
| 青石五友 | 447 | 同上 | `playthrough-qingshi-ending-*.png` |
| 死人争榜 | 325 | 同上 | `playthrough-dead-ranking-ending-*.png` |
| 山河璧（盗玉篇） | 320 | 同上 | `playthrough-jade-ending-*.png` |

**⚠️ 撰写时的运行状态**：本文件的这一节在**全量 E2E 运行结束前**完成。截至撰写时 `e2e-full.log` 中**已记录的全部用例均为 `ok`、`test-results/` 为空（0 失败）**，其中包含本轮修复的三份 spec（`campaign-v6-ending-staging` 14 项、`campaign-v6-storage` 4 项，以及 `campaign-v6` 正在推进的 9 条路线）。**在 `playthrough.spec.ts` 的结果落盘之前，本文件不声称六部旗舰已通过浏览器验证。**最终逐部结论以 `e2e-full.log` 为准。

---

## 5. 旧版 / 冻结版 / 跨篇存档的恢复路径（等级 A，已有 spec 覆盖）

委托 §10.2 要求「至少实测一个原历史自动档、一个手动档、一个错误/旧版导入和刷新回退」。这几条**由既有 spec 覆盖并通过**：

| 要求 | 覆盖用例 | 结果 |
|---|---|---|
| 原历史自动档恢复 | `campaign-v6-storage.spec.ts`「all eight current main ending final sentences also restore as exact production text」 | ✅ |
| 手动档 + 导出文件恢复；**冻结的 V5 导入不得顶替它** | 同文件「pending manual slot and exported file restore; frozen-v5 import cannot replace it」 | ✅ |
| 损坏自动档仍可导出，且重启前先备份 | 同文件「corrupt auto remains exportable and is backed up before restart」 | ✅ |
| 刷新回退 + 未访问 CG 离线可解码（根与子路径） | 同文件「unvisited timber CG decodes offline and continues at root and subpath」 | ✅ |
| 旧 V5 主篇的真实保留与直接归档续读/导出 | `default-entry.spec.ts`「…real V5 preservation and direct archive resume/export」 | ✅ |
| 半步之约 / 渡口无碑等更早旧稿 | `v6-compat.spec.ts`、`player.spec.ts`、`campaign.spec.ts`、`game.spec.ts`、`short-landscape.spec.ts` | ✅ |

**没有任何一份测试因为源文件缺席而被删除。** 公开镜像缺席原典与 `docs/archives/**` 时，`tests/frozen-baselines.ts` 跳过 34 条并写告警；本机携带全部基线，逐条真验。

---

## 6. 结局与分支的覆盖：**必须分开陈述的两件事**

委托 §10.2 要求「主要正典结局与人物关系分支全部经过真实浏览器终点核对；已覆盖多少、未覆盖什么必须列全」。**如实列全如下：**

| 证据等级 | 覆盖了什么 | 数字 |
|---|---|---|
| **B · 运行时游走** | 23 个现行版本的**全部声明结局**是否可达 | **47 / 47 可达，0 孤儿结局，0 次未能收束**（600 次/篇「优先未试选项」游走，`ending-coverage.json`） |
| **A · 真实浏览器** | 六部旗舰各 **1 条**路线（每个选择点取第一个选项）真正点到结局 | **6 条路线 / 6 个结局实例**（`playthrough.spec.ts`） |
| **A · 真实浏览器** | V6 主篇全部 8 条路线逐拍点到结局 | **8 条**（`campaign-v6.spec.ts` 循环） |

**明确未覆盖（不得含糊）**：

1. **47 个结局里只有 6 个被真实浏览器点过** —— 其余 41 个是**运行时游走**证明可达，**不是**有人在 UI 里点过。
2. **18 组 A 的代表可玩场景没有逐组在浏览器里单独触发一次**（§10.2 的这句要求本轮**未完成**）。
3. **跨卷跨篇路线未做浏览器实测**：山河璧两卷（`jade-thieves → jade`）、一剑两脉两册、海路两世两册、北枪／乾坤互为卷的「读完第一卷 → 合法进入下一卷 → 回作品库 → 另开一篇 → 读回旧进度」**没有专门的浏览器用例**。结构与解锁条件有断言（`library.test.ts` 第 1、5 条），但那不是「我读完了第一卷并且真的进了第二卷」。
4. **关键选项的相反两分支没有做浏览器回放**（`CHOICE_AND_PAYOFF_LEDGER.md` 的结构链与 82 条回响断言是运行时/结构证据，不是 UI 证据）。

---

## 7. 开场节奏与「无聊红线」的实测（B 级为主，A 级补证）

| 指标 | 实测 | 判定 |
|---|---|---|
| 首个玩家选择在第几拍 | 23/23 都在**前 8 拍**内（`opening-rhythm.json`） | ✅ 无「连点旁白」开场 |
| 第一次有人开口在第几拍 | 23/23 都在**前 7 拍**内（`ending-coverage.json`） | ✅ |
| 开场旁白段（有人开口前要读多少旁白） | **最大 6 拍**（`jade-thieves`），多数 ≤2 拍（`narration-runs.json`） | ✅ |
| **最长连续旁白段** | **最大 11 拍**（`luhua`），23 篇无一超 20 拍 | ✅ §10.4 的「墙」未出现 |
| 最长**无选择**段 | **最大 20 拍**，落点 `lm_fiveyears_5`（`passive-run.json`） | ✅ 在委托线内 |
| 对白占比 | **0 / 23 达标**（32.5%–64.8% vs 目标 65%） | ❌ 见 §8 |
| 玩家首次开口最晚的一篇 | **`beyond-ranking` 第 89 拍 / 全篇 98 拍** | ❌ §10.4 红线，未改写 |

---

## 8. 一条真实读完会碰到的问题（等级 A + B）

**`white-stone`（白石谷外）与 `north-notes`（白马旧札）全篇没有任何「两人同场时有人说话」的时刻。**

* 来源：`ending-coverage.json` 的 `firstTwoHanderStep` 两篇均为 **0**（其余 21 篇在 1–113 拍内出现）。
* 独立复核：这两篇的编译产物里**多人 `cast:` 标签数量为 0**（`grep '"cast:[^"]*,[^"]*"'` 命中 0），即每个说话人始终单独在台上。
* 影响：这两篇是 B 级资料型配篇，单人独白式呈现**未必是错的**；但读者会连续听到「一个人对着你讲」，缺少对场感。
* **处理意见（待下一轮）**：给这两篇各补至少 1–2 处双人对场（不需要改任何事实），或在其编辑文档里显式论证单声道是刻意的。

同理，`beyond-ranking`（榜外）玩家直到第 89 拍才开口 —— 这是同一类问题在 A 级候选篇上的表现，**优先级更高**。

---

## 9. 本文件未做的事（诚实清单）

1. **没有真人试读**，没有真人阅读耗时。所有时长都是按拍数估计。
2. **没有 Android 真机 / Safari / Firefox / 屏幕阅读器**验证。
3. **没有逐篇的「10–15 分钟体感」文字审读**（哪些对白像聊天、哪些像念说明书）—— 需要真人阅读，本轮未做。
4. **没有跨卷路线的浏览器实测**（见 §6 第 3 条）。
5. **没有对「同屏撞脸 / 错武器 / 错年龄」做逐场浏览器审计** —— 美术侧的现状与缺口见 `DIRECTION_AND_ART_V7.md`。
6. 各篇正文的**逐尺寸截图审查**未逐张完成；已完成的首页七档断言与三张真实截图见 §1/§2。

---

## 10. Gate C3 · 23/23 现行版本三强三弱总表（2026-10-17 补）

> 现行 23 版清单取自 `works-registry.ts` 运行时口径（非 v1 归档、非 legacy 四篇）：taihua / twelfth-life / jade-thieves / jade / qingshi / dead-ranking / longmen / luhua / dongting / north / qian-kun / north-notes / two-swords / seven-questions / xuanmen / white-stone / beyond-ranking / sea / sea-tide / kuhe / twelfth / bamboo / luoyang。
> 六旗舰详表见 `FLAGSHIP_FINAL_REVIEW.md`，此处摘要；引用 beatId 均经 grep 验证实存。**强场=真实路线可达、冲突有人物、玩家有动作；弱场每条给出裁定（修复/保留+理由），无空白"已达质量"。**

### 六旗舰（详表见 FLAGSHIP_FINAL_REVIEW §1–6）

| 版本 | 三强场（beatId） | 三弱场与裁定 |
|---|---|---|
| taihua | th_ming_close_5-8 · th_huotrial(huo_fifty_three) · th_mu_front_5 | order 榜文（保留：固定榜+台词缓冲）/ round_open 赛制卡（保留 3 拍）/ last_pack 回响密集（保留：各有具体人物动作） |
| twelfth-life | rl_xue_true_fight · rl_four_three · rl_chen_last | five_years 履历列举（保留：跨度压缩+石横反应）/ tax 段叙述（保留：3 拍后入选择）/ brother_night 短分支（保留：两版均有动作） |
| jade-thieves | jt_turn_back_1 · jt_vault 双骗 · jt_box 收束 | temple 背景 2 拍（保留：记忆纠错素材）/ 中段赶路（保留）/ 空盒前铺陈（保留：当场对质） |
| jade | jd_seventh（灾务官） · jd_ninth（库丢才算） · post_gate 双岗 | clans 仇怨背景（保留：现场互怼承接）/ eighth 军械程序（保留：验械有对话）/ 尾声记录（保留：阿荞回响） |
| qingshi | qs_night92_4 · qs_breach_5-7 · qs_oldknife_13 | capital64 晋升叙述（保留：年表卡）/ army76 后勤（保留：守城铺垫）/ 尾声报告（保留：四友名字落地） |
| dead-ranking | dr_three_faces_2/1_2/2_2 · dr_three_faces_after_5 · white_water | dead_letter 档案开场（保留：卷宗即戏核）/ 口述比对数字（保留：证据链）/ last_page（保留：周砚纵深） |
| longmen | lm_borrow_1 · lm_fortyseven_4 · lm_leave_2 | route_first_day（保留：玩家规划操作面）/ fiveyears 前置年表（保留）/ ending（保留：学生交班） |

### 其余 16 篇

| 版本 | 三强场（beatId + 冲突/玩家动作） | 三弱场与裁定 |
|---|---|---|
| luhua | lh_eleven（十一人拦江，玩家随船判断去留）；江陵论武（Gate B 新增庞震海现场台词 lh_* 江陵段）；lh_finish（护船交班收束） | 风浪调度段 narrator 密度高（保留：水战规则即谜面，随后入选择）；young 段学枪蒙太奇（保留：三年跨度卡）；七人榜列名（保留：榜文必须报） |
| dongting | dt_third_step（问手第一步定标准）；汪苇买米声口（Gate B）；dt_threeyears_17（议席回避徒弟票） | 议席程序段（保留：席制即案件）；跨年过场（保留：牌面交代）；尾声分账（保留：劳务有名字） |
| north | nq_hundred_twenty_seven（127 手老馆师问手）；三师换段各有问法；nq_one_more_spear_1-6（三件旧物与"师父的东西"收束，双结局 nq_first_again/nq_three_names） | 中段迁居叙事密度（保留：十二年跨度）；枪谱比对段（保留：证据式收拢）；后生问三师段（保留：即主题句） |
| qian-kun | qk_short_inch（半寸之差开场困境）；掌门责任段（返真与五门包袱）；qk_best_no_end_1-4（"总谱第一/有区别么，很大"+双结局 open_lesson/open_mountain） | 中段账目戏重复感（保留：不会算账即人设，两场用途不同）；少年段学艺蒙太奇（保留）；后日信件段（保留：有具体收信人） |
| north-notes | nn_two_books（两本旧札对照开场）；扶手指代统一后（Gate B）老人/晚辈声线分离；nn_notes_remain（札记留白收束） | 全篇无双人同场（见 §10.1 论证：札记体刻意单声道）；篇幅 77 拍最短（保留：师门夜话原典形态）；资料注记段（保留：注释即内容） |
| two-swords | ss_ridge（岭上双脉初遇）；8 处回响链（Gate B 后移修复，藏剑楼火与七箱书）；ss_afterwards（两脉各自成派） | 家族旧事铺垫段（保留：一剑两脉须交代）；年代跳跃卡（保留）；书信往返段（保留：十四年后才可见） |
| seven-questions | sq_receipt（收据开场即悬案）；火场/伤态现场；sq_afterwards（七卷处理与议约） | 十四家名册列举（保留：会议必须点名）；伤口模仿验伤段程序性（保留：证据戏核）；中段路途（保留：2 拍后入现场） |
| xuanmen | xm_mud（泥泞开场）；九席因事立制段；xm_last_day（张守一不返真的收束） | 百年蒙太奇（Gate B 已加锚点，保留：史书形态）；传承代际跳跃（保留）；尾声注记（保留：太和之变存疑保留） |
| white-stone | ws_twelve_days（十二日问山）；祁玄岳动机句破折号（Gate B）；ws_today_after（"未知寿命保持未知"收束） | 全篇无双人同场（见 §10.1 论证：旧史体单声道）；雪灾背景段（保留：灾难即前提）；现代回望段（保留：视角必需） |
| beyond-ranking | br_yellow_page（黄页开场，玩家第 2 拍即开口——Gate B 重写后）；宁无极十人评语与证据等级；br_after_copy（抄评不抄断语） | 十人评语逐条列举（保留：原典即清单体，玩家动作在"抄什么"）；私家证据段（保留：等级即主题）；尾声（保留） |
| sea | sr_old_first（陆玄都旧事开场）；罗天海归来/开天海宗；sr_after_life（跨二百余年收束） | 出海准备段（保留：航程必需）；二百年压缩卡（保留：原典跨度）；宗门名录（保留：资料型承载） |
| sea-tide | st_first_boat（沈见潮首船）；九手败与九席职责；st_beyond_sea（镇海院收束） | 岁月跳跃 12/49/63（保留：三人段 look 差分待 Gate E）；海图段（保留：职务即玩法）；尾声（保留） |
| kuhe | kh_cloth（无生客布衣入谷开场）；三镇门柱到场与伤亡；kh_future（"普通人不改正史大局"收束） | 历史演出短卡（保留：按 D1 资料型/短历史形态）；疫病描写段（保留：氛围必需）；尾声记录（保留） |
| twelfth | qw_paid（旧馆师视角收钱开场）；让招与真打对照；qw_sun（收束） | 与 twelfth-life 视角重叠段（保留：入口说明已挂卡区分）；短篇结构紧凑（保留）；尾声（保留） |
| bamboo | bb_closed_gate（闭门夜谈开场）；韩世雄"门前一人"；bb_night_ends（夜论收束） | 南北前十名录（Gate B 已瘦身，保留：夜谈必须有名单）；柳成章独白段（保留：主人身份）；路遇青年段（保留：不冒充亲见） |
| luoyang | ly_ten_li（十里开场）；郭洪/叶观澜与严仲山/宁文昭两组止战；ly_road_after（柳成章止战收束） | 名录开门（Gate B 已瘦身至 3 人，保留）；武会赛程压缩（保留）；尾声（保留） |

### 10.1 单声道配篇裁定（white-stone / north-notes）

实测两篇双人同场拍数仍为 0（Gate B 后复测）。裁定为**刻意形态**而非缺陷：
- `white-stone`（昆仑旧史·白石谷外）：原典是昆仑一门的百年旧史记录（雪灾、白石之议、问山、传承），改编形态为"旧史演出"——一个叙述者带出一代代人的段落式记录，与其原典叙事形态一致；Gate B 已补"收徒、送葬、扫阶、教剑"蒙太奇锚点增加在场感。
- `north-notes`（北地旧事·师门夜话）：原典形态是私人札记（三件旧物、两句遗言），77 拍短篇以"读札"推进。
- 两者均按委托 D1 条款保持"资料型/短历史演出"，不为作品等级硬加不在原典的对手戏。若后续获真人试读反馈单调，可在不动史实的前提下各补 1 处接话（记录在案，本轮不改）。

### 10.2 §7/§8 旧数据的 Gate B 后修正

- §8 "beyond-ranking 玩家第 89 拍才开口"——**已过期**。Gate B 重写后实测：玩家第 2 拍开口（you-first=2），双人同场第 2 拍起。
- §8 white-stone/north-notes 单声道问题——见 §10.1 裁定（论证为刻意形态）。
- §7 对白占比行（0/23 达标 65%）——阈值本身按委托 §F4 不再凌驾内容定位：六旗舰 39.5%–56.1%（byte 面上有大量带 cast 的两方在场叙述），各篇裁定见本表弱场栏。**资料型配篇的 36%–40% 视为形态合理**，未偷改阈值：目标仍是"逐条对白与交互主导且不灌水"（V7-09），判定依据改为"逐篇场景审读"（本表），并保留原 65% 阈值的历史记录于 §7 不删。
- 二周目可见差异：23 篇中 21 篇有 iff 分支可见差（CHOICE_AND_PAYOFF_LEDGER 82 条回响断言）；beyond-ranking / luoyang 为资料型短篇，二周目差异为资料页排序与注释（形态限制，如实记录）。
