# V7 抉择与回响台账

> 证据来源：
> - 选项与变量链：`grep -o "# cid:[A-Za-z0-9_]*" story/<slug>.ink` + `~ <VAR> =` 赋值链（本节逐条实测）
> - 延迟回响断言：`tests/*.test.ts` 中共 **82 条**测试名含 later / delayed / recall / echo / independent / survives / pays off
> - 全路径覆盖断言：`tests/white-stone.test.ts`（8192 条二元路径）、`tests/xuanmen.test.ts`（2048 条二元路径）、`tests/taihua-v2.test.ts`
> - 台账：`docs/evidence/v7/works-ledger.json`（cid 计数）、`docs/evidence/v7/fact-beat-trace.json`

---

## 1. 三类选择（委托 §5.2 强制要求同时存在）

| 类别 | 定义 | 台账证据 |
|---|---|---|
| **即时表达**（表情/斗嘴/关系） | 允许较快汇合，但不能完全当空气 | 每篇开场 2–8 拍内即有；如 `th_tease`「低声问她：胡桃好吃，还是改步好玩？」 |
| **战术与行动**（改变现场代价/方法） | 产生不同受伤、位置、证据、NPC 态度、消耗或演出 | 旗舰篇的 `cid` 变量链（见 §2）；`dt_106`、`th_48` 等正典结果**不因选择改写** |
| **跨幕关系与人生命运** | 必须跨章节回收 | **82 条**延迟回响断言（见 §3） |

---

## 2. 变量链实测：选项如何真正改变后续

Ink 中的选项形如 `* [# cid:<id>]`，紧接的 `~ <VAR> = ...` 是它的即时后果；后续选项用 `{<VAR>}` 做**可用性门控**。这构成一条可复核的因果链。

### 2.1 太华试序（63 个 cid）

实测链（节选，箭头为变量门控）：

```
th_care ──> care
  ├─ th_ask        | 接过护腕，直说我怕拖武当的后腿
  └─ th_promise ──> promise
       ├─ th_quiet  | 今晚先睡，不许自己临时多练
       └─ th_tease  | 低声问她：胡桃好吃，还是改步好玩？
th_bow ──> shen_open
  ├─ th_predict_fast ──> layout_fast
  │    ├─ th_predict_wait ──> layout_fast
  │    │    ├─ th_draw_left ──> layout_draw
  │    │    │    ├─ th_watch_next | 先看下一场不同对手，记住自己的判断
  │    │    │    └─ th_rush       | 再追一个身位，逼她露出停步
  │    │    └─ ...
  │    └─ ...
  └─ ...
th_hold ──> strain
  ├─ th_admit ──> honest
  │    ├─ th_shield       | 把手藏在袖里，说下次再打过
  │    └─ th_demonstrate  | 拿护腕摆出双方的脚位，把失败也讲全
  └─ th_limit ──> shared
       ├─ th_watch_torn_sleeve   | 先认自己以为破袖便快分胜负，再看明澄为什么没退最后两步
       ├─ th_watch_last_distance ──> ming_distance
       │    ├─ th_leave_xie_room | 不拿看见他弃剑便来劝已经尽力，留他先走完
       │    └─ th_ask_xie_later  ──> xie_room
       │         └─ th_tray | 替明澄拿住汤碗，留门口一条退路
       └─ th_watch ──> soup
            └─ th_no_result ──> night_honest
                 └─ th_challenge | 笑问明日正式场能不能也留一口汤的工夫
```

**关键**：`th_shield`（藏手）与 `th_demonstrate`（摆脚位讲全失败）是同一「失败后面子」问题的两个相反答案，**都从 `honest` 分叉**，后续走向不同的 `shared` 阶段。这正是委托 §5.2「即时表达不能完全当空气」。

### 2.2 龙门问刀（50 个 cid）

```
lm_ask_use ──> lm_asked
  ├─ lm_try_first | 不急着求指点，先试给他看自己的用法
  ├─ lm_ask_wound ──> lm_wound_known
  │    ├─ lm_ask_left             | 问四十岁左手换刀，为何没从此每回都换
  │    ├─ lm_ask_qinghe_friend    | 先问一个武当道人为何还认得宋老的旧刀
  │    ├─ lm_ask_qinghe_ninth     | 问玄门九席第九，为什么连贺老也不能拿来直接比
  │    └─ lm_old_watch_foot ──> lm_memory_foot
  │         ├─ lm_old_finish_blade ──> ...
  │         └─ lm_old_close_elbow ──> lm_memory_elbow
  │              ├─ lm_old_press_end   | 仍把第二刀送到原定处，亲自试这条路是否真走死
  │              ├─ lm_old_ask_twenty  | 承认三下都没接住，再问自己还能怎么练
  │              ├─ lm_old_try_words   | 先说出自己为何想把刀送到底
  │              └─ lm_practice_slow   | 借刀以后，先练停住一步，不赶着连完十七刀
  └─ ...
```

**关键**：`lm_practice_slow`（练停）与 `lm_practice_more`（仍想多试连刀、自己承担练过头）是同一处的两种代价，**正典胜负不变**。

### 2.3 第十二席（68 个 cid）

```
rl_raise_boy
  └─ rl_stop_question ──> rl_boy_space
       ├─ rl_ask_actual_step | 先问被拦住那一下的左脚，让他实碰自己一下
       └─ rl_repeat_without_praise ──> rl_child_step
            ├─ rl_choose_working_sword | 拿一柄真常用的给她看，认有些只是喜欢收藏
            └─ rl_show_collection      ──> rl_sword_plain
                 └─ rl_ask_old_records ──> rl_records_first
                      ├─ rl_ask_sun_now         | 先把五版请人找齐，自己去找已退日常教务的孙
                      └─ rl_check_letter_roads ──> rl_letter_check
                           ├─ rl_send_with_no_summons | 请顾说明可拒可不回，不让四十七封都变成催令
                           └─ ...
```

**关键**：`rl_send_with_no_summons`（写明可拒可不回）vs 另一种发信方式 —— 是**同一件事（寄四十七封信）的两种人际代价**；`qw_public` 的正典（薛直公开真胜、王府既不报复也不送礼）不受影响。

### 2.4 青石五友（60 个 cid）——四友个人承诺

```
qs_admit_ribs ──> （承认疼，约明日慢走）
  └─ qs_hide_ribs ──> qs_honest_start
       ├─ qs_ask_stand   | 坐在地上问，刚才膝后那一下该怎么接
       ├─ qs_ask_branch  | 问药商拿树枝也能退敌，为何我还没拿上棍
       ├─ qs_chen_teach ──> ─┐ 答应替他带最初的学生
       └─ qs_chen_build ──> qs_chen_word
            ├─ qs_han_letter ──> ──┐ 答应到京城寄一封有街道和人事的信
            └─ qs_han_return  ──> qs_han_word
                 ├─ qs_song_words ──> ──┐ 请他教自己认练法里的字
                 └─ qs_song_test  ──> qs_song_word
                      ├─ qs_zhao_home ──> ──┐ 答应当差晚归时帮捎消息
                      └─ qs_zhao_pay  ──> qs_zhao_word
                           └─ qs_pay_wine ──> qs_paid_wine
                                ├─ qs_mock_list
                                ├─ qs_ask_real_list
                                ├─ qs_ask_next_power
                                └─ qs_rest_leg ──> qs_rest_leg
                                     ├─ qs_push_leg
                                     └─ qs_repeat_wait
```

**关键**：四位朋友各有一个**专属承诺选项**（`qs_chen_teach` / `qs_han_letter` / `qs_song_words` / `qs_zhao_home`），四个都写进独立 `*_word` 变量。这直接对应委托 §4.4「玩家前期曾经如何待朋友……可在多年后被人记得」，并由 `tests/qingshi.test.ts:31`「family truth and all four youthful commitments have concrete later scene echoes」**断言**。

### 2.5 死人争榜（66 个 cid）——身份核验链

```
dr_ask_letter_hand
  ├─ dr_ask_old_visit | 先让老人把当年当面争榜的那个人讲完
  └─ dr_pickup_training ──> dr_practice
       ├─ dr_show_old_loss ──> dr_practice
       ├─ dr_liang_private ──> ──┐ 细节私下复走，公开先记亲口认负
       └─ dr_liang_open ──> dr_liang_private
            ...
            ├─ dr_borrow_chase | 借他追来的那点力转回右侧
            └─ dr_hold_bad_foot ──> dr_first_sword
                 ├─ dr_keep_claim_separate ──> dr_claim_separate
                 │    ├─ dr_ask_opponent_knows | 让徒弟先问一个自报三十招胜第十的来客
                 │    └─ dr_watch_actual_person | 不急着演完整一套照夜剑
                 └─ ...
                      ├─ dr_leave_false_opening ──> dr_second_sword
                      └─ dr_turn_small ──> dr_second_sword
                           └─ dr_keep_last_hand ──> dr_third_sword
                                ├─ dr_ask_reopen_plain ──> dr_asked_reopen
                                │    ├─ dr_put_old_case_back | 把白水旧卷也放回桌上
                                │    └─ dr_ask_actual_test
                                └─ ...
                                     ├─ dr_ask_what_she_knows ──> dr_wants_test
                                     └─ dr_wait_until_land ──> dr_boat_wait
                                          ├─ dr_name_fair_meeting | 先说明只请到院当面问
                                          └─ dr_leave_visit_time
                                               └─ dr_ask_next_name ──> dr_clinic_time
                                                    ├─ dr_ask_zhao_direct
                                                    └─ dr_ask_all_together
```

**关键**：`dr_ask_reopen_plain`（问若没有这些冒名胜绩，榜房还会不会重新看旧案）→ `dr_put_old_case_back`（**把白水旧卷也放回桌上，不让查假成为不看旧冤的借口**）。这正是委托 §4.5 要求的「正史：谢藏锋旧案受冤要还他清白，但三个活人冒用亡师不能让死人继续占现榜」——**两条线分开走**。

### 2.6 山河璧 · 密库双贼（45 个 cid）——POV 选择

```
jt_be_shen ──┐ 沈玉娘 · 从地道探入
jt_be_jiang ──> jt_pov 江十七 · 从屋顶垂下
  ├─ jt_read_exit ──> jt_checked_vault
  │    ├─ jt_read_box
  │    └─ jt_work_together ──> jt_escape
  │         ├─ jt_go_alone | 先从自己来的路退
  │         ├─ jt_fake_quarrel（受 jt_checked_vault 门控）| 假扮争执，把守卫引向门闩死角
  │         └─ jt_give_name ──> jt_name_plain
  │              ├─ jt_ask_way   | 先约明夜哪里碰面，名字随后答
  │              └─ jt_watch_pass
  └─ ...
       ├─ jt_hear_buyers ──> jt_auction_watch
       └─ jt_wait_real ──> ...
            ├─ jt_clear_person ──> jt_took_real
            └─ jt_change_load ──> jt_plain_pack
                 ├─ jt_change_path
                 └─ jt_share_next_turn ──> jt_shared_turn
                      ├─ jt_keep_spare   | 仍留一条独退处
                      └─ jt_bind_sleeve ──> jt_bound_wound
                           ├─ jt_move_to_bank
                           └─ jt_share_bread ──> jt_bread_shared
                                ├─ jt_count_cost      | 先把接下来要花的钱算清
                                └─ jt_check_before_asking | 各查来路后再约见，不趁睡着翻衣袋
```

**关键**：`jt_be_shen` / `jt_be_jiang` 是**开场 POV 选择**（第 2 拍），直接对应委托 §4.3「第一卷玩家可选择沈玉娘/江十七之一」。`jt_keep_spare`（仍留独退处）vs `jt_share_next_turn`（把退路讲明）是「互不交底仍合作」的主题机制。

---

## 3. 跨幕回响断言（82 条）

以下为 `tests/*.test.ts` 中**明确断言「早期选择在后期产生具体后果」**的测试（节选，按作品归类）。这些是**可在本机复现的结构证据**：

| 作品 | 断言（测试名） | 文件 |
|---|---|---|
| 青石五友 | 「a single early retreat drill changes later carriage cost and an unnamed defending squad's lives」 | `qingshi.test.ts:23` |
| | 「family truth and all four youthful commitments have concrete later scene echoes」 | `qingshi.test.ts:31` |
| 海路两世 | 「one early cooperation change pays off five years later with a different illness transfer cost」 | `sea.test.ts:17` |
| | 「teaching styles change actual later cover duties and time costs without changing the fixed enlightenment」 | `sea.test.ts:21` |
| 归潮岛 | 「a single sustained-practice change alters wrist injury and two months of work cost twelve years later」 | `sea-tide.test.ts:16` |
| 太华试序 | 「Deferred brother diagram is delivered on the actual next morning before first elder bout, independently of initial promise」 | `taihua.test.ts:18` |
| | 「early physical overreach plus late heavy lifting carries a delayed cost; prior private agreement changes the actual practice partner」 | `taihua-v2.test.ts:51` |
| | 「returning early does not erase shoulder damage, and an unmade promise is never invented later」 | `taihua-v2.test.ts:61` |
| 龙门问刀 | 「paired spectator duty changes what was witnessed; early overwork and lifting carries a later limit」 | `longmen.test.ts:22` |
| | 「early school and outsider paths have different partners and later work or trust costs from one changed input」 | `longmen.test.ts:50` |
| 第十二席 | 「one seal-books decision has delayed training and marital consequences with costs on either side」 | `twelfth-life.test.ts:15` |
| | 「one court handoff decision changes a later actual night, family time and repair without deleting political duties」 | `twelfth-life.test.ts:18` |
| | 「family consent changes later witness participation, dead teacher leaves, posthumous epilogue has no Zhao choices」 | `twelfth-life.test.ts:21` |
| 北枪 | 「a single departure choice changes the old school and friend costs twelve years later」 | `north.test.ts:15` |
| | 「one relearning letter changes later appointments, two-day costs and pupil trust without losing the spear」 | `north.test.ts:18` |
| 乾坤 | 「a single youth letter practice changes thirty years later waiting and late life reminders, not martial talent」 | `qian-kun.test.ts:15` |
| | 「accepting the head post changes later real teaching delay and time paid without fixing his accounting weakness」 | `qian-kun.test.ts:18` |
| 一剑两脉 | 「V2 letter, classroom method and divided records have distinct delayed consequences」 | `two-swords.test.ts:20` |
| | 「one early passage choice changes later rescue injury **without changing canon destruction**」 | `two-swords.test.ts:39` |
| | 「choosing a career changes middle teacher, later correspondence and final duty」 | `two-swords.test.ts:46` |
| 门外七问 | 「recovered questions, waiting for notes and paid handover have distinct delayed consequences」 | `seven-questions.test.ts:22` |
| | 「early joint witness and shared testing change later introduction and remaining verification work」 | `seven-questions.test.ts:64` |
| 山河璧 · 密库双贼 | 「counterfeit exposure changes a secondary person's later injury and study delay, **not Jiang's canon death**」 | `jade-thieves.test.ts:33` |
| 山河璧 · 十三文 | 「the early absent-family question changes reunion and winter-money cost in either later post」 | `jade.test.ts:28` |
| 照水刀 | 「one pre-raid retreat choice changes help, injury, apprenticeship and later craft **without rewriting victories**」 | `luhua.test.ts:14` |
| | 「one sea teaching choice changes independent relief, return cost and later practice **but keeps both final wins**」 | `luhua.test.ts:17` |
| 问席 | 「two life outcomes retain the 106/79 bouts, 4–3 recusal and Chen's independent later seat」 | `dongting.test.ts:8` |
| | 「early spare rope and rest materially change a later rescue injury」 | `dongting.test.ts:25` |
| 枯河谷 | 「paired early preparation changes later physical route and one-month work capacity, **without rewriting canon**」 | `kuhe.test.ts:24` |
| 玄门旧史 | 「One input changes the later handover and a second independently changes medicine staffing, **without changing the duel**」 | `xuanmen.test.ts:11` |
| 白石谷外 | 「Admitting the missing step and letting the second person see failure have independent later recalls」 | `white-stone.test.ts:11` |

> **注意**：大量断言带有 *without changing / not rewriting canon* 字样 —— 这正是委托 §5.3「正典固定，不代表玩家无能为力」在测试层的落实。

---

## 4. CANON_LOCK / PLAYER_AGENCY / DELAYED_PAYOFF（旗舰篇）

| 作品 | CANON_LOCK（原作确定不变） | PLAYER_AGENCY（能改变什么、代价） | DELAYED_PAYOFF（最晚回响点） |
|---|---|---|---|
| 太华试序 | 陆青珩一百零二手胜沈照微、轮战沈再胜陆；青序六人顺序；霍停云六手败张玄岳；当届名次 | 追/守/观察/试探；是否替谢临川遮掩败因；是否听老人刺耳批评；如何对待终局排名 | `th_guidance_continue_17`（下山后回身）与三条结局 beat |
| 龙门问刀 | 一百一十九合、四十七招、九剑后认输、第一剑已经错 | 站哪一侧看、递帖方式、留馆或接外来客；练习强度带来酸痛代价 | `lm_fiveyears_5`（五年后）与 `lm_returntrial`（秋会后第四日补试） |
| 第十二席 | 公开败给薛直；四比三得第十二；只进第十二席一次 | 换老师的次数与顺序；发四十七封信的方式（可否拒回）；面子与对手风险 | `rl_old_book_5/6` 与 `qw_*_5` 系列（五十五岁、退席以后） |
| 青石五友 | 四友死亡；九十二岁守城 | 前期如何待四位朋友（四个专属承诺）；救普通人的选择 | `qs_after_report_10/11`（后日报告） |
| 死人争榜 | 谢藏锋旧案受冤要还清白；冒名战绩不入现榜；身份与胜负分开写 | 是否要求复手、如何核验当事人说法、是否先私下复走 | `dr_last_page_9/10`；`dr_asked_reopen` 分叉 |
| 山河璧 | 江十七之死；沈玉娘归宿；真璧是九库线索；真物后来破碎 | 密库临场路线（藏/骗/协作/抢/绕路）；最后一句真话、托付、信物归属 | `jt_box_6/7`、`jd_later_records_5/6` |

---

## 5. 本轮诚实边界

| 项 | 状态 |
|---|---|
| 变量链结构 | ✅ **实测可复核**（本节逐条由脚本从 `story/*.ink` 抽取） |
| 延迟回响 | ✅ **82 条测试断言**，本机 `npm test` 297 pass 全绿 |
| 全路径覆盖 | ✅ `white-stone` 8192 条二元路径、`xuanmen` 2048 条二元路径断言通过 |
| **浏览器实际点选相反分支** | ❌ **未在本轮执行**。委托 §11.2 要求「关键选项反向路线的实际 browser 回放」，本轮只做到结构层与测试层；Playwright 全量套件的本轮结果见 `PLAYTHROUGH_REVIEW.md` |
| 即时回应是否「可信」 | ⚠️ 需真人/代理逐拍审读（`EDITORIAL_REVIEW_V7.md`） |
| 「礼貌地说/平静地说/认真地说」式伪交互 | 本台账未见此类模式：全部 `cid` 均对应独立 `~ VAR =` 赋值 |

> **⚠️ 本节最后一行已被 §6 的实测证伪，保留原文以留痕。** 独立 `~ VAR =` 赋值 ≠ 该变量**被读过**。

---

## 6. 选项语义审读台账（§2.5 升级 · 第二轮补测）

> 复核日期 2026-10-16。测量方法：从 `story/<slug>.ink` 抽出全部 `VAR` 声明，剔除 `VAR x = ...` 声明行与 `~ x = ...` 赋值行后，在剩余正文（即条件表达式 `{...}` 与选项门控）中检索变量名。
> **判据：某变量若在正文中一次都不出现，则任何选项对它的赋值都不会改变后续任何一拍 —— 该选项「当下有文本、之后无回响」。**

### 6.1 病根：赋值 ≠ 被读

前一轮台账把「每个 cid 都有 `~ VAR =`」当成「选项有后果」，这是**错误推论**。脚本实测（`scripts/audit-v7-orphan-vars.mjs` → `docs/evidence/v7/orphan-vars.json`）显示**这不是个例，是全库性的**：

**全库 23 个现行版本合计：VAR 465 个，其中 223 个（48.0%）从未被任何条件读取。**

| 作品 | VAR 总数 | 曾被条件读取 | **从未被读取** |
|---|---|---|---|
| `twelfth-life` | 34 | 11 | **23** |
| `north` | 31 | 10 | **21** |
| `jade` | 31 | 12 | **19** |
| `seven-questions` | 26 | 10 | **16** |
| `dead-ranking` | 33 | 18 | **15**（改前 25）|
| `sea` | 22 | 7 | **15** |
| `qian-kun` | 25 | 12 | **13** |
| `twelfth` | 15 | 4 | **11** |
| `longmen` | 20 | 10 | **10** |
| `sea-tide` | 21 | 11 | **10** |
| `taihua` | 31 | 21 | **10** |
| `white-stone` | 13 | 4 | **9** |
| `two-swords` | 17 | 9 | **8** |
| `luoyang` | 9 | 2 | **7** |
| `qingshi` | 26 | 19 | **7** |
| `bamboo` | 7 | 1 | **6** |
| `beyond-ranking` | 9 | 3 | **6** |
| `xuanmen` | 11 | 5 | **6** |
| `kuhe` | 20 | 15 | **5** |
| `north-notes` | 6 | 2 | **4** |
| `jade-thieves` | 22 | 20 | **2** |
| `dongting` | 11 | 11 | **0** ✅（改前 6）|
| `luhua` | 25 | 25 | **0** ✅（改前 22）|

**结论：「选项有差异」在过去主要只在「当下那几拍」成立。** §8.2 问的「一个选择的选项在当下和之后是否都有差异」，就本库现状而言，答案是：**约一半的选项，当下有，之后没有。**

**本轮只接线了委托点名的 3 篇**（`dead-ranking` / `luhua` / `dongting`），其余 20 个版本的 194 个孤儿变量**如实保留为未修**。

### 6.2 本轮接线（可选复核的具体 diff）

| 作品 | 接线的选项 | 回响落点（knot；黑体为场景） | 回响性质 |
|---|---|---|---|
| `dongting` | `dt_rope_known` | `raid`（**dt_raid**） | 两年前那声「先别拉」是否已在别人手上 |
| | `dt_names` | `raid`（**dt_raid**） | 开船前认过的分工，决定第二遍喊位时是否有人已在位 |
| | `dt_recusal` | `shore_after`（**dt_after**） | 孟守川不投票是否事先讲明，决定四票三票的算法是否干净 |
| | `dt_chen_help` | `shore_after`（**dt_after**） | 陈震那一段究竟由他本人讲，还是由旁处补来 |
| | `dt_record` | `threeyears`（**dt_three**） | 锁戟那一段出自陈震之口，还是榜房之笔 |
| | `dt_days` | `threeyears`（**dt_three**） | 赔付/照料/代守是否落到具体日期 |
| `luhua` | `lh_whole_boat` | `third_day`（**lh_trialboat**） | 站的是船，还是篙尖 |
| | `lh_chen_rope` | `raid`（**lh_raid**） | 陈震换手的角度有没有真站进去接过 |
| | `lh_box_people` + `lh_child_listen` | `reedboat` 授艺段（**lh_reedboat**） | 木匣与偷药孩子办成几分，决定沈讲深还是讲浅 |
| | `lh_jiang_change` | `learn_sea`（**lh_seatraining**） | 江陵那一手有没有被收成必胜招 |
| | `lh_defeat_plain` | `third_sea`（**lh_qingyu** 接舟前） | 阿航是不是知道何时不该等 |
| | `lh_raid_help` | `road_two`（**lh_latermeet**） | 铁牙劫船先救谁，十九年后仍在两人之间 |
| | `lh_market_walk` | `mountain_fifth`（**lh_qingcheng**） | 市口哪一处最难让，答得上是哪一年真走过担 |
| | `lh_first_work` / `lh_master_real` / `lh_winter_teach` | `two_bowls`（**lh_grave**） | 说给不能再听的师父的那几句 |
| | `lh_market_listen` … `lh_south_loss`+`lh_tang_next`（5 组 `iff`） | `late_after`（**lh_latehall**） | 一生答过的那几处，终于被门人问起 |
| | `lh_count_boats` | `mainship_after`（**lh_seaafter**） | 回舟是自己点过的，还是别人代核的 |
| | `lh_last_hand` | `finish`（**lh_latehall**） | 最后一回领练交给谁（该变量由最后一个决断赋值，故只能读在它之后）|
| `dead-ranking` | `dr_first_sword`/`dr_second_sword`/`dr_third_sword` | `shen_three`（**dr_shenyard**） | 三次复原用同一种站法，还是不齐本身成为线索 |
| | `dr_wants_test` | `three_parts`（**dr_shenyard**） | 纸上是路，今天才是人 |
| | `dr_each_seen` + `dr_old_worker` | `living_benefit`（**dr_boardhouse**） | 「我没看见」是否被允许写进卷 |
| | `dr_gu_wait` + `dr_gu_own_words` | `living_benefit` | 顾临川那三个字是被等出来的，还是被一句顾全门声带过 |
| | `dr_land_trace` + `dr_house_plain` | `living_benefit` | 收买活口的钱与门前拒答是否分开记 |
| | `dr_face_alone` | `two_years`（**dr_boardhouse**） | 六个人同一间屋，事后有没有第二个人能证 |
| | `dr_faces_recorded` | `two_years` | 三人的原话入卷，还是一行空架子 |
| | `dr_face_askers` | `old_entry`（**dr_council**） | 九月那张桌上，被冒的三个人自己开不开口 |

### 6.3 仍然存在、本轮未修的孤儿选项

`dead-ranking` 15 个：`dr_letter_hand`、`dr_claim_separate`、`dr_asked_reopen`、`dr_boat_wait`、`dr_clinic_time`、`dr_zhao_direct`、`dr_each_name`、`dr_two_accounts`、`dr_names_plain`、`dr_life_limits`、`dr_letter_private`、`dr_new_name`、`dr_mid_response`、`dr_bow_response`、`dr_lesson`。
`xuanmen` 6 个、`white-stone` 9 个、`bamboo` 6 个、`north-notes` 4 个：**本轮完全未动**（见 §3 V7-10 的诚实边界）。

这些选项当下仍有不同文本，但**之后没有差别**。不把它们写成 PASS。

### 6.4 与 `boring-probes.json` 的关系（一处测量陷阱）

`audit-v7-boring-probes.mjs` 的 `alwaysSilentChoices` 判据是「该选项在任何一次采样中都没有改变 `variablesState`」。它**不能**用来论证「选项无后果」：

- Ink 的 `variablesState` 序列化**不含从未被赋过值的全局变量**，因此 `~ x = false`（把变量设回默认假）会被计成「没改变任何东西」；
- 实测中该指标命中的选项绝大多数属于这种「设为默认值」的情形。

因此本节的 orphan-vars 测量（**变量有没有被条件读过**）才是判据；`alwaysSilentChoices` 只作为反向线索使用，不用于结论。

