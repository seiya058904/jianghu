# v5当前架构

本轮按v5扩展，下方v4说明是历史。TypeScript/Vite/inkjs保留，无新依赖、后端、账号或在线AI。

作者源 -> 22个分章/插曲Ink片段与合并campaign.ink -> 标签验证、Compiler -> generated/campaign.json -> 参数化VNRuntime -> 共用player/vn-ui/stage。22是文件数，实际序+七章+终+后日，中段两章各有水陆版本。

catalog合并不变的v4 presentation与新campaign-catalog。人物ID独立于画像kind/archetype/variant；resolvePortrait仅处理画面，无剧情条件。4位重点人物有图片表情，其余用默认图与情绪提示。静态审计和120次回放检查合法ID、在场说话人与同台画像冲突。

运行时增加可选contentVersion与CG状态，默认实例仍是v4。restoreVN只有明确传入新作品内容/版本才读新档；默认保留半步冻结旧源迁移。CG随scene/cast/mood/phase重放核对，不同scene清CG，CG时隐藏普通立绘，输入不等长动画。

index为潮生，half-step为半步，legacy为阅读器，gallery为素材检视。edition按入口选内容和前缀；章节是只读历史筛选，不改Ink。存档协议见CONTENT_MIGRATION。

生产构建输出offline-manifest；load后后台缓存全产物，安装成功后离线。首屏只预载首场/首人；美术WebP约6.91MiB。无Git，不能声称clean/ahead-behind；用初始哈希与保留路径的源副本核验。

---

# v4历史记录
# 对话架构审计

本轮以用户提供的 v4 为适用委托。v3 的全文索引、四案选材和长篇时长要求已被 v4 明确覆盖；一致性、数据保护和真实浏览器验收仍有效。

## 改造前

`Session.read()` 连续调用 Ink `Continue()`，直至选择边界；`reader()` 一次渲染整组 `paragraphs`。1440×900 浏览器实测开场稳定帧文档高 1572px（首次转场中为 1576px）、七段正文、两项选择，需页面滚动。见 docs/evidence/before-dialogue-rebuild-1440.png。

Ink 条件、原生序列化、确定性重放校验和资料面板可复用。原目录没有 `.git`，无法判断 Git 差异或提交状态。编辑前保存原源码 ZIP 和 SHA256 清单；不创建另一个同名项目。

## 新数据流

`story/duel.ink` → Ink 编译与元数据校验 → `src/vn-runtime.ts`（单条对白、舞台状态、Ink 选项）→ `src/player.ts`（输入与演出状态机）→ `src/vn-ui.ts`（舞台、角色、对白框与选择）→ `src/stage.css`。

脚本以 `beat`、`scene`、`cast`、`speaker`、`mood`、`action`、`prompt`、`fact`、`ending` 标签表达演出；分支、观察、关系、承诺仍由 Ink 变量和 divert 管理。UI 不实现剧情条件。每次 `Continue()` 只抵达一个自然对白或动作，未处理的选择阻止推进。

存档记录 Ink 快照、推进/选择命令、当前演出状态；恢复时确定性重放并比对，防止重复结算和不可达数据。打字/动效恢复到安全完成态。历史只读。

最终内容版本为 `half-step-1.0.1`。角色命名核对发现开发稿“谢临川”与原作华山青序第三撞名，现为原创“谢行舟”。保留 `src/generated/duel-1.0.0.json` 及修改前源码 ZIP：读取开发稿档时先用冻结旧内容核验原生状态，再用原命令重放新内容，确认世界变量和当前演出位置一致。首条新进度写回前另存旧自动档原始备份，手动槽原字节保留，备份可在存档面板导出。

## 原内容和数据边界

`story/main.ink`、`src/runtime.ts`、`src/storage.ts`、原知识数据保留；`legacy.html` 和 `src/legacy-main.ts` 保留旧篇完整阅读器。旧键 `jianghu:v1:*` 与新键 `jianghu:vn:v2:*` 隔离。新篇不会覆盖旧自动档、手动槽、上一程、已读结局。新存档面板提供旧档原始导出和旧篇入口；旧档仍由旧运行时加载。无法把旧篇剧情位置迁移为新篇位置，明确展示这一边界。

## 取材范围

实际阅读《江湖总叙》《武途深浅》《榜谱旧制》《天下门庭》《江湖武会》及《六门旧会·太华试序》开篇、制度段落，并阅读《王府旧事·第十二席》的“别人看输赢，他看脚”段落。没有宣称全文审读或完成全量故事索引。

《半步之约》是华阴地方剑馆的原创旁支：人物和事件不对应正录中的六门名次。借用观步、看疲态、同招异势和局部较艺的人物互动逻辑；院中切磋不是六门会武，没有报名晋级或榜位奖励。

