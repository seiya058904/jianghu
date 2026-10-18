# 工程、安全与性能复核

本报告聚合实际源码审阅与已存在的运行证据。源文件索引见 `FILE_AUDIT_INDEX.csv`；它逐文件记录当前SHA256、实际审阅者、行范围、证据及精确副本关系。生成Ink/JSON和依赖锁单列，不计为手写源码审阅。审阅覆盖不等于每个历史程序仍可发布，也不等于所有路径和设备均被执行。

当前验收RC：`113872382f2697f94bbf8f5dc3c62692641cf731`。三点SW修复已冻结；build退出0、CI模式unit474/474退出0、编辑专项80/80退出0。当前完整492/492、8 workers、19.2分钟、E2E_EXIT0，0失败/跳过/flaky/重试，独立原始JSON与五类运行后hash已核同；正式67eb→f486严格持久窗口已通过，ENG-06关闭；产品f486精确云端与线上字节已验证，后续文档Q精确复核仍待完成。

当前rc-sw五manifest逐个实际bytes/SHA核同：669产品 `e4bf0b54b8d9035ce9f384d8c221924451dca84769073d8c9eb43c8cbce816c9`；165测试 `bfeaee87e401c565829946dc38d65b33f7412b476679a12e8c212b77ffc3a0d6`；869部署源 `afd05b04a097e6ea9756f58ae8a0dd3c1e58fc9965f5625dc9af9971f0e14594`；918审读源 `68b5ee0c6c69b4f77f40672fbef3cd24c84ab11ae260798672bd8d487e7189b8`；351构建 `797a6a2d1c252c45eadd59585a32cd23a636b129b7445c5cb387efebad538ded`。rc-sw-input-delta.json确认相对d62仅SW和三测试变动，dist仅sw.js变动。918=715手写+203生成，109 ignored私档边界保持。

前一a04与d62分别完整492/492退出0，均保留历史精确输入结果。首次f1d4b377云Verify/Pages失败473/474、未部署；随后67eb云Verify/Pages成功，但旧正式SW更新出现ENG-06（下述）。公开40个缺私档告警仍为归档完整性PARTIAL，云通过不替代私档验证。

## 审阅口径与补漏

索引白名单覆盖当前src TypeScript/CSS、全部story作者MJS及两份手写Ink(main/duel)、scripts、tests、HTML入口、构建/测试/CI配置、SW、三份本轮审计工具，以及docs/archives中同类历史源码/配置。只把确实有全文阅读或完整比较审阅证据的内容记为已审。`FULL_COMPARATIVE_SOURCE_REVIEW` 表示已完整读过基准文件，再逐行对齐并实际读完旧版全部差异；等同的公共行来自已审基准，并非又声称通读了一遍。`BYTE_IDENTICAL_REVIEW_EQUIVALENT` 必须满足审阅记录hash一致，且现存两个文件实际bytes相等；原路径后来被修改的已审内容另标 `REVIEWED_CONTENT_HASH_AT_EARLIER_PATH`，不伪称现存副本关系。

CSV新增五列覆盖全部918路径：`responsibility`（职责）、`callers_or_consumers`（消费者证据）、`key_inputs`、`key_outputs`与`risk_boundary`。职责基于已审源码；模块导出名、字面读写调用附本文件行号，HTML入口与导入方附path:line。`STATIC_IMPORTERS`只是对相对literal import/from/import()/CSS import的源码正则匹配（425个目标文件有命中），不是AST或完整runtime callgraph；`LITERAL_PATH_REFERENCES`也明确不把字符串引用一律当实读。动态模板路径、框架隐式加载、完整外部CLI调用无法由它确认时写UNVERIFIED。测试分别标Node/Playwright runner及真实fixture/断言边界；历史副本明确供恢复和保护、不推定现行执行。生成物也有责任/消费者说明，但仍不计手写审阅。这些新增机械关系字段不增加任何亲读计数。

本轮补读69份当前HTML/CSS/配置/新脚本、两个production-direction模块、三份audit MJS。旧工程31个TS/JS路径去重为26个独特内容：9个直接完整读，17个在已审当前源或已审V4源上做完整比较；5个精确副本继承代表审阅。另补归档HTML/CSS/根配置20个路径。旧版存储缺少异常隔离、旧SW缓存模式和旧测试直接写历史证据等只作为冻结历史边界记录，没有修改旧字节或将其当作现行产品。

最终索引现为918个文件路径：715个手写源/配置、203个生成物/锁文件。历史917/714/203口径是新增共用cache-drain helper之前的范围；此次只增加1个手写测试辅助源，不增加case，不能回改历史计数。手写项603个有当前字节的一手全文/全文加差异审阅，19个完整比较审阅，89个由现存精确字节等价继承，4个由修改前记录的已读内容hash对应历史副本；无待审项。等价路径不另算亲读。两位原典代理的历史补漏CSV均已并入（early：84份实读8602行及14份复制；late：97份实读8834行）。新增迁移实现属于工程作者自查，并另引用canon_late独立反审，不冒称作者对自己的修复具有独立性。此范围不含第三方依赖、dist、图片二进制、普通Markdown参考文献；原典全文审读另由正典报告负责。

Graph coverage对本轮100个补读路径、222个私档源/配置路径及新增6个迁移相关路径和14个cache-drain相关路径分批查询；helper+13spec批次generation=2026-10-18T04:53:34Z，全部metadata_changed且coverage=[]；仍为metadata_changed/空coverage，因此所有结论以直接源码与实际bytes比较回退。机械枚举/hash只用于界定范围和对应已审内容，不单独记为阅读。

31份最初未匹配旧Ink的生成来源分别为：22份campaign章节由归档 `story/campaign/author.mjs` 的章节写循环生成；7份sea/sea-tide round是各自作者入口writeFileSync所产Ink的历史编辑快照；2份north/twelfth独立保护Ink由对应作者生成，再从基线Git对象二进制导出，证据为preservation-map。没有重新执行历史生成器，也不声称现存最终作者能逐字重生每一轮中间产物。另4份归档main/duel是手写原源的精确副本，明确不标为生成物。

## 已修复的实际工程缺陷

| 项 | 实际根因与修法 | 证据 |
|---|---|---|
| ENG-01 存储不可用/满额 | getItem/枚举异常以及新游戏在取得内存会话前写auto，导致库页/开局/导出不可用。安全读、渲染内存会话后尝试保存；已有auto的重开仍须先成功备份，失败不替换。 | engineering-review.md；storage-failure.spec；storage-reliability.test；integration-browser.log |
| ENG-02 多标签旧页覆盖 | 旧页推进/pagehide无条件写auto。现隐式保存比较最后观察的原始字节；冲突拒写，保留当前内存导出与已存原字节。显式读档先严格验证，再备份实际当前auto，备份失败不替换。 | engineering-review.md；storage-failure.spec；integration-browser.log |
| ENG-03 shell更新不完整 | 按篇下载更新HTML但未补新指纹JS/CSS，旧SW可留下离线空库。现下载并验证新shell manifest，连同根/index与作品资源加入缓存，保留其他作品；HTTP/清单/缓存失败不报成功。 | service-worker-update.test；offline-work-gate.test；shell-update.spec；shell-update-browser.log |
| 离线ready无限等待 | 原30秒只覆盖消息，ready不settle会一直禁用按钮。现单一30秒覆盖ready+message，超时复原重试；晚ready不再发下载消息，端口关闭。 | offline-reliability.spec；integration-browser.log |
| 缺失基线豁免过宽 | 原helper会忽略任意丢失路径。现只允许规范化后的原典全文和docs/archives私档缺席；当前src/story/public或越界路径缺失须失败。8份draft共10处读取也统一使用严格helper，原expected hash不动。 | frozen-baselines-policy.test；engineering-tests-review.md |
| 当前修订与历史身份混淆 | 授权修改现行文本后，旧审计把现行同伴全文也当冻结对象。7份真实旧字节从7a2c22f二进制导出，严格路径/commit/hash/长度映射；要求当前路径存在，缺私档明确PARTIAL，绝不用当前活文件冒旧。17份原preservation/first-pass JSON完整未变，原hash/数量/旧restore断言保留。 | historical-baselines-policy.test；engineering-preservation-proof.json；engineering-historical-tests-fixed.log |
| ENG-04 同版本正文订正拒读真旧档 | 真旧7a存档的Ink outputStream/控制位置与新compiled不同，runtime整串不等；不能只用CID/VAR不变宣称兼容。13个明确现行version按篇加载真旧compiled，当前strict失败后，对旧runtime+presentation完整验真，再逐步比较新旧除正文text外全部Beat结构及每步变量，输出新重放save。自动/手动/导入的原raw先备份，失败不得覆盖；保留既有画面迁移。 | editorial-baselines.ts；editorial-save-migration.test；editorial-migration-counterreview.md；外部editorial-save-migration.log22/22；editorial-migration-browser.log7/7 |

未发现需新增修复的P0。ENG-01/02/03曾确认P1，已修复并有父真实浏览器证据；ENG-04是在最终兼容反证新发现的P1，源码、22项真旧档专项、最终构建、7项真实浏览器恢复/备份/冷离线回归均已证；a04历史全量E2E由主代理单run492/492退出0完成；前一d62测试RC完整重验492/492、E2E_EXIT0已通过；当前113完整492/492、E2E_EXIT0已通过；不能由此把精确同时写入的localStorage竞态说成事务安全。旧独立子报告中的PENDING状态是历史阶段，须结合此报告与最终RC证据理解。

## ENG-06：正式旧SW更新后的旧HTTP首页（本地完整与正式持续窗口均通过，已关闭）

公开67eb150348013c06bdf328a95589395b3c987aa0的Verify run39103362100与Pages run39103362099均SUCCESS；351线上artifact逐字节核同，26个鲜Chrome入口PASS。这些结果没有覆盖旧正式SW原地更新。真实旧V6窗口04:48UTC准备，在新Pages后更新SW、刷新到新player并成功下载龙门，断网index.html仍执行旧首页，导入campaign-v6-Ct-yMjRt.js失败。原窗口已在finally关闭，未dump缓存，不能唯一追认当时是HTTP缓存或后台回填；原失败result/process/script完整保留在外置live-update-longwait目录。

独立真实Chrome受控8阶段探针（根与/Jianghu，各4策略，exit0）分开证明两层：原SW的addAll复用新鲜旧HTML，更新后入口HTTP请求0且CacheStorage仍旧；仅addAll no-store虽已缓存新HTML，离线导航的network-first fetch仍可从HTTP缓存返回旧HTML；加导航专用no-store后两路径均16卡/0错误，效果与所有fetch no-store相同。证据为外置workspace/stale-http-navigation-probe.{mjs,json,log}，JSON SHA=cd76592338c7d879775d8682e6d6219ebde7adc4b20f4801312cdab4f37371c7。它是机制反例，不是已关闭旧正式窗口的复跑。另一个旧worker延迟响应探索未形成可归因的release后新→旧转换，不据此另报已证根因。

最小产品修复仅两处addAll传真实Request(cache:no-store)，以及同源scope内导航fetch使用cache:no-store；非导航fetch原策略保留。当前public/sw.js、两VM测试与shell-update.spec已完整直接回读。VM保留目标URL/顺序/未知作品忽略/HTTP、unsafe、quota拒绝全部原断言，增cache模式断言；两真实浏览器case只把HTML响应改max-age3600，marker2、16卡、0错误原断言均保留。旧dist增强case先2/2失败，新修复后2/2通过，VM6/6、当前CI模式474/474、编辑80/80通过。Graph工具Transport closed，四文件以完整源码回退，不宣称图覆盖。

状态为CLOSED_PRODUCT_VERIFIED_F486：当前113完整492/492、8 workers、19.2分钟、exit0；对应f486正式云门禁、351线上字节、鲜窗口26入口及严格67eb→f486持续窗口均已通过，最后文档Q精确复核另待完成。旧d62的492/492属于前一RC，不能覆盖本次P1；本轮未改依赖、配置、存档、剧情或期望哈希。

## 真旧存档兼容的新增反证

用subprocess二进制git show取得7a2c22f真实longmen/dead-ranking compiled，以VNRuntime走明确CID后save，原始raw写外部workspace；未运行author、没有用当前save冒旧。原实现在longmen `lm_sore_14`（94 commands）、dead-ranking `dr_shen_three_8/9`与`dr_later_teacher_6`均拒读，而此前/部分后续未变状态能strict恢复。它拒绝加载、保留原数据，不等于物理删除；对玩家是同版本旧进度不可继续的P1。证据为外部 `real-preaudit-save-compat-results.json` 与逐档raw/SHA。

现迁移旧源13份共1,236,960字节，内置manifest记录原commit、path、length、SHA，单测核hash，canon_late又与真实git blob逐字节独立验证13/13。22项专项以13篇全路线逐拍真旧save，以及dead-ranking混合手/眼/脚和后职、white-stone双条件路线验证改字前/改字拍/锚后/选择/结局的恢复；每个迁移输出再strict恢复。runtime变量、舞台、commands、跨版、错作品、speaker、choice文案及变量变化均有实质拒绝反例。它证明已走的具体路线，并未穷尽全部条件组合。

旧自动档启动时pending raw先keepDraft，写失败保留pending与auto；手动槽及导入先备份上传真raw再备份当前auto再替换，会话在写成功后才换。手动覆盖仅当既有槽能验真且实际需要迁移时先备份其原raw；当前strict槽沿用玩家显式覆盖语义，不不断新增draft。备份行可导出原始字节，提示明确正文订正。当前仍保持strict优先，不能因为需要兼容就忽略用户runtime或把旧LoadJson喂给新compiled。按篇动态baseline不会要求作品库预装全部旧故事；父最终构建已通过；7项真实浏览器含根/子路径冷离线恢复，验证选篇旧chunk能够归包取回。

## ec53全量发现的旧样章写回时机回归（a04全量已证，d62完整复验通过）

`rc-final-e2e.log` 第260例 `tests/player.spec.ts:153` 失败。该既有契约要求：真旧half-step-1.0.0存档恢复到 `bold_react` 后，自动档仍逐字节等于原raw；首次advance到 `xie_enter` 才写half-step-1.0.1，同时保留手动槽与可导出的旧raw。新增render条件把原先受previousContent约束的立即persist扩大到全部pending迁移，提前重写自动档。原raw已备份不等于保存时机契约满足，7项正文迁移专项不能覆盖这个旧样章回归。

父确认完整run结束后授权应用，render现已收窄为 `pendingDraftBackup && (campaignEdition.previousContent || campaignEdition.editorialContent) && !persist()`。half-step两字段均无值，首次render不写；原advance/pagehide/明确保存链仍由persist先keepDraft成功后再写。已有ending/illustration迁移的previousContent和本轮正文editorialContent仍立即安全备份。不要改strict restore、pending失败保留、keepDraft去重/碰撞、备份先于auto、现有旧档断言。本工程仅应用该一行guard，保留HEAD行尾和全部旧断言，没有自行构建或跑浏览器。父随后以fcef368冻结重建，完整player+7迁移24/24、BROWSER_EXIT=0，既有旧样章断言通过；当前为FIXED_AND_FULL_SUITE_VERIFIED；fcef全量因独立的cold夹具竞态在286/1 partial处停止，a04新测试RC完整492已全部通过。

## 攻击与异常链

导入存档先限制文件/原始文本大小（1MB）与命令结构、合法字符和数量（普通旧篇400、作品3000），再从合法选项重放，比较完整runtime/presentation，并练习Ink原生LoadJson。旧画面迁移还必须与冻结previousContent核对旧快照、全部叙事帧与变量，不能只把版本号改成当前来放行。失败保持旧auto、手动槽与原始导出。JSON没有成为可执行模板；对白、选项、历史、描述及错误经textContent或escape，catalog markup来自一手登记数据。源码与现有反例未发现存档XSS；不把它称为完整浏览器渗透测试。

键盘repeat、双击detail、180ms冷却、模态面板和awaitingChoice状态共同约束推进；自动/快进遇回复停止、隐藏页停计时。资源错误保留可读文字与推进；CG背景有场景fallback。存储拒读时程序无法导出浏览器禁止读取的旧字节，但不会主动清除它们，当前内存进度仍可导出。

静态服务器解码并resolve路径后校验dist边界；SW仅接同源、scope内GET。离线资源条目必须是合法 ./ 相对路径且解析后仍在scope中；下载失败不发ok。按篇cache不会清其他作品，但Cache API与浏览器配额/网站数据清理始终是环境边界。

公开快照从指定commit的git archive取追踪内容，使用scope/扩展名allowlist并排除原典、私档、候选图、env/key等，拒绝链接/特殊对象。destination须为独立干净Git顶层，plan在两个检出之外；写/删目标逐个resolve校验边界。最新大图例外仅 `public/art/ferry.png`，必须同时匹配固定原hash、旧public文件存在且逐字节相同；其他新/换大图仍阻断。它是保留既有公开原图，不是通用大文件豁免。机器路径提取regex已去固定用户名，只用于旧美术记录解析；源码diff已读，未改原资产或期望hash。文件类型allowlist仍不等于内容秘密识别器，具体发布plan/内容扫描属于父发布证据。

## North cold前置缓存竞态（85定向及a04全量通过，d62完整复验通过）

当前fcef368全量第172项 `tests/north-editorial-cold-offline.spec.ts:8` 失败：删除目标north-v1 chunk后立即cache.match仍true。error-context显示north-v1封面、尚未点击按篇下载；subpath随后通过。源码中SW fetch返回网络Response前，仅用event.waitUntil异步安排caches.open/cache.put，页面reload的load不等待这个写入。context间CacheStorage隔离，不能把它解释为其它全量worker替这页写cache；本context自身两个导航请求的后台写可晚于evict。具体失败瞬间未安装探针，不冒称捕获了那一刻的pending promise。

外部独立Chrome探针 `workspace/north-sw-put-race.{mjs,json,log}`：6轮load×3版本与6轮networkidle×3版本，共36次自然对照均未自发复现；不能写成自然重复必现。可控仅延迟该独立context中的真实Cache.put时，load返回仍1个pending，networkidle返回仍2个pending；原样evict后false，放行原put后true，精确重现失败机制。因此networkidle只是网络静止，不是缓存写完成承诺，不能把单换waitUntil当保证。

外部 `workspace/north-sw-fetch-drain.{mjs,json,log}`（exit0）在根与/Jianghu各验证：测试侧包装原ExtendableEvent.prototype.waitUntil，仅收集fetch的原promise并立即原样调用native；networkidle返回时两个fetch任务仍挂起，等待jobs的屏障未提前完成；放行探针的原put后pending=0，删除后的false、真实UI下载后的true均成立，之后冷离线重载north-v1封面成功。延迟Cache.put只属于反证探针，不进入建议helper；最终helper不修改Response/缓存算法/UI，也不重试或放宽false断言。

`North`、`QianKun` 两份editorial-cold spec与offline-work-pack共享删除时序；后者只先poll存在，仍不能排除第二个在途put。父停止主批次后授权根因扩展，已把同一屏障接入全部13个具有真实evict的spec：North/QianKun/offline-work-pack、child-reuse/default-entry/sea-editorial/sea-tide-editorial，以及jade/jade-thieves/longmen/qingshi/taihua/twelfth-life-editorial-cold-offline。

新增 `tests/service-worker-cache-drain.ts` 共39行：在独立active SW realm包装原ExtendableEvent.waitUntil，先同一原promise立即调用native一次，仅观察fetch Promise Set，settle移除；drain等待真实pending全完。安装在既有controlled cover reload之前，目标页设置按钮可见后/真正evict之前drain。10个扩展项均已有cover reload，不新增导航、不提前执行旧raw迁移；二次旧版goto后的evict也在drain之后。没有把探针的Cache.put延迟带入，也未改fetch/Response/SW产品逻辑。

canon_late独立逐项归一化验证13/13原spec：去新增import、将observer安装还原为旧ready、去新增设置可见/drain后，与HEAD旧全文相同（只规范行尾）。原delete、false、UI下载、true、清HTTP缓存、新页冷离线、次数和超时全部保留。其独立反审在fixture-cache-counterreview.md。源码/脚本/生成物/dist未变；工程逐hash复核rc-release-product-manifest的669项与dist-manifest的351项均全等。只有测试夹具新增源文件，case总数仍492。

实际执行 `npx tsc --noEmit` 退出0（tsconfig原范围src，未冒称这一步检查了tests的类型）；首3文件4workers真实浏览器58/58、31.5秒、BROWSER_EXIT=0，保留workspace/cache-drain-browser.log；扩展13文件4workers完整85/85、44.4秒、BROWSER_EXIT=0，日志workspace/cache-drain-all-browser.log，输出cache-drain-all-results/evidence，未覆盖首批。命令为 `npx playwright test` 显式列出上述13spec、`--workers=4`和外部`--output`，没有build或storycompile。新helper本身不新增case；父已以a04新测试RC完成完整492/492退出0。当前证据确认夹具竞态修法及定向通过；原失败现场未观测到pending，独立可控反证证明机制，不能伪称自然36次中也复现，更未出现下载已报ok却缺目标chunk的产品反例。

## 首次公开CI失败及本次测试修复

公开f1d4b377普通push后，Pages run39101353730及Verify run39101353779均失败，Pages门禁473/474；部署未发生。cloud-first-pages-failed.log与cloud-first-failure.json保存完整原始云端失败，不能写成成功发布。根因是historical-baselines-policy.test.ts无条件检查child stderr；生产report在GITHUB_ACTIONS为真时刻意将::warning注解写stdout，本地才写stderr，child本身仍退出0且null断言已通过。

新d62只改该policy测试：两种明确child环境（GITHUB_ACTIONS缺席/true）各执行原六tamper/missing模式，原status0/null/throws不变，精确核各自stdout/stderr完整消息和缺席report的唯一原路径；单test仍1项，完整unit总数474不变。47行LF、SHA8284c7e736ee539a374526be53a9d066157970193f185c3ebd09e25f4a90d3df。没有改生产helper、CI流程、SW或依赖来绕过失败，也未把两流拼接为宽松匹配。

修前本地GITHUB_ACTIONS=true原测试退出1，ci-warning-original-actions.log保留；修后父环境缺席/true各定向1/1退出0，每次都实际执行12个child场景，ci-warning-fixed-local.log及ci-warning-fixed-actions.log保留。当前root CI=true完整474及80专项已通过，新公开冷检出已PASS；d62的492已完整通过，67eb云发布成功但旧SW窗口失败；当前113的492已PASS，对应f486正式严格持续窗口已PASS，最后文档Q另待父复核，不复用a04输入指纹冒作d62全通过。详细源审见ci-warning-channel-review.md。

## 性能与测量边界

作品入口与独立namespace、按篇资源下载使库页不必预装每篇内容。CSS对长对白/选项设独立滚动区，短横屏保留按钮；多数过渡使用opacity/transform，并遵循系统/设置减弱动态。舞台CG会隐藏actor，故立绘测试必须选择无CG真实演员可见的beat；portrait-fallback.spec已这样做。

设备性能项F18仍只能记PARTIAL：本地功能与结构证据存在，真实设备性能基准未完成，不能声称设备达标。性能仍有P2边界：restore要重放整个命令列表；历史查重、帧克隆和多槽描述可能随长档累积CPU/内存工作。1MB/3000命令上限约束输入，不证明慢设备上无长任务。正文迁移额外双重重放并在每步序列化变量用于拒绝分支漂移，属于换取验真的CPU成本；同步localStorage与序列化也会占用主线程；本轮没有新增CPU长任务、峰值内存、输入延迟或低端Android基准，不从功能绿推导性能达标。backdrop-filter、全屏大图和多演员可能带来GPU/合成成本，需真实设备验证。

600次/篇的独立运行时采样与观察到的CID成对重放可证明具体后续文本/状态差异，不能证明所有状态组合。`runtime-coverage.json`与`CHOICE_CAUSAL_AUDIT.json`明确标记非浏览器/非真人/非穷尽；同后缀取各自首选仍可能产生新的分歧，不能仅凭分歧数判断文学意义。源码线性被动段只能定位上界，不能把互斥分支串接成玩家真实等待；narration脚本的no-NPC统计也不等于纯旁白比例。

## 真正完成的检查与仍在运行的门禁

| 实际证据 | 已读到的结果 | 归属/范围 |
|---|---|---|
| engineering-targeted-tests.log | 13/13，exit0 | 工程代理定向unit/VM |
| engineering-historical-tests-fixed.log | 64/64，exit0；原63/64失败日志保留 | 工程代理历史映射/受影响契约 |
| engineering-historical-typecheck.log | exit0 | 工程代理tsc |
| integration-browser.log | 12 passed，BROWSER_EXIT=0 | 父真实storage/超时浏览器回归 |
| shell-update-browser.log | 根与小写jianghu共2 passed，BROWSER_EXIT=0 | 父真实HTTP/SW、新JS执行与离线16卡库 |
| portrait-visible-browser.log | current/frozen-v2共2 passed，BROWSER_EXIT=0 | 父真实演员可见立绘回归 |
| rc3-tests.log | 451 passed/0 failed，UNIT_EXIT=0 | 父前一RC的unit/叙事契约，不含最后龙门新增断言及ENG-04 |
| rc3-editorial.log | 80 passed/0 failed，EDITORIAL_EXIT=0 | 父专项draft门禁；与npm通配包含项不可相加成独特测试数 |
| rc2-build.log | BUILD_EXIT=0 | 父前期构建，不能证明最终ENG-04版本 |
| 外部workspace/editorial-save-migration.log | 22/22，exit0；第一次18/19失败日志保留 | 工程真旧档/迁移/伪造专项；首轮失败为测试mutation未命中，已修成真实变更后拒绝 |
| 外部workspace/editorial-existing-migrations.log | 26/26，exit0 | 工程6文件既有ending/illustration回归 |
| 外部workspace/editorial-save-migration-typecheck.log | exit0 | 工程最后源码tsc --noEmit |
| rc-final-build.log | BUILD_EXIT=0 | 父ec53冻结构建；最终产品/测试SHA绑定见父RC manifest |
| rc-final-tests.log | 474 passed/0 failed，UNIT_EXIT=0 | 父ec53前一RC unit；不是当前RC绑定 |
| rc-final-editorial.log | 80 passed/0 failed，EDITORIAL_EXIT=0 | 父ec53前一RC编辑专项，与主unit重叠，不相加 |
| editorial-migration-browser.log | 7 passed，BROWSER_EXIT=0 | 父真实旧raw自动/手动/导入、原始下载、draft/auto quota、current槽正常覆盖、根/子路径冷离线 |
| rc-release-build.log | BUILD_EXIT=0 | 父fcef368产品构建，与a04产品bytes相同 |
| rc-release-tests.log | 474 passed/0 failed，UNIT_EXIT=0 | 父fcef旧测试RC unit/契约 |
| rc-release-editorial.log | 80 passed/0 failed，EDITORIAL_EXIT=0 | 父fcef旧测试RC编辑专项，与474不可相加 |
| rc-release-targeted.log | 24 passed，BROWSER_EXIT=0 | 父完整player+7迁移浏览器；包含未修改的旧half-step保存时机断言 |
| public-release-install.log / public-release-build.log / public-release-tests.log | INSTALL_EXIT=0、BUILD_EXIT=0、474/474 UNIT_EXIT=0 | 父公开冷检出；私档缺失断言仍PARTIAL |
| public-release-reproducibility.json | 351作者/351公开dist，hashDifferences=[] | source=fcef368，publicCommit=b1343c6；尚未push，非线上核验 |
| rc-release-e2e.log / rc-release-aborted.json | ABORTED：286 pass/1 fail partial，exit1 | 父fcef批次已停止；不是492完整结果 |
| 外部workspace/cache-drain-browser.log | 58/58，31.5秒，BROWSER_EXIT=0 | 工程首3cold fixture定向，4workers |
| 外部workspace/cache-drain-all-browser.log | 85/85，44.4秒，BROWSER_EXIT=0 | 工程全部13受影响spec定向，4workers；原case/断言/timeout保持 |
| 外部workspace/cache-drain-typecheck.log | exit0 | 工程最后npx tsc --noEmit，按原src include |
| rc-acceptance-build.log | BUILD_EXIT=0 | 父a04历史验收RC构建 |
| rc-acceptance-tests.log | 474/474，UNIT_EXIT=0 | 父a04 unit/契约 |
| rc-acceptance-editorial.log | 80/80，EDITORIAL_EXIT=0 | 父a04编辑专项，与474重叠不相加 |
| rc-acceptance-audited-source-manifest.json | 918路径SHA与FILE索引逐项相同 | a04审读源fingerprint=19a37b5e9b8d29582e76bf35afe66f8101ef67bed8e318f0ef2d007ed084231c |
| rc-acceptance-e2e.log | 492/492，4 workers，E2E_EXIT0，0失败/跳过/flaky/重试 | 父a04完整单run，五类指纹运行后未变 |
| cloud-first-pages-failed.log / cloud-first-failure.json | 首次公开Verify/Pages失败473/474，未部署 | f1d4b377普通push成功不等于门禁成功 |
| 外部ci-warning-original-actions.log | 原测试GITHUB_ACTIONS=true退出1 | 复现云端stderr为空的测试夹具失败 |
| 外部ci-warning-fixed-local.log / ci-warning-fixed-actions.log | 各1/1退出0；各12child场景 | 新测试精确双环境/双通道，不新增test case |
| rc-ci-build.log / rc-ci-tests.log / rc-ci-editorial.log | BUILD_EXIT0 / 474 UNIT_EXIT0 / 80 EDITORIAL_EXIT0 | d62历史root门禁；80是474子集 |
| rc-ci-input-equivalence.json及五manifest | 669产品/351dist相同；165/869/918新指纹核同 | 仅historical-baselines-policy.test.ts改变 |
| [rc-ci-e2e.log](rc-ci-e2e.log) / [summary](rc-ci-e2e-summary.json) | 492/492，8workers，19.0分钟，E2E_EXIT0；0失败/跳过/flaky/重试 | d62同一完整run；原始JSON逐result及五类运行后指纹独立核同 |
| [public-privacy-ci-code.json](public-privacy-ci-code.json) | 2388文件/85238633bytes，hash/禁路径/模式零命中 | d62→本地67eb1503；不是部署成功证明 |
| [public-ci-cold-validation.json](public-ci-cold-validation.json)及[install](public-ci-install.log)/[build](public-ci-build.log)/[tests](public-ci-tests.log) | CI=true、GITHUB_ACTIONS=true；0/0/0，474/474 | 2388 plan/869源/351dist全同；40私档PARTIAL；67eb后来已部署，旧SW失败另记ENG-06 |

本工程追加实际执行命令为 `node --experimental-strip-types --test tests/editorial-save-migration.test.ts`（退出0，22/22）；`node --experimental-strip-types --test tests/campaign-v6-ending-staging.test.ts tests/child-reuse.test.ts tests/jade-reusable.test.ts tests/royal-letters-cg.test.ts tests/sea-rigging.test.ts tests/swords-art.test.ts`（退出0，26/26）；`npx tsc --noEmit`（最后slot备份收窄后退出0）。定向测试没有执行author。`git diff --check` 对本轮3原模块及两聚合交付的Git可见差异退出0。

原全量485 E2E批次因新发现ENG-04已停止。父已完成新RC构建及迁移专项；ec53冻结后的492 E2E完整结束：491 passed/1 failed，36.6分钟，E2E_EXIT=1，唯一tests/player.spec.ts:153。该RC未通过；旧样章时机guard随后已修，新RC构建和24项定向通过，fcef全492随后在286/1 partial停止，13夹具修复后a04完整492通过，前一d62 CI通道测试修复后的同一492重验也已退出0全部通过。不得复用旧批结果。本工程追加轮只运行上述授权定向unit/typecheck，没有编译或生成故事。外部真人阅读耗时、真人审美、Android硬件、Safari/Firefox、屏幕阅读器均NOT VERIFIED。

最新early/late原典helper已断言每个请求CID实际命中；CL23显式三CID且逐foot/eye/hand正断言（含全first摘要），CL25双true也核约定报告两句，这三处前份报告中的P2已关闭。仍有20个反例和若干分支以禁止旧错句为主，不能单独证明修后每个事件的全部前因。原始失败反例、完整已选序列、修后成对运行时与逐源对照能补充具体证据，但仍不冒充全状态组合穷尽。龙门另新增真实guest/deliver前因正断言：先见与罗天庆打平，再核“只同罗先生打平”的回忆，消除提前自称已败。此前RC因新P1停止，不能把旧门禁当作最后修订验证。

历史工具的P2维护边界保留：snapshot-v4可覆盖固定历史目录，不能对现存私档重跑；canon-late-finalize依赖调用时HEAD，重跑时必须核基线身份；部分历史审计默认含归档或线性计数。全部都是“不得误用旧工具/数字”的限制，不通过修改历史源或预期hash消除。


## 当前锁文件的在线依赖查询

主代理于2026-10-18对a04冻结锁文件执行 `npm audit --json`，退出0，已知advisory total/high/critical均0，完整返回及lock SHA见 `npm-audit-final.json`。没有安装或升级依赖。这个结果仅覆盖查询时registry已知公告，不能证明不存在未公开漏洞，也不改变F18目标设备性能的PARTIAL边界。


## 历史a04完整验收收尾（2026-10-18 13:36 +08）

a04完整单run492/492通过，0失败/跳过/flaky/重试，E2E_EXIT0，36.5分钟。运行后669产品/165测试/869部署源/918审读源/351dist逐SHA全同。此结论只更新本轮终态，不回写独立审阅者在其早先时点的pending记录，详rc-acceptance-e2e-summary.json。F18性能边界仍PARTIAL。后续首次f1d4b377普通push确已发生，但云门禁473/474失败、未部署；之后d62/67eb虽云成功却暴露旧SW离线失败，当前113本地完整已通过，后续发布/线上终态由父收敛。


## 历史d62完整验收终态（2026-10-18 14:13 +08）

d62同一492/8workers完整批次已PASS，19.0分钟，exit0，无失败/跳过/flaky/重试。原始JSON SHA=bfbc0a551775106aa074d49c3609ced5b54ba28f06bd9d6c477e0948c294f8b7；log SHA=2393e85a87fadaa83a62beedcf44fc1955323a9332bb1035695829ee38cc73cc，均与摘要一致。结束后产品669、tests165、部署源869、审读源918、dist351每个实际文件仍匹配当前manifest；不是只检查摘要布尔值。

d62作者本地build/CI=true unit474/编辑80、完整492及公开本地CI冷检出均通过。a04完整通过与首次f1云Verify/Pages失败各保留原时点结果；67eb后续云门禁与线上产物核验成功，但真旧SW更新失败。当前113局部修复与完整492均通过，对应f486正式严格持续窗口已通过；最后文档Q复核仍待完成。F18与外部设备/真人边界不变。

## 当前113运行门禁

`rc-sw-build.log` BUILD_EXIT0；`rc-sw-tests.log` CI模式474/474、UNIT_EXIT0；`rc-sw-editorial.log` 80/80、EDITORIAL_EXIT0（474子集）。增强原shell case旧dist2/2失败、新dist2/2通过，VM6/6。PASS：113同一完整492/492、8 workers、19.2分钟（1149092.732ms），E2E_EXIT=0；0失败/跳过/flaky/重试。`rc-sw-e2e.log`与`rc-sw-e2e-summary.json`绑定113872382f2697f94bbf8f5dc3c62692641cf731。独立逐项读取外置原始JSON：492个test各恰一次passed、retry0，无errors；原始JSON SHA=8aa4c9d4c19fa76773ffb7deffa43441c2744ecef291d1a5e307ef19a2219d8c、log SHA=c344ba4109dbd083a3b48181161483f44c38d36f1301a8b1b65b63bf036e99a1，与摘要核同。14:28:52 +08启动，14:48:30 +08核定；运行后669/165/869/918/351五manifest每个实际bytes/SHA再核全同，未拼批。113对应产品f486已普通FF发布，严格正式67eb→f486持久窗口已通过；后续仅文档提交Q尚待精确复核，不预写Q成功。

生命周期与跨平台复核补充：首次正式V6窗口只证明调用update并刷出新player、收到包ready后离线失败；原async身份guard未可靠确认新SW接管，已关闭无cache dump，不唯一追认层。另有严格Promise(old redundant/active与controller activated)的真实a6 Git冷建四case：原策略根/子路径均复现，113两路径根/index16卡与龙门1→2、page/HTTP0，actual-v6-upgrade-summary/result可核。正式67eb持久profile已用同生命周期屏障完成f486升级：等待8791ms、离线库16卡及龙门1→2、page/HTTP0，原回执另见正式发布节。67eb CI artifact↔正式HTTPS确351/351原字节同；Linux CI↔Windows d62只有347/351原字节同，4个offline清单仅数组顺序不同，排序逐项相同，无增缺或重复，ci-windows-first-artifact-comparison.json。公开本地Windows351同作者Windows是另一独立结论。


## 正式产品发布与ENG-06关闭（f486，最终文档Q另待复核）

公开产品提交`f48614493ec4340355602f77d64b19c02220781e`已由父普通fast-forward从67eb推送，exit0、无force；对应已测产品RC113，后继作者2a2c403801fd6af8fb22529a9e9590883a3fc01d没有新增产品代码变化。精确Verify run39105624826与Pages run39105624823均completed/success，headSha均为f486。产品build0、CI模式474/474、编辑80/80、同一完整492/492（8workers、19.2min、exit0）保留绑定113的原证据。

已独立逐项复核父的外置原回执：[pages-artifact-sw-accepted.json](pages-artifact-sw-accepted.json)全部351entry均HTTP200、onlineSHA与对应CIartifact SHA相同，failures=[]；总37,008,548字节，artifact tar SHA=3b08472977212f10cd412312ddd77e82fab388a1b2cf7cba317f24275dbb3e99。[online-sw-accepted.json](online-sw-accepted.json)实际26入口PASS，ONLINE_EXIT0，console/page/HTTP/requestfailed四数组全空。这里351/351指Linux CIartifact与正式HTTPS逐字节同；Windows与Linux构建历史347/351同、4清单仅数组顺序差异的边界仍保留，不能偷换为跨平台所有原字节相同。

真实正式67eb准备的persistent profile随后升级f486，[formal-sw-update-fixed.json](formal-sw-update-fixed.json)明确old=redundant、active/controller=activated，真实生命周期等待8791ms；缓存根/index均新库HTML，断网库16卡，真实龙门lm_borrow_1→lm_borrow_2，errors/http=[]，status=PASS。它与严格a6旧Git冷建四case分别证明正式67eb→f486和受控真实V6→113，不能说原已关闭V6窗口重新跑过。原正式旧窗口失败、无cache dump以及async身份guard限制全部保留。ENG-06现为CLOSED_PRODUCT_VERIFIED_F486。

原始日志及截图保留项目外`../Jianghu-independent-20261018/`，父已同步上述文本回执入本轮审计目录；[普通push](normal-push-sw-accepted.json)与[精确云端结果](cloud-sw-accepted-success.json)可复核。[本次跨平台比较](artifact-sw-platform-comparison.json)同时确认Windows↔Linux347/351及4个数组仅顺序差异、上一67eb→f486两次Linux产物仅sw.js改变。后续只有公开文档/回执同步，须再核最后文档提交Q的精确云端head与线上字节；Q尚未成功，不由f486产品成功预写Q成功。父以私有receipt记录避免文档自SHA循环。

F18仍PARTIAL：旧同机测量不是当前部署INP/低端设备保证，外部设备与真人边界不变。F24仍BLOCKED，不能以私有提案变小或产品上线代替作者根门槛。新中间候选28a023adb54c433f0e433f1603ed2e256778b3eb对应source2a2c403801fd6af8fb22529a9e9590883a3fc01d/113，冷CI474通过、2594追踪项与478私有附加项已有[中间证据](daily-sw-validation.json)，但最后文档同步后的测量尚未完成；未采用、未切换，不冒作最终私有测量。
