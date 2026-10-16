# v5扩写入口

正式作者源为story/campaign/author.mjs和interludes.mjs，每个part写明确对白。辅助器仅生成标签与结点内编号，不按句号切正文、不自动填话。构建重建分章和合并Ink，不能只修改生成.ink。

新增人物：在campaign-catalog登记永久ID、姓名、role、detail、portrait。专属用dedicated；普通人选固定archetype/variant/file；moods映射额外图，未映射回默认。素材放public/art/v5，不在Ink写URL。新增NPC无需改UI或存档核心。用gallery.html检视，再跑node scripts/audit-v5.mjs。

新增场景在campaignScenes登记name/time/art。每节拍至多3人同台，辅助器挪入新说话人，仍需看站位与进出是否自然。cg可用rescue/storm/dawn/quiet/none；切不同scene清CG，同scene继承，提前退出写cg:none。

part(id,scene,cast,多行speaker|台词)；n为旁白，y为你，id~intent等选情绪。choice(next, [[稳定cid,选项,Ink变量变更,即时对白,可选条件]])。大选择在echoes或后续节点兑现，见CONSEQUENCE_LEDGER。结局必须有独有结果与后日。

tests/campaign-routes.ts按cid覆盖默认走法；npm test生成完整命令轨迹与节点覆盖。120次种子抽样不是全历史穷举。npm run test:e2e -- --workers=3用真实Chrome输入通关、刷新和截图。

发布后冻结ID与版本。结点内增删句也会移动编号，必须提高contentVersion并落实CONTENT_MIGRATION，不静默让旧档撞到新台词。

---

# 以下为v4《半步之约》创作示范
# 对话与舞台创作指南

## 文件与单一真相

分支、关系、观察、承诺和结果写在 `story/duel.ink`；人物名、角色资料、画像与场景素材登记在 `src/presentation.ts`。`src/vn-runtime.ts` 解读节拍，`src/player.ts` 处理输入，`src/vn-ui.ts` 与 `src/stage.css` 负责演出。给本篇添加新场景和回复不需要修改 UI。

不要把长文自动按句号拆分。每行写一个完整的自然对白或动作，通常 15–70 字；特殊节拍可更长。要问的是“这一句后玩家想做什么”，不是“每三句是否凑够三个按钮”。

## 一行一个节拍

```ink
林见微把木剑递到你手边。 # beat:example_enter # scene:courtyard # cast:lin # speaker:narrator # action:接木剑
你想先试，还是先问？ # beat:example_question # speaker:lin # mood:lin=amused # prompt:你怎样接这柄剑？
* [先问。你为什么把剑握在这里？ # cid:example_ask]
    ~ asked = true
    看见了？因为我还没打算追你的脚。 # beat:example_ask_react # speaker:lin # mood:lin=intent
    -> example_close
* [先试。输了再问，也不迟。 # cid:example_try]
    这可是你说的。别输了又把话藏回去。 # beat:example_try_react # speaker:lin # mood:lin=sharp
    -> example_close
=== example_close ===
你收起木剑，把刚才没问完的问题留在茶杯旁。 # beat:example_end # speaker:narrator # ending:road
-> END
```

这是独立片段示范：在 Ink 文件顶部声明 `VAR asked = false`，并从入口或现有结点 divert 到该片段。不要把示范直接拼到终章后而不连接。

`Continue()` 返回当前一句及其标签；若 Ink 已抵达选择边界，选择与当前一句一起呈现。选择后必须先写即时反应，再汇合。反应可改变一句话、动作或关系，不必为每个轻回复制造长支线。

## 标签协议

| 标签 | 含义与约束 |
|---|---|
| `beat:unique_id` | 每条对白/动作必需；全篇唯一，小写字母、数字、下划线，最多 64 字符 |
| `speaker:lin` | 每条必需；已登记且在场的人物。`you` 表示主角，`narrator` 表示动作 |
| `scene:courtyard` | 切换已登记场景；没有新标签则继承。主线正常推进不追加文章 |
| `cast:lin,xie` | 本条起舞台完整名单，增删即出入场；`cast:none` 清空。手机优先最多三人同场 |
| `mood:lin=amused,xie=uneasy` | 更新表情提示和姿态；角色必须在场，情绪必须登记 |
| `action:红绳轻轻一扬` | 舞台短动作提示，不是数值奖励 |
| `prompt:你怎样说？` | 当前回复的自然引导语，置于最后一个选择前的节拍 |
| `cid:reply_id` | 写在选择方括号里，全篇唯一；用于存档重放，不应随意改名 |
| `fact:foot` | 已获得的见闻，登记资料后只在实际遇见时打开 |
| `ending:together` | 放在真正最后一个节拍，后面紧接 `-> END`；不能放在 divert 上 |

已有情绪：`neutral`、`amused`、`sharp`、`uneasy`、`calm`、`intent`、`surprised`。当前人物画是一张统一的半身像图集，情绪由聚焦、轻微姿态变化和文字提示承担；没有逐张脸部变体或配音。

## 条件与记忆仍由 Ink 管理

```ink
VAR saw_foot = false
// 观察回复后：
~ saw_foot = true
// 后续选择：
* {saw_foot} [等她换重心，再去碰红绳。 # cid:example_wait]
    这一回你看的是脚，不是剑花。 # beat:example_wait_react # speaker:lin
    -> next_scene
```

多条件段落采用 Ink 形式 `{`、`- condition:`、`- condition:`、`- else:`、`}`。不要把多分支写进 UI 点击函数；轻回复汇合后，用 Ink 变量再次呼应。

现成范例：`watch_foot` 才能打开 `use_foot`；看脚并承认局限后，才有 `test_new_step`；护同伴、直接追问和揭穿硬撑，后面各有不同对白；最后留下陪练、独自练习或继续上路，得到不同收束。

## 加入人物和背景

在 `src/presentation.ts` 登记新人物，例如 `guest: { name, role, detail, portrait: { file: 'guest.webp', position: 'center top', size: 'contain' } }`，将素材放入 `public/art/`。单张画像可用 `contain`；图集使用其裁切位置和缩放。无需给新人物增加 UI 分支。

登记新场景 `{name, time, art:'new-scene.webp'}`，然后在 Ink 行写 `scene:new_scene`。图片失败时仍有底色、姓名、对白与选择；不要回退到整篇文章。新增素材须保持风格，并记录生成提示或来源；图片不能烘焙对白与按钮。

当前演员数量针对一至三人测试。复杂多人群像应分镜出入，而非塞满手机舞台。

## 保存与发布内容版本

新篇使用 schema 2、`half-step-1.0.1`，键为 `jianghu:vn:v2:*`；旧篇 schema 1、`ferry-1.0.0`，仍在 `jianghu:v1:*`。

存档记录推进和回复命令、Ink 状态及当前场景/人物/对白位置。读取时从源故事重放，比对两类状态后才替换。正在打字的节拍恢复为完整文本，自动和快进保持关闭。历史不可结算旧选择。

本轮保留修改前完整样章的 `half-step-1.0.0` 校验基线，兼容迁移到 1.0.1 的同一节拍。它仅用于修正角色名，先核验旧源的可达状态，再比对新源世界变量和演出位置；不是跳过校验。`duel-1.0.0.json` 不由日常构建重写。更早的内部播放器测试稿若与该基线不一致，拒绝读取并保留原始导出。

改动已发布分支、ID 或路径时更新 `VN_CONTENT_VERSION` 并决定显式兼容策略。不要为“兼容”绕过原生状态校验，或静默清空旧档；不兼容档仍能原始导出。当前协议上限 400 次命令、1 MB 文件；长篇扩容时先调整限制与测试。

当前样章是收束式剧情，重复抵达同一个 `beat` 会报错。需要可反复问答的循环时，应先定义有界访问与存档策略，再补测试，不要直接引入无条件循环。

## 必做校验

```powershell
npm run story:build
npm test
npm run build
npm run test:e2e
```

静态校验拒绝未知人物、场景、情绪、见闻、终章、指令与重复 ID，并检查素材文件；运行时检查在场说话人、选择阻塞和终章收束。穷举测试覆盖全部节拍/回复和可达状态，检测不可达内容、循环与被吞掉的即时反馈。新增结点须更新代表路线和覆盖断言，不能删除失败用例来凑通过。

