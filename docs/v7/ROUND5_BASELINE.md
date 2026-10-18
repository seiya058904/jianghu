# ROUND5_BASELINE — 第五轮开工基线（真实磁盘取证）

> 生成：2026-10-17 11:30 (+08:00)。本文件只记录**本机工作树实测**，不采信远端镜像或上一轮报告口径。
> 机器可读版：`docs/evidence/v7/round5-baseline.json`。

## 1. Git 与仓库状态

| 项 | 实测值 |
|---|---|
| 分支 | `master` |
| HEAD | `6135b0f4f6bf2d26b742939df604f9d5ca3ff821`（Round 4, 2026-10-17 02:37 +08） |
| 上一提交 | `15a81428643bbc0bb71f1243349ba16be29b0c44`（V7 rounds 2-3） |
| 祖先关系 | `git merge-base --is-ancestor` 实测：**两者均为 HEAD 祖先** ✅（第四轮交接所述成立） |
| 工作树 | `git status --short` **干净**，无用户未提交改动 |
| 远端 | `origin = https://github.com/seiya058904/jianghu.git`；本轮只做本地修改与本地 commit，不推送 |

## 2. 原典

| 项 | 实测值 | 与历史口径差异 |
|---|---|---|
| SHA-256 | `2e2b665657543e81c6b06c121307c9f13685d2c535f762a5b921949aaa8af393` | 与基线**一致** ✅ |
| 字节 | 579,299 | 一致 |
| `wc -l` | 35,314（换行符计数） | AGENTS 记 35,315 行系按末行无换行计；**内容一致，历史行号引用仍有效** |

## 3. 版本登记（audit-v7-works 复跑）

- 登记版本 **43**；现行 16 作品 / 23 现行版本 / 20 归档。与第四轮口径一致，无漂移。

## 4. 审计复跑（npm run audit:v7 + 两个补充脚本，2026-10-17 实测）

| 项 | 实测 | 与第四轮报告差异 |
|---|---|---|
| VAR 总数 / 疑似孤儿 | **465 / 198（42.6%）** | 一致 |
| 最差篇 | twelfth-life 23/34 · north 21/31 · jade 19/31 · seven-questions 16/26 · dead-ranking 15/33 · sea 15/22 | 一致（本轮开工值，不当作永久真实值） |
| 结局可达 | 47/47（600 游走/篇） | 一致 |
| 真实路径最长无选择 | 20 拍（上轮口径）；本轮 narration-runs 复跑 max 11 拍（luhua）、开场 max 6 拍 | 一致 |
| 重复语义文本 | 5 处（dead-ranking/kuhe/qingshi/sea/taihua 各 1，均为 2–3 字回声） | 一致 |
| 对白占比达标 | 1/23（beyond-ranking 68.6%）；次高 twelfth 64.8% | 一致 |
| flatChoiceGroups | 23 篇全 0 | 一致 |

## 5. 第四轮 31 条 E2E 修复在工作树的核实（不按日志推断）

| 修复 | 工作树核实 |
|---|---|
| `public/sw.js` shell 刷新修复 | ✅ 文件存在（3,126 B，mtime 2026-10-17 01:55），含 per-work 批量刷新逻辑 |
| 24 条陈旧 spec 升版 | 属 6135b0f 提交内容（`git show 6135b0f --stat` 可见），工作树与 HEAD 一致 |
| `north-notes` 改写（69→77 拍） | ✅ `src/generated/north-notes.json` 在库；spec-metrics 实测 77 拍 / 对白 59.7% |
| 297 单测 | 第四轮记录；**本轮内容改动后将在冻结时点复跑**，不在此预支 |

## 6. 已知测法缺陷（延续登记，本轮继续遵守）

1. `audit-v7-works.mjs` 的 `longestPassiveRun` 是源码线性扫描（互斥分支串拍），**上界**；真实体验以 `audit-v7-passive-run.mjs` 为准。
2. `boring-probes` 的 `alwaysSilentChoices` 会把 `~ x = false` 写回默认值误计为「无改变」，不得用它论证选择无后果。
3. `audit-v7-orphan-vars.mjs` 是静态 grep：**动态读取与跨模块消费可能误报**；删变量前必须查运行时消费者。
4. 对白占比有「字数占比」与「拍数占比」两种口径，不得混用（spec-metrics 输出的是拍数占比）。

## 7. 开工时 17 项 P0 状态（采信第四轮矩阵，本轮复核未推翻任何一行）

**PASS 6（V7-02/03/05/06/16/17）· PARTIAL 7（V7-01/04/07/08/10/14/15）· FAIL 2（V7-09/13）· BLOCKED 2（V7-11/12）= INCOMPLETE。**

第五轮工作顺序：先清孤儿变量（§05 委托要求，从最差篇起），再做缺失三轮的九篇编辑与证据，随后旗舰精修，最后冻结跑回归。

## 8. 本轮执行纪律（重申）

- 编辑→编译→测试**不并发**；全量套件只在内容冻结后跑。
- 不改 `story/production-direction-v6.mjs` 冻结字节；新规则进 `story/production-direction-v7.mjs`。
- 不删测试降难度；不改阈值凑 PASS；CG 缺工具如实 BLOCKED。
