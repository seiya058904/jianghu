# Jianghu / 宋世江湖 · 独立全面审计与交付

**总状态：INCOMPLETE（交付初稿，尚未发布）。**

本稿依据委托 §17 整理。当前冻结验收RC为 `a04d36a665416f45297a5c2a0191863bd0f44316`，仅新增测试侧真实SW写入屏障与13个cold-cache前置修订；产品与dist字节保持fcef368不变。作者单测474/474、编辑80/80子集、player＋新迁移24/24、13个fixture spec定向85/85已有通过证据。a04单次完整492项E2E已492/492通过，0失败／跳过／flaky／重试、exit0、36.5分钟，4 workers、原断言／次数／超时不变，结束后五类文件指纹逐项未变。旧ec53完整491通过／1失败、fcef中止286通过／1失败均保留各自失败记录，不当作当前RC仍失败，也不拼入当前通过数。

主代理收尾时须统一替换本稿的最终作者／公共SHA、完整E2E结果、体积与矩阵统计，并补发布回执。此前检查保留其各自输入证据；本稿的新RC结果来自本次新日志，不从旧RC自动转移。

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

当前RC运行时采样600次／篇，声明结局 **47/47**、已写拍 **6,707/6,707** 可达；观察996个CID，981对后续其余CID完全相同，15对仅能以同一首选策略比较，口径分列。它们证明存在合法路径及已观察后果，**不是所有变量组合穷举，也不是浏览器逐结局真人通关**。首个选择均在8拍内，最长真实无选择段20拍。

独立《死人争榜》《芦花渡》6条完整浏览器路径共1,714拍、1,526次next、182次choice；实际逐拍DOM对oracle、逐次点击，截图中22张页面及庞原画实际目视复核。证据绑定其已记录产品指纹，不冒作后续工程新RC每帧都重看。选择中仍有观看焦点、轻口吻、即时互认等较轻互动；模板人物、部分静态动作、较密旁白及审美分歧均保留具体P2，不用“变量有读取”夸成宏观分支。见 [STORY_EDITORIAL_REVIEW.md](STORY_EDITORIAL_REVIEW.md)、[CHARACTER_ARCS.md](CHARACTER_ARCS.md)、[browser-late-review.md](browser-late-review.md)。

## 二、工程独立审核

[FILE_AUDIT_INDEX.csv](FILE_AUDIT_INDEX.csv) 当前聚合 **715/715手写路径**，203个生成／锁文件另列，共918条审计路径；直接全文、比较审读与精确等价覆盖有独立字段，不能全部说成同一人逐行读过。图索引 stale／metadata_changed 的路径均回源。late历史补读另有97份、8,834行的真实阅读台账；历史作者器未在共享目录执行，旧稿问题不靠改冻结字节掩盖。

已修与复核的工程问题包括禁读／满额存储降级、旧标签页覆盖、备份失败顺序、按篇下载遗漏新shell依赖、SW ready等待范围、公共缺基线的严格白名单、发布快照边界与当前版立绘残留背景。已有专项日志不替代最终完整回归。

同版本编辑订正导致旧Ink存档runtime整串不等的缺陷，使用13份逐字节等于7a Git blob的真实旧JSON限定迁移；旧runtime＋presentation整体验真，新旧逐拍除正文外结构与变量相等，返回新重放会话，失败先保留原raw。独立94命令龙门探针成功，7类伪造拒绝；工程22项、原画面迁移26项、浏览器7项通过。旧ec53完整suite另发现HalfStep首次写回契约退化；fcef368已仅将首次render写回限定于previousContent或editorialContent，HalfStep延迟至原推进／保存链写回。fcef产品的player原契约与7迁移专项合计24/24通过；独立源审确认三个分支均保留。其后North删缓存前置出现后台put回填竞态：helper只等待真实fetch waitUntil原promise，不替换缓存／Response、不改产品。全部13个同型spec源审确认原断言／超时／次数不变，定向85/85；当前a04完整492已单run全部通过。

|已记录输入／检查|真实结果|当前能支持的结论|
|---|---|---|
|a04 `npm run build`，rc-acceptance-build.log|BUILD_EXIT=0|本次重建通过，产品与351个dist文件保持已冻结字节。|
|当前作者单测 `npm test`，rc-acceptance-tests.log|474 passed，0失败／跳过，UNIT_EXIT=0|含80个编辑草稿契约，不能加成554个独特测试。|
|当前作者编辑子集 `npm run test:editorial`，rc-acceptance-editorial.log|80/80，EDITORIAL_EXIT=0|上述子集独立再执行。|
|原典专项／真实旧档迁移／既有迁移|66/66、22/22、26/26|各自有限反例通过，见原日志。|
|迁移浏览器／shell更新／演员可见|7/7、2/2、2/2，均exit0|备份故障、真实下载字节、root与子路径冷离线等指定场景有证据。|
|fcef368 player整spec＋新迁移，rc-release-targeted.log|24/24，BROWSER_EXIT=0|原player:153断言未改通过，7新迁移与备份故障保护均通过。|
|旧ec53完整E2E|491通过／1失败，完整结束并保留|首次写回契约回归的真实失败历史；已修，不列作当前RC失败。|
|旧fcef完整E2E尝试，rc-release-e2e.log|286通过／1失败后中止|North cold-cache删除前后台put竞态已保留；不是完整492通过。|
|13个fixture spec，fixture-cache-all-browser.log|85/85，BROWSER_EXIT=0|真实原promise屏障；原cold delete/false/UI下载/true/离线断言不变，不与首批58项相加。|
|a04完整E2E，rc-acceptance-e2e.log|492/492，0失败/跳过/flaky/重试，exit0|单run36.5分钟；原断言／次数／超时不变，五类指纹运行后逐项一致。|
|新隔离公共本地9885dfed冷检出|npm ci/build/test均exit0，474/474|351个dist文件逐hash与作者相同，隐私扫描0命中；公共缺私档warning与作者完整字节验证分开。尚未push。|

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

当前本地公共9885dfed快照中间预审为2,250文件／73,556,666字节，最大文件 `docs/art/ASSET_MANIFEST_V6.json` 4,221,144字节（文本JSON）；既有公开 `ferry.png` 2,701,831字节按原hash精确保留。它们**不是最终发布HEAD的计量**；最终文档同步后须重新写真实数。

小于1GiB目标尚未完成。普通无过期repack已在隔离副本和作者库完成；作者库维护前后6655对象/refs/fsck核同，节省25,627,219 bytes。该步骤仍不足以达标，未重写历史。**仅若最终需要替换作者库／每日库或重写既有历史，才需另行明确批准该动作。** 这项阻断不撤销已经授权的正常公共main快进发布，也不要求对普通发布重复确认。

## 四、Git／发布

作者基线 `master@7a2c22f74c46d74f07af8bd1a45893ec15daa49b`；当前冻结验收RC为 `a04d36a665416f45297a5c2a0191863bd0f44316`，产品仍为fcef368已构建字节。最终作者HEAD及工作区干净状态待主代理收尾记录。公共隔离检出的当前本地提交为 `9885dfed`，已冷ci/build/test474通过，351个dist文件与作者逐hash一致、隐私扫描0命中；它还不是已推送公共main。

公共main基线 `a6e5d5947ce2d06c6c2ab83e1cfd515c95191959`，与作者历史无共同祖先。公开快照在隔离clone上沿真实main作**普通增量／快进推送**；原典全文、私档、候选原图、env/key、巨量历史证据不公开。未改冻结预期哈希，未强推、未新增LICENSE；已授权的普通FF发布可在门禁完成后继续，无需再问一次。

**本稿时点尚未push，未宣称上线。** 公共前后最终SHA、Verify与Pages精确run链接／结论、部署artifact与线上逐字节比较、深链／交互／旧SW原地更新／离线复查均待 [RELEASE_VALIDATION.md](RELEASE_VALIDATION.md) 的最终回执。Actions started不等于成功，本地commit不等于推送。公开快照边界及冷检出见 [PUBLIC_SNAPSHOT_MANIFEST.md](PUBLIC_SNAPSHOT_MANIFEST.md)。

正式URL：[作品库](https://seiya058904.github.io/jianghu/)。待发布后核验深链包括 [龙门](https://seiya058904.github.io/jianghu/longmen.html)、[死人争榜](https://seiya058904.github.io/jianghu/dead-ranking.html)、[山河璧](https://seiya058904.github.io/jianghu/jade.html)、[芦花渡](https://seiya058904.github.io/jianghu/luhua.html)。这些链接此处是发布后核验清单；基线真实浏览器只证当时HTTP200和旧门面，**不代表新产品已在这些线上链接验收通过**。

## 五、最终验收矩阵

单一状态表为 [FINAL_ACCEPTANCE.md](FINAL_ACCEPTANCE.md)。最终 **PASS n / PARTIAL n / FAIL n / BLOCKED n 待主代理同步**。旧表快照的统计不作为最终结论复制。当前HalfStep契约修复已由原断言与24项定向重验通过，13个cold-cache fixture源审及85项定向通过；F20／F21已由a04完整492通过关闭，不能把旧ec53或fcef失败继续记作当前失败。F24仍BLOCKED，F18仍PARTIAL；发布相关项未完成，不得宣称30/30或FULLY VERIFIED & DEPLOYED。

外部项一律 **EXTERNAL NOT VERIFIED**：真人试读、真人阅读耗时、真人审美／愿意投入时长、Android真机、Safari、Firefox、读屏器。自动化、代理实际看图与真人试玩不是同一证据等级。

## 六、交付文档与证据

- 总结与验收：[本报告](FINAL_DELIVERY.md)、[最终QA](FINAL_QA.md)、[30项矩阵](FINAL_ACCEPTANCE.md)、[问题台账](ISSUE_LEDGER.md)、[发布回执](RELEASE_VALIDATION.md)。
- 编剧与原典：[22组映射](CANON_22_STORIES.md)、[全篇文学终审](STORY_EDITORIAL_REVIEW.md)、[人物弧](CHARACTER_ARCS.md)、[前半原始review](canon-early-review.md)、[后半原始review](canon-late-review.md)、[历史late清单](canon-historical-late-files.csv)。源改动在当前author.mjs入口，未用生成物替代作者源修改；原典全文不随公开交付。
- 工程与素材：[文件审计索引](FILE_AUDIT_INDEX.csv)、[工程安全性能](CODE_SECURITY_PERFORMANCE.md)、[独立反审](engineering-final-counterreview.md)、[迁移反审](editorial-migration-counterreview.md)、[cold-cache夹具反审](fixture-cache-counterreview.md)、[视觉与真实通关](VISUAL_PLAYTHROUGH.md)、[原图独立复核](visual-independent-review.md)、[资源触发台账](ART_USAGE_TRACE.json)。
- 原始检查：当前证据为同目录 `rc-acceptance-build.log`、`rc-acceptance-tests.log`、`rc-acceptance-editorial.log`、`rc-release-targeted.log`、`fixture-cache-all-browser.log`、`rc-acceptance-e2e.log` 及相应逐文件manifest；早期 `rc-final-*`、中止批次与失败attempt保留，不拼成最终通过。当前a04测试聚合指纹 `ffb43acf8fa0fd7bc19cc7e2c787dd473c38c1b882f87cda6ee772ae758c285c`，产品聚合指纹 `f6c49035c6ea5a20855e49bf76a930feabc30518eabcda760e4a2a4f3c84621d`、dist指纹 `15f4a874aa50d0bb3d72cececd2bec2c18e033e3b8f30c207577c93c0705d2c2`；最终完整结果492/492、E2E_EXIT0与五类指纹见rc-acceptance-e2e-summary.json。
- 恢复依据：BEFORE／AFTER逐文件清单、PNG恢复清单与完整bundle验证；全尺寸原图和完整浏览器JSON／截图保存在项目外 `../Jianghu-independent-20261018/`，库内只留≤800px精选WebP与纯文本索引。路径及哈希是恢复凭据，不是删除候选素材或改写历史的授权。

本稿不会以交付文档齐全替代产品验收。新RC完整492复验已通过；最后需要关闭的是正常公开发布和线上回执，并对仍未达的体积／设备边界如实说明。

私有提案完整性补证：除原Git追踪TREE外，另复制458项原ignored文件，共55787329bytes（109历史源码、118其它私档、原始交付ZIP、本机元数据与历史证据）。源/副本逐项SHA一致、原文件未改、Git tracking/ignored状态不变；当时917条审读路径已在提案逐hash一致；新helper加入后的918条及提案最终同步数量由主代理复核。见daily-ignored-preservation.json。259MB旧测量早于此补全，不能当最终候选体积；最终文档同步与重测后再收敛。当前作者根未替换，公开镜像未包含这些私档。
