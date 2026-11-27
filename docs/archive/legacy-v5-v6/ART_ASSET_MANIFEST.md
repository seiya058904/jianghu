# 实际美术清单

本轮内置 imagegen 生成、压缩并接入：12位独立人物，4张保身份表情编辑，8组NPC原型及4张额外变体，12个背景，4张CG，共44张WebP。独立人物不是从一张多人图裁切。

素材总计 6.91 MiB；细项分辨率、格式、体积见 `docs/evidence/v5-asset-audit.json`。生成来源与可用的逐字prompt见 `docs/art-v5-provenance.json`。早期批次prompt未全部另存逐字副本，在对话工具调用中可追溯，不能把摘要称为逐字原始记录。

|文件|分辨率|字节|
|---|---|---|
|public/art/v5/quay.webp|1440×810|267876|
|public/art/v5/hall.webp|1440×810|288214|
|public/art/v5/inn.webp|1440×810|219734|
|public/art/v5/ridge.webp|1440×810|353214|
|public/art/v5/bridge.webp|1440×810|311608|
|public/art/v5/reeds.webp|1440×810|217286|
|public/art/v5/rainboat.webp|1440×810|192934|
|public/art/v5/workshop.webp|1440×810|234918|
|public/art/v5/arena.webp|1440×810|261954|
|public/art/v5/levee.webp|1440×810|283718|
|public/art/v5/storm.webp|1440×810|254768|
|public/art/v5/dawn.webp|1440×810|260388|
|public/art/v5/zhaoli.webp|560×840|135950|
|public/art/v5/zhaoli-intent.webp|560×840|108826|
|public/art/v5/qiao.webp|560×840|132034|
|public/art/v5/qiao-uneasy.webp|560×840|103954|
|public/art/v5/su.webp|560×840|96528|
|public/art/v5/su-amused.webp|560×840|81522|
|public/art/v5/lu.webp|560×840|144380|
|public/art/v5/lu-intent.webp|560×840|118616|
|public/art/v5/han.webp|560×840|127576|
|public/art/v5/ling.webp|560×840|129338|
|public/art/v5/xu.webp|560×672|96058|
|public/art/v5/pei.webp|560×513|73188|
|public/art/v5/yan.webp|560×840|101920|
|public/art/v5/rong.webp|560×672|107840|
|public/art/v5/du.webp|560×840|161530|
|public/art/v5/he.webp|560×840|105992|
|public/art/v5/npc-youth.webp|560×672|101430|
|public/art/v5/npc-merchant.webp|560×840|107838|
|public/art/v5/npc-clerk-male.webp|560×840|103164|
|public/art/v5/npc-porter.webp|560×840|131180|
|public/art/v5/npc-elder.webp|560×840|127956|
|public/art/v5/npc-merchant-male.webp|560×672|97520|
|public/art/v5/npc-monk.webp|560×672|80642|
|public/art/v5/npc-boatwoman.webp|560×672|88670|
|public/art/v5/npc-elder-male.webp|560×840|119642|
|public/art/v5/npc-traveler.webp|560×672|113352|
|public/art/v5/npc-youth-blue.webp|560×840|98002|
|public/art/v5/npc-clerk.webp|560×672|65088|
|public/art/v5/cg-rescue.webp|1440×810|273350|
|public/art/v5/cg-storm.webp|1440×810|197818|
|public/art/v5/cg-dawn.webp|1440×810|314008|
|public/art/v5/cg-quiet.webp|1440×810|249610|

绑定：人物见CHARACTER_ROSTER；背景见src/campaign-catalog.ts的sceneId；`rescue`用于水路旧桩湾救人，`storm`用于终章松绳，`dawn`用于六类后日，`quiet`用于两类有代价的后日。CG状态写入保存快照并重放核验，切到不同scene时清除。

四位重点人物有图片表情变体；其余情绪是姓名牌与姿态提示，未假称都有绘制过的表情。未采用的照鲤候选仍在工具默认输出，不计入交付。
