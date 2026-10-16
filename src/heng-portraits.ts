import type {Portrait} from './campaign-catalog.ts';
// One person, two visible age periods. Actor aliases preserve the unrevealed
// name in North and keep archived V1 stage identities untouched.
export function hengPortrait(age:'earlier'|'later'):Portrait{
 const stem=`v6/heng-${age}`;
 return{file:stem+'.webp',kind:'dedicated',position:'center top',size:'auto 150%',moods:{intent:stem+'-intent'+(age==='earlier'?'-v2':'')+'.webp',amused:stem+'-amused'+(age==='earlier'?'-v2':'')+'.webp'}};
}
