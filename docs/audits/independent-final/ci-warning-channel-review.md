# CI冻结基线告警通道回归

2026-10-18。仅修改 `tests/historical-baselines-policy.test.ts`；未改frozen/historical helper、生产代码、SW、workflow、依赖、存档expected hash或dist。没有commit、build、npm test或浏览器/全量重跑。

## 根因与原失败

Pages run39101353730的原始日志在外部 `pages-first-failed.log`：474项中473通过，唯一失败在historical-baselines-policy.test.ts:28。frozen-baselines.report有意在GITHUB_ACTIONS为真时console.log输出stdout的 `::warning title=Frozen baseline absent::...`；本地使用console.warn到stderr。旧测试无条件匹配stderr，CI里该通道为空，误判合法PARTIAL告警失败。不能通过改生产告警通道、跳过CI测试或拼接两个流掩盖此问题。

修前以原测试执行：`GITHUB_ACTIONS=true node --experimental-strip-types --test tests/historical-baselines-policy.test.ts`，实际退出1，stderr匹配的actual为空，与云失败相同。保留外部 `ci-warning-original-actions.log`（ORIGINAL_EXIT=1）。

## 最小测试修复及保护

原test case仍只有1项，完整旧字节非当前源断言保留。显式外层遍历GITHUB_ACTIONS缺席/true，spawn子进程前先移除继承值、再按模式设置true，使父进程环境不会决定覆盖范围。两种子环境都执行原六项：missing-current、changed-map、changed-commit、extra-path、missing-archive、wrong-archive；每轮记录executed并deepEqual精确六项，不能早停漏场景。

原每个child的status=0、missing-archive精确null、其它五模式原 `/missing|Invalid|changed/` throws断言不变。missing-archive现在精确核整条Actions stdout注解或本地stderr消息，另一个流必须为空；没有blindconcat/宽regex。还核隔离临时cwd中missing report的固定status、count=1以及唯一原归档路径。报告写入临时夹具，不动真实私档或历史共享证据。

## 实际验证

| 父进程环境/命令 | 实际结果 | 外部原始日志 |
|---|---|---|
| 修前GITHUB_ACTIONS=true；node --experimental-strip-types --test tests/historical-baselines-policy.test.ts | 0/1，退出1 | ci-warning-original-actions.log |
| 修后GITHUB_ACTIONS缺席；相同node定向命令 | 1/1，退出0；12子场景 | ci-warning-fixed-local.log |
| 修后GITHUB_ACTIONS=true；相同node定向命令 | 1/1，退出0；12子场景 | ci-warning-fixed-actions.log |

日志都在作者外部 `Jianghu-independent-20261018/` 根目录，未覆盖Pages原失败日志。两个修后父环境均再次分别覆盖两种child环境×六模式；不是只在本地验证stderr分支。git diff --check针对该测试退出0。

## 精确字节与范围

- 修改前：30行、LF，SHA256 `96542cebb08e70bfa65eef512d347ec66a2d97e8ce054253c8edb67708e8d5db`。
- 修改后：47行、LF，SHA256 `8284c7e736ee539a374526be53a9d066157970193f185c3ebd09e25f4a90d3df`；没有CRLF归一化改写。实际复核test1–47及其完整Git diff。
- check_index_coverage对本测试与两个基线helper查询：generation2026-10-18T05:45:53Z，三路径均metadata_changed、coverage=[]；结论回源，不冒称图完整。
- 无新增依赖/测试case；父代理负责更新FILE索引/manifest、完整474、冻结新RC全492及后续普通发布验证。旧a04完整492通过不能冒作本测试变更后的新RC结果。

当前状态：**HARNESS_FIXED_TARGETED_BOTH_ENV_PASS，完整CI/新RC门禁待父执行。** 公开归档完整性仍PARTIAL；此次只使测试正确核验已有的显式缺席告警，不减少任何冻结字节保护。
