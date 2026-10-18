# 可执行历史源补审

完整逐行补读七个 campaign 作者及直接 helper、两个人工 Ink 源；不编译、不写剧情、不运行共享证据脚本。确认三项历史内容缺陷，均已交父，不将冻结字节保存误报为文本正确。

## 分母与实际阅读

`scripts/compile-story.mjs` 全读：直接 import 25 个作者入口，分别生成23个现行纪事作者输出与2个历史原创地方篇输出（campaign / campaign-v6）。另外编译 main / duel 两个人工 Ink，循环分母27。父已全读 production-direction-v6/v7、chronicle-writer、npc-archetypes，early/late CSV 覆盖余下23个纪事作者；本轮只补空缺的两入口及其七文件闭包，不重算他人阅读为本人阅读。

本次全读：

- `story/campaign/author.mjs` 956行：V5作者正文、选择、八类结局与输出器。
- `interludes.mjs` 199行：11处重定向插入的具体关系场景。
- `v6-author.mjs` 70行：从V5分节构造V6、锚点替换、删除旧归宿并插新场、actor隔离与写出。
- `v6-scenes.mjs` 203行、`v6-after.mjs` 154行、`v6-canon-scenes.mjs` 147行、`v6-ending-direction.mjs` 15行：留守、具结、风口、后日、旧案映照与八类结局演出。
- 人工源 `story/main.ink` 458行、`story/duel.ink` 262行。只做结构、合法选择、固定剧情与兼容风险审查，没有重新开展同等深度的逐句文学终审。

七个作者/helper共1744行，两个人工源共720行。另读compile及恢复相关测试；精确路径、观察时SHA与局部范围在 `canon-legacy-files.csv`（18行）。其中生成Ink只做正则结构扫描，生成JSON只做运行时探针，明确不计为全文阅读。

代码图 search_graph(compile-story)后 check_index_coverage：generation `2026-10-18T03:00:16Z`，四个脚本 metadata_changed、main/duel not_tracked；采用实际一手源fallback。

## 结构、选择及固定剧情

main 为21 knot / 32 CID；duel 为11 knot / 28 CID / 108 beat；campaign生成Ink为87 knot /135 CID /1006 beat；V6为121 knot /182 CID /1325 beat。此次只读正则检查四份全部无重复knot/CID/beat、无悬空跳转目标（END/DONE为合法终点），没有调用Compiler。

main 的 public 需proof，common需押金、trust、救人、公开认错、证人同意五条件，quiet/leave兜底。切缆、陆栓失踪、欠款事实固定；玩家只改变核证、公开方式及新渡约，不复活失踪者或凭证自动洗清责任。顾七的同意受早期倾听影响；受伤随rash进身持续到尾声。已有 runtime.test 对全状态终止、条件门槛、节点/CID覆盖与每选择恢复做断言；本轮只读，不执行会写 reading-metrics / graph-coverage 的该测试。

duel 为原创地方剑馆，不改六门史；观脚才可借落步，honest且观脚才有新步条件，three endings通过明确route切入。旧名称稿通过 VNRuntime迁移测试替换谢临川→谢行舟，保持变量、presentation和命令轨迹；看过测试1–105行，不称本轮重新执行或全读剩余测试。

V5作者choice生成每分支effect后接明确next；插入helper先替换既有目标再写新段，避免新段自跳。V6从V5稳定分节提取，replaceIn缺锚立即报错；route=3通向留守，原路仍有陆/水；V6 actor统一加前缀，避免改V5旧人表情解释。v6-ending-direction仅改scene/cast/cg，验证八family都出现，不改词句、beat或命令；但seen.size=8不等于验证所有特定结局beat完整，仍须原恢复/集成测试。

## 确认缺陷与最小修法（未修改）

**CL01 / P2 / CONFIRMED：V6虚构此前已赢的私试。** `story/campaign/v6-canon-scenes.mjs:85–86` 写许竞川“那次败给你的私试”“我输的那场可以写”。原作者 hall_exchange 的合法分支中，yield_side在161行明确“接住了。不过我没输”，call_stop玩家认输，press_again在165行明确“别把这叫赢”。没有同一玩家此前真赢的私试。

只读现有 `src/generated/campaign-v6.json`，选择read_weight + yield_side、其余first合法项，先得到“接住了。不过我没输”，随后确实得到上述两句败绩。此探针证明当前生成物也携带问题。最小修法是把不确定的“败给”改成中性“私下问手”，许说“我们真打过的那场可以写”，下文“已真打过的私试”可保留。若改实际胜负则扩大历史剧情与存档迁移风险，不采用。

**CL02 / P2 / CONFIRMED：V6旧事错名。** 同文件33行“沈归潮赢过周望海，四十九岁仍没得九席”，事件明确指沈见潮；原典无“沈归潮”人物。现生成物只读路线也显示此句。最小修法只换人名为沈见潮。该处不涉及新角色或境界补写。另88行“谢藏锋”是原典真实名，不能因dead-ranking当下出现谢无灯化名而误改。

**CL03 / P2 / CONFIRMED：duel无伤路线仍记挨手。** 人工源173行route_question固定“手背还留…浅红印”，261行road末句固定“手背那一下”。只读现 `duel.json` 路径bold → protect → watch_foot → yield_half → claim_win → pause_and_ask → take_road → return_with_practice：先看到林收剑、未丢木剑，后闻放剑让站脚，未有打手事件，却仍显示两处红印/挨打回忆。最小修法须按first_result及第二次是否repeat_move判断，或原位改为普适的脚步记忆；历史半步之约已有兼容稿，不应在RC期间擅改版本/冻结基线。

V5另有宽泛“伤处”用语，V6已用wound条件细分。旧稿留存不等于通过现行文学门槛；本次优先记录清楚可复现的三项，不进行历史全面修辞改写。

## 冻结恢复边界

`tests/default-entry.test.ts` 全读：根/index属于作品库；只有tide-v6选择原创V6，tide-v5选择冻结campaign-v5-1.0.0；版本prefix互不继承，并比较campaign.json与冻结V5字节。改V5作者即使不直接改archive，也会在下次构建写campaign并触碰其相等契约。

`tests/frozen-baselines.ts` 全读：缺失原典/docs/archives条目返回null并记录跳过，不能把公开镜像skip算完全恢复通过；一般必需冻结文件缺失会throw。本轮没有导入它，以免exit hook写共享报告。`story/archive`、`story/drafts`、`docs/archives`没有逐句读；本轮仅执行对这三目录的 `git diff --name-only`，输出为空，说明tracked字节相对HEAD没有工作区修改，不证明所有未追踪文件或所有归档内容正确。原字节基线与恢复验证以父最终统一冻结检查为准。

没有运行编译、历史测试套件或shared evidence脚本；未修改任何story、生成物、归档、冻结预期哈希。运行时这里只证两条确定反例，不冒称全路径覆盖。上列P2需要父决定纳入后续版本修复或明确登记为历史保留问题。
