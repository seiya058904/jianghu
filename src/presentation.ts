export const characters = {
  lin: { name: '林见微', role: '松风剑馆弟子', portrait: { file: 'cast.webp', position: '0% top', size: '330% auto' }, detail: '守着自家院子，也不肯看外来人把硬撑当胆气。她说话利落，试剑时更利落。' },
  xie: { name: '谢行舟', role: '与你同行的剑客', portrait: { file: 'cast.webp', position: '50% top', size: '330% auto' }, detail: '一路说要问剑，到了院门却把剑柄握得太紧。嘴硬归嘴硬，他真的想知道自己差在哪里。' },
  wen: { name: '闻铮', role: '地方老馆师', portrait: { file: 'cast.webp', position: '100% top', size: '330% auto' }, detail: '松风剑馆的教习。不在大榜上，也不把一次切磋说成悟道。教人之前，先让人站稳。' },
} as const;
export type CharacterId = keyof typeof characters;
export const emotions = { neutral: '平静', amused: '含笑', sharp: '挑眉', uneasy: '迟疑', calm: '从容', intent: '凝神', surprised: '意外' } as const;
export type Emotion = keyof typeof emotions;
export const scenes = {
  courtyard: { name: '华阴 · 松风小院', time: '晨雾未散', art: 'courtyard.webp' },
  stones: { name: '青石坪 · 试剑', time: '风过松梢', art: 'courtyard.webp' },
  veranda: { name: '松风廊下 · 收剑', time: '日光初落', art: 'courtyard.webp' },
} as const;
export type SceneId = keyof typeof scenes;
export const endings = { together: '并肩再来', practice: '留院半日', road: '把半步带走' } as const;
export const facts = {
  foot: { name: '石缝里的落点', text: '林见微的前脚贴着石缝，后脚留出半寸。看见落点，才有机会分清她让了多少。' },
  breath: { name: '一口气里的迟缓', text: '谢行舟右肩比来时略高；不是剑招的新变化，是疲劳在抢走他的余地。' },
  blade: { name: '漂亮的一招', text: '你记住了剑尖的变化，却还没看清它从哪里发力。招式相同，脚下未必相同。' },
  limit: { name: '只懂这一次', text: '闻铮改了半寸站位，原先有效的判断就不够用了。局部拆手并不等于赢过高手，更不等于入化。' },
  promise: { name: '把话落到脚下', text: '你没有急着把一句“懂了”说出口，而是说清下一步愿意做的事。说过的话有相应的练习，人也会记得。' },
} as const;
