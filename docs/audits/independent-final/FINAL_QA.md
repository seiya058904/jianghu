# 冻结RC最终QA

当前验证RC：`a04d36a665416f45297a5c2a0191863bd0f44316`。Windows / Node24.15.0 / npm11.12.1 / Chrome155.0.8059.40 / Playwright1.64.1。Browser plugin未提供，按技能用现有Playwright；未更新依赖、未降低断言/字体/超时。

## 精确输入

|范围|文件数|SHA-256聚合指纹|
|---|---:|---|
|产品源码/剧情/资源/包配置|669|f6c49035c6ea5a20855e49bf76a930feabc30518eabcda760e4a2a4f3c84621d|
|tests及Playwright配置|165|ffb43acf8fa0fd7bc19cc7e2c787dd473c38c1b882f87cda6ee772ae758c285c|
|部署相关源/测试/工具/工作流/配置/资产（docs目录排除）|869|a78470807c5cbe25c50f65a6b9cbbf58e65523aaf5977c796cfa0cdad08902f0|
|构建文件|351|15f4a874aa50d0bb3d72cececd2bec2c18e033e3b8f30c207577c93c0705d2c2|
|完整文件审计范围（715手写+203生成，含本机旧源）|918|19a37b5e9b8d29582e76bf35afe66f8101ef67bed8e318f0ef2d007ed084231c|

逐文件与方法见rc-acceptance-*-manifest.json。918审读范围含109个ignored私档旧源，不能声称它们都是当前Git blob；作者本机SHA与索引核同，公开排除。869部署子集与918全审范围分开。后续仅文档提交仍须逐项核同源/测试/构建；不追逐报告自身SHA。

## 当前已完成门禁

|命令/证据|实际结果|边界|
|---|---|---|
|npm ci，install-clean.log；public-acceptance-install.log|作者初始及隔离公开冷安装exit0|依赖锁字节未改，最终公开冷检查独立日志|
|npm run build，rc-acceptance-build.log|BUILD_EXIT=0|作者源→Ink→JSON→tsc→Vite→offline清单，无生成物漂移|
|npm test，rc-acceptance-tests.log|474/474，0失败/取消/跳过，UNIT_EXIT=0|含80编辑草稿契约，不能加成554独特测试|
|npm run test:editorial，rc-acceptance-editorial.log|80/80，EDITORIAL_EXIT=0|上述子集另执行|
|fixture-cache-all-browser.log|85/85，44.4秒，BROWSER_EXIT=0|全部13种evict前置spec；58首批是子集，不相加|
|fixture-cache-counterreview.md|13/13严格逆变换还原原spec正文|原断言、循环、目标URL、导航与超时不变；native waitUntil原promise立即调用一次，测试只观察真实后台写完成|
|rc-release-targeted.log|24/24，BROWSER_EXIT=0|前一同产品RC的整组player+7真旧迁移，原player153断言保留通过；当前完整仍需独立492|
|原典专门反例，longmen-counterexample-after.log|66/66|请求CID命中；部分负断言仍有有限证明边界|
|真旧存档/拒伪造专项|22/22；既有画面/ending迁移26/26|13份Git真旧compiled；旧runtime/presentation整体验真、除正文外逐拍结构/变量相同，原raw先保留|
|[公开install](public-acceptance-install.log) / [build](public-acceptance-build.log) / [tests](public-acceptance-tests.log)|0/0/0，474/474|2250允许文件/73556666bytes，build/test后全plan无漂移，351dist同作者；40个缺私档路径明确warning（作者不跳过）|
|shell-update-browser.log|2/2，exit0|真实HTTP切换、同SW新hash模块、产品下载、断网16卡作品库；根/小写子路径|
|portrait-visible-browser.log|2/2，exit0|无CG遮挡演员实际可见；现行clean同龄回退与冻结V2刷新分别检查|

## 当前完整浏览器批次

**PASS：492/492，0失败、0跳过、0flaky、0重试，E2E_EXIT=0，36.5分钟。** 同一RC a04d36a、4 workers，2026-10-18 12:59:02 +08 开始。原始list日志 `rc-acceptance-e2e.log`；独立读取完整JSON/每条result、核原runner退出0与全部五类指纹未变，摘要 `rc-acceptance-e2e-summary.json`。完整JSON及全图在项目外同名前缀，不拼不同批次。4173/4175均读取同351构建文件；全run结束后产品669、测试165、部署源869、完整审读源918与dist351逐SHA仍一致。

产品669与fcef逐文件完全相同，rc-acceptance-product-equivalence.json可核；这次仅测试fixture同步真实SW写。实际受控探针同时证明load/networkidle并不是缓存写屏障；最终helper不含探针延迟、不替换fetch/Response/Cache写、不注入页面结果，见fixture-cache-{race,drain}-proof.json。

## 保留的失败与中止历史

- ec53完整492：491 passed / 1 failed / 0 skipped / 0 flaky，36.6分钟，E2E_EXIT=1，唯一旧Half Step首次显示就写回而原契约首次实际advance才迁移。源修fcef只收窄guard，原player153在24定向及后继整run已通过。原rc-final-e2e.log与summary保留，该失败RC未发布。
- fcef完整批次：286个已完成PASS、1个FAIL后主动停止，rc-release-aborted.json明确不是完整验收。唯一North root在下载前false前置被尚未结束的导航cache.put填回。独立Chrome自然36次未复发，受控仅暂挂原put精确证明时间窗；真实waitUntil屏障在root/subpath均等原写结束，再原缺失/真实下载恢复/冷离线通过。a04统一修13相关fixture，原断言及超时不变。不能将286和85拼成完整通过。
- RC1/2/3更早中止及迁移浏览器attempt1均有原日志/aborted记录；一次4/6来自测试漏点原槽确认及过早抓DOM，修正后7/7记录保留，不虚称首次全绿。

## 运行时/素材/性能证据等级

600次/篇运行时采样：23现行、47/47声明结局、6707/6707已写拍、996观察CID、465变量；首选≤8拍，最长真实无选择20拍。996对照中981其余CID完全相同，15仅同一首选策略，分开报告；非所有变量组合穷举。

699资源绑定是catalog候选触发，ART_USAGE_TRACE明确CG遮挡与Lu renderer override。183栅格解码/alpha、27catalog、23篇双档开局、16新资产双档、死人/芦花6完整路线1714拍及龙门双档是另有实际看图证据。旧视觉各绑定已记录构建，不冒作最终RC每帧重看。当前产品输入与运行时/素材输入逐SHA核同。

性能18冷入口+龙门228真实输入测量明确绑定ec53旧测量：往返P95 274.7ms，heap4.52→5.41MiB，未强制GC且同机并发；非INP/低端设备/长期无泄漏证明。F18保持PARTIAL。

真人试读、真人阅读耗时、Android真机、Safari、Firefox、读屏器：EXTERNAL NOT VERIFIED。
