/* ═══════════════════════════════════════════════════════════
   account.js — Espace client CigarGlobe (Étape A)
   Gère : état de session, modale connexion/inscription/mot de passe
   oublié/réinitialisation, CSRF, bandeau de vérification email.
   Code isolé du monolithe index.html (amorce restructuration front).
   ═══════════════════════════════════════════════════════════ */
(function () {
  'use strict';

  var AUTH = (window.CG_BACKEND_BASE || '/backend') + '/auth.php';
  var user = null;   // utilisateur courant (ou null)
  var csrf = '';     // jeton CSRF de session

  // ── Appel API (cookies + CSRF) ──────────────────────────
  function api(action, method, body) {
    var opts = {
      method: method || 'GET',
      credentials: 'include',
      headers: {}
    };
    if (body) {
      opts.headers['Content-Type'] = 'application/json';
      opts.body = JSON.stringify(body);
    }
    if (method === 'POST') opts.headers['X-CSRF-Token'] = csrf;
    return fetch(AUTH + '?action=' + action, opts).then(function (r) {
      return r.json().then(function (j) {
        if (j && j.csrf) csrf = j.csrf;
        return { ok: r.ok, status: r.status, data: j };
      }).catch(function () { return { ok: r.ok, status: r.status, data: {} }; });
    });
  }

  // ── DOM helpers ─────────────────────────────────────────
  function el(html) { var d = document.createElement('div'); d.innerHTML = html.trim(); return d.firstChild; }
  function $(sel, root) { return (root || document).querySelector(sel); }

  var overlay, menu;

  // ── Bandeau / bouton d'en-tête selon l'état ─────────────
  function renderHeader() {
    var btn = $('#accountBtn');
    if (!btn) return;
    if (user) {
      var initial = (user.display_name || '?').charAt(0);
      btn.innerHTML = '<span class="ab-avatar">' + escapeHtml(initial) + '</span>'
        + '<span>' + escapeHtml(user.display_name) + '</span>'
        + (user.email_verified ? '' : '<span class="cg-badge-unverified">non vérifié</span>');
    } else {
      btn.innerHTML = '<span aria-hidden="true">👤</span><span>Se connecter</span>';
    }
  }

  function escapeHtml(s) {
    return String(s == null ? '' : s).replace(/[&<>"']/g, function (c) {
      return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c];
    });
  }

  // ── Menu déroulant (connecté) ───────────────────────────
  function buildMenu() {
    if (menu) menu.remove();
    menu = el(
      '<div class="cg-menu hidden">' +
        '<div class="cg-menu-head">' +
          '<div class="cg-menu-name">' + escapeHtml(user.display_name) + '</div>' +
          '<div class="cg-menu-email">' + escapeHtml(user.email) + '</div>' +
        '</div>' +
        (user.email_verified ? '' :
          '<button class="cg-menu-item" data-act="resend">✉ Renvoyer la vérification</button>') +
        '<button class="cg-menu-item" data-act="logout">↪ Se déconnecter</button>' +
      '</div>'
    );
    var btn = $('#accountBtn');
    btn.parentNode.style.position = btn.parentNode.style.position || 'relative';
    btn.parentNode.appendChild(menu);
    menu.addEventListener('click', function (e) {
      var act = e.target.getAttribute('data-act');
      if (act === 'logout') doLogout();
      if (act === 'resend') doResend();
    });
  }

  function toggleMenu() {
    if (!menu) buildMenu();
    menu.classList.toggle('hidden');
  }

  // ── Modale ──────────────────────────────────────────────
  function buildModal() {
    overlay = el(
      '<div class="cg-overlay hidden" role="dialog" aria-modal="true" aria-label="Compte">' +
        '<div class="cg-modal">' +
          '<button class="cg-modal-close" aria-label="Fermer">✕</button>' +
          '<div class="cg-modal-logo"><div class="m">CIGAR GLOBE</div><div class="s">ESPACE MEMBRE</div></div>' +
          '<div class="cg-msg hidden" id="cgMsg"></div>' +
          '<div class="cg-tabs" id="cgTabs">' +
            '<button class="cg-tab active" data-tab="login">Connexion</button>' +
            '<button class="cg-tab" data-tab="register">Inscription</button>' +
          '</div>' +
          // Connexion
          '<form class="cg-form active" data-form="login">' +
            '<div class="cg-field"><label>Email</label><input type="email" name="email" autocomplete="email" required></div>' +
            '<div class="cg-field"><label>Mot de passe</label><input type="password" name="password" autocomplete="current-password" required></div>' +
            '<button type="submit" class="cg-submit">Se connecter</button>' +
            '<div class="cg-alt"><button type="button" class="cg-link" data-go="forgot">Mot de passe oublié ?</button></div>' +
          '</form>' +
          // Inscription
          '<form class="cg-form" data-form="register">' +
            '<div class="cg-field"><label>Nom d\'affichage</label><input type="text" name="display_name" autocomplete="nickname" maxlength="80" required></div>' +
            '<div class="cg-field"><label>Email</label><input type="email" name="email" autocomplete="email" required></div>' +
            '<div class="cg-field"><label>Mot de passe (8+ caractères)</label><input type="password" name="password" autocomplete="new-password" minlength="8" required></div>' +
            '<button type="submit" class="cg-submit">Créer mon compte</button>' +
          '</form>' +
          // Mot de passe oublié
          '<form class="cg-form" data-form="forgot">' +
            '<div class="cg-field"><label>Email</label><input type="email" name="email" autocomplete="email" required></div>' +
            '<button type="submit" class="cg-submit">Envoyer le lien</button>' +
            '<div class="cg-alt"><button type="button" class="cg-link" data-go="login">Retour à la connexion</button></div>' +
          '</form>' +
          // Réinitialisation (depuis lien email)
          '<form class="cg-form" data-form="reset">' +
            '<div class="cg-field"><label>Nouveau mot de passe (8+ caractères)</label><input type="password" name="password" autocomplete="new-password" minlength="8" required></div>' +
            '<button type="submit" class="cg-submit">Réinitialiser</button>' +
          '</form>' +
        '</div>' +
      '</div>'
    );
    document.body.appendChild(overlay);

    $('.cg-modal-close', overlay).addEventListener('click', closeModal);
    overlay.addEventListener('click', function (e) { if (e.target === overlay) closeModal(); });

    // Onglets
    $('#cgTabs', overlay).addEventListener('click', function (e) {
      var tab = e.target.getAttribute('data-tab');
      if (tab) showForm(tab);
    });
    // Liens internes
    overlay.addEventListener('click', function (e) {
      var go = e.target.getAttribute('data-go');
      if (go) { e.preventDefault(); showForm(go); }
    });
    // Soumissions
    overlay.querySelectorAll('.cg-form').forEach(function (f) {
      f.addEventListener('submit', onSubmit);
    });
    document.addEventListener('keydown', function (e) {
      if (e.key === 'Escape' && overlay && !overlay.classList.contains('hidden')) closeModal();
    });
  }

  function showForm(name) {
    overlay.querySelectorAll('.cg-form').forEach(function (f) {
      f.classList.toggle('active', f.getAttribute('data-form') === name);
    });
    overlay.querySelectorAll('.cg-tab').forEach(function (t) {
      t.classList.toggle('active', t.getAttribute('data-tab') === name);
    });
    // Onglets visibles seulement pour login/register
    $('#cgTabs', overlay).style.display = (name === 'login' || name === 'register') ? '' : 'none';
    clearMsg();
  }

  function openModal(form) {
    if (!overlay) buildModal();
    showForm(form || 'login');
    overlay.classList.remove('hidden');
    requestAnimationFrame(function () { overlay.classList.add('show'); });
    var first = overlay.querySelector('.cg-form.active input');
    if (first) first.focus();
  }
  function closeModal() {
    if (!overlay) return;
    overlay.classList.remove('show');
    setTimeout(function () { overlay.classList.add('hidden'); }, 200);
  }

  function setMsg(text, type) {
    var m = $('#cgMsg', overlay);
    m.textContent = text; m.className = 'cg-msg ' + (type || 'err');
  }
  function clearMsg() { var m = $('#cgMsg', overlay); if (m) m.className = 'cg-msg hidden'; }

  // ── Soumission des formulaires ──────────────────────────
  function onSubmit(e) {
    e.preventDefault();
    var form = e.currentTarget;
    var kind = form.getAttribute('data-form');
    var data = {};
    form.querySelectorAll('input').forEach(function (i) { data[i.name] = i.value; });
    var submit = form.querySelector('.cg-submit');
    submit.disabled = true;

    var req;
    if (kind === 'login')        req = api('login', 'POST', data);
    else if (kind === 'register')req = api('register', 'POST', data);
    else if (kind === 'forgot')  req = api('forgot', 'POST', data);
    else if (kind === 'reset')   req = api('reset', 'POST', { token: resetToken, password: data.password });

    req.then(function (res) {
      submit.disabled = false;
      if (!res.ok) { setMsg((res.data && res.data.error) || 'Erreur.', 'err'); return; }

      if (kind === 'login' || kind === 'register') {
        user = res.data.user;
        renderHeader();
        closeModal();
        if (menu) { menu.remove(); menu = null; }
        if (kind === 'register') {
          toast('Compte créé ! Vérifiez votre email pour confirmer votre adresse.', 'ok');
        } else {
          toast('Bienvenue, ' + user.display_name + ' !', 'ok');
        }
        maybeVerifyBanner();
      } else if (kind === 'forgot') {
        setMsg(res.data.message || 'Si un compte existe, un email a été envoyé.', 'ok');
      } else if (kind === 'reset') {
        setMsg('Mot de passe mis à jour. Vous pouvez vous connecter.', 'ok');
        setTimeout(function () { showForm('login'); }, 1500);
      }
    });
  }

  function doLogout() {
    api('logout', 'POST').then(function () {
      user = null;
      if (menu) { menu.remove(); menu = null; }
      renderHeader();
      removeVerifyBanner();
      toast('Vous êtes déconnecté.', 'ok');
    });
  }

  function doResend() {
    api('resend', 'POST').then(function (res) {
      if (menu) menu.classList.add('hidden');
      toast(res.ok ? 'Email de vérification renvoyé.' : ((res.data && res.data.error) || 'Erreur.'), res.ok ? 'ok' : 'err');
    });
  }

  // ── Toast ───────────────────────────────────────────────
  var toastEl;
  function toast(text, type) {
    if (!toastEl) { toastEl = el('<div class="cg-toast"></div>'); document.body.appendChild(toastEl); }
    toastEl.textContent = text;
    toastEl.className = 'cg-toast ' + (type || '') + ' show';
    clearTimeout(toast._t);
    toast._t = setTimeout(function () { toastEl.className = 'cg-toast ' + (type || ''); }, 4000);
  }

  // ── Bandeau email non vérifié ───────────────────────────
  function maybeVerifyBanner() {
    removeVerifyBanner();
    if (!user || user.email_verified) return;
    var banner = el(
      '<div class="cg-verify-banner" id="cgVerifyBanner">' +
        '<span>✉ Confirmez votre email pour contribuer et noter.</span>' +
        '<button class="cg-link" id="cgResendLink">Renvoyer l\'email</button>' +
      '</div>'
    );
    var hdr = document.querySelector('header.hdr');
    if (hdr && hdr.parentNode) hdr.parentNode.insertBefore(banner, hdr.nextSibling);
    $('#cgResendLink', banner).addEventListener('click', doResend);
  }
  function removeVerifyBanner() { var b = $('#cgVerifyBanner'); if (b) b.remove(); }

  // ── Retour de lien email (?verify=… / ?reset=…) ─────────
  var resetToken = '';
  function handleUrlFlags() {
    var p = new URLSearchParams(location.search);
    var v = p.get('verify');
    if (v === 'ok')      toast('Email confirmé, merci !', 'ok');
    else if (v === 'invalid') toast('Lien de vérification invalide ou expiré.', 'err');
    else if (v === 'missing') toast('Lien de vérification incomplet.', 'err');

    resetToken = p.get('reset') || '';
    if (resetToken) { openModal('reset'); }

    // Nettoyer l'URL
    if (v || resetToken) {
      p.delete('verify'); p.delete('reset');
      var q = p.toString();
      history.replaceState(null, '', location.pathname + (q ? '?' + q : ''));
    }
  }

  // ── Wiring du bouton d'en-tête ──────────────────────────
  function wireHeaderButton() {
    var btn = $('#accountBtn');
    if (!btn) return;
    btn.addEventListener('click', function (e) {
      e.stopPropagation();
      if (user) toggleMenu(); else openModal('login');
    });
    document.addEventListener('click', function () { if (menu) menu.classList.add('hidden'); });
  }

  // ── Init ────────────────────────────────────────────────
  function init() {
    wireHeaderButton();
    api('me', 'GET').then(function (res) {
      user = (res.data && res.data.user) || null;
      renderHeader();
      maybeVerifyBanner();
      handleUrlFlags();
    });
    // Exposer pour les modules suivants (Étape B)
    window.CGAccount = {
      get user() { return user; },
      get csrf() { return csrf; },
      open: openModal,
      require: function () { if (!user) { openModal('login'); return false; } return true; },
      api: api
    };
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
  else init();
})();
