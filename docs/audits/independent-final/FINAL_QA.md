# 冻结RC最终QA

当前验证RC：`d62f99f09f71bf895e63dc93757df45fa033200d`。Windows / Node24.15.0 / npm11.12.1 / Chrome155.0.8059.40 / Playwright1.64.1。Browser plugin未提供，按技能用现有Playwright；未更新依赖、未降低断言/字体/超时。

## 精确输入

|范围|文件数|SHA-256聚合指纹|
|---|---:|---|
|产品源码/剧情/资源/包配置|669|f6c49035c6ea5a20855e49bf76a930feabc30518eabcda760e4a2a4f3c84621d|
|tests及Playwright配置|165|4790e10bd9e49525262eb1ba94556f6f371be96d2e85b3366085a698b215d403|
|部署相关源/测试/工具/工作流/配置/资产（docs目录排除）|869|34a178b90f0abdff609fc4ce6b9eb0f0c2b232a689a5d3ca1219b1b4c32fab49|
|构建文件|351|15f4a874aa50d0bb3d72cececd2bec2c18e033e3b8f30c207577c93c0705d2c2|
|完整文件审计范围（715手写+203生成，含本机旧源）|918|93a1f7e4d4400bb88fca32edd42b23a6a14b7aed8400ac05e8f59d9def1498ca|

逐文件与方法见rc-ci-*-manifest.json。当前五清单实际bytes/SHA与聚合指纹均已重核；rc-ci-input-equivalence.json证明相对a04仅47行historical-baselines-policy.test.ts改变，产品669和dist351保持原字节。918审读范围含109个ignored私档旧源，不能声称它们都是当前Git blob；作者本机SHA与索引核同，公开排除。869部署子集与918全审范围分开。后续仅文档提交仍须逐项核同源/测试/构建；不追逐报告自身SHA。

## 当前已完成门禁

|命令/证据|实际结果|边界|
|---|---|---|
|npm ci，install-clean.log；public-acceptance-install.log|作者初始及隔离公开冷安装exit0|依赖锁字节未改，最终公开冷检查独立日志|
|npm run build，rc-ci-build.log|BUILD_EXIT=0|作者源→Ink→JSON→tsc→Vite→offline清单，无生成物漂移|
|GITHUB_ACTIONS=true npm test，rc-ci-tests.log|474/474，0失败/取消/跳过，UNIT_EXIT=0|含80编辑草稿契约，不能加成554独特测试|
|npm run test:editorial，rc-ci-editorial.log|80/80，EDITORIAL_EXIT=0|上述子集另执行|
|fixture-cache-all-browser.log|85/85，44.4秒，BROWSER_EXIT=0|全部13种evict前置spec；58首批是子集，不相加|
|fixture-cache-counterreview.md|13/13严格逆变换还原原spec正文|原断言、循环、目标URL、导航与超时不变；native waitUntil原promise立即调用一次，测试只观察真实后台写完成|
|rc-release-targeted.log|24/24，BROWSER_EXIT=0|前一同产品RC的整组player+7真旧迁移，原player153断言保留通过；当前完整仍需独立492|
|原典专门反例，longmen-counterexample-after.log|66/66|请求CID命中；部分负断言仍有有限证明边界|
|真旧存档/拒伪造专项|22/22；既有画面/ending迁移26/26|13份Git真旧compiled；旧runtime/presentation整体验真、除正文外逐拍结构/变量相同，原raw先保留|
|历史a04公开install/build/tests（public-acceptance-*）|0/0/0，474/474|2250允许文件/73556666bytes，build/test后全plan无漂移，351dist同作者；40个缺私档路径明确warning（作者不跳过）|
|新公开67eb1503：[receipt](public-ci-cold-validation.json)、[install](public-ci-install.log)/[build](public-ci-build.log)/[tests](public-ci-tests.log)|CI=true/GITHUB_ACTIONS=true；0/0/0，474/474|2388 plan无漂移、869源/351dist与d62全同；[隐私扫描](public-privacy-ci-code.json)85238633bytes零命中；40私档归档完整性PARTIAL；本地HEAD未push|
|测试CI通道定向（ci-warning-fixed-local/actions.log）|各1/1退出0|每次两种child环境×原六模式，精确消息/通道及missing报告，原status/null/throws保留|
|shell-update-browser.log|2/2，exit0|真实HTTP切换、同SW新hash模块、产品下载、断网16卡作品库；根/小写子路径|
|portrait-visible-browser.log|2/2，exit0|无CG遮挡演员实际可见；现行clean同龄回退与冻结V2刷新分别检查|

## 当前完整浏览器批次

**PASS：当前d62同一完整492/492，8 workers，19.0分钟，E2E_EXIT=0；0失败、0跳过、0flaky、0重试。** 2026-10-18 13:54:04 +08启动、14:13:22 +08核定。[原始日志](rc-ci-e2e.log)与[摘要](rc-ci-e2e-summary.json)均绑定 `d62f99f09f71bf895e63dc93757df45fa033200d`。独立读取外置完整JSON：492个test各恰一次passed、retry0，无errors；JSON/log SHA均与摘要匹配。未改原断言、完整收集case、超时或零重试，没有拼批。

运行后产品669、tests165、部署源869、完整审读918与dist351逐个实际bytes/SHA再次核对当前rc-ci五manifest全同，摘要中的聚合fingerprint也一致。当前完整结果属于d62，下面a04结果只作历史，不混用不同tests/source指纹。作者本地门禁和新公开本地CI冷检出已通过；新普通推送、云Verify/Pages及线上精确产物核验尚待父执行，不提前填PASS。

## 历史a04完整浏览器通过

**PASS：492/492，0失败、0跳过、0flaky、0重试，E2E_EXIT=0，36.5分钟。** 同一RC a04d36a、4 workers，2026-10-18 12:59:02 +08 开始。原始list日志 `rc-acceptance-e2e.log`；独立读取完整JSON/每条result、核原runner退出0与全部五类指纹未变，摘要 `rc-acceptance-e2e-summary.json`。完整JSON及全图在项目外同名前缀，不拼不同批次。4173/4175均读取同351构建文件；全run结束后产品669、测试165、部署源869、完整审读源918与dist351逐SHA仍一致。

产品669与fcef逐文件完全相同，rc-acceptance-product-equivalence.json可核；a04当时仅测试fixture同步真实SW写；当前d62再改一份CI告警通道policy测试，产品与dist仍相同。实际受控探针同时证明load/networkidle并不是缓存写屏障；最终helper不含探针延迟、不替换fetch/Response/Cache写、不注入页面结果，见fixture-cache-{race,drain}-proof.json。

## 保留的失败与中止历史

- 首次公开f1d4b377ec317e964c4a4ff79ae74aa826aa9642普通push成功；Verify/Pages均失败，Pages473/474，未发生deployment。原cloud-first-pages-failed.log/json保留。唯一historical-baselines-policy第28行把合法stdout Actions注解误当stderr缺失；未改生产helper。修前GITHUB_ACTIONS=true原测试退出1，修后双父环境各1/1退出0且各12子场景，详ci-warning-channel-review.md。新d62的root完整492与公开本地CI冷检出已通过，新云端/线上仍待，不能拼旧a04或旧云端状态。
- ec53完整492：491 passed / 1 failed / 0 skipped / 0 flaky，36.6分钟，E2E_EXIT=1，唯一旧Half Step首次显示就写回而原契约首次实际advance才迁移。源修fcef只收窄guard，原player153在24定向及后继整run已通过。原rc-final-e2e.log与summary保留，该失败RC未发布。
- fcef完整批次：286个已完成PASS、1个FAIL后主动停止，rc-release-aborted.json明确不是完整验收。唯一North root在下载前false前置被尚未结束的导航cache.put填回。独立Chrome自然36次未复发，受控仅暂挂原put精确证明时间窗；真实waitUntil屏障在root/subpath均等原写结束，再原缺失/真实下载恢复/冷离线通过。a04统一修13相关fixture，原断言及超时不变。不能将286和85拼成完整通过。
- RC1/2/3更早中止及迁移浏览器attempt1均有原日志/aborted记录；一次4/6来自测试漏点原槽确认及过早抓DOM，修正后7/7记录保留，不虚称首次全绿。

## 运行时/素材/性能证据等级

600次/篇运行时采样：23现行、47/47声明结局、6707/6707已写拍、996观察CID、465变量；首选≤8拍，最长真实无选择20拍。996对照中981其余CID完全相同，15仅同一首选策略，分开报告；非所有变量组合穷举。

699资源绑定是catalog候选触发，ART_USAGE_TRACE明确CG遮挡与Lu renderer override。183栅格解码/alpha、27catalog、23篇双档开局、16新资产双档、死人/芦花6完整路线1714拍及龙门双档是另有实际看图证据。旧视觉各绑定已记录构建，不冒作最终RC每帧重看。当前产品输入与运行时/素材输入逐SHA核同。

性能18冷入口+龙门228真实输入测量明确绑定ec53旧测量：往返P95 274.7ms，heap4.52→5.41MiB，未强制GC且同机并发；非INP/低端设备/长期无泄漏证明。F18保持PARTIAL。

真人试读、真人阅读耗时、Android真机、Safari、Firefox、读屏器：EXTERNAL NOT VERIFIED。

私有每日库先前be56235/Ada快照的冷验证原始日志：daily-candidate-install.log、daily-candidate-build.log、daily-candidate-tests.log；对应daily-candidate-validation.json。它们不替代最终d62/最后文档同步后的候选验证，最终私有完整性与测量在项目外回执绑定。
