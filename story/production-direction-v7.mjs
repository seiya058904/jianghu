// V7 追加的演出字幕（`# action:` / `# cg:` / `# camera:` / `# look:`）。
//
// 为什么不直接写进 `production-direction-v6.mjs`：
// 那张表被 V6 的冻结记录钉了 SHA-256（`docs/evidence/v6/north-editorial-integration-preservation.json`
// 与 `qian-kun-*-preservation*.json` 的 `frozen['story/production-direction-v6.mjs']` =
// 726d4eba5ca8bffc530c29c69c51d89bc366dbd48c9a16ba003c402e0f7d47f1，
// 由 `tests/north-editorial.test.ts` / `tests/qian-kun-*.test.ts` 逐字节复核）。
// 往那张表里追加别篇的条目会让北枪与乾坤的冻结断言红掉——而那三处断言保护的
// 正是「已审读作品的作者源码与冻结字节没有被后来的人悄悄改动」。
// 因此新篇目的条目一律放这里，由 `scripts/compile-story.mjs` 在 V6 之后单独施加。
//
// 施加顺序有硬约束：`applyDirection` 对同一个 beat 只能加一次同名标签，且不得覆盖
// 文件里已写好的同类标签。V6 表先跑，V7 表后跑；同一 work 的同一个 beat 若两表都列，
// 会以「Duplicate direction anchor」直接报错，而不是静默丢掉一边。
import {readFileSync,writeFileSync} from 'node:fs';

export const directionV7={
 // 第二轮：洞庭问席的护船现场动作
 dongting:{
  dt_raid_2:{action:'魏虎 · 踏到船头'},
  dt_raid_4:{action:'梁照水 · 退后舱'},
  dt_raid_return_4:{action:'汪苇 · 我站不起来'},
  dt_raid_return_11:{action:'陈震 · 先托这头'},
 },
 // 第二轮：三间问话屋（梁启山 / 赵问川 / 何定远 与三位冒名者当面对质）
 'dead-ranking':{
  dr_three_faces_2:{action:'梁启山 · 右袖不使力'},
  dr_three_faces_4:{action:'谢无灯 · 渡口那一回'},
  dr_three_faces_9:{action:'谢无灯 · 我先说完'},
  dr_three_faces_1_2:{action:'赵问川 · 好写那一场'},
  dr_three_faces_1_3:{action:'杜青禾 · 笔画少'},
  dr_three_faces_2_2:{action:'何定远 · 我只问一句'},
  dr_three_faces_2_5:{action:'严松 · 怕你死'},
  dr_three_faces_after_2:{action:'周砚 · 带回六个人的话'},
 },
 // 第二轮：芦花渡最早三处该有动作字幕的地方（此前该篇 `# action:` 为 0）
 luhua:{
  lh_eleven_3:{action:'孟守川 · 先吃完这碗饭'},
  lh_eleven_5:{action:'孟守川 · 你拿什么还'},
  lh_red_snake_2:{action:'焦定海 · 退这边'},
 },
};

/**
 * 把一张方向表施加到对应的 `story/<work>.ink` 上。
 * 与 V6 的同名函数行为完全一致，只是接受调用方传入的表，便于 V6/V7 分文件维护。
 */
export function applyDirection(table){
 for(const [work,plan] of Object.entries(table)){
  const path=`story/${work}.ink`,hits=new Set();
  const source=readFileSync(path,'utf8').split('\n').map(line=>{
   const id=line.match(/# beat:(\S+)/)?.[1];if(!id||!plan[id])return line;
   if(hits.has(id))throw new Error(`Duplicate direction anchor ${work}/${id}`);hits.add(id);
   for(const [key,value] of Object.entries(plan[id])){
    if(new RegExp(`# ${key}:`).test(line))throw new Error(`Direction overwrites authored ${key}: ${work}/${id}`);
    line+=` # ${key}:${value}`;
   }
   return line;
  }).join('\n');
  for(const id of Object.keys(plan))if(!hits.has(id))throw new Error(`Missing direction anchor ${work}/${id}`);
  writeFileSync(path,source);
 }
}

export function applyDirectionV7(){applyDirection(directionV7)}
