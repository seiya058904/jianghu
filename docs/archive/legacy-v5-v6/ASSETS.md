# 图像与字体

实际使用内置 imagegen，两次调用：一次三视图设计概念，一次独立封面插画。没有使用 API Key、远程字体、网上拾取的插画或原典图片。

输出：`docs/evidence/design-concept.png`（1536×1024 概念板）与 `public/art/ferry.png`（1024×1536 生产插画）。概念板不是游戏截图；`cover-*.png`、`opening-1440.png` 等才是真实浏览器截图。

生产插画完整提示词：

> Historical-scene production background illustration for a Chinese literary wuxia game called Jianghu, story 渡口无碑. A refined Song landscape ink and muted jade watercolor painting on warm ivory rice paper #f4f0e6. Portrait 1024x1536. Misty river ferry in autumn, dark wooden awning boat moored lower right, one tiny warm orange lantern on a slim dock post, small dark tiled riverside tea houses right midground, distant layered mountains and willow branches at upper right. Painterly sophisticated book cover, delicate water ripples, tranquil melancholy, strong ink detail at bottom right dissolving to large completely empty pale ivory paper at top left and left third. No text, no letters, no logos, no border, no modern objects, no fantasy magic, no faces. Colors limited to ink charcoal, gray sage jade, ivory and one burnt orange lamp. Designed as standalone art to sit to the right of code-native large title typography, no overlays needed.

概念提示词概要：完整桌面封面、桌面阅读器、手机阅读器同板；暖纸墨绿朱色；竖排篇名、渡船山水、章节栏、见闻/回顾/存档/设置、细线选择按钮；禁止卡片堆叠、金色奇幻花纹与假指标。实际原始提示与调用结果保存在本次聊天工具记录，未伪造另一个美术方案。

图像原色展示，仅在封面边缘用透明蒙版融入纸色。正文图像位于左侧辅助栏，不盖在文字下面。朱印与箭头是代码原生 UI，不是用代码代替叙事场景画。

## v4 舞台生产素材

以上是旧篇素材记录，保留其原始提示与文件。本轮另实际调用内置 `image_gen.imagegen` 两次，生成小院场景和三人透明半身像图集；没有使用概念图替代游戏截图。

| ID | 文件 | 用途与归属 | 出场 |
|---|---|---|---|
| courtyard | public/art/courtyard.webp | 本轮 AI 生成，松风小院水墨场景 | courtyard、stones、veranda，采用不同视角裁切 |
| lin | public/art/cast.webp，左列 | 林见微，松风剑馆弟子 | 院门、试剑、廊下 |
| xie | 同图集，中列 | 谢行舟，同行剑客 | 入院后，离院仍可在场 |
| wen | 同图集，右列 | 闻铮，地方馆师 | 指点开始至收剑 |

原始 PNG 保留在 imagegen 返回的目录，绝对来源、完整提示词、透明背景请求与转换方式记录于 `docs/art-provenance.json`。生产 WebP 由 FFmpeg 编码：场景 q88、人物 q90；人物透明通道保留。`cast.webp.json` 和 `courtyard.webp.json` 为提示词旁车记录，工具对 WebP 使用旁车回退，没有伪称嵌入图片内部。

背景与人物预加载，素材失败仍显示场景底色、角色名、单条对白与回复；不退回长篇文章。所有姓名、台词和控制由 HTML 渲染。情绪使用聚焦、轻微姿态变化和文本提示，当前没有独立的脸部表情变体。

沿用旧篇字体回退，无外链字体或运行时 AI。旧 `ferry.png` 不改写；其完整来源记录保持在本文件上半部分。`docs/evidence/vn-*.png` 是真实浏览器截图。

人物图集生成时的英文临时工作名为 Xie Linchuan，后经原文名册核对发现同名，最终角色绑定为原创谢行舟。图像没有烘焙姓名，保留画像并更新 HTML 名称；原始生成提示不伪改。
