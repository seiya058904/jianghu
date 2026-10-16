// Shared tag writer for authored scenes. It never creates dialogue or choices.
export function createWriter(prefix){
 const out=[];let scene='',cast=[],knot='',index=0;
 function say(lines){for(const raw of lines.trim().split('\n')){if(!raw.trim())continue;const split=raw.indexOf('|');if(split<1)throw new Error(`Missing speaker separator: ${raw}`);let [speaker,mood='neutral']=raw.slice(0,split).split('~');speaker=({n:'narrator',y:'you'})[speaker]??speaker;if(!['narrator','you'].includes(speaker)&&!cast.includes(speaker))cast=[speaker,...cast].slice(0,3);out.push(`${raw.slice(split+1)} # beat:${prefix}${knot}_${++index} # scene:${scene} # cast:${cast.join(',')||'none'} # speaker:${speaker}${!['narrator','you'].includes(speaker)?` # mood:${speaker}=${mood}`:''}`)}}
 function part(id,where,people,lines){knot=id;index=0;scene=where;cast=people.split(',').filter(Boolean);out.push(`\n=== ${id} ===`);say(lines)}
 function go(id){out.push(`-> ${id}`)}
 function stage(where,people){scene=where;cast=people.split(',').filter(Boolean)}
 function choose(next,items){for(const [id,text,effect,lines,condition] of items){out.push(`* ${condition?`{${condition}} `:''}[${text} # cid:${id}]`);if(effect)for(const change of effect.split(';'))out.push(`  ~ ${change}`);const start=out.length;say(lines);for(let i=start;i<out.length;i++)out[i]='  '+out[i];out.push(`  -> ${next}`)}}
 function iff(expression,yes,no){out.push(`{\n- ${expression}:`);say(yes);if(no){out.push('- else:');say(no)}out.push('}')}
 function fact(id){out[out.length-1]+=` # fact:${id}`}
 function end(id,line){say(`n|${line}`);out[out.length-1]+=` # ending:${id}`;go('END')}
 return{out,say,part,stage,go,choose,iff,fact,end,render:()=>out.join('\n')+'\n'};
}
