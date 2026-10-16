import { Story } from 'inkjs';
import content from './generated/story.json' with { type: 'json' };

export const CONTENT_VERSION = 'ferry-1.0.0';
export const ENDINGS = ['public', 'quiet', 'common', 'leave'] as const;
export const CHAPTERS = ['雨夜来信', '两岸之言', '灯下旧账', '风起渡头', '公议之前', '渡口之后'];
export type Choice = { id: string; text: string; index: number };
export type Frame = { scene: string; chapter: number; title: string; place: string; paragraphs: string[]; tags: string[]; choices: Choice[]; ending: string | null; selected?: string };
export type Save = { saveSchemaVersion: 1; storyContentVersion: string; savedAt: string; trail: string[]; runtime: string; ui: { scroll: number } };

function tagValue(tags: string[], key: string) { return tags.find(t => t.startsWith(key + ':'))?.slice(key.length + 1).trim(); }
export class Session {
  story: Story;
  trail: string[] = [];
  history: Frame[] = [];
  frame: Frame;
  constructor() {
    this.story = new Story(content);
    this.story.onError = (message) => { throw new Error(message); };
    // There is no narrative randomness. A stable seed also makes save validation deterministic.
    this.story.state.storySeed = 1;
    this.frame = this.read();
  }
  private read(): Frame {
    const paragraphs: string[] = [], tags: string[] = [];
    let steps = 0;
    while (this.story.canContinue) {
      if (++steps > 200) throw new Error('剧情节点未能收束。');
      const line = this.story.Continue()?.trim();
      if (line) paragraphs.push(line);
      tags.push(...(this.story.currentTags ?? []));
    }
    const choices = this.story.currentChoices.map(c => ({id: tagValue(c.tags ?? [], 'cid') ?? '', text: c.text.trim(), index: c.index}));
    if (choices.some(c => !c.id)) throw new Error('剧情选项缺少标识。');
    const frame = {scene: tagValue(tags, 'scene') ?? '', chapter: Number(tagValue(tags, 'chapter')), title: tagValue(tags,'title') ?? '', place:tagValue(tags,'place') ?? '', paragraphs, tags, choices, ending: tagValue(tags,'ending') ?? null};
    if (!frame.scene || !frame.title || !paragraphs.length || (!choices.length && !frame.ending)) throw new Error('剧情节点不完整。');
    return frame;
  }
  choose(id: string) {
    const choice = this.frame.choices.find(c => c.id === id);
    if (!choice) throw new Error('这个选择不属于当前场景。');
    this.history.push({...this.frame, selected: choice.text});
    this.story.ChooseChoiceIndex(choice.index);
    this.trail.push(id);
    this.frame = this.read();
  }
  get frames() { return [...this.history, this.frame]; }
  get tags() { return new Set(this.frames.flatMap(f => f.tags)); }
  save(scroll = 0): Save {
    return {saveSchemaVersion:1,storyContentVersion:CONTENT_VERSION,savedAt:new Date().toISOString(),trail:[...this.trail],runtime:this.story.state.ToJson(),ui:{scroll}};
  }
}
export function restore(raw: string): {session: Session; save: Save} {
  if (raw.length > 1_000_000) throw new Error('存档超过 1 MB，未读取。原文件不受影响。');
  let save: Save;
  try { save = JSON.parse(raw); } catch { throw new Error('不是有效的 JSON 存档。原数据已保留。'); }
  if (!save || save.saveSchemaVersion !== 1 || save.storyContentVersion !== CONTENT_VERSION) throw new Error('存档版本不兼容。请导出原始备份并保留，当前版本不会改写它。');
  if (!Array.isArray(save.trail) || save.trail.length > 60 || save.trail.some(c => typeof c !== 'string' || c.length > 64) || typeof save.runtime !== 'string' || !save.ui || typeof save.ui.scroll !== 'number' || !Number.isFinite(save.ui.scroll) || save.ui.scroll < 0 || save.ui.scroll > 1_000_000 || typeof save.savedAt !== 'string' || !Number.isFinite(Date.parse(save.savedAt))) throw new Error('存档内容不完整，未覆盖当前进度。');
  const session = new Session();
  try {
    for (const id of save.trail) session.choose(id);
    if (session.story.state.ToJson() !== save.runtime) throw new Error('mismatch');
    // Exercise Ink's native loader, after verifying that this state is reachable.
    session.story.state.LoadJson(save.runtime);
  } catch { throw new Error('存档的选择与剧情状态不一致，未覆盖当前进度。'); }
  return {session,save};
}
