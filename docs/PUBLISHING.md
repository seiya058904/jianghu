# 安全公开发布流程

作者完整仓库与公共main是不同谱系。公共main在起点为a6e5d5947ce2d06c6c2ab83e1cfd515c95191959；此值只是2026-10-18基线，每次发布必须重新fetch。**更新不需要强推**：从远端当前main继续正常增量历史。

## 1. 发布前提

明确用户授权；作者RC构建、全部单测/编辑契约、完整浏览器套件和相关视觉检查通过。记录源提交、产品文件manifest、dist哈希和真实退出码；失败保留日志。源变更后重新冻结验证。

本轮审计与当前结论见 [独立终审](audits/independent-final/BASELINE.md)及[发布验证](audits/independent-final/RELEASE_VALIDATION.md)。未看到云端最终成功和线上实走前不得称已上线。

## 2. 允许与排除

scripts/public-snapshot.py只读取指定Git提交中的追踪对象；先按明确的源码/资源/测试/文档扩展名与目录构造候选清单，再排除以下项。最终逐文件plan必须人工审查，脚本不是通用保密判断器。

- 排除宋世江湖.md全文、docs/archives、.workbuddy、.impeccable、候选原图目录、.env、私钥、ZIP/bundle备份和海量原始截图。
- 保留当前源码、生成数据、历史故事兼容源、运行美术、锁文件、测试/CI、必要文字证据和精选小WebP。
- 仅从已验证RC取源，不将未追踪临时文件复制进去。
- 文档与文字证据中的本机绝对路径在公共一侧脱敏；不重写可执行源码、冻结预期哈希或剧情字节。隐私扫描必须同时检查文件名、正文、压缩包和秘密模式，不能只查原典文件名。
- 不新增LICENSE，不把公开可读视为额外再许可。

既有公开运行素材 `public/art/ferry.png` 为 2,701,831 字节。仅在源文件 SHA-256 等于脚本登记值、且与当前公共检出的同路径逐字节相等时保留；这不允许新增或替换大图。其它超过 1,000,000 字节的二进制继续阻断。

## 3. 隔离检出与差异预览

先核author工作区、HEAD、原典哈希、remote URL、认证用户和远端当前main。保留完整历史bundle与必要私档备份，不在作者工作区切孤儿分支或清索引。

在项目外创建新的公共克隆，基于刚fetch的main建codex/前缀发布分支。克隆目标须是全新明确路径，不能覆盖已有用户目录。

示例参数须替换为本次真实RC和隔离路径：

```bash
git clone --single-branch --branch main https://github.com/seiya058904/jianghu.git <public-checkout>
git -C <public-checkout> switch -c codex/independent-final-publish
python scripts/public-snapshot.py --source-ref <AUTHOR_RC_SHA> --destination <public-checkout> --plan <external-plan.json>
```

plan记录源SHA、发布前SHA、新增/变更/移除清单、每文件字节与SHA、脱敏项、排除项和总量。检查原典、私档、秘密、候选原图、超大二进制、符号链接、未知新增文件和旧公开追踪残留。差异可接受后才用完全相同参数加--apply。

脚本只在干净公共Git根目录应用明确清单；只移除隔离公共检出里不在允许集的已追踪文件，不触碰作者完整仓库。plan必须在两个检出之外。

## 4. 公共冷检出复验

在公共检出中执行：

```bash
npm ci
npm run build
npm test
git diff --exit-code -- story src/generated
git diff --check
```

运行必要浏览器冒烟/资源解码，确认相同源码构建的资源与作者RC一致。私有冻结基线缺席必须产生可识别warning和missing清单，其余验证正常通过；公开不能声称证明了完整原典或私档字节。

仅将已审查文件和必要日志加入公共提交；对被.gitignore忽略的文字证据定向git add -f，不能无差别强加原图和私档。

## 5. 普通快进发布

提交以当前远端main为祖先。推送前再次fetch并检查远端没有被他人推进，然后普通推送：

```bash
git -C <public-checkout> push origin <publish-branch>:main
```

非快进拒绝时重新fetch，在隔离检出合并/重做同步，不加force或force-with-lease。不能把作者master直接推到公开main，不能替换远端历史。

保留作者RC、公共前后SHA、同步manifest checksum和差异。两个SHA不同是策展镜像的正常事实。

## 6. Actions与线上验收

在**确切公共SHA**上查看Verify与Deploy site to GitHub Pages直到最终success或确定失败。发布workflow自身执行完整单测/编辑契约及生成物一致性门禁，验证失败不上传部署。

下载该SHA的Pages构建artifact，比较正式线上assets/sw/offline清单字节。真实Chrome冷上下文打开作品库、推荐顺序和多个深链，实际点选并检查控制台、图片解码、移动布局、根/子路径离线及旧缓存切换。HTTP200、仅触发Actions、仅本机build都不是上线验收。

### 6.1 私有冻结基线

tests/frozen-baselines.ts仅对明确排除的宋世江湖.md和docs/archives子路径允许缺席告警；缺失src/story/public等必须失败。告警合并入docs/evidence/v6/frozen-baselines-missing.json并显示在CI summary。

tests/historical-baselines.ts针对本轮精修涉及的七份历史身份使用真实起点Git字节与严格来源manifest，先检查现行路径仍在。原预期清单不改，现行剧情行为另验。作者本机完整断言；公共因有意排除私档为部分字节验证。

## 7. 瘦身与恢复

历史PNG已逐件复制、验SHA、移出工作区并普通停止追踪，未删Git历史。[归档索引与恢复](evidence/README.md)。完整原图和Git bundle在作者项目外保留，公共镜像不携带。

1GiB目标同时计工作区、依赖、构建与.git；scripts/measure-project.py按同一口径报告逻辑字节与文件allocation。仅移走截图不会回收历史对象，未达标就明确BLOCKED/FAIL。历史改写、无可恢复删除、替换作者库、强推、删reflog/objects仍需单独授权；不能为体积数字擅自执行。

回滚优先普通revert或修复提交，保留发布历史。外部权限/服务故障阻断时记录精确点，不能假报已推送或上线。
