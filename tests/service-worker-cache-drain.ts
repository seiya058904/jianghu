import type {Page} from '@playwright/test';

type FetchLifetime = {type: string};
type WorkerScope = {
  ExtendableEvent: {prototype: {waitUntil(this: FetchLifetime, promise: Promise<unknown>): void}};
  __jianghuColdFetchWrites?: Set<Promise<unknown>>;
};

// Observe this isolated context's real SW writes without replacing fetch/cache
// behavior. Install before the controlled reload, then drain after its UI is ready.
export async function observeServiceWorkerFetchWrites(page: Page) {
  const scriptURL = await page.evaluate(async () => (await navigator.serviceWorker.ready).active?.scriptURL);
  const worker = page.context().serviceWorkers().find(candidate => candidate.url() === scriptURL);
  if (!worker) throw new Error('Expected this context active service-worker realm.');
  await worker.evaluate(() => {
    const scope = globalThis as unknown as WorkerScope;
    if (scope.__jianghuColdFetchWrites) return;
    const pending = new Set<Promise<unknown>>();
    scope.__jianghuColdFetchWrites = pending;
    const prototype = scope.ExtendableEvent.prototype;
    const original = prototype.waitUntil;
    prototype.waitUntil = function(promise) {
      // The native API gets the exact original promise, immediately, once.
      original.call(this, promise);
      if (this.type === 'fetch') {
        const task = Promise.resolve(promise);
        pending.add(task);
        void task.then(() => pending.delete(task), () => pending.delete(task));
      }
    };
  });
  return async () => {
    await worker.evaluate(async () => {
      const pending = (globalThis as unknown as WorkerScope).__jianghuColdFetchWrites;
      if (!pending) throw new Error('Fetch-write observer missing from this worker.');
      while (pending.size) await Promise.all([...pending]);
    });
  };
}
