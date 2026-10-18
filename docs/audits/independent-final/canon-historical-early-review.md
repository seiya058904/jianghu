# 历史作者源补审（early）

审阅人：独立代理 canon_early；日期：2026-10-18。结论：本分工历史源实际文本审阅完成，保留冻结字节；不能把这一结论当作历史版本新编译、全分支运行或浏览器通过。

## 实际覆盖与分母

- 外部 `workspace/review-missing.json` 中，排除父代理已读 production-direction-v6/v7 后，story 缺漏共 124 路径，排序前半 62 路径归本代理，终点为 `story/drafts/north/north-author.mjs`；后半归 canon_late。
- 这 62 路径中，48 个唯一文本已用 UTF8 实际逐行读完，合计 3,798 行；另 14 路径与其中代表直接逐字节比较相等，标记 `BYTE_COPY_VERIFIED`，不声称另行逐行读过。
- engineering 追加分配 `workspace/archive-unique-early.json` 的 36 个 docs/archives 独有代表，全部实际逐行读完，合计 4,804 行。它们不与本组 48 个文本重复计为同一文本。
- 本清单共 98 路径；其中 **84 个完整实读文件 / 8,602 行**，**14 个字节复制核验路径**。逐项路径、SHA-256、物理行数、实际阅读范围、证据方式见同目录 `canon-historical-early-files.csv`。行数按 UTF8 解码后 splitlines 计，末尾换行不增加虚构空行。
- 这只是本分工分母。未将 engineering 已审等价归档、canon_late 后半、其他 docs 或生成 Ink/JSON 记作本次逐行实读。等价覆盖的全局聚合由 engineering 另行登记。

## 逐组判断

| 历史组 | 实际阅读内容与结构判断 | 裁定 |
|---|---|---|
| north-v2 冻结源（6） | 从扎枪起步、周/楚/司马三师、地方与南北榜、顾园308招、76岁茶席至80余岁枪房。顾胜半筹、秦仍未返真固定；选择改变学法、书信、同伴损失与记述。旧茶席段存在后发生顾园之事倒灌，不应回写冻结文本。 | 保留历史；现行已有分时修正，历史恢复不能直接顶替现行。 |
| qian-kun-v2 冻结源（6） | 少年、慢练、云路、掌门与后来四模块按固定导出顺序组合；重大挑战与第一剑判断固定，去留与门人传承不同；没有以选项复活或改榜。 | 保留；历史存档只绑定历史内容版本。 |
| 密库双贼 draft/round1/2/3 | 所有唯一 vault/flight/temple/aftermath 文本实际回读。双 POV 提供己方内情，揭令后共同承担；江两救沈、江固定死亡、转沈独行、真璧低价当掉、十一年后桌卖及十三年压缸链保留。假货美化不赋予真物神功。不同轮次逐步补工钱、匠徒伤害、山口动作、后续回响。 | 保留编辑历史，不把未回响旧 flag 当现行孤儿结论。 |
| 山河璧 draft/round1/2/3 | buy/stores/grain/night/after：十三文加婚书、剥金读取暗刻、坏库与常仓、第七守粮/第九破璧分线、伤稿损失、交差与婚书回响。双夜分别有亲见/转报，非一个人同夜在两库。部分早稿把未来酬钱写成已付补差，后续稿改为当下实付与余欠区分。 | 保留；恢复旧稿须保留其旧版本身份。 |
| kuhe-editorial draft 与归档 baseline/round1/round2 | 四份完整实读。掌门/旧人固定招序及空劫、无生客死亡，孟归藏第七日醒、司马玄极终身左臂重残与30年不出山均保留；玩家救护者不会改变主战结局。旧稿将同门 ready 与 second-ready 合并，后稿拆开其留营/送水职责，腕伤有条件后果。 | 保留；不以现行回响覆盖旧存档文本。 |
| longmen draft 与 baseline/round1/round2 独有文件 | 许回述清和三刀、门人/外客两早线、石胜许及与罗平、贺47招胜石、章九剑、贺章私谈/次晨门人分 POV、五年后自退榜均实际阅读。后续轮次补伤臂及第四日补试、同行错过会面、门人交班，保留已做/未做的代价。 | 保留历史；发现同一假败句曾残留现行，已另报父代理并完成源修复，见下。 |
| north draft after/author | 两份完整读；author 重新导向旧人 ID 和阿原年龄，不改变秦门派；after 茶席承载未来顾园记忆属旧稿时序问题。 | 保留旧稿，现行 after 已明确76岁与80余岁并记的时间界线。 |
| docs/archives 密库双贼与山河璧基线 | 10 个独有文本完整读。早期任务措辞、事实卡命名及偿付表达与现行有差异；江固定死亡、山河璧非武学/第七第九分工仍成立。 | 冻结，不把 archived author 的写出目标误认成现行构建入口。 |
| docs/archives 青石 baseline/round1/2/3 | 14 个独有文件完整读。青石四友死亡、许92岁守时间战死固定。baseline 仍有韩家后辈、四户送物、无伤也说伤药等旧问题；round1/2 修亲缘与无伤分支，round3 新增返乡半日取舍及末段回响、伤亡与送灵视角。年龄镜头仅17/46/92及末战前撤下旧人，无死后立绘复生。 | 保留历史，恢复必须用相应版本源和存档命名空间；不能倒退现行修订。 |
| docs/archives 海天门 entry/author | 两份独有源完整读：12岁试门、17岁外院/18岁潮试、29岁风暴入口；作者 look 明确阿岑 child/youth/adult/late 与叶晚年；东极和蓬莱不混港。 | 保留；本两文件不代表 rescue/seats 本轮新实读，后者由等价覆盖聚合处理。 |

## 反例与恢复边界

**现行串线 P1：已由父代理修复关闭。** 历史和当前 `story/longmen-author.mjs` 早外客线都出现“看见我输这一回”。当前文件审查时为第85行，条件 `lm_early_route == 2` 且 `lm_early_practice`。此前石119合胜许，又胜第七、险胜第五、与罗平；贺47招一场尚在后面。因而这里没有石已经输过的实际前置。父代理核实为 P1 后，已同拍原位改为“看见我只同罗先生打平，还肯照原话递么？”，保留 beat/ID/变量；另补第6个 early 反例，明确选择 lm_route_guest + lm_deliver_exact。父代理报告旧 generated 先失败日志 longmen-counterexample-before.log，统一编译后两文件66/66通过 after.log；这项编译后测试由父代理执行，本代理未冒称执行。新最终 RC 的全量测试与该拍浏览器复核仍待完成。本代理未改产品或冻结源。

**历史差异不是当前缺陷重报。** `story/drafts/north/north-after.mjs:60` 的顾园记忆倒灌，现行 `story/north-after.mjs:60` 已明确80余岁整理与76岁旧茶席分开；`docs/archives/jade-v1-editorial-baseline/jade-after.mjs:14` 未来酬钱先补路费、青石旧基线韩家亲缘与无伤药钱，均是冻结编辑史证据。本轮不变更其字节。

**历史模块不得原地 import 执行。** 这些作者文件含顶层 `writeFileSync`，目标包括当前 `story/<work>.ink` 或固定 draft 输出。有的归档保留原位置相对 import，如 `./chronicle-writer.mjs` 或 `../../chronicle-writer.mjs`；归档目录只是保存原字节的容器，不能据其现址可解析与否判断原作品必定可运行。恢复应在隔离副本重建原相对目录、对应 helper/catalog/contentVersion 后编译验证，不能直接载入冻结目录污染当前输出。

**构建分母分开。** 重新只读核 `scripts/compile-story.mjs:4-28`，直接 import 的25个作者入口均为 story 根下现行纪事或 campaign 两世代，未直接 import archive/drafts。其后仍编译人工 `main.ink`/`duel.ink`。该27输出口径已在 `canon-legacy-review.md` 逐项说明；历史补审98路径不能加到现行23版本里。

**恢复证据分级。** 只读引用 `tests/longmen-editorial.test.ts:13/19`、`tests/north-editorial.test.ts:18/49/57/80`、`tests/qian-kun-editorial.test.ts:19/41/53/69`、`tests/qingshi-editorial.test.ts:14/17`：代码分别检查历史字节映射、当前save恢复帧、跨版本拒绝或round快照哈希。本轮没有运行这些会写共享 evidence 的测试；它们的存在不等于本轮已执行历史恢复。字节完整、文本实读、运行时恢复、浏览器全程是四种不同证据。

## 本轮执行限制

无编译、无历史作者 import、无 shared evidence 脚本；无 src/story/public/dist/package/冻结哈希改写。本轮唯一产品外测试修改已提前交回父代理：两份 independent canon helper 强制全部 requested CID 实际命中，CL23/CL25正向分量补强；仅两文件 unit 实测65通过、0失败。该测试通过不覆盖本历史98路径运行。

## 龙门 P1 修复的独立反证（源码层）

2026-10-18 只读比较 `git diff dd81 -- story/longmen-author.mjs tests/independent-canon-early.test.ts`：作者源仅同拍替换旧假败句，前文许承认慢半分、石又胜第七险胜第五并与罗百余合记平，后文才搬架进贺门并在47招认输，故改为“只同罗先生打平”符合当前因果顺序。新增第6测试明确传入 `lm_route_guest` 与 `lm_deliver_exact`；run helper在每次真实 ChooseChoiceIndex前记录所选choice标签，故事结束对所有requested未命中列表断言为空，两个CID均不能被静默跳过；测试同时正断言前文罗平、目标新句，反断言旧句，未删原断言。本代理本阶段仅审源码和测试，不重复父代理66项运行、不声称新dist已验证。外部浏览器脚本已准备：从作品库/新开局、逐个真实按钮经上述双CID，抓取前因平局、新句、贺门真实败局；待父确认新dist后执行1440与390两档，不注入中途存档。
