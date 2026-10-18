# 普通 Git 开发与发布

## 日常操作

Jianghu 是 `https://github.com/seiya058904/jianghu.git` 的普通克隆；`main` 跟踪 `origin/main`，fetch 与 push 使用同一个 origin。

```bash
git pull --ff-only
# 开发并完成适当验证
git add -A
git diff --cached --check
git diff --cached --stat
git diff --cached
# 确认暂存内容都属于本次工作
git commit -m "描述本次改动"
git push origin main
```

不强制自动 pull/push。公开远端前进时先核查差异；分叉、冲突或来源不明改动不得靠强推或丢弃解决。推送等外部写操作仍遵守用户对当前任务的授权。

## 本机文件与 Git 索引

原典全文 `宋世江湖.md`、`docs/archives/`、候选原图、本机配置、密钥、备份、大量原始测试证据和明确的清理/恢复回执不进入公开 Git。它们在本地原位置保留，通用规则写入 `.gitignore`，仅属于本机的历史路径写入 `.git/info/exclude`。迁移前与公开版不同的文档原字节保存在忽略的 `.local-originals/`，公开历史文档保留原有脱敏版本。

忽略规则不影响已经追踪的文件。新增规则前须核 `git ls-files`；需要停止公开追踪时先保全文件，再审阅限定路径的索引变更。提交前检查 `git status --ignored`、`git check-ignore -v <路径>`、`git diff --cached`。`public/art/`、作者源、Ink、生成 JSON、HTML 和测试应继续正常追踪，不能用过宽忽略遗漏运行文件。不要使用 `git add -f` 越过本机文件规则。

## 验证与上线

Node.js 24，依赖按现有锁文件安装：

```bash
npm ci
npm run build
npm test
git diff --exit-code -- story src/generated
git diff --check
git push --dry-run origin main
```

剧情、运行时、存档或离线逻辑变更按影响范围增加真实浏览器回归。仅 Git/文档迁移不要求重跑历史完整 E2E；必须另记此次实际短测，不能把历史 505 项当成本轮新结果。

main 推送会触发 `.github/workflows/verify.yml` 与 `deploy-pages.yml`。发布后核对确切提交的 Verify、Pages 均 completed/success，再检查真实 HTTPS 的首页、深链、选项、资源和部署产物身份；触发 Actions 或 HTTP 200 不代表完整上线验收。

## 本机冻结材料与历史方案

本机有完整原典和历史档案时照常检查冻结字节。公开 CI 不携带原典全文与 `docs/archives/`，相关归档完整性明确为部分验证；缺少源码、剧情、生成物或运行美术仍须失败，不降低断言。

此前“私有日用谱系＋公共策展镜像＋隔离发布”的方案已停用，旧工具 `scripts/publish-public.ps1`、`scripts/public-snapshot.py` 及其专用回归测试已退出仓库。历史审计文档仅保存当时发生的事实，不继续指挥日常工作。旧日用目录与外置校验备份仅作短期回滚源，不参与开发或发布；没有导入其独立 Git 历史，也没有改写 GitHub 既有历史。

真人阅读、真实 Android、Safari/Firefox、读屏器与长期性能须按实际证据单独报告。
