/* ════════════════════════════════════════════════════════
 * suggestion.js — La boîte à suggestions
 * ────────────────────────────────────────────────────────
 * Le site est en ligne mais en phase d'essai. Ce qu'on veut recueillir
 * vient de gens qui n'ont pas de compte : le formulaire n'en demande
 * donc aucun, et l'adresse électronique reste facultative.
 *
 * La page courante part avec le message. « Ça ne marche pas » sans
 * savoir où est inexploitable, et personne ne pense à le préciser.
 * ════════════════════════════════════════════════════════ */
(function () {
  'use strict';

  // i18n.js expose `window.t` — la meme fonction que profile.js et
  // account.js. Le repli sur la cle evite un ecran muet si le
  // dictionnaire n'est pas encore charge.
  function t(k) { return (typeof window.t === 'function' ? window.t(k) : k); }
  function base() { return (window.CG_BACKEND_BASE || '/backend'); }

  /** Le nom d'un membre est choisi par lui : il s'echappe. */
  function escapeHtml(s) {
    return String(s == null ? '' : s)
      .replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;')
      .replace(/"/g, '&quot;').replace(/'/g, '&#39;');
  }

  var overlay = null;

  function fermer() {
    if (!overlay) return;
    overlay.classList.remove('show');
    setTimeout(function () { if (overlay) { overlay.remove(); overlay = null; } }, 200);
  }

  /** Le membre connecté, ou null. */
  function membre() {
    var A = window.CGAccount;
    return (A && A.user) ? A.user : null;
  }

  function ouvrir() {
    if (overlay) return;
    var moi = membre();
    // NI CONNECTÉ NI VÉRIFIÉ : on n'ouvre pas un formulaire pour le
    // refuser ensuite. On dit pourquoi, et on offre le geste — c'est la
    // même règle que partout ailleurs sur ce site : un écran qui bloque
    // sans donner la sortie renvoie la personne à rien.
    var ouvert = !!(moi && moi.email_verified);

    overlay = document.createElement('div');
    overlay.className = 'sugg-overlay';
    overlay.setAttribute('role', 'dialog');
    overlay.setAttribute('aria-modal', 'true');
    overlay.innerHTML =
      '<div class="sugg-box">' +
        '<div class="sugg-hdr">' +
          '<span class="sugg-title">' + t('sugg_title') + '</span>' +
          '<button class="sugg-close" aria-label="Fermer">✕</button>' +
        '</div>' +
        (ouvert
          ? '<p class="sugg-intro">' + t('sugg_intro') + '</p>' +
            '<div class="cg-msg hidden" id="suggMsg"></div>' +
            '<textarea id="suggTexte" rows="5" maxlength="4000" placeholder="' + t('sugg_ph') + '"></textarea>' +
            // L'adresse n'est plus demandée : le serveur la tient du
            // compte. Un champ libre aurait permis d'en déclarer une
            // autre que la sienne, sans qu'aucune ne soit vérifiée.
            '<div class="cg-hint">' + t('sugg_en_tant_que').replace('{nom}',
                escapeHtml(moi.display_name || moi.email || '')) + '</div>' +
            // Champ leurre : caché aux humains, rempli par les robots.
            // Il ne coûte rien et reste, même si un compte vérifié
            // arrête déjà tout ce qu'il arrêtait.
            '<input type="text" id="suggSite" tabindex="-1" autocomplete="off" aria-hidden="true" ' +
                   'style="position:absolute;left:-9999px;width:1px;height:1px">' +
            '<div class="sugg-actions">' +
              '<button type="button" class="sugg-cancel">' + t('ui_cancel') + '</button>' +
              '<button type="button" class="sugg-send">' + t('sugg_send') + '</button>' +
            '</div>'
          : '<p class="sugg-intro">' +
              t(moi ? 'sugg_verif_requise' : 'sugg_compte_requis') + '</p>' +
            '<div class="sugg-actions">' +
              '<button type="button" class="sugg-cancel">' + t('ui_cancel') + '</button>' +
              '<button type="button" class="sugg-connexion">' +
                t(moi ? 'sugg_verif_action' : 'sugg_connexion') + '</button>' +
            '</div>') +
      '</div>';
    document.body.appendChild(overlay);
    requestAnimationFrame(function () { overlay.classList.add('show'); });

    overlay.querySelector('.sugg-close').addEventListener('click', fermer);
    overlay.querySelector('.sugg-cancel').addEventListener('click', fermer);
    overlay.addEventListener('click', function (e) { if (e.target === overlay) fermer(); });
    document.addEventListener('keydown', function esc(e) {
      if (e.key === 'Escape') { fermer(); document.removeEventListener('keydown', esc); }
    });

    if (ouvert) {
      overlay.querySelector('#suggTexte').focus();
      overlay.querySelector('.sugg-send').addEventListener('click', envoyer);
    } else {
      overlay.querySelector('.sugg-connexion').addEventListener('click', function () {
        fermer();
        // `requireVerified` ouvre la fenêtre de connexion si personne
        // n'est connecté, et rappelle la vérification sinon. On réemploie
        // le chemin existant plutôt que d'en écrire un second.
        var A = window.CGAccount;
        if (A && A.requireVerified) A.requireVerified();
      });
    }
  }

  function envoyer() {
    var msg   = overlay.querySelector('#suggMsg');
    var bouton = overlay.querySelector('.sugg-send');
    var texte = overlay.querySelector('#suggTexte').value.trim();

    function dire(texte, classe) {
      msg.className = 'cg-msg ' + classe;
      msg.textContent = texte;
    }

    if (texte.length < 10) { dire(t('sugg_trop_court'), 'err'); return; }

    bouton.disabled = true;
    var A = window.CGAccount;
    fetch(base() + '/suggestion.php', {
      method: 'POST', credentials: 'include',
      headers: { 'Content-Type': 'application/json', 'X-CSRF-Token': (A ? A.csrf : '') },
      body: JSON.stringify({
        texte: texte,
        site:  overlay.querySelector('#suggSite').value,
        // Le contexte, que personne ne pense a donner.
        page:  location.pathname + location.search,
        lang:  window.currentLang || 'fr'
      })
    })
      .then(function (r) { return r.json().then(function (d) { return { ok: r.ok, d: d }; }); })
      .then(function (res) {
        bouton.disabled = false;
        if (!res.ok) {
          dire(window.tErr ? window.tErr(res.d) : (res.d.error || t('acc_net_error')), 'err');
          return;
        }
        dire(t('sugg_merci'), 'ok');
        overlay.querySelector('#suggTexte').value = '';
        setTimeout(fermer, 1800);
      })
      .catch(function () { bouton.disabled = false; dire(t('acc_net_error'), 'err'); });
  }

  document.addEventListener('DOMContentLoaded', function () {
    var b = document.getElementById('sugg-btn');
    if (b) b.addEventListener('click', ouvrir);
  });
})();
