---
name: Jianghu
description: 以人物对白与玩家回应为中心的宋世江湖舞台
colors:
  paper: "#f4f0e6"
  ink: "#293b36"
  cinnabar: "#a54735"
  muted: "#53604f"
  line: "#b8b9ac"
  paper-night: "#222b28"
  ink-night: "#e3e0d5"
  cinnabar-night: "#d19074"
  muted-night: "#aaa99b"
typography:
  display:
    fontFamily: "Noto Serif CJK SC, Source Han Serif SC, Songti SC, SimSun, serif"
    fontSize: "clamp(54px, 6.4vw, 90px)"
    fontWeight: 500
    lineHeight: 1.35
    letterSpacing: "0.08em"
  body:
    fontFamily: "Noto Serif CJK SC, Source Han Serif SC, Songti SC, SimSun, serif"
    fontSize: "var(--reading-size)"
    lineHeight: 1.65
    letterSpacing: "0.025em"
  name:
    fontFamily: "Noto Serif CJK SC, Source Han Serif SC, Songti SC, SimSun, serif"
    fontSize: "21px"
    fontWeight: 500
spacing:
  compact: "8px"
  regular: "16px"
  panel: "30px"
components:
  button-primary:
    backgroundColor: "{colors.cinnabar}"
    textColor: "#fff8ec"
    padding: "12px 24px"
    height: "50px"
---

# Design System: Jianghu

## Overview

保留原实现的米纸、墨绿、朱色与宋体韵味；主体验由读卷转为看人物、接话与行动。舞台采用同一风格的水墨小院与人物半身像，所有台词、姓名与按钮是 HTML。

本轮依据用户 v4 已授权重构主界面。本文件合并新舞台规则，旧阅读器规格仍用于 legacy.html；没有更换品牌或字体来源。

## Colors

米纸承担稳定的文字表面，墨绿承担正文和品牌，朱色标记说话人、焦点和主要动作。新舞台次要文本采用 #53604f；旧篇原令牌 #71766a 保留。夜色使用原 #222b28 与 #e3e0d5，主按钮在浅朱背景上使用深色字，不沿用浅色前景。

## Typography

Jianghu 字标保留 Georgia / Times New Roman 的斜体；人物和对白保留原 CJK 宋体回退，不请求外部字体。对白默认 20px，可选 18/20/22/24；桌面行高 1.65，手机 1.6。桌面人物名 21px、手机 19px；回复桌面 17px、手机 16px；普通工具入口桌面 14px、手机 12px。

标题桌面 clamp(54px,6.4vw,90px)，手机 51px。标题不承担长篇故事介绍，人物、现场短句和回复承担主要阅读重心。

## Layout

顶部工具栏桌面 76px，手机 64px，矮视窗 54px。游戏舞台使用余下的动态视窗高度，按人物场景、回复、对白分区。桌面对话框最大 1100px，回复区最大 650px；手机两侧各留 14px。

演员一至三人同场，聚焦说话人，其他人轻微缩放/降饱和。回复区承接台词；对白在固定位置替换。正常主流程不依赖页面滚动，资料和极矮视窗采用面板内滚动。720px 与 600px 高度断点调整布局，底部预留安全区。

旧篇规格保留：书卷阅读版心约 680px、左侧已读章节目录、20px / 1.95 正文；手机隐藏章节常驻栏。该布局只属于旧篇入口，不用作新舞台降级。

## Elevation & Depth

场景和人物图片承担空间；米纸文字区降低背景干扰，细线区分操作区域。浮层使用原有方向的柔和偏移阴影，对话框阴影很轻；不增加数值卡片或商城式容器。模态面板用于暂停游戏后的存档、设置、回顾和见闻。

## Shapes

沿用方整边界、细线和朱印。箭头使用原生 SVG，表情信息通过短文字、聚焦和轻微姿态变化表达。实际素材透明轮廓保留，不以几何图形假造人物轮廓。

## Components

- Stage：背景可用时显示场景，没有素材也有底色、角色名、对白与选择。
- Character：画像文件、裁切位置、尺寸方式由人物清单决定；扩写人物无需按 ID 修改 UI。
- Dialogue：姓名、语气、完整文本的稳定占位、可复制文本、继续控制；读档完整显示当前句。
- Choice：真实按钮，常规触控高度至少 49px，矮视窗 44px；hover、键盘焦点和短暂输入锁状态明确。
- Tools：见闻、回顾、存档、设置为文本入口，移动端继续可见，使用原生 dialog 保护暂停与焦点。
- Settings：字号、纸本/夜色、文字速度和減弱动态效果；优先可读与可操作。

## Do's and Don'ts

保留米纸、墨绿、朱色和字体识别；维持角色、台词、回复的关系。新增内容使用 Ink 与素材清单，不把剧情条件写进 UI。

不要将长文拆句后重新追加成文章；不要把台词和按钮烘焙进图；不要用自动/快进代替玩家作答；不要用裁切隐藏溢出正文。动态效果尊重系统设置。

## v5增量与实测修正

沿用既有视觉世界，不更换品牌或字体。新作背景以青蒲渡与水陆场地为主，角色用透明单人WebP，不使用v4多人图集。12位核心、8组NPC及额外变体统一使用contain与底部锚点；4位重点人物有实际表情编辑图，未知映射回默认。

手机三人同屏保留1/3宽度，姓名牌用max-content并限制在角色宽度内，不让绝对定位的可用半宽把名字挤成竖排。封面右侧人物避开主要按钮脸部区域，旧篇链接有纸色底保证对比。CG隐藏普通演员，真实姓名/对白仍在稳定面板。

本轮执行过一次Impeccable机械检测：主要为已有字体/字号/色值未全部出现在机器可读令牌中的提示。Georgia已在原DESIGN正文作为Jianghu字标确认；没有为清警告擅改既有字体、颜色或修复无关sidecar漂移。其余视觉判断以真实桌面/手机截图为依据，非第三方审美通过声明。
