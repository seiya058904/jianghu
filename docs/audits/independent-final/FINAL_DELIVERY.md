# Jianghu / 宋世江湖 · 独立全面审计与交付

**总状态：本地验收通过；新云端发布待完成，F18 PARTIAL／F24 BLOCKED。**

本稿依据委托 §17 整理。当前冻结验收RC为 `d62f99f09f71bf895e63dc93757df45fa033200d`：仅修测试中GITHUB_ACTIONS输出通道的预期，产品与dist逐字节保持a04／fcef不变。新RC构建exit0，`GITHUB_ACTIONS=true` 下作者单测474/474、编辑80/80子集均exit0。新完整492项E2E已单run通过：492/492、0失败／跳过／flaky／重试、exit0、19.0分钟，8 workers；原断言／次数／超时保留，五类逐文件指纹运行后全部未变（`rc-ci-e2e-summary.json`）。a04单次完整492/492、0失败／跳过／flaky／重试、exit0、36.5分钟、4 workers保留为历史证据，不与新RC结果累加。旧ec53完整491通过／1失败、fcef中止286通过／1失败亦分别保留，不拼接通过数。

本地证据已绑定d62f完整回归；最终作者／公共SHA、体积和云端检查／部署回执按实际收尾同步。此前检查保留各自输入，不能由本地通过推出云端或设备通过。

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

同版本编辑订正导致旧Ink存档runtime整串不等的缺陷，使用13份逐字节等于7a Git blob的真实旧JSON限定迁移；旧runtime＋presentation整体验真，新旧逐拍除正文外结构与变量相等，返回新重放会话，失败先保留原raw。独立94命令龙门探针成功，7类伪造拒绝；工程22项、原画面迁移26项、浏览器7项通过。旧ec53完整suite另发现HalfStep首次写回契约退化；fcef368已仅将首次render写回限定于previousContent或editorialContent，HalfStep延迟至原推进／保存链写回。fcef产品的player原契约与7迁移专项合计24/24通过；独立源审确认三个分支均保留。其后North删缓存前置出现后台put回填竞态：helper只等待真实fetch waitUntil原promise，不替换缓存／Response、不改产品。全部13个同型spec源审确认原断言／超时／次数不变，定向85/85；a04完整492单run通过属于上一RC记录。首次公共CI又暴露测试把GHA有意输出stdout错当stderr的夹具问题；工程以GITHUB_ACTIONS=true复现原失败，只改一个单测文件47行，原6种模式分别覆盖两个环境并核精确通道及missing report，两环境定向各1/1通过。产品输出行为未改；新RC完整492已通过，首次云端失败记录仍保留。

|已记录输入／检查|真实结果|当前能支持的结论|
|---|---|---|
|d62f `npm run build`，rc-ci-build.log|BUILD_EXIT=0|新RC重建通过，产品与351个dist文件保持a04冻结字节。|
|新RC作者单测，rc-ci-tests.log，GITHUB_ACTIONS=true|474 passed，0失败，UNIT_EXIT=0|含80个编辑草稿契约，不能加成554个独特测试。|
|新RC编辑子集，rc-ci-editorial.log，GITHUB_ACTIONS=true|80/80，EDITORIAL_EXIT=0|上述子集独立再执行。|
|原典专项／真实旧档迁移／既有迁移|66/66、22/22、26/26|各自有限反例通过，见原日志。|
|迁移浏览器／shell更新／演员可见|7/7、2/2、2/2，均exit0|备份故障、真实下载字节、root与子路径冷离线等指定场景有证据。|
|fcef368 player整spec＋新迁移，rc-release-targeted.log|24/24，BROWSER_EXIT=0|原player:153断言未改通过，7新迁移与备份故障保护均通过。|
|旧ec53完整E2E|491通过／1失败，完整结束并保留|首次写回契约回归的真实失败历史；已修，不列作当前RC失败。|
|旧fcef完整E2E尝试，rc-release-e2e.log|286通过／1失败后中止|North cold-cache删除前后台put竞态已保留；不是完整492通过。|
|13个fixture spec，fixture-cache-all-browser.log|85/85，BROWSER_EXIT=0|真实原promise屏障；原cold delete/false/UI下载/true/离线断言不变，不与首批58项相加。|
|历史a04完整E2E，rc-acceptance-e2e.log|492/492，0失败/跳过/flaky/重试，exit0|单run36.5分钟；原断言／次数／超时不变，五类指纹运行后逐项一致。|
|首次公共f1d4b377推送及云端检查|普通push成功；Verify39101353779、Pages39101353730均FAILED|Pages测试473/474，GHA通道预期错误；没有部署，新RC本地已通过，公共同步与云端重验待完成。|
|d62f完整E2E，rc-ci-e2e.log／rc-ci-e2e-summary.json|492/492，0失败／跳过／flaky／重试，exit0，19.0分钟|单run、8 workers；原断言／次数／超时保留，五类逐文件指纹运行后全部不变。|

图像183个栅格解码／alpha、27条catalog立绘、23篇双尺寸开局和重点真实舞台已核；699个候选资源绑定不等于699次可见触发，有CG遮挡及override记录。移动尺寸、焦点／键盘／确认流程有浏览器证据，物理移动设备与读屏器另列未验证。

性能 **F18=PARTIAL**：18个冷入口、龙门228次真实输入；本机往返P95 274.7ms、CDP heap约4.52→5.41MiB，受并行负载且未强制GC。未证INP阈值、低端Android、GPU纹理、长期泄漏；同步保存及逐拍迁移有CPU成本。见 [FINAL_QA.md](FINAL_QA.md)、[CODE_SECURITY_PERFORMANCE.md](CODE_SECURITY_PERFORMANCE.md)、[performance-browser.md](performance-browser.md)。

## 三、仓库瘦身

以下为有文件清单的**测量快照**，末列不是最终新RC根目录即时统计；主代理须在最终构建和报告收尾后重新测量。逻辑字节与文件系统allocation分开，不将公开镜像大小替代作者根目录目标。

|口径|审计前 bytes|验收后测量快照 bytes（`a04d36a…`）|
|---|---:|---:|
|作者工作区，不含.git|1,942,475,638|280,013,280|
|.git|1,146,900,830|1,123,264,381|
|整个作者根目录，含.git|3,089,376,468|1,403,277,661|
|是否低于1GiB（1,073,741,824）|否|**否，F24 BLOCKED**|

来源：[SIZE_INVENTORY_BEFORE.csv](SIZE_INVENTORY_BEFORE.csv)、[SIZE_INVENTORY_AFTER.csv](SIZE_INVENTORY_AFTER.csv)、[size-after.json](size-after.json)。验收后快照allocation另为1,411,713,320字节；报告mtime13:36:48 +08，提交后最终数字另由外置收尾测量提供。

已逐文件验SHA后外移2,121张历史PNG、1,683,183,225字节，其中2,109个追踪项正常从当前索引移除；旧Git对象仍保留，因此.git体积不会随当前树删图自动消失。备份在项目外 `../Jianghu-independent-20261018/historical-evidence/`，逐项恢复清单 [historical-png-archive.csv](historical-png-archive.csv)，清单SHA `d91d4560548d1f36f44433e42e1e592e49c759abb53dce6ce94c482f5903267d`。

完整历史bundle为项目外 `../Jianghu-independent-20261018/jianghu-author-before-slim.bundle`，1,118,742,731字节，独立复核SHA-256 `1a52a555021588f4134237aaa5dfc3c926de00b7021cc84842dfc49e1088e9d7`，`git bundle verify` 确认complete history及6 refs，见 [git-bundle-verify.log](git-bundle-verify.log)。完整Git维护副本与6655对象／refs的逐项记录见 [git-maintenance-backup.json](git-maintenance-backup.json)；refs SHA `4e7f0a3bd6ea5f7e94936eaa5d4f14a9d58cc602e2602d06f4337f3689c83e53`，对象清单SHA `19bbab566261aba178802f6e724774a483efe84b1b46dc37d056e90d9d017ca2`。恢复应先在项目外新目录clone完整bundle、核refs，再按PNG清单复制并验SHA；不要直接覆盖当前作者库。

首次推送前公共9885dfed快照的中间预审为2,250文件／73,556,666字节，最大文件 `docs/art/ASSET_MANIFEST_V6.json` 4,221,144字节（文本JSON）；既有公开 `ferry.png` 2,701,831字节按原hash精确保留。这些**不是首次公共f1d4b377或最终发布HEAD的计量**；最终文档同步后须重新写真实数。

小于1GiB目标尚未完成。普通无过期repack已在隔离副本和作者库完成；作者库维护前后6655对象/refs/fsck核同，节省25,627,219 bytes。该步骤仍不足以达标，未重写历史。**仅若最终需要替换作者库／每日库或重写既有历史，才需另行明确批准该动作。** 这项阻断不撤销已经授权的正常公共main快进发布，也不要求对普通发布重复确认。

## 四、Git／发布

作者基线 `master@7a2c22f74c46d74f07af8bd1a45893ec15daa49b`；当前冻结验收RC为 `d62f99f09f71bf895e63dc93757df45fa033200d`，产品仍为fcef368已构建字节。首次公共提交 `f1d4b377ec317e964c4a4ff79ae74aa826aa9642` 已普通推送成功，但其Verify和Pages均失败；修复后的新RC完整492本地通过，公共重验尚待完成。旧9885dfed隔离冷ci/build/test474、351个dist逐hash一致及隐私0命中只支持当时输入，最终作者HEAD／干净状态及新公共SHA由主代理收尾记录。

公共main基线 `a6e5d5947ce2d06c6c2ab83e1cfd515c95191959`，与作者历史无共同祖先。公开快照在隔离clone上沿真实main作**普通增量／快进推送**；原典全文、私档、候选原图、env/key、巨量历史证据不公开。未改冻结预期哈希，未强推、未新增LICENSE；已授权的普通FF发布可在门禁完成后继续，无需再问一次。

**首次普通push已成功，云端检查失败，未发生本轮部署。** [Verify run39101353779](https://github.com/seiya058904/jianghu/actions/runs/39101353779) 与 [Pages run39101353730](https://github.com/seiya058904/jianghu/actions/runs/39101353730) 均FAILED；Pages单测473/474，原因是历史基线policy测试通道预期，不是产品改动。新RC最终公共SHA、重跑精确run链接／结论、部署artifact与线上逐字节比较、深链／交互／旧SW原地更新／离线复查均待 [RELEASE_VALIDATION.md](RELEASE_VALIDATION.md) 的最终回执。修复本地绿不等于云端通过，push成功不等于已部署。公开快照边界及冷检出见 [PUBLIC_SNAPSHOT_MANIFEST.md](PUBLIC_SNAPSHOT_MANIFEST.md)。

正式URL：[作品库](https://seiya058904.github.io/jianghu/)。待发布后核验深链包括 [龙门](https://seiya058904.github.io/jianghu/longmen.html)、[死人争榜](https://seiya058904.github.io/jianghu/dead-ranking.html)、[山河璧](https://seiya058904.github.io/jianghu/jade.html)、[芦花渡](https://seiya058904.github.io/jianghu/luhua.html)。这些链接此处是发布后核验清单；基线真实浏览器只证当时HTTP200和旧门面，**不代表新产品已在这些线上链接验收通过**。

## 五、最终验收矩阵

单一状态表为 [FINAL_ACCEPTANCE.md](FINAL_ACCEPTANCE.md)。最终分类数以该表实际收敛为准。HalfStep原断言与24项定向、13个cold-cache fixture源审及85项定向、a04单次完整492均有各自通过记录；新d62f单次完整492/492、exit0已关闭本地完整回归待定项；该证据不与a04历史通过拼接。首次公共Verify／Pages失败已记录，新RC本地CI环境单测通过不等于发布项关闭。F24仍BLOCKED，F18仍PARTIAL；不得宣称30/30或FULLY VERIFIED & DEPLOYED。

外部项一律 **EXTERNAL NOT VERIFIED**：真人试读、真人阅读耗时、真人审美／愿意投入时长、Android真机、Safari、Firefox、读屏器。自动化、代理实际看图与真人试玩不是同一证据等级。

## 六、交付文档与证据

- 总结与验收：[本报告](FINAL_DELIVERY.md)、[最终QA](FINAL_QA.md)、[30项矩阵](FINAL_ACCEPTANCE.md)、[问题台账](ISSUE_LEDGER.md)、[发布回执](RELEASE_VALIDATION.md)。
- 编剧与原典：[22组映射](CANON_22_STORIES.md)、[全篇文学终审](STORY_EDITORIAL_REVIEW.md)、[人物弧](CHARACTER_ARCS.md)、[前半原始review](canon-early-review.md)、[后半原始review](canon-late-review.md)、[历史late清单](canon-historical-late-files.csv)。源改动在当前author.mjs入口，未用生成物替代作者源修改；原典全文不随公开交付。
- 工程与素材：[文件审计索引](FILE_AUDIT_INDEX.csv)、[工程安全性能](CODE_SECURITY_PERFORMANCE.md)、[独立反审](engineering-final-counterreview.md)、[迁移反审](editorial-migration-counterreview.md)、[cold-cache夹具反审](fixture-cache-counterreview.md)、[视觉与真实通关](VISUAL_PLAYTHROUGH.md)、[原图独立复核](visual-independent-review.md)、[资源触发台账](ART_USAGE_TRACE.json)。
- 原始检查：新RC证据为同目录 `rc-ci-build.log`、`rc-ci-tests.log`、`rc-ci-editorial.log`、`rc-ci-e2e.log`／`rc-ci-e2e-summary.json` 及相应manifest；历史a04 `rc-acceptance-*`、`rc-release-targeted.log`、`fixture-cache-all-browser.log`、早期失败／中止attempt各自保留，不拼成新RC通过。新RC测试聚合指纹 `4790e10bd9e49525262eb1ba94556f6f371be96d2e85b3366085a698b215d403`，869部署源码指纹 `34a178b90f0abdff609fc4ce6b9eb0f0c2b232a689a5d3ca1219b1b4c32fab49`，918审计路径指纹 `93a1f7e4d4400bb88fca32edd42b23a6a14b7aed8400ac05e8f59d9def1498ca`；产品 `f6c49035c6ea5a20855e49bf76a930feabc30518eabcda760e4a2a4f3c84621d`、dist `15f4a874aa50d0bb3d72cececd2bec2c18e033e3b8f30c207577c93c0705d2c2` 与a04相同。新 `rc-ci-e2e-summary.json` 绑定d62f的492/492、E2E_EXIT0及全部五类运行后指纹不变；历史 `rc-acceptance-e2e-summary.json` 只绑定a04。
- 恢复依据：BEFORE／AFTER逐文件清单、PNG恢复清单与完整bundle验证；全尺寸原图和完整浏览器JSON／截图保存在项目外 `../Jianghu-independent-20261018/`，库内只留≤800px精选WebP与纯文本索引。路径及哈希是恢复凭据，不是删除候选素材或改写历史的授权。

本稿不会以交付文档齐全替代产品验收。新RC本地完整492已通过；重新公共发布／云端检查／部署／线上回执仍待完成。a04历史通过与首次公共失败均保留，体积与设备边界仍未关闭。

私有提案完整性补证：最新已验证候选来源 `be56235d07d776694263bcf613843225bcd8eb15`，候选HEAD `ada1ecf218716c6f96b309506f4cd5091f8aea0f`、TREE `90e70443cc72294ded0ebf900978916d84fb3783`；2,527个追踪路径字节／mode精确一致，918条审读路径核同，478项私有附加文件共56,019,899字节（覆盖原根目录用户资料）。冷ci／build／unit474均exit0、私档缺席warning0；候选测量329,656,131逻辑字节、338,310,184 allocation、.git49,834,415字节。见 [daily-candidate-validation.json](daily-candidate-validation.json)。这些是最终云端回执文档同步前的候选快照，当前作者根**未替换**，提案无remote，公共镜像不含私档；原259MB／458项／917路径等旧提案数字不作为当前计量。新RC和最终文档仍须同步及外置复验，候选低于1GiB不表示作者根F24达标，也不构成切库授权。
