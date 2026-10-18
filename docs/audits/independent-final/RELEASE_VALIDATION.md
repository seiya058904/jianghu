# 发布验证：当前状态与逐次回执

当前产品冻结RC **113872382f2697f94bbf8f5dc3c62692641cf731**；build、CI环境474/474单测、80/80编辑子集均exit0，新完整492/492、8workers、19.2分钟单run已通过，0失败/跳过/flaky/重试、E2E_EXIT0，五类结束后文件hash全部核同。旧d62与a04的完整4920分别保留，不能代新终态。产品与部署文件相对d62只改变SW，三份测试增强，rc-sw-input-delta及五manifest明确全部路径。

作者起点master@7a2c22f74c46d74f07af8bd1a45893ec15daa49b，公开main起点a6e5d5947ce2d06c6c2ab83e1cfd515c95191959，两个谱系无共同祖先。认证所有者seiya058904；公共隔离clone从真实main普通增量，不force、不将作者完整历史推公开、不改remote。

## 已完成的两次普通推送

|顺序|实际普通快进|真实结果|
|---|---|---|
|首次，13:40 +08|a6e5d59 → f1d4b377ec317e964c4a4ff79ae74aa826aa9642|push0；Verify39101353779/Pages39101353730均FAILED，单测473/474，未部署|
|CI修复，14:14 +08|f1d4b37 → 67eb150348013c06bdf328a95589395b3c987aa0|push0；Verify39103362100/Pages39103362099均SUCCESS，真实部署已发生|

回执normal-push-ci-fixed.json与cloud-ci-fixed-success.json。第一次失败保留cloud-first-*；唯一unit测试把GHA有意stdout注解错当stderr，修订仅unit，两显式环境×原六模式，产品helper不改。第二次成功不覆盖第一次失败。

- 已成功[Verify39103362100](https://github.com/seiya058904/jianghu/actions/runs/39103362100)。
- 已成功[Pages39103362099](https://github.com/seiya058904/jianghu/actions/runs/39103362099)。

## 已成功站点验证与新发现的升级P1

67eb的Pages artifact下载保存，**351/351正式HTTPS文件与该云端artifact逐字节相同**，pages-artifact-ci-fixed.json。与Windows d62构建比较是347/351字节相同；四个offline*.json仅URL数组顺序不同、排序后逐项完全一致、计数相同且无增缺，ci-windows-first-artifact-comparison.json。这是跨OS遍历顺序差异，不能写成Windows351全同云端；以云端artifact作为正式线上逐字节验收基准。

鲜Chrome双档1440/390共26入口实际通过，推荐/旧版/作品库、11篇开局，太华/龙门/死人两真实选择及刷新恢复，console/pageerror/HTTP/requestfailed/image decode/横溢均0，online-ci-fixed.json。父实际查看桌面首页和手机死人舞台，精选WebP及VISUAL_PLAYTHROUGH可核。

但发布前保留的真实V6正式窗口调用update、刷出新player并收到龙门下载ready后，断网index仍旧campaign模块导入失败；online-old-sw-v6-failure.json。原异步身份guard未可靠证明新SW激活，且窗口已关闭无cache dump，**不能唯一追认当时缓存层或宣称已完整等激活**。此失败触发独立HTTPcache反例，不以鲜上下文通过掩盖升级问题。

ENG06：默认addAll可复制HTTP缓存中的旧HTML，导航fetch也可在断网时优先返回旧HTTP HTML。原shell两用例只改HTML为maxage3600即2/2失败，113仅改SW三处cache策略后原断言2/2通过；VM6、全474、80编辑子集均0。独立8阶段机制probe与真实a6 Git字节回归分开记录。

真实旧字节回归先安全提取a6并冷ci/build0。根/子路径×原/修4case，用显式Promise确认旧worker redundant、新active/controller activated后才继续：原2例仍旧HTML/离线失败，修2例install已新HTML，根/index各16卡、龙门lm_borrow_1→2、page/HTTP均0。actual-v6-upgrade-summary/result与旧dist/extract清单可核；不冒充再次原正式已闭V6窗口。修复版正式部署后的真实67eb持久profile升级仍须完成。

## 当前113公开代码冷检出（未push）

隔离本地HEAD **4d14cda0eb131d1f1496671129aefa7992142d06**；策展来源113，2420允许文件/86413768B，最大文字JSON4221144B。privacy0、159MD/426本地链接0；CI=true/GITHUB_ACTIONS=true冷npmci/build/全474均0，全部plan无漂移、869部署源与351Windows dist同rc-sw冻结指纹，public-sw-cold-validation.json。40私有基线缺席路径明确允许告警，公开归档完整性仍PARTIAL，不是假称作者跳过。

当前4d14为隔离本地代码提交，完整492门禁及最终文档同步后才普通追加；不以67eb的旧云绿代表新113已发布。最终公开文件数量/HEAD会随已提交回执文档增加，现值明确是中间快照。

## 待完成的最终步骤

|项|当前边界|
|---|---|
|同RC完整492|PASS：rc-sw-e2e-summary独立核492/492、exit0与全部五类结束后文件hash；0失败/跳过/flaky/重试|
|最终普通FF|新fetch核main仍67eb、祖先关系、最终策展/隐私/链接审查、普通push，无force|
|精确新SHA云门禁|等待其Verify/Pages success；下载该Pages run artifact并全文件HTTPS比较|
|正式修复浏览器|双档26入口/真实两选择/刷新/图片/console/network重新验收|
|真实旧SW正式原地升级|live-update-post67eb-strict已复用真实持久profile；新Pages成功后才写实际SHA信号，显式Promise等旧redundant及active/controller activated，真实typing结束再推进，断网16卡+龙门|
|最后作者/公开状态与体积|最终两HEAD/clean status、原典SHA、完整恢复bundle、候选TREE/私档保全与外置实际测量|

首个成功修复部署后写真实回执，再同步公开文档提交并等待其最终SHA的CI/Pages、artifact和线上。作者私有侧保存最后精确公共SHA；公开侧保留上一已完成产品回执及最新Actions入口，避免文档自身SHA无限写入自身。文档提交间产品/测试/工作流/869部署源与实际构建不得改变。

正式[作品库](https://seiya058904.github.io/jianghu/)，已在67eb真测[龙门](https://seiya058904.github.io/jianghu/longmen.html)、[死人](https://seiya058904.github.io/jianghu/dead-ranking.html)、[太华](https://seiya058904.github.io/jianghu/taihua.html)、[山河璧](https://seiya058904.github.io/jianghu/jade.html)、[芦花渡](https://seiya058904.github.io/jianghu/luhua.html)等；新修复最终验收仍待后继回执。
