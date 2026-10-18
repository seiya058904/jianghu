// V7 front page: the works collection. Entering a story is a separate page —
// this file never imports the story runtime, the campaign data or stage.css.
import './library.css';
import {workEntries,themeLabels,themeOrder,readProgress,estimateMinutes,resolveEdition,editionFile,type WorkEntry,type WorkTheme} from './works-registry.ts';
import {indexHtml,archiveHtml,esc} from './work-index.ts';

const base=import.meta.env.BASE_URL;
const THEME_KEY='jianghu:library:theme';

type StateFilter='all'|'new'|'reading'|'finished';
type SortMode='reader'|'length';

const state:{theme:WorkTheme|'all';status:StateFilter;sort:SortMode}={theme:'all',status:'all',sort:'reader'};
const stateLabel={new:'未开始',reading:'已开始',finished:'已完成'} as const;

const storage=()=>{try{return localStorage}catch{return null}};

function applyTheme(dark:boolean){
  document.documentElement.dataset.theme=dark?'dark':'paper';
  document.documentElement.dataset.motion=matchMedia('(prefers-reduced-motion: reduce)').matches?'reduced':'full';
  try{storage()?.setItem(THEME_KEY,dark?'dark':'paper')}catch{}
  const toggle=document.getElementById('lib-theme');
  if(toggle){toggle.setAttribute('aria-pressed',String(dark));toggle.textContent=dark?'纸本':'夜读'}
}

function card(work:WorkEntry){
  const progress=readProgress(work,storage());
  const volumeLine=work.volumes.length>1
    ?`当前卷：${esc(work.volumes[0].label)}`
    :(work.volumes[0]?.label?`卷册：${esc(work.volumes[0].label)}`:'单篇完结');
  const verb=progress.state==='finished'?'重读':progress.state==='reading'?'继续':'开始';
  const tags=[
    `<span class="lib-tag">${esc(themeLabels[work.theme])}</span>`,
    `<span class="lib-tag lib-tag-era">${esc(work.era)}</span>`,
    `<span class="lib-tag">${work.fight}</span>`,
    `<span class="lib-tag">${esc(estimateMinutes(work.beats))}</span>`,
    work.volumes.length>1?'<span class="lib-tag">多卷</span>':'<span class="lib-tag">独立可玩</span>',
  ];
  if(work.requires)tags.push('<span class="lib-tag lib-tag-state">需先读前置</span>');
  return `<article class="lib-card" data-work="${work.id}" data-theme="${work.theme}" data-status="${progress.state}" data-beats="${work.beats}" data-order="${work.order}">
    <div class="lib-card-art" role="img" aria-label="${esc(work.artAlt)}" style="background-image:url('${base}art/${work.art}')"></div>
    <div class="lib-card-body">
      <span class="lib-card-state" data-state="${progress.state}">${stateLabel[progress.state]}${progress.unlocked?` · ${progress.unlocked}/${progress.total} 归宿`:''}</span>
      <h3>${esc(work.title)}</h3>
      <p class="lib-sub">${esc(work.subtitle??'')} · ${esc(work.viewpoint)}</p>
      <p class="lib-hook">${work.hook}</p>
      <p class="lib-sum">${esc(work.summary)}</p>
      <p class="lib-sub">${volumeLine}${work.requires?` · ${esc(work.requires)}`:''}</p>
      <div class="lib-meta">${tags.join('')}</div>
      <a class="lib-card-go" href="${base}${editionFile(work.entry)}">${verb}《${esc(work.title)}》</a>
    </div>
  </article>`;
}

const matches=(work:WorkEntry)=>{
  if(state.theme!=='all'&&work.theme!==state.theme)return false;
  if(state.status!=='all'&&readProgress(work,storage()).state!==state.status)return false;
  return true;
};
const sortRows=(rows:WorkEntry[])=>rows.sort(state.sort==='length'?(a,b)=>a.beats-b.beats:(a,b)=>a.order-b.order);

function grid(rows:WorkEntry[]){return `<div class="lib-grid">${sortRows(rows).map(card).join('')}</div>`}

function sectionsHtml(){
  const rows=workEntries.filter(matches);
  if(!rows.length)return `<p class="lib-empty">这个筛选下暂时没有作品。把主题或进度筛选放宽一点再看。</p>`;
  const starters=rows.filter(work=>work.recommended);
  const rest=rows.filter(work=>!work.recommended);
  const starterBlock=starters.length
    ?`<section class="lib-section" id="lib-start"><div class="lib-section-head"><h2>推荐入门</h2><p>${starters.length} 部 · 从新游戏开始就能读通，不必先补背景</p></div>${grid(starters)}</section>`
    :'';
  const themeBlocks=themeOrder.map(theme=>{
    const members=rest.filter(work=>work.theme===theme);
    if(!members.length)return '';
    const extra=theme==='martial'?' · 龙门之后可接洛阳与竹院两篇续话':'';
    return `<section class="lib-section" id="theme-${theme}"><div class="lib-section-head"><h2>${themeLabels[theme]}</h2><p>${members.length} 部${extra}</p></div>${grid(members)}</section>`;
  }).join('');
  return starterBlock+themeBlocks;
}

function statusStrip(){
  const progress=workEntries.map(work=>readProgress(work,storage()));
  const started=progress.filter(item=>item.state!=='new').length;
  const finished=progress.filter(item=>item.state==='finished').length;
  return `<div class="lib-status"><span><strong>${workEntries.length}</strong> 部现行作品</span><span>已开始 <strong>${started}</strong> 部</span><span>已完成 <strong>${finished}</strong> 部</span><span>旧存档仍留在各篇自己的历史版本里，不会被清掉。</span></div>`;
}

function toolbar(){
  const themeChips=themeOrder.map(theme=>`<button class="lib-chip" data-filter="theme" data-value="${theme}" aria-pressed="${state.theme===theme}">${themeLabels[theme]}</button>`).join('');
  const statusChips=(['new','reading','finished'] as const).map(value=>`<button class="lib-chip" data-filter="status" data-value="${value}" aria-pressed="${state.status===value}">${stateLabel[value]}</button>`).join('');  const sortChips=(['reader','length'] as const).map(value=>`<button class="lib-chip" data-filter="sort" data-value="${value}" aria-pressed="${state.sort===value}">${value==='reader'?'推荐顺序':'篇幅由短到长'}</button>`).join('');
  return `<div class="lib-toolbar" role="group" aria-label="筛选与排序">
    <div class="lib-group"><span class="lib-group-label">主题</span><button class="lib-chip" data-filter="theme" data-value="all" aria-pressed="${state.theme==='all'}">全部</button>${themeChips}</div>
    <div class="lib-group"><span class="lib-group-label">进度</span><button class="lib-chip" data-filter="status" data-value="all" aria-pressed="${state.status==='all'}">全部</button>${statusChips}</div>
    <div class="lib-group"><span class="lib-group-label">排序</span>${sortChips}</div>
  </div>`;
}

function page(){
  return `<a class="lib-skip" href="#lib-catalog">跳到作品列表</a>
  <header class="lib-header"><div class="lib-wrap"><span class="lib-brand">Jianghu<span class="lib-seal" aria-hidden="true">江湖</span></span>
    <nav class="lib-nav" aria-label="作品库工具">
      <button data-action="index">选篇</button>
      <button data-action="archive">历史版本与旧存档</button>
      <button id="lib-theme" data-action="theme" aria-pressed="false">夜读</button>
    </nav></div></header>
  <main>
    <section class="lib-hero" aria-labelledby="lib-title">
      <div class="lib-hero-art" style="background-image:url('${base}art/v6/cg-taihua-six.webp')" aria-hidden="true"></div>
      <div class="lib-hero-veil" aria-hidden="true"></div>
      <div class="lib-wrap">
        <p class="lib-hero-eyebrow">宋世江湖 · 互动武侠纪事集</p>
        <h1 id="lib-title">江湖<small>JIANGHU · 同一片江湖，不同的年月</small></h1>
        <p class="lib-hero-lead">改编自《宋世江湖》。人物、冲突、胜负与年代都从原文出发：你替受伤的同门站上太华青序，也可能在青溪的榜房外面站到五十几岁。挑一段真事进去，用自己的话和剑走完它。</p>
        <div class="lib-hero-cta">
          <a class="lib-cta lib-cta-primary" href="${base}taihua.html">从《太华试序》开始</a>
          <a class="lib-cta lib-cta-ghost" href="#lib-catalog">浏览所有故事</a>
        </div>
        <p class="lib-hero-note">这些故事发生在同一片江湖，时间并不全相同：前代的宗师与当今的年轻人不是同一批对手。</p>
      </div>
    </section>
    <div class="lib-wrap">${statusStrip()}</div>
    <div class="lib-wrap lib-main">
      <h2 class="sr-only">全部现行作品</h2>
      ${toolbar()}
      <div id="lib-catalog">${sectionsHtml()}</div>
    </div>
  </main>
  <footer class="lib-footer"><div class="lib-wrap">
    <p>全部现行作品都是《宋世江湖》的改编篇目；每篇独立存档，进度互不覆盖。没有声音也能完整游玩。</p>
    <p><button class="lib-chip" data-action="archive">历史版本与旧存档</button> <button class="lib-chip" data-action="index">全部作品索引</button></p>
    <p>键盘可用 Tab / Enter / 空格；筛选用按钮而非鼠标专属交互；系统开启减弱动态时不做位移动画。</p>
  </div></footer>
  <dialog id="lib-dialog" aria-labelledby="lib-dialog-title">
    <div class="lib-dialog-top"><h2 id="lib-dialog-title"></h2><button data-action="close">关闭</button></div>
    <div class="lib-dialog-body" id="lib-dialog-body"></div>
  </dialog>`;
}

const app=document.querySelector<HTMLDivElement>('#app')!;
app.innerHTML=page();

const catalog=()=>document.getElementById('lib-catalog')!;
const dialog=()=>document.getElementById('lib-dialog') as HTMLDialogElement;
let dialogReturn:HTMLElement|null=null;

function openPanel(title:string,html:string,anchor?:string){
  dialogReturn=document.activeElement as HTMLElement;
  document.getElementById('lib-dialog-title')!.textContent=title;
  document.getElementById('lib-dialog-body')!.innerHTML=html;
  const node=dialog();if(!node.open)node.showModal();
  node.scrollTop=0;
  if(anchor)document.getElementById(anchor)?.scrollIntoView({block:'start'});
}

function refresh(){
  for(const chip of app.querySelectorAll<HTMLButtonElement>('[data-filter]'))
    chip.setAttribute('aria-pressed',String(state[chip.dataset.filter as keyof typeof state]===chip.dataset.value));
  catalog().innerHTML=sectionsHtml();
}

app.addEventListener('click',event=>{
  const target=(event.target as HTMLElement).closest<HTMLElement>('[data-action],[data-filter]');
  if(!target)return;
  const filter=target.dataset.filter;
  if(filter){
    const value=target.dataset.value!;
    if(filter==='theme')state.theme=value as WorkTheme|'all';
    else if(filter==='status')state.status=value as StateFilter;
    else state.sort=value as SortMode;
    refresh();return;
  }
  const action=target.dataset.action;
  if(action==='close'){dialog().close();return}
  if(action==='theme'){applyTheme(document.documentElement.dataset.theme!=='dark');return}
  if(action==='index'){openPanel('选一段江湖',indexHtml(base),'index-current');return}
  if(action==='archive'){openPanel('历史版本与旧存档',archiveHtml(base),'index-archive');return}
});
dialog().addEventListener('close',()=>{
  if(dialogReturn?.isConnected)dialogReturn.focus();else document.getElementById('lib-theme')?.focus();
});

let stored:unknown=null;
try{stored=storage()?.getItem(THEME_KEY)}catch{}
applyTheme(stored==='dark');
refresh();

// The collection shell is what a reader reaches first, so it owns the service
// worker too: the front page and its index stay readable with no network.
if('serviceWorker' in navigator&&import.meta.env.PROD){
  const register=()=>navigator.serviceWorker.register(`${base}sw.js`).catch(()=>{});
  if(document.readyState==='complete')register();else window.addEventListener('load',register,{once:true});
}

// `index.html#archive` is the "历史版本与旧存档" deep link used by story covers.
if(location.hash==='#archive')openPanel('历史版本与旧存档',archiveHtml(base),'index-archive');
