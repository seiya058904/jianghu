# V6 美术来源与制作记录

工具：内置image_gen；源文件保留在Codex生成目录，正式引用资源复制/转换到public/art/v6。未使用CLI/API或新增依赖。图片完成不等于剧情/视觉最终通过。

## taihua-night.webp

源：`[author-local-path]`。用已安装ffmpeg等比例转WebP，1536宽，quality84；无图像内容修改。已目视确认空院、夜月、松枝、灯及汤碗，没有文字或人物。实际接入th_night与太华封面。

完整生成提示：

> Use case: historical-scene. Asset type: production background for Chinese wuxia visual novel Jianghu, Taihua internal sword gathering. Wide 3:2 landscape illustration, no people, no writing. A secluded Huashan mountain guest courtyard at night, historically grounded premodern Chinese architecture, low dark timber eaves, stone flagstones wet with dew, one wooden soup tray with plain bowls by the near wall, a small warm paper lantern under a roof, a single pine leaning across distant moonlit mountain silhouettes. Open central stone courtyard for foreground character sprites, foreground bottom third visually quiet for HTML dialogue overlay. Finely drawn muted ink-and-watercolor narrative illustration, tactile brushwork, desaturated jade green, ink charcoal, warm ivory accents, restrained cinnabar lantern cord. Atmospheric depth and clear readable structure. No fantasy glowing energy, no pagodas dominating, no weapons floating, no text, no logo, no UI, no watermark. Final image intended for game integration.

## 临时画像边界

沈照微：th-shen.webp、th-shen-amused.webp、th-shen-intent.webp。默认、含笑、凝神，后两张是对同一源图做identity-preserve编辑；已目视核对发髻、脸、手位、衣服与构图一致。源文件及完整提示见th-shen-prompts.json。转560×840 WebP quality86，保留透明alpha（ffmpeg检验alpha最小0/最大255）。实际剧情neutral/amused/intent/sharp调用，截图taihua-shen-*。

霍停云：th-huo.webp。独立新画像，已目视；完整提示和源文件见th-huo-prompts.json。两表情编辑正在制作，未接入前不计三状态。

太华首稿大部分画像暂复用v5文件，chronicle-catalog.ts明记kind:template，不能计新增专属立绘。两名无名长者同屏重样等问题尚待生产画像替换；未将首稿称为视觉完成。最终需≥20独立身份、≥16三图状态、≥12原型、≥24独立环境、≥10CG全部实际引用并检查。


2026-10-16后续：第十二席本人新增1张可复用来信CG，3/4入场、5待选前退出，保留V2前缀并严格兼容三拍旧档；七个作品离线包主脚本误归属已复现修复。全量142单测/构建通过，18项冷缓存根/子路径离线启动、两本人全程与保存/七尺寸专项通过；主批26通过/1夹具失败已单独修正重过。四核心组CG0及全部文学/身份/最终交付余项仍开放。详见[制作与验证边界](ROYAL_LETTERS_CG_AND_OFFLINE.md)。


2026-10-16美术清单补齐：委托指定的[ASSET_MANIFEST_V6](../art/ASSET_MANIFEST_V6.md)现覆盖public/art全部141张图片（94张V6），逐项含人物/场景、既有来源与提示、尺寸/alpha/字节/SHA、时期标签、使用节拍和QA边界；96张有已有提示记录，45张继承图原提示明确缺失，9条来源仅留相对PNG名，5条虽有提示但未留原PNG名；不推测绝对目录。33个现行/归档VN入口各168路径采样，其中32个有配套Ink的入口声明拍无未访；冻结V5仅记录JSON运行范围；140张被运行引用，ferry为旧引擎静态引用。141张各在根/子路径返回精确构建字节并被Chrome解码，2项浏览器检查通过。本轮未生成或编辑图片，旧来源文件不改。技术清单不能代替人物身份、动作/CG、取景、火/伤态、文学或最终审美验收。


2026-10-16一剑两脉双册演出增量：谢知白同一身份三图，双册共用1张普通书案CG；token逐拍近景与司马“这只是我”单人镜头实际接入，下一拍复原。未改正文/选项/变量，保持第一册v1与第二册v2前缀，以冻结稿严格校核受影响旧档并留原文备份。150全仓单测/构建，四条实际UI全程，最终10专项（含145图根/子字节解码、两册新页离线冻结稿迁移）通过；首批13过/1视口夹具失败已修复重测。当前27独立专属、18同龄三态、30背景、15CG；三个核心组仍CG0，其余身份、火/伤态、文学、总体验收及交付仍未完成。见[本批素材、兼容与实测边界](SWORDS_REUSABLE_ART_AND_COMPAT.md)。


2026-10-16海路双册增量：共用1张无人物、无地理与事故标记的索具CG（松绳/帆布/木板），分别在船位交缆与外院练习实际显示两拍。沧鹤两种问法、外院教头单人回复采用现有逐拍近景，下一拍恢复；人物模板不计新身份。两册原v1前缀/正文/选择/世界变量保留，冻结稿严格校核旧快照，原自动档备份与槽/上一程原文保留。155全仓单测/构建、四条实际UI全程及16浏览器专项、146图根/子字节解码2项通过。当前两个核心组仍CG0，身份/年龄/风灾/文学/终验与交付继续开放。见[具体素材与兼容边界](SEA_REUSABLE_RIGGING_AND_COMPAT.md)。
# 山河璧双卷可复用器物近景（2026-10-16）

新增最终资源 `public/art/v6/cg-empty-box.webp`、`public/art/v6/cg-grain-measure.webp`，均使用 built-in image_gen，原始PNG保留。空匣初稿含日光窗景，经过一次内置编辑移除窗、花瓶等房间识别元素；初稿未注册为游戏资产。最终只作WebP格式转换，没有外部图像合成。完整三次实际提示词及原图/参考关系、文件字节与SHA见 `docs/evidence/v6/jade-reusable-art-assets.json`。用途与当前触发见 `JADE_REUSABLE_ART_AND_COMPAT.md`。二者均无人物、文字、独有玉形与皇家标记，以便改剧情后继续复用。它们不替代真假玉的必要外观区分或主动武戏。
# 司马衡身份与共用茶席（2026-10-16）

最终6张司马衡立绘（两年龄各3常用神态）及1张普通茶具CG，全部使用built-in image_gen；早年专注/浅笑的两张初稿发现黑色底块后，使用内置编辑修复透明，最终资源带v2后缀，旧WebP原字节移入docs/archives/heng-transparency-drafts，原PNG继续保留。9次实际提示词、参考图链与最终字节/SHA在 `docs/evidence/v6/heng-art-assets.json`；修复调用另见 `heng-transparency-repairs.json`。后处理仅人物图等比缩放1024×1536→512×768、保留alpha并转WebP，茶具只作格式转换。图内不固定门派、事件或特殊表达寓意。使用、旧档和未完成边界见 `HENG_IDENTITY_AND_TEA_V2.md`。

# 通用儿童立绘（2026-10-16）

新增1张`public/art/v6/npc-child-boy.webp`，built-in image_gen单次生成，原图1024×1536 RGBA保留于默认生成目录，并按原字节另存项目归档`docs/archives/reusable-child-source/generated-child.png`。仅等比缩小至512×768及WebP转换，alpha原样保留，没有抠图、补画、重绘背景或修改人物像素。完整实际提示、原始路径、源/成品哈希和尺寸在`docs/evidence/v6/reusable-child-art-assets.json`。

这是约12岁男童的空手常态模板，无绳、伤、兵器、门派字样、情节或特殊表情，加入已有youth原型的儿童变体，不增加原型或专属人物数。当前仅接归潮岛V2阿岑儿童外观；旧稿原child与17岁/成年/晚年图保留。85%贴底是舞台取景，不是图像编辑；同屏不可让两个不同孩子共用此脸，亦不能拿它冒充专属主角的完整多年龄身份。
