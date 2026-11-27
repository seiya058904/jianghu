# 依赖与选型

2026-10-14 查看官方 README、许可证和 GitHub API 的最新发行、最近推送、开放问题。快照及来源见 `docs/evidence/candidate-research.json`，不把更新时间当作质量保证。所有候选均未归档。

| 项目 | 查得发行 / 许可 | 处理 |
|---|---|---|
| [Ink](https://github.com/inkle/ink) | v1.2.1 / MIT | 采用语言，未另装 C# 编译器，避免编译器与运行时不匹配。 |
| [inkjs](https://github.com/y-lohse/inkjs) | 2.4.0 / MIT | **选用并精确锁定**。同包 Compiler 与 Story 编译/运行，浏览器无需运行时联网。 |
| [Inky](https://github.com/inkle/inky) | 0.15.2 / 许可 API 未识别 | 可作为编辑器，本作不打包；未据此推断授权。 |
| [Twine](https://github.com/klembot/twinejs) | 2.12.1 / GPL-3.0 | 已检查，作为可视化编辑候选，未分发编辑器。 |
| [SugarCube](https://github.com/tmedwards/sugarcube-2) | 2.37.3 / BSD-2-Clause | 成熟替代，Ink 已通过验证，无需再引入第二个状态系统。 |
| [A Dark Room](https://github.com/doublespeakgames/adarkroom) | 1.4 / MPL-2.0 | 仅看文字节奏方向，不复用代码、剧情或美术，不引入资源循环。 |
| [Yarn Spinner](https://github.com/YarnSpinnerTool/YarnSpinner) | 3.2.1 / MIT | 偏对话编排，本作不需要另加引擎适配层。 |
| [ChoiceScript](https://github.com/dfabulich/choicescript) | 无 latest release / 自定义许可未判定 | 未采用，不视为一般 MIT 类授权。 |

实际工具链：Node 24.15.0、npm 11.12.1、Vite 8.3.4（MIT）、TypeScript 7.0.2（Apache-2.0）、Playwright Test 1.64.1（Apache-2.0）。前三个 npm 直接依赖精确固定版本，传递依赖由 `package-lock.json` 固定。字体使用系统回退，不下载外部字体；运行时唯一 npm 依赖为 inkjs。

实测 API：`Compiler.Compile()`、`Story.Continue()`、`currentChoices`、`ChooseChoiceIndex()`、`state.ToJson()`、`state.LoadJson()`。选择标签必须在方括号内部，这是首次浏览器检查发现并修复的兼容细节。每个存档都带 schema、内容版本、选择路径、完整 Ink 状态、时间和滚动位置。恢复先用本地可信故事重放验证，再调用原生状态加载。

近期问题中，inkjs 的 NaN 运算、Divert 统计、EvaluateFunction 符号问题与本作不使用的算术/外部函数相关；没有因此忽略运行测试。Ink 结点与变量同名的问题由当前命名规范和编译验证规避。未对未选引擎逐一进行运行兼容测试，也未声称这些候选无缺陷。

inkjs 完整 MIT notice 已随生产构建放入 `INKJS-LICENSE.txt`。本项目自己的故事、源文件与生成图像未擅自对外授予开源许可；交由用户决定发行授权。原世界观文件只读引用，没有复制到构建。
