/* a11y-globe.js */
// ════════════════════════════════════════════════════════
// a11y-globe.js — Accessibilité du globe
// ────────────────────────────────────────────────────────
// Un canvas ne contient aucun élément navigable : le globe était donc
// inutilisable au clavier et invisible pour les lecteurs d'écran.
// Ce module apporte deux choses complémentaires :
//   1. le pilotage du globe au clavier (rotation, zoom, réinitialisation) ;
//   2. une alternative textuelle réellement équivalente — la liste des
//      destinations, qui ouvre exactement les mêmes panneaux que le clic
//      (via selectEntity, partagé avec interactions.js).
// ════════════════════════════════════════════════════════
(function () {
  'use strict';

  var STEP_ROT  = 0.12;   // radians par appui
  var STEP_ZOOM = 0.2;

  function esc(s) {
    return String(s == null ? '' : s).replace(/[&<>"']/g, function (c) {
      return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c];
    });
  }

  // ── Annonces aux lecteurs d'écran ───────────────────────
  var live;
  function announce(msg) {
    if (!live) {
      live = document.createElement('div');
      live.className = 'sr-only';
      live.setAttribute('role', 'status');
      live.setAttribute('aria-live', 'polite');
      document.body.appendChild(live);
    }
    live.textContent = msg;
  }

  // ── Pilotage au clavier ─────────────────────────────────
  function wireKeyboard() {
    var cv = document.getElementById('globe');
    if (!cv) return;

    cv.addEventListener('keydown', function (e) {
      var handled = true;
      switch (e.key) {
        case 'ArrowLeft':  rotY -= STEP_ROT; break;
        case 'ArrowRight': rotY += STEP_ROT; break;
        case 'ArrowUp':    rotX -= STEP_ROT; break;
        case 'ArrowDown':  rotX += STEP_ROT; break;
        case '+': case '=':
          zoomScale = Math.min(zoomScale + STEP_ZOOM, 3);
          announce(t('a11y_zoom').replace('{n}', Math.round(zoomScale * 100)));
          break;
        case '-': case '_':
          zoomScale = Math.max(zoomScale - STEP_ZOOM, 0.4);
          announce(t('a11y_zoom').replace('{n}', Math.round(zoomScale * 100)));
          break;
        case 'Home': case '0':
          rotX = 0; rotY = 0; zoomScale = 1;
          announce(t('a11y_reset'));
          break;
        default: handled = false;
      }
      if (!handled) return;

      e.preventDefault();
      // L'utilisateur prend la main : on arrête la rotation automatique
      // et l'inertie, comme le fait le glisser à la souris.
      autoRot = false;
      if (typeof _inertia !== 'undefined') _inertia = false;
      animating = false;
      rotX = Math.max(-Math.PI / 2, Math.min(Math.PI / 2, rotX));
      targetX = rotX; targetY = rotY;
      if (typeof _resumeGlobe === 'function') _resumeGlobe();
    });
  }

  // ── Alternative textuelle : liste des destinations ──────
  function entities() {
    var out = [];
    (window.COUNTRIES || []).forEach(function (c) {
      out.push({ type: 'country', data: c, group: c.tier ? t('a11y_grp_producers') : t('a11y_grp_countries'),
                 label: (c.flag ? c.flag + ' ' : '') + c.name });
    });
    (window.MARKETS || []).forEach(function (m) {
      out.push({ type: 'market', data: m, group: t('a11y_grp_markets'),
                 label: (m.flag ? m.flag + ' ' : '') + m.name + ' '
                        + t('a11y_market_rank').replace('{n}', m.rank) });
    });
    var producers = {};
    (window.COUNTRIES || []).forEach(function (c) { producers[c.id] = true; });
    (window.LOUNGE_COUNTRIES || []).forEach(function (lc) {
      if (producers[lc.id]) return;               // déjà listé comme pays producteur
      out.push({ type: 'lounge', data: lc, group: t('a11y_grp_lounges'),
                 label: (lc.flag ? lc.flag + ' ' : '') + lc.name });
    });
    return out;
  }

  function buildList() {
    var host = document.getElementById('globe-a11y');
    if (!host) return;
    var items = entities();
    if (!items.length) return;                    // données pas encore chargées

    var groups = {};
    items.forEach(function (it) { (groups[it.group] = groups[it.group] || []).push(it); });

    var html = '<h2>' + esc(t('a11y_list_title')) + '</h2>' +
      '<p>' + esc(t('a11y_list_intro')) + '</p>';
    Object.keys(groups).forEach(function (g) {
      html += '<h3>' + esc(g) + '</h3><ul>';
      groups[g].forEach(function (it, i) {
        html += '<li><button type="button" data-kind="' + it.type + '" data-idx="' +
                items.indexOf(it) + '">' + esc(it.label) + '</button></li>';
      });
      html += '</ul>';
    });
    host.innerHTML = html;

    host.querySelectorAll('button').forEach(function (b) {
      b.addEventListener('click', function () {
        var it = items[parseInt(b.dataset.idx, 10)];
        if (!it || typeof selectEntity !== 'function') return;
        selectEntity(it.type, it.data);
        announce(it.label + ' — fiche ouverte');
      });
    });
  }

  // ── Initialisation ──────────────────────────────────────
  function init() {
    wireKeyboard();
    // Les données arrivent de façon asynchrone : on tente plusieurs fois
    // puis on abandonne silencieusement (le globe reste utilisable).
    var tries = 0;
    (function build() {
      buildList();
      var host = document.getElementById('globe-a11y');
      if ((!host || !host.children.length) && ++tries < 40) setTimeout(build, 250);
    })();
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
  else init();

  window._globeAnnounce = announce;
  // La liste est construite une fois les donnees arrivees ; ses titres de
  // groupe doivent suivre la langue, sans quoi ils restent figes dans
  // celle du chargement (meme defaut que la vue Explorer).
  window._globeA11yRefresh = buildList;
})();
