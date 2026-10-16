import * as old from './presentation.ts';
import {campaignCharacters,campaignScenes,campaignEndings,campaignFacts,type Person} from './campaign-catalog.ts';
import {chronicleCharacters,chronicleScenes,chronicleEndings,chronicleFacts} from './chronicle-catalog.ts';
import {campaignV6Scenes,campaignV6Characters} from './campaign-v6-catalog.ts';
export {cgs} from './cg-catalog.ts';
export const characters:Record<string,Person>={...old.characters,...campaignCharacters,...chronicleCharacters,...campaignV6Characters};
export type CharacterId=string;
export const scenes:Record<string,{name:string;time:string;art:string}>={...old.scenes,...campaignScenes,...chronicleScenes,...campaignV6Scenes};
export type SceneId=string;
export const emotions={...old.emotions,hurt:'负伤'};
export type Emotion=keyof typeof emotions;
export const endings:Record<string,string>={...old.endings,...campaignEndings,...chronicleEndings};
export const facts:Record<string,{name:string;text:string}>={...old.facts,...campaignFacts,...chronicleFacts};
export function resolvePortrait(id:string,mood='neutral',appearance?:string){
  const person=characters[id]; if(!person) return null;
  const look=appearance?person.portrait.looks?.[appearance]:undefined;
  return {...person.portrait,size:look?.size??person.portrait.size,position:look?.position??person.portrait.position,file:look?(look.moods?.[mood]??look.file):(person.portrait.moods?.[mood]??person.portrait.file)};
}
