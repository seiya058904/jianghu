export const people: Record<string, {name:string; role:string; text:string}> = {
  shen:{name:'沈砚',role:'你 · 渡口抄手',text:'二十四岁。替人记账，也随沈岳学过护身的刀法。白蘋渡是你住了七年的地方。'},
  lu:{name:'陆青蘅',role:'旧友 · 陆栓的妹妹',text:'她带来一截从西汊捞起的尾板，要你在查清以前，别把哥哥写成贼。'},
  father:{name:'沈岳',role:'养父 · 退镖师',text:'护过短镖，也教过你拿刀。右手有旧伤。对七年前的雨夜，他有话未说。'},
  gu:{name:'顾七',role:'船工 · 当夜在场者',text:'当年在船上做工，仍在西汊生活。证言属于他，是否署名也该由他决定。'},
  wen:{name:'闻素',role:'茶铺主人 · 旧账经手人',text:'街坊在她的铺里吃茶、等工、赊饼。旧赔款的往来账存在茶铺里。'},
  zhou:{name:'周济',role:'渡业出资人',text:'周家维持渡船，也持有船工的借据。如今他想续签独营渡约。'},
  tao:{name:'陶照',role:'本次公议记录人',text:'区分亲见、转述和推断。公议可以记事、议约，不能代替官府判罪。'},
};
export const facts: Record<string, {name:string; source:string; text:string}> = {
  river_route:{name:'沿河问人',source:'亲历',text:'你先去了旧船坞。本周目的账房消息须与亲见文书区分。'},
  archive_route:{name:'账房查证',source:'亲历',text:'你先去了闻记茶铺。本周目的河岸口信仍须查访。'},
  gu_account:{name:'当夜的三件事',source:'顾七证言',text:'货舱下水，沈岳切缆，陆栓跑向船尾。他不知道陆栓为何没有跳水。'},
  repair:{name:'旧修船单',source:'文书',text:'开船前三日有船底渗水记录，修补未验收；周济签收。不能直接推出杀人。'},
  payment:{name:'二十八贯与四贯',source:'账页与闻素陈述',text:'周家付了赔银，陆家被写作全额收讫。闻素承认挪了四贯救治伤者，未补齐。'},
  receipt:{name:'收讫副页',source:'文书',text:'你带走核对过的副页，并注明自己未亲见交银。'},
  cut_rope:{name:'刀背缺口',source:'沈岳自述',text:'切缆为免客船被拖沉。他未听清陆栓最后的话，也曾默认失踪者逃走的说法。'},
  cargo:{name:'油布包',source:'亲见',text:'旧衣与零碎工钱，不是想象中的铁证。'},
};
