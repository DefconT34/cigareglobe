/* explorer.js */
// explorer.js — Vue "Explorer" : carte 2D avec filtres
// Complète le globe 3D pour la recherche pratique de lounges
// ════════════════════════════════════════════════════════

(function() {

// ── Normalisation des types en 6 catégories ──────────────
function normalizeType(type) {
  var t = (type || '').toLowerCase();
  if (t.includes('la casa del habano') || t.includes('habanos'))   return 'La Casa del Habano';
  if (t.includes('davidoff'))                                       return 'Davidoff';
  if (t.includes('hôtel') || t.includes('hotel') || t.includes('palace')) return 'Hôtel & Palace';
  if (t.includes('manufacture') || t.includes('plantation') || t.includes('factory')) return 'Manufacture';
  if (t.includes('festival'))                                        return 'Festival';
  return 'Cave & Lounge';
}

// Le type sert d'identifiant interne (filtres, couleurs) ET d'etiquette
// affichee. On separe les deux : la valeur reste en francais, le libelle
// passe par les cles ctype_*, presentes dans les six langues.
var TYPE_CLES = {
  'La Casa del Habano': 'ctype_lcdh',
  'Davidoff':           'ctype_davidoff',
  'Hôtel & Palace':     'ctype_hotel',
  'Manufacture':        'ctype_manufacture',
  'Festival':           'ctype_festival',
  'Cave & Lounge':      'ctype_cave_lounge',
};
function typeLabel(normType) {
  var cle = TYPE_CLES[normType];
  return cle ? t(cle) : normType;
}

var TYPE_COLORS = {
  'La Casa del Habano': '#C9A227',
  'Davidoff':           '#4A7AB5',
  'Hôtel & Palace':     '#8B5CF6',
  'Manufacture':        '#3D9B5A',
  'Festival':           '#E06030',
  'Cave & Lounge':      '#8B2BE2',
};

var REGIONS = {
  'Afrique':      ['ivorycoast','southafrica','kenya','morocco','egypt','nigeria','ghana','ethiopia','tanzania','botswana','mali','cameroon'],
  'Europe':       ['france','spain','germany','switzerland','uk','belgium','netherlands','italy','portugal','russia','ukraine','czech','austria','poland','romania','serbia','croatia','greece','turkey','luxembourg','andorra','gibraltar','albania','bulgaria','cyprus'],
  'Moyen-Orient': ['armenia','iran','uae','qatar','kuwait','bahrain','lebanon','israel','oman','saudiarabia','azerbaijan'],
  'Asie':         ['japan','china','hongkong','taiwan','southkorea','singapore','malaysia','thailand','cambodia','vietnam','india','indonesia','philippines'],
  'Amériques':    ['canada','argentina','brazil_c','chile','colombia','peru','venezuela','costarica','guatemala','paraguay','jamaica','aruba','barbados','stkitts','stmartin','caymanisles','cuba','nicaragua','dominicanrep','honduras','ecuador','usa','mexico','panama'],
  'Océanie':      ['australia'],
};

// ── État ─────────────────────────────────────────────────
var _explorerOpen = false;
var _allLounges   = [];   // [{id,country,flag,lat,lon,name,city,type,normType,price,rating}]
var _filtered     = [];
var _map          = null; // Leaflet map instance
var _markers      = [];
var _filters      = { region: 'all', type: 'all', search: '', sort: 'country' };
var _loaded       = {};   // countryId → true (lounges loaded)

// ── Construire la liste complète ─────────────────────────
function buildAllLounges() {
  if (_allLounges.length) return;
  var allLC = (LOUNGE_COUNTRIES || []).concat(COUNTRIES || []);
  var seen  = {};

  Object.entries(LOUNGES || {}).forEach(function([cid, list]) {
    if (!list || !list.length) return;
    var lc = allLC.find(function(c){ return c.id === cid; }) || { name: cid, flag:'🌍', lat:0, lon:0 };
    var region = 'Autre';
    Object.entries(REGIONS).forEach(function([r, ids]) {
      if (ids.includes(cid)) region = r;
    });
    list.forEach(function(l, idx) {
      _allLounges.push({
        uid:      cid + '_' + idx,
        cid:      cid,
        country:  lc.name,
        flag:     lc.flag,
        lat:      parseFloat(lc.lat) || 0,
        lon:      parseFloat(lc.lon) || 0,
        region:   region,
        name:     l.name,
        city:     l.city || '',
        type:     l.type || 'Cave & Lounge',
        normType: normalizeType(l.type),
        price:    l.price || '',
        rating:   l.rating ? parseFloat(l.rating) : null,
        desc:     l.desc || l.description || '',
        phone:    l.phone || '',
        maps_url: l.maps_url || null,
        instagram:l.instagram || null,
      });
    });
  });
}

// ── Appliquer les filtres ────────────────────────────────
function applyFilters() {
  var q = _filters.search.toLowerCase().trim();
  _filtered = _allLounges.filter(function(l) {
    if (_filters.region !== 'all' && l.region !== _filters.region) return false;
    if (_filters.type   !== 'all' && l.normType !== _filters.type)  return false;
    if (q && !l.name.toLowerCase().includes(q)
          && !l.city.toLowerCase().includes(q)
          && !l.country.toLowerCase().includes(q)) return false;
    return true;
  });

  // Tri
  _filtered.sort(function(a, b) {
    if (_filters.sort === 'rating') {
      var ra = a.rating || 0, rb = b.rating || 0;
      if (rb !== ra) return rb - ra;
    }
    return a.country.localeCompare(b.country) || a.name.localeCompare(b.name);
  });

  renderList();
  updateMapMarkers();
  updateStats();
}

// ── Render liste ─────────────────────────────────────────
function renderList() {
  var container = document.getElementById('exp-list');
  if (!container) return;

  if (!_filtered.length) {
    container.innerHTML = '<div class="exp-empty">' + t('exp_empty') + '</div>';
    return;
  }

  container.innerHTML = _filtered.map(function(l) {
    var color  = TYPE_COLORS[l.normType] || '#8B2BE2';
    var stars  = l.rating ? renderStars(l.rating) : '';
    var phone  = l.phone  ? '<a class="exp-link" href="tel:'+l.phone+'">📞</a>' : '';
    var maps   = l.maps_url ? '<a class="exp-link" href="'+l.maps_url+'" target="_blank" rel="noopener">🗺</a>' : '';
    var insta  = l.instagram ? '<a class="exp-link" href="https://instagram.com/'+l.instagram.replace('@','')+'" target="_blank" rel="noopener">📸</a>' : '';
    return '<div class="exp-card" data-uid="'+l.uid+'" onclick="expSelectCard(\''+l.uid+'\')">'+
      '<div class="exp-card-head">'+
        '<span class="exp-flag">'+drapeauImg(l.cid, 'exp-flag-img', 26, 17)+'</span>'+
        '<div class="exp-card-info">'+
          '<div class="exp-card-name">'+l.name+'</div>'+
          '<div class="exp-card-meta">'+
            '<span class="exp-city">'+l.city+'</span>'+
            '<span class="exp-type-dot" style="background:'+color+'"></span>'+
            '<span class="exp-type-lbl" style="color:'+color+'">'+typeLabel(l.normType)+'</span>'+
          '</div>'+
        '</div>'+
        '<div class="exp-card-right">'+
          (l.price ? '<span class="exp-price">'+l.price+'</span>' : '')+
          (stars ? '<div class="exp-stars">'+stars+'</div>' : '')+
        '</div>'+
      '</div>'+
      (l.desc ? '<div class="exp-card-desc">'+l.desc.substring(0,100)+'…</div>' : '')+
      '<div class="exp-card-links">'+phone+maps+insta+'</div>'+
    '</div>';
  }).join('');
}

function renderStars(r) {
  var s = '';
  for (var i=1;i<=5;i++) s += i<=Math.round(r)?'★':'☆';
  return '<span style="color:#C9A227;font-size:10px">'+s+'</span>'+
         '<span style="font-size:9px;color:var(--text2);margin-left:2px">'+r.toFixed(1)+'</span>';
}

// ── Stats ────────────────────────────────────────────────
function updateStats() {
  var el = document.getElementById('exp-stats') || document.getElementById('exp-count');
  if (!el) return;
  if (!_allLounges.length) { el.textContent = t('exp_loading'); return; }
  var nbPays = new Set(_filtered.map(function(l){ return l.cid; })).size;
  var modele = t(_filtered.length > 1 ? 'exp_stats_many' : 'exp_stats_one');
  el.textContent = modele.replace('{n}', _filtered.length).replace('{p}', nbPays);
}

// ── Carte Leaflet ────────────────────────────────────────
function initMap() {
  if (_map) return;
  if (!window.L) return;

  _map = L.map('exp-map', {
    center:  [20, 10],
    zoom:    2,
    minZoom: 2,
    maxZoom: 12,
  });

  // ── LES TUILES SOMBRES DE CARTO SONT PASSÉES SOUS CLÉ ──
  //
  // `basemaps.cartocdn.com/dark_all` répondait sans authentification.
  // CARTO a fermé l'accès public : le service renvoie désormais une
  // tuile où « API KEY REQUIRED — carto.com/basemaps/apikey » est INCRUSTÉ
  // dans l'image. Rien ne casse, rien ne tombe en erreur — la carte
  // s'affiche, couverte d'un filigrane. C'est le pire mode de panne :
  // aucune console, aucun 4xx, juste un site qui a l'air négligé.
  //
  // On repasse donc sur les tuiles OpenStreetMap, qui ne demandent pas
  // de clé. Elles sont claires ; le thème est sombre. Plutôt que de
  // renoncer à l'un ou à l'autre, la couche est inversée en CSS
  // (voir `.leaflet-tile-pane` plus bas) : c'est la recette usuelle, et
  // elle rend des étiquettes lisibles.
  //
  // POUR REVENIR À CARTO : prendre une clé sur carto.com/basemaps/apikey
  // et remplacer TUILES ci-dessous par
  //   https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png?api_key=…
  // en retirant la classe `exp-map--inverse` du conteneur.
  L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '© OpenStreetMap',
    maxZoom: 19
  }).addTo(_map);
  document.getElementById('exp-map').classList.add('exp-map--inverse');

  updateMapMarkers();
}

function updateMapMarkers() {
  if (!_map) return;

  // Supprimer anciens marqueurs
  _markers.forEach(function(m){ _map.removeLayer(m); });
  _markers = [];

  // Grouper par pays (éviter 198 marqueurs individuels au zoom 2)
  var byCountry = {};
  _filtered.forEach(function(l) {
    if (!byCountry[l.cid]) byCountry[l.cid] = { cid:l.cid, lat:l.lat, lon:l.lon, country:l.country, flag:l.flag, lounges:[] };
    byCountry[l.cid].lounges.push(l);
  });

  Object.values(byCountry).forEach(function(g) {
    if (!g.lat && !g.lon) return;
    var count   = g.lounges.length;
    var color   = count >= 5 ? '#C9A227' : count >= 2 ? '#8B2BE2' : '#3D9B5A';
    var size    = count >= 10 ? 32 : count >= 3 ? 24 : 18;

    var icon = L.divIcon({
      html: '<div style="'+
        'width:'+size+'px;height:'+size+'px;'+
        'background:'+color+';'+
        'border:2px solid rgba(255,255,255,0.8);'+
        'border-radius:50%;'+
        'display:flex;align-items:center;justify-content:center;'+
        'font-size:'+(size<24?9:11)+'px;font-weight:700;color:#0E0B08;'+
        'box-shadow:0 2px 8px rgba(0,0,0,0.5);'+
        'cursor:pointer;'+
        '">'+count+'</div>',
      iconSize:   [size, size],
      iconAnchor: [size/2, size/2],
      className:  '',
    });

    var marker = L.marker([g.lat, g.lon], { icon: icon })
      .addTo(_map)
      .bindPopup(buildPopup(g), { maxWidth: 260, className: 'exp-popup' });

    _markers.push(marker);
  });
}

function buildPopup(g) {
  var html = '<div style="font-family:Cinzel,serif;font-size:10px;letter-spacing:.1em;color:#C9A227;margin-bottom:6px">'+
    drapeauImg(g.cid, 'exp-flag-img', 20, 13)+' '+g.country.toUpperCase()+'</div>';
  g.lounges.slice(0,5).forEach(function(l) {
    var color = TYPE_COLORS[l.normType] || '#8B2BE2';
    html += '<div style="padding:4px 0;border-bottom:1px solid rgba(255,255,255,0.08)">'+
      '<div style="font-size:12px;color:#F0E8D8;font-weight:500">'+l.name+'</div>'+
      '<div style="font-size:10px;color:#A09880">'+l.city+
        ' <span style="color:'+color+'">· '+l.normType+'</span></div>'+
    '</div>';
  });
  if (g.lounges.length > 5) {
    html += '<div style="font-size:10px;color:#6B6050;margin-top:4px">+'+(g.lounges.length-5)+' autres…</div>';
  }
  html += '<button onclick="expFlyToCountry(\''+g.lounges[0].cid+'\')" '+
    'style="margin-top:8px;width:100%;padding:5px;background:rgba(201,162,39,0.15);'+
    'border:1px solid rgba(201,162,39,0.4);border-radius:3px;color:#C9A227;'+
    'font-family:Cinzel,serif;font-size:9px;letter-spacing:.12em;cursor:pointer;">'+
    t('exp_see_globe') + '</button>';
  return html;
}

// ── Sélection carte ──────────────────────────────────────
window.expSelectCard = function(uid) {
  document.querySelectorAll('.exp-card').forEach(function(c){ c.classList.remove('active'); });
  var card = document.querySelector('[data-uid="'+uid+'"]');
  if (card) {
    card.classList.add('active');
    card.scrollIntoView({ behavior:'smooth', block:'nearest' });
  }
  var l = _allLounges.find(function(x){ return x.uid === uid; });
  if (l && _map) {
    _map.flyTo([l.lat, l.lon], 6, { duration: 1 });
  }
};

window.expFlyToCountry = function(cid) {
  closeExplorer();
  var lc = (LOUNGE_COUNTRIES||[]).find(function(x){ return x.id===cid; })
        || (COUNTRIES||[]).find(function(x){ return x.id===cid; });
  if (lc) {
    flyToCountry(lc);
    selLoungeCountry = lc;
    if (typeof openLoungePanelForCountry === 'function') openLoungePanelForCountry(lc);
  }
};

// ── Ouvrir / Fermer ──────────────────────────────────────
// Flag : true quand LOUNGES a été chargé complet depuis data.php
var _loungesFullyLoaded = false;
var _explorerLang = 'fr'; // langue du cache explorer

function _loadAllFromDB(onDone) {
  fetch(DATA_API + '?action=lounges_all&lang=' + (window.currentLang||'fr'))
    .then(function(r) {
      if (!r.ok) throw new Error('HTTP ' + r.status);
      return r.json();
    })
    .then(function(data) {
      if (data.lounges) {
        Object.keys(data.lounges).forEach(function(cid) {
          LOUNGES[cid] = data.lounges[cid];
        });
        _loungesFullyLoaded = true; _explorerLang = window.currentLang||'fr';
      }
      _allLounges = [];
      buildAllLounges();
      onDone();
    })
    .catch(function(err) {
      console.warn('[Explorer] lounges_all error:', err.message);
      // Fallback pays par pays
      var list  = (LOUNGE_COUNTRIES || []);
      var done  = 0;
      var total = list.length;
      if (!total) { onDone(); return; }
      list.forEach(function(lc) {
        window.loadLounges(lc.id)
          .then(function()  { if (++done === total) { _allLounges = []; buildAllLounges(); onDone(); } })
          .catch(function() { if (++done === total) { _allLounges = []; buildAllLounges(); onDone(); } });
      });
    });
}

function openExplorer() {
  var overlay = document.getElementById('exp-overlay');
  if (!overlay) return;
  _explorerOpen = true;
  overlay.classList.add('open');
  document.body.style.overflow = 'hidden';
  autoRot = false;

  // Carte Leaflet
  if (!_map) {
    setTimeout(function() { initMap(); }, 200);
  } else {
    setTimeout(function() { _map.invalidateSize(); }, 200);
  }

  // Cache complet disponible → affichage immédiat (seulement si même langue)
  if (_loungesFullyLoaded && _allLounges.length && _explorerLang === (window.currentLang||'fr')) {
    applyFilters();
    return;
  }
  // Langue changée → forcer rechargement
  if (_loungesFullyLoaded && _explorerLang !== (window.currentLang||'fr')) {
    _loungesFullyLoaded = false;
    _allLounges = [];
  }

  // Afficher spinner
  var listEl = document.getElementById('exp-list');
  if (listEl) listEl.innerHTML =
    '<div style="padding:40px;text-align:center;color:var(--text2);' +
    'font-family:Cinzel,serif;font-size:10px;letter-spacing:.2em">'+t('loading_spinner')+'</div>';

  // Charger depuis MySQL
  _loadAllFromDB(function() { applyFilters(); });
}

function closeExplorer() {
  var overlay = document.getElementById('exp-overlay');
  if (!overlay) return;
  _explorerOpen = false;
  overlay.classList.remove('open');
  document.body.style.overflow = '';
  setTimeout(function(){ autoRot = true; }, 1500);
}

window.openExplorer  = openExplorer;
window.closeExplorer = closeExplorer;

// ── Injection UI ─────────────────────────────────────────
window.addEventListener('DOMContentLoaded', function() {

  // CSS
  var style = document.createElement('style');
  style.textContent = `
    /* ── Explorer overlay ───────────────────────── */
    #exp-overlay {
      position:fixed; inset:0; z-index:600;
      background:var(--bg);
      display:flex; flex-direction:column;
      /* visibility en plus de l'opacite : sinon les six controles de
         la vue restent focalisables au clavier alors qu'elle est
         fermee et invisible. */
      opacity:0; visibility:hidden; pointer-events:none;
      /* Meme regle que l'overlay de recherche : visibility commutee,
         immediate a l'ouverture, differee a la fermeture. */
      transition:opacity .25s, visibility 0s linear .25s;
    }
    #exp-overlay.open {
      opacity:1; visibility:visible; pointer-events:all;
      transition:opacity .25s, visibility 0s;
    }

    /* Header Explorer */
    #exp-header {
      display:flex; align-items:center; gap:12px;
      padding:12px 16px;
      background:var(--bg2); border-bottom:1px solid var(--panel-border);
      flex-shrink:0;
    }
    #exp-title {
      font-family:Cinzel,serif; font-size:13px; letter-spacing:.2em;
      color:var(--gold); text-transform:uppercase; flex:1;
    }
    #exp-close {
      background:none; border:none; color:var(--text2); font-size:20px;
      cursor:pointer; padding:4px 8px; border-radius:4px; transition:color .15s;
      line-height:1;
    }
    #exp-close:hover { color:var(--text); }

    /* Filtres */
    #exp-filters {
      display:flex; gap:8px; padding:10px 16px; flex-wrap:wrap;
      background:var(--bg2); border-bottom:1px solid var(--panel-border);
      flex-shrink:0;
    }
    /* Le cadre passe sur l'enveloppe pour que la loupe soit dedans, comme
       dans la recherche principale ; le champ devient transparent. */
    .exp-search-wrap {
      flex:1; min-width:160px;
      display:flex; align-items:center; gap:6px;
      padding:6px 10px;
      background:var(--bg3); border:1px solid var(--panel-border);
      border-radius:4px;
    }
    .exp-search-wrap:focus-within { border-color:var(--gold); }
    /* .search-icon est defini par search.js en 18px pour l'overlay
       plein ecran : ici la barre de filtres est plus dense. */
    .exp-search-wrap .search-icon { font-size:13px; color:var(--gold); flex-shrink:0; }
    #exp-search {
      flex:1; min-width:0; padding:0;
      background:transparent; border:none; outline:none;
      color:var(--text); font-size:12px; font-family:inherit;
    }
    .exp-select {
      padding:6px 10px; background:var(--bg3);
      border:1px solid var(--panel-border); border-radius:4px;
      color:var(--text2); font-size:11px; font-family:Cinzel,serif;
      letter-spacing:.05em; cursor:pointer; outline:none;
    }
    .exp-select:focus { border-color:var(--gold); }

    /* Stats */
    #exp-stats {
      padding:5px 16px; font-family:Cinzel,serif; font-size:9px;
      letter-spacing:.12em; color:var(--text2); background:var(--bg2);
      border-bottom:1px solid var(--panel-border);
      flex-shrink:0;
    }

    /* Corps principal */
    #exp-body {
      display:grid; grid-template-columns:340px 1fr;
      flex:1; overflow:hidden;
      min-height:0;
    }
    @media (max-width:640px) {
      #exp-body { grid-template-columns:1fr; grid-template-rows:1fr 220px; }
    }

    /* Liste */
    #exp-list {
      overflow-y:auto; padding:8px;
      border-right:1px solid var(--panel-border);
    }
    .exp-empty {
      padding:40px; text-align:center;
      color:var(--text2); font-family:Cinzel,serif;
      font-size:11px; letter-spacing:.1em;
    }

    /* Carte */
    #exp-map {
      flex:1; background:var(--bg3);
    }
    /* Les tuiles OpenStreetMap sont claires, le thème est sombre.
       L'inversion + rotation de teinte rend un fond sombre dont les
       étiquettes restent lisibles ; les marqueurs, eux, sont dessinés
       par Leaflet DANS un autre calque et ne sont pas touchés. */
    .exp-map--inverse .leaflet-tile-pane {
      filter: invert(1) hue-rotate(180deg) brightness(.92) contrast(.92) saturate(.7);
    }
    .exp-popup .leaflet-popup-content-wrapper {
      background:var(--bg2,#1A1410);
      border:1px solid rgba(201,162,39,0.3);
      border-radius:6px; color:#F0E8D8;
      box-shadow:0 8px 32px rgba(0,0,0,0.5);
    }
    .exp-popup .leaflet-popup-tip { background:var(--bg2,#1A1410); }

    /* Cards */
    .exp-card {
      background:var(--bg2); border:1px solid var(--panel-border);
      border-radius:5px; padding:10px 12px; margin-bottom:5px;
      cursor:pointer; transition:border-color .15s, background .15s;
    }
    .exp-card:hover { border-color:var(--gold); background:var(--bg3); }
    .exp-card.active { border-color:var(--gold); border-left:3px solid var(--gold); }
    .exp-card-head { display:flex; align-items:flex-start; gap:8px; }
    .exp-flag { flex-shrink:0; line-height:0; }
    .exp-card-info { flex:1; min-width:0; }
    .exp-card-name {
      font-family:'Playfair Display',serif; font-size:13px;
      color:var(--text); white-space:nowrap; overflow:hidden;
      text-overflow:ellipsis; font-weight:600;
    }
    .exp-card-meta {
      display:flex; align-items:center; gap:5px;
      font-size:10px; color:var(--text2); margin-top:2px;
      flex-wrap:wrap;
    }
    .exp-type-dot { width:6px; height:6px; border-radius:50%; flex-shrink:0; }
    .exp-type-lbl { font-size:9px; white-space:nowrap; }
    .exp-city { white-space:nowrap; overflow:hidden; text-overflow:ellipsis; }
    .exp-card-right { display:flex; flex-direction:column; align-items:flex-end; gap:3px; flex-shrink:0; }
    .exp-price { font-size:10px; color:var(--text2); }
    .exp-card-desc {
      font-size:10px; color:var(--text2); margin-top:5px;
      line-height:1.4; display:-webkit-box;
      -webkit-line-clamp:2; -webkit-box-orient:vertical; overflow:hidden;
    }
    .exp-card-links { display:flex; gap:6px; margin-top:6px; }
    .exp-link {
      font-size:14px; text-decoration:none;
      opacity:.7; transition:opacity .15s;
    }
    .exp-link:hover { opacity:1; }

    /* Le bouton 🗺 prend sa géométrie de .side-fab (components.css) :
       il fait partie de la colonne #side-fabs, rien à positionner ici. */
  `;
  document.head.appendChild(style);

  // Charger Leaflet (CSS + JS)
  var leafletCSS = document.createElement('link');
  leafletCSS.rel  = 'stylesheet';
  leafletCSS.href = 'https://unpkg.com/leaflet@1.9.4/dist/leaflet.css';
  document.head.appendChild(leafletCSS);

  var leafletJS = document.createElement('script');
  leafletJS.src  = 'https://unpkg.com/leaflet@1.9.4/dist/leaflet.js';
  document.head.appendChild(leafletJS);

  // Bouton Explorer (dans la colonne gauche, au-dessus de la recherche)
  var btn = document.createElement('button');
  btn.id        = 'explorer-btn';
  btn.className = 'side-fab';
  btn.title     = 'Vue Explorer — Carte 2D';
  btn.innerHTML = '🗺';
  btn.setAttribute('aria-label', 'Vue Explorer');
  btn.addEventListener('click', openExplorer);
  (document.getElementById('side-fabs') || document.body).appendChild(btn);

  // Overlay Explorer
  var overlay = document.createElement('div');
  overlay.id = 'exp-overlay';
  overlay.setAttribute('aria-hidden', 'true');
  overlay.innerHTML = `
    <div id="exp-header">
      <div id="exp-title">${t('explorer_title')}</div><button class="exp-contrib-btn" onclick="window.openContribModal&&window.openContribModal('')" title="${t('contrib_signaler')}">${t('explorer_add')}</button>
      <button id="exp-close" onclick="closeExplorer()" aria-label="Fermer">✕</button>
    </div>
    <div id="exp-filters">
      <div class="exp-search-wrap">
        <span class="search-icon" aria-hidden="true">🔍</span>
        <input id="exp-search" type="search" placeholder="${t('explorer_search_ph')}"
               autocomplete="off" aria-label="${t('explorer_search_ph')}" oninput="expFilter()">
      </div>
      <select class="exp-select" id="exp-region" onchange="expFilter()">
        <option value="all">${t('explorer_regions')}</option>
        <option value="Afrique">${t('region_africa')}</option>
        <option value="Europe">${t('region_europe')}</option>
        <option value="Moyen-Orient">${t('region_mideast')}</option>
        <option value="Asie">${t('region_asia')}</option>
        <option value="Amériques">${t('region_americas')}</option>
        <option value="Océanie">${t('region_oceania')}</option>
      </select>
      <select class="exp-select" id="exp-type" onchange="expFilter()">
        <option value="all">${t('explorer_types')}</option>
        <option value="La Casa del Habano">${t('type_lcdh')}</option>
        <option value="Davidoff">💎 Davidoff</option>
        <option value="Hôtel & Palace">${t('type_hotel')}</option>
        <option value="Manufacture">${t('type_manufacture')}</option>
        <option value="Cave & Lounge">${t('type_cave')}</option>
        <option value="Festival">${t('type_festival')}</option>
      </select>
      <select class="exp-select" id="exp-sort" onchange="expFilter()">
        <option value="country">${t('explorer_sort_country')}</option>
        <option value="rating">${t('explorer_sort_rating')}</option>
      </select>
    </div>
    <div id="exp-stats">198 établissements · 75 pays</div>
    <div id="exp-body">
      <div id="exp-list"></div>
      <div id="exp-map"></div>
    </div>
  `;
  document.body.appendChild(overlay);

  // Fermer sur Escape
  document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape' && _explorerOpen) closeExplorer();
  });

});

// ── Rafraichissement de langue ────────────────────────────
// L'overlay est construit une seule fois : sans cette fonction, ses
// libelles restent figes dans la langue du chargement. C'est ce qui
// laissait « ✏ Ajouter » en francais dans les six langues alors que la
// cle explorer_add etait bien traduite.
window.expRefreshLang = function() {
  var titre = document.getElementById('exp-title');
  if (!titre) return;                       // overlay pas encore construit
  titre.textContent = t('explorer_title');

  var ajouter = document.querySelector('.exp-contrib-btn');
  if (ajouter) ajouter.textContent = t('explorer_add');

  var champ = document.getElementById('exp-search');
  if (champ) { champ.placeholder = t('explorer_search_ph');
               champ.setAttribute('aria-label', t('explorer_search_ph')); }

  // Les listes deroulantes : le premier choix et les libelles de type.
  // Les « value » restent en francais, ce sont les identifiants internes.
  var type = document.getElementById('exp-type');
  if (type) {
    type.options[0].text = t('explorer_types');
    for (var i = 1; i < type.options.length; i++) {
      var v = type.options[i].value;
      type.options[i].text = (v === 'Davidoff') ? '💎 Davidoff' : typeLabel(v);
    }
  }
  var tri = document.getElementById('exp-sort');
  if (tri && tri.options.length >= 2) {
    tri.options[0].text = t('explorer_sort_country');
    tri.options[1].text = t('explorer_sort_rating');
  }

  // Re-rendu : cartes, compteur et etiquettes de type.
  applyFilters();
};

// ── Filter handler ────────────────────────────────────────
window.expFilter = function() {
  _filters.search = document.getElementById('exp-search').value;
  _filters.region = document.getElementById('exp-region').value;
  _filters.type   = document.getElementById('exp-type').value;
  _filters.sort   = document.getElementById('exp-sort').value;
  // Rebuild index to pick up any newly loaded lounges
  _allLounges = [];
  buildAllLounges();
  applyFilters();
};

})();











