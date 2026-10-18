# 体积测量与恢复（最后提交后另作外置收尾实测）

**F24：BLOCKED。** 当前RC113全量验收后、发布前快照为 **1,410,755,160逻辑bytes / 1,419,718,624逐文件allocation bytes**，均超过1GiB。113完整492/492、0失败/跳过/flaky/重试、exit0已结束；量化与交付无关的历史对象仍保留。本报告、RISK CSV及后续提交会改变占用，最终回复使用最后提交/关闭进程后的项目外closing-author-measure原始实测，不能把此快照当最终即时目录。

## 当前AFTER快照与口径

外置原始报告mtime UTC **2026-10-18T06:49:40.889776+00:00**，HEAD113872382f2697f94bbf8f5dc3c62692641cf731。原算法不记录遍历起止，此处只标报告mtime。SIZE_INVENTORY_AFTER.csv/size-after.json复制的是这次外置生成结果；前一a04快照原字节另外保留于项目外measurement-a04-preserved及Git历史，未改BEFORE。measurement-rc113-receipt与size-risk-rc113-refresh记录可复核路径/hash。

|范围|基线逻辑 bytes|RC113快照逻辑 bytes|RC113逐文件 AllocationSize bytes|
|---|---:|---:|---:|
|全目录含.git|3,089,376,468|1,410,755,160|1,419,718,624|
|.git|1,146,900,830|1,127,612,741|1,128,112,192|
|工作树不含.git|1,942,475,638|283,142,419|291,606,432|

基线2026-10-18T02:38:44.300013+00:00、HEAD7a2c22f。初始allocated_bytes逐文件等于Length，未独立获得真实分配，**无效，不作物理收益对比**。当前Windows FILE_STANDARD_INFO.AllocationSize不含目录/MFT元数据，也不表示全卷去重后唯一计费；逻辑字节/逐文件allocation/全卷free-space是三个指标，未测全卷前后空闲，不报真实释放GiB。

本次5094文件，RISK合并7289行，新增305保守分类；前6984行全部原非AFTER证明字段逐值不变，源/归档/hash/恢复证据完整。CSV当前3257800B，比前一版本增162237B，发生在上述测量后，最后外置测量会计入它及其它新增提交。现.git本身已超过1GiB，删工作区可再生物也不能令当前完整作者库达标。

## 已做动作及真实收益

1. 历史PNG按 `historical-png-archive.csv` 外置 **2,121文件 / 1,683,183,225 bytes**，其中2,109项曾追踪、12项未追踪。它们位于项目外 `../Jianghu-independent-20261018/historical-evidence/`，按原相对路径保留，逐项SHA在清单。这里按实际清单计数，不能借用旧文档“1977张”的另一代口径。
2. 外置使作者工作目录变小，**没有删除外置证据，也没有证明所在卷释放同等空间**。Git旧历史中仍有这些PNG；取消现行追踪不会把历史对象字节自动拿走。
3. 普通Git维护：`git -c pack.compression=9 repack --cruft -d -f --window=250 --window-memory=256m --depth=50 --threads=2`，exit0。`.git` 1,148,834,794→1,123,207,575，节省 **25,627,219 bytes（约24.44MiB）**。父代理的 `git-repack-author-result.json` 证实6,655个对象ID/type/size完全相同，`git show-ref --head`一致，HEAD/config/两份reflog原字节一致，fsck0，无过期/历史重写。本稿引用这些已落报告，没有另行重跑维护。
4. 隔离probe曾先完成同类repack，`git-repack-probe-result.json` 记录同对象/refs/fsck。probe不是唯一备份，不可用其repack后的pack文件去核原备份逐文件哈希。

## 保留分类与风险动作

新增 `SIZE_RISK_ACTIONS.csv` 是原BEFORE/AFTER两清单路径并集的逐项补充，原始分类时点共6,911行（后续刷新为6,984行）：4,466前后均在、251后增、2,121有明确外置清单、73仅基线出现。**73项现已逐项核对关闭：54个松散对象转入packed对象库，7个旧pack及附属索引有完整备份，1个multi-pack-index属不同时间点可再生索引，7个旧构建指纹与4个Vite缓存有外置匹配副本。** 每行增加purpose、regenerable、historical_value、risk、action、恢复路径/归档SHA、快照与证据；原库存和预期哈希未改。CSV约3.16MB纯文本，最终快照需计入它，不能引用旧体积掩盖新增报告成本。

- 原典、story/archive、docs/archives、编辑轮次：历史/版权/兼容价值高，冻结保留；不能靠重新编译伪造原字节。
- public正式美术、候选库、art-handoff.zip：原交付不可假设可再生。压缩替换或去重须先完整映射、视觉审阅与授权；本稿不采取动作。
- src/generated及Ink：现行生成物可在匹配作者源/工具链下重建；人工main/duel与冻结版本源/JSON不是通用清理目标。旧存档版本契约优先。
- node_modules、dist与临时test-results：部分可再生，但RC验证期间保留；仅在最终验收后按明确路径决定。重跑不能恢复历史像素或失败现场的完全相同字节。
- 审计文本、失败日志与最终精选截图：保留来源与时间，旧FAIL不能因后来PASS而覆盖。新的大图继续外置。

`../Jianghu-independent-20261018/daily-repo-proposal/` **未采用**，需要用户单独确认。它不是当前作者仓库，也不是把原库<1GiB的已完成修复；不得替换作者.git、改远端、提交历史重写或强推。全量外置目录还包含多个dist/依赖/测试批次、完整Git备份及bundle，本轮未对外置总盘占用重测，不把重复备份当净节省。

## 可操作恢复：先隔离核验，不覆盖现行

所有路径以仓库 `.` 的父目录为基准。以下是恢复说明，**本稿没有执行恢复命令**。

**单张历史PNG**：在 `historical-png-archive.csv` 找到path、bytes、SHA256；从 `../Jianghu-independent-20261018/historical-evidence/<path>` 复制到一个新建隔离恢复目录内同名相对路径；用 `Get-FileHash -Algorithm SHA256 -LiteralPath <copy>` 比清单并核Length。先打开图确认其用途。恢复到作者工作区前单独确认具体目标和是否存在，禁止批量覆盖后来证据。

**完整Git元数据/不可达对象恢复**：使用 `git-complete-before-maintenance.git`（维护前不可变完整副本），不是允许repack的 `git-maintenance-probe.git`。`git-maintenance-backup.json` 记录46文件 /1,148,834,794 bytes、6,655对象及文件SHA；报告中的backup旧字段指probe，新增 `immutableCompleteBackup` 才是完整不可变目标。选择一个不存在的新恢复目录，复制该完整目录为其 `.git`，保持原目录内容不动，再验证：

```powershell
$recovery = '.-recovery-20261018'
$gitBackup = '../Jianghu-independent-20261018\git-complete-before-maintenance.git'
if (Test-Path -LiteralPath $recovery) { throw '恢复目录已存在，请另取全新目录' }
New-Item -ItemType Directory -Path $recovery | Out-Null
Copy-Item -LiteralPath $gitBackup -Destination (Join-Path $recovery '.git') -Recurse
git -C $recovery rev-parse HEAD
git -C $recovery show-ref --head
git -C $recovery fsck --full
```

结果必须与备份时HEAD ec53、refs清单及objects清单相符；维护前备份不承诺包含备份之后新增提交或未追踪工作文件。若确需还原该HEAD的追踪工作树，再在这个**全新空隔离目录**执行 `git -C $recovery restore --source=HEAD --worktree -- .`。不要在当前作者库执行这一全树恢复。

**bundle恢复**：`../Jianghu-independent-20261018/jianghu-author-before-slim.bundle` 经 `git-bundle-verify.log` 记录完整历史、6 refs、verify okay，但那是初始基线master7a2c22f，不是ec53最新副本。可执行 `git clone --mirror <bundle绝对路径> <全新恢复.git路径>` 再核refs/fsck，需要工作树时从该隔离mirror另clone。bundle覆盖已打包refs可达历史；完整.git副本另外保留reflog/不可达对象和元数据，两者用途不能混同。Git备份不包含未追踪原典/当前工作树文件的自动保证，原典另用protected已验SHA副本，外置PNG用逐项manifest。

## 73项前有后无的逐项关闭证据

本次只读核对，不重测或改写原AFTER，未恢复/删除任何产品或Git文件。CSV新增 verification_details、recovery_sha256，所有恢复路径均相对当前仓库指向项目外；无 `BEFORE_ONLY_REVIEW_REPORT` 笼统未知项。

| 分类 | 数量 | 实际复核 | 结论 |
|---|---:|---|---|
| Git松散object路径 | 54 | 从两级路径还原40位OID；当前 `git cat-file --batch-check` 逐项取objectname/type/objectsize，与外置 `git-objects-before-maintenance.txt` 精确一致 | 对象仍在当前库，被普通repack打包；原松散文件压缩Length与解压objectsize不混比 |
| 旧pack/idx/rev/mtimes | 7 | 不可变完整.git备份同相对路径存在，Length等于BEFORE；实际SHA256逐项等于git-maintenance-backup.json文件manifest | 原压缩物理文件有可验证备份；当前pack布局可不同；不能手动把旧pack散件覆盖进现库 |
| multi-pack-index | 1 | 初始BEFORE为176244B；完整.git维护前备份为187608B，实际SHA等于该时点manifest | 两时点索引不同，**不声称初始索引原字节已备份**；索引可由现pack再生，6655对象集合/type/size与refs全同、fsck0为内容保全证据 |
| dist/assets旧指纹 | 7 | 在dist-before/dist-baseline候选按原相对路径与BEFORE Length查找；匹配副本实际计算SHA，相同候选的SHA一致 | 旧构建外置保留，现指纹替代；逐行列出真正存在的恢复候选。BEFORE未记录单文件SHA，恢复SHA是本次新计算，不能冒称有初始SHA比对 |
| node_modules/.vite/deps缓存 | 4 | node_modules-before同相对路径存在，Length匹配BEFORE；实际计算恢复SHA | 外置原缓存可恢复；也可用匹配依赖/工具链再生，原缓存不是作者源 |

这里“关闭”表示去向/再生机制与内容保全已具体归类，不表示历史压缩物理布局必须保留或可以清理外置备份。两个报告自身新增字节仍须计入父代理最后测量；CSV当前约3.16MB，不回填原AFTER快照。

## 已测试的每日库替换提案（未采用）

父代理已在外置 `../Jianghu-independent-20261018/daily-repo-proposal/` 完成独立私有快照验证；`daily-repo-proposal.json` 记录：来源 `fcef368840ab9d69795b481f2a42b9a0491affc8`，候选HEAD `526c4eb1b4c236767383c16ae774335b9b487c2f`，2,392追踪路径的字节和mode TREE完全相同，TREE `c38bf953e20c0e5c1a1efe286b09993ff7ca79fe`。这是同一源码树的新私有快照谱系，**不是原作者Git提交谱系变小了**。

`daily-proposal-validation.json` 实测冷npm ci exit0、build exit0、474 unit通过/0失败，测试引用基线无missing warning；候选合计258,668,530逻辑bytes（0.240904GiB）、265,922,232逐文件allocation bytes，其中.git46,553,316bytes。此数字属于已测试的候选，不是当前作者根目录；文档同步后候选最终HEAD/TREE/体积仍待父刷新。当前 `authorRepositoryReplaced=false`、`publicRemoteConfigured=false`。

具体待审动作见 [DAILY_REPO_SWITCH_PLAN.md](DAILY_REPO_SWITCH_PLAN.md)：单独批准后，将当前完整Jianghu根移到同级、事前确认不存在的 `Jianghu-author-history-20261018`，再将外置daily候选移到原Jianghu路径；原作者Git谱系、完整历史、外置截图、bundle和完整.git备份全部保留。撤销采用反向明确Move，绝不删除旧Git或force。目录移动只改变日常工作入口，不代表同盘历史总占用减少。

该策略调整按附件§11.3C **须另行批准，当前未采用**；本稿和计划均不执行移动、不配置remote。已授权的普通FF发布继续进行，不受这个单独策略确认阻挡。F24当前完整作者根目录仍BLOCKED；不能把候选的<1GiB结果移花接木为现库已达标。

## 最终更新条件

父代理完成历史a04d36a完整回归后，再冻结最终HEAD、重测SIZE_INVENTORY_AFTER与size-after（此报告/CSV也计入），补内嵌measured_at及Git维护结果引用，重新算root/.git/worktree逻辑与allocation。保持F24 BLOCKED，除非同一明确范围、同一单位的最终测量确实小于1GiB。历史重写/裁剪、改仓库策略、采用daily提案都须另行明确授权；本稿未提供也未执行清理脚本。

## 两个可行策略与风险（均未获采用授权）

1. **完整旧作者库外置保管，采用已测试新每日库。** 保留全部旧Git谱系与恢复bundle；新库保留作者追踪TREE及另外清点的ignored私档/候选资产，安装依赖和构建后重测。候选已冷ci/build/474测试，该早期历史时点约259MB，只是未最终同步的提案。风险是新每日Git为新私有快照谱系，旧裸SHA到外置完整库查询；不能把候选体积冒作当前根达标。具体目录交换与失败回退见DAILY_REPO_SWITCH_PLAN.md，须单独批准后执行。
2. **仅在隔离副本演练针对历史验收PNG的历史过滤。** 需另行明确批准不可逆历史改写；先保留完整Git/refs/bundle与逐图哈希，只用审阅过的历史图片路径/对象清单限定范围，产生旧→新SHA映射。严禁碰原典、冻源、旧预期哈希或公共main；过滤会使大量旧提交SHA失效，必须复核历史工具/来源引用、fsck、源码字节、完整单测/E2E及恢复流程，再讨论替换作者库。未经演练不能承诺最终大小，不安装/运行filter工具，不执行expire/prune，不强推。公开策展镜像有独立历史，不因本地过滤而改写远端。

委托§11.3C明确要求：如果两方案都未获授权，就量化仍超1GiB并标BLOCKED。目前采取这一裁定，同时完成普通FF产品发布等已授权工作。

私有提案完整性补证：除原Git追踪TREE外，另复制458项原ignored文件，共55787329bytes（109历史源码、118其它私档、原始交付ZIP、本机元数据与历史证据）。源/副本逐项SHA一致、原文件未改、Git tracking/ignored状态不变；全部917审读源码已在提案逐hash一致。见daily-ignored-preservation.json。259MB旧测量早于此补全，不能当最终候选体积；最终文档同步与重测后再收敛。当前作者根未替换，公开镜像未包含这些私档。


## 当前快照与最终外置收尾

当前AFTER与RISK CSV分别是测量和刷新时点的真实文件，不逆改原BEFORE。原作者库未被替换、未改写历史。发布后新增文档/对象与最终作者HEAD的实际占用，以外置closing-author-measure/SIZE_INVENTORY_AFTER.csv及size-after.json为最终目录数字；原始算法仅固定root/output位置，Windows AllocationSize算法未改。外置 daily-final-verify.json另绑定最终候选HEAD/TREE、全追踪字节/918源/原典/候选/ignored保全及候选实测；在其真正生成前不把旧259MB当最终提案。


## 最新已测候选（不是作者根目录）

候选ada1ecf与作者be56235的2527追踪路径/TREE精确一致，另478私档/日志、918审计源、11候选与原典双根字节核同；冷ci/build/474单测均0、缺基线warning0。实测329,656,131逻辑B /338,310,184 allocation B/.git49,834,415B，含依赖及构建，见daily-candidate-validation.json。最终云端文档同步后再以外置daily-final-verify.json绑定最终HEAD/TREE及大小；旧259MB不得当最新数字。原作者目录仍未交换，F24仍BLOCKED。

候选又有0f58→f1f8中间冷CI通过，但113已改产品SW，最终方案必须同步113与最后文档后重建复验，再外置测量。现329MB也只是be562/ada历史快照，不代表最终候选或当前作者根目录。
