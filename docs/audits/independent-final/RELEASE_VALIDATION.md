# 发布验证：当前状态与逐次回执

作者原始基线 `master@7a2c22f74c46d74f07af8bd1a45893ec15daa49b`，公开main原始基线 `a6e5d5947ce2d06c6c2ab83e1cfd515c95191959`，无共同祖先。认证和仓库所有者seiya058904。作者完整历史不向公开推送；公开隔离克隆从main正常增量，不force。

## 当前验收点

新冻结RC `d62f99f09f71bf895e63dc93757df45fa033200d`：build0，CI=true/GITHUB_ACTIONS=true的474/474单测与80/80编辑子集均exit0。新完整492/492单run通过，8workers、19.0分钟、零失败/跳过/flaky/重试、E2E_EXIT0。实际JSON独立解析与五类运行后文件hash全核同，见rc-ci-e2e-summary.json；原断言/超时未削弱。产品669、dist351与前一a04完整492PASS输入逐字节相同，只有unit告警测试的输入改变。rc-ci五类manifest与input-equivalence给出边界，前一a04完整PASS只保留为历史，新终态另有完整run。

## 已完成的首次普通推送与真实云端失败

2026-10-18 13:40:21 +08 普通 `git push origin codex/independent-final-publish:main`：a6e5d59→`f1d4b377ec317e964c4a4ff79ae74aa826aa9642`，exit0，来源作者be56235。源/公共历史保持独立，没有force、remote改配或覆盖他人提交。实际remote已核同。该次公开2384文件/85232229B，源代码与已经完整验收的a04相同。

- [Verify](https://github.com/seiya058904/jianghu/actions/runs/39101353779)：failure。
- [Pages](https://github.com/seiya058904/jianghu/actions/runs/39101353730)：failure，unit473/474，未上传/部署站点。

唯一失败：historical-baselines-policy断言只在stderr找缺席告警；产品测试helper在GITHUB_ACTIONS按原设计写stdout的::warning注解。子进程exit0/null均正确。保留cloud-first-pages-failed.log/cloud-first-failure.json，以及本地同环境先复现失败的ci-warning-original-actions.log。修订仅限unit：两显式环境×原六模式，原status/null/throws均保留，新增精确双通道和缺席report核验；见ci-warning-channel-review。不是修改产品输出来讨好测试，不假报首次云绿。

## 当前公开修订冷检出

隔离本地HEAD `67eb150348013c06bdf328a95589395b3c987aa0`，来源d62，已于2026-10-18 14:14:52 +08普通FF追加push，远端实时核同。2388允许文件/85238633B；隐私与原典窗口探针0命中，未加LICENSE。CI=true/GITHUB_ACTIONS=true下冷npm ci0/build0/474单测0，全部2388plan文件无漂移、869部署源/测试与351dist逐hash同冻结RC。证据public-ci-cold-validation.json与public-ci-install/build/tests.log。

公开缺席40个原典/docs archives基线路径已逐项核准并告警；它们不是40个测试失败，也不是作者侧跳过。作者完整冻结字节仍断言；公开归档完整性明确PARTIAL。完整原典Git blob在此前公开对象库缺席检查与逐文本窗口探针互补；最终公开HEAD还须重核，见public-history-canon-check.json、PUBLIC_SNAPSHOT_MANIFEST.md。

## 最终发布与正式线上（尚待执行）

|项|当前证据/待完成点|
|---|---|
|最终RC全量与不变性|PASS：d62新完整492/492，独立JSON/runner exit0及全部五类文件hash已核同|
|已完成修复普通FF|f1→67eb150普通push exit0，normal-push-ci-fixed.json；精确Verify39103362100/Pages39103362099已启动，待成功，不预报上线|
|最终公共SHA/作者对应SHA|由正常提交与推送回执记录，两个SHA不应硬凑相同|
|精确最终Verify与Pages|必须等该SHA两workflow success；旧失败不能拿以后可能绿掩盖|
|CI artifact与正式在线字节|下载精确Pages run artifact，安全提取，逐文件HTTPS对照全部部署文件；不拿Windows构建代云端artifact|
|正式Chrome双档/深链/交互|26入口、真实开局及太华/龙门/死人两选择与刷新，检查console/network/image decode/横溢；未执行不得PASS|
|真实旧SW原地更新/断网|长窗口旧正式SW+龙门包已提前独立准备，首次新Pages成功才发实际publicCommit信号；短2h等待窗因CI失败未发信号过期，见online-short-window-expired.json，不当产品SW更新失败|
|最后作者/公开状态与占用|最终git status/两HEAD、原典SHA、外置收尾测量、最终恢复bundle及每日提案全保全另验|

正式地址：[作品库](https://seiya058904.github.io/jianghu/)。实际验收清单包括taihua、twelfth-life、jade-thieves/jade、qingshi、longmen、dead-ranking、luhua、north、sea-tide及tide-v6；HTTP200不能单独证明可玩。

首个成功产品发布后才写其真实回执，再同步文档提交并等待那个最终SHA的CI/Pages和artifact/浏览器验收。作者私有侧保存最后精确公共SHA；公开侧保留上一已完成产品回执和最新Actions入口，避免文档自身SHA写入自身无限提交。所有文档提交之间，产品/测试/工作流/部署源/构建的实际hash必须不变。
