# 真实页面、素材分层与路线视觉复核

产品字节指纹 `83160cbcc9a5e9dd117544e28bef74088caf56006d1c7cf7f459c5ef7e499586`，dist指纹 `352d4aa13ce6efe06742b0965b98d4c460d67c6d2bdfa23dcaff1ec2ece7d59f`。RC1→RC2只补测试/发布工具，RC3再去除审计脚本中的固定用户名；产品和构建逐文件一致。最终完整suite以[QA](FINAL_QA.md)为准。

## 本轮确实看过的内容

|范围|方法与证据|边界|
|---|---|---|
|183栅格图：172运行时、11候选|Pillow逐文件decode/alpha，10张联系表全部查看；另18张全尺寸独立复核，见ART_ASSET_AUDIT.csv和visual-independent-review.md|119张确有alpha=0像素。不能由RGBA头或decode推断整洁透明、年龄与兵器正确|
|27完整catalog，355角色/375场景登记|逐行阅读+ID/文件核对，缺文件0、叶角色ID撞0；13组相同底图均是同人跨代别名/司马衡同canonicalIdentity|不把模板演员算作新增专属立绘|
|23现行篇×1440/390首选|84原图实际联系表目视，含6冷锁页、46首选和32新素材场景；见browser-opening-review.md/results.json|三篇锁后首选与16资产场景使用合法runtime存档辅助；不是整篇从头通关|
|死人/芦花六条完整路线|1,714实际页面拍、1,526次next和182次选项，六次结束刷新；逐拍DOM正文/舞台与冻结runtime对照，0console/network/decode故障|只在1440×900与390×844、字号20；66原图中实际细看22张页面图。全部操作转录见browser-late-*.json|
|陆清婉背景残留修复|真实到达无CG的rl_seal_books_3，当前/冻结V2各一次并刷新；portrait-visible-browser.log 2/2|只现行twelfth-life回退同龄clean中性图，未改旧图和冻结catalog，也未声称新含笑表情|
|按篇更新后的离线首页|真实HTTP部署模拟、相同SW、新hash模块，由产品下载按钮缓存，再真实离线进入16卡首页；shell-update-browser.log 2/2|root与小写/jianghu/；新JS带执行版本标识，非注入替代库DOM|

## 重要修复与仍有空间

陆清婉旧含笑图带矩形灰黑光晕；干净同龄中性图已在舞台与刷新图确认，文字语气仍含笑。旧版保留原图，忠实于冻结字节。白石封面明确“雪灾之后，只剩十二日”，不把余命误作降雪时长。

庞震海持锚闲站像与掌战不够贴合，定P2。桌面锚头被对白裁去，手机手与锚头在屏外，实际action为空，没有挥锚、锚击文本或改写十五篙胜负。最小后续工作是同人空手/收掌姿态，不是改史实。沈霁娘菜篮老妪、小荻红旗青年、蒋/沈分场老者模板仍有制作痕迹；无实际同屏双人同脸证据，不把这点说成全角色动作美术完善。

[资源触发账本](ART_USAGE_TRACE.json)是运行时catalog候选绑定。CG遮住的cast也可能入账；`renderingBoundary`与`rendererOverrides`明确这一点。当前Lu覆盖映射另有真实舞台截图，不能把catalog候选文件当作已显示图。

## 可复核页面图

![当前中年像](../../evidence/independent-final/independent-lu-twelfth-life.webp)
![冻结版原背景](../../evidence/independent-final/independent-lu-twelfth-life-v2.webp)
![手机同桌续问](../../evidence/independent-final/browser-late-dead-mixed-390-dr_three_faces_1_1.webp)
![晚年回忆实际赴约](../../evidence/independent-final/browser-late-luhua-mixed-390-lh_late_after_22.webp)

原图全部在项目外独立归档；小WebP精选可入库。Android真机、Safari/Firefox、读屏器、真人投入与耗时均EXTERNAL NOT VERIFIED。其余未逐图细看的完整suite截图不能冒作人工式视觉审美通过。


## 主代理最终精选复核（2026-10-18 13:14 +08，当前产品字节未变）

主代理直接打开390px的 `browser-longmen-390-fixed-line.webp` 与 `browser-late-luhua-mixed-390-lh_late_after_22.webp`：龙门正文确实显示“只同罗先生打平”，与人物、渡口背景独立合成；芦花渡混合后记的完整多行正文位于对话框内，未见横向溢出或文本截断。此动作是对两张已有实际浏览器截图的目视复核，不冒称重新跑了两条路线，也不替代最终线上双档实玩。
