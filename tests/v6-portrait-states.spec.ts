import {test,expect} from '@playwright/test';
import {resolvePortrait} from '../src/catalog.ts';
const people:[string,string[]][]=[
 ['v6_zhaoli',['neutral','intent','amused']],['v6_qiao',['neutral','uneasy','amused']],
 ['v6_su',['neutral','amused','intent']],['v6_han',['neutral','amused','intent']],
 ['v6_ling',['neutral','intent','uneasy']],['v6_pei',['neutral','intent','amused']],
 ['v6_rong',['neutral','amused','uneasy']],['v6_he',['neutral','amused','intent']],
 ['th_shen',['neutral','amused','intent']],['th_huo',['neutral','intent','uneasy']],
 ['lm_xu',['neutral','intent','amused']],['lm_shi',['neutral','intent','uneasy']],
 ['lm_he',['neutral','amused','sharp']],['dt_liang',['neutral','amused','intent']],
 ['dt_chen',['neutral','intent','hurt']],['qw_zhao',['neutral','amused','intent']],
];
for(const [id,moods] of people)test(`${id}: three real reusable portrait states decode and retain native proportions`,async({page})=>{
 const errors:string[]=[];page.on('pageerror',e=>errors.push(e.message));await page.goto('/gallery.html');
 const look=id==='qw_zhao'?'age58':undefined;if(look)await page.locator('#look').selectOption(look);
 const files=new Set<string>();
 for(const mood of moods){
  await page.locator('#mood').selectOption(mood);
  const card=page.locator(`[data-character="${id}"]`);await card.scrollIntoViewIfNeeded();
  const file=resolvePortrait(id,mood,look)!.file;files.add(file);
  await expect(card.locator('img')).toHaveAttribute('src',new RegExp(file.replace(/[.*+?^${}()|[\]\\]/g,'\\$&')+'$'));
  const dimensions=await card.locator('img').evaluate(async(image:HTMLImageElement)=>{await image.decode();return{w:image.naturalWidth,h:image.naturalHeight}});
  expect(dimensions.w).toBeGreaterThanOrEqual(500);expect(dimensions.h).toBeGreaterThan(450);
  if(id==='v6_pei')expect(dimensions.w/dimensions.h).toBeGreaterThan(.95);
  if(id==='v6_rong'){expect(dimensions.w/dimensions.h).toBeGreaterThan(.8);expect(dimensions.w/dimensions.h).toBeLessThan(.9)}
  await card.screenshot({path:`docs/evidence/v6/portrait-${id}-${mood}.png`});
 }
 expect(files.size).toBe(3);expect(errors).toEqual([]);
});
