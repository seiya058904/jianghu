import {xuanmenEndings} from './xuanmen-catalog.ts';
import {whiteStoneEndings} from './white-stone-catalog.ts';
import {northEndings} from './north-catalog.ts';
import {qianKunEndings} from './qian-kun-catalog.ts';
// V7: the night talk follows the Longmen reader route, not the original local
// story. Frozen Longmen editions keep working, so all three prefixes qualify.
const longmenPrefixes=['jianghu:chronicle:longmen:v3:','jianghu:chronicle:longmen:v2:','jianghu:chronicle:longmen:v1:'];
export function readingLock(slug:string,read:(key:string)=>string|null):string{
 if(slug==='bamboo'){
  const finished=longmenPrefixes.some(prefix=>{try{const value=JSON.parse(read(prefix+'endings')??'[]');return Array.isArray(value)&&value.some(id=>typeof id==='string'&&['lm_travel','lm_home'].includes(id))}catch{return false}});
  return finished?'':'先读完《龙门问刀》一种归宿，再来推开竹院的门。';
 }
 if(!['north-notes','beyond-ranking'].includes(slug))return '';
 const required=slug==='beyond-ranking'?[{title:'《玄门旧史》',prefix:'jianghu:chronicle:xuanmen:v1:',endings:xuanmenEndings},{title:'《白石谷外》',prefix:'jianghu:chronicle:white-stone:v1:',endings:whiteStoneEndings}]:[{title:'《三师一枪》',prefix:'jianghu:chronicle:north:v1:',endings:northEndings},{title:'《不会算账》',prefix:'jianghu:chronicle:qian-kun:v1:',endings:qianKunEndings}];
 const missing=required.filter(work=>!(slug==='north-notes'?[work.prefix,work.prefix.replace(':v1:',':v2:'),work.prefix.replace(':v1:',':v3:')]:[work.prefix]).some(prefix=>{try{const value=JSON.parse(read(prefix+'endings')??'[]');return Array.isArray(value)&&value.some(id=>typeof id==='string'&&Object.hasOwn(work.endings,id))}catch{return false}}));
 return missing.length?`先读完${missing.map(work=>work.title).join('、')}各一种归宿，即可进入${slug==='beyond-ranking'?'这份旧录':'这场夜话'}。`:'';
}
