# 验收证据与历史截图

本目录保留可复现的文字证据。2026-10-18 独立终审将历史 PNG 外置归档；原始文件逐个复制后核对字节与 SHA-256，再移出工作区，并通过普通提交停止追踪。没有删除 Git 历史。

- 完整恢复映射：[historical-png-archive.csv](../audits/independent-final/historical-png-archive.csv)。每行包含原项目相对路径、字节、SHA-256、原追踪状态。
- 归档校验统计：[historical-png-summary.json](../audits/independent-final/historical-png-summary.json)。归档在作者项目同级的 `Jianghu-independent-20261018/historical-evidence/`，按原相对路径保存。公开仓库不携带原始截图。
- 恢复时只按清单从该归档复制所需路径，并对比 SHA-256；不要覆盖已有不同文件。原始 Git bundle 另存同级备份目录，可完整恢复瘦身前历史。
- 历史报告中代码格式的 `.png` 路径是原始证据标识，须通过清单定位；它们不是公开仓库仍携带图片的承诺。旧日志与冻结哈希未改写。
- 新 `npm test` / Playwright 输出经 `tests/evidence-path.ts` 写入 `JIANGHU_EVIDENCE_DIR`，默认系统临时目录 `jianghu-evidence`。每次正式 RC 应指定独立的项目外目录，避免批次混淆。不得再覆盖历史证据。
- 新增入库截图只选必要关键帧，WebP、宽不超过 800px；高分辨率原图留项目外。截图和自动化结果不等同外部真人、真机或审美验收。
