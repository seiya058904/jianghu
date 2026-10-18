// One shared renderer for the full work index, so the library front page and
// every in-story "选篇" panel never grow two different truths.
import {workEntries,legacyOriginal,resolveEdition,themeLabels,type WorkEntry} from './works-registry.ts';

export const esc=(value:string)=>value.replace(/[&<>"']/g,char=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[char]!));

const linkOf=(slug:string,fallback:string)=>{
  const edition=resolveEdition(slug);
  return edition?{title:edition.title,file:edition.file}:{title:fallback,file:''};
};

export function workEditionLinks(work:WorkEntry){
  return [...work.volumes,...work.companions]
    .map(ref=>({...linkOf(ref.slug,ref.label),label:ref.label}))
    .filter(link=>link.file);
}
export function workArchiveLinks(work:WorkEntry){
  return work.archives
    .map(ref=>({...linkOf(ref.slug,ref.label),label:ref.label}))
    .filter(link=>link.file);
}

const currentSection=(root:string)=>workEntries.map(work=>{
  const entry=resolveEdition(work.entry);
  // 这部作品自己的入口已经印在标题上。把指向同一个页面的链接再列一遍，只是同一行写两遍，
  // 也是全库链接文字重名的主要来源。这里只列出真正通往别处的那几处（别卷、另见）。
  const links=workEditionLinks(work).filter(link=>link.file!==entry?.file);
  return `<section class="entry"><h4><a href="${root}${entry?.file}">${esc(entry?.title??work.title)}</a></h4>`
    +`<p>${esc(themeLabels[work.theme])} · ${esc(work.viewpoint)} · ${esc(entry?.note??'现行篇')}</p>`
    +(links.length?`<p class="index-more">${links.map(link=>`<a href="${root}${link.file}">${esc(link.title)}</a>`).join(' · ')}</p>`:'')
    +'</section>';
}).join('');

const archiveSection=(root:string)=>workEntries.filter(work=>work.archives.length).map(work=>{
  const links=workArchiveLinks(work);
  return `<section class="entry"><h4>${esc(work.title)}</h4><p>${links.map(link=>`<a href="${root}${link.file}">${esc(link.title)}</a>`).join(' · ')}</p></section>`;
}).join('');

const originalSection=(root:string)=>legacyOriginal
  .map(item=>`<section class="entry"><p><a href="${root}${item.file}">${esc(item.title)}</a> · ${esc(item.label)}</p></section>`)
  .join('');

/** Complete index: what we ship now, then the frozen editions, then the original local stories. */
export function indexHtml(root:string){
  return `<p class="panel-intro">每篇各自保存进度。换一篇走，不会替你放弃原来的路。这些故事发生在同一片江湖，时间并不全相同。</p>`
    +`<h3 id="index-current">现行作品</h3>${currentSection(root)}`
    +`<h3 id="index-archive">历史版本与旧存档</h3><p class="panel-intro">只给要找回旧进度、或想主动翻看的读者。旧存档仍按原来的作品读取与导出。</p>${archiveSection(root)}`
    +`<h3 id="index-original">原创旧篇</h3><p class="panel-intro">《潮生有约》及其更早的短篇是这一世界里的原创地方故事，不再占作品库主位，源码、资源与旧存档全部保留。</p>${originalSection(root)}`;
}

/** The secondary area on its own, for the "历史版本与旧存档" entry. */
export function archiveHtml(root:string){
  return `<p class="panel-intro">旧稿只给要找回旧进度的读者。原文、旧资源与原始字节按兼容要求保留，任何一篇的旧存档都不会被这里清掉。</p>`
    +`<h3 id="index-archive">历史版本与旧存档</h3>${archiveSection(root)}`
    +`<h3 id="index-original">原创旧篇</h3><p class="panel-intro">《潮生有约》及其更早的短篇是这一世界里的原创地方故事，不再占作品库主位，源码、资源与旧存档全部保留。</p>${originalSection(root)}`;
}
