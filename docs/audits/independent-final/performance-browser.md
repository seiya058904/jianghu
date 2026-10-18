# 独立本机浏览器性能补证（F18）

结论：**MEASURED / 有边界的实测证据**。18次独立context冷入口与一条龙门真实完整路线均走完，console/pageerror为0；本报告不设置虚构性能阈值，不据此判性能PASS、低端Android可用或长期无泄漏。

## 绑定与方法

- 最终RC：`ec53af4ec75f352b52ba6a85bd818510b890dc10`；dist fingerprint `964099434ff80dd33d7b622e60d13ca2c559976fb51e3d61451e4b93999a0c58`（父代理冻结351文件清单）。三个入口 served HTML逐字节比本地dist一致，逐样本HTML和generated JSON哈希在配套JSON。
- 环境：Windows 10.0.22631，AMD Ryzen 7 9700X 8-Core Processor，16逻辑核，约32GiB内存；Chrome 155.0.8059.40，headless；Node v24.15.0。
- Browser plugin not available，使用已有Playwright。1440×900与390×844只是同一桌面宿主的viewport，未模拟低端CPU、真实移动GPU或网络。父代理告知同机4 worker全量E2E并行，负载未隔离。
- 每个入口/viewport重复3次，共18次；每次全新context并由CDP禁用HTTP缓存。不清OS磁盘缓存，浏览器进程复用，因此此处冷加载是“新context无HTTP缓存的localhost导航”，不是冷开机/公网/首次安装。
- 仅预置正式阅读设置speed0/reduced/size20。没有存档、进度、剧情变量或DOM注入，没有自动跳过剧情帧；开局与通关均真实点击按钮。
- 封面时间：Node计时包住page.goto至新开局按钮存在；新开局时间：点击至首拍全文显示。输入响应：Playwright click开始至data-beat改变且正文完整显示；包含actionability、往返、调度、polling/RAF及主机并行负载，**不是纯输入到像素延迟/INP，也不是用户体感基准**。
- CDP Performance.getMetrics取目标页面真实JSHeapUsedSize等；未强制GC。导航/paint/resource timing和逐次按钮样本全部保存在JSON。

## 入口重复样本

单位ms。表为中位数；封面括号为3次min–max。n=3不足以推断总体尾延迟。

| 入口 | viewport | 冷导航至封面按钮 | 新开局至首拍 | 首个选择点击往返 | 首选拍 |
|---|---|---:|---:|---:|---|
| taihua | 1440 | 74.6 (69.5–109.2) | 48.6 | 272.6 | th_called_8 |
| taihua | 390 | 70.5 (69.7–72.3) | 50.0 | 275.8 | th_called_8 |
| longmen | 1440 | 74.8 (74.2–75.1) | 46.7 | 272.5 | lm_borrow_4 |
| longmen | 390 | 71.9 (69.0–74.6) | 45.8 | 272.0 | lm_borrow_4 |
| dead-ranking | 1440 | 65.6 (65.0–75.5) | 50.4 | 274.3 | dr_dead_letter_7 |
| dead-ranking | 390 | 67.4 (65.5–69.7) | 48.5 | 274.6 | dr_dead_letter_7 |

首选之前的每次继续按钮也实际点击、逐次计时；完整序列在opening.advanceClicks中，没有仅用测试引擎跳到选择。三次样本可重复达到相同首选拍；这只说明本机流程与测法稳定，不是低端设备保证。

## 长篇真实通关与内存

选择现行longmen，在1440×900从新开局逐拍到“送剑同行”结局 `lm_ending_6`。每次决策选择页面第一个选项；共 **228次真实按钮点击（205继续、23选择）**，未跳帧或导入中途存档。不使用真人阅读耗时口径；机器完成区间为03:48:42–03:49:41 UTC，约60秒。结局PNG已实际view_image目视，结局文字与三按钮正常显示。

| 采样 | beat | JSHeapUsed MiB | JSHeapTotal MiB | DOM Nodes | Documents |
|---|---|---:|---:|---:|---:|
| start | lm_borrow_1 | 4.522 | 8.633 | 206 | 8 |
| middle-150-clicks | lm_nine_3 | 5.240 | 7.133 | 229 | 1 |
| end | lm_ending_6 | 5.407 | 6.633 | 472 | 1 |

“中”采样固定在第150次点击，约为全程的66%，并非精确半程。起点至结局used heap增加约0.885MiB；同时JSHeapTotal收缩，Documents从临时8降到1。未强制GC、只采三点，Nodes包含尚未回收节点，故这些数字既不能单独认定泄漏，也不能证明长期无泄漏。未做多轮重开、小时级留置或接近内存上限压力。

| 按钮响应往返 | n | P50 ms | P95 ms | P99 ms | max ms |
|---|---:|---:|---:|---:|---:|
| 全部 | 228 | 261.5 | 274.7 | 277.3 | 288.4 |
| 继续 | 205 | 261.6 | 274.8 | 277.4 | 288.4 |
| 选择 | 23 | 260.5 | 273.3 | 275.7 | 276.1 |

分位数按排序后线性插值；约260ms集中的测量包含自动化等待，不应解释为页面每次固有260ms卡顿。目标页CDP TaskDuration从0.084s增至1.505s，ScriptDuration从0.014s增至0.190s，是本次页面累计主线程任务/脚本计数，与上述60秒墙钟时间口径不同。

## 产物与未验证

- `performance-browser.json`：原始18样本、导航/paint/resource计时、全部228点击、CDP起/中/终值、汇总、环境与哈希。
- 项目外脚本：`../Jianghu-independent-20261018/independent-opening/performance-browser.mjs`；原始JSON与唯一结局原图：`../Jianghu-independent-20261018/performance-browser/`。未追加大图入库。
- 没有编译、产品或测试修改，没有改timeout或断言，没有重跑或复用父fullrun证据。独立样本不加入父E2E计数。
- F18仍不覆盖：低端Android真机、Safari/Firefox、移动网络、后台恢复、长时间/反复通关泄漏、GPU纹理内存、系统总进程内存、真人体感或阅读时间。
