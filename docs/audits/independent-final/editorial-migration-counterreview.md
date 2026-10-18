# 同版本编辑订正存档迁移：独立反审

2026-10-18。当前状态：**源码与运行时反审通过；真实 Git 旧输入独立核实、单点迁移及7项拒伪造实测通过，工程定向22/22、父代理浏览器7/7最终日志均已独立读码复核。** 仅本报告由 canon_late 写入；不改 src、tests、生成物，不运行编译或全量测试。最终RC `ec53af4…` 冻结后仅追加报告。

## 证据与原行为

已全文读取 `src/vn-runtime.ts`、`src/edition.ts`，以及 `src/player.ts` 的初始化、render/persist、keepDraft、begin/load、存档与导入、pagehide 调用链。codebase-memory Verify：项目 `D-xia-zai-AI-project-Project-in-Iteration-Jianghu`，generation `2026-10-18T03:34:46Z`；三路径均 `metadata_changed`，所以结构判断全部回源，不以图的 no_recorded_issue 充作完整保证。

`restoreVN` 重放命令后比较 runtime 整串及 presentation；改过字的同版本旧保存可能不再相等。现有例外仅处理画面和旧样章，有 frozen previousContent 验真及叙事等价门槛；“旧命令仍能走”本身并不足够证明上传 runtime/stage 可信。父代理已在真旧7a数据的 `lm_sore_14` 复现拒读，本代理此阶段未重跑，不将父的复现冒称自己的实测。

## 必须满足的反证约束

1. **来源限定。** 只有显式当前作品 slug、准确版本、固定旧 compiled 指纹可参与。冻结入口、另一作品、旧代际版本即使命令前缀近似也不能复用迁移源。版本串一致不能替代 edition 身份。
2. **先验真旧档。** 对仓库携带且核过 SHA 的旧 JSON 以原 seed 重放全部 commands，验证提交 runtime 与 presentation 等于旧重放结果；伪造变量、stage、beat、phase、commands 任一项必须拒绝。不得把用户给出的 runtime 直接加载进新 story 再“修”舞台。
3. **再重放新正文。** 返回会话与保存必须来自新内容同一命令序列；旧保存只作核验与原始备份。比较全历史 frame ID、phase、ending、每次可选 CID/index 及变量状态。可允许核准正文、选择显示文案或演出订正，不能把新CID当作旧玩家曾选，不能让历史胜负、死亡或门派因迁移重判。
4. **覆盖改字后的停档点。** 不能只测试恰停在已改单句的 save；Ink runtime 还含位置与输出等状态，同一路径此前经过改字、现在停在后续选择或结局也可能变化。必须有改字前、改字拍、下一拍、后续 choice、ending 的真旧命令反例。
5. **保留原始 raw。** 启动自动恢复、封面继续、`#play`、手动槽、文件导入都要覆盖。备份写失败不得覆盖 auto；pending raw 不可丢。已有同raw备份可复用，时间戳碰撞应另键。读取失败、quota、只对 draft键拒写、只对auto键拒写要分别测试。
6. **多页与失败原子性。** 迁移前若另一页修改 auto，应保留新值并允许导出本页；导入先备份上传旧raw，再保存原auto，再写新auto，任一步失败不替换会话。不能因为迁移成功就悄悄重写手动槽或其它作品prefix。备份键可见并可导出真raw。
7. **新档不误迁移。** 当前strict可验证的保存优先走原路径；不应为所有存档无条件复制巨量旧JSON或反复造draft。`savedAt` 原值保留；迁移说明应准确说正文订正，不继续声称只是画面更新。
8. **真测试输入。** 测试旧输入必须由7a的真实compiled+旧运行时生产，记录文件或git blob指纹；不得复制当前JSON后字符串替换一个字伪装旧内容。负例要包括旧JSON hash不符、错版本／冻结slug、命令追加／缺失／非法CID、runtime变量与presentation伪造。

## 新实现独立复核

工程通知 diff 成形后，直接读完 `src/editorial-baselines.ts`、3个原模块语义差异、`tests/editorial-save-migration.test.ts` 与 `.spec.ts`。新增三路径 coverage 同样 metadata_changed，继续 source fallback。

- **真旧字节 CONFIRMED。** 本代理用 Python subprocess 原始 bytes 获取 `git show 7a2c22f74c46d74f07af8bd1a45893ec15daa49b:src/generated/<slug>.json`，逐项与迁移目录比较，不经文本转码。13/13 逐字节一致，共1,236,960字节，并核manifest的bytes/SHA；它们不是改当前字符串伪造的旧fixture。
- **作品隔离 CONFIRMED。** 独立导入真实 `chronicleWorks` 与 manifest，13个version每个只命中一个同slug登记；没有冻结alias共享这些version。edition只为选中chronicle获取对应old JSON，首页没有选中作品就不加载。此判断只针对当前登记，不将未来重复version也当安全。
- **新正文链路 CONFIRMED-CODE。** strict当前比对在前；失败后才核editorial旧源。代码从新旧初始帧开始，每个command后比较除text外全部Beat字段（含stage、tags、choices文案及index）、每步variablesState，最终旧runtime与presentation又必须和提交完全相等。返回的是新重放session/expected，而不是旧LoadJson。舞台或choice文案有差也不会被正文迁移误容忍。
- **独立运行的最小反例 PASS。** 通过stdin直接运行只读Node探针，在真旧longmen以 `lm_route_guest`、`lm_deliver_exact` 覆盖默认选择走94条命令至 `lm_sore_14`：旧句“看见我输这一回”恢复为“看见我只同罗先生打平”，migration=`editorial-text`。同一raw分别伪造beat、phase、scene、runtime变量、额外next、版本、跨作品edition，共7项全部拒绝；迁移后保存再次restore走strict，没有反复迁移。探针未编译、未写产品或证据共享文件。
- **备份顺序 CONFIRMED-CODE。** render对任何pending备份都会persist；keepDraft成功前pending保留，draft写失败不会接着写auto。最终 `saveSlot` 先保留pending，再对既有槽restore验真；仅返回migrated时保留该槽旧raw，strict当前档及显式覆盖坏槽沿用原语义，不为每次普通存档积累draft。备份失败会抛回外层safe，槽不写。load候选先验真，之后keepDraft→previous→auto→会话替换，原路径顺序未倒置。正文提示及备份标题已有专门文案。
- **第一次工程日志只算18/19。** 外部 `workspace/editorial-save-migration-first.log` 的13篇全路逐拍、4伪造、显式旧源需求通过；最后结构反例失败在测试替换不存在的speaker字符串，未执行到restore拒绝断言。已通知工程修真反例并补choice文案；不能把这份日志写成19/19。
- **最终定向日志22/22。** 已直接读外部 `workspace/editorial-save-migration.log`，22 tests/pass22/fail0/skip0，约26.5秒。补修后的speaker、choice-text、variable各先断言确实改过compiled，再要求restore拒绝；错作品与冻结edition亦有断言。runtime现另核manifest version白名单，防止随意给未登记版本editorialContent就启迁移。这里是独立复核工程实跑日志，不冒称本代理又跑了22项。

## 最终浏览器日志复核与边界

直接读完最终 `tests/editorial-save-migration.spec.ts` 全7例与 `docs/audits/independent-final/editorial-migration-browser.log`：1 worker、7 passed、约5.0秒、`BROWSER_EXIT=0`。这是**独立检查父代理真实执行日志和断言**，并非本代理重跑这7例。

| 已关闭项 | 最终断言实际证明 |
|---|---|
| 真旧auto迁移、raw可恢复 | 旧JSON生成的raw在目标拍显示新正文，commands相同；旧manual槽不变，draft下载逐字节等于raw；reload后仍新正文。初始化脚本不在reload时重注入旧auto。 |
| manual读取和文件导入 | 旧manual恢复新正文，槽raw不变、previous保留fresh，上传旧JSON也有raw备份。 |
| draft写失败 | 实际点击已占槽“确认替换”，不是只打开确认页；旧auto及slot均不变，继续后导出本次会话的commands确已增加。 |
| 仅auto写失败 | 旧auto原raw不变，但draft已成功且能下载得到相同raw，避免把“auto失败”与“完全未备份”混为一谈。 |
| 导入备份失败 | 看到backup quota反馈后，当前beat及auto fresh都不换，未把候选会话先渲染到界面。 |
| 普通strict手动替换 | draft键强制拒写下，推进后实际确认覆盖slot，等返回“存档与备份”页面再读存储；新commands增加、draft仍空。证明最终收窄不会令普通手动保存因不必要备份失败。 |
| root／子路径冷离线 | 两独立context分别下载作品、等SW ready、离线后导航再reload；两处均显示新正文并保留真旧raw备份。 |

第一次浏览器尝试 `editorial-migration-browser-attempt1.log` 仍保留，不以最终通过抹掉历史。父代理报告的当时失败是未实际点确认／DOM时机；本代理对最终spec已确认这些步骤具备真实点击、反馈和等待，最终日志与7例对应，不把第一次尝试称PASS。

仍未在本轮新增迁移spec独立实跑的边界：多标签页同时写入的交错时序、Date.now相同造成backup键碰撞、存储getItem本身抛错、13篇所有可能选项组合的浏览器恢复、真人试读、Safari/Firefox/Android。源码有observedAuto与碰撞后缀保护，但不能据此把上述边界全报PASS。本报告不替代父最终新RC build、完整E2E或外部真人验收。当前范围未发现需要废弃最终RC的新增P0/P1。

## 完整回归发现后的单行修复反审：fcef368

此前“render对任何pending均立即persist”的判断只核了新迁移，漏掉原HalfStep延迟写回契约。旧完整492项运行以491通过／1失败结束，该失败保留，不以原raw已有备份抹掉。此节明确取代上文关于所有pending首次render写回的描述；之前22/7项的执行输入仍按其各自日志保留。

本代理直接读取提交 `fcef368840ab9d69795b481f2a42b9a0491affc8` 的Git差异、当前 `src/player.ts:61–82`、edition判篇与两个兼容源字段、原 `tests/player.spec.ts:153–165`、新 `tests/editorial-save-migration.spec.ts` 全7例。**本轮为源审，没有亲自构建或运行测试。** 提交只改 `src/player.ts:67` 一行，把render时persist条件收窄为：

```ts
pendingDraftBackup && (campaignEdition.previousContent || campaignEdition.editorialContent) && !persist()
```

|条件|源审结论|
|---|---|
|无pending，无论篇目|不在render额外persist，与本次兼容迁移无关。|
|HalfStep旧样章pending，两个字段都undefined|render先显示新人物名／当前beat，但不写auto、不清pending；完全保留原player:158的“首次进页auto原raw不变”断言。下一次advance仍走 `progress→session.advance→present→persist`，keepDraft成功后才写1.0.1，原slot保留；player:159–164正覆盖这一时序。|
|旧画面迁移pending，previousContent存在|或条件为真，继续立即persist；没有因新增editorial字段把旧ending/illustration兼容路径排除。|
|同版正文迁移pending，editorialContent存在|或条件为真，继续立即保留原raw并写新auto；新spec第一例在首次`goto #play`之后、不推进就检查draft、auto已改变、commands相同及raw下载，防止误退成HalfStep式延迟。|
|上述立即persist时draft写失败|原persist的keepDraft→清pending→writeAuto顺序未改；keepDraft抛错时pending与auto仍原样。新spec draftquota与import失败断言未放松。|

源审裁定：**最小修复正确区分三类迁移，HalfStep延迟写回与previous/editorial立即备份均保留；未发现该行新增的P0/P1。** restore严格验真、版本白名单、手动槽限定备份、原raw去重／碰撞后缀均未改。本轮没有更改旧测试来接受提早写回。

父代理 `rc-release-targeted.log` 此次读取时已记录7个新迁移case通过，player整spec仍在执行（日志尚无最终总计／退出码），所以本节不写目标整批PASS。父已报告build exit0，属于父执行证据；随后新RC完整492结果仍须单独更新，不沿用ec53的491/1或旧专项充作新RC全量通过。
