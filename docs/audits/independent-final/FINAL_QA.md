# 冻结RC最终QA

最后公共SHA已完成验收：ef598cd5ed709e86a05007403bd2776bcfdfedf0，两云success、351线上核同、鲜Chrome26通过。最终时点与私有收尾记录只保存在私有审计目录（不随公开快照发布）；下文各阶段快照保留原时间与边界。

当前验证RC：`113872382f2697f94bbf8f5dc3c62692641cf731`。三点SW修复已冻结；build退出0、CI模式unit474/474退出0、编辑专项80/80退出0。当前完整492/492、8 workers、19.2分钟、E2E_EXIT0，0失败/跳过/flaky/重试，独立原始JSON与五类运行后hash已核同；正式67eb→f486严格持久窗口已通过，ENG-06关闭；产品f486精确云端与线上字节已验证，后续文档Q精确复核仍待完成。

Windows / Node24.15.0 / npm11.12.1 / Chrome155.0.8059.40 / Playwright1.64.1。Browser plugin未提供，按技能用现有Playwright；未更新依赖、未降低断言/字体/超时。

## 精确输入

|范围|文件数|SHA-256聚合指纹|
|---|---:|---|
|产品源码/剧情/资源/包配置|669|e4bf0b54b8d9035ce9f384d8c221924451dca84769073d8c9eb43c8cbce816c9|
|tests及Playwright配置|165|bfeaee87e401c565829946dc38d65b33f7412b476679a12e8c212b77ffc3a0d6|
|部署相关源/测试/工具/工作流/配置/资产（docs目录排除）|869|afd05b04a097e6ea9756f58ae8a0dd3c1e58fc9965f5625dc9af9971f0e14594|
|构建文件|351|797a6a2d1c252c45eadd59585a32cd23a636b129b7445c5cb387efebad538ded|
|完整文件审计范围（715手写+203生成，含本机旧源）|918|68b5ee0c6c69b4f77f40672fbef3cd24c84ab11ae260798672bd8d487e7189b8|

逐文件与方法见rc-sw-*-manifest.json。当前五清单逐个实际bytes/SHA已核同，零差异；rc-sw-input-delta.json明确相对d62产品仅public/sw.js、测试三文件改变，dist351仅dist/sw.js改变。918审读范围含109个ignored私档旧源，不能声称它们都是当前Git blob；作者本机SHA与索引核同，公开排除。869部署子集与918全审范围分开。后续仅文档提交仍须逐项核同源/测试/构建；不追逐报告自身SHA。

## 当前已完成门禁

|命令/证据|实际结果|边界|
|---|---|---|
|npm ci，install-clean.log；public-acceptance-install.log|作者初始及隔离公开冷安装exit0|依赖锁字节未改，最终公开冷检查独立日志|
|npm run build，rc-sw-build.log|BUILD_EXIT=0|作者源→Ink→JSON→tsc→Vite→offline清单，无生成物漂移|
|GITHUB_ACTIONS=true npm test，rc-sw-tests.log|474/474，0失败/取消/跳过，UNIT_EXIT=0|含80编辑草稿契约，不能加成554独特测试|
|npm run test:editorial，rc-sw-editorial.log|80/80，EDITORIAL_EXIT=0|上述子集另执行|
|fixture-cache-all-browser.log|85/85，44.4秒，BROWSER_EXIT=0|全部13种evict前置spec；58首批是子集，不相加|
|fixture-cache-counterreview.md|13/13严格逆变换还原原spec正文|原断言、循环、目标URL、导航与超时不变；native waitUntil原promise立即调用一次，测试只观察真实后台写完成|
|rc-release-targeted.log|24/24，BROWSER_EXIT=0|前一同产品RC的整组player+7真旧迁移，原player153断言保留通过；当前完整仍需独立492|
|原典专门反例，longmen-counterexample-after.log|66/66|请求CID命中；部分负断言仍有有限证明边界|
|真旧存档/拒伪造专项|22/22；既有画面/ending迁移26/26|13份Git真旧compiled；旧runtime/presentation整体验真、除正文外逐拍结构/变量相同，原raw先保留|
|历史a04公开install/build/tests（public-acceptance-*）|0/0/0，474/474|2250允许文件/73556666bytes，build/test后全plan无漂移，351dist同作者；40个缺私档路径明确warning（作者不跳过）|
|新公开67eb1503：[receipt](public-ci-cold-validation.json)、[install](public-ci-install.log)/[build](public-ci-build.log)/[tests](public-ci-tests.log)|CI=true/GITHUB_ACTIONS=true；0/0/0，474/474|2388 plan无漂移、869源/351dist与d62全同；[隐私扫描](public-privacy-ci-code.json)85238633bytes零命中；40私档归档完整性PARTIAL；67eb已成功部署；113对应产品f486已成功部署，最后文档Q待复核|
|测试CI通道定向（ci-warning-fixed-local/actions.log）|各1/1退出0|每次两种child环境×原六模式，精确消息/通道及missing报告，原status/null/throws保留|
|shell-update-browser.log|2/2，exit0|真实HTTP切换、同SW新hash模块、产品下载、断网16卡作品库；根/小写子路径|
|portrait-visible-browser.log|2/2，exit0|无CG遮挡演员实际可见；现行clean同龄回退与冻结V2刷新分别检查|

## 当前完整浏览器批次

PASS：113同一完整492/492、8 workers、19.2分钟（1149092.732ms），E2E_EXIT=0；0失败/跳过/flaky/重试。`rc-sw-e2e.log`与`rc-sw-e2e-summary.json`绑定113872382f2697f94bbf8f5dc3c62692641cf731。独立逐项读取外置原始JSON：492个test各恰一次passed、retry0，无errors；原始JSON SHA=8aa4c9d4c19fa76773ffb7deffa43441c2744ecef291d1a5e307ef19a2219d8c、log SHA=c344ba4109dbd083a3b48181161483f44c38d36f1301a8b1b65b63bf036e99a1，与摘要核同。14:28:52 +08启动，14:48:30 +08核定；运行后669/165/869/918/351五manifest每个实际bytes/SHA再核全同，未拼批。113对应产品f486已普通FF发布，严格正式67eb→f486持久窗口已通过；后续仅文档提交Q尚待精确复核，不预写Q成功。

## 历史d62完整浏览器批次

**PASS：前一d62同一完整492/492，8 workers，19.0分钟，E2E_EXIT=0；0失败、0跳过、0flaky、0重试。** 2026-10-18 13:54:04 +08启动、14:13:22 +08核定。[原始日志](rc-ci-e2e.log)与[摘要](rc-ci-e2e-summary.json)均绑定 `d62f99f09f71bf895e63dc93757df45fa033200d`。独立读取外置完整JSON：492个test各恰一次passed、retry0，无errors；JSON/log SHA均与摘要匹配。未改原断言、完整收集case、超时或零重试，没有拼批。

运行后产品669、tests165、部署源869、完整审读918与dist351逐个实际bytes/SHA再次核对当时rc-ci五manifest全同，摘要中的聚合fingerprint也一致。该完整结果属于d62，下面a04结果只作历史，不混用不同tests/source指纹。d62对应67eb随后云Verify/Pages与351线上产物核验通过，但真实旧SW窗口出现ENG-06；因此不是当前113的完整或线上通过证据。

## ENG-06：正式旧SW更新后的旧HTTP首页（本地完整与正式持续窗口均通过，已关闭）

公开67eb150348013c06bdf328a95589395b3c987aa0的Verify run39103362100与Pages run39103362099均SUCCESS；351线上artifact逐字节核同，26个鲜Chrome入口PASS。这些结果没有覆盖旧正式SW原地更新。真实旧V6窗口04:48UTC准备，在新Pages后更新SW、刷新到新player并成功下载龙门，断网index.html仍执行旧首页，导入campaign-v6-Ct-yMjRt.js失败。原窗口已在finally关闭，未dump缓存，不能唯一追认当时是HTTP缓存或后台回填；原失败result/process/script完整保留在外置live-update-longwait目录。

独立真实Chrome受控8阶段探针（根与/Jianghu，各4策略，exit0）分开证明两层：原SW的addAll复用新鲜旧HTML，更新后入口HTTP请求0且CacheStorage仍旧；仅addAll no-store虽已缓存新HTML，离线导航的network-first fetch仍可从HTTP缓存返回旧HTML；加导航专用no-store后两路径均16卡/0错误，效果与所有fetch no-store相同。证据为外置workspace/stale-http-navigation-probe.{mjs,json,log}，JSON SHA=cd76592338c7d879775d8682e6d6219ebde7adc4b20f4801312cdab4f37371c7。它是机制反例，不是已关闭旧正式窗口的复跑。另一个旧worker延迟响应探索未形成可归因的release后新→旧转换，不据此另报已证根因。

最小产品修复仅两处addAll传真实Request(cache:no-store)，以及同源scope内导航fetch使用cache:no-store；非导航fetch原策略保留。当前public/sw.js、两VM测试与shell-update.spec已完整直接回读。VM保留目标URL/顺序/未知作品忽略/HTTP、unsafe、quota拒绝全部原断言，增cache模式断言；两真实浏览器case只把HTML响应改max-age3600，marker2、16卡、0错误原断言均保留。旧dist增强case先2/2失败，新修复后2/2通过，VM6/6、当前CI模式474/474、编辑80/80通过。Graph工具Transport closed，四文件以完整源码回退，不宣称图覆盖。

状态为CLOSED_PRODUCT_VERIFIED_F486：当前113完整492/492、8 workers、19.2分钟、exit0；对应f486正式云门禁、351线上字节、鲜窗口26入口及严格67eb→f486持续窗口均已通过，最后文档Q精确复核另待完成。旧d62的492/492属于前一RC，不能覆盖本次P1；本轮未改依赖、配置、存档、剧情或期望哈希。

## 历史a04完整浏览器通过

**PASS：492/492，0失败、0跳过、0flaky、0重试，E2E_EXIT=0，36.5分钟。** 同一RC a04d36a、4 workers，2026-10-18 12:59:02 +08 开始。原始list日志 `rc-acceptance-e2e.log`；独立读取完整JSON/每条result、核原runner退出0与全部五类指纹未变，摘要 `rc-acceptance-e2e-summary.json`。完整JSON及全图在项目外同名前缀，不拼不同批次。4173/4175均读取同351构建文件；全run结束后产品669、测试165、部署源869、完整审读源918与dist351逐SHA仍一致。

产品669与fcef逐文件完全相同，rc-acceptance-product-equivalence.json可核；a04当时仅测试fixture同步真实SW写；前一d62再改一份CI告警通道policy测试，产品与dist仍相同。实际受控探针同时证明load/networkidle并不是缓存写屏障；最终helper不含探针延迟、不替换fetch/Response/Cache写、不注入页面结果，见fixture-cache-{race,drain}-proof.json。

## 保留的失败与中止历史

- 首次公开f1d4b377ec317e964c4a4ff79ae74aa826aa9642普通push成功；Verify/Pages均失败，Pages473/474，未发生deployment。原cloud-first-pages-failed.log/json保留。唯一historical-baselines-policy第28行把合法stdout Actions注解误当stderr缺失；未改生产helper。修前GITHUB_ACTIONS=true原测试退出1，修后双父环境各1/1退出0且各12子场景，详ci-warning-channel-review.md。d62的root完整492与公开冷检出已通过，67eb随后云门禁成功但真实旧SW更新失败；当前113完整验证与对应f486线上严格持续窗口均已通过，最后文档Q待复核，不能拼旧RC状态。
- ec53完整492：491 passed / 1 failed / 0 skipped / 0 flaky，36.6分钟，E2E_EXIT=1，唯一旧Half Step首次显示就写回而原契约首次实际advance才迁移。源修fcef只收窄guard，原player153在24定向及后继整run已通过。原rc-final-e2e.log与summary保留，该失败RC未发布。
- fcef完整批次：286个已完成PASS、1个FAIL后主动停止，rc-release-aborted.json明确不是完整验收。唯一North root在下载前false前置被尚未结束的导航cache.put填回。独立Chrome自然36次未复发，受控仅暂挂原put精确证明时间窗；真实waitUntil屏障在root/subpath均等原写结束，再原缺失/真实下载恢复/冷离线通过。a04统一修13相关fixture，原断言及超时不变。不能将286和85拼成完整通过。
- RC1/2/3更早中止及迁移浏览器attempt1均有原日志/aborted记录；一次4/6来自测试漏点原槽确认及过早抓DOM，修正后7/7记录保留，不虚称首次全绿。

## 运行时/素材/性能证据等级

600次/篇运行时采样：23现行、47/47声明结局、6707/6707已写拍、996观察CID、465变量；首选≤8拍，最长真实无选择20拍。996对照中981其余CID完全相同，15仅同一首选策略，分开报告；非所有变量组合穷举。

699资源绑定是catalog候选触发，ART_USAGE_TRACE明确CG遮挡与Lu renderer override。183栅格解码/alpha、27catalog、23篇双档开局、16新资产双档、死人/芦花6完整路线1714拍及龙门双档是另有实际看图证据。旧视觉各绑定已记录构建，不冒作最终RC每帧重看。当前产品输入与运行时/素材输入逐SHA核同。

性能18冷入口+龙门228真实输入测量明确绑定ec53旧测量：往返P95 274.7ms，heap4.52→5.41MiB，未强制GC且同机并发；非INP/低端设备/长期无泄漏证明。F18保持PARTIAL。

真人试读、真人阅读耗时、Android真机、Safari、Firefox、读屏器：EXTERNAL NOT VERIFIED。

私有每日库先前be56235/Ada快照的冷验证原始日志：daily-candidate-install.log、daily-candidate-build.log、daily-candidate-tests.log；对应daily-candidate-validation.json。它们不替代最终d62/最后文档同步后的候选验证，最终私有完整性与测量在项目外回执绑定。

生命周期与跨平台复核补充：首次正式V6窗口只证明调用update并刷出新player、收到包ready后离线失败；原async身份guard未可靠确认新SW接管，已关闭无cache dump，不唯一追认层。另有严格Promise(old redundant/active与controller activated)的真实a6 Git冷建四case：原策略根/子路径均复现，113两路径根/index16卡与龙门1→2、page/HTTP0，actual-v6-upgrade-summary/result可核。正式67eb持久profile已用同生命周期屏障完成f486升级：等待8791ms、离线库16卡及龙门1→2、page/HTTP0，原回执另见正式发布节。67eb CI artifact↔正式HTTPS确351/351原字节同；Linux CI↔Windows d62只有347/351原字节同，4个offline清单仅数组顺序不同，排序逐项相同，无增缺或重复，ci-windows-first-artifact-comparison.json。公开本地Windows351同作者Windows是另一独立结论。

新113隔离公开代码4d14cda的原始冷CI日志：public-sw-install.log、public-sw-build.log、public-sw-tests.log；真实ci/build/test退出全0，474/0，public-sw-cold-validation.json逐文件plan/869源/351Windows dist无差异。此处351是公开Windows与作者Windows比较，跨Linux四清单顺序差异另列，不混用。


## 正式产品发布与ENG-06关闭（f486，最终文档Q另待复核）

公开产品提交`f48614493ec4340355602f77d64b19c02220781e`已由父普通fast-forward从67eb推送，exit0、无force；对应已测产品RC113，后继作者2a2c403801fd6af8fb22529a9e9590883a3fc01d没有新增产品代码变化。精确Verify run39105624826与Pages run39105624823均completed/success，headSha均为f486。产品build0、CI模式474/474、编辑80/80、同一完整492/492（8workers、19.2min、exit0）保留绑定113的原证据。

已独立逐项复核父的外置原回执：[pages-artifact-sw-accepted.json](pages-artifact-sw-accepted.json)全部351entry均HTTP200、onlineSHA与对应CIartifact SHA相同，failures=[]；总37,008,548字节，artifact tar SHA=3b08472977212f10cd412312ddd77e82fab388a1b2cf7cba317f24275dbb3e99。[online-sw-accepted.json](online-sw-accepted.json)实际26入口PASS，ONLINE_EXIT0，console/page/HTTP/requestfailed四数组全空。这里351/351指Linux CIartifact与正式HTTPS逐字节同；Windows与Linux构建历史347/351同、4清单仅数组顺序差异的边界仍保留，不能偷换为跨平台所有原字节相同。

真实正式67eb准备的persistent profile随后升级f486，[formal-sw-update-fixed.json](formal-sw-update-fixed.json)明确old=redundant、active/controller=activated，真实生命周期等待8791ms；缓存根/index均新库HTML，断网库16卡，真实龙门lm_borrow_1→lm_borrow_2，errors/http=[]，status=PASS。它与严格a6旧Git冷建四case分别证明正式67eb→f486和受控真实V6→113，不能说原已关闭V6窗口重新跑过。原正式旧窗口失败、无cache dump以及async身份guard限制全部保留。ENG-06现为CLOSED_PRODUCT_VERIFIED_F486。

原始日志及截图保留项目外`../Jianghu-independent-20261018/`，父已同步上述文本回执入本轮审计目录；[普通push](normal-push-sw-accepted.json)与[精确云端结果](cloud-sw-accepted-success.json)可复核。[本次跨平台比较](artifact-sw-platform-comparison.json)同时确认Windows↔Linux347/351及4个数组仅顺序差异、上一67eb→f486两次Linux产物仅sw.js改变。后续只有公开文档/回执同步，须再核最后文档提交Q的精确云端head与线上字节；Q尚未成功，不由f486产品成功预写Q成功。父以私有receipt记录避免文档自SHA循环。

F18仍PARTIAL：旧同机测量不是当前部署INP/低端设备保证，外部设备与真人边界不变。F24仍BLOCKED，不能以私有提案变小或产品上线代替作者根门槛。新中间候选28a023adb54c433f0e433f1603ed2e256778b3eb对应source2a2c403801fd6af8fb22529a9e9590883a3fc01d/113，冷CI474通过、2594追踪项与478私有附加项已有[中间证据](daily-sw-validation.json)，但最后文档同步后的测量尚未完成；未采用、未切换，不冒作最终私有测量。
