import {VNRuntime} from '../src/vn-runtime.ts';
import thieves from '../src/generated/jade-thieves-v1.json' with {type:'json'};
import thievesOld from '../src/generated/jade-thieves-before-cg.json' with {type:'json'};
import jade from '../src/generated/jade-v1.json' with {type:'json'};
import jadeOld from '../src/generated/jade-before-cg.json' with {type:'json'};
export const jadeArtWorks=[
 {slug:'jade-thieves',file:'jade-thieves-v1.html',source:'jade-thieves-v1',content:thieves,previousContent:thievesOld,version:'jade-thieves-1.0.0',prefix:'jianghu:chronicle:jade-thieves:v1:',cg:'jt_empty_box_1',cgId:'emptyBox',asset:'cg-empty-box',pending:'jt_empty_box_4',camera:'jt_revealed_8',start:'听清密库门外的脚步',title:'山河璧 · 密库双贼旧稿'},
 {slug:'jade',file:'jade-v1.html',source:'jade-v1',content:jade,previousContent:jadeOld,version:'jade-1.0.0',prefix:'jianghu:chronicle:jade:v1:',cg:'jd_seventh_2',cgId:'grainMeasure',asset:'cg-grain-measure',pending:'jd_seventh_5',camera:'jd_seventh_4',start:'先替何老板按住缸盖',title:'山河璧 · 十三文旧稿'},
];
export function jadeAt(w:typeof jadeArtWorks[number],id:string,old=false,side=0){
 const s=new VNRuntime(old?w.previousContent:w.content,w.version);
 while(s.frame.id!==id){if(s.frame.ending)throw Error(id);s.frame.choices.length?s.choose(s.frame.choices[side?s.frame.choices.length-1:0].id):s.advance()}return s;
}
