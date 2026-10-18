# F01–F30 单一当前验收

最后公共SHA已完成验收：ef598cd5ed709e86a05007403bd2776bcfdfedf0，两云success、351线上核同、鲜Chrome26通过。最终时点与私有收尾见 [FINAL_CLOSEOUT.md](FINAL_CLOSEOUT.md)；下文各阶段快照保留原时间与边界，先前“Q待完成”已由该末回执关闭。

状态时点：已测产品RC113872382f2697f94bbf8f5dc3c62692641cf731对应正式f48614493ec4340355602f77d64b19c02220781e：build0、CI全474/474、编辑80/80、同一完整492/492（8workers、19.2分钟、exit0、0失败/跳过/flaky/重试），五类运行后文件hash全部核同。普通FF67eb→f486 push0；精确Verify39105624826/Pages39105624823成功，CIartifact↔正式HTTPS351/351同、26鲜入口PASS，真实67eb持久profile严格升级后离线16卡及龙门1→2通过，ENG06关闭。旧失败与弱身份guard边界保留。**产品验收计数：28 PASS／1 PARTIAL（F18）／0 FAIL／1 BLOCKED（F24）；未关闭P0/P1为0。**

本表绑定已实际验收的f486产品与现有交付证据。最后docs-only提交Q仍须独立核精确云端run/线上字节，尚不预写Q成功；父以私有receipt记录Q避免公开文档自SHA循环。

|ID|状态|当前证据与边界|
|---|---|---|
|F01|PASS|BASELINE两个SHA、fetch、无共同祖先；公共隔离分支从a6e5d59继续，作者master独立|
|F02|PASS|本机原典SHA/保护副本未变；f486策展2451文件/88697548B，public-privacy-sw-acceptance.json路径/hash/秘密模式与原典样本均0命中；披露扫描非所有编码/改写穷尽，40私档缺席归档完整性仍PARTIAL|
|F03|PASS|CANON_22_STORIES：五规则+22组完整正文回源；两组一手review及历史补审|
|F04|PASS|固定史实/年龄/死伤/门派逐组核；CE/CL及最后龙门修句原典反例66/66，历史P2另列|
|F05|PASS|f486正式16作品/23现行作品库，online-sw-accepted.json真实根/index双档26入口0error；旧潮生归档，新SW正式升级另见F14|
|F06|PASS|六旗舰逐场文学与必要改稿完成；113同一完整492含重点路线通过，独立死人/芦花/龙门双档路径另列，非真人盲读保证|
|F07|PASS|23/23篇具体三精彩/三薄弱、修与保留理由，STORY_EDITORIAL_REVIEW及两份原始review|
|F08|PASS|CHARACTER_ARCS与两组重要人物表超过20位；原典年龄/死亡/门派边界保留，非真人盲辨声线|
|F09|PASS|996观察CID配对；981对其余CID完全一致，15政策匹配单列；66反例、1714拍独立实走，弱口吻不冒称宏观分支|
|F10|PASS|600次/篇47/47声明结局、6707/6707已写拍可达；113完整492关键路线通过，仍非全变量状态穷举|
|F11|PASS|FILE_AUDIT_INDEX：715/715手写路径覆盖、203生成/锁文件单列；全文/比较/字节等价分开，职责IO/静态消费者/未知边界明确|
|F12|PASS|rc-sw-build0；新113与旧d62部署文件只dist/sw.js变化，作者源/Ink/JSON无漂移；rc-sw-input-delta与五manifest|
|F13|PASS|474单测；22真旧逐拍迁移+26原迁移专项；7真实浏览器auto/manual/import/备份失败/原raw下载，严格拒篡改不削弱|
|F14|PASS|原旧V6正式升级失败原样保留、窗口关闭无cache dump；113三处最小修与真实a6四case完成。formal-sw-update-fixed.json：真实67eb→f486等old redundant/active与controller activated共8791ms，再下载、断网库16卡/龙门1→2、errors/http空，ENG06关闭|
|F15|PASS|183图decode/真实alpha+27catalog、实际双档舞台和Lu清背景对照；未见重大撞脸/错龄/兵器史实冲突，模板/持锚闲站P2明确|
|F16|PASS|699候选资源绑定、登记缺文件0；ART_USAGE_TRACE标CG遮挡与renderer override，未把背景或模板冒称专属CG|
|F17|PASS|113完整492含七档主要舞台、24px/键盘/减弱动态/触摸转屏通过；f486鲜Chrome26双档入口0errors。物理设备/外部浏览器另列|
|F18|PARTIAL|高风险链独立全审/异常验证，18冷入口+228输入实测；未对INP/低端设备峰值内存/长期泄漏设客观验收阈值|
|F19|PASS|新113 build0、CI=true/GITHUB_ACTIONS=true全474/474与80/80编辑子集均exit0；rc-sw-build/tests/editorial.log。锁文件/依赖不变，旧全量证据不替代新浏览器终态|
|F20|PASS|113新完整492/492、8workers单run19.2分钟，E2E_EXIT0，0失败/跳过/flaky/重试；rc-sw-e2e-summary独立核原JSON与五类全部文件hash。原断言/次数/超时保留，HTTPcache原2case增强而非新增绕过|
|F21|PASS|全部本轮已确认P0/P1关闭；ENG06有原2fail→2pass、VM6/6、474/80、113完整492、严格a6旧字节及正式67eb→f486生命周期升级证据；P2/性能/设备/F24边界保留|
|F22|PASS|根README/AGENTS/导航/发布规程已纠正；f486 public-markdown-sw-acceptance.json核159MD/423本地链接0issues，外部URL不在该扫描；最后docs Q链接与精确云端另核|
|F23|PASS|原始BEFORE及2121图逐文件SHA移出、2109正常索引移除；完整bundle与完整Git副本/refs/6655对象清单可恢复|
|F24|BLOCKED|RC113验收后AFTER快照root1410755160逻辑/1419718624allocation B，未达1GiB；完整repack保留6655对象/refs，候选约330MB未采用，最后提交后另作外置实测|
|F25|PASS|新113公共本地4d14cda、2420允许文件/86413768B，隐私0/Markdown0；CI环境冷npm ci/build/474均0，全plan无漂移、869源/351dist同rc-sw冻结hash。40私档缺席路径归档完整性PARTIAL，最后文档同步另核|
|F26|PASS|113冻结源码及2a2c403作者交付已提交，f486产品与精选发布回执齐备；当前最后docs-only同步Q仍须记录精确提交/状态与云端回执，不宣称未执行的最终clean检查|
|F27|PASS|normal-push-sw-accepted.json：67eb→f486普通FF push exit0、force=false，完整保留先前各次回执；最后docs Q仍用普通FF并另记回执|
|F28|PASS|f486精确Verify39105624826与Pages39105624823均completed/success，headSha相同，cloud-sw-accepted-success.json；先f1失败保留，最后docs Q精确run不预写通过|
|F29|PASS|pages-artifact-sw-accepted.json351/351 CIartifact↔HTTPS原字节同；online-sw-accepted.json26入口PASS且四错误数组空；formal-sw-update-fixed.json严格旧67eb升级/断网16卡/龙门1→2通过。WinLinux347+4清单order-only另列，Q另核|
|F30|PASS|未增LICENSE；f486 public-privacy-sw-acceptance.json全2451路径/hash/模式及原典1461样本0命中，公开排除私档保留PARTIAL边界；对应CIartifact351线上核同。最后docs Q须新隐私/链接/精确云端复核，不冒充已完成|

真人试读、真人阅读耗时、Android真机、Safari/Firefox、读屏器均EXTERNAL NOT VERIFIED，不混进自动化PASS。F18本机测量不能替代目标设备性能，F24未达前不得宣称30/30。


---

> **2026-10-18 后续状态（本矩阵的历史行不再改动，仅追加更新）**
>
> 本文件 F24 行记录的是 RC113 验收后的作者根快照（1,410,755,160 逻辑 B）——那是**作者完整历史根**的体积，仍然成立。
> 2026-10-18 16:43 已完成用户批准的两次非覆盖目录交换：日用入口 `Jianghu` 现在是独立私有快照谱系（无 remote），完整作者谱系另存于本机独立目录（1.33 GiB，有意保留，不参与公开快照）。
> 新日用根含 .git、依赖与构建实测 336,030,358 B 逻辑 / 345,100,448 B AllocationSize，**F24 的“日用根 < 1 GiB”目标转为 PASS**；这不改变作者历史根仍大于 1 GiB 的事实，也不构成对历史库的清理授权。
> 证据与边界见私有审计目录中的日用仓库采用回执（不随公开快照发布）。
