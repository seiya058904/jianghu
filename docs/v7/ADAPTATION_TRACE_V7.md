# V7 改编追溯（原文事件 → 可玩 beat / choice / 后日）

> 证据文件：`docs/evidence/v7/fact-beat-trace.json`（`fact`/`ending` 标签与 beat 的实测绑定）、`docs/evidence/v7/opening-rhythm.json`、`docs/evidence/v7/works-ledger.json`
> 所有 beat ID 均可用 `grep -o "# beat:<id>" story/<slug>.ink` 逐条复核。

---

## 1. 标签协议（本轮未改）

| 标签 | 含义 | 载体 |
|---|---|---|
| `# beat:<id>` | 一个可推进的最小单位 | 每行 |
| `# speaker:<id>` | 说话者（`narrator` / `you` / 角色 ID） | 每行 |
| `# scene:<id>` | 场景（决定背景与演出） | 每行 |
| `# cast:<ids>` | 在场人物（逗号分隔） | 每行 |
| `# mood:<id>=<state>` | 表情差分 | 每行 |
| `# fact:<id>` | 在此处解锁见闻条目 | 解锁点 |
| `# ending:<id>` | 在此处收束为某结局 | 结局点 |
| `# cid:<id>` | 选项的稳定 ID（存档兼容用） | 选项 |

本轮**未新增、未修改任何标签**，因此所有旧存档的 `cid` 与节拍签名继续有效。

---

## 2. 正典事实 → beat 实测绑定

下表是脚本直接抽取的绑定关系（`fact id` → 它实际挂在哪一个 beat 上）。这一列回答的是委托 §10.3 的「这个正典事实，玩家到底在哪一拍知道」。

### 旗舰篇

| 作品 | 正典事实 | 落点 beat | 内容（`chronicleFacts`） |
|---|---|---|---|
| 太华试序 | `th_closed` | `th_packing_7` | 六门试序是内部旧会，青序六十、正序二十八；宗主上座不下正序 |
| | `th_first` | `th_centre_6` | 陆青珩第一战一百零二手胜沈照微；轮战沈再胜陆 |
| | `th_48` | `th_fache_close_4` | （第四十八手相关） |
| | `th_53` | `th_huo_fifty_three_6` | 霍停云第五十三招后逐渐失去下一剑的空间 |
| | `th_order` | `th_order_6` | 最终青序六人顺序 |
| | `th_six` | `th_six_open_7` | 霍停云问张玄岳六手而止，第四手已失路 |
| | `th_mu_front` | `th_mu_front_7` | 穆玄真指出前面半寸 |
| 龙门问刀 | `lm_seven` | `lm_qinghe_return_4` | 许重山回述少年时宋九川问「第七刀砍什么」 |
| | `lm_count` | `lm_fortyseven_7` | 一百一十九合胜、与罗天庆记平、四十七招败贺景庭 |
| | `lm_nine` | `lm_nine_7` | 章复生以木剑受真剑；石惊川九剑后认输 |
| | `lm_retire` | `lm_fiveyears_5` | 五年后贺景庭自请退榜，罗天庆继首 |
| 第十二席（馆师视角 `twelfth`） | `qw_public` | `qw_nothing_5` | 薛直公开真胜后，王府既不报复也不送礼 |
| | `qw_55` | `qw_stone55_5` | 五十五岁胜石横，石横旧膝伤中发 |
| | `qw_seat` | `qw_named_7` | 五十八岁四比三得第十二；榜上只写姓名 |
| 照水刀（问席 `dongting`） | `dt_106` | `dt_shore_5` | 四十五岁梁一百零六合落水 |
| | `dt_recall` | `dt_old_feud_6` | 二十七岁与焦定海结怨，后来并船剿匪 |
| | `dt_vote` | `dt_shore_after_5` | 七名旧豪四推梁、三推陈；孟守川因师徒之嫌不投 |

### 配篇 / 资料篇

| 作品 | 正典事实 | 落点 beat |
|---|---|---|
| 洛阳龙虎风云会 | `ly_two_scales` | `ly_one_oh_six_6` |
| | `ly_stop` | `ly_both_hands_6` |
| 竹院夜论 | `bb_paper` | `bb_thirty_six_5` |
| | `bb_han` | `bb_han_twelve_6` |
| | `bb_seen` | `bb_north_south_8` |
| | `bb_cup` | `bb_tea_cup_5` |
| 玄门旧史 | `xm_unlisted` | `xm_old_name_4` |
| | `xm_nine_jobs` | `xm_nine_mats_6` |
| | `xm_stone_stop` | `xm_simultaneous_6` |
| | `xm_seat` | `xm_three_years_6` |
| | `xm_first` | `xm_seventy_11` |
| | `xm_empty` | `xm_empty_seat_6` |
| 白石谷外 | `ws_snow_gap` | `ws_white_council_6` |
| | `ws_ninety_seven` | `ws_thirteenth_day_9` |
| | `ws_old_people` | `ws_two_old_swords_9` |
| | `ws_cannot_copy` | `ws_six_students_9` |
| | `ws_no_lifespan` | `ws_forbidden_copy_8` |
| | `ws_two_crowns` | `ws_second_crown_7` |
| 榜纸之外 | `br_alive_limit` | `br_not_all_alive_5` |
| | `br_first_two` | `br_first_two_6` |
| | `br_unplayed_third` | `br_third_fourth_6` |
| | `br_later_four` | `br_seventh_eighth_7` |
| | `br_last_two` | `br_ninth_tenth_6` |
| 师门夜话 | `nn_two_doors` | `nn_different_pupils_4` |
| | `nn_qin_time` | `nn_qin_visit_5` |
| | `nn_sima_person` | `nn_sima_person_4` |
| | `nn_rumor_limit` | `nn_notes_remain_2` |
| 枯河谷 | `kh_after` | `kh_future_16` |

---

## 3. 结局 → beat 实测绑定（终章落点）

| 作品 | 结局 | 落点 beat |
|---|---|---|
| 太华试序 | `th_company` 结伴复手 | `th_ending_24` |
| | `th_letter` 独行回山 | `th_ending_37` |
| | `th_guidance` 一炷香的回身 | `th_guidance_continue_17` |
| 龙门问刀 | `lm_travel` 送剑同行 | `lm_ending_6` |
| | `lm_home` 守馆改刀 | `lm_ending_11` |
| 第十二席（赵承晏） | `rl_watch_after` | `rl_old_book_5` |
| | `rl_letter_after` | `rl_old_book_6` |
| 第十二席（馆师 `twelfth`） | `qw_school` 堂前再约 | `qw_sun_9` |
| | `qw_palace` 入府教习 | `qw_sun_12` |
| 照水刀（`luhua`） | `lh_hall_after` | `lh_finish_4` |
| | `lh_coast_after` | `lh_finish_5` |
| 问席（`dongting`） | `dt_company` 护住同行 | `dt_threeyears_10` |
| | `dt_cargo` 先成差事 | `dt_threeyears_13` |
| 青石五友 | `qs_records` | `qs_after_report_10` |
| | `qs_heirs` | `qs_after_report_11` |
| 山河璧 · 密库双贼 | `jt_unmarked_life` | `jt_box_6` |
| | `jt_private_account` | `jt_box_7` |
| 山河璧 · 十三文 | `jd_storework` | `jd_later_records_5` |
| | `jd_archivework` | `jd_later_records_6` |
| 一剑两脉 | `ss_mountain_lesson` | `ss_afterwards_8` |
| | `ss_library_lesson` | `ss_afterwards_9` |
| 门外七问 | `sq_shared_road` | `sq_afterwards_9` |
| | `sq_open_lesson` | `sq_afterwards_10` |
| 海路两世 · 中原以外 | `sr_open_courtyard` | `sr_after_life_5` |
| | `sr_next_harbor` | `sr_after_life_6` |
| 海路两世 · 归潮岛 | `st_next_step` | `st_beyond_sea_3` |
| | `st_next_watch` | `st_beyond_sea_4` |
| 北枪 | `nq_first_again` | `nq_one_more_spear_3` |
| | `nq_three_names` | `nq_one_more_spear_4` |
| 乾坤 | `qk_open_lesson` | `qk_best_no_end_3` |
| | `qk_open_mountain` | `qk_best_no_end_4` |
| 死人争榜 | `dr_room_after` | `dr_last_page_9` |
| | `dr_road_after` | `dr_last_page_10` |
| 枯河谷 | `kh_care` | `kh_future_17` |
| | `kh_record` | `kh_future_18` |
| 竹院夜论 | `bb_palm_after` | `bb_night_ends_8` |
| | `bb_tea_after` | `bb_night_ends_9` |
| 洛阳龙虎 | `ly_trial_after` | `ly_road_after_2` |
| | `ly_post_after` | `ly_road_after_3` |
| 玄门旧史 | `xm_handover_after` | `xm_last_day_6` |
| | `xm_blank_after` | `xm_last_day_7` |
| 白石谷外 | `ws_outside_after` | `ws_today_after_2` |
| | `ws_receiving_after` | `ws_today_after_3` |
| 榜纸之外 | `br_reader_after` | `br_after_copy_2` |
| | `br_record_after` | `br_after_copy_3` |
| 师门夜话 | `nn_unfinished_page` | `nn_notes_remain_3` |
| | `nn_different_starts` | `nn_notes_remain_4` |

**观察**：`ending` 标签**无一挂在开场**，全部落在各篇终章节点（`*_afterwards_*` / `*_ending_*` / `*_old_book_*` / `*_last_page_*` / `*_today_after_*` / `*_finish_*` / `*_better_no_end_*` 等），符合「结局由终章收束」的预期。

---

## 4. 反向追溯：游戏 → 原典

反向核对需要**逐场人工比对原文**。本轮能给出的可复核结论只到结构层：

| 可核对的项 | 结论 | 证据 |
|---|---|---|
| 每篇的 `canon[]` 声明承载哪些原典组 | 22 组全部有承载者，无孤儿组 | `tests/library.test.ts` 第 3 条 |
| 每篇的 `viewpoint` 是否为原典人物/原典在场者 | 16 部作品全部声明为原典人物视角；**唯二例外**是 `dongting`（听潮门护船帮手）与 `twelfth`（王府陪练与地方馆师），二者均在 `works-registry.ts` 中显式标为**配篇**且不与旗舰篇抢同一排卡 | `works-registry.ts` `companions` |
| 原典人物在游戏中的说话比例 | **未逐场复核** | 见 §6 |

---

## 5. 开场节奏实测（委托 §5.1 门槛）

`scripts/audit-v7-opening.mjs` 的直接输出（`docs/evidence/v7/opening-rhythm.json`）：

| 指标 | 实测 | 委托门槛 | 判定 |
|---|---|---|---|
| 首个选择落在第几拍 | **23 / 23 篇都在前 8 拍内**（最快第 2 拍 `jade-thieves`，最慢第 8 拍 `taihua`） | 「开场 30–90 秒内体验到一次真实交互」 | ✅ 通过 |
| 首个非旁白发言 | 第 1–8 拍（`beyond-ranking` 第 3 拍） | 不得开场连点纯旁白 | ✅ 通过 |
| 玩家首次开口（`speaker:you`） | 第 2–12 拍；**两处例外**：`luoyang` 全程无 `you` 发言；`beyond-ranking` 首次开口在第 89 拍（共 98 拍） | —— | ⚠️ 见 §6 |
| 最长无选择段 | **最大 20 拍**（`longmen`，在 `lm_fiveyears_5`），其次 17（`taihua` / `qian-kun` / `twelfth-life`）、16（`jade-thieves` / `qingshi`） | 「超过 20 拍须逐段写出必要性」 | ✅ **全 23 篇均在 20 拍线内** |
| 对白占比 ≥65% | **0 / 23 篇达标**（实测 32.5%–64.8%） | 「大多数正式场景 65% 左右或更高」 | ❌ **未达标** |

---

## 6. 本轮诚实声明的改编缺口

以下三类必须如实标注，不得记 PASS：

### 6.1 对白占比全面未达标（❌ V7-09）

23 篇无一篇的旁白占比 ≤35%。最低旁白占比是 `twelfth`（35.2% 旁白，即 64.8% 对白）与 `dongting`（36.8%），已经逼近门槛；最高是 `xuanmen`（67.5% 旁白）与 `white-stone`（67.4%）。

**这不是本轮改造引入的问题** —— 与 V6 审计记录的「32%–50%」一致，说明本轮**没有恶化也没有修复**。修复属于剧本正文改写，本轮为壳层重构，未动 `story/**`。

### 6.2 长被动段：**实测通过**，并纠正一处早期误读（✅ V7-09）

**先说结论**：按**真实游玩路径**实测（`scripts/audit-v7-passive-run.mjs`，每篇 240 次确定性随机通关，记录最长连续无选择推进），**23 篇现行版本没有一篇超过 20 拍**：

| 排名 | 作品 | 最长无选择段 | 中位数 | 落点 beat |
|---|---|---|---|---|
| 1 | `longmen` | **20** | 18 | `lm_fiveyears_5` |
| 2–4 | `taihua` | 17 | 16 | `th_ending_24` |
| | `qian-kun` | 17 | 16 | `qk_best_no_end_4` |
| | `twelfth-life` | 17 | 17 | `rl_old_book_6` |
| 5–6 | `jade-thieves` | 16 | 16 | `jt_first_order_16` |
| | `qingshi` | 16 | 15 | `qs_casualty_review_9` |
| 7–9 | `kuhe` / `luhua` / `two-swords` | 15 | 15 | `kh_bell_13` / `lh_winter_master_6` / `ss_rain_work_6` |

证据：`docs/evidence/v7/passive-run.json`。

**必须记录的方法学纠正**：`works-ledger.json` 的 `longestPassiveRun` 字段（报出 43 / 40 / 30 拍）用的是**对 Ink 源码的线性扫描**，它会把 Ink 的条件分支 `{cond: 分支A | 分支B}` 两边的 beat **串联**计数。以 `taihua` 为例：

```
{strain and not measured and carried:
  ... th_ending_19..24 ...（分支 A）
}
{（另一条件）
  ... th_ending_25..29 ...（分支 B，与 A 互斥）
}
```

线性扫描把 A 和 B 加起来报成 43 拍；同一次通关**只会走到其中一支**。因此 **43 拍不是玩家体验到的数字**。两套数据都在 `docs/evidence/v7/` 保留，解释权归本节的运行时测量。

### 6.3 两处视角异常（⚠️）

- `luoyang`：**全篇没有任何 `speaker:you`**。玩家是纯观察者。作为龙门之后的短配篇（76 拍 / 18 选项 / 2 结局），这个设计可能是刻意的，但须在编辑审读中显式确认，不能默认通过。
- `beyond-ranking`：玩家**直到第 89 拍才第一次开口**（共 98 拍）。委托 §3 说本组是「见闻 / 访谈 / 人物谱系」，但 §10.4 的红线是「还没机会说一句话必须重写」。这两条如何调和须显式论证。

---

## 7. 必要原创补白（不冒充原典）

以下内容是**原典中没有的，属于必要的游戏化补白**，在此显式登记，避免与忠实改编混淆：

| 类型 | 位置 | 性质 |
|---|---|---|
| 玩家角色名 | `bamboo` 的「严仲山」（受邀前十名宿） | 原文只写「一南一北两位前十名宿」等在场者，未给可扮演者姓名 |
| 玩家角色身份 | `dongting` 的「听潮门护船帮手」、`twelfth` 的「王府陪练与地方馆师」、`longmen` 的「镇河门随行门人」 | 原文有这类人物在场，但未指定姓名；命名属补白 |
| 场景装饰人物 | `luoyang` 的 15 位出场人物中的部分 | 原文列名宿若干，具体名单有推断成分 |
| 三各归宿结局 | 各篇的 2–3 个结局（如 `th_company` / `th_letter` / `th_guidance`） | 个人后日归属属玩家选择；**正典胜负与死亡不因此改写** |

**红线自检**：全部 16 部作品的 `entry` 均为原典人物视角或原典在场者视角；原创地方篇《潮生有约》的「青蒲渡 / 石梁馆」人物**没有**出现在任何正式作品的 `canon[]` 或多个作品中。`tests/library.spec.ts` 断言首页正文不含原创故事文本。
