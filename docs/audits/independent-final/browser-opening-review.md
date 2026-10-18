# 冻结RC独立开局与新美术舞台QA

结论：23现行版本 × 桌面/手机首个真实选择均已覆盖；无新增P0/P1。冷启动三项锁定正确；解锁后首选通过依赖明确标注的合法运行时存档辅助，不能冒称整篇真人通关。

## 环境与证据边界

- Git HEAD实际核对为 `83b5049484565940c3c163d6f3558004619ffe83`。父冻结dist fingerprint为 `352d4aa13ce6efe06742b0965b98d4c460d67c6d2bdfa23dcaff1ec2ece7d59f`；本复核另fetch首页引用的5份JS/CSS，全部与本地dist对应字节一致，避免旧监听器假通过。未自行重算整个dist fingerprint。
- 地址 `http://127.0.0.1:4173/`，现有Google Chrome/Playwright，1440×900与390×844，纸本20字号、立即显示及减弱动态。Browser plugin absent，读frontend-testing-debugging/playwright技能后用已有Playwright独立外部脚本，无安装。
- 流程：真实作品库 → 选篇索引 → 对应现行篇/卷册/配篇链接 → 开局 → 逐拍真实点击至首个选择 → 等至少一个合法选项enabled → 截图与资源decode。未改DOM过断言。
- 46张冷启动截图：40首选+6正确锁定封面。再经合法前置末拍存档+真实UI最后推进解锁，共6张锁后首选。16新素材各两视口32张辅助场景。原图共84张全部在项目外，无覆盖父fullrun证据。
- 已实际用view_image查看全部26张联系表中的84个截图画面：桌面按720×450缩放，手机390×844原尺寸；另直接查看庞震海两尺寸、青石石阶手机、榜纸之外手机、密库桌面原图。不是只看boundingbox。机器字段visuallyReviewed只表示这种明示粒度。

## 每篇入口与首选

下表每行均实际走作品库索引链接，两个视口都留图并目视；首选beat两尺寸一致。D/M错误为pageerror+console.error，均0。图片decode检查已覆盖冷启动20篇当场背景/立绘；锁封面单列，不用空decode列表冒称背景验收。

| 现行入口 | 首选beat | 冷启动/辅助 | D/M错误 | 实际截图目视 |
|---|---|---|---|---|
| `taihua.html` | `th_called_8` | 新档直达 | 0/0 | 两尺寸联系表已看 |
| `white-stone.html` | `ws_twelve_days_5` | 新档直达 | 0/0 | 两尺寸联系表已看 |
| `longmen.html` | `lm_borrow_4` | 新档直达 | 0/0 | 两尺寸联系表已看 |
| `luoyang.html` | `ly_ten_li_6` | 新档直达 | 0/0 | 两尺寸联系表已看 |
| `bamboo.html` | `bb_closed_gate_7` | 先LOCKED；合法前置末拍辅助后进入 | 0/0 | 两尺寸联系表已看 |
| `twelfth-life.html` | `rl_three_wins_6` | 新档直达 | 0/0 | 两尺寸联系表已看 |
| `twelfth.html` | `qw_paid_5` | 新档直达 | 0/0 | 两尺寸联系表已看 |
| `jade-thieves.html` | `jt_threshold_2` | 新档直达 | 0/0 | 两尺寸联系表已看 |
| `jade.html` | `jd_cat_6` | 新档直达 | 0/0 | 两尺寸联系表已看 |
| `qingshi.html` | `qs_grain_5` | 新档直达 | 0/0 | 两尺寸联系表已看 |
| `dead-ranking.html` | `dr_dead_letter_7` | 新档直达 | 0/0 | 两尺寸联系表已看 |
| `luhua.html` | `lh_eleven_4` | 新档直达 | 0/0 | 两尺寸联系表已看 |
| `dongting.html` | `dt_third_step_6` | 新档直达 | 0/0 | 两尺寸联系表已看 |
| `north.html` | `nq_hundred_twenty_seven_7` | 新档直达 | 0/0 | 两尺寸联系表已看 |
| `qian-kun.html` | `qk_short_inch_7` | 新档直达 | 0/0 | 两尺寸联系表已看 |
| `north-notes.html` | `nn_two_books_3` | 先LOCKED；合法前置末拍辅助后进入 | 0/0 | 两尺寸联系表已看 |
| `two-swords.html` | `ss_ridge_4` | 新档直达 | 0/0 | 两尺寸联系表已看 |
| `seven-questions.html` | `sq_receipt_7` | 新档直达 | 0/0 | 两尺寸联系表已看 |
| `xuanmen.html` | `xm_mud_4` | 新档直达 | 0/0 | 两尺寸联系表已看 |
| `beyond-ranking.html` | `br_yellow_page_8` | 先LOCKED；合法前置末拍辅助后进入 | 0/0 | 两尺寸联系表已看 |
| `sea.html` | `sr_old_first_5` | 新档直达 | 0/0 | 两尺寸联系表已看 |
| `sea-tide.html` | `st_first_boat_4` | 新档直达 | 0/0 | 两尺寸联系表已看 |
| `kuhe.html` | `kh_cloth_6` | 新档直达 | 0/0 | 两尺寸联系表已看 |

## 前置辅助如何取得

先在Node的VNRuntime用合法默认first选项完整遍历龙门、北枪、乾坤、玄门、白石，保留各篇最后一次推进前的原生save（命令与变量未篡改）。浏览器只预置这些原生auto和演出设置，进入实际页面，真实点击一次继续，由产品自己记录归宿：龙门lm_travel、北枪nq_first_again、乾坤qk_open_lesson、玄门xm_handover_after、白石ws_outside_after。然后回作品库点击竹院/师门夜话/榜纸之外，开局推进至首选。没有直接写endings标记，没有宣称在浏览器从头点通这些前置。

沈玉娘专属图需江十七视角：先同样以密库双贼合法末拍save+实际UI最后推进取得jt_unmarked_life，再加载合法江十七路径save定位她当面出现的场景。图上“你是江十七”是实际剧情，非给沈的身份标签错绑。

## 视觉观察与16新素材

所有首选控件在手机上均可见，文字与两项回复分区，没有按钮压住人脸或对白盖住选项；三人场仍留住三张脸和姓名。桌面角色分布、焦点色、景深和纸本对话可辨。谢绝用缩小桌面联系表证明20字号的细节字体质量；手机原尺寸已实际看过对应文字。密库第二视角在初次开局确实灰显并说明通关解锁，属于正确门槛。

六人物（庞/沈/江/陈/韩/宋）与十场景均已实际载入舞台，目标与beat/decoded URL在JSON。没有发现额外烘焙人物、错误年龄替换、明显透明矩形背景或挡掉第一选择的布局问题。新沈/江的单人中景比三人武会立绘略小，但留有屋顶/密库空间，不属阻断。太华两老复手采用远景，人物较小但身份与对白可读，是与院内近景不同的导演尺度。

庞震海锚/掌战先前P2保留：实际1440图中锚杆落在下缘，手机主要见绳索腰带，未形成手持锚劈砍的错误战斗演出；当前证据不升级P1，也不据此改原典掌战。

| 新资产 | 实际场景beat | 两尺寸 |
|---|---|---|
| `v6/lh-redbank.webp` | `lh_red_snake_1` | 已截图目视 |
| `v6/lh-townpractice.webp` | `lh_only_defend_1` | 已截图目视 |
| `v6/lh-jiangling.webp` | `lh_jiangling_1` | 已截图目视 |
| `v6/lh-pang.webp` | `lh_jiangling_1` | 已截图目视 |
| `v6/jt-vault.webp` | `jt_threshold_1` | 已截图目视 |
| `v6/jt-jiang.webp` | `jt_viewpoint_2` | 已截图目视 |
| `v6/qs-chen.webp` | `qs_grain_1` | 已截图目视 |
| `v6/qs-han.webp` | `qs_grain_1` | 已截图目视 |
| `v6/qs-song.webp` | `qs_wall_1` | 已截图目视 |
| `v6/qs-stairs92.webp` | `qs_breach_1` | 已截图目视 |
| `v6/dr-faceroom.webp` | `dr_three_faces_1` | 已截图目视 |
| `v6/rl-public.webp` | `rl_private_xue_8` | 已截图目视 |
| `v6/th-mufront.webp` | `th_mu_front_1` | 已截图目视 |
| `v6/ws-snow-court.webp` | `ws_white_council_1` | 已截图目视 |
| `v6/nq-rainporch.webp` | `nq_wood_chair_1` | 已截图目视 |
| `v6/jt-shen.webp` | `jt_viewpoint_7` | 已截图目视 |

## 检查结果与交付

| 检查 | 结果 |
|---|---|
| 页面身份/内容 | 23对应标题与入口，有真实正文或锁定说明 |
| 控件交互 | 从作品库点击进入；开局/继续真实响应；首个合法选项enabled |
| 空白/框架覆盖层 | 未见 |
| console.error / pageerror | 观察的冷启动与辅助场景均0 |
| 开局资源decode | 20冷启动可玩篇×2全部成功；目标辅助场景解码成功，沈图单独截图加载可见 |
| 横向溢出 | 冷启动46状态均false；辅助场景以实际画面检查 |
| 截图美术观察 | 84画面均联系表实际看过；无新P0/P1 |

完整机器记录：`browser-opening-results.json`。原始图片/原始JSON/可复跑脚本：`../Jianghu-independent-20261018\independent-opening`。脚本是外部独立浏览器QA，不属于仓库测试，也未修改任何src/story/public/tests/dist/package。

本结论仅覆盖两种Chrome视口的开局与16个指定美术状态，不替代父485项全量E2E、全结局、离线、跨浏览器、真机或真人试读。没有报后者PASS。
