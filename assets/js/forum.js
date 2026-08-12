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
  var ancre    = null;         // { type, id, label } — ancrage sur l'atlas
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
   * Les langues que le site sert, dans l'ordre.
   *
   * Réglées depuis l'administration (migration 019) et posées par
   * index.php sur <html data-langs>. Sans l'attribut — ouverture
   * directe du fichier, gabarit servi tel quel — on retombe sur les
   * six : mieux vaut proposer une langue de trop que priver d'écriture.
   */
  function languesServies() {
    var brut = document.documentElement.getAttribute('data-langs') || '';
    var liste = brut.split(',').map(function (l) { return l.trim(); })
                    .filter(function (l) { return /^[a-z]{2}$/.test(l); });
    return liste.length ? liste : ['fr', 'en', 'es', 'de', 'zh', 'ar'];
  }

  /** Les <option> du choix de langue d'un message que l'on écrit. */
  function optionsLangues() {
    var moi = window.currentLang || 'fr';
    return languesServies().map(function (l) {
      return '<option value="' + l + '"' +
        (l === moi ? ' selected' : '') + '>' + l.toUpperCase() + '</option>';
    }).join('');
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

  /**
   * Accorde un nom avec un nombre, dans la langue affichée.
   *
   * « 1 sujets » se voyait dès la première rubrique. Un simple
   * « n > 1 ? pluriel : singulier » aurait corrigé le français et cassé
   * l'anglais, où zéro prend le pluriel — et n'aurait rien dit du
   * chinois ni de l'arabe. Intl.PluralRules connaît la règle de chaque
   * langue ; c'est exactement ce pour quoi il existe, et il ne coûte
   * aucune clé de traduction supplémentaire.
   */
  function pluriel(n, cleUn, clePlus) {
    try {
      var forme = new Intl.PluralRules(window.currentLang || 'fr').select(n);
      return t(forme === 'one' ? cleUn : clePlus);
    } catch (e) {
      return t(n > 1 ? clePlus : cleUn);
    }
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

  /**
   * Pictogramme d'une rubrique.
   *
   * IL N'EXISTE PAS D'ÉMOJI DE CIGARE. Unicode a « 🚬 », qui est une
   * cigarette — l'objet que ce site ne traite pas, et dont l'image
   * dessert exactement ce qu'il défend. Celui de la rubrique « Les
   * cigares » est donc DESSINÉ : un module à l'oblique, sa bague, et la
   * braise. Les sept autres restent en émoji, qui leur va.
   *
   * Le tracé vit ici et non en base : c'est de la présentation, comme
   * le libellé de la rubrique — que l'on avait déjà sorti de la base
   * pour la même raison. La valeur servie par l'API n'est jamais
   * injectée en HTML.
   */
  function iconeRubrique(slug, emoji) {
    if (slug !== 'cigares') return '<span class="fo-sec-ico" aria-hidden="true">' + esc(emoji) + '</span>';
    return '<span class="fo-sec-ico" aria-hidden="true">' +
      '<svg viewBox="0 0 24 24" width="21" height="21" fill="none" aria-hidden="true">' +
        // Le module, incliné comme on le tient
        '<path d="M3.6 17.9 L15.8 5.7 a2.6 2.6 0 0 1 3.7 0 l0.8 0.8 a2.6 2.6 0 0 1 0 3.7 L8.1 22.4 Z"' +
             ' fill="#8B5A2B" stroke="#5C3A1A" stroke-width="1.1" stroke-linejoin="round"/>' +
        // La bague : une bande PERPENDICULAIRE à l'axe et large comme le
        // module. Posée en losange, elle se lisait comme un motif ; c'est
        // pourtant elle qui dit « cigare » plutôt que « bâton ».
        '<path d="M9.29 12.47 L10.99 10.77 L15.23 15.01 L13.53 16.71 Z"' +
             ' fill="#C9A227" stroke="#8A6A12" stroke-width=".8"/>' +
        // La braise, sur toute la face du bout
        '<path d="M3.6 17.9 L8.1 22.4 L9.23 21.27 L4.73 16.77 Z" fill="#E06030"/>' +
      '</svg>' +
    '</span>';
  }

  /**
   * La rubrique d'un sujet ouvert depuis l'atlas.
   *
   * Le formulaire de création prend sa rubrique de la vue ; ouvert
   * depuis une fiche, il n'en a pas. Plutôt qu'ajouter un choix de
   * rubrique à un formulaire qui n'en avait pas besoin — et le faire
   * porter à quelqu'un qui vient juste de cliquer « En discuter » —, on
   * la déduit de ce dont on parle. Le sujet reste déplaçable ensuite,
   * c'est le rôle de la modération.
   */
  function rubriqueDeLAncre(type) {
    if (type === 'brand') return 'maisons';
    return 'etablissements';        // lounge et country
  }

  function auteurNom(a) {
    // Un compte supprimé laisse ses messages : le fil reste lisible.
    return (a && a.name) ? esc(a.name) : t('forum_supprime');
  }

  // ── Calque ─────────────────────────────────────────────
  function ouvrir(sec, sujet) {
    if (sec && !(donnees.sections || []).length) {
      // Même raison que dans aller() : sans la liste des rubriques, on
      // ne sait pas si celle-ci porte un agenda.
      return appel('sections&lang=' + encodeURIComponent(paramLangues())).then(function (r) {
        donnees.sections = (r.data && r.data.sections) || [];
        ouvrir(sec, sujet);
      });
    }
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

  /**
   * L'activité récente, en tête des rubriques.
   *
   * Il fallait ouvrir les huit rubriques une à une pour savoir s'il
   * s'était passé quelque chose. Sur un espace jeune, c'est huit clics
   * pour apprendre qu'il ne s'est rien passé.
   *
   * Rien du tout quand la liste est vide : un bloc « Activité récente »
   * suivi du vide annonce un espace mort mieux que son absence.
   */
  function blocRecent(l) {
    if (!l || !l.length) return '';
    return '<div class="fo-recent">' +
      '<div class="fo-recent-t">' + esc(t('forum_recent')) + '</div>' +
      l.map(function (x) {
        var drapeau = (x.lang && x.lang !== (window.currentLang || 'fr'))
          ? '<span class="fo-lang-tag">' + esc(x.lang.toUpperCase()) + '</span>' : '';
        return '<button class="fo-recent-l" data-sujet="' + x.id + '">' +
          '<span class="fo-recent-ti">' + esc(x.title) + drapeau + '</span>' +
          '<span class="fo-recent-m">' + esc(t('forum_sec_' + x.section)) +
            ' · ' + esc(dateCourte(x.last_post_at || x.created_at)) + '</span>' +
        '</button>';
      }).join('') +
    '</div>';
  }

  // ── Vue 1 : les rubriques ──────────────────────────────
  function rendreSections() {
    chargement();
    appel('sections&lang=' + encodeURIComponent(paramLangues())).then(function (r) {
      donnees.sections = (r.data && r.data.sections) || [];
      calque.querySelector('.fo-sub').textContent = t('forum_sous_titre');
      corps().innerHTML = blocRecent(r.data && r.data.recent) +
        '<div class="fo-secs">' + donnees.sections.map(function (s) {
        return '<button class="fo-sec" data-sec="' + esc(s.slug) + '">' +
          iconeRubrique(s.slug, s.icon) +
          '<span class="fo-sec-txt">' +
            '<span class="fo-sec-name">' + esc(t('forum_sec_' + s.slug)) + '</span>' +
            '<span class="fo-sec-desc">' + esc(t('forum_sec_' + s.slug + '_d')) + '</span>' +
          '</span>' +
          '<span class="fo-sec-n">' + s.topics + ' ' + pluriel(s.topics, 'forum_sujet', 'forum_sujets') + '</span>' +
        '</button>';
      }).join('') + '</div>';

      corps().querySelectorAll('.fo-sec').forEach(function (b) {
        b.onclick = function () { aller(b.dataset.sec, null); };
      });
      corps().querySelectorAll('.fo-recent-l').forEach(function (b) {
        b.onclick = function () { aller(null, parseInt(b.dataset.sujet, 10)); };
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
    if (ancre) {
      q += '&ref_type=' + encodeURIComponent(ancre.type) +
           '&ref_id='   + encodeURIComponent(ancre.id);
    }

    appel(q).then(function (r) {
      var l = (r.data && r.data.topics) || [];
      calque.querySelector('.fo-sub').textContent = ancre
        ? ancre.label
        : (etiquette ? '#' + etiquette : t('forum_sec_' + section));

      var tete =
        '<div class="fo-bar">' +
          '<button class="fo-back-btn">' + t('forum_retour') + '</button>' +
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
      '<span class="fo-t-n">' + s.posts + '<small>' + pluriel(s.posts, 'forum_message', 'forum_messages') + '</small></span>' +
    '</button>';
  }


  // ══ IMAGES DES MESSAGES ════════════════════════════════
  // Trois au plus, choisies avant l'envoi et téléversées tout de suite :
  // le rédacteur voit ce qu'il joint pendant qu'il écrit, plutôt que de
  // découvrir après coup qu'une photo est passée de travers.
  //
  // Les images voyagent en `multipart`, donc PAS par appel() — qui pose
  // un en-tête JSON. Le jeton CSRF, lui, reste le même.

  var IMG_MAX = 3;
  var _enAttente = [];          // images téléversées, pas encore publiées

  function envoyerImage(fichier) {
    var fd = new FormData();
    fd.append('image', fichier);
    return fetch(API + '?action=post_image', {
      method: 'POST', credentials: 'include',
      // Surtout PAS de Content-Type : le navigateur doit poser lui-même
      // la frontière multipart, et l'écraser casse l'envoi en silence.
      headers: { 'X-CSRF-Token': (window.CGAccount && window.CGAccount.csrf) || '' },
      body: fd,
    }).then(function (r) {
      return r.json().catch(function () { return {}; })
              .then(function (j) { return { ok: r.ok, data: j }; });
    });
  }

  /** La zone de choix d'images, commune au sujet et à la réponse. */
  function zoneImages() {
    return '<div class="fo-img-zone">' +
             '<label class="fo-img-ajout">' +
               '<input type="file" accept="image/jpeg,image/png,image/webp" multiple hidden>' +
               '<span>🖼 ' + t('forum_img_ajouter') + '</span>' +
             '</label>' +
             '<span class="fo-img-aide">' + esc(t('forum_img_aide')) + '</span>' +
             '<div class="fo-img-apercus"></div>' +
           '</div>';
  }

  function brancherImages(racine) {
    var zone = racine.querySelector('.fo-img-zone');
    if (!zone) return;
    var champ   = zone.querySelector('input[type=file]');
    var apercus = zone.querySelector('.fo-img-apercus');

    function redessiner() {
      apercus.innerHTML = _enAttente.map(function (im, i) {
        return '<span class="fo-img-apercu">' +
                 '<img src="' + esc(im.thumb) + '" alt="">' +
                 '<button type="button" class="fo-img-retirer" data-i="' + i + '"' +
                        ' aria-label="' + esc(t('forum_img_retirer')) + '">✕</button>' +
               '</span>';
      }).join('');
      apercus.querySelectorAll('.fo-img-retirer').forEach(function (b) {
        b.onclick = function () {
          // On retire de l'envoi seulement : l'image téléversée sera
          // effacée du serveur au bout de 24 h si elle n'est jamais
          // publiée (forum_img_purger).
          _enAttente.splice(parseInt(b.dataset.i, 10), 1);
          redessiner();
        };
      });
      var ajout = zone.querySelector('.fo-img-ajout');
      if (ajout) ajout.style.display = _enAttente.length >= IMG_MAX ? 'none' : '';
    }

    champ.onchange = function () {
      var fichiers = [].slice.call(champ.files, 0, IMG_MAX - _enAttente.length);
      champ.value = '';
      if (!fichiers.length) return;
      zone.classList.add('fo-img-occupe');

      Promise.all(fichiers.map(envoyerImage)).then(function (res) {
        zone.classList.remove('fo-img-occupe');
        var erreur = null;
        res.forEach(function (r) {
          if (r.ok && r.data.image) _enAttente.push(r.data.image);
          else erreur = tErr(r.data);
        });
        redessiner();
        if (erreur) {
          var z = racine.querySelector('.fo-err');
          if (z) { z.textContent = erreur; z.hidden = false; }
        }
      });
    };
    redessiner();
  }

  /** Les identifiants à envoyer avec le message, puis remise à zéro. */
  function imagesAEnvoyer() {
    var ids = _enAttente.map(function (im) { return im.id; });
    _enAttente = [];
    return ids;
  }

  /** Vignettes sous un message. */
  function blocImages(images) {
    if (!images || !images.length) return '';
    return '<div class="fo-p-images">' + images.map(function (im) {
      return '<button type="button" class="fo-p-img" data-url="' + esc(im.url) + '">' +
               '<img src="' + esc(im.thumb) + '" alt="" loading="lazy">' +
             '</button>';
    }).join('') + '</div>';
  }

  /**
   * Visionneuse : l'image en grand, sur un fond sombre.
   * Elle se ferme par Échap, par un clic à côté et par sa croix — trois
   * gestes qu'on essaie naturellement, et il serait pénible qu'un seul
   * fonctionne.
   */
  function ouvrirImage(url) {
    var vue = document.createElement('div');
    vue.className = 'fo-visio';
    vue.innerHTML = '<button class="fo-visio-x" aria-label="' + esc(t('forum_annuler')) + '">✕</button>' +
                    '<img src="' + esc(url) + '" alt="">';
    document.body.appendChild(vue);

    function fermer() {
      vue.remove();
      document.removeEventListener('keydown', auClavier, true);
    }
    function auClavier(e) {
      if (e.key !== 'Escape') return;
      e.preventDefault(); e.stopPropagation();   // ne pas fermer le calque du forum
      fermer();
    }
    vue.onclick = function (e) { if (e.target !== vue.querySelector('img')) fermer(); };
    document.addEventListener('keydown', auClavier, true);
  }

  function brancherVignettes(racine) {
    racine.querySelectorAll('.fo-p-img').forEach(function (b) {
      b.onclick = function () { ouvrirImage(b.dataset.url); };
    });
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
        '<div class="fo-bar"><button class="fo-back-btn">' + esc(t('forum_sec_' + t0.section)) + '</button></div>' +
        '<h2 class="fo-titre">' + esc(t0.title) + '</h2>' +
        '<div class="fo-t-meta">' + t('forum_par') + ' ' + auteurNom(t0.author) +
          ' · ' + dateCourte(t0.created_at) +
          (t0.locked ? ' · ' + t('forum_ferme') : '') + '</div>' +
        (t0.tags.length ? '<div class="fo-tags">' + t0.tags.map(function (g) {
          return '<button class="fo-tag" data-tag="' + esc(g.slug) + '">#' + esc(g.label) + '</button>';
        }).join('') + '</div>' : '') +
        lienAtlas(t0.ref) + boutonSuivre(t0) +
        (r.data.event ? blocEvt(r.data.event) : '') +
        '<div class="fo-err" hidden></div>' +
        '<div class="fo-posts">' + posts.map(function (p) { return blocMessage(p, t0); }).join('') + '</div>' +
        (t0.locked ? '<div class="fo-vide">' + t('forum_ferme') + '</div>' : zoneReponse());

      corps().querySelector('.fo-back-btn').onclick = function () { aller(t0.section, null); };
      corps().querySelectorAll('.fo-tag[data-tag]').forEach(function (b) {
        b.onclick = function () { etiquette = b.dataset.tag; aller(null, null, true); };
      });
      brancherLienAtlas(t0.ref);
      brancherSuivre(t0);
      brancherMessages(t0);
      brancherVignettes(corps());
      if (r.data.event) brancherEvt(r.data.event);
      if (!t0.locked) brancherReponse(t0);
      pied();
    });
  }

  /**
   * « Suivre ce sujet ».
   *
   * La table et le point d'API existaient depuis le premier jour, sans
   * qu'aucun bouton ne les appelle : rien ne s'est jamais rempli, rien
   * n'est jamais parti. On écrivait, et on n'apprenait qu'on avait reçu
   * une réponse qu'en revenant vérifier.
   *
   * Rien pour un visiteur non connecté : suivre suppose une adresse où
   * écrire. Le bouton « se connecter » est déjà en bas du fil.
   */
  function boutonSuivre(t0) {
    if (!(window.CGAccount && window.CGAccount.user)) return '';
    var actif = !!t0.following;
    return '<button class="fo-suivre' + (actif ? ' on' : '') + '" aria-pressed="' + actif + '">' +
             '<span aria-hidden="true">' + (actif ? '✓' : '☆') + '</span> ' +
             esc(t(actif ? 'forum_suivi' : 'forum_suivre')) +
           '</button>';
  }

  function brancherSuivre(t0) {
    var b = corps().querySelector('.fo-suivre');
    if (!b) return;
    b.onclick = function () {
      b.disabled = true;
      appel('follow', 'POST', { topic_id: t0.id }).then(function (r) {
        b.disabled = false;
        if (!r.ok) return;
        var on = !!(r.data && r.data.following);
        t0.following = on;
        b.classList.toggle('on', on);
        b.setAttribute('aria-pressed', String(on));
        b.innerHTML = '<span aria-hidden="true">' + (on ? '✓' : '☆') + '</span> ' +
                      esc(t(on ? 'forum_suivi' : 'forum_suivre'));
      });
    };
  }

  /**
   * Le renvoi vers la fiche de l'atlas, quand le sujet y est ancré.
   *
   * Le lien va dans les DEUX sens : la fiche mène à la discussion,
   * la discussion ramène à la fiche. Un ancrage à sens unique laisse
   * une moitié des lecteurs — ceux qui arrivent par un lien partagé —
   * sans le contexte dont on parle.
   */
  function lienAtlas(ref) {
    if (!ref || !ref.type || !ref.id) return '';
    return '<button class="fo-atlas" data-t="' + esc(ref.type) + '" data-i="' + esc(ref.id) + '">' +
             '<span aria-hidden="true">↗</span> ' + esc(t('forum_voir_atlas')) +
           '</button>';
  }

  function brancherLienAtlas(ref) {
    var b = corps().querySelector('.fo-atlas');
    if (!b || !ref) return;
    b.onclick = function () {
      // Fermer d'abord : le calque couvre le globe, et la fiche
      // s'ouvrirait derrière lui.
      fermer();
      if (typeof window.ouvrirCibleAtlas !== 'function') return;
      // Un établissement s'ouvre par le PAYS qui le contient — c'est
      // ainsi que l'atlas est bâti. Le serveur sert donc le pays avec
      // la référence.
      if (ref.type === 'lounge') window.ouvrirCibleAtlas('lounge', ref.country, 0);
      else                       window.ouvrirCibleAtlas(ref.type, ref.id, 0);
    };
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
      blocImages(p.images) +
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
      zoneImages() +
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
    brancherImages(zone);
    zone.querySelector('.fo-envoyer').onclick = function () {
      var texte = champ.value.trim();
      if (texte.length < 2) return;
      errEl.hidden = true;
      appel('post_create', 'POST', { topic_id: t0.id, body: texte, images: imagesAEnvoyer() }).then(function (r) {
        if (!r.ok) { errEl.textContent = tErr(r.data); errEl.hidden = false; return; }
        champ.value = '';
        rendre();
      });
    };
  }


  // ══ RENDEZ-VOUS (V2) ═══════════════════════════════════
  // La rubrique marquée « events » n'affiche pas une liste de sujets
  // mais un AGENDA : le tri utile n'y est pas la dernière réponse, mais
  // la date qui vient.

  var agendaPasses = false;   // à venir (défaut) ou archives

  function estOrganisateur() {
    var u = window.CGAccount && window.CGAccount.user;
    return !!u && ['trusted', 'moderator', 'admin'].indexOf(u.role) !== -1;
  }

  /**
   * La date d'un rendez-vous, dans le fuseau du LIEU.
   *
   * C'est le point délicat : « 19 h » n'a de sens qu'à un endroit
   * donné. L'instant arrive en UTC et le fuseau du lieu l'accompagne ;
   * Intl fait le reste, sans table de correspondance à maintenir. Le
   * fuseau est rappelé à l'écrit quand il diffère de celui du lecteur —
   * sinon on lui ferait rater son train.
   */
  function dateEvt(evt, avecFuseau) {
    var d = new Date(evt.starts_at);
    if (isNaN(d)) return '';
    var opts = { weekday: 'long', day: 'numeric', month: 'long',
                 hour: '2-digit', minute: '2-digit', timeZone: evt.timezone };
    var s;
    try { s = new Intl.DateTimeFormat(window.currentLang || 'fr', opts).format(d); }
    catch (e) { s = d.toLocaleString(); }
    if (avecFuseau && evt.timezone && evt.timezone !== fuseauLecteur()) {
      s += ' (' + evt.timezone + ')';
    }
    return s;
  }

  function fuseauLecteur() {
    try { return Intl.DateTimeFormat().resolvedOptions().timeZone; } catch (e) { return ''; }
  }

  /** Pastille de date : le jour et le mois, lisibles d'un coup d'œil. */
  function pastilleDate(evt) {
    var d = new Date(evt.starts_at);
    if (isNaN(d)) return '';
    var opt = { timeZone: evt.timezone };
    var jour, mois;
    try {
      jour = new Intl.DateTimeFormat(window.currentLang || 'fr',
               Object.assign({ day: 'numeric' }, opt)).format(d);
      mois = new Intl.DateTimeFormat(window.currentLang || 'fr',
               Object.assign({ month: 'short' }, opt)).format(d);
    } catch (e) { jour = d.getDate(); mois = ''; }
    return '<span class="fo-evt-date"><b>' + esc(jour) + '</b><small>' + esc(mois) + '</small></span>';
  }

  function rendreAgenda() {
    chargement();
    var q = 'agenda&lang=' + encodeURIComponent(paramLangues()) + (agendaPasses ? '&passes=1' : '');
    appel(q).then(function (r) {
      var l = (r.data && r.data.events) || [];
      calque.querySelector('.fo-sub').textContent = t('forum_sec_' + section);

      var tete =
        '<div class="fo-bar">' +
          '<button class="fo-back-btn">' + t('forum_retour') + '</button>' +
          '<div class="fo-bar-right">' +
            '<label class="fo-filtre">' +
              '<span>' + t('forum_agenda_quand') + '</span>' +
              '<select class="fo-quand">' +
                '<option value="a-venir"' + (agendaPasses ? '' : ' selected') + '>' + esc(t('forum_agenda_avenir')) + '</option>' +
                '<option value="passes"' + (agendaPasses ? ' selected' : '') + '>' + esc(t('forum_agenda_passes')) + '</option>' +
              '</select>' +
            '</label>' +
            (estOrganisateur() ? '<button class="fo-new-evt">' + t('forum_evt_nouveau') + '</button>' : '') +
          '</div>' +
        '</div>';

      var liste = l.length
        ? '<div class="fo-list">' + l.map(ligneEvt).join('') + '</div>'
        : '<div class="fo-vide">' + t(agendaPasses ? 'forum_agenda_vide_passes' : 'forum_agenda_vide') + '</div>';

      // Le droit d'organiser n'est pas ouvert à tous, et le dire vaut
      // mieux que de laisser un bouton absent sans explication.
      var note = (!estOrganisateur() && !agendaPasses)
        ? '<div class="fo-aide fo-evt-note">' + esc(t('forum_evt_confiance')) + '</div>' : '';

      corps().innerHTML = tete + liste + note;
      corps().querySelector('.fo-back-btn').onclick = function () { aller(null, null); };
      corps().querySelector('.fo-quand').onchange = function () {
        agendaPasses = this.value === 'passes';
        rendre();
      };
      var bn = corps().querySelector('.fo-new-evt');
      if (bn) bn.onclick = formulaireEvt;
      corps().querySelectorAll('.fo-topic').forEach(function (b) {
        b.onclick = function () { aller(section, parseInt(b.dataset.id, 10)); };
      });
      pied();
    });
  }

  function ligneEvt(e) {
    var a = e.attendance || {};
    var places = a.capacity
      ? a.going + '/' + a.capacity
      : String(a.going || 0);
    var etat = '';
    if (e.status === 'cancelled') etat = '<span class="fo-evt-annule">' + t('forum_evt_annule') + '</span>';
    else if (a.full)              etat = '<span class="fo-evt-complet">' + t('forum_evt_complet') + '</span>';

    var drapeau = (e.lang && e.lang !== (window.currentLang || 'fr'))
      ? '<span class="fo-lang-tag">' + esc(e.lang.toUpperCase()) + '</span>' : '';

    return '<button class="fo-topic fo-evt" data-id="' + e.topic_id + '">' +
      pastilleDate(e) +
      '<span class="fo-t-main">' +
        '<span class="fo-t-title">' + esc(e.title) + drapeau + etat + '</span>' +
        '<span class="fo-t-meta">' + esc(dateEvt(e, true)) +
          (e.place ? ' · ' + esc(e.place) : '') + '</span>' +
        '<span class="fo-t-meta">' + esc(t('forum_evt_kind_' + e.kind)) +
          ' · ' + places + ' ' + esc(t('forum_evt_participants')) + '</span>' +
      '</span>' +
    '</button>';
  }

  /** Le bandeau d'un rendez-vous, en tête de son fil. */
  function blocEvt(e) {
    var a = e.attendance || {};
    var moi = e.my_state;
    var lignes = [
      '<div class="fo-evt-fiche' + (e.status !== 'upcoming' ? ' fo-evt-fige' : '') + '">',
      '<div class="fo-evt-quand">' + esc(dateEvt(e, true)) + '</div>',
    ];
    if (e.place)  lignes.push('<div class="fo-evt-ou">' + esc(e.place) + '</div>');
    lignes.push('<div class="fo-evt-meta">' + esc(t('forum_evt_kind_' + e.kind)) +
      ' · ' + (a.capacity ? a.going + '/' + a.capacity : String(a.going || 0)) +
      ' ' + esc(t('forum_evt_participants')) +
      (a.interested ? ' · ' + a.interested + ' ' + esc(t('forum_evt_interesses')) : '') + '</div>');

    if (e.status === 'cancelled') {
      lignes.push('<div class="fo-evt-annule-bloc">' + t('forum_evt_annule') +
        (e.cancel_reason ? ' — ' + esc(e.cancel_reason) : '') + '</div>');
    } else if (e.status === 'past') {
      lignes.push('<div class="fo-evt-meta">' + t('forum_evt_passe') + '</div>');
    } else {
      // Sur liste d'attente, on dit le RANG. « Complet » sans plus
      // laisse croire qu'il n'y a rien à espérer ; « 2e sur la liste »
      // se comprend, et se surveille.
      if (a.waiting) {
        lignes.push('<div class="fo-evt-attente">' +
          t('forum_evt_attente').replace('{n}', a.waiting_pos) + '</div>');
      }
      lignes.push(
        '<div class="fo-evt-actions">' +
          '<button class="fo-evt-btn' + (moi === 'going' ? ' actif' : '') + '" data-etat="going">' +
            t('forum_evt_je_viens') + '</button>' +
          '<button class="fo-evt-btn' + (moi === 'interested' ? ' actif' : '') + '" data-etat="interested">' +
            t('forum_evt_interesse') + '</button>' +
          (moi && moi !== 'cancelled'
            ? '<button class="fo-evt-btn" data-etat="cancelled">' + t('forum_evt_retirer') + '</button>' : '') +
        '</div>'
      );
    }
    lignes.push('</div>');
    return lignes.join('');
  }

  function brancherEvt(e) {
    corps().querySelectorAll('.fo-evt-btn').forEach(function (b) {
      b.onclick = function () {
        if (!(window.CGAccount && window.CGAccount.require())) return;
        appel('attend', 'POST', { topic_id: e.topic_id, state: b.dataset.etat })
          .then(function (r) {
            if (!r.ok) { alerteEvt(tErr(r.data)); return; }
            rendre();
          });
      };
    });
    var annul = corps().querySelector('.fo-evt-annuler');
    if (annul) annul.onclick = function () {
      var motif = window.prompt(t('forum_evt_motif_annul')) ;
      if (motif === null) return;
      appel('event_cancel', 'POST', { topic_id: e.topic_id, reason: motif })
        .then(function (r) { r.ok ? rendre() : alerteEvt(tErr(r.data)); });
    };
  }

  function alerteEvt(msg) {
    var z = corps().querySelector('.fo-err');
    if (z) { z.textContent = msg; z.hidden = false; }
  }

  // ── Créer un rendez-vous ───────────────────────────────
  function formulaireEvt() {
    if (!(window.CGAccount && window.CGAccount.requireVerified())) return;
    var natures = ['degustation', 'rencontre', 'artisan', 'salon', 'enligne'];

    corps().innerHTML =
      '<div class="fo-bar"><button class="fo-back-btn">' + t('forum_retour') + '</button></div>' +
      '<div class="fo-form">' +
        '<label>' + t('forum_titre_champ') + '<input class="fo-f-titre" maxlength="140"></label>' +
        '<label>' + t('forum_message_champ') + '<textarea class="fo-f-corps" rows="6"></textarea></label>' +
        '<div class="fo-form-2">' +
          '<label>' + t('forum_evt_debut') + '<input class="fo-f-debut" type="datetime-local"></label>' +
          '<label>' + t('forum_evt_fin') + '<input class="fo-f-fin" type="datetime-local"></label>' +
        '</div>' +
        '<div class="fo-form-2">' +
          '<label>' + t('forum_evt_fuseau') + '<input class="fo-f-tz" value="' + esc(fuseauLecteur() || 'Europe/Paris') + '"></label>' +
          '<label>' + t('forum_evt_nature') +
            '<select class="fo-f-kind">' + natures.map(function (k) {
              return '<option value="' + k + '">' + esc(t('forum_evt_kind_' + k)) + '</option>';
            }).join('') + '</select></label>' +
        '</div>' +
        '<label>' + t('forum_evt_lieu') +
          '<input class="fo-f-lieu" maxlength="160" placeholder="' + esc(t('forum_evt_lieu_aide')) + '"></label>' +
        '<div class="fo-form-2">' +
          '<label>' + t('forum_evt_capacite') + '<input class="fo-f-cap" type="number" min="1" max="9999"></label>' +
          '<label>' + t('forum_langue_champ') +
            '<select class="fo-f-lang">' + optionsLangues() + '</select></label>' +
        '</div>' +
        '<div class="fo-aide">' + esc(t('forum_evt_aide')) + '</div>' +
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
      appel('event_create', 'POST', {
        title:        f.querySelector('.fo-f-titre').value.trim(),
        body:         f.querySelector('.fo-f-corps').value.trim(),
        starts_local: f.querySelector('.fo-f-debut').value,
        ends_local:   f.querySelector('.fo-f-fin').value,
        timezone:     f.querySelector('.fo-f-tz').value.trim(),
        kind:         f.querySelector('.fo-f-kind').value,
        place_label:  f.querySelector('.fo-f-lieu').value.trim(),
        capacity:     parseInt(f.querySelector('.fo-f-cap').value, 10) || 0,
        lang:         f.querySelector('.fo-f-lang').value,
      }).then(function (r) {
        if (!r.ok) { errEl.textContent = tErr(r.data); errEl.hidden = false; return; }
        // Le nouveau rendez-vous doit apparaître sur le globe sans
        // rechargement : sinon il n'y serait qu'à la prochaine visite.
        if (window.rafraichirEvtsGlobe) rafraichirEvtsGlobe();
        aller(section, r.data.id);
      });
    };
  }


  // ══ LES RENDEZ-VOUS SUR LE GLOBE ═══════════════════════
  // C'est ce que ce site sait faire et que personne d'autre n'a : VOIR
  // où ça se passe. Un agenda dit « le 12 septembre à Genève » ; le
  // globe montre Genève, et le lecteur comprend en un coup d'œil si
  // c'est pour lui.
  //
  // Le marqueur est volontairement DIFFÉRENT de ceux des lounges : un
  // losange or qui bat lentement, là où les établissements sont des
  // triangles violets. Un rendez-vous est temporaire, il n'appartient
  // pas à l'atlas — le confondre avec une adresse permanente
  // tromperait.
  //
  // globe.js ne connaît pas le forum : il appelle cette fonction si
  // elle existe, en lui passant ses propres projections. Retirer
  // forum.js ne casse pas le globe.

  var EVTS_GLOBE = [];       // rendez-vous à venir, avec coordonnées
  var evtsCharges = false;

  function chargerEvtsGlobe() {
    if (evtsCharges) return;
    evtsCharges = true;
    // Toutes langues : sur le globe, un point est un point. Filtrer par
    // langue masquerait un rendez-vous qui se tient à côté de chez soi.
    appel('agenda&lang=all').then(function (r) {
      EVTS_GLOBE = ((r.data && r.data.events) || []).filter(function (e) {
        return e.lat !== null && e.lon !== null && e.status === 'upcoming';
      });
      if (EVTS_GLOBE.length && typeof drawGlobe === 'function') drawGlobe();
    }).catch(function () { /* le globe se passe très bien des rendez-vous */ });
  }

  window.dessinerEvenements = function (gc, R, proj, ll2xyz, limbFade, now) {
    if (!EVTS_GLOBE.length) return;
    // Un battement lent : assez pour attirer l'œil, assez lent pour ne
    // pas fatiguer une carte qu'on regarde plusieurs minutes.
    var battement = 0.5 + 0.5 * Math.sin(now / 900);

    for (var i = 0; i < EVTS_GLOBE.length; i++) {
      var e = EVTS_GLOBE[i];
      var p  = ll2xyz(e.lat, e.lon, R);
      var pj = proj(p.x, p.y, p.z);
      var fade = limbFade(pj.z, R);
      if (fade <= 0) continue;

      gc.save();
      gc.globalAlpha = fade;
      gc.translate(pj.x, pj.y - 2);

      // Halo
      gc.globalAlpha = fade * (0.15 + 0.20 * battement);
      gc.beginPath(); gc.arc(0, 0, 11 + 3 * battement, 0, Math.PI * 2);
      gc.fillStyle = '#C9A227'; gc.fill();

      // Losange
      gc.globalAlpha = fade;
      gc.beginPath();
      gc.moveTo(0, -7); gc.lineTo(6, 0); gc.lineTo(0, 7); gc.lineTo(-6, 0);
      gc.closePath();
      gc.fillStyle = '#C9A227'; gc.fill();
      gc.strokeStyle = 'rgba(255,255,255,.85)'; gc.lineWidth = 1.2; gc.stroke();
      gc.restore();
    }
  };

  /** Le globe interroge le forum une seule fois, quand les données sont là. */
  function amorcerEvtsGlobe() {
    // Après le chargement de l'atlas : inutile de concurrencer les
    // requêtes qui font apparaître le globe lui-même.
    if (document.readyState === 'complete') setTimeout(chargerEvtsGlobe, 1200);
    else window.addEventListener('load', function () { setTimeout(chargerEvtsGlobe, 1200); });
  }

  window.rafraichirEvtsGlobe = function () { evtsCharges = false; chargerEvtsGlobe(); };


  /**
   * « Prochain rendez-vous » sur les fiches d'établissement.
   *
   * C'est le lien qui empêche la communauté d'être une île : quelqu'un
   * qui consulte une adresse à Genève apprend qu'on s'y retrouve
   * vendredi, sans avoir jamais ouvert le forum.
   *
   * Une seule requête pour tout le panneau — le serveur du site n'en
   * traite qu'une à la fois, et vingt appels transformeraient
   * l'ouverture d'une fiche pays en attente visible.
   */
  window.ficheEvenementsLounges = function (lounges) {
    var ids = (lounges || []).map(function (l) { return l.id; }).filter(Boolean);
    if (!ids.length) return;

    appel('lounge_events&ids=' + ids.join(',')).then(function (r) {
      var par = (r.data && r.data.by_lounge) || {};
      // Forme au singulier : un seul établissement demandé.
      if (ids.length === 1 && r.data && r.data.events && r.data.events.length) {
        par[ids[0]] = r.data.events;
      }
      Object.keys(par).forEach(function (id) {
        var boite = document.getElementById('lc-evt-' + id);
        var liste = par[id];
        if (!boite || !liste || !liste.length) return;
        var e = liste[0];                   // le plus proche : le seul qui décide
        boite.innerHTML =
          '<button class="lc-evt-btn" data-sujet="' + e.topic_id + '">' +
            '<span class="lc-evt-ey">' + esc(t('lc_prochain_evt')) + '</span>' +
            '<span class="lc-evt-t">' + esc(e.title) + '</span>' +
            '<span class="lc-evt-d">' + esc(dateEvt(e, true)) +
              (liste.length > 1 ? ' · +' + (liste.length - 1) : '') + '</span>' +
          '</button>';
        boite.querySelector('.lc-evt-btn').onclick = function () {
          ouvrir(null, e.topic_id);
        };
      });
    }).catch(function () { /* la fiche se passe très bien des rendez-vous */ });
  };

  // ── Ouvrir un sujet ────────────────────────────────────
  function formulaireSujet() {
    if (!(window.CGAccount && window.CGAccount.requireVerified())) return;
    corps().innerHTML =
      '<div class="fo-bar"><button class="fo-back-btn">' + t('forum_retour') + '</button></div>' +
      '<div class="fo-form">' +
        '<label>' + t('forum_titre_champ') +
          '<input class="fo-f-titre" maxlength="140"></label>' +
        '<label>' + t('forum_message_champ') +
          '<textarea class="fo-f-corps" rows="8"></textarea></label>' +
        '<div class="fo-aide">' + esc(t('forum_aide_format')) + '</div>' +
        zoneImages() +
        '<label>' + t('forum_etiquettes') +
          '<input class="fo-f-tags" placeholder="' + esc(t('forum_etiquettes_aide')) + '"></label>' +
        '<label>' + t('forum_langue_champ') +
          '<select class="fo-f-lang">' + optionsLangues() + '</select></label>' +
        '<div class="fo-err" hidden></div>' +
        '<div class="fo-form-btns">' +
          '<button class="fo-envoyer">' + t('forum_publier') + '</button>' +
          '<button class="fo-annuler">' + t('forum_annuler') + '</button>' +
        '</div>' +
      '</div>';

    var f = corps().querySelector('.fo-form');
    var errEl = f.querySelector('.fo-err');
    brancherImages(f);
    corps().querySelector('.fo-back-btn').onclick = function () { rendre(); };
    f.querySelector('.fo-annuler').onclick = function () { rendre(); };
    f.querySelector('.fo-envoyer').onclick = function () {
      errEl.hidden = true;
      appel('topic_create', 'POST', {
        section:  section || (ancre ? rubriqueDeLAncre(ancre.type) : ''),
        ref_type: ancre ? ancre.type : null,
        ref_id:   ancre ? ancre.id   : null,
        title:   f.querySelector('.fo-f-titre').value.trim(),
        body:    f.querySelector('.fo-f-corps').value.trim(),
        lang:    f.querySelector('.fo-f-lang').value,
        images:  imagesAEnvoyer(),
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
    // Les rubriques disent laquelle porte un agenda : si on arrive
    // directement par une adresse partagée, on ne les a pas encore.
    if (sec && !(donnees.sections || []).length) {
      return appel('sections&lang=' + encodeURIComponent(paramLangues())).then(function (r) {
        donnees.sections = (r.data && r.data.sections) || [];
        aller(sec, sujet, garderEtiquette);
      });
    }
    if (!garderEtiquette && sec !== null) etiquette = null;
    // Revenir aux rubriques quitte l'ancrage : « les discussions sur
    // Cohiba » n'a de sens que tant qu'on regarde Cohiba.
    if (sec === null && !sujet) ancre = null;
    section = sec;
    topicId = sujet || null;
    vue = topicId ? 'topic' : (section || etiquette || ancre ? 'topics' : 'sections');
    if (!topicId) {
      try {
        history.replaceState({}, '', location.pathname + (section ? '?forum=' + section : '?forum=1'));
      } catch (e) {}
    }
    rendre();
  }

  function rendre() {
    if (vue === 'topic')  return rendreTopic();
    // La rubrique marquée « events » n'affiche pas une liste de sujets
    // mais un agenda : le tri utile n'y est pas la dernière réponse,
    // mais la date qui vient. Le filtre par étiquette, lui, retombe sur
    // la liste ordinaire — il traverse toutes les rubriques.
    if (vue === 'topics') return (sectionEstAgenda() && !etiquette && !ancre) ? rendreAgenda() : rendreTopics();
    rendreSections();
  }

  function sectionEstAgenda() {
    var s = (donnees.sections || []).find(function (x) { return x.slug === section; });
    return !!(s && s.events);
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

    amorcerEvtsGlobe();

    // Une adresse partagée ouvre directement la bonne vue.
    var p = new URLSearchParams(location.search);
    if (p.has('sujet'))      ouvrir(null, parseInt(p.get('sujet'), 10));
    else if (p.has('forum')) ouvrir(p.get('forum') === '1' ? null : p.get('forum'), null);
  }

  window.ouvrirForum = ouvrir;

  /**
   * « En discuter » depuis une fiche de l'atlas.
   *
   * C'est ce qu'aucun forum générique ne peut faire : ce site a l'atlas,
   * et une discussion sur un établissement a sa place à côté de sa
   * fiche plutôt que perdue dans une rubrique de deux cents sujets.
   *
   * Le libellé vient de la fiche : le serveur rend l'identifiant, pas le
   * nom d'affichage, et aller le rechercher demanderait une requête de
   * plus pour une information déjà à l'écran.
   */
  window.ouvrirForumRef = function (type, id, label) {
    if (!type || !id) return;
    ancre     = { type: type, id: String(id), label: label || String(id) };
    etiquette = null;
    section   = null;
    topicId   = null;
    vue       = 'topics';
    if (!calque) construire();
    calque.classList.add('open');
    document.body.classList.add('forum-open');
    rendre();
  };
  // Exposée pour le bouton Retour du navigateur (deeplinks.js) : le
  // calque se superpose à tout, c'est donc lui qui se ferme en premier.
  window.fermerForum = fermer;

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', demarrer);
  } else {
    demarrer();
  }
})();
