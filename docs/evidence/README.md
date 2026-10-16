# 证据目录

本目录存放项目的**原始证据**：测试与构建日志、统计 JSON、素材归属审计、冻结字节校验清单。仓库里的结论都应该能在这里找到支撑。

> 本 README 是目录说明。人读总览见 [../../README.md](../../README.md)，AI 审计入口见 [../../AGENTS.md](../../AGENTS.md)。

---

## 公开快照的重要说明

本仓库是作者本机 Git 的公开镜像。为控制体积与版权，**本目录下已入库的 1930 张浏览器截图（`**/*.png`，约 1.4 GiB）不在公开仓库中**（工作区另有 12 张未入库截图，不算「被排除」）。

这意味着：

- 文档里指向 `docs/evidence/**.png` 的链接**在公开仓库里打不开**；
- 但**文本证据是完整的：1062 份，含 519 个 `.log`、407 个 `.json`、135 个 `.txt`、1 个 `.md`** —— 每个工作流的结论都能在此复核，不必依赖截图；
- 截图类结论在作者本机存在，只是未公开 —— 审计时请区分"证据缺失"与"证据不存在"，并在结论中标注这一限制。

同样不公开的还有 `docs/archives/**`（冻结旧源与基线副本）与根目录的 `宋世江湖.md`（原典全文）。

## 目录结构

```
evidence/
├─ *.json, *.log                    # V5 世代证据
└─ v6/                              # 当前世代证据
   ├─ *.log                         # 构建 / 单元 / 浏览器 / 离线测试日志
   ├─ *summary*.json                # 各篇统计汇总
   ├─ *.png                         # 浏览器截图（公开快照中不含）
   └─ *-preservation.json           # 冻结字节校验清单
```

## 关键证据文件

| 文件 | 内容 |
|---|---|
| `v6/qian-kun-editorial-integration-preservation.json` | 28 个冻结保护路径的 SHA-256 清单（北枪 14 / 乾坤 10 / 主篇与方向 3 / 原典 1；其中 8 条经 `pathMap` 指向 `story/archive/` 归档副本） |
| `v6/main-current-20261016-summary.json` | 主篇九条完整浏览器路线的结局覆盖 |
| `v6/offline-bundle-ownership-audit.json` | 44 个离线包的归属审计 |
| `v6/asset-manifest-browser-{root,subpath}.json` | 根路径 / 子路径下的素材加载实测 |
| `v6/qian-kun-editorial-summary.json` | 乾坤 V3 接入汇总 |
| `v6/qian-kun-handoff-*.log` | 交接后的构建、浏览器批次、冷离线与离线包测试日志 |
| `v6/publish-readiness-unit.log` | 公开发布前的全量单元测试（291 passed / 0 failed） |
| `v6/*-editorial-summary.json` | 28 份各篇三轮编辑汇总（`dead-ranking`、`luhua`、`dongting`、`luoyang`、`bamboo` 缺） |
| `baseline-file-audit.json`、`reading-metrics.json`、`dialogue-metrics.json` 等 | 早期内容与可读性统计 |

## 证据入库惯例

`.gitignore` 含 `*.log`，但本目录的日志**按项目惯例强制入库**（历史上使用 `git add -f`，现有 700 余份）。新增证据请沿用：

```bash
git add -f docs/evidence/v6/<topic>-<stage>.log
```

命名约定：`<topic>-<stage>.log`，例如 `qian-kun-handoff-browser-main.log`。

## 复现这些证据

```bash
npm run build                                                     # 生成 build 日志所需的产物
npm test                                                          # 291 项单元与叙事契约测试
npx playwright test tests/<spec>.spec.ts                          # 浏览器验收（需先清空 http_proxy/https_proxy）
node --experimental-strip-types scripts/audit-production-v6.mjs    # 全项目内容台账
node --experimental-strip-types scripts/audit-offline-bundles-v6.mjs
python scripts/build-art-manifest-v6.py                            # 素材清单（需 Pillow）
```

CI（`.github/workflows/verify.yml`）在每次推送时重跑其中可自动化的部分，并输出内容台账。
