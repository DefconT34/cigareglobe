/* search.js */
// search.js — Recherche globale instantanée (client-side)
// Indexe : pays, lounges, marques, marchés
// ════════════════════════════════════════════════════════

(function() {

// ── Index de recherche construit une fois ────────────────
var _index = null;

// ════════════════════════════════════════════════════════
// L'INDEX SERVI — sans lui, la recherche ne trouvait AUCUNE maison
// ────────────────────────────────────────────────────────
// MESURÉ DANS LE NAVIGATEUR, et c'est ce qui a ouvert ce chantier :
// « saga », « padron » et « davidoff » rendaient chacun ZÉRO résultat.
// Pas seulement Saga — AUCUNE des 181 maisons, et aucun des 508
// établissements.
//
// La cause n'était pas le score ni les mots-clés : `BRANDS_DB` et
// `LOUNGES` sont VIDES au moment où l'index se construit.
// `data.amorce.js` les déclare à `{}` et le chargement paresseux ne
// les remplit qu'au clic, une fiche à la fois. L'index n'avait donc
// jamais rien à lire. Seuls les pays sortaient, parce qu'eux sont
// chargés d'emblée.
//
// Second défaut, au même endroit : les mots-clés d'un pays faisaient
// `[].concat(c.brands).join(' ')` sur un tableau d'OBJETS
// `{name, desc, iconic}`. Le résultat était « [object Object] »
// répété dix fois. Le repli qui aurait pu sauver la recherche de
// marque — la trouver par son pays — ne fonctionnait pas non plus.
//
// D'où cette petite requête dédiée : elle ne rend que des noms, elle
// est demandée à la PREMIÈRE OUVERTURE de la boîte et pas au
// chargement de la page, et l'index se reconstruit quand elle arrive.
// ════════════════════════════════════════════════════════
var _servi = null;      // { marques: [...], lounges: [...] } une fois chargé
var _servi_promesse = null;

function chargerIndexServi() {
  if (_servi_promesse) return _servi_promesse;
  var base = (typeof DATA_API !== 'undefined' && DATA_API) ? DATA_API
           : ((window.CG_BACKEND_BASE || '') + '/data.php');
  _servi_promesse = fetch(base + '?action=recherche&lang=' + (window.currentLang || 'fr'))
    .then(function(r) { return r.ok ? r.json() : null; })
    .then(function(d) {
      if (!d || !d.marques) return null;
      _servi = d;
      _index = null;          // à reconstruire, il a maintenant de quoi
      return d;
    })
    .catch(function() {
      // UNE RECHERCHE NE DOIT JAMAIS CASSER LA PAGE. Sans l'index
      // servi, on retombe sur ce que la mémoire du navigateur porte
      // déjà — les pays, et les fiches que le lecteur a ouvertes.
      return null;
    });
  return _servi_promesse;
}

/**
 * Replie les accents, et c'est indispensable ici.
 *
 * MESURÉ : « padron » rendait ZÉRO résultat alors que la fiche existe —
 * elle s'appelle « Padrón ». Le même piège attend Toraño, Bolívar,
 * Cohíba, Perdomo… et tous les noms de villes du catalogue
 * d'établissements. Personne ne tape les accents dans une boîte de
 * recherche, et un atlas hispanophone sans repli d'accents est un atlas
 * qu'on ne peut pas interroger.
 *
 * NFD sépare la lettre de son signe, le filtre retire le signe. Le ñ
 * devient n, le í devient i. On l'applique AUX DEUX CÔTÉS — la frappe
 * et l'index — sans quoi le repli ne sert à rien.
 */
function _pli(s) {
  s = String(s == null ? '' : s).toLowerCase();
  try { return s.normalize('NFD').replace(/[\u0300-\u036f]/g, ''); }
  catch (e) { return s; }   // navigateur sans normalize() : on dégrade, on ne casse pas
}

/** Le pays d'un identifiant, producteur ou pays de lounges. */
function paysDe(id) {
  return (COUNTRIES || []).find(function(c){ return c.id === id; })
      || (LOUNGE_COUNTRIES || []).find(function(c){ return c.id === id; })
      || { id: id, name: id, flag: '🏠' };
}

function buildIndex() {
  if (_index) return _index;
  _index = [];

  // Pays producteurs
  (COUNTRIES || []).forEach(function(c) {
    // `c.brands` est un tableau d'OBJETS { name, desc, iconic } : le
    // concaténer tel quel donnait « [object Object] » dix fois. On en
    // tire les noms, ce qui permet aussi de trouver un pays par une
    // maison qu'il annonce.
    var annoncees = (Array.isArray(c.brands) ? c.brands : []).map(function(b) {
      return (b && typeof b === 'object') ? String(b.name || '') : String(b || '');
    });
    _index.push({
      type: 'country', id: c.id, label: c.name,
      sub: c.region, flag: c.flag,
      keywords: _pli([c.name, c.region, c.id].concat(annoncees).join(' ')),
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
      keywords: _pli(lc.name + ' ' + lc.id + ' lounge cave cigare'),
      data: lc
    });
  });

  // Marchés
  (MARKETS || []).forEach(function(m) {
    _index.push({
      type: 'market', id: m.id, label: m.name,
      sub: t('tip_market').replace('{n}', m.rank).replace('— ', ''), flag: m.flag,
      keywords: _pli(m.name + ' marché consommateur'),
      data: m
    });
  });

  // ── Les 181 maisons et les 508 établissements ──────────
  // Ils viennent de l'index servi quand il est là. Sinon on retombe sur
  // `BRANDS_DB` / `LOUNGES`, qui ne portent que ce que le lecteur a
  // déjà ouvert — mieux que rien, et c'était tout ce qu'il y avait.
  if (_servi) {
    _servi.marques.forEach(function(m) {
      var country = paysDe(m.p);
      _index.push({
        type: 'brand', id: m.n, label: m.n, lignes: m.g || [],
        sub: (country.flag || '') + ' ' + country.name + ' · ' + (m.f || ''),
        flag: '🏷',
        keywords: _pli(m.n + ' ' + country.name + ' ' + (m.g || []).join(' ')
                 + ' marque cigare'),
        data: { brand: null, country: country, name: m.n }
      });
    });
    _servi.lounges.forEach(function(l) {
      var country = paysDe(l.p);
      _index.push({
        type: 'lounge', id: l.p + ':' + l.n, label: l.n,
        sub: (l.v ? l.v + ' · ' : '') + country.name, flag: country.flag,
        keywords: _pli(l.n + ' ' + l.v + ' ' + country.name + ' lounge cave'),
        data: { lounge: { name: l.n, city: l.v }, country: country }
      });
    });
    return _index;
  }

  // Lounges (établissements)
  Object.entries(LOUNGES || {}).forEach(function([cid, list]) {
    var country = (LOUNGE_COUNTRIES||[]).find(function(lc){ return lc.id===cid; })
               || (COUNTRIES||[]).find(function(c){ return c.id===cid; })
               || { name: cid, flag: '🏠' };
    list.forEach(function(l) {
      _index.push({
        type: 'lounge', id: cid + ':' + l.name, label: l.name,
        sub: l.city + ' · ' + country.name, flag: country.flag,
        keywords: _pli(l.name + ' ' + l.city + ' ' + (l.type||'') + ' ' + country.name + ' lounge cave'),
        data: { lounge: l, country: country }
      });
    });
  });

  // Marques
  //
  // ── LES GAMMES SONT INDEXÉES, ET C'EST INDISPENSABLE ───
  //
  // Chercher « Saga » ne rendait RIEN. La marque existe pourtant dans
  // l'atlas : c'est une gamme de De Los Reyes Cigars, nommée dans sa
  // fiche avec ses séries — dont Blend No. 7. Mais les mots-clés ne
  // portaient que le nom de la maison, son pays, et LES CENT PREMIERS
  // CARACTÈRES de son historique. « Saga » apparaît au troisième
  // paragraphe : hors de portée.
  //
  // Le défaut touchait tout un modèle de cet atlas. Le recensement a
  // délibérément replié VINGT-SEPT lignes prises pour des maisons dans
  // la fiche de leur fabrique — Arsen chez De Los Reyes, Chaman chez
  // Vegas de Santiago, Zino chez Oettinger Davidoff, Oliveros chez
  // Boutique Blends. Ce sont exactement les noms qu'un lecteur tape, et
  // aucun n'était trouvable. Le travail de rattachement était fait dans
  // la base et défait dans la recherche.
  Object.entries(BRANDS_DB || {}).forEach(function([name, b]) {
    var country = (COUNTRIES||[]).find(function(c){ return c.id===b.country; }) || { flag:'🥃', name:b.country };
    // `gamme` est un tableau d'objets { name, story, ... }. Il peut être
    // absent, nul, ou déjà une chaîne selon la fiche : on ne suppose
    // rien, une recherche ne doit jamais casser sur une donnée creuse.
    var lignes = (Array.isArray(b.gamme) ? b.gamme : [])
      .map(function(g) { return g && g.name ? String(g.name) : ''; })
      .filter(function(n) { return n !== ''; });
    _index.push({
      type: 'brand', id: name, label: name, lignes: lignes,
      sub: country.flag + ' ' + country.name + ' · ' + (b.founded||''),
      flag: '🏷',
      keywords: _pli(name + ' ' + country.name + ' ' + lignes.join(' ') + ' '
               + (b.history||'').slice(0,100) + ' marque cigare'),
      data: { brand: b, country: country, name: name }
    });
  });

  return _index;
}

// ── Recherche ────────────────────────────────────────────
function search(query, maxResults) {
  maxResults = maxResults || 8;
  if (!query || query.trim().length < 2) return [];
  // La frappe est repliee comme l'index : « padron » doit trouver
  // « Padrón ». Replier un seul cote ne servirait a rien.
  var q = _pli(query.trim());
  var idx = buildIndex();

  return idx
    .map(function(item) {
      var score = 0;
      // Correspondance exacte en début = score max
      if (_pli(item.label).startsWith(q))   score = 100;
      else if (_pli(item.label).includes(q)) score = 80;
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
    .map(function(r) {
      var it = r.item;
      // ── DIRE POURQUOI CE RÉSULTAT RÉPOND ───────────────
      // Taper « Saga » et voir « De Los Reyes Cigars » sans un mot
      // d'explication se lit comme une erreur de la recherche. Quand la
      // correspondance vient d'une GAMME et non du nom de la maison, la
      // ligne trouvée est affichée devant : « Saga · 🇩🇴 … ».
      if (it.type !== 'brand' || !it.lignes || !it.lignes.length) return it;
      if (_pli(it.label).includes(q)) return it;
      var touchee = it.lignes.find(function(n){ return _pli(n).includes(q); });
      if (!touchee) return it;
      // Copie : l'index est construit UNE FOIS et réutilisé à chaque
      // frappe. Écrire dans l'item y laisserait la mention d'une
      // recherche précédente.
      return Object.assign({}, it, { sub: _esc(touchee) + ' · ' + it.sub });
    });
}

// ── Action au clic sur un résultat ───────────────────────
function executeResult(result) {
  closeSearch();
  // Une nouvelle selection commence : on vide les trois panneaux avant
  // d'en remplir certains (voir reinitialiser() dans panneau-vide.js).
  if (typeof window.reinitialiserPanneaux === 'function') window.reinitialiserPanneaux();
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

// -- Les discussions ---------------------------------------
// Le reste de l'index vit dans le navigateur : pays, marches,
// etablissements et marques sont deja charges. Les discussions, non —
// elles changent toutes les heures et se comptent en milliers. Elles
// arrivent donc du serveur, APRES les resultats locaux, et se posent en
// dessous : la recherche ne doit pas attendre le reseau pour repondre
// ce qu'elle sait deja.
var _forumJeton = 0;

function chercherDiscussions(q, container) {
  var jeton = ++_forumJeton;
  var moi   = window.currentLang || 'fr';
  var lang  = moi === 'en' ? 'en' : moi + ',en';
  var base  = (window.CG_BACKEND_BASE || '/backend') + '/forum.php';

  fetch(base + '?action=search&q=' + encodeURIComponent(q) + '&lang=' + encodeURIComponent(lang),
        { credentials: 'include' })
    .then(function (r) { return r.json(); })
    .then(function (d) {
      // Une reponse en retard ne doit pas ecraser une frappe plus
      // recente : le reseau ne rend pas les reponses dans l'ordre.
      if (jeton !== _forumJeton || q !== _currentQuery) return;
      afficherDiscussions((d && d.topics) || [], container);
    })
    .catch(function () { /* la recherche vaut sans le reseau */ });
}

function afficherDiscussions(topics, container) {
  var vieux = container.querySelector('.sr-forum');
  if (vieux) vieux.remove();
  if (!topics.length) return;

  var bloc = document.createElement('div');
  bloc.className = 'sr-forum';
  bloc.innerHTML = '<div class="sr-groupe">' + _esc(t('forum_titre')) + '</div>' +
    topics.map(function (x) {
      return '<div class="sr-item" data-sujet="' + x.id + '" role="option" tabindex="0">' +
        '<span class="sr-flag">\u{1F4AC}</span>' +
        '<div class="sr-info">' +
          '<div class="sr-name">' + _highlight(_esc(x.title)) + '</div>' +
          '<div class="sr-sub">' + _esc(t('forum_sec_' + x.section)) + '</div>' +
        '</div>' +
        '<span class="sr-type">' + _esc(t('forum_titre')) + '</span>' +
      '</div>';
    }).join('');
  container.appendChild(bloc);

  bloc.querySelectorAll('.sr-item').forEach(function (el) {
    function ouvrirLe() {
      closeSearch();
      if (typeof window.ouvrirForum === 'function') {
        window.ouvrirForum(null, parseInt(el.dataset.sujet, 10));
      }
    }
    el.addEventListener('click', ouvrirLe);
    el.addEventListener('keydown', function (e) { if (e.key === 'Enter') ouvrirLe(); });
  });
}

/** Les titres viennent de la base : ils passent par l'echappement. */
function _esc(s) {
  return String(s == null ? '' : s).replace(/[&<>"']/g, function (c) {
    return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c];
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
  // Focus immediat plutot qu'apres un delai arbitraire : « visibility »
  // passe a visible des l'ajout de la classe, il suffit de forcer le
  // calcul du style avant d'appeler focus(). L'attente de 150 ms qui
  // tenait lieu de synchronisation rendait le champ tantot actif,
  // tantot non, selon la charge de la machine.
  void overlay.offsetWidth;
  input.focus({ preventScroll: true });
  // Invalider l'index si les lounges ont été chargés depuis
  _index = null;
  buildIndex();
  // ── Et demander l'index servi, une seule fois ──────────
  // Il arrive après coup : si le lecteur a déjà tapé quelque chose, on
  // relance SA recherche plutôt que de le laisser devant un « aucun
  // résultat » périmé. C'est le cas courant sur une connexion lente,
  // où l'on tape plus vite que le réseau ne répond.
  chargerIndexServi().then(function(d) {
    if (!d || !_searchOpen) return;
    var i = document.getElementById('search-input');
    var q = i ? i.value.trim() : '';
    if (q.length >= 2) i.dispatchEvent(new Event('input', { bubbles: true }));
  });
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
      /* visibility n'est pas animee mais commutee : a l'ouverture elle
         passe a « visible » immediatement (sinon focus() sur le champ
         est refuse, l'element etant encore invisible) ; a la fermeture
         elle attend la fin du fondu. */
      transition:opacity .2s, visibility 0s linear .2s;
    }
    #search-overlay.open {
      opacity:1; visibility:visible; pointer-events:all;
      transition:opacity .2s, visibility 0s;
    }

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
    /* Les discussions arrivent du serveur : elles se posent sous les
       resultats locaux, derriere un intitule qui dit d'ou elles
       viennent — un resultat qui apparait apres coup sans etiquette
       donne l'impression que la liste bouge toute seule. */
    .sr-groupe {
      padding:10px 16px 5px; font-family:'Cinzel',serif; font-size:8px;
      letter-spacing:.24em; text-transform:uppercase; color:var(--gold);
      border-top:1px solid var(--panel-border);
    }
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
      <div id="search-results" role="listbox" aria-label="' + t('ui_results') + '"></div>
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
      // Les discussions s'ajoutent quand le serveur repond ; la
      // recherche locale a deja rendu la main.
      if (_currentQuery.length >= 2) chercherDiscussions(_currentQuery, results);
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








