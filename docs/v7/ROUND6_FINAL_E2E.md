# ROUND6 最终 E2E 记录

> 委托 §F3。冻结构建（`docs/evidence/v7/round6-final-freeze.json`，HEAD `754cc3f` 冻结源）上运行。**两轮全量均为完整跑到总结的真实运行**，不拼组。

## 1. 第一轮全量（2026-10-17 16:35–19:04，2h29m）

- 命令：`HTTP_PROXY= HTTPS_PROXY= http_proxy= https_proxy= NO_PROXY=127.0.0.1,localhost npx playwright test --workers=1`
- 原始日志：`docs/evidence/v7/round6-final-e2e-full.log`（保留原样，含全部错误上下文）
- **结果：471 项 = 464 通过 + 7 失败**（`EXIT=1`）
- 此前定向先行：`playthrough.spec.ts + library.spec.ts + default-entry.spec.ts` 15/15 绿（旗舰真实浏览器全程 7.5m）

### 7 个失败逐条归因

| # | 测试 | 现象 | 归因 | 处置 |
|---|---|---|---|---|
| 1 | `kuhe-editorial.spec.ts:21` | `s.frame.choices[0].id` TypeError | **spec 过期**：第五轮孤儿接线（807bfb2 系列）重写了 kuhe 钟声段，`kh_bell_13` 现为 iff 变体无选择点；同 spec 其他三处早已有 `if(s.frame.choices.length)` 守卫，仅此一处遗漏 | 测试加同款守卫（有选择→点击，无→推进） |
| 2 | `north-editorial-cold-offline.spec.ts:4` | 缓存删除后 `caches.match` 仍 true | **偶发竞态**：定向复跑通过（冷包三档全过） | 复跑验证，无代码改动 |
| 3 | `qian-kun-editorial-cold-offline.spec.ts:4` | 同上 | 同上 | 同上 |
| 4 | `sea-tide-editorial.spec.ts:18` | 期望场景 `st_latepier` 实得 `st_tower` | **spec 过期**：第五轮 sea-tide 接线（807732b）重编号，旧 `st_last_look_7`（latepier 码头段）现位于 tower 段；且旧 `_10`（side=1 分支）现不可达。**direction 表批量核验 0 错位**（场景/look 随文本正确移动），非产品缺陷 | spec 改用现行码头段锚点 `st_last_look_9`（side0）与 `st_last_look_13`（side1），保持"两班值晚职"双分支意图 |
| 5 | `swords-art.spec.ts:10`（seven-questions 变体） | 旧档恢复后 `data-beat` 为空，页面停留封面 | **产品按设计拒绝 + spec 断言过期**：第五轮重接 seven-questions 回响（807bfb2）使叙事实质变化，冻结的 `seven-questions-before-books-cg.json` 快照与现行内容不再逐帧一致 → 严格迁移闸门（`vn-runtime.restoreVN` 的 `migration changes story` 检查）**正确拒绝**预改稿旧档，而非让旧档"碰巧读得过去"（委托 §F2-6 明令禁止）。运行时探针证实：拒绝信息"存档进度与演出状态不一致，未覆盖当前进度。"，原始数据逐字节保留 | spec 更新为验证新契约：旧档被拒、auto/slot1/previous 三键逐字节不变、可原样导出、导入被拒后 auto 仍不变；另验证现行档恢复正常（`sq_three_volumes_1` + `workingBooks` CG）。two-swords-v1 变体（归档内容未变）继续验证迁移路径不变 |
| 6 | `swords-art.spec.ts:18`（seven-questions 变体） | 同上 | 同上（旧档带待决选择） | 同上：断言拒绝 + 不消耗回复 + 数据保留 |
| 7 | `swords-art.spec.ts:30`（seven-questions 变体） | 离线新页旧档迁移失败 | 同上（离线场景同一闸门） | spec 改为：seven-questions 用现行档验证离线恢复 + 新图解码；two-swords-v1 继续验证冻结源迁移 |

**产品源码零改动**——7 项处置全部为测试对齐（2 项为偶发复跑）。冻结哈希不受影响。

### 诊断方法（可复现）

- 运行时探针（Node + `VNRuntime/restoreVN`）：证实现行档恢复 OK、旧档+完整 edition 被拒、`kh_bell_13` 无选择点、sea-tide latepier beats 的 side 可达性矩阵。
- 页面级探针（Playwright）：证实页面恢复管线本身正常；定位到"同 URL 仅变 hash 的 `goto` 不重载页面"导致的测试假象，改用 `reload()`。
- direction 映射批量脚本：sea-tide 全部 st_* 条目对照现行 ink 0 错位（排除与 taihua th_mu 同类的回响顶号产品回归）。

## 2. 第二轮全量（spec 修复后，同一冻结构建，2026-10-17 19:39–22:01，2h22m）

- 命令同第一轮；原始日志：`docs/evidence/v7/round6-final-e2e-full-run2.log`（强制入库，原样保留）
- **结果：471 项全部通过（`471 passed (2.4h)`，`EXIT=0`），0 failed / 0 skipped / 0 flaky**
- 运行对象与第一轮相同的冻结构建（`round6-final-freeze.json`，HEAD `754cc3f` 冻结源）；其间产品源码零改动，仅 5 个 spec 锚点对齐（提交 `7b9d13a`）
- 总结行之后 Playwright 无任何 failed/flaky 段；最慢文件 `playthrough.spec.ts`（7.5m）为旗舰全程真实游玩

## 3. 与历史口径的衔接

- 第四轮全量：440/471（31 失败 = 1 产品缺陷 sw.js 已修 + 24 spec 陈旧 + 1 信息架构 + 4 长跑污染）。
- 本轮第一轮 7 失败全部为测试侧（5 spec 陈旧锚点 + 2 偶发），**无新产品缺陷**；本轮新增 1 处产品行为如实登记：seven-questions 内容实质变化后，旧档自动迁移按设计转为拒绝（与 kuhe v2→v3 的既有先例一致）。
- 第二轮 **471/471 全绿**：第一轮的 7 失败在 spec 对齐后全部消失，且无一条以「放宽断言」换通过——全部改为验证现行正确契约（严格迁移拒绝+数据保留、现行码头段锚点、iff 无选择点守卫）。

## 4. 定稿结论

**冻结构建上的最终全量 E2E：471/471 通过（EXIT=0）。** 该数字直接作为验收矩阵 V7-14 / V7-15 升 PASS 的运行时证据。
