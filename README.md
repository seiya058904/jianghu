# Jianghu · 宋世江湖

以作者原典《宋世江湖》改编的互动武侠纪事集：**16 部作品、23 个现行版本**。观察、问话、较艺与合作，在固定的历史胜负之间决定自己怎样参与。每篇独立存档，无声音也能完整游玩。

[在线作品库](https://seiya058904.github.io/jianghu/) · [文档导航](docs/README.md) · [独立终审基线](docs/audits/independent-final/BASELINE.md) · [本轮验收](docs/audits/independent-final/FINAL_ACCEPTANCE.md)

2026-10-18 正在执行独立终审与安全增量发布。当前 RC、完整测试、公开 SHA 与未验证项目以本轮验收为准，旧版“17/17”不是本轮结论。历史记录保留于 [V7 矩阵](docs/v7/V7_ACCEPTANCE_MATRIX.md)。

## 从哪里开始

| 推荐篇目 | 入口 | 你面对的事 |
|---|---|---|
| 太华试序 | [开始](https://seiya058904.github.io/jianghu/taihua.html) | 替同门赴六门旧会，经历真胜与真败 |
| 龙门问刀 | [开始](https://seiya058904.github.io/jianghu/longmen.html) | 第七刀、藤条三手与木剑九剑 |
| 第十二席 | [开始](https://seiya058904.github.io/jianghu/twelfth-life.html) | 找肯教自己、也肯真赢自己的人 |
| 青石五友 | [开始](https://seiya058904.github.io/jianghu/qingshi.html) | 五个少年的去处，一个普通人的一生 |
| 山河璧 | [密库双贼](https://seiya058904.github.io/jianghu/jade-thieves.html) → [十三文](https://seiya058904.github.io/jianghu/jade.html) | 真假旧物、临场合作与守粮的代价 |
| 死人争榜 | [开始](https://seiya058904.github.io/jianghu/dead-ranking.html) | 三场真胜与一个死去十八年的名字 |

作品库另含《照水刀》《北枪与乾坤》《一剑两脉》《海路两世》《玄门旧史》《白石谷外》等作品及配篇。《榜纸之外》须先读两部前置篇。年代不同的宗师与年轻人不属于同一批对手。

原创《潮生有约》已退出默认门面。V5/V6、各篇 V1/V2 和旧存档仍可从[历史版本与旧存档](https://seiya058904.github.io/jianghu/index.html#archive)进入；不要把历史入口当成现行作品。

## 本机运行与验证

需要 Node.js 24；依赖精确锁定于 package-lock.json。

```bash
npm ci
npm run build       # 作者源 → Ink → JSON → TypeScript → Vite → 离线清单
npm start           # http://127.0.0.1:4173/
npm test            # 自动发现全部 *.test.ts，含编辑草稿与保护契约
npm run test:editorial
npm run test:e2e    # 根路径4173 / 子路径4175，默认单worker
npm run audit:v7
npm run audit:independent  # 运行时与资源追溯；图片扫描需要 Python + Pillow
```

E2E 前清空可能影响 localhost 就绪探测的 HTTP/HTTPS/ALL 代理。构建会清空 dist；本机守卫若限制批量删除，先校验精确路径，将 dist 移到项目外再构建。确认服务读取当前构建。

新测试证据输出到 JIANGHU_EVIDENCE_DIR，默认系统临时目录的 jianghu-evidence，不覆盖历史证据。每个正式 RC 指定独立项目外目录；只精选宽≤800px 的 WebP 入库。[历史 PNG 归档与恢复](docs/evidence/README.md)。

运行时采样不是全状态穷举，资产可解码不是审美通过，自动化阅读不是真人试读。最长被动段按真实运行路径计算，不能把 Ink 互斥分支线性相加。

## 操作与存档

点击舞台/对白，或 Enter、空格推进；打字时首次点击补全文。回复由玩家选择，自动与已读快进不会代答。Tab 切换控件、Esc 关闭面板。设置支持 18/20/22/24 字、纸本/夜读、文字速度与减弱动态；短横屏允许区域内部滚动。

每句自动保存，另有三个手动槽、上一程、JSON 导出/导入。各篇各版命名空间隔离。损坏或不兼容存档拒绝导入并保留原始数据。存储不可用时仍可游玩并导出；旧标签检测到其他标签更新后停止覆盖自动档。显式重新开始前若备份失败，会保留原档并阻止替换。

按篇下载同时刷新作品和当前首页依赖，保留其他已缓存作品；未下载的故事不能承诺离线首开。

## 作者入口与公开边界

- story/*-author.mjs 及辅助模块是一手作者源；story/*.ink、src/generated/*.json 为生成物。
- src/player.ts / vn-runtime.ts / vn-ui.ts：阅读器、存档与舞台。
- src/library.ts / library.css / work-index.ts / works-registry.ts：作品库与版本分区。
- src/*-catalog.ts / public/art/：人物、年龄、场景与独立图层。
- public/sw.js / scripts/offline-manifest.mjs：离线更新。
- tests/：运行时、存档、叙事契约与浏览器验证；历史基线缺席会明确告警。

先读 [AGENTS.md](AGENTS.md)、[原典硬约束](docs/lore/CANON_RULES.md)与[迁移规则](CONTENT_MIGRATION.md)。不改原典既定生死、胜负、年龄、门派或榜次；山河璧不是增功、疗伤或延寿道具。

### 公开快照说明

作者历史与公开 main 是不同谱系。公共镜像从已验证提交取明确允许的追踪文件，排除原典全文、私档、候选原图、海量原始截图、个人配置和备份；在当前远端 main 上普通增量提交与快进推送。[安全发布规程](docs/PUBLISHING.md)。

公开缺少原典和私有冻结字节时，对应条目为明确 warning / 部分验证；源码或运行资源意外缺失必须失败。作者本机仍核对完整字节。本轮未新增 LICENSE，公开可读不构成额外再许可。

## 已知边界

真人试读、阅读耗时、Android 真机、Safari、Firefox、读屏器未被本机 Chrome 自动化替代。冻结原创旧篇仍有记录在案的 P2 文字问题。陆清婉现行中年含笑状态暂用同年龄干净中性立绘，保留文字语气；没有把回退称为新表情素材。作者目录 1GiB 目标必须包含 .git，未达时不得报完成。
