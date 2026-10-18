# 最终验证 · 体验审计

状态：本地体验审计完成；最终候选单次完整505项通过。未授权、未执行公开发布。

## 起点与候选

- 仓库：`.`，分支`codex/daily-snapshot`。
- 起点：`9ae5e409d25cb983e530bc2475e256b73a039d59`，工作区干净；无stash，仅一个worktree。远端`github-public` fetch-only，push URL为`disabled://fetch-only-public-mirror`，pre-push仍拦截公开推送。未用真实push验证。
- 最终产品RC：`808954f12b16d443dc4e1bf964de9bfc565f79bc`。`e34ea6e`为被特写回归否决的上一候选，不作最终完整通过依据。
- 本地修复提交：`b078124`叙事/旧档，`c2c626f`离线/证据，`7367852`审计外部输出，`e34ea6e`横屏/焦点，`808954f`特写画布修复。最终报告提交另列，不能冒称它是全量测试的启动HEAD。
- 原典579299字节，SHA256 `2e2b665657543e81c6b06c121307c9f13685d2c535f762a5b921949aaa8af393`。未更改旧冻结清单、旧来源字节或测试预期。

## 环境与命令

Windows，Node24.15.0、npm11.12.1、Chrome155.0.8059.40、Python3.12.10、Pillow12.2.0。`npm ls --depth=0`确认inkjs2.4.0、Vite8.3.4、TypeScript7.0.2、Playwright1.64.1均与锁定版本相符，故没有再执行`npm ci`或更新依赖。

Browser插件未提供；用项目Playwright驱动系统Chrome。默认channel自动查找的用户目录不存在，实际可执行文件为`[author-local-path]`。外部配置仅覆盖可执行路径、项目外output/reporter和webServer cwd，测试目录仍为原仓库，断言与用例不裁减。HTTP/HTTPS/ALL代理对本地测试清空，localhost直连。

```powershell
$env:JIANGHU_EVIDENCE_DIR = '<项目外独立RC目录>'
npm run build
npm test
npm run test:editorial
npm run audit:v7
npm run audit:independent
npx playwright test --config '<外部playwright.config.mts>' --workers=8
```

编辑80项已被`npm test`的`tests/*.test.ts`包含，不能把488+80写成568个独立测试。

## 采用的验证结果

|验证|精确输入/批次|结果|
|---|---|---|
|构建|808954f / `rc2-build.log`|PASS，退出0|
|全部单元/冻结/策略/编辑|808954f / `rc2-unit.log`|488 PASS、0 FAIL/SKIP，退出0|
|单独编辑命令|808954f / `rc2-editorial.log`|80 PASS、0 FAIL/SKIP，退出0；是488的子集|
|V7审计|808954f / `rc2-audit-v7.log`|PASS，退出0；23现行、47/47结局可达（每篇600路径），统计启发式不等于选择质量证明|
|独立运行时/图片|808954f / `rc2-independent.log`|PASS，退出0；23入口抽样路径、183张解码，像素解码不等于身份美术验收|
|基础定向|前候选 / `rc-targeted4`|42 PASS、0 FAIL/SKIP，退出0；仅作过程证据|
|并行隔离试跑|前候选 / `parallel4`|14 PASS、0 FAIL/SKIP/FLAKY，退出0；4worker，独立context/证据|
|特写相关定向|808954f同字节 / `camera-targeted`|38 PASS、0 FAIL/SKIP/FLAKY，退出0；保留原Heng宽镜头断言|
|8worker试跑|808954f / `parallel8`|30 PASS、0 FAIL/SKIP/FLAKY，退出0；当前16逻辑核、32GB内存，独立浏览器/上下文/证据|
|最终一次完整E2E|808954f / `rc2-e2e`|505 PASS、0 FAIL/SKIP/FLAKY，退出0；8worker，1197.4秒|
|生产输入与dist冻结|`rc2-full-before.json` / `rc2-full-after.json`|PASS；1177文件逐路径SHA全同，树SHA256 `37c9843e7b53e4ca329f2882405215516e9b78b3aff045f13ef142869a1da373`；未拼不同构建|

14个本地HTTP样本（根4173、子路径4175各7项：主页、太华、入口JS、SW、壳清单、篇包清单、场景图）曾逐字节匹配当时dist。最终808954f同方法14/14逐字节匹配，见`rc2-served-build-identity.json`。真实画面与交互的证据见[视觉复验](VISUAL_REVIEW.md)和[覆盖矩阵](PLAYTHROUGH_MATRIX.csv)。

## 失败与中止记录

所有记录保留在项目外，不用后续成功覆盖：

- `unit-batch1`两项失败为新测试把分支动态拍号当固定拍号、要求未改路线必须迁移；改为按真实段落和实际改文路线验证。`unit-batch2`剩两项为同一测试定位问题。`unit-batch3`12/12通过；旧34项迁移验证没有被删除或降低断言。
- `rc-targeted`未启动测试：外部配置的webServer cwd指向临时目录；修正cwd，未改产品。
- `rc-targeted2`26 PASS/7 FAIL；六项新测试的init脚本在每次reload强行重种旧fixture，另有焦点路径问题。修正为首次种档，保留刷新断言。
- `rc-targeted3`32 PASS/1 FAIL：键盘焦点仍未真正到回复；修复焦点移交时序和长按默认事件后，`rc-targeted4`42/42通过。
- `final-e2e`是e34ea6e候选的**中止完整尝试**，退出1，无完整聚合结论；`heng-art.spec.ts`的旧乾坤特写宽度断言失败。输入从运行前到中止后SHA一致，失败非构建中途变化。保留原log与error-context，后续修的是镜头规则，未降断言。该轮已过项不并入最终505。
- `rc-walk`为早期开发过程的非冻结浏览器尝试，源码重建前已停止，不算最终覆盖。`baseline-walk`与`final-walk`保留各自代际；最终采用808954f的`rc2-walk`与`rc2-contrasting-walk`。

## 存档、离线、输入与长期边界

真实旧字节新增保存在`src/generated/experience-pre-audit/`，来源是起点提交的git-show导出；原`independent-pre-audit`继续保留。两代旧档先严格核完整Ink快照、呈现和变量，再独立重放当前内容。只容许纯文字订正；变更选项、人物或世界变量的篡改仍被拒绝。浏览器保存原槽、原始备份导出、根/子路径恢复、跨版拒绝均有专项。

离线显式下载刷新完整本篇与共享壳，失败不报成功；0.2缓存缺项仍能读原0.1下载包，没有清空玩家缓存。受控旧图注入→真实下载→断网取字节匹配磁盘的证明，与“线上实际出现过旧图”不是同一主张。历史入口/命名空间不合并，自动档失败可导出，备份失败阻止重开。

键盘真实按住Enter跨过180ms锁释放仍不选项，松开后Tab/Shift+Tab和空格可选；自动与已读快进、弹层、跨标签页及存储失败由现有专项与完整回归共同覆盖。

最终808954f候选在青石390×844、24px完成320次真实点击：到达结局、0页面错误，可见元素62–70个。JS堆采样约5.4–8.4MB，末段约6.1MB；客户端观察点击到新拍中位265ms、P95 284ms（包括180ms防连击锁、自动化开销及并行回归负载）。可见DOM未持续堆积、堆采样有回落，但这不是现场INP、低端真机或无内存泄漏证明，也不作性能提升的前后对照。原始指标在`main/rc2-performance/performance.json`。

## 公开对照、体积与交付边界

本轮真实Chrome只读打开线上作品库→太华深链→开场，0 pageerror。线上主页字节与本地相同，SW字节不同，说明本轮维护修改尚未发布；主页HTTP200不代表新RC上线。没有运行`-Publish`、push、merge、deploy或改远端配置。

首个修复RC测量根目录逻辑335,863,087B（含.git50,691,985B）、工作区285,171,102B、文件allocation344,652,976B，低于1GiB；最终文档提交后另做同口径实测。没有卸载依赖、删除证据或清理对象库来达标。

移动端首屏CPU、字体/图像逐项解码耗时及场景切换峰值未做独立性能剖析，记为PARTIAL；仅有Chrome模拟视口的导航/paint记录与长篇交互采样，不能换算成真机结论。

真人试玩、实际阅读耗时、Android真机、Safari、Firefox、读屏器、长期性能、现场INP均为 **EXTERNAL NOT VERIFIED**。图服务`list_projects`和`check_index_coverage`均报`Transport closed`，本轮结构追查回退当前源码/测试，未声称图索引完备。

`scripts/publish-public.ps1 -DryRun -KeepWorkRoot`对报告提交`41266506661c7c4ef48a6e11be916aedb6f9ee72`退出0，状态OK：相对公共main `14dd8b05068c57b6705a11b8822e47169d8759e1`共36个变更、0删除、0策略阻断。差异为本轮26个代码/脚本/测试文件以及10个报告/导航/压缩对照图；没有公共应用、提交或推送。私有原典仍在排除清单。隔离检出保留在项目外，没有执行清理删除。

机器可读预览在`main/publish-preview.json`，其中保留每个路径、原plan路径及SHA256；日志`main/publish-dry-run.log`。该预览绑定上述提交，不自动授权之后的HEAD；最终收尾HEAD的同字节检查、重新构建/单测、体积和第二次干运行回执在`main/post-commit-closeout.json`。

完整505项的启动和结束HEAD均为808954f。后续仅添加报告、导航和压缩证据；最终HEAD须通过逐文件树SHA及`git diff 808954f HEAD -- src story public tests scripts package.json package-lock.json playwright.config.ts vite.config.ts tsconfig.json`无差异确认，不把文档HEAD冒称为505项的启动HEAD。收尾记录亦核工作区、远端push禁用、钩子、stash/worktree与原典SHA。

公开发布需要本轮另行明确授权，并针对届时最终HEAD重新走发布前核验；本地验收不授权发布。
