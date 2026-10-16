// V6-only direction. Preserve the shared v5 author, words, beat IDs and commands.
export function directV6Endings(source){
 const seen=new Set();
 const result=source.split('\n').map(line=>{
  const match=line.match(/# beat:c_ending_(harbor|name|together5|teacher|captain|apart|scar|lost)_(\d+)\b/);if(!match)return line;
  const [,ending,index]=match;seen.add(ending);let scene='v6_end_'+ending;
  if(ending==='together5'&&Number(index)<7)scene='v6_end_departure';
  line=line.replace(/# scene:\w+/,'# scene:'+scene);
  if(!['harbor','scar'].includes(ending))line=line.replace(/# cg:\w+/,'# cg:none');
  if(ending==='together5'&&Number(index)>=7)line=line.replace(/# cast:[^#\r\n]+/,'# cast:v6_qiao,v6_pei ');
  if(ending==='apart'&&Number(index)>=7)line=line.replace(/# cast:[^#\r\n]+/,'# cast:none ');
  return line;
 }).join('\n');
 if(seen.size!==8)throw new Error('V6 ending direction lost a family');return result;
}
