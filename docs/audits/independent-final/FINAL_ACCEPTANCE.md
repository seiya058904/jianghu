# F01–F30 单一当前验收

状态时点：a04d36a冻结RC已build/474单测/80编辑子集、单次完整492 E2E全部通过（0失败/跳过/flaky/重试，exit0）。结束后五类指纹逐项未变。当前尚未推送，发布相关行待真实云端与线上证据。

|ID|状态|当前证据与边界|
|---|---|---|
|F01|PASS|BASELINE两个SHA、fetch、无共同祖先；公共隔离分支从a6e5d59继续，作者master独立|
|F02|PARTIAL|本机原典SHA/保护副本未变；公共RC隐私0命中，最终文档同步/云端artifact仍待核|
|F03|PASS|CANON_22_STORIES：五规则+22组完整正文回源；两组一手review及历史补审|
|F04|PASS|固定史实/年龄/死伤/门派逐组核；CE/CL及最后龙门修句原典反例66/66，历史P2另列|
|F05|PARTIAL|本地16作品/23现行首页与归档操作已验；正式线上旧门面待正常发布|
|F06|PASS|六旗舰逐场文学与必要改稿完成；单次完整492含重点实际路线通过，独立死人/芦花/龙门双档路径另列|
|F07|PASS|23/23篇具体三精彩/三薄弱、修与保留理由，STORY_EDITORIAL_REVIEW及两份原始review|
|F08|PASS|CHARACTER_ARCS与两组重要人物表超过20位；原典年龄/死亡/门派边界保留，非真人盲辨声线|
|F09|PASS|996观察CID配对；981对其余CID完全一致，15政策匹配单列；66反例、1714拍独立实走，弱口吻不冒称宏观分支|
|F10|PASS|600次/篇47/47声明结局、6707/6707已写拍可达；当前完整492关键浏览器路线通过，仍非全变量状态穷举|
|F11|PASS|FILE_AUDIT_INDEX：715/715手写路径覆盖、203生成/锁文件单列；全文/比较/字节等价分开，职责IO/静态消费者/未知边界明确|
|F12|PASS|rc-acceptance-build0；作者与隔离公开均重编无生成物漂移，669产品/351dist逐文件指纹|
|F13|PASS|474单测；22真旧逐拍迁移+26原迁移专项；7真实浏览器auto/manual/import/备份失败/原raw下载，严格拒篡改不削弱|
|F14|PARTIAL|根/小写子路径hashed shell2/2，旧raw根/子路径冷离线7例内；其它全量冷/热包仍在跑，线上旧SW更新待部署信号|
|F15|PASS|183图decode/真实alpha+27catalog、实际双档舞台和Lu清背景对照；未见重大撞脸/错龄/兵器史实冲突，模板/持锚闲站P2明确|
|F16|PASS|699候选资源绑定、登记缺文件0；ART_USAGE_TRACE标CG遮挡与renderer override，未把背景或模板冒称专属CG|
|F17|PASS|当前完整492中七档主要舞台、24px/键盘/减弱动态/触摸转屏均通过；23篇1440/390独立实开，物理设备另列|
|F18|PARTIAL|高风险链独立全审/异常验证，18冷入口+228输入实测；未对INP/低端设备峰值内存/长期泄漏设客观验收阈值|
|F19|PASS|最终RC build0、unit474/474 exit0、editorial80/80 exit0；隔离公共npm ci0与同RC冷检出474/474；日志见FINAL_QA|
|F20|PASS|a04完整单run492/492，36.5min，0失败/跳过/flaky/重试，E2E_EXIT0；rc-acceptance-e2e.log/summary，全部五类指纹运行后未变|
|F21|PASS|确认P0/P1代码与正典缺陷均修；原HalfStep153、13冷缓存spec及最终全492原断言通过；旧491/1和286/1保留失败历史，P2/外部边界另列|
|F22|PARTIAL|根README/AGENTS/导航/发布规程已纠正，全树扫描0断链；最终回执/数量与最后链接扫描待收敛|
|F23|PASS|原始BEFORE及2121图逐文件SHA移出、2109正常索引移除；完整bundle与完整Git副本/refs/6655对象清单可恢复|
|F24|BLOCKED|当前原作者根含.git仍>1GiB；已普通repack节省25627219bytes且6655对象/refs/fsck核同；根1398265570 logical/1406591368 allocated，仍不达标，未据镜像大小冒称达标|
|F25|PASS|当前代码RC公开2250文件/73556666bytes；禁入/secret/私路径/原典512字符样本0，冷npm ci/build/test0；私档40条warning保持PARTIAL|
|F26|PARTIAL|修复RC a04已提交；报告/精选证据尚在最终整理，最后作者HEAD与空status待记录|
|F27|PARTIAL|隔离公共bd36→6779→b134→9885为正常本地增量commit，尚未推送；须新fetch核main未被推进|
|F28|PARTIAL|最终公共SHA的Verify与Pages待推送后等最终结果，未将旧Oct16成功当当前|
|F29|PARTIAL|旧正式SW+作品缓存已在独立新context准备；新版深链/交互/原地更新/离线须等发布后实际执行|
|F30|PARTIAL|未增LICENSE；公开最终产品RC全量路径/hash/秘密/原典文本预审0；最终文档同步与云端artifact再扫后关闭|

真人试读、真人阅读耗时、Android真机、Safari/Firefox、读屏器均EXTERNAL NOT VERIFIED，不混进自动化PASS。F18本机测量不能替代目标设备性能，F24未达前不得宣称30/30。
