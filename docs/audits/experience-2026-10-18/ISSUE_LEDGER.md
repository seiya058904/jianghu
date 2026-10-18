# 体验审计缺陷台账 · 2026-10-18

输入基线 `9ae5e409d25cb983e530bc2475e256b73a039d59`；修复 RC `808954f12b16d443dc4e1bf964de9bfc565f79bc`。状态仅适用于已记录路径。P0 未发现；已确认 P1 一项，已修复。完整浏览器结果见 [最终验证](FINAL_VALIDATION.md)，不能用本表替代全量结果。

## X01 · P1 · 短横屏角色区被选项与对白挤没 · FIXED

- 复现：六旗舰任一现行篇，800×360，推进到第一个选择；分别用18/20/22/24字号。太华/龙门/王府/青石/争榜角色框只有10–12px高；密库此刻尚无人像，作为无角色对照。
- 预期：选择时仍看得见在场人物，选项和正文可读、可滚动、可点击。实际：背景和文字可用，人物几乎消失。
- 根因：`src/stage.css` 在306px舞台内仍叠放三个网格行，场景内的顶部留白又耗去人物高度。
- 修复：仅短横屏纪事非CG舞台改为左场景、右选项与对白；CG保留原规则。桌面/竖屏仍走原布局。没有替换原画。
- 证据：外部 `reviewA/viewport/*-800x360.png`；主代理 `landscape-before.png` / `landscape-prototype-ready.png`；正式构建 `rc-targeted4/experience-landscape-*.png`。同一太华首选人物高由约12px恢复到251px。
- 回归：`experience-regression.spec.ts` 六篇×纸本/夜读、24px，检查人物有效高度、每个选项中心命中与滚动、真实选择及刷新；另跑 `short-landscape.spec.ts` 的长正文/选择/结局。
- 完整回归发现的再修：旧《乾坤》`qk_slow_questions_3`单人特写被普通群像规则限宽210px，既有`heng-art.spec.ts`宽镜头断言失败。该轮完整运行立即中止并保留失败证据，未降断言。新构建显式呈现`data-camera`，单人特写保留608px画布并把人物画面锚到左侧；正面部与选项无互遮。最终候选及重跑结果见最终验证。

## X02 · P2 · 顾临川混合选择回扣制造未选追问和作证年份 · FIXED

- 入口：`dead-ranking.html`，`dr_living_benefit_8`；`dr_ask_night_first` → `dr_ask_own_words`。另外两种选延迟追问的组合也受年份误述影响。
- 预期：等他说“怕丢人”只回扣这一问；问沉默如何拖到十年不等于他十年时已作证。实际旧文称“第十年才开口”“你问的是那一日”。
- 根因：`story/dead-ranking-case.mjs` 用两个独立选择的合取决定共用else，同时把顾的恐惧叙述写成事实年份。
- 修复：保留原条件、拍数与所有CID/VAR；else按`dr_gu_own_words`分别回扣，不更动十八年旧案和如今作证。提交 `b078124`。
- 回归：四象限从头选CID到结局；浏览器真实旧档恢复到混合回扣、下载原始备份、刷新；两代旧编译字节逐拍恢复并拒绝篡改。
- 证据：`reviewB/dead-ranking-four-quadrants-baseline.json`、`dead-ranking-four-quadrants-final.json`；正式构建 `experience-dead-ranking-corrected-{root,subpath}.png`。

## X03 · P2 · 梁照水未在场的师父私谈缺视角说明 · FIXED

- 入口：`luhua.html`，`lh_own_sleeve_3–6`。五十一岁祭祖较艺后，直接进入孟与沈的私谈。
- 预期：明确读者看的是NPC旁叙，不能把私谈当梁当夜亲历。实际：旧句未交代知情或视角边界。
- 修复：`story/luhua-seven.mjs`原第三拍补“那夜两位老人的私谈，你并未在场”，不虚构后来转述者，不增加拍或改对话。提交 `b078124`。
- 回归：保留“那就是他的”及两师关系；逐拍真旧档恢复、原槽原字节和原始备份可导出，根/子路径浏览器复验。编辑独立复核认为无新增正典事实。
- 证据：`reviewB/final-review.md`、`experience-luhua-corrected-{root,subpath}.png`。

## X04 · P2 · 显式重下离线包仍沿用稳定URL旧图 · FIXED

- 入口：太华设置→下载本篇离线资源。受控复现先把旧部署标记写入已缓存的`art/v6/taihua-guest.webp`，再点真实下载按钮，断网读取仍得到旧标记。
- 预期：用户明确下载应取得当前整包字节；失败不能报成功。实际：旧逻辑仅补缺失资源，已有图被跳过。
- 修复：`public/sw.js`用`no-store`原子刷新本篇完整列表和公共壳；保留其他作品。缓存升为0.2，断网缺项可回读精确旧0.1缓存，未删除任何旧包。
- 回归：根/子路径真实SW把注入的旧图修复为磁盘精确字节；旧缓存独有资源仍离线可取；已有HTTP/非法清单/限额失败断言保留。提交 `c2c626f`。
- 限定：这是受控旧缓存复现，不声称线上曾经发生该故障。

## X05 · P2 · 键盘进入选择时焦点掉到body · FIXED

- 入口：用Tab聚焦“继续”，Enter推进到选择。`syncControls`禁用当前按钮，旧实现随后读取activeElement，导致失去原焦点位置。
- 修复：`src/player.ts`先记住对白内的焦点，在180ms重复输入保护期后聚焦首个可用回复；用户移开焦点时不抢回。长按Enter/空格的repeat事件阻止原生按钮连选。
- 回归：按住Enter跨过锁释放仍不选择；焦点落到回复，Tab/Shift+Tab可切换，松开后空格能真实选中。正式定向42项均通过。提交 `e34ea6e`。

## X06 · P2 · 两份jade规格写相同12张截图 · FIXED（工程证据）

`jade.spec.ts`与`jade-editorial.spec.ts`的配篇封面截图路径相同，串行也会覆盖，跨worker更难归属。仅把历史版规格改为`jade-archive-paired-cover-*`；保留两份断言。4 worker隔离试跑14/14通过，原路径不删除。提交 `c2c626f`。

## X07 · P2 · 审计命令覆盖旧证据目录 · FIXED（工程证据）

V7脚本及独立审计原先直接写仓库旧审计输出。V7现复用`evidencePath`，独立运行时/图片扫描尊重`JIANGHU_EVIDENCE_DIR`；本轮都输出到项目外，旧报告保留。提交 `7367852`。

## 保留建议与未验证

|编号|等级/状态|具体判断|
|---|---|---|
|R01|P3 / DEFERRED|北枪`nq_last_tea_1`“你问现在到哪，他说入化了”略省主语；上下文仍可理解，未为此改写已冻结RC。|
|R02|P3 / DEFERRED|照水刀晚年战绩组、七问的专名和榜纸资料篇有阅读负荷；保留差事/知情边界，后续真人试读再决定删减。|
|R03|P3 / ACCEPTED|800×360设置面板内部滚动较多；当前控制可达，未为增加首屏信息缩小点击区域。|
|R04|SUSPECTED / NOT CONFIRMED|争榜`dr_case_read_10`在谢视角的答话略似主持人口吻，但相邻选择允许向旁人解释，证据不足，未修改。|
|R05|EXTERNAL NOT VERIFIED|真人试读、真实Android、Safari、Firefox、读屏器、长期性能与现场INP。|
|R06|P3 / DEFERRED|旧刀CG横屏24px正文可在独立阅读区滚动读完，但首屏滚动提示不明显；已实际滚动78px，不属于文字丢失。见视觉复验。|

确认且未修复的P0/P1：0/0；这不是所有未访问分支无缺陷的保证。
