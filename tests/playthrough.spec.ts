import {evidencePath} from './evidence-path.ts';
import {test,expect,type Page} from '@playwright/test';
import {VNRuntime} from '../src/vn-runtime.ts';
import {workEntries,resolveEdition,editionPrefix} from '../src/works-registry.ts';
import taihua from '../src/generated/taihua.json' with {type:'json'};
import longmen from '../src/generated/longmen.json' with {type:'json'};
import twelfthLife from '../src/generated/twelfth-life.json' with {type:'json'};
import qingshi from '../src/generated/qingshi.json' with {type:'json'};
import deadRanking from '../src/generated/dead-ranking.json' with {type:'json'};
import jadeThieves from '../src/generated/jade-thieves.json' with {type:'json'};

// V7-07 / V7-10 / §10.2: a reader must be able to open the collection, pick a
// flagship canon story, play it from the first beat to a real settling ending,
// and get back to the collection without losing that progress. The VNRuntime
// instance is the oracle here — it advances in lockstep with the page, so any
// divergence between the compiled story and what the browser shows fails loudly.
//
// The six flagships are the ones the commission names: 太华 / 龙门 / 第十二席 /
// 许长安 / 死人争榜 / 山河璧. They are keyed by *work id*, because 山河璧's card
// carries the work id `jade` while its current edition is `jade-thieves`.
const FLAGSHIPS:[string,Record<string,unknown>][]=[
 ['taihua',taihua],['longmen',longmen],['twelfth-life',twelfthLife],
 ['qingshi',qingshi],['dead-ranking',deadRanking],['jade',jadeThieves],
];

async function decoded(page:Page){await page.locator('.scene-background,.portrait').evaluateAll(async nodes=>{
 for(const node of nodes)for(const match of getComputedStyle(node).backgroundImage.matchAll(/url\(["']?([^"')]+)["']?\)/g)){
  const image=new Image();image.src=match[1];await image.decode();if(image.naturalWidth<100)throw Error(image.src)}})}

test('Every flagship canon story plays from the collection front page to a settled ending and back',async({browser})=>{
 test.setTimeout(900000);
 for(const [workId,content] of FLAGSHIPS)await test.step(workId,async()=>{
  const work=workEntries.find(entry=>entry.id===workId)!;
  const edition=resolveEdition(work.entry)!;
  const prefix=editionPrefix(work.entry);
  const context=await browser.newContext({viewport:{width:1440,height:900},reducedMotion:'reduce'});
  const page=await context.newPage();
  const errors:string[]=[];
  page.on('pageerror',error=>errors.push(error.message));
  await page.addInitScript(p=>localStorage.setItem(`${p}settings`,JSON.stringify({speed:0,reduced:true,size:20})),prefix);

  // 1. The collection front page offers this work as a card, one click away.
  await page.goto('/');
  await expect(page.locator('body')).not.toHaveAttribute('data-content-version','tide-promise-2.0.0');
  await page.getByRole('link',{name:new RegExp(`(开始|继续|重读)《${work.title}》`)}).click();
  await expect(page.locator('body')).toHaveAttribute('data-content-version',edition.version);
  await expect(page.getByRole('heading',{name:edition.title})).toBeVisible();
  await expect(page.getByText('原典纪事',{exact:false}).first()).toBeVisible();

  // 2. Start a new game the way a reader does: press the cover's own entry.
  await page.getByRole('button',{name:edition.start,exact:true}).click();
  const state=new VNRuntime(content,edition.version);
  let choices=0,advances=0;
  while(!state.frame.ending&&advances<12000){
   await expect(page.locator('#app')).toHaveAttribute('data-beat',state.frame.id);
   await expect(page.locator('#dialogue-visible')).toHaveText(state.frame.text);
   if(state.frame.choices.length){
    // Always the first offered reply: deterministic, and it still has to settle.
    const id=state.frame.choices[0].id;
    await page.locator(`[data-choice="${id}"]`).click();
    state.choose(id);choices++;
   }else{
    await page.locator('#advance-button').click();
    state.advance();advances++;
   }
  }
  expect(state.frame.ending,`${workId} must settle on a real ending`).toBeTruthy();
  await decoded(page);

  // 3. The ending screen is a real ending, recorded under this work's own prefix.
  await expect(page.locator('#ending-actions')).toBeVisible();
  await expect(page.locator('#speaker-emotion')).toHaveText('此篇已完');
  const stored:string[]=await page.evaluate(p=>JSON.parse(localStorage.getItem(`${p}endings`)??'[]'),prefix);
  expect(stored,`${workId} ending must be saved under ${prefix}`).toContain(state.frame.ending);
  expect(choices,`${workId} must have offered at least one real reply`).toBeGreaterThan(0);

  // 4. Refreshing at the ending stays at the ending.
  const beat=state.frame.id;
  await page.reload();
  await expect(page.locator('#app')).toHaveAttribute('data-beat',beat);
  await page.screenshot({path:evidencePath(`docs/evidence/v7/playthrough-${workId}-ending-1440.png`)});
  await page.setViewportSize({width:390,height:844});
  await expect(page.locator('#ending-actions')).toBeVisible();
  expect(await page.evaluate(()=>document.documentElement.scrollWidth<=innerWidth)).toBe(true);
  await page.screenshot({path:evidencePath(`docs/evidence/v7/playthrough-${workId}-ending-390.png`)});
  await page.setViewportSize({width:1440,height:900});

  // 5. Back to the collection, where the card now shows this work as played.
  await page.getByRole('button',{name:'回到封面',exact:true}).click();
  await page.getByRole('link',{name:'回到作品库'}).click();
  await expect(page.locator('.lib-card').first()).toBeVisible();
  const card=page.locator(`.lib-card[data-work="${workId}"]`).first();
  await expect(card).toBeVisible();
  await expect(card).not.toContainText('未开始');
  expect(errors,`${workId} console errors: ${errors.join(' | ')}`).toEqual([]);
  await context.close();
 });
});
