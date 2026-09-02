/* ════════════════════════════════════════════════════════
 * tutoriel.js — La visite guidée de la première fois
 * ────────────────────────────────────────────────────────
 * Un visiteur qui arrive voit un globe et une dizaine de boutons muets.
 * Le globe se comprend seul ; la recherche, l'explorateur et la boîte à
 * remarques, non — ils se découvrent par hasard ou jamais.
 *
 * TROIS RÈGLES, ET ELLES EXPLIQUENT TOUT LE FICHIER :
 *
 *   · UNE SEULE FOIS. Le didacticiel qu'on revoit à chaque visite est
 *     une nuisance. Le choix vit dans localStorage, sur le poste, et ne
 *     part jamais au serveur — même doctrine que le portail d'âge.
 *
 *   · IL MONTRE DES BOUTONS QUI EXISTENT. Chaque étape désigne des
 *     éléments RÉELS, résolus au moment de l'ouverture. Absents ou
 *     invisibles — et beaucoup le sont sur mobile, repliés dans le menu —
 *     l'étape est écartée et les suivantes se renumérotent. Pointer une
 *     flèche vers du vide est pire que ne rien expliquer.
 *
 *   · IL NE PASSE JAMAIS DEVANT CE QU'ON EST VENU CHERCHER. Une adresse
 *     qui porte des paramètres vient d'un lien partagé : le visiteur
 *     voulait cette fiche-là, pas une visite guidée.
 *
 * Il s'ouvre après le portail d'âge, jamais pendant : le portail est le
 * seul écran qui n'admet rien au-dessus de lui.
 * ════════════════════════════════════════════════════════ */
(function () {
  'use strict';

  var CLE = 'cg_tuto';

  // Le repli sur la clé évite un écran muet si le dictionnaire n'est pas
  // encore chargé — même précaution que suggestion.js.
  function t(k) { return (typeof window.t === 'function' ? window.t(k) : k); }

  function memoire() {
    // Navigation privée stricte : localStorage lève. Sans mémoire, on
    // s'abstient plutôt que de rejouer la visite à chaque page.
    try { return window.localStorage; } catch (e) { return null; }
  }
  function dejaVu() {
    var m = memoire();
    if (!m) return true;
    try { return m.getItem(CLE) === '1'; } catch (e) { return true; }
  }
  function marquerVu() {
    var m = memoire();
    try { if (m) m.setItem(CLE, '1'); } catch (e) {}
  }

  /* ── Les étapes ───────────────────────────────────────────
     `cibles` est une liste de replis, essayés dans l'ordre : le premier
     élément VISIBLE gagne. C'est ce qui fait tenir la visite sur mobile,
     où le compte n'est pas dans l'en-tête mais derrière le hamburger. */
  var ETAPES = [
    { cle: 'tuto_globe',    cibles: ['#globe-wrap'] },
    { cle: 'tuto_chercher', cibles: ['#search-btn'] },
    { cle: 'tuto_explorer', cibles: ['#explorer-btn'] },
    { cle: 'tuto_compte',   cibles: ['#accountBtn', '#mobile-menu-btn'] },
    { cle: 'tuto_remarque', cibles: ['#sugg-btn'] },
    // EN DERNIER, ET SUR LE GLOBE. On revient d'où l'on est parti, et
    // cette fois on lit ce qu'on y voit : le site n'a AUCUNE légende
    // (celle du bas de page a disparu, son CSS seul a survécu), si bien
    // que rien n'explique pourquoi certains pays portent une pastille
    // et d'autres un triangle.
    { cle: 'tuto_reperes', cibles: ['#globe-wrap'], legende: true }
  ];

  /**
   * Un élément est-il montrable ?
   *
   * getBoundingClientRect suffit pour `display:none` (tout à zéro) mais
   * pas pour `visibility:hidden` ni `opacity:0`, qui occupent la place
   * sans rien montrer. Les trois sont employés dans les feuilles du
   * site selon la largeur de l'écran.
   */
  function visible(el) {
    if (!el || !el.getBoundingClientRect) return false;
    var r = el.getBoundingClientRect();
    if (r.width < 1 || r.height < 1) return false;
    if (r.bottom < 0 || r.right < 0) return false;
    if (r.top > window.innerHeight || r.left > window.innerWidth) return false;
    var s = window.getComputedStyle(el);
    return s.visibility !== 'hidden' && s.display !== 'none' && parseFloat(s.opacity) > 0.05;
  }

  function resoudre(etape) {
    for (var i = 0; i < etape.cibles.length; i++) {
      var el = document.querySelector(etape.cibles[i]);
      if (visible(el)) return el;
    }
    return null;
  }

  /** Les étapes qui ont trouvé leur cible, dans l'ordre. */
  function etapesTenables() {
    var vivantes = [];
    for (var i = 0; i < ETAPES.length; i++) {
      var el = resoudre(ETAPES[i]);
      if (el) vivantes.push({ cle: ETAPES[i].cle, el: el, legende: !!ETAPES[i].legende });
    }
    return vivantes;
  }

  var etapes = [], index = 0, voile = null, bulle = null, trou = null;

  /* ── Peinture ─────────────────────────────────────────── */

  /**
   * Placer la bulle près de sa cible.
   *
   * Une cible qui mange plus de la moitié de l'écran — le globe — n'a
   * pas de « à côté » : la bulle se met au centre et le projecteur
   * s'efface, sinon on éclaire tout et on n'a rien désigné.
   */
  function placer(el) {
    var r    = el.getBoundingClientRect();
    var vw   = window.innerWidth, vh = window.innerHeight;
    var vaste = (r.width * r.height) > (vw * vh * 0.5);

    // Le voile est transparent : c'est l'ombre portée du « trou » qui
    // assombrit le reste (voir .tuto-trou). Sans trou, il faut donc lui
    // rendre un fond, sinon la page reste en pleine lumière.
    if (vaste) {
      trou.style.display = 'none';
      voile.classList.add('plein');
      bulle.style.left = '50%';
      bulle.style.top  = '50%';
      bulle.style.transform = 'translate(-50%, -50%)';
      return;
    }

    trou.style.display = 'block';
    voile.classList.remove('plein');
    var m = 8;
    trou.style.left   = (r.left - m) + 'px';
    trou.style.top    = (r.top - m) + 'px';
    trou.style.width  = (r.width + m * 2) + 'px';
    trou.style.height = (r.height + m * 2) + 'px';

    bulle.style.transform = 'none';
    var bb   = bulle.getBoundingClientRect();
    var marge = 12, ecart = 16;

    // Dessous si la place y est, dessus sinon. Le bas de l'écran est
    // occupé par la colonne de boutons flottants : la plupart des
    // étapes finissent donc au-dessus, et c'est très bien.
    var bas = r.bottom + ecart;
    var top = (bas + bb.height + marge <= vh) ? bas : (r.top - ecart - bb.height);
    if (top < marge) top = marge;

    var left = r.left + r.width / 2 - bb.width / 2;
    if (left < marge) left = marge;
    if (left + bb.width > vw - marge) left = vw - marge - bb.width;

    bulle.style.left = Math.round(left) + 'px';
    bulle.style.top  = Math.round(top) + 'px';
  }

  /**
   * La légende des repères du globe.
   *
   * Les marques sont DESSINÉES en CSS, et non décrites par des mots :
   * « triangle violet » se cherche encore une fois l'écran revenu,
   * tandis qu'un triangle violet se reconnaît. La forme est la clé, pas
   * son nom — et la couleur d'un producteur lui étant propre, sa
   * pastille porte ici les trois teintes réellement employées.
   */
  function legende() {
    var lignes = ['prod', 'mixte', 'lounge', 'marche'];
    var html = '<ul class="tuto-leg">';
    for (var i = 0; i < lignes.length; i++) {
      html += '<li><span class="tuto-m tuto-m-' + lignes[i] + '" aria-hidden="true"></span>' +
              '<span>' + t('tuto_leg_' + lignes[i]) + '</span></li>';
    }
    return html + '</ul>';
  }

  function peindre() {
    var e = etapes[index];
    var dernier = (index === etapes.length - 1);

    var points = '';
    for (var i = 0; i < etapes.length; i++) {
      points += '<span class="tuto-pt' + (i === index ? ' on' : '') + '"></span>';
    }

    bulle.innerHTML =
      '<div class="tuto-hdr">' +
        '<span class="tuto-titre">' + t(e.cle + '_t') + '</span>' +
        '<button type="button" class="tuto-x" aria-label="' + t('tuto_passer') + '">✕</button>' +
      '</div>' +
      '<p class="tuto-txt">' + t(e.cle + '_d') + '</p>' +
      (e.legende ? legende() : '') +
      '<div class="tuto-pied">' +
        '<div class="tuto-pts" aria-hidden="true">' + points + '</div>' +
        '<button type="button" class="tuto-skip">' + t('tuto_passer') + '</button>' +
        '<button type="button" class="tuto-next">' +
          (dernier ? t('tuto_terminer') : t('tuto_suivant')) + '</button>' +
      '</div>';

    bulle.setAttribute('aria-label',
      t('tuto_etape').replace('{n}', index + 1).replace('{total}', etapes.length));

    bulle.querySelector('.tuto-x').addEventListener('click', fermer);
    bulle.querySelector('.tuto-skip').addEventListener('click', fermer);
    bulle.querySelector('.tuto-next').addEventListener('click', suivant);

    placer(e.el);
    try { bulle.querySelector('.tuto-next').focus(); } catch (err) {}
  }

  function suivant() {
    if (index >= etapes.length - 1) { fermer(); return; }
    index++;
    // La cible d'une étape peut avoir disparu depuis l'ouverture — une
    // barre repliée, un panneau fermé. On la revérifie, et on saute.
    while (index < etapes.length && !visible(etapes[index].el)) index++;
    if (index >= etapes.length) { fermer(); return; }
    peindre();
  }

  function auClavier(ev) {
    if (!voile) return;
    if (ev.key === 'Escape') { ev.preventDefault(); fermer(); return; }
    if (ev.key === 'Enter' || ev.key === 'ArrowRight') { ev.preventDefault(); suivant(); return; }
    if (ev.key !== 'Tab') return;
    // Le focus ne sort pas de la bulle : derrière, tout est inerte.
    var cibles = bulle.querySelectorAll('button');
    if (!cibles.length) return;
    var premier = cibles[0], dernier = cibles[cibles.length - 1];
    if (ev.shiftKey && document.activeElement === premier) { ev.preventDefault(); dernier.focus(); }
    else if (!ev.shiftKey && document.activeElement === dernier) { ev.preventDefault(); premier.focus(); }
  }

  function auRedimensionnement() {
    if (voile && etapes[index]) placer(etapes[index].el);
  }

  function fermer() {
    // Fermée d'un ✕, d'un « Passer » ou d'Échap : dans les trois cas la
    // personne a dit non. On ne la relancera pas.
    marquerVu();
    document.removeEventListener('keydown', auClavier, true);
    window.removeEventListener('resize', auRedimensionnement);
    if (voile) { voile.remove(); voile = null; bulle = null; trou = null; }
  }

  /* ── Ouverture ────────────────────────────────────────── */

  function ouvrir() {
    if (voile) return false;
    if (document.getElementById('agegate')) return false;   // le portail passe avant

    etapes = etapesTenables();
    // Une visite d'une seule étape n'est pas une visite : c'est une
    // interruption. Mieux vaut ne rien montrer et laisser explorer.
    if (etapes.length < 2) return false;
    index = 0;

    voile = document.createElement('div');
    voile.className = 'tuto-voile';
    voile.innerHTML = '<div class="tuto-trou"></div>' +
                      '<div class="tuto-bulle" role="dialog" aria-modal="true"></div>';
    document.body.appendChild(voile);
    trou  = voile.querySelector('.tuto-trou');
    bulle = voile.querySelector('.tuto-bulle');

    // Le voile avale les clics : pendant la visite, la page ne bouge
    // pas sous le doigt. Cliquer à côté ferme, comme toute modale
    // d'information — le portail d'âge est le seul à ne pas le faire.
    voile.addEventListener('click', function (ev) { if (ev.target === voile) fermer(); });
    document.addEventListener('keydown', auClavier, true);
    window.addEventListener('resize', auRedimensionnement);

    peindre();
    requestAnimationFrame(function () { if (voile) voile.classList.add('show'); });
    return true;
  }

  /* ── Quand se déclencher ──────────────────────────────── */

  /**
   * Le premier rendu ne suffit pas : les boutons 🔍 et 🗺 sont posés par
   * leurs modules après le chargement des données, et l'écran de
   * chargement couvre encore tout. On attend qu'il s'efface, puis on
   * laisse un temps de battement aux modules retardataires.
   */
  function quandPret(fn) {
    var essais = 0;
    (function attendre() {
      var ov = document.getElementById('loading-overlay');
      var couvert = ov && window.getComputedStyle(ov).display !== 'none';
      if (!couvert || essais > 60) { setTimeout(fn, 700); return; }
      essais++;
      setTimeout(attendre, 200);
    })();
  }

  function peutSeLancer() {
    if (dejaVu()) return false;
    // Une adresse qui porte des paramètres ou une ancre vient d'un lien
    // partagé : deeplinks.js va ouvrir une fiche précise, et la visite
    // guidée s'y superposerait.
    if (window.location.search.length > 1) return false;
    if (window.location.hash.length > 1) return false;
    return document.documentElement.classList.contains('age-ok');
  }

  function lancerSiPremiereFois() {
    if (!peutSeLancer()) return;
    quandPret(function () { if (peutSeLancer()) ouvrir(); });
  }

  /** Appelé par agegate.js dès que le visiteur déclare son âge. */
  function apresPortail() { lancerSiPremiereFois(); }

  /** Revoir la visite : on force, et on ne consulte pas la mémoire. */
  function revoir() { return ouvrir(); }

  function brancher() {
    var revoirBtn = document.getElementById('mm-tuto');
    if (revoirBtn) {
      revoirBtn.addEventListener('click', function () {
        // Refermer le menu mobile, sinon il recouvrirait la visite.
        var menu = document.getElementById('mobile-menu');
        var voileMenu = document.getElementById('mmenu-scrim');
        if (menu) menu.classList.remove('open');
        if (voileMenu) voileMenu.hidden = true;
        setTimeout(revoir, 260);
      });
    }
    // « ? » relance la visite au clavier, sauf pendant une saisie.
    document.addEventListener('keydown', function (ev) {
      if (ev.key !== '?' || voile) return;
      var a = document.activeElement, n = a ? a.tagName : '';
      if (n === 'INPUT' || n === 'TEXTAREA' || (a && a.isContentEditable)) return;
      ev.preventDefault();
      revoir();
    });
    lancerSiPremiereFois();
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', brancher);
  } else {
    brancher();
  }

  window.tutoriel = {
    ouvrir: revoir,
    fermer: fermer,
    apresPortail: apresPortail,
    etapesTenables: etapesTenables,   // exposé pour les vérifications
    cle: CLE
  };
})();
