# Cold-cache 前置竞态：独立 fixture 反审

2026-10-18。仅审测试夹具及外部实验，不修产品、不改测试、断言或超时。本代理本轮**没有执行浏览器或测试**；下列实验结果来自直接读取工程代理外置脚本、JSON和日志，源审结论与实跑归属分开。

## 为什么网络完成不等于缓存写完

直接读取 `public/sw.js` 的fetch路径：`respondWith(fetch(...).then(... return response))` 中另以 `event.waitUntil(caches.open(...).then(cache.put(...)))` 延长事件。页面收到Response、load／networkidle就绪，不要求这个独立持久化promise已经完成。测试此时从各Cache删除真实chunk并立即断言false，可能被此前同URL的在飞put回填；这首先是删缓存前置条件未建立，不能仅凭一次false→true就推导产品下载失效。

工程外部 `workspace/north-sw-put-race.mjs/.json/.log`：36次自然运行（load与networkidle各6轮×3版本）均未再现；必须保留这个范围，不能把可控复现说成每次自然出现。单独受控实验仅在外部脚本包装真实 `Cache.prototype.put`，暂存north-v1原写入，未换Response或cache数据；load返回时至少1任务、networkidle时2任务仍未完成。删除后先false，释放原put后true，说明该排序确实允许回填。

工程外部 `workspace/north-sw-fetch-drain.mjs/.json/.log` 在root与`/Jianghu/`各一独立Chrome context实验：networkidle仍2个fetch waitUntil任务／2个受控held put，真实promise屏障在放行前不结束；放行后pending0，再删缓存false，经产品设置的离线下载按钮true，离线reload后旧稿封面可见。这里的延迟put是**验证屏障的外部探针**，不应进入生产代码或正式测试helper。

## 审查约束

- helper仅观察真实fetch事件的原 `waitUntil(promise)`，必须及时原样调用native `waitUntil.call(this,promise)`，不得换promise、延迟／跳过实际Cache.put、吞拒绝或合成Response。
- 安装观察后再发会被SW控制的reload；reload就绪、真实pending drain后才进行原删除与false断言。仅在delete前做一次poll缓存存在，不足以证明同URL没有后续put在飞。
- 不把旧false断言改成最终重删、retry删到false、清整个CacheStorage，或提前断网阻止产品更新；下载后的true与真实冷离线也要保留。
- 不加固定睡眠、扩大timeout或降低断言；测试scope保持本独立context，不能干扰并行context的worker。
- helper不能向产品／dist持久写注入；旧失败批次保留，新测试RC需统一完整重跑，不与旧286项拼成492。

## 同类前置检索

本代理检索全部`tests/*.spec.ts`中CacheStorage显式删除，找到13个有同型前置的spec：

`north-editorial-cold-offline`、`qian-kun-editorial-cold-offline`、`offline-work-pack`；另有`child-reuse`、`default-entry`、`sea-editorial`、`sea-tide-editorial`、`jade-editorial-cold-offline`、`jade-thieves-editorial-cold-offline`、`longmen-editorial-cold-offline`、`qingshi-editorial-cold-offline`、`taihua-editorial-cold-offline`、`twelfth-life-editorial-cold-offline`。

已直接读取各删缓存前后调用；部分先完成一次显式下载、或poll缓存已有，再goto旧稿并删除，但后一次network-first fetch仍可能另有waitUntil写入。因此建议统一helper覆盖这13处真实evict前置，或逐项给出不会有在飞写入的源级排除理由，避免只修North后下一完整批次在同类夹具再失败。已反馈父与工程代理；本代理不代改。

## helper与首批差异源审

直接全文读取新 `tests/service-worker-cache-drain.ts` 及North／QianKun cold、offline-work-pack三spec的Git语义差异。Verify coverage一次批查helper、13spec及public/sw.js共15路径，generation `2026-10-18T04:53:07Z`；helper not_tracked，其余metadata_changed，全部按磁盘源fallback，不据图完整性下结论。

源审 **PASS**：

1. helper从该page的context中，以ready active scriptURL找真实worker realm；安装在待控reload前，重复安装不重包prototype。
2. wrapper第一步 `original.call(this,promise)`，原promise原样、立即、一次交native；只对fetch将`Promise.resolve(promise)`记入Set。未包装Cache.put／fetch／Response，未给任务增加gate，也未编造返回内容。
3. task settle时删除，drain在worker内循环`await Promise.all([...pending])`，没有sleep、宽限秒数、重试删除或扩大timeout。drain时遇到拒绝会拒绝；不把失败伪装成缓存已写。
4. 三处接线只增加观察安装、原reload后等“设置”按钮可见、drain真实pending。原精确chunk删除／false断言／UI下载／true断言／清HTTP缓存／新页真实离线与内容核对保留。offline-work-pack已有120秒上限未增加。

这属于等待测试自己要删除的网络写入完成，建立确定的cold前置；没有修改产品缓存策略，也没有替产品完成下载。已独立读取工程 `workspace/cache-drain-browser.log`：58 passed、约31.5秒、`BROWSER_EXIT=0`，三spec根／子路径的真实定向运行通过。执行者是工程代理，本代理只复核日志。父已授权额外10个同类spec扩展，尚待增量源审，不在尚未修订时宣称全13处关闭。

当前未发现helper／首批三差异会掩盖原false或下载缺陷的具体问题。旧286pass/1fail批次保持中止记录，新完整492仍需新统一测试输入执行，不能拼批。

## 扩展10处增量反审

父授权全13spec同根因修复后，本代理再读child-reuse／default-entry／sea／sea-tide的完整Git差异，以及六个editorial-cold增量的安装和真实evict前片段。观察安装仍在已有初始reload之前，不新增导航、不提前执行raw迁移；六个双版cold及sea双册的drain放在**第二次goto旧版、即将evict时**，所以等待范围包含这次新注册的后台put，不仅是首次reload。

另以只读Python将13份当前spec做三项严格逆变换：去helper import，将observe安装还原为原ready调用，去新增“设置按钮可见＋drain”。规范CRLF后，13/13都与Git HEAD原spec全文完全相同。此检查与实际差异阅读互补，证明没有悄改原delete／false／下载true／真实离线／选择／图像／超时及循环次数。每份有一处源级drain（循环场景按原循环执行），本轮检索的13个同型evict前置均覆盖。

最终helper SHA-256 `f450f7d95a48f477d8ad3ca4eae21a5171faefa1d20c602d10b1e2841ef9cac4`。只读`git diff --name-only -- src story public scripts package.json package-lock.json`为空，未见本轮产品或配置修订。源审裁定：**helper＋全部13spec差异PASS，无具体断言削弱或合成结果问题。**

工程全13spec的4workers定向批次已结束。已直接读外部 `workspace/cache-drain-all-browser.log` 的运行头、实际case输出及最终总计：**85 passed，约44.4秒，BROWSER_EXIT=0**。这是独立复核工程实跑日志，本代理未执行它。首3的58/58与全13的85/85各自记录，不相加成143个独特测试，也不替代下一次新统一RC完整492。
