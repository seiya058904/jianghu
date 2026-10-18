# Jianghu / 宋世江湖 · 独立全面审计与交付

**总状态：新SW修复本地完整验收通过；修复版尚未发布，正式旧SW升级复验待完成。F18 PARTIAL／F24 BLOCKED。**

本稿依据委托 §17 整理。当前冻结RC为 `113872382f2697f94bbf8f5dc3c62692641cf731`：修复SW更新后旧HTTP缓存首页干扰离线入口，产品仅public/sw.js变化、dist仅sw.js变化，三份相关测试同步增强。新build exit0，CI环境474/474单测exit0；完整492项E2E已单run通过：492/492、0失败／跳过／flaky／重试、exit0、19.2分钟，8 workers，五类逐文件指纹运行后全部核同（`rc-sw-e2e-summary.json`）。d62f完整492/492、exit0、19.0分钟及a04完整492/492均保留为历史证据，不能代替本次新RC。旧ec53完整491／1、fcef中止286／1、首次公共CI473／1及真实旧SW离线失败分别保留，不拼接通过数。

正式67eb的Verify／Pages、351个artifact与HTTPS文件逐字节一致及鲜Chrome交互已有实证；它们不覆盖旧SW原地更新的失败，也不代表后继SW修复RC已正式部署。

## 一、原典改编与可玩性

本轮两名独立审阅者合计逐段回读原典 **22/22组、五组规则、1–35,314行**，不是从旧报告或哈希测试推定读过。原典579,299字节，SHA-256 `2e2b665657543e81c6b06c121307c9f13685d2c535f762a5b921949aaa8af393` 未改。作者源审阅、现行修订与历史副本分开登记，来源字节与冻结预期哈希保留。完整映射见 [CANON_22_STORIES.md](CANON_22_STORIES.md)。

本地产品仍为16部作品／23个现行版本。六旗舰与全部现行篇均有具体三精彩、三薄弱及修／留理由；人物弧审阅超过20位，核年龄、死亡、门派和声线，不冒称真人盲辨测试。以下五例展示实际错误怎样改到玩家可感知的行为，均非机械加长：

|场面|改前|改后与证据|
|---|---|---|
|《死人争榜》三证、共桌和师门后记|选择共桌后又被说成去三间屋；未亲试／亲试及后续教课回忆混淆|同拍按真正选择分别保留共桌／分访、试与未试，学徒后记承认实际交接成本。CL专项含四组合；独立默认与不利／共桌路线均真实从开局点至结局。|
|《山河璧》后卷守粮与档路|守粮的玩家被算作亲自完成档案接报|粮路与档路分别记地点、劳动和可知范围，未把没到场写成亲历；璧不增加疗伤、增功或改史能力。见 CL04 与作者源反例。|
|《照水刀·芦花渡》混合回响|两个条件AND的else把玩家真做过的一件也说成没做；掌路混成篙路、伤肩串线|每件行为独立条件回扣，四种组合各自忠实；蒋衡用掌、陈的右肩与代价一致。两尺寸混合路线实际通关；持锚闲站的庞震海立绘仍单列P2。|
|《龙门问刀》`lm_sore_14`|尚未负贺之前，送帖对话已说“看见我输这一回”|改为“看见我只同罗先生打平”，不改选择、胜负、ID或变量；真旧compiled反例先失败，修后专项66/66，双尺寸从头走到罗平→新句→贺门认输。|
|《海路两世》中原以外后记|罗天海死后仍由本人回答第三代的事|切到当代学生交班与明确身后叙述，不复活祖师，不把两百余年压成同一代；early原典回源与回归支持。|

本轮已记录产品运行时采样600次／篇，声明结局 **47/47**、已写拍 **6,707/6,707** 可达；观察996个CID，981对后续其余CID完全相同，15对仅能以同一首选策略比较，口径分列。它们证明存在合法路径及已观察后果，**不是所有变量组合穷举，也不是浏览器逐结局真人通关**。首个选择均在8拍内，最长真实无选择段20拍。

独立《死人争榜》《芦花渡》6条完整浏览器路径共1,714拍、1,526次next、182次choice；实际逐拍DOM对oracle、逐次点击，截图中22张页面及庞原画实际目视复核。证据绑定其已记录产品指纹，不冒作后续工程新RC每帧都重看。选择中仍有观看焦点、轻口吻、即时互认等较轻互动；模板人物、部分静态动作、较密旁白及审美分歧均保留具体P2，不用“变量有读取”夸成宏观分支。见 [STORY_EDITORIAL_REVIEW.md](STORY_EDITORIAL_REVIEW.md)、[CHARACTER_ARCS.md](CHARACTER_ARCS.md)、[browser-late-review.md](browser-late-review.md)。

## 二、工程独立审核

[FILE_AUDIT_INDEX.csv](FILE_AUDIT_INDEX.csv) 当前聚合 **715/715手写路径**，203个生成／锁文件另列，共918条审计路径；直接全文、比较审读与精确等价覆盖有独立字段，不能全部说成同一人逐行读过。图索引 stale／metadata_changed 的路径均回源。late历史补读另有97份、8,834行的真实阅读台账；历史作者器未在共享目录执行，旧稿问题不靠改冻结字节掩盖。

已修与复核的工程问题包括禁读／满额存储降级、旧标签页覆盖、备份失败顺序、按篇下载遗漏新shell依赖、SW ready等待范围、公共缺基线的严格白名单、发布快照边界与当前版立绘残留背景。已有专项日志不替代最终完整回归。

同版本编辑订正导致旧Ink存档runtime整串不等的缺陷，以13份等于7a Git blob的真实旧JSON限定迁移；旧runtime＋presentation整体验真，新旧逐拍除正文外结构与变量相等，失败先保留原raw。独立94命令龙门探针成功、7类伪造拒绝；迁移专项与HalfStep首次延迟写回原契约有已记录通过证据。North后台put竞态以测试侧等待真实fetch waitUntil原promise解决，原断言／超时／次数不变，13spec定向85/85；GHA输出通道预期亦由真实CI环境反例修复。这些历史验证不替代最新SW完整回归。

正式旧V6 SW窗口更新后，新player及龙门下载成功，但断网index仍导入旧campaign，作品库未打开；原始 [online-old-sw-v6-failure.json](online-old-sw-v6-failure.json) 保留。窗口已关闭且未dump缓存HTML，不能唯一追认具体缓存层。受控root／subpath用max-age=3600首页、原断言真实先2失败后2通过；独立合成夹具8阶段probe区分HTTP与CacheStorage机制，不冒充原失败窗口重现。最小SW三处修复为install和按篇addAll的Request(cache:no-store)，以及导航网络请求no-store；其它资源策略、缓存名、存档与失败回复不变，不要求用户清缓存。见 [sw-http-cache-review.md](sw-http-cache-review.md)。

|已记录输入／检查|真实结果|当前能支持的结论|
|---|---|---|
|当前SW RC构建／CI单测，rc-sw-build.log、rc-sw-tests.log|BUILD_EXIT=0；474/474，UNIT_EXIT=0|产品／dist新字节由rc-sw五类manifest绑定；编辑80是474内子集。|
|历史d62f作者单测，rc-ci-tests.log，GITHUB_ACTIONS=true|474 passed，0失败，UNIT_EXIT=0|历史CI通道修复结果，不能加成554个独特测试。|
|历史d62f编辑子集，rc-ci-editorial.log|80/80，EDITORIAL_EXIT=0|历史独立执行结果；当前SW RC编辑子集已独立执行80/80、EDITORIAL_EXIT0（包含在474内，不相加）。|
|原典专项／真实旧档迁移／既有迁移|66/66、22/22、26/26|各自有限反例通过，见原日志。|
|迁移浏览器／shell更新／演员可见|7/7、2/2、2/2，均exit0|备份故障、真实下载字节、root与子路径冷离线等指定场景有证据。|
|fcef368 player整spec＋新迁移，rc-release-targeted.log|24/24，BROWSER_EXIT=0|原player:153断言未改通过，7新迁移与备份故障保护均通过。|
|旧ec53完整E2E|491通过／1失败，完整结束并保留|首次写回契约回归的真实失败历史；已修，不列作当前RC失败。|
|旧fcef完整E2E尝试，rc-release-e2e.log|286通过／1失败后中止|North cold-cache删除前后台put竞态已保留；不是完整492通过。|
|13个fixture spec，fixture-cache-all-browser.log|85/85，BROWSER_EXIT=0|真实原promise屏障；原cold delete/false/UI下载/true/离线断言不变，不与首批58项相加。|
|历史a04完整E2E，rc-acceptance-e2e.log|492/492，0失败/跳过/flaky/重试，exit0|单run36.5分钟；原断言／次数／超时不变，五类指纹运行后逐项一致。|
|首次公共f1d4b377推送及云端检查|普通push成功；Verify39101353779、Pages39101353730均FAILED|Pages473/474，GHA测试通道预期错误；后继67eb已云端通过，不抹去首次失败。|
|历史d62f完整E2E，rc-ci-e2e-summary.json|492/492，0失败／跳过／flaky／重试，exit0，19.0分钟|单run、8 workers、五类指纹未变；不代替当前SW RC。|
|SW HTTP缓存专项|VM 6/6、root／subpath浏览器原2失败→修后2通过|独立8阶段机制probe与真实旧SW失败分级，修复版正式升级尚待验证。|
|当前113 SW完整E2E，rc-sw-e2e-summary.json|492/492，0失败／跳过／flaky／重试，exit0，19.2分钟|单run、8 workers，五类全部hash运行后核同；原断言／次数／超时未削弱。|

图像183个栅格解码／alpha、27条catalog立绘、23篇双尺寸开局和重点真实舞台已核；699个候选资源绑定不等于699次可见触发，有CG遮挡及override记录。移动尺寸、焦点／键盘／确认流程有浏览器证据，物理移动设备与读屏器另列未验证。

性能 **F18=PARTIAL**：18个冷入口、龙门228次真实输入；本机往返P95 274.7ms、CDP heap约4.52→5.41MiB，受并行负载且未强制GC。未证INP阈值、低端Android、GPU纹理、长期泄漏；同步保存及逐拍迁移有CPU成本。见 [FINAL_QA.md](FINAL_QA.md)、[CODE_SECURITY_PERFORMANCE.md](CODE_SECURITY_PERFORMANCE.md)、[performance-browser.md](performance-browser.md)。

## 三、仓库瘦身

以下为有文件清单的**测量快照**，末列不是最终新RC根目录即时统计；主代理须在最终构建和报告收尾后重新测量。逻辑字节与文件系统allocation分开，不将公开镜像大小替代作者根目录目标。

|口径|审计前 bytes|验收后测量快照 bytes（`1138723…`）|
|---|---:|---:|
|作者工作区，不含.git|1,942,475,638|283,142,419|
|.git|1,146,900,830|1,127,612,741|
|整个作者根目录，含.git|3,089,376,468|1,410,755,160|
|是否低于1GiB（1,073,741,824）|否|**否，F24 BLOCKED**|

来源：[SIZE_INVENTORY_BEFORE.csv](SIZE_INVENTORY_BEFORE.csv)、[SIZE_INVENTORY_AFTER.csv](SIZE_INVENTORY_AFTER.csv)、[size-after.json](size-after.json)。验收后快照allocation另为1,419,718,624字节；报告mtime UTC 2026-10-18T06:49:40.889776+00:00，提交后最终数字另由外置收尾测量提供。

已逐文件验SHA后外移2,121张历史PNG、1,683,183,225字节，其中2,109个追踪项正常从当前索引移除；旧Git对象仍保留，因此.git体积不会随当前树删图自动消失。备份在项目外 `../Jianghu-independent-20261018/historical-evidence/`，逐项恢复清单 [historical-png-archive.csv](historical-png-archive.csv)，清单SHA `d91d4560548d1f36f44433e42e1e592e49c759abb53dce6ce94c482f5903267d`。

完整历史bundle为项目外 `../Jianghu-independent-20261018/jianghu-author-before-slim.bundle`，1,118,742,731字节，独立复核SHA-256 `1a52a555021588f4134237aaa5dfc3c926de00b7021cc84842dfc49e1088e9d7`，`git bundle verify` 确认complete history及6 refs，见 [git-bundle-verify.log](git-bundle-verify.log)。完整Git维护副本与6655对象／refs的逐项记录见 [git-maintenance-backup.json](git-maintenance-backup.json)；refs SHA `4e7f0a3bd6ea5f7e94936eaa5d4f14a9d58cc602e2602d06f4337f3689c83e53`，对象清单SHA `19bbab566261aba178802f6e724774a483efe84b1b46dc37d056e90d9d017ca2`。恢复应先在项目外新目录clone完整bundle、核refs，再按PNG清单复制并验SHA；不要直接覆盖当前作者库。

首次推送前公共9885dfed快照的中间预审为2,250文件／73,556,666字节，最大文件 `docs/art/ASSET_MANIFEST_V6.json` 4,221,144字节（文本JSON）；既有公开 `ferry.png` 2,701,831字节按原hash精确保留。这些**不是首次公共f1d4b377或最终发布HEAD的计量**；最终文档同步后须重新写真实数。

小于1GiB目标尚未完成。普通无过期repack已在隔离副本和作者库完成；作者库维护前后6655对象/refs/fsck核同，节省25,627,219 bytes。该步骤仍不足以达标，未重写历史。**仅若最终需要替换作者库／每日库或重写既有历史，才需另行明确批准该动作。** 这项阻断不撤销已经授权的正常公共main快进发布，也不要求对普通发布重复确认。

## 四、Git／发布

作者基线 `master@7a2c22f74c46d74f07af8bd1a45893ec15daa49b`；当前冻结验收RC为 `113872382f2697f94bbf8f5dc3c62692641cf731`。首次f1d4b377推送后云端测试失败；后继公共 `67eb150348013c06bdf328a95589395b3c987aa0` 已普通FF发布，Verify39103362100／Pages39103362099均success。该部署来源d62产品；当前SW修复版尚未正式发布。

公共main基线 `a6e5d5947ce2d06c6c2ab83e1cfd515c95191959`，与作者历史无共同祖先。公开快照在隔离clone上沿真实main作**普通增量／快进推送**；原典全文、私档、候选原图、env/key、巨量历史证据不公开。未改冻结预期哈希，未强推、未新增LICENSE；已授权的普通FF发布可在门禁完成后继续，无需再问一次。

正式67eb的 [Verify39103362100](https://github.com/seiya058904/jianghu/actions/runs/39103362100) 与 [Pages39103362099](https://github.com/seiya058904/jianghu/actions/runs/39103362099) 均成功，351个CI artifact文件与正式HTTPS逐字节相同。鲜Chrome双尺寸26入口／交互／刷新通过；但发布前保留的真实V6旧SW窗口原地更新后离线index失败。此失败使旧SW升级项仍待收敛，不能被鲜窗口结果覆盖。新RC完整回归及正式67eb→修复版持久窗口升级／离线结果仍待后续回执，见 [RELEASE_VALIDATION.md](RELEASE_VALIDATION.md)。

正式URL：[作品库](https://seiya058904.github.io/jianghu/)、[龙门](https://seiya058904.github.io/jianghu/longmen.html)、[死人争榜](https://seiya058904.github.io/jianghu/dead-ranking.html)、[山河璧](https://seiya058904.github.io/jianghu/jade.html)、[芦花渡](https://seiya058904.github.io/jianghu/luhua.html)。正式67eb鲜Chrome证据与旧V6升级失败分别登记；当前SW修复尚不能标这些线上入口已更新成功。

## 五、最终验收矩阵

单一状态表为 [FINAL_ACCEPTANCE.md](FINAL_ACCEPTANCE.md)，最终分类数以实际收敛为准。d62历史完整492、67eb云端及鲜窗口均有通过记录；真实旧V6 SW更新后离线失败仍保留，当前113 SW修复完整492已通过，修复版正式部署与持久窗口升级仍待完成。F24仍BLOCKED，F18仍PARTIAL；不得宣称30/30或FULLY VERIFIED & DEPLOYED。

外部项一律 **EXTERNAL NOT VERIFIED**：真人试读、真人阅读耗时、真人审美／愿意投入时长、Android真机、Safari、Firefox、读屏器。自动化、代理实际看图与真人试玩不是同一证据等级。

## 六、交付文档与证据

- 总结与验收：[本报告](FINAL_DELIVERY.md)、[最终QA](FINAL_QA.md)、[30项矩阵](FINAL_ACCEPTANCE.md)、[问题台账](ISSUE_LEDGER.md)、[发布回执](RELEASE_VALIDATION.md)。
- 编剧与原典：[22组映射](CANON_22_STORIES.md)、[全篇文学终审](STORY_EDITORIAL_REVIEW.md)、[人物弧](CHARACTER_ARCS.md)、[前半原始review](canon-early-review.md)、[后半原始review](canon-late-review.md)、[历史late清单](canon-historical-late-files.csv)。源改动在当前author.mjs入口，未用生成物替代作者源修改；原典全文不随公开交付。
- 工程与素材：[文件审计索引](FILE_AUDIT_INDEX.csv)、[工程安全性能](CODE_SECURITY_PERFORMANCE.md)、[独立反审](engineering-final-counterreview.md)、[迁移反审](editorial-migration-counterreview.md)、[cold-cache夹具反审](fixture-cache-counterreview.md)、[视觉与真实通关](VISUAL_PLAYTHROUGH.md)、[原图独立复核](visual-independent-review.md)、[资源触发台账](ART_USAGE_TRACE.json)。
- 原始检查：当前RC使用 `rc-sw-build.log`、`rc-sw-tests.log`、`rc-sw-input-delta.json`、`rc-sw-e2e-summary.json` 及五类 `rc-sw-*-manifest.json`。669产品指纹 `e4bf0b54b8d9035ce9f384d8c221924451dca84769073d8c9eb43c8cbce816c9`；165测试 `bfeaee87e401c565829946dc38d65b33f7412b476679a12e8c212b77ffc3a0d6`；869部署源 `afd05b04a097e6ea9756f58ae8a0dd3c1e58fc9965f5625dc9af9971f0e14594`；351dist `797a6a2d1c252c45eadd59585a32cd23a636b129b7445c5cb387efebad538ded`；918审读路径 `68b5ee0c6c69b4f77f40672fbef3cd24c84ab11ae260798672bd8d487e7189b8`。`rc-ci-e2e-summary.json` 只绑定旧d62的492/492；全部旧失败、中止及历史通过原始证据保留。
- 恢复依据：BEFORE／AFTER逐文件清单、PNG恢复清单与完整bundle验证；全尺寸原图和完整浏览器JSON／截图保存在项目外 `../Jianghu-independent-20261018/`，库内只留≤800px精选WebP与纯文本索引。路径及哈希是恢复凭据，不是删除候选素材或改写历史的授权。

本稿不会以文档齐全或鲜窗口通过替代旧SW升级验收。当前113 SW修复已完整492通过，仍需正式部署后持久窗口更新／下载／断网入口结果；体积与设备边界仍未关闭。

私有提案完整性补证：最新中间候选为0f58来源→f1f8候选，478项私有附加文件边界保留，当前作者根未替换、提案无remote、公共镜像不含私档。先前be56235→ada1ecf的2,527追踪路径、918pins、478项56,019,899字节及329,656,131逻辑／338,310,184 allocation／.git49,834,415字节只是 [daily-candidate-validation.json](daily-candidate-validation.json) 所载历史快照，**不是最新候选或最终计量**。SW修复和最终回执文档还须同步与外置复验；候选低于1GiB不表示作者根F24达标，也不构成切库授权。

生命周期与跨平台复核补充：首次正式V6窗口只证明调用update并刷出新player、收到包ready后离线失败；原async身份guard未可靠确认新SW接管，已关闭无cache dump，不唯一追认层。另有严格Promise(old redundant/active与controller activated)的真实a6 Git冷建四case：原策略根/子路径均复现，113两路径根/index16卡与龙门1→2、page/HTTP0，actual-v6-upgrade-summary/result可核。当前正式67eb持久profile已改同生命周期屏障，后继修复部署尚待信号。67eb CI artifact↔正式HTTPS确351/351原字节同；Linux CI↔Windows d62只有347/351原字节同，4个offline清单仅数组顺序不同，排序逐项相同，无增缺或重复，ci-windows-first-artifact-comparison.json。公开本地Windows351同作者Windows是另一独立结论。
