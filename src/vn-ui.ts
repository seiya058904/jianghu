import {isCampaign,isV5Archive,chronicle,edition} from './edition.ts';
import {resolvePortrait} from './catalog.ts';
import {chronicleCompanions,chronicleExtras,chronicleWorks} from './chronicle-catalog.ts';
import { characters, emotions, scenes, endings } from './catalog.ts';
import type { VNRuntime, Beat } from './vn-runtime.ts';
export const base = import.meta.env.BASE_URL;
export const escape = (value: string) => value.replace(/[&<>"']/g, c => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c]!));
export const arrow = '<svg viewBox="0 0 24 24" aria-hidden="true"><path d="M4 12h15m-5-5 5 5-5 5"/></svg>';
export const button = (label: string, action: string, cls = '', attrs = '') => `<button class="${cls}" data-action="${action}" ${attrs}>${label}</button>`;
export function header(playing: boolean) {
  return `<header class="header"><button class="brand" data-action="home" aria-label="Jianghu 封面">Jianghu<span class="seal" aria-hidden="true">江湖</span></button><nav aria-label="游戏工具">${playing ? button('见闻', 'knowledge') + button('回顾', 'history')+(isCampaign?button('章节','chapters'):'') : button('选篇','library')}${button('存档', 'saves')}${button('设置', 'settings')}</nav></header>`;
}
export function cover(session: VNRuntime | null, entryLock = '') {
  const related=chronicle?chronicleCompanions[chronicle.slug]:undefined,companion=related?chronicleWorks.find(work=>work.slug===related.slug):undefined;
  const chronicleArt=chronicle?new URL(`${base}art/${chronicle.coverArt}`,location.href).href:'';
  const links=[...(companion?[related!]:[]),...(chronicle?chronicleExtras[chronicle.slug]??[]:[])];
  const seriesLink=links.map(link=>{const target=chronicleWorks.find(work=>work.slug===link.slug)!;return `<p class="series-link"><a href="${base}${target.file}">${escape(link.label)}${arrow}</a></p>`}).join('');
  const lockedAttrs=entryLock?' disabled aria-disabled="true"':'';
  if(chronicle) return `<main class="cover chronicle-cover${links.length?' has-companion':''}" style="--chronicle-scene:url('${chronicleArt}')"><div class="cover-scene" aria-hidden="true"></div><section class="cover-copy"><h1>${chronicle.title}</h1><p class="cover-hook">${chronicle.hook}</p><p class="cover-intro">${chronicle.intro}</p><div class="cover-actions">${session?button('继续这一场'+arrow,'continue','primary',lockedAttrs)+button('重新开始','new','secondary',lockedAttrs):button(edition.start+arrow,'new','primary',lockedAttrs)}${entryLock?`<p class="resume-note" data-reading-lock>${escape(entryLock)}</p>`:''}</div><p class="resume-note">${session?`已至 · ${escape(scenes[session.frame.stage.scene].time)}`:`原典纪事 · ${chronicle.viewpoint} · ${chronicle.note}`}</p>${seriesLink}</section><p class="cover-note">宋世江湖 · ${chronicle.title}</p><div class="archive-links"><a href="${base}index.html">回到作品库${arrow}</a><a href="${base}index.html#archive">历史版本与旧存档</a></div></main>`;
  if(isCampaign) return `<main class="cover campaign-cover"><div class="cover-scene" aria-hidden="true"></div><div class="cover-portrait" aria-hidden="true"></div><section class="cover-copy"><h1>潮生有约</h1><p class="cover-hook">想赢一场，<br>也想让他们都回来。</p><p class="cover-intro">木剑、米袋、一场地方武会。<br>说出口的承诺，要一起带到岸上。</p><div class="cover-actions">${session?button('继续这一程'+arrow,'continue','primary')+button('重新启程','new','secondary'):button(edition.start+arrow,'new','primary')}</div><p class="resume-note">${session?`已至 · ${escape(scenes[session.frame.stage.scene].time)}`:'陆路与水路，各有相逢。'}</p></section><p class="cover-note">宋世江湖 · 原创地方篇《潮生有约》</p><div class="archive-links">${isV5Archive?`<a href="${base}tide-v6.html">现行《潮生有约》</a>`:`<a href="${base}tide-v5.html">旧版《潮生有约》与原存档</a>`}<a href="${base}index.html">回到作品库</a><a href="${base}half-step.html">旧篇《半步之约》</a><a href="${base}legacy.html">旧篇《渡口无碑》${arrow}</a></div></main>`;
  return `<main class="cover"><div class="cover-scene" aria-hidden="true"></div><div class="cover-portrait" aria-hidden="true"></div><section class="cover-copy"><h1>半步之约</h1><p class="cover-hook">剑还没出鞘，<br>胆气先被人看穿了。</p><div class="cover-actions">${session ? button('继续这一场' + arrow, 'continue', 'primary') + button('重新开始', 'new', 'secondary') : button('走进院子' + arrow, 'new', 'primary')}</div><p class="resume-note">${session ? `已至 · ${escape(scenes[session.frame.stage.scene].name)}` : '你说什么，你做什么，他们会记得。'}</p></section><p class="cover-note">宋世江湖 · 一场问剑，三个相逢的人</p><a class="archive-link" href="${base}legacy.html">旧篇《渡口无碑》${arrow}</a></main>`;
}
export function player() {
  return `<main class="play-stage" aria-label="${edition.title}游戏舞台"><div class="scene-background" aria-hidden="true"></div><section class="scene" data-action="advance" aria-label="当前场景"><div class="scene-heading"><h1 id="scene-location"></h1><span id="scene-time"></span></div><div id="stage-action" class="stage-action"></div><div id="actors" class="actors"></div></section><section id="choices-panel" class="choices-panel" aria-label="玩家回复" hidden></section><section id="dialogue-panel" class="dialogue-panel" tabindex="0" aria-label="当前对白，Enter 或空格继续" data-action="advance"><div class="dialogue-top"><h2 id="speaker-name"></h2><span id="speaker-emotion"></span><span id="reply-echo" class="reply-echo"></span></div><div class="dialogue-copy" tabindex="0" role="region" aria-label="对白正文，可滚动阅读"><span id="dialogue-measure" aria-hidden="true"></span><span id="dialogue-visible" aria-hidden="true"></span></div><div id="dialogue-announcement" class="sr-only" role="status" aria-live="polite" aria-atomic="true"></div><div class="dialogue-controls"><div class="playback-controls">${button('自动', 'auto', '', 'aria-pressed="false"')}${button('已读快进', 'skip', '', 'aria-pressed="false"')}</div><span id="advance-hint"></span>${button('继续', 'advance', 'advance-button', 'id="advance-button"')}</div><div id="ending-actions" class="ending-actions" hidden></div></section></main>`;
}
export function cast(frame: Beat) {
  return frame.stage.cast.map(id => {
    const person = characters[id], mood = frame.stage.moods[id] ?? 'neutral';
    const visual = {...resolvePortrait(id, mood,frame.stage.looks?.[id])!};
    // The inherited smiling sprite contains a large baked halo. The current
    // edition uses the clean portrait of the same age until a clean expression
    // is available; frozen editions retain their original resource selection.
    if(chronicle?.slug==='twelfth-life'&&id==='rl2_lu'&&frame.stage.looks?.[id]==='mid'&&mood==='amused')visual.file='v6/rl-lu-mid.webp';
    const portraitURL = new URL(`${base}art/${visual.file}`, location.href).href;
    if(frame.stage.camera==='portrait'&&frame.stage.cast.length===1){visual.size='auto 240%';visual.position='center top'}
    return `<figure class="actor ${frame.stage.focus === id ? 'focused' : 'listening'} mood-${mood}" data-character="${id}" data-emotion="${mood}" data-look="${escape(frame.stage.looks?.[id]??'default')}" style="--portrait-image:url('${portraitURL}');--portrait-position:${visual.position};--portrait-size:${visual.size}" role="img" aria-label="${person.name}，${emotions[mood]}${frame.stage.focus === id ? '，正在说话' : ''}"><div class="portrait" aria-hidden="true"></div><figcaption>${person.name}<span>${emotions[mood]}</span></figcaption></figure>`;
  }).join('');
}
export function choices(frame: Beat, replayLocks:Record<string,string>={}) {
  return `<p class="choice-prompt">${escape(frame.prompt)}</p><div class="choice-list">${frame.choices.map(c => button(`<span>${escape(c.text)}${replayLocks[c.id]?`<small class="choice-lock">${escape(replayLocks[c.id])}</small>`:''}</span>${arrow}`, 'choice', 'choice', `data-choice="${c.id}"${replayLocks[c.id]?' disabled aria-disabled="true" data-replay-locked="true"':''}`)).join('')}</div>`;
}
export function finish(frame: Beat) {
  return `<p>此篇已完 · ${endings[frame.ending!]}</p><div>${button('收好这一程', 'saves', 'secondary')}${button('再试另一种回应', 'new', 'primary')}${button('回到封面', 'home')}</div>`;
}
