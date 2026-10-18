// Trusted pre-audit compiled editions, exported byte-for-byte with git show.
export const editorialSourceCommit = '7a2c22f74c46d74f07af8bd1a45893ec15daa49b';
export const editorialBaselineManifest = [
  {
    "slug": "sea",
    "version": "sea-2.0.0",
    "path": "src/generated/sea.json",
    "sha256": "c7192b4fe96828648fef52c076315bbd20ac5fa3baf7b3117c983061443456f3",
    "bytes": 89832
  },
  {
    "slug": "white-stone",
    "version": "white-stone-1.0.0",
    "path": "src/generated/white-stone.json",
    "sha256": "97f3f5e5c4503feaef8702fcaf461149ff20d9e97ecf2f8eb7f0b4f2c2c95b62",
    "bytes": 50698
  },
  {
    "slug": "xuanmen",
    "version": "xuanmen-1.0.0",
    "path": "src/generated/xuanmen.json",
    "sha256": "269360246c95c3fc17fb615685b7635b83e8efcd85d0ca75765b57e4fc048bad",
    "bytes": 42318
  },
  {
    "slug": "seven-questions",
    "version": "seven-questions-2.0.0",
    "path": "src/generated/seven-questions.json",
    "sha256": "a5edda263294a00aae1aab2c6e8277150d288dce0b128a699a29d8f417d02f9d",
    "bytes": 125496
  },
  {
    "slug": "dead-ranking",
    "version": "dead-ranking-1.0.0",
    "path": "src/generated/dead-ranking.json",
    "sha256": "1626b38af67215696383187321ba37e29953f7feead8131b151ee056a5174809",
    "bytes": 136438
  },
  {
    "slug": "jade",
    "version": "jade-2.0.0",
    "path": "src/generated/jade.json",
    "sha256": "85f6bd38192e80f02ef675fea9c6685bf38a8a038a15d52057e105df5acb16b0",
    "bytes": 119504
  },
  {
    "slug": "twelfth",
    "version": "twelfth-1.0.0",
    "path": "src/generated/twelfth.json",
    "sha256": "6be09fe05fc2df85fced816bc68dba68761c0c3d9c20189c5fdbc637661afb2e",
    "bytes": 70927
  },
  {
    "slug": "twelfth-life",
    "version": "twelfth-life-3.0.0",
    "path": "src/generated/twelfth-life.json",
    "sha256": "631b74e3fc8c80883769c37f6ce6bfb7c2a2ed80e77f99b4160932b5caeaf57a",
    "bytes": 130471
  },
  {
    "slug": "qian-kun",
    "version": "qian-kun-3.0.0",
    "path": "src/generated/qian-kun.json",
    "sha256": "b9f7218723b6c7ab3c43d5b020bfc84aecb34b0f1efdd764f68efd072dfa3beb",
    "bytes": 103195
  },
  {
    "slug": "luhua",
    "version": "luhua-1.0.0",
    "path": "src/generated/luhua.json",
    "sha256": "11378619287b3c4d7e9effa4c2e2e541fd33879b5cbbe59309bbd453ed081099",
    "bytes": 96443
  },
  {
    "slug": "north",
    "version": "north-3.0.0",
    "path": "src/generated/north.json",
    "sha256": "c1ea622badd0efa7517cd646238d996ebc77255773a3b3292bc937ec58d22d48",
    "bytes": 118530
  },
  {
    "slug": "dongting",
    "version": "dongting-1.0.0",
    "path": "src/generated/dongting.json",
    "sha256": "62fd8a2c1c3e7ae25715598eec8baec8e65d8356529dcfc112ba42dc694318ab",
    "bytes": 47909
  },
  {
    "slug": "longmen",
    "version": "longmen-3.0.0",
    "path": "src/generated/longmen.json",
    "sha256": "693c99d871d4f1ba8b669bd05b93733492821fa79981cc3fae1fecd29fe5e99e",
    "bytes": 105199
  }
] as const;
const loaders: Record<string, () => Promise<{default: Record<string, unknown>}>> = {
  'sea-2.0.0': () => import('./generated/independent-pre-audit/sea.json', {with: {type: 'json'}}),
  'white-stone-1.0.0': () => import('./generated/independent-pre-audit/white-stone.json', {with: {type: 'json'}}),
  'xuanmen-1.0.0': () => import('./generated/independent-pre-audit/xuanmen.json', {with: {type: 'json'}}),
  'seven-questions-2.0.0': () => import('./generated/independent-pre-audit/seven-questions.json', {with: {type: 'json'}}),
  'dead-ranking-1.0.0': () => import('./generated/independent-pre-audit/dead-ranking.json', {with: {type: 'json'}}),
  'jade-2.0.0': () => import('./generated/independent-pre-audit/jade.json', {with: {type: 'json'}}),
  'twelfth-1.0.0': () => import('./generated/independent-pre-audit/twelfth.json', {with: {type: 'json'}}),
  'twelfth-life-3.0.0': () => import('./generated/independent-pre-audit/twelfth-life.json', {with: {type: 'json'}}),
  'qian-kun-3.0.0': () => import('./generated/independent-pre-audit/qian-kun.json', {with: {type: 'json'}}),
  'luhua-1.0.0': () => import('./generated/independent-pre-audit/luhua.json', {with: {type: 'json'}}),
  'north-3.0.0': () => import('./generated/independent-pre-audit/north.json', {with: {type: 'json'}}),
  'dongting-1.0.0': () => import('./generated/independent-pre-audit/dongting.json', {with: {type: 'json'}}),
  'longmen-3.0.0': () => import('./generated/independent-pre-audit/longmen.json', {with: {type: 'json'}}),
};
// Load only the selected work; other stories are never fetched by the library.
export async function loadEditorialBaseline(version: string) {
  return Object.hasOwn(loaders, version) ? (await loaders[version]()).default : undefined;
}
