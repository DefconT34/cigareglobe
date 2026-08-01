/* search.js */
// search.js — Recherche globale instantanée (client-side)
// Indexe : pays, lounges, marques, marchés
// ════════════════════════════════════════════════════════

(function() {

// ── Index de recherche construit une fois ────────────────
var _index = null;

function buildIndex() {
  if (_index) return _index;
  _index = [];

  // Pays producteurs
  (COUNTRIES || []).forEach(function(c) {
    _index.push({
      type: 'country', id: c.id, label: c.name,
      sub: c.region, flag: c.flag,
      keywords: [c.name, c.region, c.id].concat(c.brands||[]).join(' ').toLowerCase(),
      data: c
    });
  });

  // Pays lounges
  (LOUNGE_COUNTRIES || []).forEach(function(lc) {
    // Éviter les doublons avec pays producteurs
    if ((COUNTRIES||[]).find(function(c){ return c.id===lc.id; })) return;
    _index.push({
      type: 'lounge-country', id: lc.id, label: lc.name,
      sub: 'Caves & Lounges', flag: lc.flag,
      keywords: (lc.name + ' ' + lc.id + ' lounge cave cigare').toLowerCase(),
      data: lc
    });
  });

  // Marchés
  (MARKETS || []).forEach(function(m) {
    _index.push({
      type: 'market', id: m.id, label: m.name,
      sub: 'Marché #' + m.rank, flag: m.flag,
      keywords: (m.name + ' marché consommateur').toLowerCase(),
      data: m
    });
  });

  // Lounges (établissements)
  Object.entries(LOUNGES || {}).forEach(function([cid, list]) {
    var country = (LOUNGE_COUNTRIES||[]).find(function(lc){ return lc.id===cid; })
               || (COUNTRIES||[]).find(function(c){ return c.id===cid; })
               || { name: cid, flag: '🏠' };
    list.forEach(function(l) {
      _index.push({
        type: 'lounge', id: cid + ':' + l.name, label: l.name,
        sub: l.city + ' · ' + country.name, flag: country.flag,
        keywords: (l.name + ' ' + l.city + ' ' + (l.type||'') + ' ' + country.name + ' lounge cave').toLowerCase(),
        data: { lounge: l, country: country }
      });
    });
  });

  // Marques
  Object.entries(BRANDS_DB || {}).forEach(function([name, b]) {
    var country = (COUNTRIES||[]).find(function(c){ return c.id===b.country; }) || { flag:'🥃', name:b.country };
    _index.push({
      type: 'brand', id: name, label: name,
      sub: country.flag + ' ' + country.name + ' · ' + (b.founded||''),
      flag: '🏷',
      keywords: (name + ' ' + country.name + ' ' + (b.history||'').slice(0,100) + ' marque cigare').toLowerCase(),
      data: { brand: b, country: country, name: name }
    });
  });

  return _index;
}

// ── Recherche ────────────────────────────────────────────
function search(query, maxResults) {
  maxResults = maxResults || 8;
  if (!query || query.trim().length < 2) return [];
  var q = query.trim().toLowerCase();
  var idx = buildIndex();

  return idx
    .map(function(item) {
      var score = 0;
      // Correspondance exacte en début = score max
      if (item.label.toLowerCase().startsWith(q))   score = 100;
      else if (item.label.toLowerCase().includes(q)) score = 80;
      else if (item.keywords.includes(q))            score = 50;
      else {
        // Recherche par mots
        var words = q.split(/\s+/);
        var matched = words.filter(function(w){ return item.keywords.includes(w); });
        if (matched.length === words.length) score = 40;
        else if (matched.length > 0) score = 20 * matched.length / words.length;
      }
      return { item: item, score: score };
    })
    .filter(function(r){ return r.score > 0; })
    .sort(function(a, b){ return b.score - a.score; })
    .slice(0, maxResults)
    .map(function(r){ return r.item; });
}

// ── Action au clic sur un résultat ───────────────────────
function executeResult(result) {
  closeSearch();
  switch(result.type) {
    case 'country':
      selCountry = result.data; selMarket = null; selLoungeCountry = null;
      flyToCountry(result.data);
      if (typeof window._mobileOpenPanel === 'function') window._mobileOpenPanel(result.data);
      else { openPanel(result.data); openLex(result.data); }
      break;
    case 'lounge-country':
      selLoungeCountry = result.data; selCountry = null; selMarket = null;
      flyToCountry(result.data);
      if (typeof openLoungePanelForCountry === 'function') openLoungePanelForCountry(result.data);
      break;
    case 'market':
      selMarket = result.data; selCountry = null; selLoungeCountry = null;
      flyToCountry(result.data);
      if (typeof openMarketPanel === 'function') openMarketPanel(result.data);
      break;
    case 'lounge':
      var lc = result.data.country;
      selLoungeCountry = lc; selCountry = null; selMarket = null;
      flyToCountry(lc);
      if (typeof openLoungePanelForCountry === 'function') openLoungePanelForCountry(lc);
      break;
    case 'brand':
      var c = result.data.country;
      if (c && c.id) {
        selCountry = c; selMarket = null; selLoungeCountry = null;
        flyToCountry(c);
        if (typeof window._mobileOpenPanel === 'function') window._mobileOpenPanel(c);
        else { openPanel(c); openLex(c); }
        setTimeout(function(){ openBrand(result.data.name, c.id); }, 400);
      }
      break;
  }
}

// ── Icône par type ────────────────────────────────────────
function typeIcon(type) {
  return { country:'🌿', 'lounge-country':'🥃', market:'📊', lounge:'🏛', brand:'🏷' }[type] || '🔍';
}
function typeLabel(type) {
  var map = {
    country:         t('type_producer'),
    'lounge-country':t('type_lounge_country'),
    market:          t('type_market'),
    lounge:          t('type_establishment'),
    brand:           t('type_brand')
  };
  return map[type] || '';
}

// ── Rendu des résultats ───────────────────────────────────
function renderResults(results, container) {
  if (!results.length) {
    container.innerHTML = '<div style="padding:20px;text-align:center;color:var(--text2);font-size:12px;font-family:Cinzel,serif;letter-spacing:.1em">'+t('search_no_result')+'</div>';
    return;
  }
  container.innerHTML = results.map(function(r, i) {
    return '<div class="sr-item" data-idx="' + i + '" role="option" tabindex="0">' +
      '<span class="sr-flag">' + r.flag + '</span>' +
      '<div class="sr-info">' +
        '<div class="sr-name">' + _highlight(r.label) + '</div>' +
        '<div class="sr-sub">' + r.sub + '</div>' +
      '</div>' +
      '<span class="sr-type">' + typeIcon(r.type) + ' ' + typeLabel(r.type) + '</span>' +
    '</div>';
  }).join('');

  // Événements clic sur chaque résultat
  var _lastResults = results;
  container.querySelectorAll('.sr-item').forEach(function(el) {
    el.addEventListener('click', function() {
      executeResult(_lastResults[+el.dataset.idx]);
    });
    el.addEventListener('keydown', function(e) {
      if (e.key === 'Enter') executeResult(_lastResults[+el.dataset.idx]);
    });
  });
}

// ── Surlignage du terme cherché ───────────────────────────
var _currentQuery = '';
function _highlight(text) {
  if (!_currentQuery) return text;
  var re = new RegExp('(' + _currentQuery.replace(/[.*+?^${}()|[\]\\]/g,'\\$&') + ')', 'gi');
  return text.replace(re, '<mark style="background:rgba(201,162,39,0.3);color:var(--gold);border-radius:2px">$1</mark>');
}

// ── UI : barre de recherche ───────────────────────────────
var _searchOpen = false;
var _debounceTimer = null;

function openSearch() {
  var overlay = document.getElementById('search-overlay');
  var input   = document.getElementById('search-input');
  if (!overlay || !input) return;
  _searchOpen = true;
  overlay.classList.add('open');
  overlay.setAttribute('aria-hidden','false');
  document.body.style.overflow = 'hidden';
  setTimeout(function(){ input.focus(); }, 150);
  // Invalider l'index si les lounges ont été chargés depuis
  _index = null;
  buildIndex();
}

function closeSearch() {
  var overlay = document.getElementById('search-overlay');
  if (!overlay) return;
  _searchOpen = false;
  overlay.classList.remove('open');
  overlay.setAttribute('aria-hidden','true');
  document.body.style.overflow = '';
  var input = document.getElementById('search-input');
  if (input) input.value = '';
  var results = document.getElementById('search-results');
  if (results) results.innerHTML = '';
}
window.openSearch  = openSearch;
window.closeSearch = closeSearch;

// ── Injection HTML + CSS ──────────────────────────────────
window.addEventListener('DOMContentLoaded', function() {

  // CSS
  var style = document.createElement('style');
  style.textContent = `
    /* Le bouton 🔍 prend sa géométrie de .side-fab (components.css) :
       il fait partie de la colonne #side-fabs, rien à positionner ici. */

    /* ── Overlay ── */
    #search-overlay {
      position:fixed; inset:0; z-index:500;
      background:rgba(10,5,0,0.88);
      backdrop-filter:blur(12px); -webkit-backdrop-filter:blur(12px);
      display:flex; flex-direction:column; align-items:center;
      padding-top:60px;
      /* visibility, et pas seulement opacity : un overlay rendu
         transparent reste focalisable au clavier et annonce par les
         lecteurs d'ecran. Son champ captait le focus alors qu'il
         etait invisible. */
      opacity:0; visibility:hidden; pointer-events:none;
      transition:opacity .2s, visibility .2s;
    }
    #search-overlay.open { opacity:1; visibility:visible; pointer-events:all; }

    /* ── Champ ── */
    .search-box {
      width:min(640px, 92vw);
      background:var(--bg2); border:1px solid var(--gold);
      border-radius:8px; overflow:hidden;
      box-shadow:0 8px 40px rgba(0,0,0,0.6);
    }
    .search-input-wrap {
      display:flex; align-items:center; gap:10px; padding:14px 16px;
    }
    .search-icon { font-size:18px; color:var(--gold); flex-shrink:0; }
    #search-input {
      flex:1; background:transparent; border:none; outline:none;
      color:var(--text); font-family:Cinzel,serif; font-size:15px;
      letter-spacing:.06em;
    }
    #search-input::placeholder { color:var(--text2); opacity:.6; }
    #search-close {
      background:none; border:none; color:var(--text2); font-size:18px;
      cursor:pointer; padding:4px 8px; border-radius:4px; line-height:1;
      transition:color .15s;
    }
    #search-close:hover { color:var(--text); }

    /* ── Résultats ── */
    #search-results {
      max-height:min(420px, 55vh); overflow-y:auto;
      border-top:1px solid var(--panel-border);
    }
    .sr-item {
      display:flex; align-items:center; gap:12px; padding:11px 16px;
      cursor:pointer; border-bottom:1px solid var(--panel-border);
      transition:background .12s;
    }
    .sr-item:hover, .sr-item:focus { background:var(--bg3); outline:none; }
    .sr-flag { font-size:20px; flex-shrink:0; width:28px; text-align:center; }
    .sr-info { flex:1; min-width:0; }
    .sr-name { font-family:'Playfair Display',serif; font-size:13px; color:var(--text);
               white-space:nowrap; overflow:hidden; text-overflow:ellipsis; }
    .sr-sub  { font-size:10px; color:var(--text2); margin-top:2px;
               white-space:nowrap; overflow:hidden; text-overflow:ellipsis; }
    .sr-type { font-size:9px; color:var(--text3); letter-spacing:.08em;
               flex-shrink:0; text-align:right; white-space:nowrap; }

    /* ── Hint ── */
    .search-hint {
      padding:12px 16px; font-size:10px; color:var(--text2);
      font-family:Cinzel,serif; letter-spacing:.08em; text-align:center;
    }
  `;
  document.head.appendChild(style);

  // Bouton recherche (top center)
  var btn = document.createElement('button');
  btn.id = 'search-btn';
  btn.className = 'side-fab';
  btn.setAttribute('aria-label', 'Rechercher (/ ou Ctrl+K)');
  btn.setAttribute('title', 'Rechercher');
  btn.innerHTML = '🔍';
  btn.addEventListener('click', openSearch);
  (document.getElementById('side-fabs') || document.body).appendChild(btn);

  // Overlay
  var overlay = document.createElement('div');
  overlay.id = 'search-overlay';
  overlay.setAttribute('aria-hidden','true');
  overlay.setAttribute('role','dialog');
  overlay.setAttribute('aria-label','Recherche');
  overlay.innerHTML = `
    <div class="search-box" role="search">
      <div class="search-input-wrap">
        <!-- Icône décorative : le champ porte deja aria-label. Le
             placeholder ne doit donc pas reprendre la loupe. -->
        <span class="search-icon" aria-hidden="true">🔍</span>
        <input id="search-input" type="search" placeholder="${t('search_ph')}"
               autocomplete="off" autocorrect="off" spellcheck="false" aria-label="Recherche"/>
        <button id="search-close" aria-label="Fermer">✕</button>
      </div>
      <div id="search-results" role="listbox" aria-label="Résultats"></div>
      <div class="search-hint" id="search-hint-text"></div>
    </div>
  `;
  // Mettre à jour le hint après injection du DOM
  var hintEl = document.getElementById('search-hint-text');
  if (hintEl) {
    var nb = Object.values(LOUNGES||{}).reduce(function(s,l){return s+(l?l.length:0);},0);
    var nbPays = Object.keys(LOUNGES||{}).length;
    hintEl.textContent = nb + ' ' + t('lounge_establish') + 's · ' + nbPays + ' ' + t('stat_countries') + ' ' + t('search_type_hint');
  }
  document.body.appendChild(overlay);

  // Events
  document.getElementById('search-close').addEventListener('click', closeSearch);
  overlay.addEventListener('click', function(e){ if(e.target===overlay) closeSearch(); });

  var input   = document.getElementById('search-input');
  var results = document.getElementById('search-results');

  input.addEventListener('input', function() {
    _currentQuery = input.value.trim();
    clearTimeout(_debounceTimer);
    _debounceTimer = setTimeout(function() {
      var res = search(_currentQuery);
      renderResults(res, results);
    }, 120);
  });

  input.addEventListener('keydown', function(e) {
    if (e.key === 'Escape') { closeSearch(); return; }
    if (e.key === 'ArrowDown') {
      var first = results.querySelector('.sr-item');
      if (first) { e.preventDefault(); first.focus(); }
    }
  });

  // Navigation clavier dans les résultats
  results.addEventListener('keydown', function(e) {
    var items = Array.from(results.querySelectorAll('.sr-item'));
    var idx   = items.indexOf(document.activeElement);
    if (e.key === 'ArrowDown' && idx < items.length-1) { e.preventDefault(); items[idx+1].focus(); }
    if (e.key === 'ArrowUp')  { e.preventDefault(); idx > 0 ? items[idx-1].focus() : input.focus(); }
    if (e.key === 'Escape')   { closeSearch(); }
  });

  // Raccourci clavier : / ou Ctrl+K
  document.addEventListener('keydown', function(e) {
    if ((e.key === '/' || (e.ctrlKey && e.key === 'k')) && !_searchOpen) {
      var active = document.activeElement;
      if (active && (active.tagName === 'INPUT' || active.tagName === 'TEXTAREA')) return;
      e.preventDefault();
      openSearch();
    }
    if (e.key === 'Escape' && _searchOpen) closeSearch();
  });
});

})();








