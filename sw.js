// sw.js — Service Worker CigarOdyssey
// Stratégie : Network First partout — données toujours fraîches
// ════════════════════════════════════════════════════════

// v7 : Leaflet passe d'unpkg a assets/vendor, et la CSP ne tolere plus
// d'origine tierce pour les scripts. Un visiteur dont le cache garde
// l'ancien explorer.js demanderait unpkg, que la nouvelle CSP refuse —
// d'ou le changement de nom, qui purge a l'activation.
var CACHE_NAME  = 'cigar-odyssey-v7';
var CACHE_SHELL = ['/', '/index.html'];

// ── Installation ──────────────────────────────────────────
self.addEventListener('install', function(e) {
  e.waitUntil(
    caches.open(CACHE_NAME)
      .then(function(cache) { return cache.addAll(CACHE_SHELL); })
      .then(function() { return self.skipWaiting(); })
  );
});

// ── Activation : nettoyer anciens caches ─────────────────
self.addEventListener('activate', function(e) {
  e.waitUntil(
    caches.keys().then(function(keys) {
      return Promise.all(
        keys.filter(function(k){ return k !== CACHE_NAME; })
            .map(function(k){ return caches.delete(k); })
      );
    }).then(function() { return self.clients.claim(); })
  );
});

// ── Fetch : Network First partout ────────────────────────
self.addEventListener('fetch', function(e) {
  var url = new URL(e.request.url);

  // API backend → Network First, jamais de cache
  // Les données (lounges, ratings, contributions) doivent toujours être fraîches
  if (url.pathname.includes('/backend/')) {
    e.respondWith(
      fetch(e.request)
        .catch(function() {
          // Hors-ligne uniquement : renvoyer une erreur JSON claire
          return new Response(
            JSON.stringify({ error: 'Hors-ligne', offline: true }),
            { headers: { 'Content-Type': 'application/json' } }
          );
        })
    );
    return;
  }

  // index.html → Network First avec fallback cache
  // Garantit que les mises à jour du site sont visibles immédiatement
  if (url.pathname === '/' || url.pathname.endsWith('index.html')) {
    e.respondWith(
      fetch(e.request)
        .then(function(res) {
          // Mettre à jour le cache avec la nouvelle version
          if (res.ok) {
            var clone = res.clone();
            caches.open(CACHE_NAME).then(function(c){ c.put(e.request, clone); });
          }
          return res;
        })
        .catch(function() {
          // Hors-ligne : utiliser le cache
          return caches.match(e.request);
        })
    );
    return;
  }

  // Code applicatif (JS/CSS) → Network First avec repli sur le cache.
  // En « Cache First », une version mise en cache n'etait plus jamais
  // rafraichie : le navigateur pouvait servir d'anciens scripts avec un
  // HTML recent, ce qui provoquait des incoherences a l'execution.
  // Les bibliotheques (assets/vendor) et les donnees figees (assets/data)
  // restent en Cache First : elles ne changent pas.
  if (url.pathname.indexOf('/assets/js/') !== -1 || url.pathname.indexOf('/assets/css/') !== -1) {
    e.respondWith(
      fetch(e.request)
        .then(function(res) {
          if (res.ok) {
            var clone = res.clone();
            caches.open(CACHE_NAME).then(function(c){ c.put(e.request, clone); });
          }
          return res;
        })
        .catch(function() { return caches.match(e.request); })   // hors-ligne
    );
    return;
  }

  // Autres ressources (bibliotheques, donnees, images, fonts) → Cache First
  e.respondWith(
    caches.match(e.request).then(function(cached) {
      if (cached) return cached;
      return fetch(e.request).then(function(res) {
        if (res.ok) {
          var clone = res.clone();
          caches.open(CACHE_NAME).then(function(c){ c.put(e.request, clone); });
        }
        return res;
      });
    })
  );
});