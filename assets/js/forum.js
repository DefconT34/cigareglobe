/* forum.js */
// forum.js — Espace communautaire
// ════════════════════════════════════════════════════════
// Trois vues dans un seul calque : rubriques → sujets → fil. Le
// calque se superpose au globe plutôt que de le remplacer ; fermer
// ramène exactement où l'on était, sans rechargement.
//
// CE QUE CE MODULE NE FAIT PAS : mettre en forme les messages. Le
// serveur rend le Markdown restreint (forum_lib.php), après avoir tout
// échappé. Le front pose le HTML reçu tel quel — c'est le seul endroit
// du fichier où l'on écrit du HTML qu'on n'a pas fabriqué, et il vient
// d'un rendu dont les tests vérifient l'échappement dans les deux sens.
// Tout le reste passe par esc().
//
// Cahier des charges : docs/communaute.md
// ════════════════════════════════════════════════════════

(function () {
  'use strict';

  var API = (window.CG_BACKEND_BASE || '/backend') + '/forum.php';

  var vue      = 'sections';   // sections | topics | topic
  var section  = null;         // slug de rubrique
  var topicId  = null;
  var etiquette = null;        // filtre par étiquette
  var langues  = null;         // null = « la mienne + anglais »
  var calque   = null;
  var donnees  = { sections: [] };

  // ── Utilitaires ────────────────────────────────────────
  function esc(s) {
    return String(s == null ? '' : s).replace(/[&<>"']/g, function (c) {
      return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c];
    });
  }

  function appel(action, methode, corps) {
    var opts = { method: methode || 'GET', credentials: 'include', headers: {} };
    if (corps) {
      opts.headers['Content-Type'] = 'application/json';
      opts.body = JSON.stringify(corps);
    }
    if (opts.method === 'POST') {
      opts.headers['X-CSRF-Token'] = (window.CGAccount && window.CGAccount.csrf) || '';
    }
    return fetch(API + '?action=' + action, opts).then(function (r) {
      return r.json().catch(function () { return {}; }).then(function (j) {
        return { ok: r.ok, status: r.status, data: j };
      });
    });
  }

  /**
   * Langues demandées au serveur.
   * Par défaut : celle de l'affichage PLUS l'anglais. Le site parle six
   * langues et personne ne traduit les messages ; sans ce réglage, une
   * rubrique serait un empilement où cinq lecteurs sur six ne
   * comprennent rien. L'anglais s'y ajoute parce que c'est la langue où
   * les aficionados se rejoignent le plus souvent.
   */
  function paramLangues() {
    if (langues === 'all') return 'all';
    var moi = window.currentLang || 'fr';
    return moi === 'en' ? 'en' : moi + ',en';
  }

  function dateCourte(iso) {
    if (!iso) return '';
    var d = new Date(String(iso).replace(' ', 'T'));
    if (isNaN(d)) return '';
    try {
      return new Intl.DateTimeFormat(window.currentLang || 'fr',
        { day: 'numeric', month: 'short', year: 'numeric' }).format(d);
    } catch (e) { return d.toLocaleDateString(); }
  }

  function auteurNom(a) {
    // Un compte supprimé laisse ses messages : le fil reste lisible.
    return (a && a.name) ? esc(a.name) : t('forum_supprime');
  }

  // ── Calque ─────────────────────────────────────────────
  function ouvrir(sec, sujet) {
    section = sec || null;
    topicId = sujet || null;
    vue = topicId ? 'topic' : (section ? 'topics' : 'sections');
    if (!calque) construire();
    calque.classList.add('open');
    document.body.classList.add('forum-open');
    rendre();
  }

  function fermer() {
    if (calque) calque.classList.remove('open');
    document.body.classList.remove('forum-open');
    try { history.replaceState({}, '', location.pathname); } catch (e) {}
  }

  function construire() {
    calque = document.createElement('div');
    calque.id = 'forum';
    calque.setAttribute('role', 'dialog');
    calque.setAttribute('aria-modal', 'true');
    calque.setAttribute('aria-label', 'Communauté');
    calque.innerHTML =
      '<div class="fo-back"></div>' +
      '<div class="fo-box">' +
        '<div class="fo-hdr">' +
          '<div class="fo-ey" data-i18n="forum_titre">Communauté</div>' +
          '<div class="fo-sub"></div>' +
          '<button class="fo-close" aria-label="Fermer">✕</button>' +
        '</div>' +
        '<div class="fo-body"></div>' +
        '<div class="fo-foot"></div>' +
      '</div>';
    document.body.appendChild(calque);
    calque.querySelector('.fo-close').onclick = fermer;
    calque.querySelector('.fo-back').onclick  = fermer;
    document.addEventListener('keydown', function (e) {
      if (e.key === 'Escape' && calque.classList.contains('open')) fermer();
    });
  }

  function corps() { return calque.querySelector('.fo-body'); }

  function chargement() {
    corps().innerHTML = '<div class="fo-load">' + t('loading_spinner') + '</div>';
  }

  // ── Vue 1 : les rubriques ──────────────────────────────
  function rendreSections() {
    chargement();
    appel('sections').then(function (r) {
      donnees.sections = (r.data && r.data.sections) || [];
      calque.querySelector('.fo-sub').textContent = t('forum_sous_titre');
      corps().innerHTML = '<div class="fo-secs">' + donnees.sections.map(function (s) {
        return '<button class="fo-sec" data-sec="' + esc(s.slug) + '">' +
          '<span class="fo-sec-ico" aria-hidden="true">' + esc(s.icon) + '</span>' +
          '<span class="fo-sec-txt">' +
            '<span class="fo-sec-name">' + esc(t('forum_sec_' + s.slug)) + '</span>' +
            '<span class="fo-sec-desc">' + esc(t('forum_sec_' + s.slug + '_d')) + '</span>' +
          '</span>' +
          '<span class="fo-sec-n">' + s.topics + ' ' + t('forum_sujets') + '</span>' +
        '</button>';
      }).join('') + '</div>';

      corps().querySelectorAll('.fo-sec').forEach(function (b) {
        b.onclick = function () { aller(b.dataset.sec, null); };
      });
      pied();
    });
  }

  // ── Vue 2 : les sujets d'une rubrique ──────────────────
  function rendreTopics() {
    chargement();
    // appel() préfixe « ?action= » : la suite s'ajoute en paramètres.
    var q = 'topics&lang=' + encodeURIComponent(paramLangues());
    if (section)   q += '&section=' + encodeURIComponent(section);
    if (etiquette) q += '&tag=' + encodeURIComponent(etiquette);

    appel(q).then(function (r) {
      var l = (r.data && r.data.topics) || [];
      calque.querySelector('.fo-sub').textContent = etiquette
        ? '#' + etiquette
        : t('forum_sec_' + section);

      var tete =
        '<div class="fo-bar">' +
          '<button class="fo-back-btn">‹ ' + t('forum_retour') + '</button>' +
          '<div class="fo-bar-right">' +
            '<label class="fo-filtre">' +
              '<span>' + t('forum_filtre_langue') + '</span>' +
              '<select class="fo-lang">' +
                '<option value="mine"' + (langues === 'all' ? '' : ' selected') + '>' + esc(t('forum_filtre_mienne')) + '</option>' +
                '<option value="all"' + (langues === 'all' ? ' selected' : '') + '>' + esc(t('forum_filtre_toutes')) + '</option>' +
              '</select>' +
            '</label>' +
            '<button class="fo-new">' + t('forum_nouveau') + '</button>' +
          '</div>' +
        '</div>';

      var liste = l.length ? '<div class="fo-list">' + l.map(ligneSujet).join('') + '</div>'
        : '<div class="fo-vide">' + t(langues === 'all' ? 'forum_vide' : 'forum_vide_filtre') + '</div>';

      corps().innerHTML = tete + liste;
      corps().querySelector('.fo-back-btn').onclick = function () { aller(null, null); };
      corps().querySelector('.fo-lang').onchange = function () {
        langues = this.value === 'all' ? 'all' : null;
        rendre();
      };
      corps().querySelector('.fo-new').onclick = formulaireSujet;
      corps().querySelectorAll('.fo-topic').forEach(function (b) {
        b.onclick = function () { aller(section, parseInt(b.dataset.id, 10)); };
      });
      pied();
    });
  }

  function ligneSujet(s) {
    // La langue s'affiche dès qu'elle n'est pas celle de la lecture :
    // le lecteur sait avant de cliquer qu'il va changer de langue.
    var drapeau = (s.lang && s.lang !== (window.currentLang || 'fr'))
      ? '<span class="fo-lang-tag">' + esc(s.lang.toUpperCase()) + '</span>' : '';
    return '<button class="fo-topic" data-id="' + s.id + '">' +
      '<span class="fo-t-main">' +
        '<span class="fo-t-title">' +
          (s.pinned ? '<span class="fo-pin" title="' + esc(t('forum_epingle')) + '">📌</span>' : '') +
          esc(s.title) + drapeau +
        '</span>' +
        '<span class="fo-t-meta">' + t('forum_par') + ' ' + auteurNom(s.author) +
          ' · ' + dateCourte(s.last_post_at || s.created_at) + '</span>' +
        (s.tags.length ? '<span class="fo-tags">' + s.tags.map(function (g) {
          return '<span class="fo-tag">#' + esc(g.label) + '</span>';
        }).join('') + '</span>' : '') +
      '</span>' +
      '<span class="fo-t-n">' + s.posts + '<small>' + t('forum_messages') + '</small></span>' +
    '</button>';
  }

  // ── Vue 3 : le fil ─────────────────────────────────────
  function rendreTopic() {
    chargement();
    appel('topic&id=' + topicId).then(function (r) {
      if (!r.ok) { corps().innerHTML = '<div class="fo-vide">' + esc(tErr(r.data)) + '</div>'; return; }
      var t0 = r.data.topic, posts = r.data.posts || [];
      calque.querySelector('.fo-sub').textContent = t('forum_sec_' + t0.section);
      try {
        history.replaceState({}, '', location.pathname + '?sujet=' + t0.id);
      } catch (e) {}

      corps().innerHTML =
        '<div class="fo-bar"><button class="fo-back-btn">‹ ' + esc(t('forum_sec_' + t0.section)) + '</button></div>' +
        '<h2 class="fo-titre">' + esc(t0.title) + '</h2>' +
        '<div class="fo-t-meta">' + t('forum_par') + ' ' + auteurNom(t0.author) +
          ' · ' + dateCourte(t0.created_at) +
          (t0.locked ? ' · ' + t('forum_ferme') : '') + '</div>' +
        (t0.tags.length ? '<div class="fo-tags">' + t0.tags.map(function (g) {
          return '<button class="fo-tag" data-tag="' + esc(g.slug) + '">#' + esc(g.label) + '</button>';
        }).join('') + '</div>' : '') +
        '<div class="fo-posts">' + posts.map(function (p) { return blocMessage(p, t0); }).join('') + '</div>' +
        (t0.locked ? '<div class="fo-vide">' + t('forum_ferme') + '</div>' : zoneReponse());

      corps().querySelector('.fo-back-btn').onclick = function () { aller(t0.section, null); };
      corps().querySelectorAll('.fo-tag[data-tag]').forEach(function (b) {
        b.onclick = function () { etiquette = b.dataset.tag; aller(null, null, true); };
      });
      brancherMessages(t0);
      if (!t0.locked) brancherReponse(t0);
      pied();
    });
  }

  function blocMessage(p, t0) {
    if (p.hidden) {
      return '<article class="fo-post fo-post-masque"><p>' + t('forum_masque') + '</p></article>';
    }
    var resolu = t0.solved_post_id === p.id;
    return '<article class="fo-post' + (resolu ? ' fo-post-solved' : '') + '" data-id="' + p.id + '">' +
      '<header class="fo-p-hdr">' +
        '<span class="fo-p-auteur">' + auteurNom(p.author) + '</span>' +
        '<span class="fo-p-date">' + dateCourte(p.created_at) +
          (p.edited_at ? ' · ' + t('forum_modifie') : '') + '</span>' +
      '</header>' +
      (resolu ? '<div class="fo-solved-tag">' + t('forum_resolu') + '</div>' : '') +
      '<div class="fo-p-corps">' + p.html + '</div>' +   /* rendu et échappé par le serveur */
      '<footer class="fo-p-actions">' +
        '<button class="fo-act" data-act="like" data-id="' + p.id + '">👍 ' +
          t('forum_utile') + ' <b>' + p.likes + '</b></button>' +
        (p.mine ? '' : '<button class="fo-act" data-act="flag" data-id="' + p.id + '">⚑ ' + t('forum_signaler') + '</button>') +
      '</footer>' +
    '</article>';
  }

  function zoneReponse() {
    if (!(window.CGAccount && window.CGAccount.user)) {
      return '<button class="fo-connexion">' + t('forum_connexion') + '</button>';
    }
    return '<div class="fo-repondre">' +
      '<textarea class="fo-txt" rows="4" placeholder="' + esc(t('forum_message_champ')) + '"></textarea>' +
      '<div class="fo-aide">' + esc(t('forum_aide_format')) + '</div>' +
      '<div class="fo-err" hidden></div>' +
      '<button class="fo-envoyer">' + t('forum_publier') + '</button>' +
    '</div>';
  }

  function brancherMessages(t0) {
    corps().querySelectorAll('.fo-act').forEach(function (b) {
      b.onclick = function () {
        if (!(window.CGAccount && window.CGAccount.require())) return;
        var id = parseInt(b.dataset.id, 10);
        if (b.dataset.act === 'like') {
          appel('react', 'POST', { post_id: id }).then(function (r) {
            if (r.ok) b.innerHTML = '👍 ' + t('forum_utile') + ' <b>' + r.data.likes + '</b>';
          });
        } else {
          signaler(id, b);
        }
      };
    });
  }

  function signaler(id, bouton) {
    var motifs = ['offtopic', 'ad', 'abuse', 'wrong', 'other'];
    var choix = document.createElement('div');
    choix.className = 'fo-motifs';
    choix.innerHTML = motifs.map(function (m) {
      return '<button data-m="' + m + '">' + t('forum_motif_' + m) + '</button>';
    }).join('');
    bouton.parentNode.appendChild(choix);
    choix.querySelectorAll('button').forEach(function (b) {
      b.onclick = function () {
        appel('flag', 'POST', { post_id: id, reason: b.dataset.m }).then(function (r) {
          choix.remove();
          bouton.textContent = r.ok ? '⚑ ' + t('forum_signale') : tErr(r.data);
          bouton.disabled = true;
          if (r.ok && r.data.hidden) rendre();
        });
      };
    });
  }

  function brancherReponse(t0) {
    var zone = corps().querySelector('.fo-repondre');
    if (!zone) {
      var b = corps().querySelector('.fo-connexion');
      if (b) b.onclick = function () { window.CGAccount && window.CGAccount.require(); };
      return;
    }
    var champ = zone.querySelector('.fo-txt');
    var errEl = zone.querySelector('.fo-err');
    zone.querySelector('.fo-envoyer').onclick = function () {
      var texte = champ.value.trim();
      if (texte.length < 2) return;
      errEl.hidden = true;
      appel('post_create', 'POST', { topic_id: t0.id, body: texte }).then(function (r) {
        if (!r.ok) { errEl.textContent = tErr(r.data); errEl.hidden = false; return; }
        champ.value = '';
        rendre();
      });
    };
  }

  // ── Ouvrir un sujet ────────────────────────────────────
  function formulaireSujet() {
    if (!(window.CGAccount && window.CGAccount.requireVerified())) return;
    corps().innerHTML =
      '<div class="fo-bar"><button class="fo-back-btn">‹ ' + t('forum_retour') + '</button></div>' +
      '<div class="fo-form">' +
        '<label>' + t('forum_titre_champ') +
          '<input class="fo-f-titre" maxlength="140"></label>' +
        '<label>' + t('forum_message_champ') +
          '<textarea class="fo-f-corps" rows="8"></textarea></label>' +
        '<div class="fo-aide">' + esc(t('forum_aide_format')) + '</div>' +
        '<label>' + t('forum_etiquettes') +
          '<input class="fo-f-tags" placeholder="' + esc(t('forum_etiquettes_aide')) + '"></label>' +
        '<label>' + t('forum_langue_champ') +
          '<select class="fo-f-lang">' +
            ['fr','en','es','de','zh','ar'].map(function (l) {
              return '<option value="' + l + '"' +
                (l === (window.currentLang || 'fr') ? ' selected' : '') + '>' + l.toUpperCase() + '</option>';
            }).join('') +
          '</select></label>' +
        '<div class="fo-err" hidden></div>' +
        '<div class="fo-form-btns">' +
          '<button class="fo-envoyer">' + t('forum_publier') + '</button>' +
          '<button class="fo-annuler">' + t('forum_annuler') + '</button>' +
        '</div>' +
      '</div>';

    var f = corps().querySelector('.fo-form');
    var errEl = f.querySelector('.fo-err');
    corps().querySelector('.fo-back-btn').onclick = function () { rendre(); };
    f.querySelector('.fo-annuler').onclick = function () { rendre(); };
    f.querySelector('.fo-envoyer').onclick = function () {
      errEl.hidden = true;
      appel('topic_create', 'POST', {
        section: section,
        title:   f.querySelector('.fo-f-titre').value.trim(),
        body:    f.querySelector('.fo-f-corps').value.trim(),
        lang:    f.querySelector('.fo-f-lang').value,
        tags:    f.querySelector('.fo-f-tags').value.split(',').map(function (s) { return s.trim(); }).filter(Boolean),
      }).then(function (r) {
        if (!r.ok) { errEl.textContent = tErr(r.data); errEl.hidden = false; return; }
        aller(section, r.data.id);
      });
    };
  }

  // ── Pied : la mention obligatoire ──────────────────────
  // Le cigare est un produit du tabac ; cet espace n'est pas un lieu de
  // vente et n'est pas ouvert aux mineurs. Voir §10 du cahier des
  // charges — et l'avis juridique qui reste à prendre avant ouverture.
  function pied() {
    calque.querySelector('.fo-foot').textContent = t('forum_mention_sante');
  }

  // ── Navigation ─────────────────────────────────────────
  function aller(sec, sujet, garderEtiquette) {
    if (!garderEtiquette && sec !== null) etiquette = null;
    section = sec;
    topicId = sujet || null;
    vue = topicId ? 'topic' : (section || etiquette ? 'topics' : 'sections');
    if (!topicId) {
      try {
        history.replaceState({}, '', location.pathname + (section ? '?forum=' + section : '?forum=1'));
      } catch (e) {}
    }
    rendre();
  }

  function rendre() {
    if (vue === 'topic')  return rendreTopic();
    if (vue === 'topics') return rendreTopics();
    rendreSections();
  }

  // ── Amorçage ───────────────────────────────────────────
  // TOUT est différé à DOMContentLoaded, y compris l'ouverture depuis
  // l'URL. Ce module a besoin de t() (i18n.js) et de CGAccount
  // (account.js), tous deux chargés APRÈS lui : ouvrir la vue au moment
  // du parsing levait une ReferenceError sur t(), qui interrompait le
  // module — le calque restait vide et window.ouvrirForum n'existait
  // même pas. Un « ?forum=… » partagé ne montrait rien.
  function demarrer() {
    var b = document.getElementById('forumBtn');
    if (b) b.onclick = function () { ouvrir(null, null); };
    var m = document.getElementById('mm-forum');
    if (m) m.onclick = function () { ouvrir(null, null); };

    // Une adresse partagée ouvre directement la bonne vue.
    var p = new URLSearchParams(location.search);
    if (p.has('sujet'))      ouvrir(null, parseInt(p.get('sujet'), 10));
    else if (p.has('forum')) ouvrir(p.get('forum') === '1' ? null : p.get('forum'), null);
  }

  window.ouvrirForum = ouvrir;

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', demarrer);
  } else {
    demarrer();
  }
})();
