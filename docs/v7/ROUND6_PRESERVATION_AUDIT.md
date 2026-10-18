# Round 6 存档与冻结保护独立审计（Gate F2 · 2026-10-17）

> 独立复核"两头同时成立"：被推进的账本有真实历史来源（非"新对新"），旧档在归档版可恢复、跨版被拒且不破坏、损坏被拒。本轮为**重新执行**的审计，不引用 Gate A 结论作通过依据。

## 1. 归档哈希来源证明（防"今天的活体自称过去版本"）

| 检查 | 方法 | 结果 |
|---|---|---|
| v6 账本声明 sha ↔ 仓库实际文件 | 扫 docs/evidence/v6/*.json 全部 file→sha256 声明，定位实际文件后重算 | **22/22 MATCH**（swords-art/jade-reusable/qingshi-snapshots/reusable-child/sea-rigging/heng-art 六本账本的 before 归档对全部与文件一致） |
| 账本声明 ↔ git 历史对象 | swords-art 账本首提交 `32193201` 的树上逐文件 `git cat-file` 重算 | **4/4 MATCH**（ss-xie 三情绪 + cg-working-books）——账本记录的哈希在其创建提交时真实存在，排除"新对新" |
| 冻结旧稿 ink 活体 vs 首次提交 | story/*-v[123].ink 全部 20 个 | 均为 **有意推进**（第五/六轮按 ROUND5/ROUND6 note 推进，推进记录在 commit 1d01988/7180275 与各账本 note）；未发现无记录的静默改动 |
| 本轮冻结 | docs/evidence/v7/round6-final-freeze.json：94 个活体源哈希 + 351 个归档文件哈希 + 原典 SHA | ✅ 构建后复核源未变（git status 仅 evidence 两文件） |

## 2. 旧档恢复实测（运行时，docs/evidence/v7/round6-restore-sample.json）

| 场景 | 行为 | 判定 |
|---|---|---|
| twelfth-life-v2 归档版内存档于 `rl_shen_standing_4`，同版恢复 | ✅ 精确恢复，无迁移 | 旧版自身可读 |
| 同一旧档交给现行版 twelfth-life-2.0.0 | 拒绝，文案「存档作品或版本不兼容，可导出原始数据留存」 | **不覆盖、不假迁移**；旧数据语义独立保留 |
| runtime 字段损坏的档 | 拒绝 | ✅ |

系统级保护（既有测试在冻结版上仍绿，全量 E2E 复跑中）：
- `child-reuse.test.ts`：sea-tide 三代内容（before/after/archive）逐 beat 字节级对走 + restoreVN 快照恢复 + 伪造 stage/变量/commands/版本全部拒绝。
- `swords-art.test.ts` / `heng-art.test.ts`：归档对全路径字词保持 + 256 次随机游走覆盖全 beat。
- `default-entry.spec.ts`：旧 V5 主篇真实保留与直接归档续读/导出（真实浏览器）。
- `v6-compat / campaign / player`：旧 URL/prefix/旧槽位/导出字节、半步之约与渡口无碑独立。

## 3. 推进账本登记（本轮及上轮合法推进的 ledger）

| ledger | old→new | provenance | 结果 |
|---|---|---|---|
| north-notes 冻结哈希（Gate B 编辑） | ROUND6 note，commit 7180275 | 编辑 diff + 全量单测绿 + north-notes-editorial-rounds.json | 记录在案，归档版仍由账本先行校验 |
| registry 拍数（taihua 465→485 等 14 条） | commit 2e9ef4b / f05b337 前后 | ink 实测重录（脚本输出留存会话日志） | 现行 registry 与 ink 一致（spec-metrics 复核） |
| sea-tide child 归档对 | commit 1d01988 | d86ae09 的 sea-tide-after-child.json | child-reuse 测试三态字节级绿 |

未发现：无来源可证却声称通过的冻结基线；被覆写的 docs/archives 或 story/archive（本轮与上轮提交均未触碰 archive 目录内容——可用 `git log --follow story/archive` 复核）。

## 4. NOT VERIFIED / 限制声明

- 公开镜像（seiya058904/jianghu main）缺原典与 docs/archives 时的 34 条跳过：本轮**只验本地作者检出**（基线完整路径），公开镜像的弱验证不作为通过依据，也未推送。
- 浏览器 localStorage 满额场景、跨作品导入、未来版本档：由既有单测覆盖（offline-work-gate / player），未在本轮单独扩展新用例。
- Android 真机 / Safari / Firefox / 真实读屏器：EXTERNAL NOT VERIFIED（不变）。
