# 发布验证：当前状态与逐次回执

当前产品冻结RC **113872382f2697f94bbf8f5dc3c62692641cf731**；build、CI环境474/474单测、80/80编辑子集均exit0，新完整492/492、8workers、19.2分钟单run已通过，0失败/跳过/flaky/重试、E2E_EXIT0，五类结束后文件hash全部核同。旧d62与a04的完整4920分别保留，不能代新终态。产品与部署文件相对d62只改变SW，三份测试增强，rc-sw-input-delta及五manifest明确全部路径。

作者起点master@7a2c22f74c46d74f07af8bd1a45893ec15daa49b，公开main起点a6e5d5947ce2d06c6c2ab83e1cfd515c95191959，两个谱系无共同祖先。认证所有者seiya058904；公共隔离clone从真实main普通增量，不force、不将作者完整历史推公开、不改remote。

## 已完成的三次普通推送

|顺序|实际普通快进|真实结果|
|---|---|---|
|首次，13:40 +08|a6e5d59 → f1d4b377ec317e964c4a4ff79ae74aa826aa9642|push0；Verify39101353779/Pages39101353730均FAILED，单测473/474，未部署|
|CI修复，14:14 +08|f1d4b37 → 67eb150348013c06bdf328a95589395b3c987aa0|push0；Verify39103362100/Pages39103362099均SUCCESS，真实部署已发生|
|SW修复，14:53 +08|67eb150 → f48614493ec4340355602f77d64b19c02220781e|push0；Verify39105624826/Pages39105624823均SUCCESS，产品部署及正式线上验收已完成|

回执normal-push-ci-fixed.json与cloud-ci-fixed-success.json。第一次失败保留cloud-first-*；唯一unit测试把GHA有意stdout注解错当stderr，修订仅unit，两显式环境×原六模式，产品helper不改。第二次成功不覆盖第一次失败。

- 已成功[Verify39103362100](https://github.com/seiya058904/jianghu/actions/runs/39103362100)。
- 已成功[Pages39103362099](https://github.com/seiya058904/jianghu/actions/runs/39103362099)。

## 历史站点验证与已修复的升级P1

67eb的Pages artifact下载保存，**351/351正式HTTPS文件与该云端artifact逐字节相同**，pages-artifact-ci-fixed.json。与Windows d62构建比较是347/351字节相同；四个offline*.json仅URL数组顺序不同、排序后逐项完全一致、计数相同且无增缺，ci-windows-first-artifact-comparison.json。这是跨OS遍历顺序差异，不能写成Windows351全同云端；以云端artifact作为正式线上逐字节验收基准。

鲜Chrome双档1440/390共26入口实际通过，推荐/旧版/作品库、11篇开局，太华/龙门/死人两真实选择及刷新恢复，console/pageerror/HTTP/requestfailed/image decode/横溢均0，online-ci-fixed.json。父实际查看桌面首页和手机死人舞台，精选WebP及VISUAL_PLAYTHROUGH可核。

但发布前保留的真实V6正式窗口调用update、刷出新player并收到龙门下载ready后，断网index仍旧campaign模块导入失败；online-old-sw-v6-failure.json。原异步身份guard未可靠证明新SW激活，且窗口已关闭无cache dump，**不能唯一追认当时缓存层或宣称已完整等激活**。此失败触发独立HTTPcache反例，不以鲜上下文通过掩盖升级问题。

ENG06：默认addAll可复制HTTP缓存中的旧HTML，导航fetch也可在断网时优先返回旧HTTP HTML。原shell两用例只改HTML为maxage3600即2/2失败，113仅改SW三处cache策略后原断言2/2通过；VM6、全474、80编辑子集均0。独立8阶段机制probe与真实a6 Git字节回归分开记录。

真实旧字节回归先安全提取a6并冷ci/build0。根/子路径×原/修4case，用显式Promise确认旧worker redundant、新active/controller activated后才继续：原2例仍旧HTML/离线失败，修2例install已新HTML，根/index各16卡、龙门lm_borrow_1→2、page/HTTP均0。actual-v6-upgrade-summary/result与旧dist/extract清单可核；不冒充再次原正式已闭V6窗口。正式67eb持久profile→f486升级亦已通过，详见下节。

## 已完成的113产品发布与正式验收

历史冷检出HEAD为4d14cda0eb131d1f1496671129aefa7992142d06，113代码plan2420文件/86413768B，CI环境ci/build/474均0；public-sw-cold-validation.json保留该输入。随后从作者2a2c403801fd6af8fb22529a9e9590883a3fc01d同步回执，公共f48614493ec4340355602f77d64b19c02220781e已普通FF发布（normal-push-sw-accepted.json）。已验证f486快照2451文件/88,697,548B、最大文本JSON4,221,144B；这些不是后续docs-only Q的最终统计。40私有基线缺席路径明确告警，公开归档完整性仍PARTIAL。

精确[Verify39105624826](https://github.com/seiya058904/jianghu/actions/runs/39105624826)及[Pages39105624823](https://github.com/seiya058904/jianghu/actions/runs/39105624823)均success，cloud-sw-accepted-success.json核其headSha=f486。对应CI artifact与正式HTTPS351/351文件、37,008,548B逐字节相同，pages-artifact-sw-accepted.json；tar SHA-256为3b08472977212f10cd412312ddd77e82fab388a1b2cf7cba317f24275dbb3e99。鲜Chrome26入口/交互/刷新PASS（online-sw-accepted.json），errors/http/consoleErrors/requestFailures均空，ONLINE_EXIT0。

正式67eb持久profile→f486严格升级：旧worker redundant、新active及controller activated，等待8791ms；断网作品库16卡、龙门lm_borrow_1→lm_borrow_2，errors/http均空，外置live-update-post67eb-strict/result.json。此为真实持久窗口更新，独立于鲜Chrome及受控真实a6四case；历史原V6已闭窗口失败仍按原边界保留。本节为回读实际回执，未声称文档审阅者再次执行。

## 产品发布闭环与最后文档收尾

|项|当前边界|
|---|---|
|同RC完整492|PASS：rc-sw-e2e-summary独立核492/492、exit0与全部五类结束后文件hash；0失败/跳过/flaky/重试|
|产品普通FF|PASS：67eb→f486，push0，无force；normal-push-sw-accepted.json|
|产品精确云门禁|PASS：f486两run success，对应artifact/HTTPS351全同|
|正式修复浏览器|PASS：f486双档26入口/真实两选择/刷新/图片/console/network|
|真实旧SW正式原地升级|PASS：67eb持久profile→f486严格生命周期屏障8791ms，断网16卡+龙门1→2|
|最后作者/公开状态与体积|最终两HEAD/clean status、原典SHA、完整恢复bundle、候选TREE/私档保全与外置实际测量|

产品f486部署与上述指定线上验收已经完成。后续仅同步公开回执文档形成docs-only Q，再等待Q精确Verify/Pages并核对应artifact与线上；尚未产生的Q不得预报通过。作者私有最终receipt记录最后公共SHA，公开侧保留已完成f486产品回执与最新Actions入口，避免文档自身SHA无限写入自身。各docs-only提交间产品/测试/工作流/869部署源与实际构建必须不变。总体仍INCOMPLETE：F18性能PARTIAL、F24作者库体积BLOCKED，非产品部署仍待执行。

正式[作品库](https://seiya058904.github.io/jianghu/)、[龙门](https://seiya058904.github.io/jianghu/longmen.html)、[死人](https://seiya058904.github.io/jianghu/dead-ranking.html)、[太华](https://seiya058904.github.io/jianghu/taihua.html)、[山河璧](https://seiya058904.github.io/jianghu/jade.html)、[芦花渡](https://seiya058904.github.io/jianghu/luhua.html)等已在f486鲜Chrome检查；旧SW更新另有真实持久窗口证据，外部设备与真人边界不由此转为PASS。
