# 公共策展快照与正常增量历史

作者基线 `7a2c22f74c46d74f07af8bd1a45893ec15daa49b`，远端main基线 `a6e5d5947ce2d06c6c2ab83e1cfd515c95191959`，两者无共同祖先。当前冻结RC为 `113872382f2697f94bbf8f5dc3c62692641cf731`；build/CI474/80均exit0，新完整492/492单run已exit0、19.2分钟，五类运行后hash核同。上一d62完整4920只作历史，新部署仅sw.js变化。隔离公共克隆从真实main继续；未切作者orphan、未改远端、未force。

## 明确来源与边界

`scripts/public-snapshot.py`从指定Git commit的archive取追踪对象。scope/扩展名白名单、明确排除、拒绝链接/特殊文件、大图固定hash与原公开字节三重例外、独立干净Git顶层、plan外置、每目标resolve边界，已独立审阅。不是把整个磁盘复制进镜像。

排除原典全文、docs/archives所有私档、候选原图、.workbuddy/.impeccable、env/key/pem/ZIP/bundle、大量原PNG/JPG证据。公开游戏脚本与编译数据允许保留；13个同版迁移旧JSON是7a的公开游戏数据，不是原典全文或私档替身。

文档/日志/JSON值/CSV中的机器路径仅在公共一侧脱敏。源码、锁文件、剧情字节与旧预期hash不做文本脱敏改写。固定用户名regex已从作者源泛化；3份真实来源日志提取结果完全相同。

## 实际预审

a04早期代码预审（历史中间快照）：2,250允许文件，73,556,666 bytes；最大文件 `docs/art/ASSET_MANIFEST_V6.json` 4,221,144 bytes（文字JSON）。只保留既有公开ferry.png大图，2,701,831 bytes，与远端原文件精确同hash。最终文档/精选证据加入后的完整数量见最终同步JSON与[发布回执](RELEASE_VALIDATION.md)，不能将这次中间值当最终HEAD体积。

`public-privacy-acceptance-code.json`：逐文件hash差异0，禁入路径0，秘密/私有绝对路径模式命中0；原典去空白512字符窗口/128步长样本在允许文本中无命中。该采样不是对所有编码/转述的数学保密证明。现有与新增运行素材已实际图像复核；未执行OCR，不用“未做OCR”虚称全图文字不存在。没有新增LICENSE。

## 冷检出与旧基线

隔离镜像重新npm ci/build/test，最终日志在项目外，归档摘要与最终退出码见FINAL_QA及public-cold-validation。原典与私档明确缺席；对应40个基线路径由helper告警、写missing清单，当前源码/资源缺失仍失败。公开单测通过不等于证明作者完整私档的字节。

正常源码差异遵循仓库 `* -text` 字节保护；比较公共跨代新增CRLF内容时临时启用Git cr-at-eol，不改源码行尾。两个原封历史材料含原始尾空格/末空行：round6-final-e2e-full.log与CHOICE_AND_PAYOFF_LEDGER.md。它们按原字节保留，公共首次跨代diff-check单列排除；其它已审文件的空白检查为0。后续干净HEAD的diff-check为0。

## 发布回执口径

先完整本地验收，再普通快进推送。等待确切公共SHA的Verify/Pages成功，下载该run的Pages artifact并逐字节对照线上资产，实际打开规定深链/点击/离线后记录回执。

发布回执属于文档。若随后仅同步完成回执，会生成新的公共SHA；必须再次等待其CI/Pages并核线上资产。作者私有侧最终回执记录最后公共SHA；公开侧保留上一已完成产品回执及最新Actions链接，避免把文档自身的SHA写入自身而造成无穷提交。部署相关869文件指纹（docs目录排除）在所有文档提交间必须不变。当前推送/云端状态见RELEASE_VALIDATION，未完成不得报成功。

公开复现边界补充：docs目录中的三份历史阶段辅助.mjs不在公开扩展名白名单（plan excluded可逐项看到）；当前回归反例及运行时审计入口保留在tests/scripts，不能把公开镜像称作包含作者全部私有审阅材料。109份ignored私档历史源码只在作者审计及每日库额外保全清单中，不进入Git archive或公开发布。

当前d62代码同步：隔离公共67eb150348013c06bdf328a95589395b3c987aa0、2388文件/85238633B，冷CI环境npm ci/build/474均0，869源与351dist同冻结RC；public-ci-cold-validation.json支持当前输入。首次普通f1推送成功但两workflow失败未部署；最终文档同步/正常追加/云端/在线回执另据RELEASE_VALIDATION，不能以中间快照称最终公开HEAD。

新SW代码策展plan：2420文件/86413768B，隔离本地4d14cda（未push），public-plan-sw-code.json（外置）；全部hash/禁入/秘密/原典窗口0命中、159MD/426本地链接0问题。冷CI环境ci/build0、474独立运行。67eb真实发布成功但旧SW升级后离线首页P1已证，最终修复版推送/云端/真实升级仍须RELEASE_VALIDATION，不能沿用旧终态。
