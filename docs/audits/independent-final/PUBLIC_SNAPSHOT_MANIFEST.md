# 公共策展快照与正常增量历史

作者基线 `7a2c22f74c46d74f07af8bd1a45893ec15daa49b`，远端main基线 `a6e5d5947ce2d06c6c2ab83e1cfd515c95191959`，两者无共同祖先。当前冻结RC为 `113872382f2697f94bbf8f5dc3c62692641cf731`；build/CI474/80均exit0，新完整492/492单run已exit0、19.2分钟，五类运行后hash核同。上一d62完整4920只作历史，新部署仅sw.js变化。隔离公共克隆从真实main继续；未切作者orphan、未改远端、未force。

## 明确来源与边界

`scripts/public-snapshot.py`从指定Git commit的archive取追踪对象。scope/扩展名白名单、明确排除、拒绝链接/特殊文件、大图固定hash与原公开字节三重例外、独立干净Git顶层、plan外置、每目标resolve边界，已独立审阅。不是把整个磁盘复制进镜像。

排除原典全文、docs/archives所有私档、候选原图、.workbuddy/.impeccable、env/key/pem/ZIP/bundle、大量原PNG/JPG证据。公开游戏脚本与编译数据允许保留；13个同版迁移旧JSON是7a的公开游戏数据，不是原典全文或私档替身。

文档/日志/JSON值/CSV中的机器路径仅在公共一侧脱敏。源码、锁文件、剧情字节与旧预期hash不做文本脱敏改写。固定用户名regex已从作者源泛化；3份真实来源日志提取结果完全相同。

## 当前已发布快照与历史预审

已发布并完成正式产品验收的公共快照为f48614493ec4340355602f77d64b19c02220781e：2451允许文件、88,697,548B，最大文件docs/art/ASSET_MANIFEST_V6.json为4,221,144B（文字JSON）。既有公开ferry.png为2,701,831B，与远端原文件精确同hash。此数绑定f486，不冒作后续docs-only Q最终HEAD体积。a04早期2250文件/73,556,666B仅为历史中间预审。

`public-privacy-acceptance-code.json`：逐文件hash差异0，禁入路径0，秘密/私有绝对路径模式命中0；原典去空白512字符窗口/128步长样本在允许文本中无命中。该采样不是对所有编码/转述的数学保密证明。现有与新增运行素材已实际图像复核；未执行OCR，不用“未做OCR”虚称全图文字不存在。没有新增LICENSE。

## 冷检出与旧基线

隔离镜像重新npm ci/build/test，最终日志在项目外，归档摘要与最终退出码见FINAL_QA及public-cold-validation。原典与私档明确缺席；对应40个基线路径由helper告警、写missing清单，当前源码/资源缺失仍失败。公开单测通过不等于证明作者完整私档的字节。

正常源码差异遵循仓库 `* -text` 字节保护；比较公共跨代新增CRLF内容时临时启用Git cr-at-eol，不改源码行尾。两个原封历史材料含原始尾空格/末空行：round6-final-e2e-full.log与CHOICE_AND_PAYOFF_LEDGER.md。它们按原字节保留，公共首次跨代diff-check单列排除；其它已审文件的空白检查为0。后续干净HEAD的diff-check为0。

## 发布回执口径

当前113产品完整492已通过，公共67eb→f486正常FF已push0，精确Verify39105624826/Pages39105624823均success。对应CI artifact与正式HTTPS351/351文件、37,008,548B逐字节相同，tar SHA-256为3b08472977212f10cd412312ddd77e82fab388a1b2cf7cba317f24275dbb3e99；鲜Chrome26入口/交互/刷新PASS，正式67eb持久profile严格更新后断网16卡及龙门1→2通过。实际根回执normal-push-sw-accepted.json、cloud-sw-accepted-success.json、pages-artifact-sw-accepted.json、online-sw-accepted.json及RELEASE_VALIDATION可核。

发布回执属于文档。后续仅同步已完成回执会生成docs-only Q；必须再次等待Q精确CI/Pages并核对应artifact与线上，不预报未发生结果。作者私有最终receipt记录最后公共SHA，公开侧保留f486已完成产品回执及最新Actions链接，避免文档自身SHA循环。部署869文件指纹（docs目录排除）及产品/测试/工作流在所有文档提交间必须不变。产品已完成部署，最终文档SHA复核和私有收尾仍待完成。

公开复现边界补充：docs目录中的三份历史阶段辅助.mjs不在公开扩展名白名单（plan excluded可逐项看到）；当前回归反例及运行时审计入口保留在tests/scripts，不能把公开镜像称作包含作者全部私有审阅材料。109份ignored私档历史源码只在作者审计及每日库额外保全清单中，不进入Git archive或公开发布。

历史d62代码同步为67eb150348013c06bdf328a95589395b3c987aa0、2388文件/85238633B，public-ci-cold-validation.json只支持当时输入。其CI artifact↔HTTPS351原字节同；Linux CI↔Windows d62仅347/351同，4份offline清单仅URL数组顺序不同，排序逐项同且无增缺/重复。不能把跨平台语义等价写成351字节同。首次f1两workflow失败、67eb正式旧V6窗口离线失败均保留历史。

历史113代码plan为2420文件/86413768B、本地4d14cda，public-plan-sw-code.json仅是推送前中间输入；冷CI环境ci/build0、474独立运行。其后同产品回执同步并发布f486，已完成本节所列正式验证。旧V6已闭窗口未dump缓存HTML，不能唯一追认层；受控严格a6→113四case和正式67eb→f486持久窗口成功分别登记，不以鲜Chrome替代升级证据。
