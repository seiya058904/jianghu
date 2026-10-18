# 最终独立 F 反向复核

2026-10-18；比较基线 HEAD `7a2c22f74c46d74f07af8bd1a45893ec15daa49b` 与当前工作区。结论：本轮未发现新增 P0/P1。18 份故事作者源的全部变更 hunk 已一手阅读，针对修改所用变量又读相邻原选项与共同落点；下表是具体判断，不以 A/C 报告的 PASS 代替审阅。本人未编写这些故事修法。本轮不重新审阅本人首写的 storage/SW 产品修复以冒充独立性，也未编译、运行整套测试或启动浏览器。

图索引对21个目标路径均做 check_index_coverage；当前 generation `2026-10-18T03:03:18Z` 仍返回 metadata_changed/空 coverage，故以源码回退。工具输出截断的 luhua 中段已分文件重读。依赖搜索两次 Windows 字面 glob 报错，后改用 rg -g；这些失败不作为验证证据。

## 故事修法的反向检查

| 作者源（实际审阅范围为全部变更 hunk，非宣称全文重审） | 独立核对结果 |
|---|---|
| dead-ranking-after.mjs | room/road 都复用 lesson=1/2，但行为不同；现按 career 再分开，road1 回忆分站位，road2 才留宿，尾声一致。没有再把任一 road 路线认作桌前答第一句。 |
| dead-ranking-case.mjs | 葛与谢改为同门，不再认作谢的学生；钱路与问话对象各按自身变量回记，混合组合不再凭空倒转追钱方法或把拒答当杀人证据。 |
| dead-ranking-people.mjs | 三剑各自读取 first/second/third 变量；任一异选不会强加第一剑左脚行动。后文三人无条件到沈院走手，false 分支现承认实见而限制可证范围；同桌/分屋后的第二、第三人和返榜房总结均一致。 |
| dongting-author.mjs | 对照 take_positions 与 go_report 原选项，false 路线确实报过停试/船位；现区分已报信息与尚未配合的口令。汪苇健康条件与同文件接人结果 `future==1 && float && rest` 完全一致，其余受伤路线仍承认不能用脚。 |
| jade-after.mjs | 对照 grain/records 两个互斥岗位及 grain_after，回响先按 post 分开，再读取本路发生过的行动；不会把第七库经历误记成第九库院外转报。 |
| luhua-after.mjs | master_real=false 原选项实际为谢他派救师，现保留这件行动而非伪造隐瞒。四组双条件回忆均改为逐变量分开，保留 false 选项的实作、成本与尚未完成的事，未把另一条合理行动写成懒或没做。 |
| luhua-mountain.mjs | 陈震旧伤由左改右，与前述受伤一致；market_walk=false 原选项确实随送货人走一天且接担，现不再称只站路边。 |
| luhua-seat.mjs | 蒋的掌与赵的篙分清，原问席负/平不变，未因此加胜或改招数。 |
| luhua-seven.mjs | 匣子先稳送再折返、药铺半日核人也都是实作；现按两个变量分别回忆，浅教的原因改为复盘接手先后，未凭空指控图省事。 |
| luhua-tide.mjs | 蒋问席的地点与负/平固定；false defeat_plain 原来做过浮舟交接，现在仍承认练过而在海浪下再次确认。阿航报最后一舟后，不再又说有舟无人来报，亲核与他人核报区分清楚。 |
| north-after.mjs | 76岁茶席不再回忆尚未发生的顾园剑；两分支都明确是80余岁整理旧页时并记，不把未来话放回旧茶席。 |
| qian-kun-slow.mjs | 当前段对手连退五步、自停，回响从“落败后”改“停手后”，消除正文胜负相反，未添一场胜负。 |
| sea-legacy.mjs | 原典7346–7352明确第三代返真在罗死后；在世对白改为眼前学生接一班课，不再让罗亲口回应自己死后的第三代。 |
| seven-questions-resolution.mjs | 对照 route==1 为伏牛慢队/后闻东门，route==2 为留院接班；court_after false 回响现分路线，谷路不再虚构留院交接，仍要求两地亲见分别核。 |
| twelfth-author.mjs | 前文赵承晏140余招败、后文赵亲口记薛胜；truth=true 回响改为薛此胜有场边证人，未再把薛说成败或无人见。 |
| twelfth-life-capital.mjs | 移除当下年纪不支持的“四十多年”，保留沈履平底子持续沿用，不另造具体年数。 |
| white-stone-author.mjs | 原典9694–9710直接支持洞玄亲口认今日高；回响区分法晦未定胜负、洞玄今日认高、藏山三日无明确胜负。祁/Gongsun与雪灾弟子跨代回响归到旧卷，后人不再自称自己当年所写所做。 |
| xuanmen-author.mjs | ask=true 对应问老人身份；false 保留汉水泥地。envy=false 分支原先当夜收灯，现说明后补且保留补记日期，不再与必经的手录记嫉妒冲突。 |

上表确认的是此次具体矛盾被消除，未发现由这些修改新增的同类矛盾。它不等于重新逐句核完所有作品与原典。原典精确行只针对两处历史事实回源；其余依赖本轮实际读取的原选项、共同正文与时间顺序，不将他人原典报告冒作自己的全文审读。

独立只读 Python 对18个变更作者源分别比较 HEAD/current：`part/stage/choose/go/fact/end` 的字面锚点调用序列、选项 CID 与赋值、文件行数全部相同，18/18。手读 diff 也未见 VAR 声明或舞台锚点改动。此检查为源码字面检查，不是 AST 全语法等价证明，也不替代编译后的 beat/标签/旧档恢复测试；父集成的14源结构与运行时证据须独立保留。

## 同龄立绘与测试是否真在看演员

已读 src/vn-ui.ts 的 cast 修改及 tests/portrait-fallback.spec.ts 全32行。替换条件严格为 current slug `twelfth-life`、角色 `rl2_lu`、look `mid`、mood `amused`；visual 是 resolvePortrait 返回值的浅复制，只改文件为同一 mid 年龄的 clean 图，未改共享 catalog 对象、年龄或冻结版资源。

spec 对 current 与 frozen-v2 分别创建各自内容/版本/命名空间，沿真实 VNRuntime 选择到 `rl_seal_books_3`，断言 amused、mid、actor 可见、舞台无CG、实际 style 文件，再刷新后核 beat 与图片。这个落点避开之前可能被CG遮住的场面，当前断言不是只检查隐藏 DOM。它没有替换演员 DOM 来造图，也没有令旧版跟随 current 选材。刷新后未单独重复 visible/noCG，但已有相同 beat 与图片恢复断言；本轮不据此声称实际截图或浏览器视觉复核已执行。是否图片已成功 decode、透明光晕实际消失，仍由父浏览器/美术证据支持。

## 公开快照边界

完整逐行读 scripts/public-snapshot.py 78行。只从指定已解析 commit 的 git archive 取追踪内容，不读源工作区未追踪文件；跳过 canon全文、docs/archives、候选图、个人工具目录、历史PNG/JPG、env/key/pem/zip/bundle。拒绝链接/特殊文件与超过阈值的指定二进制；目标必须在作者仓库外且 Git 干净；逐个删除/写入前 resolve 后检查仍在目标目录内。没有 push、remote修改或历史改写。

文档型 MD/LOG/TXT/JSON/CSV 中的机器路径可被清理，src/story、lockfile、代码与预期hash不改；JSON只处理值，不改键。这里实际是“追踪commit + 明确排除规则”，不是任意新增文件都须预批准的正向文件allowlist，也不是内容级秘密扫描。当前没有确认具体secret泄漏；不能据此声称任意未来提交都自动保密。最终应审具体plan中 included/excluded/redactions，而非只看脚本可运行。

两项非阻断P2使用边界已通知父：`--plan`未限制输出路径，dry-run也会写该路径；destination未强制等于 git rev-parse --show-toplevel，干净仓库中的子目录也可能通过。父若使用独立真正public根与外部新plan文件，这两项不构成本次受控操作的当前P1；脚本暂不应宣传为对任意参数误用安全。本轮没有执行该脚本、apply或发布。

## 范围与证据

实际只读命令 git diff、rg、Get-Content、git show、Python源锚点比较及 graph coverage；最终锚点比较 exit0/18一致。没运行编译、npm test、故事生成、E2E或公网操作。父所报12个storage/SW真实浏览器测试与根/小写jianghu两hashed-shell更新通过，是父证据，本轮不将其重标为本人独立验收。

工作快照 SHA256：vn-ui `2154ed56681efa290af84e1e3e7a52be57818d30516ad66e6abbd47f7eb16f47`；portrait spec `2f04b74df084e33d31c7e1bfd296091abda0342b6ecd8f9e958e9d84355b995a`；snapshot脚本 `328afa086f2dfc99036fb8186c18fbc294629b5faa88c354dcc24b189856272d`。故事变更的hash应与父最终source结构记录核对；本报告只对本轮读取的工作副本有效，不提前给尚未形成的最终提交PASS。
