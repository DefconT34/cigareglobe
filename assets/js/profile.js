/* ═══════════════════════════════════════════════════════════
   profile.js — Profil membre & passeport (Étape D)
   Panneau profil : avatar, bio, statistiques, badges, passeport des
   pays visités, et édition (pseudo / bio / avatar emoji).
   S'appuie sur api.php (profile / profile_update) + window.CGAccount.
   ═══════════════════════════════════════════════════════════ */
(function () {
  'use strict';

  function apiBase() { return window.API_BASE || (window.CG_BACKEND_BASE || '/backend') + '/api.php'; }
  function esc(s) {
    return String(s == null ? '' : s).replace(/[&<>"']/g, function (c) {
      return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c];
    });
  }
  // Code pays ISO-2 → emoji drapeau (sinon renvoie le code brut)
  function flag(cc) {
    if (!/^[A-Za-z]{2}$/.test(cc)) return esc(cc);
    var A = 0x1F1E6;
    return String.fromCodePoint(A + cc.toUpperCase().charCodeAt(0) - 65) +
           String.fromCodePoint(A + cc.toUpperCase().charCodeAt(1) - 65);
  }

  var overlay;

  window.openMyProfile = function () {
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
      '<div class="cg-overlay hidden" role="dialog" aria-modal="true" aria-label="Mon profil">' +
        '<div class="cg-modal cg-modal-wide">' +
          '<button class="cg-modal-close" aria-label="Fermer">✕</button>' +
          '<div id="cgProfileBody"></div>' +
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
    var box = document.getElementById('cgProfileBody');
    box.innerHTML = '<div class="cg-contrib-empty">Chargement…</div>';
    fetch(apiBase() + '?action=profile', { credentials: 'include' })
      .then(function (r) { return r.json(); })
      .then(function (d) {
        if (!d || d.error) { box.innerHTML = '<div class="cg-contrib-empty">' + esc(tErr(d)) + '</div>'; return; }
        renderView(box, d);
      })
      .catch(function () { box.innerHTML = '<div class="cg-contrib-empty">' + t('acc_net_error') + '</div>'; });
  }

  function renderView(box, d) {
    var p = d.profile, s = d.stats, badges = d.badges || [], pass = d.passport || [];
    var avatar = p.avatar_url || (p.display_name || '?').charAt(0);
    var since = String(p.created_at || '').slice(0, 7);

    box.innerHTML =
      '<div class="cg-prof-head">' +
        '<div class="cg-prof-avatar">' + esc(avatar) + '</div>' +
        '<div class="cg-prof-id">' +
          '<div class="cg-prof-name">' + esc(p.display_name) + '</div>' +
          '<div class="cg-prof-since">Membre depuis ' + esc(since) + '</div>' +
        '</div>' +
        '<button class="cg-prof-edit" type="button">✎ Éditer</button>' +
      '</div>' +
      (p.bio ? '<div class="cg-prof-bio">' + esc(p.bio) + '</div>' : '') +
      '<div class="cg-prof-stats">' +
        tile(s.contributions_approved, t('prof_contributions')) +
        tile(s.reviews_count, t('prof_reviews')) +
        tile(s.countries_visited, t('prof_countries')) +
      '</div>' +
      (badges.length ?
        '<div class="cg-prof-section">' + t('prof_badges') + '</div><div class="cg-prof-badges">' +
        badges.map(function (b) { return '<span class="cg-badge">' + b.icon + ' ' + esc(b.label) + '</span>'; }).join('') +
        '</div>' : '') +
      '<div class="cg-prof-section">' + t('prof_passport') + ' ' + (pass.length ? '(' + pass.length + ')' : '') + '</div>' +
      (pass.length ?
        '<div class="cg-prof-passport">' + pass.map(function (c) { return '<span class="cg-pass-flag" title="' + esc(c) + '">' + flag(c) + '</span>'; }).join('') + '</div>' :
        '<div class="cg-prof-empty">' + t('prof_passport_empty') + '</div>');

    box.querySelector('.cg-prof-edit').addEventListener('click', function () { renderEdit(box, p); });
  }

  function tile(n, label) {
    return '<div class="cg-prof-tile"><div class="cg-prof-num">' + (parseInt(n, 10) || 0) + '</div><div class="cg-prof-lbl">' + label + '</div></div>';
  }

  function renderEdit(box, p) {
    box.innerHTML =
      '<div class="cg-modal-logo"><div class="m">MON PROFIL</div></div>' +
      '<div class="cg-msg hidden" id="cgProfMsg"></div>' +
      '<div class="cg-field"><label>' + t('prof_avatar') + '</label><input type="text" id="pf-avatar" maxlength="8" value="' + esc(p.avatar_url || '') + '" placeholder="🎩"></div>' +
      '<div class="cg-field"><label>' + t('acc_display_name') + '</label><input type="text" id="pf-name" maxlength="80" value="' + esc(p.display_name || '') + '"></div>' +
      '<div class="cg-field"><label>' + t('prof_bio') + '</label><textarea id="pf-bio" maxlength="500" rows="3" placeholder="' + t('prof_bio_ph') + '">' + esc(p.bio || '') + '</textarea></div>' +
      // Langue de correspondance (migration 014). Les noms viennent de
      // I18N[code].lang_name — chaque langue s'ecrit dans sa propre
      // langue, comme la barre de drapeaux de l'en-tete. Aucune
      // traduction supplementaire n'est donc necessaire.
      '<div class="cg-field"><label>' + t('language') + '</label>' +
        '<select id="pf-lang" class="cg-select">' +
          Object.keys(window.I18N || {}).map(function (code) {
            var sel = (p.lang || window.currentLang || 'fr') === code ? ' selected' : '';
            return '<option value="' + code + '"' + sel + '>' + esc(I18N[code].lang_name) + '</option>';
          }).join('') +
        '</select>' +
        '<div class="cg-hint">' + t('prof_lang_hint') + '</div>' +
      '</div>' +
      // Notifications de reponse (migration 020). Une case, pas un
      // ecran de reglages : il n'y a qu'une notification, et elle ne
      // part qu'aux sujets qu'on a choisi de suivre.
      '<div class="cg-field">' +
        '<label class="cg-check">' +
          '<input type="checkbox" id="pf-notif"' + (p.notify_forum === false ? '' : ' checked') + '> ' +
          esc(t('prof_notif_forum')) +
        '</label>' +
        '<div class="cg-hint">' + esc(t('prof_notif_forum_hint')) + '</div>' +
      '</div>' +
      '<div class="cg-prof-edit-actions">' +
        '<button type="button" class="cg-prof-cancel">' + t('ui_cancel') + '</button>' +
        '<button type="button" class="cg-prof-save">Enregistrer</button>' +
      '</div>';

    box.querySelector('.cg-prof-cancel').addEventListener('click', function () { load(); });
    box.querySelector('.cg-prof-save').addEventListener('click', function () {
      var A = window.CGAccount;
      var name = document.getElementById('pf-name').value.trim();
      var bio  = document.getElementById('pf-bio').value.trim();
      var av   = document.getElementById('pf-avatar').value.trim();
      var lg   = document.getElementById('pf-lang').value;
      var msg  = document.getElementById('cgProfMsg');
      if (!name) { msg.className = 'cg-msg err'; msg.textContent = t('prof_name_required'); return; }
      var btn = box.querySelector('.cg-prof-save'); btn.disabled = true;
      fetch(apiBase() + '?action=profile_update', {
        method: 'POST', credentials: 'include',
        headers: { 'Content-Type': 'application/json', 'X-CSRF-Token': (A ? A.csrf : '') },
        body: JSON.stringify({
          display_name: name, bio: bio, avatar: av, lang: lg,
          notify_forum: document.getElementById('pf-notif').checked
        })
      })
        .then(function (r) { return r.json(); })
        .then(function (d) {
          btn.disabled = false;
          if (d.error) { msg.className = 'cg-msg err'; msg.textContent = tErr(d); return; }
          if (A && A.updateUser) A.updateUser(d.user);   // maj en-tête
          if (A) A.toast('Profil mis à jour.', 'ok');
          load();                                        // retour vue
        })
        .catch(function () { btn.disabled = false; msg.className = 'cg-msg err'; msg.textContent = t('acc_net_error'); });
    });
  }
})();
