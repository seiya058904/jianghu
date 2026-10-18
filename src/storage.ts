import { restore, type Session } from './runtime.ts';
export const PREFIX = 'jianghu:v1:';
let observedAuto: string | null | undefined;
export function read(key: string): string | null { try { const raw=localStorage.getItem(PREFIX + key); if(key==='auto'&&observedAuto===undefined)observedAuto=raw; return raw; } catch { return null; } }
export function write(key: string, raw: string) { localStorage.setItem(PREFIX + key, raw); if(key==='auto')observedAuto=raw; }
export function persist(session: Session, scroll = 0, key = 'auto') {
  if(key==='auto'&&observedAuto!==undefined&&read('auto')!==observedAuto)throw new Error('另一标签页已更新本篇进度；请先导出本次进度。');
  write(key, JSON.stringify(session.save(scroll)));
}
export function preserveAuto() {
  const old = read('auto');
  if (old !== null) write('previous', old);
  observedAuto = old;
}
export function describe(raw: string) {
  const {session,save} = restore(raw);
  return `${session.frame.title} · ${session.trail.includes('river') ? '沿河问人' : session.trail.includes('archive') ? '账房查证' : '初至渡口'} · ${new Date(save.savedAt).toLocaleString('zh-CN')}`;
}
