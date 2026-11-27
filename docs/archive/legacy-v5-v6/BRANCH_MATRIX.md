# 潮生有约 · 当前分支矩阵（剧透）

先决规则按下表自上而下求值。全部8类均由真实选择路线可达，命令见tests/campaign-routes.ts；统计见docs/evidence/v5-route-metrics.json。未声称穷举全部历史字符串组合。

|结局ID|名称|真实条件|独有收束|
|---|---|---|---|
|scar|带伤归来|终章亲自接船、准备/伤势未满足成功条件且wound>=3|自己长期休养，改练法，接受别人搬梁|
|lost|缺席的人|亲自接船未成功，伤势<3|刘篙由大船接回但腿伤失去掌桨能力，改在岸上报船|
|name|一场真胜|选择回坪争补试，先前问棍duel==2|与容既白真打再胜，不凭钱或救援功改判|
|teacher|把剑教下去|未先触发上述三类且future==3|回馆休养，教小满，把自己的失误也讲清|
|together5|同行不散|future==2且team且qiao_saved|陪砚生随镖队再走，换职责但保留自主|
|apart|各赴前程|future==2，其余同行条件不满足|不强拉他人同行，留下地址与还债期限|
|captain|潮来有舟|留下、走水路、照鲤信任且人已接回|水路分工、阿笠掌桨、赔船账落入工钱|
|harbor|众人之岸|其余完整路径|留下修渡、开仓、教人，普通工作也有自己的名字|

亲自接船成功：anchor=true，已掌握rope/water_read/terrain任一，wound<3。玩家在选前知道旧桩不稳、石墩可用、伤势和松绳要求。组织大船、回坪、陪护的接船均交给熟手大船完成，不假称主角同时在各处。

中段分歧：route_land进入ridge/bridge及补鞋插曲；route_water进入reeds/rainboat及灯、网、夜船。各有独有角色和信息，返回船坞才汇流。不在另一条路亲历的具体事件不会被说成你亲眼见过。

主要选择逐项回响见CONSEQUENCE_LEDGER，轻语气只有即时反应也明确标注，不能把它们全算重大分歧。

---

# 下方为《渡口无碑》历史矩阵
# 分支验收矩阵（含剧透）

稳定 ID 写在 Ink 选择方括号内部的 `# cid:` 中；不是显示文本。每条代表通关路线 14 次点击，其中 3 次是明确推进，约 11 次有后果的决定。自动遍历报告见 `docs/evidence/graph-coverage.json`。

| 决定 ID | 当时所知与含义 | 即时变化 | 中期 / 尾声 | 验收 |
|---|---|---|---|---|
| promise / reserve | 青蘅带尾板和匿名信；是否先作承诺 | 留下烤火 / 扛板离开 | 河街对你的期待、尾声铜钱归属 | public 对 leave |
| river / archive | 午后封账，只能亲访一岸 | 顾家船坞与证词 / 茶铺账页与欠款 | 未亲访的消息标明转述；前文、见闻不同 | public 对 common |
| ask_gu / press_gu | 顾家有债；询问是否愿意承担风险 | 开门请坐 / 收茶不肯署名 | 公开证人、合办条件、信任 | public 对 leave |
| listen_wen / seal_ledger | 自己的字在收条上；先听或封账 | 私账 / 仅公开账 | 闻素向顾七转述你的承担，形成有限信任 | common 对 quiet |
| take_slip / leave_slip | 修船单只能证明旧漏水，不证明杀人 | 原件交出 / 留在顾家 | 公布证据选项可用性 | public 对 leave |
| copy_ledger / return_money | 发银与收到不相同 | 副页 / 先私下还款 | 可公开核验与私下偿还的差异 | 脚本全状态遍历 |
| deposit / no_deposit | 押金不以撤证为条件，但需承担新办法 | 签担保 / 保持查证距离 | 合办渡口所需的真实钱与责任 | common 对 public |
| observe / duplicate | 师父指出脚下；练习或抄件 | 半步 / 两份材料 | guard 只在练过时出现；后日记录保存方式 | public 对 quiet |
| rescue / bundle | 人与物落在不同方向；不能同时取 | 先救人 / 先取旧衣包 | 顾七的伤后与信任、合办条件 | common 对 quiet |
| guard / rush / withdraw | 对手占地势、目的扣物 | 护人绕出 / 腕伤 / 带护行同行 | 手腕疼痛、失败仍能抵达公议 | public / quiet / leave |
| confess / distance | 收讫的字出自你；公开承认范围 | 自己入卷 / 责任留经手人 | 闻素关系与合办资格 | common 对 quiet |
| consent / anonymous | 顾七承担公开风险，信任不足会拒绝 | 人证 / 待核线索 | 合办需 consent；不足不提供伪造选项 | public 对 leave |
| end_public | 至少有一条实际带来的文书 | 公开核实部分、停整 | 旧情与工作受损，陆家撤去无据污名 | routes.public |
| end_quiet | 所有路线可选 | 私约、封卷未结、保一季渡业 | 欠钱渐还，外界传闻未消失 | routes.quiet |
| end_common | deposit & trust & rescued & confessed & consent | 共同签责试渡 | 停航制度、船工议账；旧责不抵销 | routes.common |
| end_leave | 所有路线可选，含调查不足 | 留卷不结、过江寻访 | 有限保护与未能解决的旧账 | routes.leave |

`proof` 的含义是有可出示文书，不是知道全部真相。`trust` 是某一位亲访者愿意为你转达判断的有限信任，不是全体人物的好感数值。`copied` 只决定记录是否留有随身副本，不产生新证据。任何路线都没有角色死亡；不同选择造成的是伤势、关系、公开意愿和归宿，不允许误写复活。

