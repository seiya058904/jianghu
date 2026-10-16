import './stage.css';
import {characters,scenes,cgs,emotions,resolvePortrait} from './catalog.ts';
const app=document.querySelector<HTMLDivElement>('#app')!;
const asset=(file:string)=>import.meta.env.BASE_URL+'art/'+file;
const appearanceKeys=[...new Set(Object.values(characters).flatMap(person=>Object.keys(person.portrait.looks??{})))];
app.innerHTML='<header class="header"><h1>江湖 · 素材检视</h1><a href="./">返回游戏</a></header><main class="asset-gallery"><p>创作检视页，含登记资源与临时模板；登记不等于已在剧情使用。游戏见闻仍按相遇解锁。</p><label>资源 <select id="kind"><option value="people">人物</option><option value="scenes">场景</option><option value="cgs">剧情CG</option></select></label> <label>表情 <select id="mood">'+Object.entries(emotions).map(([id,name])=>`<option value="${id}">${name}</option>`).join('')+'</select></label> <label>年代外观 <select id="look"><option value="default">当前默认</option>'+appearanceKeys.map(id=>`<option value="${id}">${id}</option>`).join('')+'</select></label><p id="gallery-status" role="status"></p><div id="gallery"></div></main>';
function render(){
 const mood=(document.querySelector('#mood')as HTMLSelectElement).value;
 const look=(document.querySelector('#look')as HTMLSelectElement).value;
 const kind=(document.querySelector('#kind')as HTMLSelectElement).value;
 const gallery=document.querySelector('#gallery')!;
 if(kind==='people'){
  const entries=Object.entries(characters).filter(([,p])=>look==='default'||Object.hasOwn(p.portrait.looks??{},look));
  gallery.innerHTML=entries.map(([id,p])=>{
   const v=resolvePortrait(id,mood,look==='default'?undefined:look)!;
   const specific=look==='default'?p.portrait.moods:p.portrait.looks?.[look]?.moods;
   const state=mood==='neutral'||specific?.[mood]?'该状态有图像':'沿用该年代默认图像';
   return `<figure data-character="${id}"><img src="${asset(v.file)}" alt="${p.name}" loading="lazy"><figcaption>${p.name} · ${p.role}<small>${id} · ${v.kind??'旧篇图集'} · ${v.variant??'default'}<br>${state} · ${v.file}</small></figcaption></figure>`;
  }).join('');
  document.querySelector('#gallery-status')!.textContent=`登记人物 ${entries.length} 位；专属、模板和旧篇图集分别标明。`;
 }else if(kind==='scenes'){
  const files=new Map<string,string[]>();for(const scene of Object.values(scenes))files.set(scene.art,[...(files.get(scene.art)??[]),scene.name]);
  gallery.innerHTML=[...files].map(([file,names])=>`<figure><img src="${asset(file)}" alt="${names[0]}" loading="lazy"><figcaption>${[...new Set(names)].join(' / ')}<small>${file}</small></figcaption></figure>`).join('');
  document.querySelector('#gallery-status')!.textContent=`登记场景图像 ${files.size} 张，同一文件复用不重复计数。`;
 }else{
  gallery.innerHTML=Object.entries(cgs).map(([id,cg])=>`<figure><img src="${asset(cg.file)}" alt="${cg.title}" loading="lazy"><figcaption>${cg.title}<small>${cg.work} · ${id} · ${cg.file}</small></figcaption></figure>`).join('');
  document.querySelector('#gallery-status')!.textContent=`登记CG ${Object.keys(cgs).length} 张，是否实际出现另由剧情审计核实。`;
 }
 for(const id of ['mood','look'])(document.getElementById(id)as HTMLSelectElement).disabled=kind!=='people';
}
for(const id of ['kind','mood','look'])document.getElementById(id)!.addEventListener('change',render);render();
