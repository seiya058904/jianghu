# V6 修改前审计（进行中）

2026-10-15。当前并非 v6 验收报告。

## 可复验基线

- 根目录 package.json：InkJS 2.4.0 / Vite 8.3.4 / TypeScript 7.0.2 / Playwright 1.64.1；Node 实测 v24.15.0。未安装或升级依赖。
- `npm run build` 退出0，`npm test` 12通过/0失败。日志在 `docs/evidence/v6/baseline-{build,unit}.log`。
- 4173 端口已有本项目服务，未杀进程；测试使用现有本机生产服务和隔离浏览器。E2E 运行记录另存。
- 原目录无 Git；用户追加授权后创建 `65cf507` 本地基线。构建物和备份排除版本控制。
- `docs/archives/v6-baseline-20261015/`：158文件，12731929字节，复制后逐个核验 SHA-256。

## 已确认的缺口（待实现关闭）

|ID|级别|现行证据与复现|要求与风险|状态|
|---|---|---|---|---|
|B01|P0|`src/vn-ui.ts` 的 cover 只有主篇与两个旧篇；无纪事选篇|至少4部独立完整纪事；需各篇版本/存档隔离|OPEN|
|B02|P0|README、story/campaign 作者源、src/campaign-catalog.ts：7章/两中段线|10正式章/3不同事件线，不能改坏 v5旧档的命令回放|OPEN|
|B03|P0|v5旧索引多篇仅定位/部分阅读；本轮已完成1–35315行、29单元全文审读|全文事实登记见CANON_MASTER_INDEX.md及V6_READING_NOTES.md|CLOSED 阅读完成；改编逐场复核另计|
|B04|P0|`src/vn-runtime.ts` 的 CG白名单仅 rescue/storm/dawn/quiet|10实际剧情CG；扩展统一资产登记，兼容旧命令与降级|OPEN|
|B05|P0|既有资源登记与V5报告为12专属人物、4图片表情编辑、12环境、8原型|需实际引用20专属/16三状态/24环境/12原型/60 NPC；需重新统计及目视验收|OPEN|
|B06|P0|`scripts/offline-manifest.mjs` 与README说明安装时缓存全部正式图像|扩容后需按需下载/缓存预算，防止首屏拉取所有纪事资源|OPEN|
|B07|P1|图索引 generation 2026-10-14，coverage 标记 v5文件 not_tracked|不能依赖陈旧结构；现行源码回读，后续按需重索引|OPEN|
|B08|P0|120种种子路径和8结局报告中后日最长连续50–51拍无选择；从c_ordinary_day_11开始|主篇后日改为各自短戏及可选回访，避免串演人生|OPEN|
|B09|P1|第二章后出发过场仍用quay场景，时间牌倒退至“序·潮声催人”|章节进度与场景地点分开登记|OPEN|

## 审计尚待补证据

本轮旧版生产浏览器41/41通过，包含全部8结局、两部旧篇、存读档/错误/键盘与根路径子路径离线。新增冻结入口浏览器1/1通过（根路径及子路径），Node14/14通过。日志baseline-e2e.log、compat-browser.log、compat-unit.log。

新鲜截图已独立复制到docs/evidence/v6/baseline-{cover-desktop,choice-desktop,choice-360,night-800}.png并实际目视：桌面舞台与回复分离，360竖屏可读但上部空景偏大、人物偏小；800矮横屏角色明显缩小，对白和按钮仍未遮挡。Browser插件未提供，使用项目既有Playwright/隔离Chrome。

内容实测见baseline-content-audit.json：实际NPC30、专属12、三图状态人物0、原型8、背景12、CG4、选择选项135。已逐句阅读序至第二章及出发过场，完整代表路线的编辑审读仍待继续，不能用通关自动化替代。

## 恢复与风险

源码可以按初始提交逐文件比较恢复；备份保留原字节及恢复说明。不要将 Git 恢复与用户存档恢复混同。v6 不得复用 v5 的命令序列版本来读取改写后的剧情；需要冻结旧内容并测试显式兼容入口或严格迁移。
