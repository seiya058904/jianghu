// Preserve the intervening released bytes as well as the older audit baseline.
// These are exact git-show exports, never regenerated approximations of old saves.
export const experienceSourceCommit = '9ae5e409d25cb983e530bc2475e256b73a039d59';
export const experienceBaselineManifest = [
  {slug:'dead-ranking',version:'dead-ranking-1.0.0',path:'src/generated/dead-ranking.json',bytes:138988,sha256:'0cba7ac64b2e068757855c8bfcaa609b93c362d60951f07819eb6efb0222d6cc'},
  {slug:'luhua',version:'luhua-1.0.0',path:'src/generated/luhua.json',bytes:99408,sha256:'da48471815a1a8cab070524de762f917288669759f6ad35320172d1f62444b2a'},
] as const;
export async function loadEditorialHistory(version:string):Promise<Record<string,unknown>[]> {
  if(version==='dead-ranking-1.0.0')return [(await import('./generated/experience-pre-audit/dead-ranking.json',{with:{type:'json'}})).default];
  if(version==='luhua-1.0.0')return [(await import('./generated/experience-pre-audit/luhua.json',{with:{type:'json'}})).default];
  return [];
}
