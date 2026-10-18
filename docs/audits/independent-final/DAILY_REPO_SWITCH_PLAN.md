# 每日库替换计划（待单独批准，未执行）

此计划按附件§11.3C提出可撤销的日常仓库策略调整，**不是执行授权**。当前作者仓库没有被替换；无需等待此提案确认才能继续已授权的普通FF发布。

## 已完成验证与待冻结项

- 来源作者提交：`fcef368840ab9d69795b481f2a42b9a0491affc8`。
- 已测候选HEAD：`526c4eb1b4c236767383c16ae774335b9b487c2f`；与来源2,392追踪路径字节和mode完全相同，TREE `c38bf953e20c0e5c1a1efe286b09993ff7ca79fe`。见 `daily-repo-proposal.json`。
- 冷npm ci / build均exit0，474 unit通过、0失败，测试引用基线无missing warning。候选逻辑258,668,530B、逐文件allocation265,922,232B，含.git46,553,316B。见 `daily-proposal-validation.json`。
- 文档同步后，父代理还须记录候选**最终HEAD、文档TREE、测量时间与体积**，同时核当前作者最终来源TREE；本轮旧验证不自动覆盖后续差异。需要适当复核差异和测试证据后才能采用。
- 新每日库是新的**私有快照谱系**；作者原Git谱系保留在完整历史目录。候选未配置公开remote，计划也不增加remote、不推送、不删除refs、不force。

## 批准后才可执行的精确目录交换

| 角色 | 绝对路径 |
|---|---|
| 当前完整作者根 | `.` |
| 保留的完整历史根（须不存在） | `.-author-history-20261018` |
| 已测试候选根 | `../Jianghu-independent-20261018\daily-repo-proposal` |

1. 获得针对这两个Move的单独明确批准，绑定当时最终来源HEAD/TREE、候选HEAD/TREE与体积。原典、冻结来源和预期哈希不得改变。不要将“验证过候选”当成已经批准替换。
2. 确认所有编译、测试、静态服务和编辑写入已结束，团队与IDE不会继续写旧路径。记录当前作者Git status/refs和候选status；任何切换时仍未纳入记录的新文件都先保留并更新交接，不依赖Git自动包含未追踪文件。
3. 在同一个PowerShell流程核验三条路径解析后的绝对值与上表完全一致；当前根、候选根存在且为目录，历史根不存在；任何路径为junction/symlink或目标已存在则停止，不覆盖、不猜新目标、不删除。
4. 先将**整个**当前根移动到历史根，保留其.git、未追踪私档及全部文件；仅在成功且原路径已不存在后，将候选整个根移到原路径。具体候选操作是：

```powershell
# 仅供批准后的人工/代理执行；必须先完成上面的路径及不存在检查。
Move-Item -LiteralPath '.' -Destination '.-author-history-20261018'
Move-Item -LiteralPath '../Jianghu-independent-20261018\daily-repo-proposal' -Destination '.'
```

5. 若第二个Move失败且原Jianghu目标仍不存在，立即按明确反向Move把历史根移回原路径；若原路径已出现文件/目录，停止核对，不覆盖它。原候选保持原位或保留其失败现场。
6. 两次Move成功后，在原路径核候选HEAD/TREE、私档原典哈希、冻结来源/旧存档兼容证据、node_modules/dist可用性与关键启动；在历史根核作者原HEAD/refs仍在，确认外置截图、bundle、完整.git备份路径未动。重新测日常根体积，注明仍不包含保留历史根与外置备份。
7. 更新本地工作入口和交接文档，明确“Jianghu=新每日私有快照；Jianghu-author-history-20261018=完整作者谱系”。公开仓库沿独立已授权普通FF发布流程；不得直接向公开main推作者私有历史或新增私有remote。

## 撤销：保留两边数据的反向Move

先停止所有写入；确认外置原候选路径 `...\Jianghu-independent-20261018\daily-repo-proposal` 不存在。将现在的每日根**完整移动**回该外置候选路径（包括采用后的新修改/未追踪文件），确认原Jianghu路径不存在，再将历史根完整移回原Jianghu。任何目标已存在就停止，另行核对，绝不删除或合并覆盖。反向候选命令是：

```powershell
# 仅供批准后的撤销；目标必须事前核验不存在。
Move-Item -LiteralPath '.' -Destination '../Jianghu-independent-20261018\daily-repo-proposal'
Move-Item -LiteralPath '.-author-history-20261018' -Destination '.'
```

撤销后核作者HEAD/refs/status及目录内容；每日新修改留在外置候选，不丢弃、不reset。完整历史、外置截图、初始bundle与不可变完整.git备份从未删除。由于两库历史都保留，此方案降低日常根目录的大小，**不承诺降低整个磁盘卷的历史总占用**。

本计划未执行任何Move、删除、remote配置或历史重写。当前F24完整作者目录仍BLOCKED，最终方案是否采用等待单独确认。

私有提案完整性补证：除原Git追踪TREE外，另复制458项原ignored文件，共55787329bytes（109历史源码、118其它私档、原始交付ZIP、本机元数据与历史证据）。源/副本逐项SHA一致、原文件未改、Git tracking/ignored状态不变；全部917审读源码已在提案逐hash一致。见daily-ignored-preservation.json。259MB旧测量早于此补全，不能当最终候选体积；最终文档同步与重测后再收敛。当前作者根未替换，公开镜像未包含这些私档。
