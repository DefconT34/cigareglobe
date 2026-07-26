/* ═══════════════════════════════════════════════════════════
   favorites.js — Favoris & listes (Étape C)
   Chips « À visiter / Visité / Favori » sur les cartes de lounge +
   panneau « Mes listes ». S'appuie sur api.php (fav_toggle / fav_states
   / fav_list) et window.CGAccount (auth + CSRF).
   ═══════════════════════════════════════════════════════════ */
(function () {
  'use strict';

  function apiBase() { return window.API_BASE || (window.CG_BACKEND_BASE || '/backend') + '/api.php'; }
  function esc(s) {
    return String(s == null ? '' : s).replace(/[&<>"']/g, function (c) {
      return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c];
    });
  }

  var LISTS = [
    { key: 'to_visit', icon: '📌', label: 'À visiter' },
    { key: 'visited',  icon: '✅', label: 'Visité' },
    { key: 'favorite', icon: '♥',  label: 'Favori' }
  ];
  var LABELS = { to_visit: 'À visiter', visited: 'Visités', favorite: 'Favoris' };

  var _states = null;   // { lounge:{id:[lists]}, country:{id:[lists]} }

  function loadStates(cb) {
    if (_states) { if (cb) cb(_states); return; }
    fetch(apiBase() + '?action=fav_states', { credentials: 'include' })
      .then(function (r) { return r.ok ? r.json() : {}; })
      .then(function (d) { _states = (d && d.favorites) || { lounge: {}, country: {} }; })
      .catch(function () { _states = { lounge: {}, country: {} }; })
      .finally(function () { if (cb) cb(_states); });
  }
  window._resetFavStates = function () { _states = null; };

  function currentLists(type, id) {
    if (!_states) return [];
    var m = _states[type] || {};
    return m[String(id)] || [];
  }

  // ── Contrôle par carte de lounge ────────────────────────
  window._loadLoungeFavs = function (loungeId) {
    var box = document.getElementById('lc-fav-' + loungeId);
    if (!box) return;
    loadStates(function () { renderControl(box, 'lounge', loungeId); });
  };

  function renderControl(box, type, id) {
    var active = currentLists(type, id);
    box.innerHTML = '<div class="lc-fav-row">' + LISTS.map(function (L) {
      var on = active.indexOf(L.key) >= 0;
      return '<button type="button" class="lc-fav-chip' + (on ? ' on' : '') + '" ' +
        'data-type="' + type + '" data-id="' + esc(id) + '" data-list="' + L.key + '">' +
        L.icon + ' ' + L.label + '</button>';
    }).join('') + '</div>';
    box.querySelectorAll('.lc-fav-chip').forEach(function (btn) {
      btn.addEventListener('click', function () { toggle(btn); });
    });
  }

  function toggle(btn) {
    var A = window.CGAccount;
    if (!A || !A.requireVerified()) return;
    var type = btn.dataset.type, id = btn.dataset.id, list = btn.dataset.list;
    var turningOn = !btn.classList.contains('on');
    btn.disabled = true;
    fetch(apiBase() + '?action=fav_toggle', {
      method: 'POST', credentials: 'include',
      headers: { 'Content-Type': 'application/json', 'X-CSRF-Token': (A ? A.csrf : '') },
      body: JSON.stringify({ target_type: type, target_id: id, list: list, on: turningOn })
    })
      .then(function (r) { return r.json(); })
      .then(function (d) {
        btn.disabled = false;
        if (d.error) { if (d.need_verify && A) A.toast('Vérifiez votre email pour utiliser vos listes.', 'err'); return; }
        if (_states) { _states[type] = _states[type] || {}; _states[type][id] = d.lists; }
        btn.classList.toggle('on', d.lists.indexOf(list) >= 0);
        if (A) A.toast(turningOn ? 'Ajouté à « ' + LABELS[list] + ' ».' : 'Retiré de « ' + LABELS[list] + ' ».', 'ok');
      })
      .catch(function () { btn.disabled = false; });
  }

  // ── Panneau « Mes listes » ──────────────────────────────
  var overlay;
  window.openMyFavorites = function () {
    var A = window.CGAccount;
    if (!A || !A.user) { if (A) A.open('login'); return; }
    if (!overlay) build();
    overlay.classList.remove('hidden');
    requestAnimationFrame(function () { overlay.classList.add('show'); });
    load();
  };

  function build() {
    var d = document.createElement('div');
    d.innerHTML =
      '<div class="cg-overlay hidden" role="dialog" aria-modal="true" aria-label="Mes listes">' +
        '<div class="cg-modal cg-modal-wide">' +
          '<button class="cg-modal-close" aria-label="Fermer">✕</button>' +
          '<div class="cg-modal-logo"><div class="m">MES LISTES</div></div>' +
          '<div id="cgFavList" class="cg-contrib-list"></div>' +
        '</div>' +
      '</div>';
    overlay = d.firstChild;
    document.body.appendChild(overlay);
    overlay.querySelector('.cg-modal-close').addEventListener('click', close);
    overlay.addEventListener('click', function (e) { if (e.target === overlay) close(); });
    document.addEventListener('keydown', function (e) {
      if (e.key === 'Escape' && overlay && !overlay.classList.contains('hidden')) close();
    });
  }
  function close() { overlay.classList.remove('show'); setTimeout(function () { overlay.classList.add('hidden'); }, 200); }

  function load() {
    var box = document.getElementById('cgFavList');
    box.innerHTML = '<div class="cg-contrib-empty">Chargement…</div>';
    fetch(apiBase() + '?action=fav_list', { credentials: 'include' })
      .then(function (r) { return r.json(); })
      .then(function (d) {
        var items = (d && d.items) || [];
        if (d && d.error) { box.innerHTML = '<div class="cg-contrib-empty">' + esc(d.error) + '</div>'; return; }
        if (!items.length) { box.innerHTML = '<div class="cg-contrib-empty">Aucun favori pour l\'instant. Enregistrez des établissements depuis leur fiche.</div>'; return; }
        var groups = { to_visit: [], visited: [], favorite: [] };
        items.forEach(function (it) { (groups[it.list] || (groups[it.list] = [])).push(it); });
        box.innerHTML = LISTS.map(function (L) {
          var g = groups[L.key] || [];
          if (!g.length) return '';
          return '<div class="cg-fav-group"><div class="cg-fav-group-title">' + L.icon + ' ' + LABELS[L.key] + ' (' + g.length + ')</div>' +
            g.map(function (it) {
              if (it.target_type === 'lounge' && it.lounge_name) {
                return '<div class="cg-contrib-item"><div class="cg-contrib-main">' +
                  '<div class="cg-contrib-name">🥃 ' + esc(it.lounge_name) + '</div>' +
                  '<div class="cg-contrib-sub">📍 ' + esc(it.lounge_city || '') + ' · ' + esc(it.lounge_country || '') + '</div>' +
                  '</div></div>';
              }
              var lbl = it.target_type === 'country' ? '🌍 Pays : ' + esc(it.target_id)
                                                      : '🥃 Établissement #' + esc(it.target_id);
              return '<div class="cg-contrib-item"><div class="cg-contrib-main"><div class="cg-contrib-name">' + lbl + '</div></div></div>';
            }).join('') +
          '</div>';
        }).join('');
      })
      .catch(function () { box.innerHTML = '<div class="cg-contrib-empty">Erreur réseau.</div>'; });
  }
})();
