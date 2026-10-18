# 龙门假败句修复：独立真实浏览器复核

2026-10-18，结论 **PASS（本次实测构建、全新开局到贺门认输这一段）**。Browser plugin not available，使用仓库已有 Playwright / Chrome。未运行编译，未改源码或 DOM；仅预置产品阅读设置（速度0、减弱动效、字号20）。没有注入存档、作品进度或剧情变量。

| viewport | 实际入口与动作 | 前因 / 修复拍 / 后果 | 实测结果 |
|---|---|---|---|
| 1440×900 | 作品库→选篇→现行龙门→新开局→逐次真实页面按钮 | lm_sore_1 罗平 → lm_sore_14 新句 → lm_fortyseven_2 贺门认输 | 110拍 / 109次按钮点击；两个指定CID实选；PASS |
| 390×844 | 同上，独立新context全新开局 | 同上 | 110拍 / 109次按钮点击；两个指定CID实选；PASS |

选择 `lm_route_guest` 进入外客线，再选择 `lm_deliver_exact` 照原帖递交；完整逐拍文本与点击CID保存在 `browser-longmen-results.json`。两档均先实际显示“与罗天庆百余合后同时收招，记平”，再由石惊川说“下一封帖，也请你送。看见我只同罗先生打平，还肯照原话递么？”，之后才搬架进贺门，四十七招后石说“晚辈输了。只是没有料到差这样远”。已行进的110拍没有出现旧假败句。

六张原始截图全部通过 view_image 实际目视：桌面单人石的凝神姿态焦点清楚，三人贺门场面角色与姓名可读；手机背景保留场所、人物缩小但完整可见，修复句折为两行，未遮挡正文或继续按钮。三图序列的时间、地点转换与胜平败顺序一致。未见文字截断、横向溢出或错误覆盖层。两档 console warning/error、pageerror、HTTP≥400均为0；目标后末场背景/立绘浏览器 decode 成功。移动viewport模拟不代表真机验收。

必要小图均≤800px宽，位于 `docs/evidence/independent-final/browser-longmen-{1440|390}-{prior-tie|fixed-line|he-actual-loss}.webp`；六张PNG原图、脚本与原始JSON位于项目外 `../Jianghu-independent-20261018/browser-longmen/` 和 `../Jianghu-independent-20261018/independent-opening/browser-longmen.mjs`。每张原图与小图SHA登记在结果JSON。

本轮绑定：

- 实测时 Git HEAD 是 `dd81ccbc3fea2486b2978b7c5a7e65e1cbfee855`，含尚未提交修复的工作区，**不是该HEAD干净树验收**。
- `src/generated/longmen.json` SHA256：`477d6c53d45dd8485c28fd9dcd9ca6027a52004d61790aca7d5347f663f1ec89`。
- 实测 served longmen HTML 与磁盘 dist 逐字节相同，SHA256 `9940b7b84f871051977f96ba02aeb51f8c3595d8ee1ecaa8e999e1961258e717`。
- HTML直接引入的7个 JS/CSS 均逐个请求与本地 dist 字节比较；完整URL与SHA在JSON。其中 player-B9QRtwzd.js SHA256 `50dc2bd81df96f70fb9c784899b283ededf9effcc0fbf8c5db63ac53282ec1d2`。未声称已比较所有动态网络资源。

父代理随后通知将收窄普通存档备份范围并重建dist。本报告保留这次实际构建绑定，最终commit/dist只能在核对后另补映射；不能把此旧player哈希当新构建验收。**旧存档迁移本轮 NOT VERIFIED**：父代理另行负责真实旧save迁移浏览器验收，本轮全新开局证据仅验证龙门修复文本与因果顺序，不证明迁移是否保留旧raw或重演。
