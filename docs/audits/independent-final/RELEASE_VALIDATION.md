# 发布验证

发布前公开main：`a6e5d5947ce2d06c6c2ab83e1cfd515c95191959`；作者起点：`master@7a2c22f74c46d74f07af8bd1a45893ec15daa49b`。认证账号和仓库所有者均为seiya058904。两条历史无共同祖先，公共隔离检出从原main继续；不推作者历史，不force。

## 当前门禁

**尚未发布。** 当前冻结验收RC为 `a04d36a665416f45297a5c2a0191863bd0f44316`；build退出0、474/474单测退出0、80/80编辑子集退出0。产品与fcef368完全相同，本次仅在13个原有冷缓存spec中安装真实FetchEvent.waitUntil后台写屏障，原断言、既有导航、数量与超时均保持；85/85定向退出0，最终完整492单run已492/492、0失败/跳过/flaky/重试、E2E_EXIT0结束（36.5min）。ec53旧完整run491/1和fcef中断run286/1均保留为失败历史，不用于拼成验收通过。公共隔离当前本地 `9885dfedb780540ea51b97c1692ccd209be12232` 已冷npm ci/build/test474通过，尚未推送。

作者完整原典/私档冻结字节检查与公开缺席40路径明确分开。公开manifest从已提交作者RC取追踪对象，内容隐私扫描和排除规则详见PUBLIC_SNAPSHOT_MANIFEST.md。完整原典Git blob在全部公共对象中缺席，见public-history-canon-check.json；此外做去空白512字符样本/128步长正文探针，不把它称作所有编码的证明。

## 最终发布回执（待完成）

|项|当前状态|
|---|---|
|最终验证RC与指纹|a04d36a；产品669、测试165、部署源869、完整审读源918、dist351；完整单run492/492 exit0，五类逐项运行后未变|
|推送前实时main及普通快进关系|最终推送前重新fetch|
|最终公共main SHA / 作者对应SHA|未产生最终公开提交|
|Verify精确run URL / conclusion|未触发|
|Deploy Pages精确run URL / conclusion|未触发|
|Pages artifact.tar hash与全部在线文件对照|尚未下载最终run artifact|
|正式Chrome根首页16卡/规定深链/双档/真实选择|等待新版上线后执行|
|正式旧SW原地更新/作品包/断网作品库与龙门|旧context与旧SW已准备，等待部署成功信号|
|作者与公共最终工作区状态/原典SHA|全部证据完成后记录|

正式地址：[作品库](https://seiya058904.github.io/jianghu/)。深链必须实际测试taihua、twelfth-life、jade-thieves/jade、qingshi、longmen、dead-ranking、luhua、north、sea-tide及tide-v6历史入口；HTTP200不能单独证明可玩。

为避免报告把自身SHA写进自身而无限追加，首个完整产品发布完成后才同步其真实回执；如生成新的文档提交，仍等待该最终SHA的CI/Pages，作者私有侧记录最终精确SHA，公开侧保留上一已验产品回执和最新Actions链接。所有文档提交必须核源码/测试/工作流/运行资产指纹不变。
