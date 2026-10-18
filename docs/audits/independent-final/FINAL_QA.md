# 最终QA（冻结与结果分阶段记录）

环境：Windows / Node24.15.0 / npm11.12.1 / Chrome155.0.8059.40。Browser plugin未列出，使用已有Playwright1.64.1。本轮不是外部真人/真机测试。

冻结前实测：`npm ci`exit0、0漏洞；`npm run build`exit0；全部`npm test` **451/451**、0失败/取消/跳过、exit0（含80项编辑草稿契约），见`install-clean.log`、`rc-build.log`、`rc-tests.log`。失败尝试完整保留为integration与rc-tests-attempt日志。

定向真实浏览器：存储/超时/版本限定立绘12/12；实际可见角色复核2/2；根与小写`/jianghu/`新版hashed shell离线更新2/2。脚本改版模拟不修改dist，真实SW代码与页面运行。见`integration-browser.log`、`portrait-visible-browser.log`、`shell-update-browser.log`。

完整Playwright枚举：485项、85个spec。最终完整run尚未在本文件初稿生成时结束；不能把历史471或上述定向结果当完整通过。最终输入RC、产品/构建manifest、完整日志与退出码将在本文件和`RELEASE_VALIDATION.md`补记。

运行时与浏览器证据分开：`runtime-coverage.json`/`CHOICE_CAUSAL_AUDIT.json`是采样及观察到的选择成对重放；所有未命中节点/结局明确列出，不据采样报全状态穷举。实际文学评价见两组原典回源报告。

真人试读、真人阅读耗时、Android真机、Safari、Firefox、读屏器：EXTERNAL NOT VERIFIED。
