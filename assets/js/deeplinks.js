/* deeplinks.js *//* deeplinks.js */
// deeplinks.js — URLs profondes partageables
// ?country=cuba  ?lounge=ivorycoast  ?brand=Cohiba  ?market=usa
// ════════════════════════════════════════════════════════

(function() {

// ── Lecture URL au démarrage ──────────────────────────────
function parseAndNavigate() {
  var params = new URLSearchParams(window.location.search);
  var country = params.get('country');
  var lounge  = params.get('lounge');
  var brand   = params.get('brand');
  var market  = params.get('market');

  if (country) {
    var c = (COUNTRIES||[]).find(function(x){ return x.id===country; });
    if (c) {
      setTimeout(function() {
        flyToCountry(c); selCountry = c;
        if (typeof window._mobileOpenPanel === 'function') window._mobileOpenPanel(c);
        else { openPanel(c); openLex(c); }
      }, 600);
    }
  } else if (lounge) {
    var lc = (LOUNGE_COUNTRIES||[]).find(function(x){ return x.id===lounge; })
          || (COUNTRIES||[]).find(function(x){ return x.id===lounge; });
    if (lc) {
      setTimeout(function() {
        selLoungeCountry = lc;
        flyToCountry(lc);
        if (typeof openLoungePanelForCountry === 'function') openLoungePanelForCountry(lc);
      }, 600);
    }
  } else if (market) {
    var m = (MARKETS||[]).find(function(x){ return x.id===market; });
    if (m) {
      setTimeout(function() {
        selMarket = m; flyToCountry(m);
        if (typeof openMarketPanel === 'function') openMarketPanel(m);
      }, 600);
    }
  } else if (brand) {
    setTimeout(function() {
      if (typeof openBrand === 'function') {
        // Trouver le pays de la marque
        var b   = BRANDS_DB ? BRANDS_DB[brand] : null;
        var cid = b ? b.country : null;
        var c   = cid ? (COUNTRIES||[]).find(function(x){ return x.id===cid; }) : null;
        if (c) { flyToCountry(c); selCountry = c; openPanel(c); }
        setTimeout(function() { openBrand(brand, cid||''); }, 500);
      }
    }, 700);
  }
}

// ── Mise à jour URL sans rechargement ────────────────────
function pushState(type, id) {
  if (!window.history || !window.history.pushState) return;
  var url = window.location.pathname + '?' + type + '=' + encodeURIComponent(id);
  window.history.pushState({ type: type, id: id }, '', url);
}

// Bouton partage sur chaque panneau
function addShareButton(panelId, type, getId) {
  var panel = document.getElementById(panelId);
  if (!panel) return;
  var observer = new MutationObserver(function() {
    var existing = panel.querySelector('.share-btn');
    if (existing) return;
    var id = getId();
    if (!id) return;
    pushState(type, id);
    var btn = document.createElement('button');
    btn.className = 'share-btn';
    btn.innerHTML = '🔗';
    btn.title = t('ui_copy_link');
    btn.style.cssText = 'position:absolute;top:12px;right:44px;background:none;border:none;' +
      'color:var(--text2);font-size:16px;cursor:pointer;padding:4px;border-radius:4px;' +
      'transition:color .15s;z-index:10;';
    btn.addEventListener('click', function() {
      var url = window.location.origin + window.location.pathname + '?' + type + '=' + encodeURIComponent(id);
      if (navigator.share) {
        navigator.share({ title: 'CigarOdyssey', url: url }).catch(function(){});
      } else {
        navigator.clipboard.writeText(url).then(function() {
          btn.innerHTML = '✓';
          btn.style.color = 'var(--grn)';
          setTimeout(function(){ btn.innerHTML = '🔗'; btn.style.color = ''; }, 1500);
        });
      }
    });
    var header = panel.querySelector('.panel-head, .ph, [class*="head"]');
    if (header) { header.style.position = 'relative'; header.appendChild(btn); }
  });
  observer.observe(panel, { attributes: true, attributeFilter: ['class'] });
}

// ── Initialisation ────────────────────────────────────────
window.addEventListener('DOMContentLoaded', function() {
  // N'ouvrir un panneau au démarrage QUE si un paramètre URL est présent
  var hasDeepLink = window.location.search.length > 1;
  if (hasDeepLink) {
    setTimeout(parseAndNavigate, 600);
  }

  // Surveiller l'ouverture des panneaux pour ajouter le bouton partage
  addShareButton('panel',       'country', function(){ return selCountry      ? selCountry.id      : null; });
  addShareButton('lounge-panel','lounge',  function(){ return selLoungeCountry? selLoungeCountry.id: null; });
  addShareButton('panel',       'market',  function(){ return selMarket       ? selMarket.id       : null; });
});

// ── Retour arrière navigateur ─────────────────────────────
window.addEventListener('popstate', function(e) {
  if (e.state) {
    // Reconstruire l'état depuis l'historique
    window.location.reload();
  }
});

})();


