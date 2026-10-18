# 安全公开发布流程

## 0. 模型：私有日用谱系 + 公共策展镜像

- 本机日用仓库 `Jianghu` 是**私有 Git 谱系**，保存原典、私档、完整证据与全部历史。
- 公开仓库 `https://github.com/seiya058904/jianghu` 的 `main` 是**策展镜像**：只从私有已提交版本里取经过允许清单筛选的追踪文件，重新在公共 `main` 上形成普通增量提交。
- 两套历史**不共享线性祖先**。不要 merge／rebase／reset 对方分支，不要把私有分支推到公开 `main`，不要 force push。两个 HEAD SHA 不同是镜像的正常事实，不是同步失败。
- 公开发布永远发生在**另一个隔离公共检出**里；私有日用仓库本身不换历史、不重置工作区。

## 1. 只读查看公共状态（fetch-only remote）

私有日用仓库配置了一个仅供查看的公开 remote：

```bash
git fetch github-public                                  # 只读
git log --oneline -5 github-public/main                  # 公共最近提交
git rev-parse github-public/main                         # 公共 main SHA
git remote -v                                            # fetch URL 是 GitHub，push URL 是 disabled://
```

推送阻断是双保险：`github-public` 的 push URL 被设为不可用协议，且 `.git/hooks/pre-push` 会拒绝任何指向公开仓库的推送。**不要**用真实推送去“验证”阻断；用 `git remote get-url --push github-public` 与 dry-run 即可。不要给私有分支设置公开 upstream。

## 2. 一键入口

```powershell
scripts/publish-public.ps1 -Help            # 用法与退出码
scripts/publish-public.ps1 -DryRun          # 默认行为：只读 fetch + 生成计划 + 隐私审计
scripts/publish-public.ps1 -Publish         # 明确授权的真实发布（普通快进）
```

- 干运行**绝不写远端**，只创建项目外临时公共检出和计划文件，结束时清理自己创建的临时目录。
- 发布模式必须显式 `-Publish`；要求私有工作区干净、源提交就是当前 HEAD，否则拒绝。
- 私有新增改动应先审计、测试并正常提交；快照只读**已提交**版本，不读未追踪文件、缓存或正在编辑的工作文件。
- 没有经审阅的公开增量时返回 `NO_PUBLIC_CHANGE`：不制造空提交、不盲目推送刷新 Actions。

退出码：`0` 成功或无需发布，`2` 预检／环境失败，`3` 隐私或策略阻断（含未批准的删除），`4` 公共检出冷验证失败，`5` 远端已前进或无法快进，`6` CI／线上验收失败，`7` 参数或授权不足。

## 3. 发布策略（policy version 2，fail-closed）

计划由 `scripts/public-snapshot.py` 生成，逐路径判定为 **candidate / excluded / blocked** 三类，并且对每个候选同时检查**路径、内容与体积**。

允许范围（显式目录 + 显式扩展名）：

| 范围 | 允许类型 |
|---|---|
| 根目录 | `.html`、`.md`，以及 7 个固定配置文件（package/lock/tsconfig/vite/playwright/gitattributes/gitignore） |
| `src/` | `.ts` `.css` `.json` |
| `story/` | `.mjs` `.ink` `.json` `.md` |
| `public/` | `.js` `.json` `.svg` `.webp` `.png` `.txt` `.ico` |
| `scripts/` | `.mjs` `.py` `.ps1` `.sh` |
| `tests/` | `.ts` `.json` |
| `docs/` | `.md` `.json` `.log` `.txt` `.csv` `.webp` |
| `.github/workflows/` | `.yml` `.yaml` |

必须排除（永不公开）：

- `宋世江湖.md` 原典全文及其副本；
- `docs/archives/**` 私有冻结来源字节；
- 私有清理／切换／恢复记录、私档清单、recycle/switch journal、仓库清单（精确路径与判定规则写在策略脚本和私有边界记录中，公开文档不展开）；
- `.workbuddy/`、`.impeccable/`、`docs/art/candidates-*` 候选原图；
- `.env`／凭据／私钥／ZIP／bundle／数据库／可执行文件；`docs/` 下的可执行探针脚本；
- 本机绝对路径、账号或机器信息（文档内脱敏；源码／Ink／生成物／运行资产内出现即阻断）。

fail-closed 规则：

- **未分类路径 = BLOCKED**：新增顶层目录、未知扩展名、未知根文件都停在计划阶段，必须先审阅并更新策略。`docs/audits/` 下**新增**且文件名带 journal／manifest／private／backup／switch／cleanup／recovery／recycle／inventory／preservation／adoption 的运维记录同样阻断，私有回执应显式加入排除表。
- 文档类文件（`md/txt/log/csv` 与 `docs/` 下 `json`）里的本机绝对路径会被脱敏；源码、Ink、生成物、运行资产、测试和脚本**从不自动改写**，出现机器路径即阻断。
- 新引入私有记录标识（清理／回滚日志、私档清单、切换 journal、旧谱系目录名等）阻断，防止把新的私有操作记录混进镜像。
- 符号链接／特殊文件、路径逃逸、大小写重复、压缩私档、密钥模式、`>1MB` 未登记二进制一律阻断。
- 已登记例外仅 `public/art/ferry.png` 的精确字节；不允许新增或替换大图。
- 删除必须显式：计划里的 `removed` 每一项都要用 `--allow-remove` 批准并在提交说明写出理由；否则 `--apply` 拒绝，避免默默删除远端仅有的有效文件。
- 计划必须新鲜：`--apply` 复核源 SHA、公共 HEAD、计划摘要与干净状态；公共 `main` 被他人推进时停止并重新计划。

本轮（2026-10-18）起，公开镜像不再携带私有清理／切换记录。此前公开历史已携带的审计目录内容不回写、不改写历史；本轮以普通删除提交从镜像移除一份私有切换计划，理由写在提交说明中。

## 4. 隔离公共检出与冷验证

发布脚本在项目外临时目录 `git clone --single-branch --branch main` 公共仓库，并核对 clone HEAD 与 `ls-remote` 的 `main` 一致，然后：

```bash
npm ci
npm run build
npm test
git diff --exit-code -- story src/generated
git diff --check
```

公共检出缺少原典与 `docs/archives` 时，冻结基线缺席是**明确 warning／部分验证**，不代表完整字节已验证；源码或运行资源意外缺失必须失败。只有通过冷验证的同一份公共树才允许提交。

## 5. 普通快进发布

- 在隔离公共检出建 `codex/public-publish-<源SHA前7位>` 分支，普通提交（提交说明包含源 SHA、策略版本与计划 SHA-256）。
- 推送前重新 `fetch`，确认 `origin/main` 仍等于计划里的 `publicBefore`，且是本地提交的祖先；否则 `CONFLICT/BLOCKED` 停止，重新取最新 HEAD 重新计算差异。
- 推送：`git push origin HEAD:main`。禁止 `--force`、`--force-with-lease`、删除远端分支。

## 6. Actions 与线上验收

- 用 `gh run list --commit <新公共SHA>` 等到该 SHA 的 **Verify** 与 **Deploy site to GitHub Pages** 都到 `completed/success`；任一失败即报告失败，不写“已上线”。
- 下载该 SHA 的 Pages artifact，与线上 assets／sw／offline 清单比字节。
- 真实浏览器冷上下文打开作品库、推荐顺序和多个深链，实际点选、看图片解码、刷新与存档、基本移动布局；**HTTP 200 或仅触发 Actions 不算上线验收**。
- 记录：源 SHA、公共前后 SHA、plan SHA-256、两个 run URL、线上检查结论与未核边界。

## 7. 私有冻结基线

`tests/frozen-baselines.ts` 仅对明确排除的 `宋世江湖.md` 与 `docs/archives` 子路径允许缺席告警；缺失 `src/story/public` 等必须失败。告警合并进 `docs/evidence/v6/frozen-baselines-missing.json` 并显示在 CI summary。公开侧只能声称“部分字节验证”。`tests/historical-baselines.ts` 的旧字节预期不因公开排除而降低。

## 8. 体积与回滚

- 1GiB 目标同时计工作区、依赖、构建与 `.git`；`scripts/measure-project.py` 按同一口径报告逻辑字节与文件 allocation。不靠忽略截图或临时卸依赖造达标。
- 回滚优先普通 `revert` 或修复提交，保留发布历史；不改写公开历史、不删 reflog/objects。
- 外部权限／认证／服务故障时记录精确阻断点，不假报已推送或上线。
