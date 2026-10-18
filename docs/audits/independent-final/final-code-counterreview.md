# 最终代码与发布前反证复核

2026-10-18；只读核验对象：作者HEAD `a04d36a665416f45297a5c2a0191863bd0f44316`、公开本地HEAD `9885dfedb780540ea51b97c1692ccd209be12232`。本次只新增本报告，没有构建、浏览器或全量重跑，没有编辑src/tests/SW/dist、依赖或配置。

**结论：未发现新增产品P0/P1或断言弱化；发布验收仍阻断于a04完整492 E2E终态。** `rc-acceptance-e2e.log` 已确认该SHA/492/4workers且仍在运行，不能以85定向、旧批拼接或474 unit代替。公开本地冷检出可复现，尚不构成push、云CI或线上精确产物验收。

我曾参与存储、SW、旧档迁移及cache-drain helper修复，因此不把对自己函数的再次阅读冒称另一位作者的独立代码审查。本次独立动作是从实际文件重新计算清单、逐项还原原fixture、核对公开树与计划、比对锁文件/配置和告警；helper与13spec另外有canon_late一手独立反审，见 `fixture-cache-counterreview.md`。

## 冻结指纹：全部重算相同

逐清单重新读取每个实际文件，断言bytes/SHA256一致，再按记录顺序将files数组序列化为UTF8 compact JSON重算顶层fingerprint。以下只读Python断言全部退出0，不是复用报告中的PASS文本。

| 清单 | 项数 | 重算fingerprint |
|---|---:|---|
| rc-acceptance-product-manifest.json | 669 | f6c49035c6ea5a20855e49bf76a930feabc30518eabcda760e4a2a4f3c84621d |
| rc-acceptance-tests-manifest.json | 165 | ffb43acf8fa0fd7bc19cc7e2c787dd473c38c1b882f87cda6ee772ae758c285c |
| rc-acceptance-all-source-manifest.json | 869 | a78470807c5cbe25c50f65a6b9cbbf58e65523aaf5977c796cfa0cdad08902f0 |
| rc-acceptance-audited-source-manifest.json | 918 | 19a37b5e9b8d29582e76bf35afe66f8101ef67bed8e318f0ef2d007ed084231c |
| rc-acceptance-dist-manifest.json | 351 | 15f4a874aa50d0bb3d72cececd2bec2c18e033e3b8f30c207577c93c0705d2c2 |

五个清单均绑定a04。与fcef相比只有测试观察/同步输入改变，产品669项和dist351项仍逐字节相同；未因本次fixture修复改变运行时代码、美术或故事。

上述范围不可混加：all-source869还包括公开美术/许可等177个未列入代码阅读索引的对象；audited-source918另含AGENTS、审计工具及历史源码。918中109个被Git忽略的本机docs/archives源码确实存在并有hash，但不是Git树或公开镜像携带证明。清单名称不是“869手写文件全部亲读”的声明。

## 13份fixture及39行helper

重新对13份当前spec执行严格逆变换：仅去新增helper import，将observe安装还原为原ready调用，去新增设置按钮可见/drain；规范CRLF后逐字节比较 `git show fcef368:<spec>`。**13/13正文完全相同**，原delete、缺失false、真实UI下载、恢复true、HTTP缓存清理、新页冷离线、选项/图片、循环次数和timeout均未改。不是只数expect个数。

范围为child-reuse、default-entry、sea-editorial、sea-tide-editorial、offline-work-pack与North/QianKun/Jade/Jade-thieves/Longmen/Qingshi/Taihua/Twelfth-life的editorial-cold-offline spec。所有前置原本就有cover reload，没有新增导航或提前执行旧raw迁移；二次进入旧版后，真正evict之前也会drain。

`tests/service-worker-cache-drain.ts` 实际39行，SHA256 `f450f7d95a48f477d8ad3ca4eae21a5171faefa1d20c602d10b1e2841ef9cac4`。它按本context active scriptURL取独立worker，在受控reload前安装观察：原waitUntil收到同一原promise并立即native.call一次，只把fetch承诺加入Set，settle移除，drain等待pending清空。没有延迟Cache.put、替换fetch/Response、帮产品写缓存、吞掉原断言、添加sleep/timeout/retry。目标页面设置按钮可见后再等待；这不是把networkidle误当写完成。

原故障是删除后仍有本context的网络优先后台put可重填；外置可控反证已证明这个机制，36次自然对照未复发也明确保留。首3定向58/58与全部13定向85/85分别有日志，不能相加为143个独特case；它们也不替代新492。新增helper不是新增test case。

## 918阅读范围与证据诚实性

重新核对FILE_AUDIT_INDEX全部918路径：文件存在、当前hash匹配、五项职责/消费者/输入/输出/风险字段4590格非空；715个手写源/配置均有审阅者与实际范围，没有PENDING_FIRSTHAND项。分类为603一手全文或全文加差异、19完整比较、89现存精确字节等价、4原记录已读hash映射；203生成物/锁文件另列且不计手写亲读。

等价、历史比较和生成物没有冒充逐行又读一遍。STATIC_IMPORTERS明说是literal源码正则线索，非AST/完整runtime callgraph；动态未知标UNVERIFIED。helper+13spec已check_index_coverage（generation2026-10-18T04:53:34Z），全部metadata_changed/coverage空，确实回源；图没有被宣称完整。工程作者自查与late独立反审分别标注。

918是新增1个测试helper后的现行范围；历史917/714+203计数仍是当时范围，不回填成现行。实读覆盖证明“读过这些字节”，不证明所有旧工具可执行、每条状态组合可达或所有设备性能合格。

## 公开排除与冻结字节

已直接检查公开工作区HEAD为9885dfed，追踪工作区干净。外部 `public-plan-acceptance-code.json` 绑定a04，2250项计划与当前公开追踪树集合完全相同，每项bytes/SHA重新核对相同。

公开追踪路径再次检查：无宋世江湖.md、docs/archives、候选图目录、env/key/pem/zip/bundle或历史docs/evidence PNG/JPG。public-snapshot的scope/扩展名allowlist、独立干净Gitroot、plan外置、链接/特殊对象拒绝和resolve边界仍在；大文件例外只允许ferry.png固定原hash且旧公开文件逐字节相同。脚本没有push、改remote或改写历史入口。

内容保密扫描 `public-privacy-acceptance-code.json` 记录2250文件无hash差异/禁路径/模式命中，原典去空白512字符、128步长共1461样本无命中。本次独立重算的是公开路径/计划bytes，没有假称重新人工读完2250文档、OCR图片或穷尽所有编码泄露。

实际公开缺席报告位于外部审计根 `public-missing-baselines-acceptance.json`，公开工作区也有当前冻结告警JSON。本次核40个唯一条目都属于原典或docs/archives且在公开checkout确实缺席。不是40个实际断言失败，也不是全部私档总数。frozenBytes只对这类缺席记录告警/null；当前必需源丢失不因缺席豁免而静默跳过。historicalBytes的7路径严格清单要求当前源存在、固定commit/归档目标/hash，不能用当前活文件冒旧。公开unit474绿因此仍只证明归档完整性PARTIAL；CI summary亦明确skipped/partly verified。

`public-cold-validation-acceptance.json` 对a04→9885dfed记录冷ci/build/unit474退出0、351dist逐hash相同。以上是本地公开快照复现，非线上发布。

## 依赖、许可和配置

对7a2c22f重新比对：package的dependencies/devDependencies/name/version/private/type语义完全相同；package-lock.json、public/INKJS-LICENSE.txt、playwright.config.ts、vite.config.ts、tsconfig.json原始字节未变。没有新增依赖/升级版本、移除Ink许可或放宽浏览器超时配置。

配置真实差异已读：npm test从显式老名单改为所有*.test.ts，增editorial/audit命令；两个workflow新增unit/生成物一致性门禁；.gitignore加test-results-*/；.gitattributes只为审计记录限定空白处理。它们对应本轮获授权的全契约/编辑/CI范围，不是绕门禁。既有Pages权限/触发方式未被本轮放宽。此结论针对已比较的追踪配置，不冒称检查了所有本机未追踪环境或远端设置。

## 剩余门禁

当前唯一已知的代码验收阻断是 **a04完整492 E2E尚未结束**。不得把ec53的491/1或fcef的286/1 partial写成通过，也不得提前发布“全绿”结论。产品/测试/审读源/dist清单已核定，未发现新的具体P0/P1需要修改冻结代码。

父代理需在完整终码、最终文档/公开快照同步和最终发布/线上核验后收敛状态；本报告未代做这些外部动作。性能F18仍PARTIAL，低端设备CPU/内存/输入延迟、真人试读、Android硬件、Safari/Firefox等外部边界仍NOT VERIFIED，不从本地功能绿推导达标。
