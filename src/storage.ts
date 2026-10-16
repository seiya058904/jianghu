import { restore, type Session } from './runtime.ts';
export const PREFIX = 'jianghu:v1:';
export function read(key: string): string | null { return localStorage.getItem(PREFIX + key); }
export function write(key: string, raw: string) { localStorage.setItem(PREFIX + key, raw); }
export function persist(session: Session, scroll = 0, key = 'auto') { write(key, JSON.stringify(session.save(scroll))); }
export function preserveAuto() {
  const old = read('auto');
  if (old !== null) write('previous', old);
}
export function describe(raw: string) {
  const {session,save} = restore(raw);
  return `${session.frame.title} · ${session.trail.includes('river') ? '沿河问人' : session.trail.includes('archive') ? '账房查证' : '初至渡口'} · ${new Date(save.savedAt).toLocaleString('zh-CN')}`;
}
