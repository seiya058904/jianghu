# 公开发布流程

本文件说明本仓库「公开快照」是怎么生成的、为什么这样排除、以及如何重做一次。目的是让发布动作**可复现、可审计、可交给下一个人**。

> 面向读者的排除结果说明见根 [README.md](../README.md) 的「公开快照说明」；面向 AI 审计的影响说明见 [AGENTS.md](../AGENTS.md) §8。

---

## 1. 为什么需要「快照」而不是直接推送

作者本机的 Git 仓库与研究过程仓库是同一个：历史里累积了 **1.5 GB** 的浏览器测试截图（`docs/evidence/**/*.png`，磁盘上 1942 张 1920×1080 PNG，其中 1930 张已入库）。直接推送会：

- 触碰 GitHub 的仓库体积建议上限（单文件硬限 100 MB，仓库建议 < 1 GB）；
- 让 `git clone` 变得极慢，对云端 AI 审计尤其不友好；
- 公开发布原典 `宋世江湖.md` 全文。

因此公开仓库是作者本机仓库的**策展镜像**：内容取当前 `master` 的追踪文件，减去若干类别。

## 2. 排除策略

下表体积与文件数为 `master` 的**追踪对象**（快照口径），可用第 3 节的命令逐条复现。未经追踪的同名素材不属于「被排除」——它们从来不在 `master` 里。

| 排除项 | 体积 / 数量 | 理由 |
|---|---|---|
| `docs/evidence/**/*.png` | ≈1.4 GiB / 1930 张 | 体积；且截图对 AI 审计的信息密度远低于日志与 JSON |
| `docs/archives/**` | ≈3.4 MiB / 114 文件 | 冻结旧源与基线副本，与仓库 `.gitignore` 的既有意图一致 |
| `宋世江湖.md` | 579,299 B | 原典全文，不公开发布；公开侧只保留 SHA-256 与逐段审读台账 |

**保留**：全部引擎源码、剧本源与编译产物、`tests/`、`scripts/`、运行时美术（`public/art/`，155 张 webp）、全部文档、以及全部 **1062 份文本**证据（`docs/evidence/` 下 519 个 `.log` + 407 个 `.json` + 135 个 `.txt` + 1 个 `.md`）。

## 3. 生成步骤

在仓库根目录、工作区干净的前提下执行。

```bash
# 0) 前置检查
git status --short                 # 应为空
git rev-parse --abbrev-ref HEAD    # 通常为 master

# 1) 建孤儿分支并清空索引（工作区文件不受影响）
#    若本地已有 publish 分支，先删除再重建（内容在 origin/main 上）
git branch -D publish 2>/dev/null || true
git checkout --orphan publish
git read-tree --empty

# 2) 从 master 的追踪文件生成清单，并做排除
git -c core.quotepath=false ls-tree -r --name-only master > .publish-all.txt
grep -vE '^docs/evidence/.*\.png$|^docs/archives/|^宋世江湖\.md$' \
  .publish-all.txt > .publish-files.txt

# 3) 校验：被保留的文件里不应再出现排除项
wc -l < .publish-all.txt      # 预期 4102（追踪文件总数，随迭代增长）
wc -l < .publish-files.txt    # 预期 2057（= 4102 − 1930 − 114 − 1）
grep -c '\.png$'          .publish-files.txt   # 预期 5：4 张 .impeccable/review/*.png + public/art/ferry.png
grep -c '^docs/archives/' .publish-files.txt   # 预期 0
grep -c '^宋世江湖\.md$'   .publish-files.txt   # 预期 0

# 4) 加入（-f 必需：*.log 被 .gitignore 覆盖，但证据日志要入库）
git add -f --pathspec-from-file=.publish-files.txt

# 5) 复核体积与文件数
git diff --cached --name-only | wc -l   # 预期 2057
git ls-files -z | xargs -0 stat -c%s | awk '{s+=$1} END {printf "%.1f MiB\n", s/1048576}'   # 预期 ≈62.9 MiB

# 6) 提交并清理临时文件
rm -f .publish-all.txt .publish-files.txt
git commit -F <提交信息文件>

# 7) 推送（唯一一次对外动作）
git push -u origin publish:main

# 8) 回到日常工作分支
git checkout master
```

> 上面 4102 / 2057 / 62.9 MiB 是本次发布的实测值。它们随 `master` 迭代增长，作为**数量级核对**用；只要第 3 步的三条反向校验为 0 / 0 / 5，排除就是正确的。

### 两个容易踩的坑

1. **`grep` 的 `$` 锚点会让目录排除静默失效。** 写成 `^docs/archives/$` 只会匹配字面串 `docs/archives/`，一份文件都排不掉。目录前缀不要加 `$`。提交前一定按第 3 步做反向校验。
2. **`git add` 必须带 `-f`。** `.gitignore` 里有 `*.log`，本项目的历史惯例是用 `git add -f` 把证据日志强制入库；不加 `-f` 会静默丢掉 519 份 `.log` 证据（`docs/evidence/` 文本证据合计 1062 份）。

## 4. 发布后的配置

```bash
# 启用 Pages（Actions 构建）。必须在首次部署前执行，否则 deploy-pages 会失败。
gh api -X POST repos/<owner>/jianghu/pages -f build_type=workflow

# About：描述 + 主页 + 话题
gh repo edit <owner>/jianghu \
  --homepage "https://<owner>.github.io/jianghu/" \
  --add-topic wuxia --add-topic interactive-fiction --add-topic visual-novel \
  --add-topic ink --add-topic inkjs --add-topic typescript --add-topic vite \
  --add-topic github-pages --add-topic narrative --add-topic chinese
```

站点由 [`.github/workflows/deploy-pages.yml`](../.github/workflows/deploy-pages.yml) 在每次推送到 `main` 时重建；[`verify.yml`](../.github/workflows/verify.yml) 同时重跑构建、291 项单元测试与内容台账。

## 5. 更新公开快照

本机 `master` 继续演进后，公开仓库需要重新同步。因为快照是**单次导入提交**、与 `master` 无共同祖先，更新只能整体替换：

```bash
# 重做第 3 节，然后用 force-push 覆盖
git push --force-with-lease origin publish:main
```

**注意**：`git push origin master` 会把 1.5 GB 的历史推上去，**不要这样做**。日常开发留在 `master`，只在发布时切到 `publish`。

## 6. 快照与源仓库的差异清单

因为快照不是逐字节副本，以下差异是**预期的**，审计时请勿当成缺陷：

- `docs/evidence/**.png` 的截图链接在公开仓库中打不开（文本结论与 JSON 不受影响）。
- `docs/archives/` 路径不存在，相关说明段属历史记录。
- 文档中引用的裸提交 SHA（如 `79aa3c0`、`c7b21cd`）属于作者本机谱系，**公开仓库中不可解析**。
- 公开仓库的提交历史只有导入提交，看不出迭代过程；迭代记录体现在文档的「追加段」里。

### 6.1 对测试的影响（必读）

排除 `宋世江湖.md` 与 `docs/archives/**` 会让 **16 处"字节冻结"断言**无法执行 —— 它们必须读到那些文件才能比对 SHA-256。这些断言分布在 `tests/*-editorial.test.ts`、`tests/taihua.test.ts`、`tests/two-swords.test.ts`、`tests/jade-reusable.test.ts`、`tests/heng-art.test.ts`。

处理方式：`tests/frozen-baselines.ts` 提供两个入口，对**本 checkout 未携带**的基线返回 `null`，调用方跳过该条目：

- `frozenBytes(path)` —— 单文件字节；
- `frozenJson(path)` —— 基线本身是一份 JSON 台账时（如 `docs/archives/sea-v1-editorial-baseline/manifest.json`），`null` 表示台账不在本 checkout，整段跳过。台账存在但格式损坏时会**抛错**，那是真损坏，必须响亮失败。

缺席会被显式记录，而不是伪装成失败：

- 写出 `docs/evidence/v6/frozen-baselines-missing.json`（`node --test` 为每个测试文件起独立子进程，因此写入以 `mkdir` 原子锁串行合并，避免最后退出的进程覆盖其余进程的发现；上一次运行的记录在文件超过 5 分钟未更新时被替换而非累加）；
- GitHub Actions 中以 `::warning::` 注解显示，CI summary 里同时汇总；
- 作者本机携带全部基线 → 全部条目照常断言（`npm test` = 291 passed / 0 failed，且不产生记录文件）。

在精简检出下实测：`npm test` = **291 passed / 0 failed**，记录文件汇总 **34 条**缺席条目（`docs/archives/**` 下 33 个 `*.mjs` / `manifest.json` 加原典全文 `宋世江湖.md`）。

`frozenBytes()` 同时把台账里记录的反斜杠路径归一化为 POSIX 分隔符 —— 台账是在 Windows 上记录的，否则在 Linux runner 上即使文件存在也会 ENOENT。

**结论口径**：公开仓库的"归档字节完整性"是**部分验证**；完整验证在作者本机。审计报告里不要把它写成完全通过 —— 请对照 `docs/evidence/v6/frozen-baselines-missing.json` 列出被跳过的具体条目。

## 7. 已知可改进项

- 若将来需要公开截图证据，可改为精选子集（每部作品 1–2 张关键帧）或引入 Git LFS；注意 LFS 免费额度仅 1 GB 存储 + 1 GB 流量/月，当前 1.5 GB 会超限。
- 快照重建目前是手工流程；如果发布频率提高，应写成脚本并加进 CI。
