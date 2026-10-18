# 独立问题台账

本轮独立发现、失败复现、作者源修复与反例复核分开记录。原典、归档来源与旧预期哈希未改。

| 范围 | 发现与修复 | 当前证据 |
|---|---|---|
| 原典01–14 | CE01–CE06：已故人物回答死后事实、洞玄认胜自相矛盾、跨人物/年代回响、另一条路记忆串线、五处门面误导 | `canon-early-issues.json`、`canon-early-before-fix.log`；本轮集成全部回归见`rc-tests.log` |
| 原典15–22 | CL01–CL25：死人三证/共桌/师门、玉粮支线、薛直胜负、年代、伤肩、掌篙、混合选择与事业后记 | `canon-late-issues.json`、三份before日志、`canon-late-regression-after.log`：60/60 |
| 存储 | 禁读/满额无法开局或导出、旧标签覆盖新进度、备份失败覆盖风险 | `engineering-issues.json`；`integration-browser.log`9存储案例通过 |
| 离线 | 按篇下载漏新版shell脚本；ready前等待不受超时保护 | `shell-update-browser.log`根/小写子路径2/2；`offline-reliability.spec.ts`通过 |
| 冻结契约 | 任意缺失被降为warning；公共编辑草稿直接读私档；旧伴篇断言锁住合法现行修订 | 严格缺席白名单、真实七份Git旧字节、`engineering-preservation-proof.json`；17份旧清单未改，专项64/64 |
| 视觉 | 陆清婉中年含笑图带大块残留背景 | 仅现行版使用干净同龄中性图，旧版不改；`portrait-visible-browser.log`2/2及精选对照图 |
| 发布/文档 | 线上仍V6默认首页、README/导航互相矛盾、旧规程诱导强推 | 根文档与安全增量脚本已修；实际云端/上线结果待最终发布记录 |

工程和故事修订由不同审阅者再次检查，见`engineering-final-counterreview.md`。18份改动作者源的行数、part/stage/choose/go/fact/end、CID与赋值锚点保持一致；这证明结构未漂移，不证明所有文学感受。

本轮集成失败未隐藏：首次集成419/426，七项旧冻结契约冲突；采用真实旧字节后最终预检450/451，剩余一处旧断言要求已经修掉的错误回响。该断言改为分别核实际已报船位与未练口令，并明确拒绝旧假记忆。随后全套451/451、exit0。另保留一次Windows写longmen.ink的UNKNOWN临时文件打开失败日志，未通过改源码绕开。

历史原创兼容篇三项P2文字问题保留于`canon-legacy-review.md`：它们不在当前主推纪事中，未为润色破坏冻结字节与存档。庞震海立绘持锚/掌战姿态、少数声线与编辑偏好属于具体P2/限制，见视觉与编辑报告，不伪称全部美术动作完备。

体积F24仍BLOCKED：当前.git本身超过1GiB，未获另行授权重写历史或替换作者库。完整bundle已验证、截图有逐文件恢复清单；继续完成其他门禁。
