import {editorialBaselineManifest} from './editorial-baselines.ts';
import { Story } from 'inkjs';
import content from './generated/duel.json' with { type: 'json' };
import draftContent from './generated/duel-1.0.0.json' with { type: 'json' };
import { characters, scenes, emotions, endings, facts, cgs, type CharacterId, type SceneId, type Emotion } from './catalog.ts';

export const VN_CONTENT_VERSION = 'half-step-1.0.1';
export type Phase = 'awaitingAdvance' | 'awaitingChoice' | 'ending';
export type Stage = { scene: SceneId; cast: CharacterId[]; moods: Partial<Record<CharacterId, Emotion>>; focus: CharacterId | null; cg?: string; camera?: string; looks?:Record<CharacterId,string> };
export type VNChoice = { id: string; text: string; index: number };
export type Beat = { id: string; kind: 'say' | 'action' | 'ending'; text: string; speaker: CharacterId | 'you' | null; stage: Stage; choices: VNChoice[]; phase: Phase; prompt: string; action: string; ending: keyof typeof endings | null; tags: string[]; selected?: string };
export type Command = 'next' | `choice:${string}`;
export type VNSave = { saveSchemaVersion: 2; storyContentVersion: string; savedAt: string; commands: Command[]; runtime: string; presentation: { beatId: string; stage: Stage; phase: Phase } };
const clone = <T>(value: T): T => JSON.parse(JSON.stringify(value));
export function tagValue(tags: string[], key: string) { return tags.find(t => t.startsWith(key + ':'))?.slice(key.length + 1).trim(); }

export class VNRuntime {
  story: Story;
  commands: Command[] = [];
  history: Beat[] = [];
  frame: Beat;
  readonly contentVersion: string;
  private stage: Stage = { scene: 'courtyard', cast: [], moods: {}, focus: null };
  constructor(source: string | Record<string, unknown> = content, contentVersion = VN_CONTENT_VERSION) {
    this.contentVersion = contentVersion;
    this.story = typeof source === 'string' ? new Story(source) : new Story(source);
    this.story.onError = message => { throw new Error(message); };
    this.story.state.storySeed = 1;
    this.frame = this.read();
  }
  private read(): Beat {
    const tags: string[] = [];
    let text = '', steps = 0;
    while (this.story.canContinue && !text) {
      if (++steps > 40) throw new Error('演出指令没有抵达对白。');
      text = this.story.Continue()?.trim() ?? '';
      tags.push(...(this.story.currentTags ?? []));
    }
    const id = tagValue(tags, 'beat');
    if (!id || !text) throw new Error('对白缺少 beat 标识或内容。');
    if (this.history.some(b => b.id === id)) throw new Error(`对白重复抵达：${id}。请检查剧情循环。`);
    const scene = tagValue(tags, 'scene');
    if (scene) {
      if (!Object.hasOwn(scenes, scene)) throw new Error(`未知场景：${scene}`);
      if(this.stage.scene !== scene) this.stage.cg = undefined;
      this.stage.scene = scene as SceneId;
    }
    const cg = tagValue(tags, 'cg');
    if (cg) {
      if (cg!=='none'&&!Object.hasOwn(cgs,cg)) throw new Error(`未知 CG：${cg}`);
      this.stage.cg = cg === 'none' ? undefined : cg;
    }
    const cast = tagValue(tags, 'cast');
    if (cast !== undefined) {
      const ids = cast === 'none' ? [] : cast.split(',').map(s => s.trim());
      if (ids.length > 3 || new Set(ids).size !== ids.length || ids.some(s => !Object.hasOwn(characters, s))) throw new Error(`非法出场人物：${cast}`);
      this.stage.cast = ids as CharacterId[];
    }
    const mood = tagValue(tags, 'mood');
    const camera=tagValue(tags,'camera');
    if(camera&&camera!=='portrait')throw new Error(`非法镜头：${camera}`);
    this.stage.camera=camera;
    const look=tagValue(tags,'look');
    if(look)for(const item of look.split(',')){
      const [who,appearance]=item.split('=').map(value=>value.trim());
      if(!this.stage.cast.includes(who)||!Object.hasOwn(characters[who]?.portrait.looks??{},appearance))throw new Error(`非法外观指令：${item}`);
      (this.stage.looks??={})[who]=appearance;
    }
    if (mood) for (const item of mood.split(',')) {
      const [who, emotion] = item.split('=').map(v => v.trim());
      if (!Object.hasOwn(characters, who) || !Object.hasOwn(emotions, emotion) || !this.stage.cast.includes(who as CharacterId)) throw new Error(`非法表情指令：${item}`);
      this.stage.moods[who as CharacterId] = emotion as Emotion;
    }
    const speakerTag = tagValue(tags, 'speaker');
    if (!speakerTag) throw new Error(`对白 ${id} 缺少 speaker。`);
    const speaker = speakerTag === 'narrator' ? null : speakerTag as CharacterId | 'you';
    if (speaker && speaker !== 'you' && (!Object.hasOwn(characters, speaker) || !this.stage.cast.includes(speaker))) throw new Error(`说话人未在场：${speaker}`);
    this.stage.focus = speaker && speaker !== 'you' ? speaker : null;
    for (const tag of tags) if (tag.startsWith('fact:') && !Object.hasOwn(facts, tag.slice(5).trim())) throw new Error(`未知见闻：${tag}`);
    const endingTag = tagValue(tags, 'ending');
    if (endingTag && !Object.hasOwn(endings, endingTag)) throw new Error(`未知结局：${endingTag}`);
    const choices = this.story.currentChoices.map(c => ({ id: tagValue(c.tags ?? [], 'cid') ?? '', text: c.text.trim(), index: c.index }));
    if (choices.some(c => !c.id || !c.text) || new Set(choices.map(c => c.id)).size !== choices.length) throw new Error(`对白 ${id} 的选择标识无效。`);
    if (endingTag && (choices.length || this.story.canContinue)) throw new Error('终章后仍有可推进内容。');
    if (!endingTag && !choices.length && !this.story.canContinue) throw new Error(`对白 ${id} 缺少收束。`);
    return { id, text, kind: endingTag ? 'ending' : speaker ? 'say' : 'action', speaker, stage: clone(this.stage), choices, phase: endingTag ? 'ending' : choices.length ? 'awaitingChoice' : 'awaitingAdvance', prompt: tagValue(tags, 'prompt') ?? '你如何回应？', action: tagValue(tags, 'action') ?? '', ending: endingTag as Beat['ending'] ?? null, tags };
  }
  advance() {
    if (this.frame.phase !== 'awaitingAdvance') throw new Error('此处需要明确选择，不能跳过。');
    this.history.push(clone(this.frame));
    this.commands.push('next');
    this.frame = this.read();
  }
  choose(id: string) {
    const choice = this.frame.choices.find(c => c.id === id);
    if (this.frame.phase !== 'awaitingChoice' || !choice) throw new Error('此回复不属于当前对白。');
    this.history.push({ ...clone(this.frame), selected: choice.text });
    this.story.ChooseChoiceIndex(choice.index);
    this.commands.push(`choice:${id}`);
    this.frame = this.read();
  }
  get frames() { return [...this.history, this.frame]; }
  get tags() { return new Set(this.frames.flatMap(b => b.tags)); }
  save(): VNSave {
    return { saveSchemaVersion: 2, storyContentVersion: this.contentVersion, savedAt: new Date().toISOString(), commands: [...this.commands], runtime: this.story.state.ToJson(), presentation: { beatId: this.frame.id, stage: clone(this.frame.stage), phase: this.frame.phase } };
  }
}

export function restoreVN(raw: string, edition?: {content: Record<string,unknown>; version:string;previousContent?:Record<string,unknown>;editorialContent?:Record<string,unknown>}): { session: VNRuntime; save: VNSave; migrated?: boolean;migration?:'ending-staging'|'illustration-staging'|'editorial-text' } {
  if (raw.length > 1_000_000) throw new Error('存档超过 1 MB，原文件保留。');
  let save: VNSave;
  try { save = JSON.parse(raw); } catch { throw new Error('不是有效的 JSON 存档。原数据保留。'); }
  if ((save as unknown as { saveSchemaVersion?: number })?.saveSchemaVersion === 1) throw new Error('这是《渡口无碑》的旧篇存档，请从旧篇入口导入。原数据保留。');
  const versions=edition?[edition.version]:[VN_CONTENT_VERSION,'half-step-1.0.0'];
  if (!save || save.saveSchemaVersion !== 2 || !versions.includes(save.storyContentVersion)) throw new Error('存档作品或版本不兼容，可导出原始数据留存。');
  if (!Array.isArray(save.commands) || save.commands.length > (edition?3000:400) || save.commands.some(c => typeof c !== 'string' || (c !== 'next' && !/^choice:[a-z0-9_]{1,64}$/.test(c))) || typeof save.runtime !== 'string' || !save.presentation || typeof save.savedAt !== 'string' || !Number.isFinite(Date.parse(save.savedAt))) throw new Error('存档结构不完整，未覆盖当前进度。');
  let session = new VNRuntime(edition?.content ?? (save.storyContentVersion === 'half-step-1.0.0' ? draftContent : content),edition?.version??VN_CONTENT_VERSION);
  try {
    for (const command of save.commands) command === 'next' ? session.advance() : session.choose(command.slice(7));
    const expected = session.save();
    if (expected.runtime !== save.runtime || JSON.stringify(expected.presentation) !== JSON.stringify(save.presentation)) {
      if (edition?.editorialContent && editorialBaselineManifest.some(row => row.version === edition.version)) {
        // Validate the complete submitted snapshot against trusted old bytes.
        // Replay the new story independently; never LoadJson old state into it.
        const previous = new VNRuntime(edition.editorialContent, edition.version);
        const current = new VNRuntime(edition.content, edition.version);
        const structure = ({text: _text, ...frame}: Beat) => frame;
        const sameCheckpoint = () => JSON.stringify(structure(previous.frame)) === JSON.stringify(structure(current.frame))
          && JSON.stringify(JSON.parse(previous.story.state.ToJson()).variablesState) === JSON.stringify(JSON.parse(current.story.state.ToJson()).variablesState);
        let compatible = sameCheckpoint();
        for (const command of save.commands) {
          if (command === 'next') { previous.advance(); current.advance(); }
          else { previous.choose(command.slice(7)); current.choose(command.slice(7)); }
          compatible = sameCheckpoint() && compatible;
        }
        const frozen = previous.save();
        if (frozen.runtime === save.runtime && JSON.stringify(frozen.presentation) === JSON.stringify(save.presentation) && compatible) {
          return {session, save: {...expected, savedAt: save.savedAt}, migrated: true, migration: 'editorial-text'};
        }
      }
      const endingMigration=edition?.version==='tide-promise-2.0.0'&&/^c_ending_(harbor|name|together5|teacher|captain|apart|scar|lost)_\d+$/.test(save.presentation.beatId);
      const illustrationMigration=(edition?.version==='jade-thieves-1.0.0'&&/^jt_(empty_box_[1-7]|revealed_(8|9|1[3-8]))$/.test(save.presentation.beatId))||(edition?.version==='jade-1.0.0'&&/^jd_seventh_[2-5]$/.test(save.presentation.beatId))||(edition?.version==='twelfth-life-2.0.0'&&/^rl_fair_seat_[3-5]$/.test(save.presentation.beatId))||(edition?.version==='two-swords-1.0.0'&&/^ss_(token_[4-8]|open_boxes_[1-7])$/.test(save.presentation.beatId))||(edition?.version==='seven-questions-2.0.0'&&/^sq_(eighty_one_[8-9]|three_volumes_[1-5])$/.test(save.presentation.beatId))||(edition?.version==='sea-1.0.0'&&/^sr_(two_centuries_[3-5]|ninety_seven_(12|13|15|16))$/.test(save.presentation.beatId))||(edition?.version==='sea-tide-1.0.0'&&/^st_outer_years_[1-7]$/.test(save.presentation.beatId))||(edition?.version==='sea-tide-2.0.0'&&/^st_(trial|four_tests)_\d+$/.test(save.presentation.beatId));
      if(!edition?.previousContent||(!endingMigration&&!illustrationMigration))throw new Error('mismatch');
      // Trust neither the submitted stage nor variables: validate the entire
      // original snapshot against the frozen screenplay before migrating it.
      const previous=new VNRuntime(edition.previousContent,edition.version);
      for(const command of save.commands)command==='next'?previous.advance():previous.choose(command.slice(7));
      const frozen=previous.save();
      if(frozen.runtime!==save.runtime||JSON.stringify(frozen.presentation)!==JSON.stringify(save.presentation))throw new Error('old snapshot mismatch');
      const narrative=(story:VNRuntime)=>story.frames.map(f=>({id:f.id,text:f.text,choices:f.choices,ending:f.ending,phase:f.phase}));
      if(JSON.stringify(narrative(previous))!==JSON.stringify(narrative(session))||JSON.stringify(JSON.parse(expected.runtime).variablesState)!==JSON.stringify(JSON.parse(save.runtime).variablesState))throw new Error('migration changes story');
      return{session,save:{...expected,savedAt:save.savedAt},migrated:true,migration:endingMigration?'ending-staging':'illustration-staging'};
    }
    session.story.state.LoadJson(save.runtime);
    if (save.storyContentVersion === 'half-step-1.0.0') {
      // Verify against the frozen source first, then replay the same decisions.
      // The correction changes a working name, not world variables or beat IDs.
      const current = new VNRuntime();
      for (const command of save.commands) command === 'next' ? current.advance() : current.choose(command.slice(7));
      if (JSON.stringify(current.save().presentation) !== JSON.stringify(save.presentation) || JSON.stringify(JSON.parse(current.story.state.ToJson()).variablesState) !== JSON.stringify(JSON.parse(save.runtime).variablesState)) throw new Error('migration mismatch');
      session = current;
    }
  } catch { throw new Error('存档进度与演出状态不一致，未覆盖当前进度。'); }
  return edition || save.storyContentVersion === VN_CONTENT_VERSION ? { session, save } : { session, save: { ...session.save(), savedAt: save.savedAt }, migrated: true };
}
