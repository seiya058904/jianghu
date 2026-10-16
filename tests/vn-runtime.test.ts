import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync, writeFileSync } from 'node:fs';
import { Compiler } from 'inkjs/compiler/Compiler';
import { VNRuntime, restoreVN } from '../src/vn-runtime.ts';
import { endings } from '../src/presentation.ts';
import { vnRoutes } from './vn-routes.ts';
import draft from '../src/generated/duel-1.0.0.json' with { type: 'json' };
import { validateDialogue } from '../scripts/validate-dialogue.mjs';

test('complete three routes; every beat restores current dialogue, cast, choices and read-only history', () => {
  const report: Record<string,unknown> = {};
  for (const [ending, ids] of Object.entries(vnRoutes)) {
    let s = new VNRuntime(), i = 0;
    while (s.frame.phase !== 'ending') {
      const restored = restoreVN(JSON.stringify(s.save())).session;
      assert.deepEqual(restored.frames, s.frames);
      s = restored;
      if (s.frame.phase === 'awaitingChoice') s.choose(ids[i++]); else s.advance();
      assert.ok(s.commands.length < 100);
    }
    assert.equal(i, ids.length); assert.equal(s.frame.ending, ending);
    assert.deepEqual(restoreVN(JSON.stringify(s.save())).session.frames, s.frames);
    const lengths = s.frames.map(b => [...b.text].length);
    report[ending] = { beats: s.frames.length, decisions: i, firstDecisionAtBeat: s.frames.findIndex(b => b.choices.length > 0) + 1, characters: s.frames.reduce((n,b) => n + [...b.text].length,0), averageBeatLength: Number((lengths.reduce((n,v)=>n+v,0)/lengths.length).toFixed(1)), maxBeatLength: Math.max(...lengths) };
    assert.ok(lengths.every(n => n <= 120));
  }
  writeFileSync('docs/evidence/dialogue-metrics.json', JSON.stringify(report,null,2));
});

test('save damage, forged runtime/presentation, illegal advances and repeated choices are rejected', () => {
  const s = new VNRuntime(); s.advance(); const save = s.save();
  assert.equal(s.frame.phase,'awaitingChoice');
  assert.throws(() => s.advance(), /明确选择/);
  for (const value of ['{broken', ' '.repeat(1000001), JSON.stringify({...save,saveSchemaVersion:99}), JSON.stringify({...save,runtime:'{}'}), JSON.stringify({...save,commands:['next','next']}), JSON.stringify({...save,presentation:{...save.presentation,beatId:'ending_road'}}), JSON.stringify({...save,savedAt:'bad'})]) assert.throws(() => restoreVN(value));
  assert.throws(() => restoreVN(JSON.stringify({saveSchemaVersion:1})), /旧篇/);
  assert.equal(s.frame.id,'challenge');
  s.choose('bold'); assert.throws(() => s.choose('bold'), /不属于/);
});

test('draft name correction migrates every beat with identical world variables and presentation', () => {
  for (const ids of Object.values(vnRoutes)) {
    const old = new VNRuntime(draft); let i=0;
    for (;;) {
      const raw = JSON.stringify({...old.save(),storyContentVersion:'half-step-1.0.0'});
      const restored = restoreVN(raw);
      assert.equal(restored.migrated,true);
      assert.equal(restored.save.storyContentVersion,'half-step-1.0.1');
      assert.deepEqual(restored.save.presentation,old.save().presentation);
      assert.deepEqual(JSON.parse(restored.session.story.state.ToJson()).variablesState,JSON.parse(old.story.state.ToJson()).variablesState);
      assert.equal(restored.session.frame.text,old.frame.text.replaceAll('谢临川','谢行舟').replaceAll('临川','行舟'));
      assert.throws(()=>restoreVN(JSON.stringify({...JSON.parse(raw),runtime:'{}'})),/不一致/);
      if(old.frame.phase==='ending')break;
      if(old.frame.phase==='awaitingChoice')old.choose(ids[i++]);else old.advance();
    }
  }
});

test('tiny authored scene exercises character entry/exit and fails unknown metadata/loops', () => {
  const compile = (source: string) => new Compiler(source).Compile().ToJson();
  const s = new VNRuntime(compile('Hello. # beat:a # scene:courtyard # cast:lin # speaker:lin # mood:lin=amused\nLeaving. # beat:b # cast:none # speaker:narrator # ending:road\n-> END'));
  assert.equal(s.frame.stage.focus,'lin'); s.advance(); assert.deepEqual(s.frame.stage.cast,[]); assert.equal(s.frame.phase,'ending');
  assert.throws(() => new VNRuntime(compile('Oops. # beat:a # scene:unknown # speaker:narrator\n-> END')), /未知场景/);
  assert.throws(() => new VNRuntime(compile('Oops. # beat:a # scene:constructor # speaker:narrator # ending:road\n-> END')), /未知场景/);
  assert.throws(() => new VNRuntime(compile('Oops. # beat:a # cast:lin # speaker:xie\n-> END')), /未在场/);
  const loop = new VNRuntime(compile('-> loop\n=== loop ===\nAgain. # beat:a # cast:none # speaker:narrator\n-> loop'));
  assert.throws(() => loop.advance(), /重复抵达/);
});

test('static metadata catches duplicate IDs, unknown commands and missing endings', () => {
  const source = readFileSync('story/duel.ink','utf8'); assert.ok(validateDialogue(source).beats > 60);
  assert.throws(() => validateDialogue(source.replace('beat:challenge','beat:gate')), /重复/);
  assert.throws(() => validateDialogue(source.replace('scene:courtyard','scene:unknown')), /未知场景/);
  assert.throws(() => validateDialogue(source.replace('scene:courtyard','scene:constructor')), /未知场景/);
  assert.throws(() => validateDialogue(source.replace('cast:lin','cast:constructor')), /未知人物/);
  assert.throws(() => validateDialogue(source.replace('mood:lin=sharp','mood:lin=missing')), /表情/);
  assert.throws(() => validateDialogue(source.replace('beat:gate','teleport:gate')), /非法/);
});

test('all reachable states close; immediate replies differ; conditional replies and script coverage', () => {
  const source = readFileSync('story/duel.ink','utf8');
  const declaredBeats = [...source.matchAll(/# beat:([a-z0-9_]+)/g)].map(m=>m[1]);
  const declaredIds = [...source.matchAll(/# cid:([a-z0-9_]+)/g)].map(m=>m[1]);
  const visited = new Set<string>(), beats = new Set<string>(), ids = new Set<string>(), ends = new Set<string>();
  let boundaries = 0, edges = 0;
  function walk(s: VNRuntime) {
    while (s.frame.phase === 'awaitingAdvance') { beats.add(s.frame.id); s.advance(); assert.ok(s.commands.length < 100); }
    beats.add(s.frame.id);
    const variables = JSON.parse(s.story.state.ToJson()).variablesState;
    const signature = JSON.stringify([s.frame.id,variables,s.frame.stage]);
    if (visited.has(signature)) return;
    visited.add(signature); assert.ok(visited.size < 15000);
    if (s.frame.ending) { ends.add(s.frame.ending); return; }
    boundaries++;
    if (s.frame.id === 'first_question') assert.equal(s.frame.choices.some(c => c.id === 'use_foot'), variables.observation === 1);
    if (s.frame.id.startsWith('wen_') && s.frame.choices.some(c => c.id === 'repeat_move')) assert.equal(s.frame.choices.some(c => c.id === 'test_new_step'), variables.observation === 1 && variables.honest === true);
    const reactions = new Set<string>();
    for (const choice of s.frame.choices) {
      ids.add(choice.id); edges++;
      const next = restoreVN(JSON.stringify(s.save())).session; next.choose(choice.id);
      assert.ok(!reactions.has(next.frame.text), `${s.frame.id} swallowed a reply`); reactions.add(next.frame.text);
      walk(next);
    }
  }
  walk(new VNRuntime());
  assert.deepEqual([...beats].sort(),declaredBeats.sort()); assert.deepEqual([...ids].sort(),declaredIds.sort()); assert.deepEqual([...ends].sort(),Object.keys(endings).sort());
  writeFileSync('docs/evidence/dialogue-coverage.json',JSON.stringify({states:visited.size,boundaries,edges,beats:beats.size,choiceIds:ids.size,endings:[...ends]},null,2));
});
