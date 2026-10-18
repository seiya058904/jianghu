# F01–F30 单一当前验收

状态时点：新冻结SW RC113872382f2697f94bbf8f5dc3c62692641cf731，build0、CI环境474/474单测与80/80编辑子集均0，完整492/492、8workers、19.2分钟单run通过，0失败/跳过/flaky/重试，E2E_EXIT0，五类结束后文件hash全部核同。上一d62完整4920保留历史。正式67eb的Verify/Pages均success，351 artifact/HTTPS同、鲜Chrome26入口PASS，但真实旧V6SW升级后离线首页FAIL；ENG06已最小修且原root/subpath反例先2fail后2pass。最终新全量和正式升级待完成。

|ID|状态|当前证据与边界|
|---|---|---|
|F01|PASS|BASELINE两个SHA、fetch、无共同祖先；公共隔离分支从a6e5d59继续，作者master独立|
|F02|PARTIAL|本机原典SHA/保护副本未变；公共RC隐私0命中，最终文档同步/云端artifact仍待核|
|F03|PASS|CANON_22_STORIES：五规则+22组完整正文回源；两组一手review及历史补审|
|F04|PASS|固定史实/年龄/死伤/门派逐组核；CE/CL及最后龙门修句原典反例66/66，历史P2另列|
|F05|PASS|正式67eb已为16作品/23现行作品库，鲜Chrome根/index双档实开，潮生归档；online-ci-fixed.json，26入口0error。新RC仅SW变动，最终上线另列|
|F06|PASS|六旗舰逐场文学与必要改稿完成；历史d62单次完整492含重点实际路线通过（故事输入与113未变），新113全量另核，独立死人/芦花/龙门双档路径另列|
|F07|PASS|23/23篇具体三精彩/三薄弱、修与保留理由，STORY_EDITORIAL_REVIEW及两份原始review|
|F08|PASS|CHARACTER_ARCS与两组重要人物表超过20位；原典年龄/死亡/门派边界保留，非真人盲辨声线|
|F09|PASS|996观察CID配对；981对其余CID完全一致，15政策匹配单列；66反例、1714拍独立实走，弱口吻不冒称宏观分支|
|F10|PASS|600次/篇47/47声明结局、6707/6707已写拍可达；历史d62完整492关键路线已通过（故事输入未变），新113全量另核，仍非全变量状态穷举|
|F11|PASS|FILE_AUDIT_INDEX：715/715手写路径覆盖、203生成/锁文件单列；全文/比较/字节等价分开，职责IO/静态消费者/未知边界明确|
|F12|PASS|rc-sw-build0；新113与旧d62部署文件只dist/sw.js变化，作者源/Ink/JSON无漂移；rc-sw-input-delta与五manifest|
|F13|PASS|474单测；22真旧逐拍迁移+26原迁移专项；7真实浏览器auto/manual/import/备份失败/原raw下载，严格拒篡改不削弱|
|F14|PARTIAL|正式真实旧SW升级后的离线index失败已保留；ENG06三处最小修，HTTPcache旧HTML受控root/subpath原2例先2fail后2pass、VM6/6。新完整与正式67eb→fixed窗口待重验，不能拿冷缓存绿掩盖升级失败|
|F15|PASS|183图decode/真实alpha+27catalog、实际双档舞台和Lu清背景对照；未见重大撞脸/错龄/兵器史实冲突，模板/持锚闲站P2明确|
|F16|PASS|699候选资源绑定、登记缺文件0；ART_USAGE_TRACE标CG遮挡与renderer override，未把背景或模板冒称专属CG|
|F17|PASS|历史d62完整492中七档主要舞台、24px/键盘/减弱动态/触摸转屏已通过（UI输入未变），新113整run另核；23篇1440/390独立实开，物理设备另列|
|F18|PARTIAL|高风险链独立全审/异常验证，18冷入口+228输入实测；未对INP/低端设备峰值内存/长期泄漏设客观验收阈值|
|F19|PASS|新113 build0、CI=true/GITHUB_ACTIONS=true全474/474与80/80编辑子集均exit0；rc-sw-build/tests/editorial.log。锁文件/依赖不变，旧全量证据不替代新浏览器终态|
|F20|PASS|113新完整492/492、8workers单run19.2分钟，E2E_EXIT0，0失败/跳过/flaky/重试；rc-sw-e2e-summary独立核原JSON与五类全部文件hash。原断言/次数/超时保留，HTTPcache原2case增强而非新增绕过|
|F21|PARTIAL|先前P0/P1与QA03已闭；新ENG06正式升级离线P1已修113，局部6unit/2browser及全474/80通过，最终新492与真实正式升级后才关闭|
|F22|PARTIAL|根README/AGENTS/导航/发布规程已纠正，全树扫描0断链；最终回执/数量与最后链接扫描待收敛|
|F23|PASS|原始BEFORE及2121图逐文件SHA移出、2109正常索引移除；完整bundle与完整Git副本/refs/6655对象清单可恢复|
|F24|BLOCKED|RC113验收后AFTER快照root1410755160逻辑/1419718624allocation B，未达1GiB；完整repack保留6655对象/refs，候选约330MB未采用，最后提交后另作外置实测|
|F25|PASS|新113公共本地4d14cda、2420允许文件/86413768B，隐私0/Markdown0；CI环境冷npm ci/build/474均0，全plan无漂移、869源/351dist同rc-sw冻结hash。40私档缺席路径归档完整性PARTIAL，最后文档同步另核|
|F26|PARTIAL|修复RC a04已提交；报告/精选证据尚在最终整理，最后作者HEAD与空status待记录|
|F27|PASS|a6e5d59→f1d4b37普通FF已push并实时核远端，无force/覆盖历史。修复后最终追加仍需新fetch与普通FF，回执逐次保留|
|F28|PARTIAL|67eb精确Verify39103362100和Pages39103362099均success；先f1失败保留。67eb仍有已证升级离线P1，新113未发布，不以旧云绿代最终SHA|
|F29|PARTIAL|67eb正式351 CI artifact文件/HTTPS全同，26鲜Chrome双档入口与真实开局/两选择/刷新均PASS；旧SW升级离线FAIL另列ENG06，新修复正式复验待完成|
|F30|PARTIAL|未增LICENSE；公开最终产品RC全量路径/hash/秘密/原典文本预审0；最终文档同步与云端artifact再扫后关闭|

真人试读、真人阅读耗时、Android真机、Safari/Firefox、读屏器均EXTERNAL NOT VERIFIED，不混进自动化PASS。F18本机测量不能替代目标设备性能，F24未达前不得宣称30/30。
