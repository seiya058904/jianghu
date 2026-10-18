# AGENTS.md

《Jianghu / 宋世江湖》入口规则。先核当前代码与验收，不沿用历史 PASS。

## 当前定位

- / 与 /index.html 是原典互动武侠纪事集作品库：16作品、23现行版本、20纪事归档版本。
- 原创《潮生有约》仅在 tide-v6.html；V5、半步、渡口与各篇V1/V2为历史入口，不能重新混入推荐门面。
- 当前独立审计位于 docs/audits/independent-final/：BASELINE、ISSUE_LEDGER、FINAL_QA、FINAL_ACCEPTANCE、RELEASE_VALIDATION。文件缺席或尚未执行不得判PASS。
- docs/v7、docs/v6保留历史轮次与追加段。旧297/80/471/56不是本轮结果，引用数字须注明代际、方法与输入版本。
- 本机作者材料宋世江湖.md：579299 bytes，SHA256 2e2b665657543e81c6b06c121307c9f13685d2c535f762a5b921949aaa8af393。本轮splitlines/换行计数35314。不得改写；本次未授权新增公开全文。

**Git 工作流**：原路径是 GitHub `seiya058904/jianghu` 的普通克隆，`main` 跟踪 `origin/main`。正常 `git pull --ff-only`、`git add -A`、`git commit`、`git push origin main`；main 推送触发 Verify 与 Pages。旧双谱系、隔离策展发布流程已停用，详见 docs/PUBLISHING.md。本机原典、历史私档、恢复回执和原始证据通过 .gitignore / .git/info/exclude 保留，不进入公开索引。

## 文件地图与作者入口

|责任|入口|
|---|---|
|一手作者源|story/*-author.mjs及导入正文模块；历史人工源story/main.ink、story/duel.ink|
|流水线|scripts/compile-story.mjs → story/*.ink → src/generated/*.json|
|阅读与存档|src/player.ts、vn-runtime.ts、vn-ui.ts、storage.ts|
|作品库/版本|src/library.ts、library.css、works-registry.ts、work-index.ts、edition.ts|
|人物/场景/年龄/CG|src/*-catalog.ts、presentation.ts、public/art/|
|演出锚点|story/production-direction-v6.mjs（冻结，不追加）、production-direction-v7.mjs|
|离线|public/sw.js、scripts/offline-manifest.mjs|
|原典边界|docs/lore/CANON_RULES.md、CANON_MASTER_INDEX.md|
|迁移/保护|CONTENT_MIGRATION.md、tests/frozen-baselines.ts、historical-baselines.ts|
|发布|docs/PUBLISHING.md、.github/workflows/|

不要手改生成Ink/JSON冒充作者源修复。插句会改变动态beat编号，必须检查CID/VAR、look/camera/action、存档与恢复。变量被读取不等于选择有意义。

## 工作方式

先核Git根、分支、HEAD、状态、远端、stash/worktree。保护用户已有修改。非简单改动先明确成功标准、重现、最小修复、定向回归、冻结验证；不得删除失败测试、降低断言或用旧日志冒充新通过。

结构发现使用codebase-memory技能，对依赖路径check_index_coverage。陈旧/缺覆盖须回读当前源码，不从图缺项推导不存在或全覆盖。

多代理仅在用户明确授权时使用。共享作者源、生成物、证据、SW禁止并发修改，明确所有权，不撤销他人工作。

## 正典与冻结保护

- docs/lore/CANON_RULES.md的16条约束是编剧红线。固定历史生死、重残、胜负、年龄、门派、榜次不可随意改；玩家改变准备、认知、职责、旁支与同行者代价。
- 入化/返真不作玩家公开等级或NPC自报层数；武学落到距离、落步、重心、呼吸、先后、退路与经验；山河璧无增功/疗伤/延寿/武学。
- 不改story/archive、story/drafts、docs/archives的既有来源字节。不为润色静默破坏旧稿或原存档。
- 不得修改旧冻结清单预期哈希以通过测试。本轮精修现行篇曾被旧“伴篇不变”断言引用；七份真实旧字节已从起点提交独立归档，见preservation-map.json。旧预期完全保留，现行行为另测。
- frozenBytes仅对原典全文和docs/archives的有意公开排除允许缺席告警；其他源码/资源缺失必须失败。
- historicalBytes须核来源提交、路径、字节和SHA，先确认现行文件仍存在；不可拿活文件充旧快照。公开私档缺席为明确部分验证。
- 不混用作品/版本命令与命名空间。拒绝损坏/跨版档保留原始字节；替换进度前备份失败必须阻止替换。

## 构建与测试

Node24，依赖精确版本以package.json/lockfile为准。

```bash
npm ci
npm run build
npm test                 # 全部*.test.ts，含编辑草稿与新增保护回归
npm run test:editorial
npm run test:e2e
npm run audit:independent # 图片扫描需Python/Pillow
```

构建清空dist；若本机bulk-delete守卫阻止，先校验精确绝对路径，将dist移到项目外。不要使用笼统递归删除或清理命令。

Playwright根4173、子路径4175。代理会影响localhost就绪探测；运行前清HTTP/HTTPS/ALL代理并给localhost直连。确认服务读当前dist。

完整E2E期间不得改story、generated、runtime、assets或dist；修改则run失效。保留失败日志，不能拼不同构建定向成功冒称最终全量。报告实际PASS/FAIL/SKIP/FLAKY、退出码、RC和资源哈希。

按真实路径测被动段，不能线性串互斥分支；运行时可达、浏览器实走、真人/真机是不同证据等级。

## 美术和证据

背景与单人透明人物独立合成。核实际Alpha、年龄、兵器、身份、同屏、聚焦、CG显隐与恢复；RGBA头或HTTP200不证明视觉正确。历史多人物CG可保留，候选未正式绑定不计运行资源。

测试通过tests/evidence-path.ts输出到JIANGHU_EVIDENCE_DIR（默认系统临时目录）。每RC独立项目外批次，不覆盖历史证据。

2026-10-18逐件复制验SHA后外置2121张PNG，停止追踪2109张；映射/恢复见docs/evidence/README.md。历史日志原PNG路径是原证据标识，不是公开图片仍在库的承诺。

新入库截图只选必要帧，WebP宽≤800px；>1MB二进制不入库。原始证据项目外保管，保存清单/哈希。原典、旧稿、用户资产和审计证据不可无备份永久删除。

## Git、体积、公开发布

本地 main 与 origin/main 共享公开历史，使用普通提交与快进推送，不再维护第二套发布检出。日常以 `git pull --ff-only` 开始；提交前检查 `git diff --cached`，确认忽略的本机材料未进入索引。推送、合并、部署、发布、依赖更新、远端配置等外部变更仍需用户明确授权；历史任务授权不永久延伸。

不强推、不擅自重写历史、不删objects/reflog、不清回收站、不新增LICENSE。瘦身先精确盘点与可校验备份；历史改写或替换作者仓库需单独授权。

1GiB目标包含.git，分别报告工作区、.git、根目录逻辑字节与文件allocation。不能靠忽略截图或临时卸依赖造达标。

云端核确切公共SHA的Verify和Pages最终结果；线上真开首页/深链/图/选项，并与CI产物比哈希。Actions触发或HTTP200不算最终上线。

## 交付诚实性

同步README、导航和对应验收行。本轮必要文字证据在审计目录，.log若忽略则定向force-add；不纳海量中间噪声。不贴原典全文。

真人试读、阅读耗时、Android真机、Safari/Firefox/读屏器未经实测统一EXTERNAL NOT VERIFIED。保留能独立复核的命令、版本、路径、失败与未核边界。
