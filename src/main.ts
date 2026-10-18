import './styles.css';
import { Session, restore, CHAPTERS, ENDINGS, type Frame } from './runtime.ts';
import { read, write, persist, preserveAuto, describe } from './storage.ts';
import { people, facts } from './knowledge.ts';

const app = document.querySelector<HTMLDivElement>('#app')!;
const art = `${import.meta.env.BASE_URL}art/ferry.png`;
const arrow = '<svg viewBox="0 0 24 24" aria-hidden="true"><path d="M4 12h15m-5-5 5 5-5 5"/></svg>';
const escape = (v: string) => v.replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]!));
const button = (text: string, action: string, cls = '', attrs = '') => `<button class="${cls}" data-action="${action}" ${attrs}>${text}</button>`;
let session: Session | null = null;
let mode: 'cover'|'read' = 'cover';
let dialogReturn: HTMLElement | null = null;
let size = 20, dark = false;
let startupError = '';
let savedScroll = 0;
function unlockedEndings(): string[] {
  try {const value=JSON.parse(read('endings')??'[]');return Array.isArray(value)?value.filter(x=>ENDINGS.includes(x)):[];}catch{return [];}
}
try {
  const raw = read('auto');
  if (raw) { const restored = restore(raw); session = restored.session; savedScroll = restored.save.ui.scroll; }
  const settings = JSON.parse(read('settings') ?? '{}');
  if ([18,20,22,24].includes(settings.size)) size = settings.size;
  dark = settings.dark === true;
} catch (e) { startupError = (e as Error).message; }
if (location.hash === '#read' && session) mode = 'read';
const heading = (f:Frame) => `<div class="scene-heading"><span class="chapter-kicker">${f.ending ? '终章' : ['序','一','二','三','四'][f.chapter]}${f.ending ? ' · 渡口之后' : ' · '+CHAPTERS[f.chapter]}</span><h1 tabindex="-1" id="scene-title">${escape(f.title)}</h1><p>${escape(f.place)}</p><span class="seal" aria-hidden="true">渡</span></div>`;
function prose(f:Frame) {
  return f.paragraphs.map(p=>p === '后来的人' ? '<h2 class="after-title">后来的人</h2>' : p === '全篇完' ? '<p class="finis">全篇完</p>' : `<p>${escape(p)}</p>`).join('');
}
function header() {
  return `<header class="header"><button class="brand" data-action="home" aria-label="Jianghu 封面">Jianghu<span class="seal">江湖</span></button><nav aria-label="阅读工具">${mode==='read' ? button('见闻','knowledge')+button('回顾','history') : ''}${button('存档','saves')}${button('设置','settings')}</nav></header>`;
}
function applySettings() {
  document.documentElement.dataset.theme = dark ? 'dark' : 'paper';
  document.documentElement.style.setProperty('--reading-size',`${size}px`);
}
function render(focus = false) {
  applySettings();
  app.innerHTML = header() + (mode === 'cover' ? cover() : reader()) + '<div class="toast" role="status" aria-live="polite"></div><dialog aria-labelledby="dialog-title"><div class="dialog-top"><h2 id="dialog-title"></h2><button data-action="close" aria-label="关闭面板">关闭</button></div><div id="dialog-body"></div></dialog>';
  if(focus && mode === 'read') { window.scrollTo(0,0); document.querySelector<HTMLElement>('#scene-title')?.focus({preventScroll:true}); }
  document.querySelector('dialog')!.addEventListener('close',()=>dialogReturn?.focus());
}
function cover() {
  return `<main class="cover"><div class="cover-art" role="img" aria-label="秋雨中的渡船、灯火与远山" style="background-image:url('${art}')"></div><section class="cover-copy"><div class="title-block"><h1>渡口无碑</h1><p class="hook">渡船上少了一个人，<br>账簿上却多了一笔银子。</p></div><div class="cover-actions">${session ? button('继续阅读'+arrow,'continue','primary')+button('另起一程','new','secondary') : button('开始故事'+arrow,'new','primary')}${session ? `<p class="resume-note">已读至 · ${escape(session.frame.title)}</p>` : '<p class="resume-note">单人互动小说 · 全篇完结</p>'}</div></section><p class="cover-footer">一部关于证词、渡船与留下之人的江湖短篇</p></main>`;
}
function reader() {
  const s = session!, f = s.frame;
  const readChapters = new Set(s.frames.map(frame=>frame.chapter));
  return `<div class="reading-layout"><aside class="chapter-rail" aria-label="已读章节"><div class="rail-list">${CHAPTERS.map((c,i)=>`<button data-action="chapter" data-chapter="${i}" ${readChapters.has(i)?'':'disabled'} ${f.chapter===i?'aria-current="step"':''}><span>${['序','一','二','三','四','终'][i]}</span>${c}</button>`).join('')}</div><div class="rail-art" style="background-image:url('${art}')"></div><p>江湖不在远方<br>在每一个选择里。</p></aside><main class="reader ${f.ending?'ending':''}"><div class="reading-meta"><span>${f.ending?'终':'第 '+['零','一','二','三','四'][f.chapter]+' 章'}</span><span class="rule"></span><span>白蘋渡记</span></div>${heading(f)}<article class="prose">${prose(f)}</article>${f.choices.length?`<section class="choices" aria-label="接下来"><p class="choice-hint">${f.choices.length>1?'你将如何回应':'翻过这一页'}</p>${f.choices.map((c,i)=>`<button data-action="choice" data-choice="${c.id}"><span class="choice-number">${String(i+1).padStart(2,'0')}</span><span>${escape(c.text)}</span>${arrow}</button>`).join('')}</section>`:`<section class="ending-actions"><p>这一程到这里，人的日子还会继续。</p>${button('收好这一卷','saves','primary')}${button('回到封面','home','secondary')}${button('再走另一程','new','text-button')}</section>`}<footer class="reader-footer"><span>Jianghu · 渡口无碑</span><span>文字或许无碑，但人会记得。</span></footer></main></div>`;
}
function notify(message: string) {
  const modal=document.querySelector<HTMLDialogElement>('dialog[open]');
  if(modal){
    let feedback=modal.querySelector<HTMLElement>('.panel-feedback');
    if(!feedback){feedback=document.createElement('p');feedback.className='panel-feedback';feedback.setAttribute('role','status');modal.querySelector('#dialog-body')!.prepend(feedback);}
    feedback.textContent=message;
  }
  const el = document.querySelector<HTMLElement>('.toast')!;
  el.textContent = message; el.classList.add('visible');
  window.setTimeout(()=>el.classList.remove('visible'),5000);
}
function openDialog(title: string, html: string) {
  const d = document.querySelector<HTMLDialogElement>('dialog')!;
  if(!d.open) dialogReturn = document.activeElement as HTMLElement;
  d.querySelector('#dialog-title')!.textContent=title;
  d.querySelector('#dialog-body')!.innerHTML=html;
  if(!d.open) d.showModal();
  d.scrollTop=0;
}
function closeDialog() { document.querySelector<HTMLDialogElement>('dialog')!.close(); }
function safe(action:()=>void) { try { action(); } catch(e) { notify((e as Error).message || '操作未完成，现有进度仍保留。'); } }
function saveCurrent() {
  if (!session) return;
  try { persist(session,mode==='read'?window.scrollY:savedScroll); }
  catch { notify('浏览器未能保存。你仍可继续阅读，请在存档面板导出本次进度。'); }
}
function markEnding() {
  if(!session?.frame.ending) return;
  safe(()=>{
    const unlocked = unlockedEndings();
    write('endings',JSON.stringify([...new Set([...unlocked,session!.frame.ending])]));
  });
}
function start() {
  // A failed backup leaves the existing game intact; a fresh game can run in memory.
  preserveAuto();
  const next = new Session();
  session = next; savedScroll=0; mode='read'; location.hash='read'; render(true);
  saveCurrent();
}
function confirmNew() {
  if(session || read('auto')) {
    openDialog('另起一程', '<p>当前自动存档会先保存在“上一程”备份，手动存档与已读结局不会改变。已有“上一程”会被这次备份替换；如需长期保留，请先导出。</p><div class="dialog-actions">'+button('先去存档','saves','secondary')+button('备份并开始','start-confirm','primary')+'</div>');
  } else start();
}
function saves() {
  const unlocked=unlockedEndings();
  const names:Record<string,string>={public:'留痕',quiet:'灯下人',common:'众人之渡',leave:'过江'};
  const gallery=`<section class="entry"><h3>已读的归宿 · ${new Set(unlocked).size} / 4</h3><p>${unlocked.length?[...new Set(unlocked)].map(id=>names[id]).join(' · '):'还没有走到尾声。未读结局的名字会留给故事。'}</p></section>`;
  const rows = ['auto','slot1','slot2','slot3','previous'].map((key,i)=>{
    const raw=read(key); let description='尚无存档', valid=false;
    if(raw) { try { description=describe(raw); valid=true; } catch { description='数据损坏或版本不兼容 · 原始数据已保留'; } }
    return `<section class="save-row"><h3>${['自动存档','手动存档一','手动存档二','手动存档三','上一程备份'][i]}</h3><p>${escape(description)}</p><div class="row-actions">${i>0&&i<4&&session?button('保存到此处','slot-save','',`data-slot="${key}"`):''}${valid?button('读取','slot-load','',`data-slot="${key}"`):''}${raw?button('导出原始数据','slot-export','',`data-slot="${key}"`):''}</div></section>`;
  }).join('');
  openDialog('存档与备份', `<p class="panel-intro">每次选择后自动保存。读取存档会先备份当前自动档；跨周目的结局记录另行保存。</p>${rows}<div class="import-export">${session?button('导出本次进度','export-current','secondary'):''}<label class="file-label">导入存档 JSON<input id="import-file" type="file" accept="application/json,.json"></label><p>仅支持本作当前内容版本，文件不超过 1 MB。导入前校验，成功后再替换自动档。</p></div>${gallery}`);
  document.querySelector<HTMLInputElement>('#import-file')!.addEventListener('change',async e=>{
    const file=(e.target as HTMLInputElement).files?.[0]; if(!file)return;
    if(file.size>1_000_000){notify('存档超过 1 MB，未读取。');return;}
    try { const raw=await file.text(); const candidate=restore(raw); preserveAuto(); write('auto',raw); session=candidate.session; savedScroll=candidate.save.ui.scroll; mode='read'; location.hash='read';render();window.scrollTo(0,savedScroll);markEnding();notify('存档已导入，旧进度保存在上一程。'); }
    catch(e){notify((e as Error).message);}
  });
}
function download(raw: string, name: string) {
  const url=URL.createObjectURL(new Blob([raw],{type:'application/json'}));
  const a=document.createElement('a'); a.href=url;a.download=`Jianghu-${name}-${new Date().toISOString().slice(0,10)}.json`;a.click();window.setTimeout(()=>URL.revokeObjectURL(url),2000);
}
function settings() {
  openDialog('阅读设置',`<fieldset><legend>正文字号</legend><div class="size-controls">${[18,20,22,24].map(n=>button(`${n} 字号`,'size','',`data-size="${n}" aria-pressed="${size===n}"`)).join('')}</div></fieldset><fieldset><legend>纸与夜色</legend>${button('纸本','paper','',`aria-pressed="${!dark}"`)}${button('夜读','dark','',`aria-pressed="${dark}"`)}</fieldset><p class="preview-text">江湖未必认识你，但有人会记得你曾来过。</p><p>无需声音即可完整游玩。系统开启减弱动态效果时，页面会自动取消淡入。用 Tab 切换选项，Enter 或空格确认，Esc 关闭面板。</p>`);
}
function knowledge() {
  const tags=session!.tags;
  let html='<p class="panel-intro">这里仅收录你已经遇见的人与获得的消息。证言不是全知的真相。</p><h3>相逢之人</h3>';
  for(const [id,p] of Object.entries(people)) if(tags.has('person:'+id)) html+=`<section class="entry"><h4>${p.name}<span>${p.role}</span></h4><p>${p.text}</p></section>`;
  html+='<h3>一路见闻</h3>';
  const known=Object.entries(facts).filter(([id])=>tags.has('fact:'+id));
  html+=known.length?known.map(([,f])=>`<section class="entry"><h4>${f.name}<span>${f.source}</span></h4><p>${f.text}</p></section>`).join(''):'<p>这场雨里的事，还没有核实的消息。</p>';
  openDialog('人物与见闻',html);
}
function history(chapter?:number) {
  const frames=session!.frames.filter(f=>chapter===undefined||f.chapter===chapter);
  openDialog(chapter===undefined?'前文回顾':CHAPTERS[chapter],'<p class="panel-intro">只读回顾，不会撤回选择或改变剧情。</p>'+frames.map(f=>`<details class="history-entry"><summary>${escape(f.title)}${f.selected?' · 已作选择':''}</summary><div class="prose">${prose(f)}${f.selected?`<p class="chosen">当时的选择：${escape(f.selected)}</p>`:''}</div></details>`).join(''));
}
app.addEventListener('click',e=>{
  if(e.detail>1)return;
  const b=(e.target as HTMLElement).closest<HTMLButtonElement>('[data-action]');if(!b)return;
  safe(()=>{
    const action=b.dataset.action;
    if(action==='choice'){
      // Build the candidate separately so a failed choice cannot partially mutate the current scene.
      const next=restore(JSON.stringify(session!.save())).session;
      next.choose(b.dataset.choice!);session=next;savedScroll=0;render(true);saveCurrent();markEnding();
    } else if(action==='new') confirmNew();
    else if(action==='start-confirm') start();
    else if(action==='continue'){mode='read';location.hash='read';render();window.scrollTo(0,savedScroll);}
    else if(action==='home'){if(mode==='read'){savedScroll=window.scrollY;saveCurrent();}mode='cover';location.hash='';render();window.scrollTo(0,0);}
    else if(action==='close') closeDialog();
    else if(action==='saves') saves();
    else if(action==='settings') settings();
    else if(action==='knowledge') knowledge();
    else if(action==='history') history();
    else if(action==='chapter') history(Number(b.dataset.chapter));
    else if(action==='size'||action==='paper'||action==='dark'){
      if(action==='size')size=Number(b.dataset.size);else dark=action==='dark';applySettings();write('settings',JSON.stringify({size,dark}));settings();
    } else if(action==='slot-save'){
      const key=b.dataset.slot!;
      if(read(key))openDialog('替换手动存档','<p>这个槽已有进度。替换前可先导出；其他槽不会改变。</p>'+button('返回','saves','secondary')+button('确认替换','slot-replace','primary',`data-slot="${key}"`));
      else{persist(session!,window.scrollY,key);saves();notify('手动存档已保存。');}
    } else if(action==='slot-replace'){persist(session!,window.scrollY,b.dataset.slot!);saves();notify('手动存档已替换。');}
    else if(action==='slot-load'){
      const raw=read(b.dataset.slot!)!; const candidate=restore(raw);
      preserveAuto();write('auto',raw);session=candidate.session;savedScroll=candidate.save.ui.scroll;mode='read';location.hash='read';render();window.scrollTo(0,savedScroll);markEnding();notify('已恢复存档。');
    } else if(action==='slot-export')download(read(b.dataset.slot!)!,b.dataset.slot!);
    else if(action==='export-current')download(JSON.stringify(session!.save(window.scrollY),null,2),'进度');
  });
});
// Scroll persistence is independent of the narrative; it cannot advance Ink.
let scrollTimer=0;
window.addEventListener('scroll',()=>{window.clearTimeout(scrollTimer);if(mode==='read')scrollTimer=window.setTimeout(()=>{savedScroll=window.scrollY;saveCurrent();},350);},{passive:true});
window.addEventListener('pagehide',()=>{if(mode==='read')saveCurrent();});
render();
if(mode==='read')requestAnimationFrame(()=>window.scrollTo(0,savedScroll));
if(startupError)notify(startupError+' 可在存档中导出原始数据。');
if('serviceWorker' in navigator && import.meta.env.PROD) window.addEventListener('load',()=>{navigator.serviceWorker.register(`${import.meta.env.BASE_URL}sw.js`).catch(()=>notify('离线缓存未启用；当前在线阅读不受影响。'));});
