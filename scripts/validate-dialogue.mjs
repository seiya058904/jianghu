import { existsSync } from 'node:fs';
import { characters, scenes, emotions, facts, endings, cgs } from '../src/catalog.ts';
export function validateDialogue(source, name='duel.ink') {
  const beats = new Set(), choices = new Set(), final = new Set();
  const keys = new Set(['beat','cid','speaker','scene','cast','mood','look','fact','ending','action','prompt','cg','camera']);
  for (const [i, line] of source.split(/\r?\n/).entries()) {
    if (line.trim().startsWith('//')) continue;
    const tags = [...line.matchAll(/#\s*([A-Za-z_]+):([^#\r\n]*)/g)];
    const fail = message => { throw new Error(`${name}:${i + 1}: ${message}`); };
    const perLine = new Set();
    for (const [, key, raw] of tags) {
      const value = raw.trim().replace(/\]$/, '').trim();
      if (!keys.has(key) || !value) fail(`非法演出指令 ${key}:${value}`);
      if (perLine.has(key) && key !== 'fact') fail(`重复标签 ${key}`);
      perLine.add(key);
      if (key === 'beat' || key === 'cid') {
        const collection = key === 'beat' ? beats : choices;
        if (!/^[a-z0-9_]{1,64}$/.test(value) || collection.has(value)) fail(`无效或重复标识 ${key}:${value}`);
        collection.add(value);
      }
      if (key === 'speaker' && !['you','narrator',...Object.keys(characters)].includes(value)) fail(`未知说话人 ${value}`);
      if (key === 'scene' && !Object.hasOwn(scenes, value)) fail(`未知场景 ${value}`);
      if (key === 'cast') for (const id of value.split(',').map(v => v.trim())) if (id !== 'none' && !Object.hasOwn(characters, id)) fail(`未知人物 ${id}`);
      if (key === 'mood') for (const part of value.split(',')) {
        const [id, emotion] = part.split('=').map(v => v.trim());
        if (!Object.hasOwn(characters, id) || !Object.hasOwn(emotions, emotion)) fail(`非法表情 ${part}`);
      }
      if (key === 'fact' && !Object.hasOwn(facts, value)) fail(`未知见闻 ${value}`);
      if(key==='camera'&&value!=='portrait')fail(`非法镜头 ${value}`);
      if(key==='look')for(const item of value.split(',')){
        const [id,appearance]=item.split('=').map(part=>part.trim());
        if(!Object.hasOwn(characters[id]?.portrait.looks??{},appearance))fail(`非法外观 ${item}`);
      }
      if (key === 'ending') { if (!Object.hasOwn(endings, value)) fail(`未知终章 ${value}`); final.add(value); }
      if(key === 'cg' && value!=='none'&&!Object.hasOwn(cgs,value))fail(`未知 CG ${value}`);
    }
    if (perLine.has('beat') && !perLine.has('speaker')) fail('对白缺少 speaker');
  }
  if (!beats.size || !choices.size || !final.size) throw new Error('对白、选择或终章缺失。');
  for (const [id, scene] of Object.entries(scenes)) if (!existsSync(`public/art/${scene.art}`)) throw new Error(`场景素材缺失：${id}/${scene.art}`);
  for (const [id, person] of Object.entries(characters)) if (!existsSync(`public/art/${person.portrait.file}`)) throw new Error(`人物素材缺失：${id}/${person.portrait.file}`);
  for(const [id,person] of Object.entries(characters))for(const file of [...Object.values(person.portrait.moods??{}),...Object.values(person.portrait.looks??{}).flatMap(look=>[look.file,...Object.values(look.moods??{})])])if(!existsSync(`public/art/${file}`))throw new Error(`人物状态素材缺失：${id}/${file}`);
  if (!existsSync('public/art/cast.webp')) throw new Error('人物素材缺失：cast.webp');
  for(const [id,cg] of Object.entries(cgs))if(!existsSync(`public/art/${cg.file}`))throw new Error(`CG素材缺失：${id}/${cg.file}`);
  return { beats: beats.size, choices: choices.size, endings: final.size };
}
