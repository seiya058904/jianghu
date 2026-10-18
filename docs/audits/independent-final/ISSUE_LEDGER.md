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

## 最终补审发现与关闭

|ID/级别|根因与实际修复|当前一手证据|
|---|---|---|
|CE07 / P1|龙门送原帖路线在贺门之前说已见石败，实际先胜许、再与罗平。原拍只改为“看见我只同罗先生打平”，CID/变量/beat未变|longmen-counterexample-before.log真实旧generated失败；after.log 66/66；browser-longmen-review.md两档从头实走罗平→新句→贺门认输|
|ENG-04 / P1|同版本正文纠错导致Ink outputStream改变，旧真实存档整串校验不等而拒读。限定13个明确版本，用真实7a旧compiled验证全部旧runtime/presentation，再逐拍核除正文外结构/变量一致，返回新重放；保留原raw，失败不覆盖|editorial-migration-counterreview.md；13份真实Git旧JSON与固定hash；22项真旧逐拍/拒伪造、26项既有迁移；editorial-migration-browser.log 7/7|
|QA-01 / P2|部分回归helper未确认requested CID实际命中；三剑/双报告正断言不足|helper现逐CID命中；CL23脚/眼/手分别正断言，CL25双true正验报告，独立反证已读；保留少数负断言测试的有限证明边界|
|REL-01 / P2|发布预审过宽阻断既有大ferry图；固定用户名regex暴露机器目录形式|仅允许已知hash且与原公开文件逐字节相同的ferry；其余>1MBbinary仍拒；目录提取泛化且3真实日志结果不变，provenance-path-regression.json|

RC1/2/3完整浏览器运行均主动中止并保留日志及aborted说明，不能相加为最终通过。当时冻结RC为ec53af4ec75f352b52ba6a85bd818510b890dc10；后续完整回归与云端发布状态统一见FINAL_QA/RELEASE_VALIDATION。迁移首次浏览器4/6中的两失败来自测试未点击已有槽的确认替换、及初始DOM未ready抓null；已修测试实走流程，最终7/7，不伪造为首次全绿。

## ec53完整回归新发现（FIXED，等待新全量）

ENG-05 / P1：tests/player.spec.ts:153原断言发现Half Step旧样章自动档在启动渲染时提前写回。ENG-04将pendingDraftBackup所有类型都立即persist，破坏原本仅真实advance才迁移的旧样章时序。原raw仍在备份，旧手动槽未覆盖，但不符合既有行为。完整run继续结束后将guard收窄为previousContent或editorialContent；不改原断言，新RC须重新完整492。

最终源修fcef368只改player首渲染guard：Half Step延迟写回恢复，previous/editorial仍立即备份。旧491/1日志完整保留；rc-release-targeted.log原断言24/24，单测474/474、编辑80/80。当前完整492独立重跑，不能用旧491加定向凑通过。

## QA-02 / P2 测试前置竞态（独立根因已证）

North root在导航返回后删除缓存，原SW fetch的event.waitUntil(cache.put)仍未完成，随后重新填回导致下载前false断言失败；并未走到产品离线失败。可控独立Chrome在load/networkidle返回仍有真实pending写时复现，真实fetch waitUntil屏障证明等待原写承诺后缺失/下载/离线全成功。当前full286/1停止原日志保留，工程先同步North/QianKun/offline-work-pack，再完整核对并覆盖共13份同型spec前置IO；原断言/次数/超时保留。最终a04共13spec85/85定向通过，后继整492单run继续，详fixture-cache-*.json。


## 当前最终本地关闭（2026-10-18 13:36 +08）

a04单次完整492/492、0失败/跳过/flaky/重试、E2E_EXIT0。原HalfStep:153与North root/subpath前置、所有13同型spec均在本次整run通过。五类指纹结束后未变，确认P0/P1已关闭；保留旧失败日志与P2/性能/设备/F24边界。完整证明rc-acceptance-e2e-summary.json，发布仍须RELEASE_VALIDATION实证。
