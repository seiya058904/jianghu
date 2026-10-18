import {readingLock as workReadingLock} from './chronicle-access.ts';
import {isCampaign,isChronicle,chronicle,campaignEdition,edition} from './edition.ts';
import {indexHtml} from './work-index.ts';
import './stage.css';
import { VNRuntime, restoreVN, type Phase } from './vn-runtime.ts';
import { characters, emotions, scenes, facts, endings, cgs } from './catalog.ts';
import { base, escape, button, header, cover, player, cast, choices, finish } from './vn-ui.ts';

const PREFIX = edition.prefix, LEGACY = 'jianghu:v1:';
const app = document.querySelector<HTMLDivElement>('#app')!;
const read = (key: string, prefix = PREFIX) => { try { return localStorage.getItem(prefix + key); } catch { return null; } };
let observedAuto = read('auto');
const write = (key: string, value: string) => { localStorage.setItem(PREFIX + key, value); if (key === 'auto') observedAuto = value; };
type Settings = { size: number; dark: boolean; speed: number; reduced: boolean };
type ControlState = Phase | 'presenting' | 'transition' | 'modalOpen';
let settings: Settings = { size: 20, dark: false, speed: 18, reduced: false };
let session: VNRuntime | null = null, mode: 'cover' | 'play' = 'cover', startupError = '';
let pendingDraftBackup: string | null = null;
let typingTimer = 0, playbackTimer = 0, visibleCount = 0, transitionUntil = 0, inputUntil = 0;
let transitionTimer = 0, inputTimer = 0, renderedScene = '';
let isTyping = false, auto = false, skipping = false, previouslyRead = false;
let dialogReturn: HTMLElement | null = null;
const readBeats = new Set<string>();
const entryLock=()=>workReadingLock(chronicle?.slug??'',key=>localStorage.getItem(key));
try {
  const raw = read('auto');
  if (raw && !entryLock()) { const restored = restoreVN(raw, isCampaign ? campaignEdition : undefined); session = restored.session; if (restored.migrated) { pendingDraftBackup = raw; startupError = restored.migration==='editorial-text'?'旧进度已兼容读入，正文已订正；原始存档保留。':restored.migration?'旧进度已兼容读入，画面已更新；原始存档保留。':'旧样章已兼容读入，人物名已订正；剧情进度保留。'; } }
}
catch (error) { startupError = (error as Error).message; }
try {
  const raw = JSON.parse(read('settings') ?? read('settings', LEGACY) ?? '{}');
  if ([18, 20, 22, 24].includes(raw.size)) settings.size = raw.size;
  settings.dark = raw.dark === true;
  if ([0, 18, 36].includes(raw.speed)) settings.speed = raw.speed;
  settings.reduced = raw.reduced === true;
  const seen = JSON.parse(read('readBeats') ?? '[]');
  if (Array.isArray(seen)) seen.filter(v => typeof v === 'string').slice(-10000).forEach(id => readBeats.add(id));
} catch { startupError ||= '设置或已读记录无法读取；原始数据保留，使用默认设置。'; }
if (location.hash === '#play' && session && !entryLock()) mode = 'play';
const reduced = () => settings.reduced || matchMedia('(prefers-reduced-motion: reduce)').matches;
const dialog = () => document.querySelector<HTMLDialogElement>('dialog')!;
const el = (id: string) => document.getElementById(id)!;
const controlState = (): ControlState => dialog()?.open ? 'modalOpen' : isTyping ? 'presenting' : performance.now() < transitionUntil ? 'transition' : session?.frame.phase ?? 'awaitingAdvance';
function safe(fn: () => void) { try { fn(); } catch (error) { notify((error as Error).message || '操作未完成，现有进度保留。'); } }
function notify(message: string) {
  const toast = document.querySelector<HTMLElement>('.toast')!;
  toast.textContent = message; toast.classList.add('visible');
  if (dialog().open) {
    let feedback = dialog().querySelector<HTMLElement>('.panel-feedback');
    if (!feedback) { feedback = document.createElement('p'); feedback.className = 'panel-feedback'; feedback.setAttribute('role', 'status'); el('dialog-body').prepend(feedback); }
    feedback.textContent = message;
  }
  window.setTimeout(() => toast.classList.remove('visible'), 4500);
}
function applySettings() {
  document.documentElement.dataset.theme = settings.dark ? 'dark' : 'paper';
  document.documentElement.dataset.motion = reduced() ? 'reduced' : 'full';
  document.documentElement.style.setProperty('--reading-size', `${settings.size}px`);
}
function stopTimers() { clearTimeout(typingTimer); clearTimeout(playbackTimer); clearTimeout(transitionTimer); clearTimeout(inputTimer); }
function render(complete = true) {
  stopTimers(); applySettings(); document.body.dataset.mode = mode;
  app.innerHTML = header(mode === 'play') + (mode === 'play' ? player() : cover(session,entryLock())) + '<div class="toast" role="status" aria-live="polite"></div><dialog aria-labelledby="dialog-title"><div class="dialog-top"><h2 id="dialog-title"></h2><button data-action="close" aria-label="关闭面板">关闭</button></div><div id="dialog-body"></div></dialog>';
  document.body.dataset.edition = isChronicle?'chronicle':isCampaign?'campaign':'halfstep';
  document.body.dataset.contentVersion = isCampaign?campaignEdition.version:'';
  dialog().addEventListener('close', () => { inputUntil = 0; dialogReturn?.isConnected ? dialogReturn.focus() : document.querySelector<HTMLElement>('[data-action="saves"]')?.focus(); syncControls(); });
  if (mode === 'play') { present(complete); if(pendingDraftBackup&&(campaignEdition.previousContent||campaignEdition.editorialContent)&&!persist())startupError=''; }
}
function persist() {
  if (!session) return false;
  if (read('auto') !== observedAuto) { notify('另一标签页已更新本篇进度；当前进度未覆盖它，可在存档面板导出本次进度。'); return false; }
  try { if (pendingDraftBackup) { keepDraft(pendingDraftBackup); pendingDraftBackup = null; } write('auto', JSON.stringify(session.save())); return true; }
  catch { notify('浏览器未能保存；仍可游玩，请在存档面板导出本次进度。'); return false; }
}
function preserveAuto() { const raw = read('auto'); if (raw !== null) write('previous', raw); observedAuto = raw; }
function draftKeys() { try { return Object.keys(localStorage).filter(key => key.startsWith(PREFIX) && /^draft-[0-9]+(?:-[0-9]+)?$/.test(key.slice(PREFIX.length))).map(key => key.slice(PREFIX.length)); } catch { return []; } }
function keepDraft(raw: string) {
  if (draftKeys().some(key => read(key) === raw)) return;
  const stamp = Date.now(); let key = `draft-${stamp}`, suffix = 0;
  while (read(key) !== null) key = `draft-${stamp}-${++suffix}`;
  write(key, raw);
}
function unlocked(): Array<keyof typeof endings> {
  try { const ids = JSON.parse(read('endings') ?? '[]'); return Array.isArray(ids) ? [...new Set(ids.filter(id => typeof id === 'string' && Object.hasOwn(endings, id)))] as Array<keyof typeof endings> : []; } catch { return []; }
}
function replayLocks():Record<string,string> {
  const work=chronicle as (typeof chronicle & {replayChoices?:Record<string,string>});
  return !unlocked().length?work?.replayChoices??{}:{};
}
function present(complete = false) {
  stopTimers();
  const frame = session!.frame, scene = scenes[frame.stage.scene];
  previouslyRead = readBeats.has(frame.id); app.dataset.beat = frame.id;
  el('scene-location').textContent = scene.name; el('scene-time').textContent = scene.time;
  const stageImages=frame.stage.cg?[cgs[frame.stage.cg].file,scene.art]:[scene.art];
  document.querySelector<HTMLElement>('.scene-background')!.style.backgroundImage = [...new Set(stageImages)].map(file=>`url('${base}art/${file}')`).join(',');
  document.querySelector<HTMLElement>('.play-stage')!.dataset.cg = frame.stage.cg??'';
  el('stage-action').textContent = frame.action || (isCampaign?'':frame.speaker && frame.speaker !== 'you' ? `${characters[frame.speaker].name}看向你` : '风过院中，剑意未歇');
  el('actors').innerHTML = cast(frame); el('actors').dataset.count = String(frame.stage.cast.length);
  const name = frame.speaker === 'you' ? '你' : frame.speaker ? characters[frame.speaker].name : frame.ending ? endings[frame.ending] : '此刻';
  el('speaker-name').textContent = name;
  el('speaker-emotion').textContent = frame.speaker && frame.speaker !== 'you' ? emotions[frame.stage.moods[frame.speaker] ?? 'neutral'] : frame.ending ? '此篇已完' : '动作';
  const last = session!.history.at(-1);
  el('reply-echo').textContent = last?.selected ? `你刚才：${last.selected}` : '';
  el('dialogue-measure').textContent = frame.text; el('dialogue-visible').textContent = ''; el('dialogue-announcement').textContent = '';
  el('choices-panel').innerHTML = choices(frame,replayLocks()); el('choices-panel').hidden = true;
  el('ending-actions').innerHTML = frame.ending ? finish(frame) : ''; el('ending-actions').hidden = !frame.ending;
  if (frame.phase !== 'awaitingAdvance') { auto = false; skipping = false; }
  if (skipping && !previouslyRead) skipping = false;
  visibleCount = 0; isTyping = !complete && settings.speed > 0 && !reduced();
  transitionUntil = !complete && renderedScene && renderedScene !== frame.stage.scene && !reduced() ? performance.now() + 120 : 0;
  renderedScene = frame.stage.scene;
  document.querySelector<HTMLElement>('.play-stage')!.dataset.scene = frame.stage.scene;
  if (transitionUntil) transitionTimer = window.setTimeout(syncControls, 125);
  if (isTyping) { syncControls(); type(); } else completeText();
  if (frame.ending) safe(() => write('endings', JSON.stringify([...new Set([...unlocked(), frame.ending])])));
}
function type() {
  const glyphs = Array.from(session!.frame.text);
  el('dialogue-visible').textContent = glyphs.slice(0, ++visibleCount).join('');
  if (visibleCount >= glyphs.length) completeText(); else typingTimer = window.setTimeout(type, settings.speed);
}
function completeText() {
  clearTimeout(typingTimer); isTyping = false;
  if (mode !== 'play' || !session) return;
  const frame = session.frame;
  el('dialogue-visible').textContent = frame.text; el('dialogue-announcement').textContent = `${el('speaker-name').textContent}：${frame.text}`;
  el('choices-panel').hidden = frame.phase !== 'awaitingChoice'; readBeats.add(frame.id);
  safe(() => write('readBeats', JSON.stringify([...readBeats].slice(-10000)))); syncControls(); schedule();
  if (frame.phase === 'awaitingChoice' && !dialog().open && document.activeElement?.closest('#dialogue-panel')) el('choices-panel').querySelector<HTMLButtonElement>('button')?.focus({preventScroll:true});
}
function syncControls() {
  if (mode !== 'play' || !session) return;
  app.dataset.phase = controlState();
  clearTimeout(inputTimer);
  const remaining = Math.max(inputUntil, transitionUntil) - performance.now();
  const locked = remaining > 0;
  if (locked) inputTimer = window.setTimeout(syncControls, remaining + 2);
  const next = el('advance-button') as HTMLButtonElement;
  next.disabled = locked || (!isTyping && session.frame.phase !== 'awaitingAdvance');
  for (const choice of el('choices-panel').querySelectorAll<HTMLButtonElement>('button')) choice.disabled = locked || isTyping || choice.dataset.replayLocked==='true';
  next.setAttribute('aria-label', isTyping ? '显示全文' : '继续对白'); next.textContent = isTyping ? '显示全文' : '继续';
  el('advance-hint').textContent = isTyping ? '点击先显示全文' : session.frame.phase === 'awaitingChoice' ? '等你回应' : session.frame.phase === 'ending' ? '这一场，已有回响。' : '点击对白 · Enter / 空格';
  for (const [action, active] of [['auto', auto], ['skip', skipping]] as const) {
    const node = app.querySelector(`[data-action="${action}"]`)!; node.setAttribute('aria-pressed', String(active)); (node as HTMLButtonElement).disabled = session.frame.phase === 'ending';
  }
}
function schedule() {
  clearTimeout(playbackTimer);
  if (dialog().open || isTyping || session?.frame.phase !== 'awaitingAdvance') return;
  if (auto || (skipping && previouslyRead)) playbackTimer = window.setTimeout(() => safe(progress), skipping ? 300 : Math.max(2300, session!.frame.text.length * 85));
}
function progress() {
  if(!permitEntry())return;
  const phase = controlState();
  if (mode !== 'play' || !session || phase === 'modalOpen' || phase === 'transition') return;
  if (phase === 'presenting') { completeText(); return; }
  if (phase !== 'awaitingAdvance') return;
  session.advance(); present(); persist();
}
function respond(id: string) {
  if(!permitEntry())return;
  if (controlState() !== 'awaitingChoice') return;
  if(replayLocks()[id]){notify(replayLocks()[id]);return;}
  session!.choose(id); present(); persist(); el('dialogue-panel').focus({ preventScroll: true });
}
function openDialog(title: string, html: string) {
  clearTimeout(playbackTimer); auto = false; skipping = false; if (isTyping) completeText();
  const d = dialog(); if (!d.open) dialogReturn = document.activeElement as HTMLElement;
  el('dialog-title').textContent = title; el('dialog-body').innerHTML = html; if (!d.open) d.showModal(); d.scrollTop = 0; syncControls();
}
function permitEntry(){const reason=entryLock();if(reason){notify(reason);return false}return true}
function begin() {
  if(!permitEntry())return;
  const next = new VNRuntime(isCampaign ? campaignEdition.content : undefined, isCampaign ? campaignEdition.version : undefined); preserveAuto();
  session = next; mode = 'play'; auto = false; skipping = false; location.hash = 'play'; render(false); el('dialogue-panel').focus({ preventScroll: true });
  persist();
}
function requestNew() {
  if(!permitEntry())return;
  if (session || read('auto')) openDialog('重新开始', '<p>新篇自动档会先保存到“上一程”。三个手动槽和旧篇数据保留。已有上一程会被替换，长期留存请先导出。</p><div class="dialog-actions">' + button('先去存档', 'saves', 'secondary') + button('备份并开始', 'begin', 'primary') + '</div>'); else begin();
}
function load(raw: string) {
  if(!permitEntry())return;
  const candidate = restoreVN(raw, isCampaign ? campaignEdition : undefined); if (candidate.migrated) keepDraft(raw); preserveAuto(); write('auto', JSON.stringify(candidate.save));
  session = candidate.session; mode = 'play'; auto = false; skipping = false; location.hash = 'play'; render(); el('dialogue-panel').focus({ preventScroll: true }); notify('已恢复对白、人物与选择；旧进度保存在上一程。');
}
function download(raw: string, name: string) {
  const url = URL.createObjectURL(new Blob([raw], { type: 'application/json' })); const a = document.createElement('a'); a.href = url; a.download = `Jianghu-${name}.json`; a.click(); setTimeout(() => URL.revokeObjectURL(url), 2000);
}
function saves() {
  const baseKeys = ['auto', 'slot1', 'slot2', 'slot3', 'previous'];
  const keys = [...baseKeys, ...draftKeys()];
  const rows = keys.map((key, i) => {
    const raw = read(key); let text = '尚无存档', valid = false;
    if (raw) { try { const { session: s, save } = restoreVN(raw, isCampaign ? campaignEdition : undefined); text = `${scenes[s.frame.stage.scene].name} · ${s.frame.choices.length ? '等待回复' : s.frame.ending ? '此篇已完' : '对白途中'} · ${new Date(save.savedAt).toLocaleString('zh-CN', { timeZone: 'Asia/Shanghai' })}`; valid = true; } catch { text = '数据损坏或版本不兼容 · 原始数据保留'; } }
    return `<section class="save-row"><h3>${i < 5 ? ['自动存档', '手动存档一', '手动存档二', '手动存档三', '上一程备份'][i] : campaignEdition.editorialContent?'正文订正前原始备份':campaignEdition.previousContent?'画面调整前原始备份':'兼容前样章原始备份'}</h3><p>${escape(text)}</p><div class="row-actions">${i > 0 && i < 4 && session ? button('保存到此处', 'slot-save', '', `data-slot="${key}"`) : ''}${valid ? button('读取', 'slot-load', '', `data-slot="${key}"`) : ''}${raw ? button('导出原始数据', 'slot-export', '', `data-slot="${key}"`) : ''}</div></section>`;
  }).join('');
  const oldRows = baseKeys.filter(key => read(key, LEGACY) !== null).map(key => `<p class="legacy-save">${escape(({ auto: '旧篇自动档', previous: '旧篇上一程', slot1: '旧篇手动一', slot2: '旧篇手动二', slot3: '旧篇手动三' } as Record<string, string>)[key])}${button('导出旧篇原始数据', 'legacy-export', '', `data-slot="${key}"`)}</p>`).join('');
  const ended = unlocked();
  openDialog('存档与备份', `<p class="panel-intro">${edition.title} · 每条对白与回复后自动保存。读档前先备份当前自动档，演出恢复到全文显示状态。</p>${rows}<section class="import-export">${session ? button('导出本次进度', 'export', 'secondary') : ''}<label class="file-label">导入本篇存档 JSON<input id="import-file" type="file" accept="application/json,.json"></label><p>不超过 1 MB；验证作品与版本成功后才替换进度。</p></section><section class="entry"><h3>已读的归宿 · ${ended.length} / ${edition.endings}</h3><p>${ended.length ? ended.map(id => endings[id]).join(' · ') : '未读结局的名字，留给你的选择。'}</p></section>${isCampaign?`<section class="entry"><h3>旧篇《半步之约》</h3><p>原来的自动档、手动槽与兼容前备份，均在原篇读取和导出。</p><a href="${base}half-step.html">打开《半步之约》与原存档</a></section>`:''}<section class="entry"><h3>旧篇《渡口无碑》</h3><p>旧篇剧情与新篇独立，旧数据保持原样，可继续游玩或导出。旧篇存档请在旧篇页面导入。</p><a href="${base}legacy.html#read">打开旧篇与旧存档</a>${oldRows}</section>`);
  document.querySelector<HTMLInputElement>('#import-file')!.addEventListener('change', async event => {
    const file = (event.target as HTMLInputElement).files?.[0]; if (!file) return;
    if (file.size > 1_000_000) { notify('存档超过 1 MB，原文件保留。'); return; }
    try { load(await file.text()); } catch (error) { notify((error as Error).message); }
  });
}
function saveSlot(key: string) { if (session) { if (pendingDraftBackup) { keepDraft(pendingDraftBackup); pendingDraftBackup = null; } const existing = read(key); let needsBackup = false; if (existing) { try { needsBackup = Boolean(restoreVN(existing, isCampaign ? campaignEdition : undefined).migrated); } catch { /* Explicit overwrite keeps its original semantics for unreadable slots. */ } } if (needsBackup) keepDraft(existing!); write(key, JSON.stringify(session.save())); saves(); notify('手动存档已保存。'); } }
function showSettings() {
  openDialog('演出设置', `<fieldset><legend>对白字号</legend><div class="setting-options">${[18, 20, 22, 24].map(n => button(`${n} 字号`, 'size', '', `data-value="${n}" aria-pressed="${settings.size === n}"`)).join('')}</div></fieldset><fieldset><legend>纸与夜色</legend>${button('纸本', 'paper', '', `aria-pressed="${!settings.dark}"`)}${button('夜读', 'dark', '', `aria-pressed="${settings.dark}"`)}</fieldset><fieldset><legend>文字出现速度</legend>${[[18, '正常'], [36, '舒缓'], [0, '立即显示']].map(([n, text]) => button(String(text), 'speed', '', `data-value="${n}" aria-pressed="${settings.speed === n}"`)).join('')}</fieldset><fieldset><legend>动作与转场</legend>${button('减弱动态效果', 'motion', '', `aria-pressed="${settings.reduced}"`)}</fieldset><p class="preview-text">先看他落脚，再决定你出哪一剑。</p><p>点击对白或按 Enter / 空格推进；文字出现时先显示全文。Tab 切换按钮，Esc 关闭面板。自动与已读快进在回复处停止；系统减弱动态效果时立即显示全文。无需声音即可完整游玩。</p>`);
  if(edition.offlineWork)el('dialog-body').insertAdjacentHTML('beforeend',`<section class="entry"><h3>本篇离线游玩</h3><p>下载本篇所有场景和画像，断网后也能走尚未游玩的分支。其他作品按需下载。</p>${button(`下载《${edition.title}》离线资源`,'offline','secondary')}</section>`);
}
function showLibrary(){
  openDialog('选一段江湖', indexHtml(base));
}
async function prepareOffline(){
  const button=dialog().querySelector<HTMLButtonElement>('[data-action="offline"]');if(button)button.disabled=true;
  let expired=false,timer=0,channel:MessageChannel|undefined;
  try{
    if(!('serviceWorker' in navigator))throw new Error('unsupported');
    notify(`正在下载《${edition.title}》的离线资源……`);
    await Promise.race([
      new Promise<never>((_,reject)=>{timer=window.setTimeout(()=>{expired=true;reject(new Error('timeout'))},30000)}),
      (async()=>{
        const registration=await navigator.serviceWorker.ready;
        if(expired)throw new Error('timeout');
        const worker=registration.active;if(!worker)throw new Error('inactive');
        await new Promise<void>((resolve,reject)=>{
          channel=new MessageChannel();
          channel.port1.onmessage=event=>{event.data?.ok?resolve():reject(new Error('download'))};
          worker.postMessage({type:'cache-work',work:edition.offlineWork},[channel.port2]);
        });
      })(),
    ]);
    notify(`《${edition.title}》离线资源已备好，可断网继续；浏览器清理网站数据后需重新下载。`);
  }catch{notify('本篇离线资源未备齐；请联网后重试，当前存档保留。')}
  finally{expired=true;clearTimeout(timer);channel?.port1.close();channel?.port2.close();if(button?.isConnected)button.disabled=false}
}
function knowledge() {
  const encounters=new Map<string,string>();
  for(const frame of session!.frames)for(const id of frame.stage.cast)encounters.set(characters[id].canonicalIdentity??id,id);
  const seen=[...encounters.values()], known = Object.entries(facts).filter(([id]) => session!.tags.has(`fact:${id}`));
  openDialog('人物与见闻', `<p class="panel-intro">只记你已遇见的人、已观察到的事。${isChronicle?'本篇改编自《宋世江湖》'+chronicle?.title+'；视角为'+chronicle?.viewpoint+'。':'此篇为原作世界中的原创旁支。'}</p><h3>相逢之人</h3>` + [...seen].map(id => `<section class="entry person-entry">${isCampaign?`<img src="${base}art/${characters[id].portrait.file}" alt="${characters[id].name}" loading="lazy" onerror="this.hidden=true">`:''}<div><h4>${characters[id].name}<span>${characters[id].role}</span></h4><p>${characters[id].detail}</p></div></section>`).join('') + '<h3>一路所得</h3>' + (known.length ? known.map(([, fact]) => `<section class="entry"><h4>${fact.name}</h4><p>${fact.text}</p></section>`).join('') : '<p>你还未留下新的见闻。</p>'));
}
const chapterScene=(scene:string)=>campaignEdition.previousContent&&(scene==='v6_afterhall'||scene.startsWith('v6_end_'))?'v6_dawn':scene;
function history(scene?:string) {
  openDialog('这一场的回顾', '<p class="panel-intro">仅回看已经抵达的对白与实际回复，不会重做选择。</p><ol class="history-list">' + session!.frames.filter(b=>!scene||chapterScene(b.stage.scene)===scene).map(b => `<li><span>${b.speaker === 'you' ? '你' : b.speaker ? characters[b.speaker].name : '动作'}</span><p>${escape(b.text)}</p>${b.selected ? `<p class="chosen">你：${escape(b.selected)}</p>` : ''}</li>`).join('') + '</ol>');
}
function showChapters(){
  const seen=new Set(session?.frames.map(b=>chapterScene(b.stage.scene))??[]);
  openDialog('这一程的章节',`<p class="panel-intro">已到 ${seen.size} 处。只读回顾已经亲历的章节；未走过的路留待下一程。</p><ol class="chapter-list">${edition.chapters.map(([id,name])=>`<li>${seen.has(id)?button(escape(name),'chapter-history','','data-scene="'+id+'"'):'<span>尚未抵达</span>'}${session&&chapterScene(session.frame.stage.scene)===id?'<small>当前所在</small>':''}</li>`).join('')}</ol>`);
}
app.addEventListener('click', event => {
  if (event.detail > 1) return;
  const target = (event.target as HTMLElement).closest<HTMLElement>('[data-action]'); if (!target) return;
  if (dialog().open && !dialog().contains(target)) return;
  const action = target.dataset.action;
  if ((action === 'advance' || action === 'choice') && performance.now() < inputUntil) return;
  if (action === 'advance' && target.tagName !== 'BUTTON' && getSelection()?.toString()) return;
  if (action === 'advance' || action === 'choice') inputUntil = performance.now() + 180;
  safe(() => {
    if (action === 'advance') progress(); else if (action === 'choice') respond(target.dataset.choice!);
    else if (action === 'new') requestNew(); else if (action === 'begin') begin();
    else if (action === 'continue') { if(!permitEntry()||!session)return; mode = 'play'; location.hash = 'play'; render(); el('dialogue-panel').focus({ preventScroll: true }); }
    else if (action === 'offline') { void prepareOffline(); }
    else if (action === 'library') { showLibrary(); }
    else if (action === 'home') { auto = false; skipping = false; mode = 'cover'; location.hash = ''; render(); }
    else if (action === 'close') dialog().close(); else if (action === 'saves') saves(); else if (action === 'settings') showSettings(); else if (action === 'knowledge') knowledge(); else if (action === 'history') history();
    else if(action==='chapters') showChapters(); else if(action==='chapter-history') history(target.dataset.scene);
    else if (action === 'auto') { skipping = false; auto = !auto; syncControls(); schedule(); }
    else if (action === 'skip') { auto = false; skipping = !skipping && previouslyRead; if (!skipping && !previouslyRead) notify('当前对白尚未读过；快进只经过已读内容。'); syncControls(); schedule(); }
    else if (['size', 'paper', 'dark', 'speed', 'motion'].includes(action!)) {
      if (action === 'size') settings.size = Number(target.dataset.value); else if (action === 'speed') settings.speed = Number(target.dataset.value); else if (action === 'motion') settings.reduced = !settings.reduced; else settings.dark = action === 'dark';
      applySettings(); write('settings', JSON.stringify(settings)); showSettings();
    } else if (action === 'slot-save') {
      const key = target.dataset.slot!;
      if (read(key)) openDialog('替换手动存档', '<p>这个槽已有进度。可先返回导出，再确认替换。</p><div class="dialog-actions">' + button('返回存档', 'saves', 'secondary') + button('确认替换', 'slot-replace', 'primary', `data-slot="${key}"`) + '</div>'); else saveSlot(key);
    } else if (action === 'slot-replace') saveSlot(target.dataset.slot!); else if (action === 'slot-load') load(read(target.dataset.slot!)!); else if (action === 'slot-export') download(read(target.dataset.slot!)!, target.dataset.slot!); else if (action === 'legacy-export') download(read(target.dataset.slot!, LEGACY)!, `旧篇-${target.dataset.slot}`); else if (action === 'export') download(JSON.stringify(session!.save(), null, 2), edition.title);
  });
});
document.addEventListener('keydown', event => {
  if (mode !== 'play' || event.repeat || dialog().open || !['Enter', ' '].includes(event.key)) return;
  if ((event.target as HTMLElement).closest('button,a,input,select,textarea,summary')) return;
  event.preventDefault(); if (performance.now() < inputUntil) return; inputUntil = performance.now() + 180; safe(progress);
});
window.addEventListener('storage',event=>{if(['north-notes','bamboo','beyond-ranking'].includes(chronicle?.slug??'')&&(!event.key||event.key.endsWith(':endings'))){if(entryLock()){mode='cover';location.hash=''}render()}});
window.addEventListener('pagehide', () => { stopTimers(); if (mode === 'play') persist(); });
document.addEventListener('visibilitychange', () => { if (document.hidden) { clearTimeout(playbackTimer); if (mode === 'play') { auto = false; skipping = false; syncControls(); } } });
render(); if (startupError) notify(startupError + ' 可在存档面板导出原始数据。');
if ('serviceWorker' in navigator && import.meta.env.PROD) {
  const register=()=>{navigator.serviceWorker.register(`${base}sw.js`).catch(()=>notify('离线缓存未启用；当前在线游玩仍可继续。'))};
  if(document.readyState==='complete')register();else window.addEventListener('load',register,{once:true});
}
