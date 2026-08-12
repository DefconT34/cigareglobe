/* indice.js */
// ════════════════════════════════════════════════════════
// indice.js — Dire quoi faire, une fois
// ────────────────────────────────────────────────────────
// Après le portail d'âge, on tombe sur un globe qui tourne. Rien ne dit
// qu'il se clique. Les visiteurs qui l'ont compris l'ont compris ; les
// autres regardent une animation.
//
// Trois règles, qui font la différence entre un indice et une gêne :
//
//   1. il ne s'affiche QU'UNE FOIS — mémorisé sur le poste, comme la
//      réponse au portail d'âge, et pour la même raison : rien ne part
//      au serveur, rien à déclarer dans une bannière ;
//   2. il n'attend pas d'être lu — il s'efface au premier geste, quel
//      qu'il soit, et de toute façon au bout de douze secondes ;
//   3. il n'intercepte AUCUN clic (`pointer-events: none`). Un indice
//      qui empêche de faire ce qu'il conseille serait une farce.
//
// Il ne paraît pas non plus quand l'adresse porte déjà une cible
// (?country=…, ?brand=…) : on arrive alors par un lien partagé, sur une
// fiche qui s'ouvre toute seule — expliquer le globe à ce moment-là,
// c'est expliquer une porte à quelqu'un qui est déjà entré.
// ════════════════════════════════════════════════════════

(function () {
  'use strict';

  var CLE   = 'cg_indice_globe';
  var DELAI = 12000;

  function memoire() {
    // Navigation privée stricte : localStorage lève. Sans mémoire on
    // remontrerait l'indice à chaque visite — on préfère se taire.
    try { return window.localStorage; } catch (e) { return null; }
  }

  function dejaVu() {
    var m = memoire();
    if (!m) return true;
    try { return m.getItem(CLE) === 'vu'; } catch (e) { return true; }
  }

  function retenir() {
    var m = memoire();
    try { if (m) m.setItem(CLE, 'vu'); } catch (e) {}
  }

  function texte() {
    // t() vient d'i18n.js ; en son absence (ordre de chargement modifié),
    // le français plutôt qu'une clé nue à l'écran.
    if (typeof t === 'function') {
      var s = t('indice_globe');
      if (s && s !== 'indice_globe') return s;
    }
    return 'Choisissez un pays sur le globe';
  }

  function poser() {
    var hote = document.getElementById('globe-wrap');
    if (!hote || document.getElementById('globe-indice')) return;

    var el = document.createElement('div');
    el.id = 'globe-indice';
    // aria-hidden : la même information est déjà donnée au clavier et
    // au lecteur d'écran par #globe-help, en plus complet. La répéter
    // ici ferait dire deux fois la même chose.
    el.setAttribute('aria-hidden', 'true');
    el.innerHTML = '<span class="gi-main">' + esc(texte()) + '</span>';
    hote.appendChild(el);
    // La classe d'entrée est posée à la frame suivante : appliquée dans
    // le même lot que l'insertion, la transition n'aurait pas d'état de
    // départ et l'indice apparaîtrait d'un coup.
    requestAnimationFrame(function () { el.classList.add('vu'); });

    var minuteur = setTimeout(effacer, DELAI);

    function effacer() {
      clearTimeout(minuteur);
      retenir();
      el.classList.remove('vu');
      // Retiré après la transition, pas pendant : un élément supprimé
      // n'a pas le temps de s'effacer.
      setTimeout(function () { if (el.parentNode) el.parentNode.removeChild(el); }, 400);
      gestes.forEach(function (g) {
        document.removeEventListener(g, effacer, true);
      });
    }

    // En capture, et sur le document : le geste peut viser le canvas,
    // un bouton d'en-tête ou la liste accessible — dans tous les cas la
    // personne a compris qu'il y avait quelque chose à faire.
    var gestes = ['pointerdown', 'keydown', 'wheel', 'touchstart'];
    gestes.forEach(function (g) {
      document.addEventListener(g, effacer, true);
    });
  }

  function esc(s) {
    return String(s).replace(/[&<>"']/g, function (c) {
      return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c];
    });
  }

  function demarrer() {
    if (dejaVu()) return;
    // Un lien partagé ouvre déjà une fiche : l'indice n'aurait plus
    // d'objet, et se poserait par-dessus.
    if (/[?&](country|lounge|market|brand|forum|sujet)=/.test(location.search)) return;

    // Le portail d'âge se dresse au-dessus de tout : l'indice attendrait
    // derrière lui, et ses douze secondes s'écouleraient sans que
    // personne ne le voie.
    if (document.documentElement.classList.contains('age-ok')) { poser(); return; }
    var obs = new MutationObserver(function () {
      if (document.documentElement.classList.contains('age-ok')) {
        obs.disconnect();
        poser();
      }
    });
    obs.observe(document.documentElement, { attributes: true, attributeFilter: ['class'] });
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', demarrer);
  } else {
    demarrer();
  }
})();
