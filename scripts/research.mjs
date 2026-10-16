import {writeFileSync,mkdirSync} from 'node:fs';
const repos=['inkle/ink','y-lohse/inkjs','inkle/inky','klembot/twinejs','tmedwards/sugarcube-2','doublespeakgames/adarkroom','YarnSpinnerTool/YarnSpinner','dfabulich/choicescript'];
const result=await Promise.all(repos.map(async repo=>{
  const get=async tail=>{const r=await fetch(`https://api.github.com/repos/${repo}${tail}`,{headers:{Accept:'application/vnd.github+json','User-Agent':'Jianghu-local-research'}});return r.ok?await r.json():{status:r.status};};
  const [meta,release,license,issues]=await Promise.all([get(''),get('/releases/latest'),get('/license'),get('/issues?state=open&per_page=3')]);
  return {repo,checkedOn:'2026-10-14',url:meta.html_url,updatedAt:meta.updated_at,pushedAt:meta.pushed_at,archived:meta.archived,license:meta.license?.spdx_id??license.license?.spdx_id??'unverified',release:release.tag_name??null,licenseUrl:license.html_url??null,recentOpenIssues:Array.isArray(issues)?issues.filter(i=>!i.pull_request).map(i=>({title:i.title,url:i.html_url})):issues};
}));
mkdirSync('docs/evidence',{recursive:true});writeFileSync('docs/evidence/candidate-research.json',JSON.stringify(result,null,2));console.log(result);
