const CACHE = 'jianghu-v6-shell-0.1';
self.addEventListener('install', event => {event.waitUntil((async()=>{
  const response=await fetch('./offline-manifest.json',{cache:'no-store'});
  if(!response.ok)throw new Error('Offline manifest unavailable');
  const files=await response.json();const cache=await caches.open(CACHE);
  await cache.addAll(files);await self.skipWaiting();
})());});
self.addEventListener('activate', event => event.waitUntil(self.clients.claim()));
self.addEventListener('message',event=>{
  if(event.data?.type!=='cache-work'||!['jade-v1','jade-thieves-v1','twelfth-life-v2','taihua-v2','longmen-v2','qingshi-v2','kuhe-v2','sea-tide-v1','sea-v1','north-v2','north-v1','qian-kun-v2','qian-kun-v1','two-swords-v1','seven-questions-v1','twelfth-life-v1','qingshi-v1','kuhe-v1','longmen-v1','beyond-ranking','white-stone','xuanmen','luoyang','bamboo','twelfth-life','luhua','dead-ranking','qian-kun','north-notes','north','sea-tide','sea','jade','jade-thieves','seven-questions','two-swords','qingshi','kuhe','taihua','taihua-v1','longmen','dongting','twelfth','tide-v6'].includes(event.data?.work)||!event.ports[0])return;
  event.waitUntil((async()=>{
    try{
      const response=await fetch(`./offline-${event.data.work}.json`,{cache:'no-store'});
      if(!response.ok)throw new Error('manifest');
      const files=await response.json();
      const shellResponse=await fetch('./offline-manifest.json',{cache:'no-store'});
      if(!shellResponse.ok)throw new Error('shell manifest');
      const shell=await shellResponse.json();
      const scope=new URL(self.registration.scope);
      if(!Array.isArray(files)||!files.length||files.some(file=>typeof file!=='string'||!file.startsWith('./')||new URL(file,scope).origin!==scope.origin||!new URL(file,scope).pathname.startsWith(scope.pathname)))throw new Error('invalid manifest');
      if(!Array.isArray(shell)||!shell.length||shell.some(file=>typeof file!=='string'||!file.startsWith('./')||new URL(file,scope).origin!==scope.origin||!new URL(file,scope).pathname.startsWith(scope.pathname)))throw new Error('invalid shell manifest');
      const cache=await caches.open(CACHE);
      // Entry URLs stay stable while their hashed scripts change. Refresh HTML
      // even if an older edition is already cached; retain other cached works.
      const missing=[];for(const file of files)if(file==='./'||new URL(file,scope).pathname.endsWith('.html')||!await cache.match(new URL(file,scope)))missing.push(file);
      // Shell entries are shared by every work. Per-work manifests do not list
      // them, so a stale or corrupted front page would otherwise survive any
      // number of per-work downloads. Refresh them with the same batch.
      await cache.addAll([...new Set([...missing,...shell,'./','./index.html'])]);
      event.ports[0].postMessage({ok:true,count:files.length});
    }catch{event.ports[0].postMessage({ok:false})}
  })());
});
self.addEventListener('fetch', event => {
  const url = new URL(event.request.url);
  if(event.request.method !== 'GET' || url.origin !== self.location.origin || !url.pathname.startsWith(new URL(self.registration.scope).pathname))return;
  event.respondWith(fetch(event.request).then(response=>{if(response.ok){const copy=response.clone();event.waitUntil(caches.open(CACHE).then(cache=>cache.put(event.request,copy)));}return response;}).catch(async()=>{const cache=await caches.open(CACHE);const hit=await cache.match(event.request);return hit || (event.request.mode==='navigate'?await cache.match('./index.html'):null) || Response.error();}));
});
