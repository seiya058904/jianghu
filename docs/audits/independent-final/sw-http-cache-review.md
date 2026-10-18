# ENG-06：HTTP 缓存旧首页穿过离线包更新

2026-10-18，正式公共67eb150的Verify与Pages已success，351个CI artifact文件与正式HTTPS逐字节一致，鲜Chrome双档26入口/交互/刷新0错误。但发布前真实保留的V6正式SW窗口更新到新SW、刷新新player脚本、下载龙门成功后，断网index.html仍请求campaign-v6-Ct-yMjRt，作品库未打开。原始[失败结果](online-old-sw-v6-failure.json)保留；该窗口finally已关闭，未保存缓存HTML，不能唯一追认其中具体缓存层的字节。

父代理随后只把既有shell-update.spec.ts的首页响应改为max-age=3600，其余响应仍no-store。原16卡/marker2/0error断言、两root/subpath用例与超时均不变，旧SW真实2/2失败，见shell-http-cache-before.log。它证明旧HTTP HTML保持fresh时，原更新链不满足本来就有的验收契约。

工程独立Chrome探针使用冻结0f58 SW原字节策略和明确的合成old/new HTML/module夹具，不冒称真实原典或再次正式V6窗口。两前缀共8阶段：原策略新阶段首页请求0、CacheStorage旧、离线失败；仅addAll强制no-store后首页请求4且CacheStorage新，离线fetch仍从HTTP缓存返回旧首页；addAll与仅navigation绕过HTTP缓存后均16卡/0errors；所有fetch绕过亦通过。完整[逐阶段请求、HTML、实际结果](sw-http-cache-independent-probe.json)，脚本项目外workspace/stale-http-navigation-probe.mjs，SHA256 `253e50cf24c4db0483afa3645d12f891103d4243a8ea58a1635013824859773c`。原正式失败与受控机制相容，但探针不是其丢失缓存状态的追溯证明。

最小源修只有public/sw.js三处：install与按篇显式下载的addAll使用Request(cache:no-store)，网络优先的导航fetch也使用no-store，避免断网时HTTP缓存先于新CacheStorage命中。其它资源保留原fetch策略，缓存名称、其它作品、URL/manifest校验、下载失败回复及存档不改。没有清全部缓存或要求用户手工清理。

两份VM单测适配浏览器Request的base URL规则，使用真实Node Request并断言URL和cache模式；原注册作品、未知作品、HTTP/越界/配额失败、保留其它作品的断言全部保留。6/6专项通过；新build0，CI环境完整474/474单测exit0，增强原shell浏览器2/2通过，见shell-http-cache-unit.log、rc-sw-build.log、shell-http-cache-fixed.log。编辑子集、同RC完整492和正式旧SW原地升级仍须后继真实结果，不能用d62旧全绿代替。

父代理完整回读4文件与差异，独立工程复核另记录。check_index_coverage本次Transport closed，采用直接源码回读，不声称图已覆盖。FILE_AUDIT_INDEX只刷新这4条hash/实际行数，手写715、生成203、总918口径不变。正式67eb→后继修复的独立真实SW窗口已提前准备，并保留持久profile与升级前后CacheStorage HTML诊断；尚未发部署信号，不预报通过。

工程独立复核已完整回读相同4源并核SHA，确认导航仅绕过HTTP缓存、其它资源原fetch策略保留，原URL/拒绝/其它作品/marker2等断言不削弱。只做有界回填时序探查，未经复现的并发假设不作为新增确认缺陷。

严格生命周期补证：实际a6公开Git源码外置冷npmci/build均0，使用真实旧V6页面/JS/素材/SW，不合成故事或16卡。根/子路径×原策略/113修复4case均用单一page.evaluate Promise，确认old redundant、新active/controller activated后才继续：原2例仍旧HTML/离线导入失败，修2例install完成已新HTML，根/index各16卡、龙门lm_borrow_1→2、页面/HTTP均0error。actual-v6-upgrade-summary.json/result.json、原始log与旧dist/extract可核；脚本外置SHA5e091dd2d8de5268d64e929c73a57261593c10e9e917a8d60aace5639c6bc3d7。旧探针async waitForFunction对象身份guard不可靠，attempt2/3完整保留；旧正式已闭窗口的激活等待也不能反证为已完成，本证据是本地真旧字节回归，不冒充原正式窗口复跑。正式67eb持久profile已保留并改用相同显式Promise生命周期屏障，另等待真实typing结束与beat变化，尚未发后继部署信号。
