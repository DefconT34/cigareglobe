/* ═══════════════════════════════════════════════════════════
   reviews.js — Avis texte des lounges (Étape B2)
   Affiche les avis publics et permet aux membres vérifiés d'en
   rédiger un (note + titre + texte). S'appuie sur api.php (review /
   reviews) et window.CGAccount pour l'authentification/CSRF.
   ═══════════════════════════════════════════════════════════ */
(function () {
  'use strict';

  function apiBase() { return window.API_BASE || (window.CG_BACKEND_BASE || '/backend') + '/api.php'; }

  function esc(s) {
    return String(s == null ? '' : s).replace(/[&<>"']/g, function (c) {
      return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c];
    });
  }
  function starStr(n) {
    n = parseInt(n, 10) || 0;
    var out = '';
    for (var i = 1; i <= 5; i++) out += i <= n ? '★' : '☆';
    return out;
  }

  // ── Chargement + rendu des avis d'un lounge ─────────────
  window._loadLoungeReviews = function (loungeId) {
    var box = document.getElementById('lc-reviews-' + loungeId);
    if (!box) return;
    fetch(apiBase() + '?action=reviews&id=' + encodeURIComponent(loungeId), { credentials: 'include' })
      .then(function (r) { return r.json(); })
      .then(function (d) { render(box, loungeId, (d && d.reviews) || [], !!(d && d.can_flag)); })
      .catch(function () { render(box, loungeId, [], false); });
  };

  function render(box, loungeId, list, canFlag) {
    var A = window.CGAccount;
    var canWrite = A && A.user && A.user.email_verified;

    var head = list.length
      ? '<div class="lc-rev-head">' + t('rev_count').replace('{n}', list.length) + '</div>'
      : '<div class="lc-rev-head lc-rev-none">' + t('rev_none') + '</div>';

    var items = list.map(function (rv) {
      return '<div class="lc-rev">' +
        '<div class="lc-rev-top">' +
          '<span class="lc-rev-author">' + esc(rv.display_name) + '</span>' +
          '<span class="lc-rev-stars">' + starStr(rv.rating) + '</span>' +
        '</div>' +
        (rv.title ? '<div class="lc-rev-title">' + esc(rv.title) + '</div>' : '') +
        '<div class="lc-rev-body">' + esc(rv.body) + '</div>' +
        // Signalement : réservé aux membres connectés, jamais sur son propre avis
        (canFlag && !rv.mine
          ? '<button type="button" class="lc-rev-flag" data-rid="' + rv.id + '">⚑ Signaler</button>'
          : '') +
      '</div>';
    }).join('');

    var ctaLabel = canWrite ? t('rev_write') : t('rev_login_write');
    var cta = '<button class="lc-rev-cta" type="button">' + ctaLabel + '</button>';

    box.innerHTML = head + items + cta;
    box.querySelector('.lc-rev-cta').addEventListener('click', function () { openForm(box, loungeId); });
    box.querySelectorAll('.lc-rev-flag').forEach(function (b) {
      b.addEventListener('click', function () { flagReview(b, loungeId); });
    });
  }

  // ── Signalement d'un avis ───────────────────────────────
  function flagReview(btn, loungeId) {
    var A = window.CGAccount;
    if (!A || !A.requireVerified()) return;
    if (!window.confirm(t('rev_flag_confirm'))) return;
    btn.disabled = true;
    fetch(apiBase() + '?action=review_flag', {
      method: 'POST', credentials: 'include',
      headers: { 'Content-Type': 'application/json', 'X-CSRF-Token': (A ? A.csrf : '') },
      body: JSON.stringify({ id: parseInt(btn.dataset.rid, 10) })
    })
      .then(function (r) { return r.json(); })
      .then(function (d) {
        if (d.error) { btn.disabled = false; if (A) A.toast(tErr(d), 'err'); return; }
        btn.textContent = t('rev_flagged');                 // l'avis reste visible
        if (A) A.toast(t('rev_flag_thanks'), 'ok');
      })
      .catch(function () { btn.disabled = false; if (A) A.toast(t('acc_net_error'), 'err'); });
  }

  // ── Formulaire de rédaction ─────────────────────────────
  function openForm(box, loungeId) {
    var A = window.CGAccount;
    if (!A || !A.requireVerified()) return;           // déconnecté→login, non vérifié→toast
    if (box.querySelector('.lc-rev-form')) return;    // déjà ouvert

    var form = document.createElement('div');
    form.className = 'lc-rev-form';
    form.innerHTML =
      '<div class="lc-rev-fstars">' +
        [1, 2, 3, 4, 5].map(function (s) { return '<span class="lc-rev-fstar" data-v="' + s + '">☆</span>'; }).join('') +
      '</div>' +
      '<input type="text" class="lc-rev-ftitle" maxlength="120" placeholder="' + t('rev_title_ph') + '">' +
      '<textarea class="lc-rev-fbody" maxlength="2000" rows="3" placeholder="' + t('rev_body_ph') + '"></textarea>' +
      '<div class="lc-rev-form-actions">' +
        '<button type="button" class="lc-rev-cancel">' + t('ui_cancel') + '</button>' +
        '<button type="button" class="lc-rev-send">Publier</button>' +
      '</div>' +
      '<div class="lc-rev-msg"></div>';
    box.appendChild(form);

    var selected = 0;
    var fstars = form.querySelectorAll('.lc-rev-fstar');
    fstars.forEach(function (st) {
      st.addEventListener('click', function () {
        selected = parseInt(st.dataset.v, 10);
        fstars.forEach(function (s2, i) {
          s2.textContent = i < selected ? '★' : '☆';
          s2.classList.toggle('on', i < selected);
        });
      });
    });

    form.querySelector('.lc-rev-cancel').addEventListener('click', function () { form.remove(); });

    form.querySelector('.lc-rev-send').addEventListener('click', function () {
      var msg = form.querySelector('.lc-rev-msg');
      if (selected < 1) { msg.textContent = t('rev_choose_rating'); return; }
      var title = form.querySelector('.lc-rev-ftitle').value.trim();
      var body  = form.querySelector('.lc-rev-fbody').value.trim();
      var send  = form.querySelector('.lc-rev-send');
      send.disabled = true; msg.textContent = '';

      fetch(apiBase() + '?action=review', {
        method: 'POST',
        credentials: 'include',
        headers: { 'Content-Type': 'application/json', 'X-CSRF-Token': (A ? A.csrf : '') },
        body: JSON.stringify({ id: loungeId, rating: selected, title: title, body: body })
      })
      .then(function (r) { return r.json(); })
      .then(function (d) {
        send.disabled = false;
        if (d.error) {
          if (d.need_verify && A) A.toast('Vérifiez votre email pour laisser un avis.', 'err');
          else msg.textContent = tErr(d);
          return;
        }
        if (A) A.toast('Merci pour votre avis !', 'ok');
        if (window._resetMyRatings) window._resetMyRatings();
        window._loadLoungeReviews(loungeId);   // recharge la liste (form retiré)
      })
      .catch(function () { send.disabled = false; msg.textContent = t('acc_net_error'); });
    });
  }
})();
