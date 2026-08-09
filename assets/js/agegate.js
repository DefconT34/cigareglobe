/* agegate.js */
// agegate.js — Portail d'âge
// ════════════════════════════════════════════════════════
// Le cigare est un produit du tabac : l'accès au site est réservé aux
// personnes majeures (§10 de docs/communaute.md). Ce portail est la
// première chose que voit un visiteur, et la seule qu'il voit tant
// qu'il n'a pas répondu.
//
// TROIS CHOSES QUE CE MODULE NE FAIT PAS, ET C'EST VOULU :
//
//   · il ne VÉRIFIE pas l'âge. Aucun site ne le peut sans pièce
//     d'identité. Il fait ce que la loi attend d'un éditeur : avertir
//     et demander, en gardant la trace du refus s'il vient ;
//   · il ne pose pas de cookie. Le choix vit dans localStorage, sur le
//     poste, et ne part jamais au serveur — rien à déclarer, rien à
//     partager, et pas une ligne de plus dans une bannière de consentement ;
//   · il ne géolocalise pas. L'âge légal varie (18 en France, 21 aux
//     États-Unis, 20 au Japon) ; le texte renvoie donc à « l'âge légal
//     dans votre pays », et le seuil affiché est 18.
//
// LE PORTAIL EST VISIBLE PAR DÉFAUT dans le HTML, et c'est un court
// script en tête de page qui le retire pour qui a déjà répondu. L'ordre
// compte : construit à l'envers — masqué par défaut, montré par JS — il
// suffirait de couper JavaScript pour entrer.
// ════════════════════════════════════════════════════════

(function () {
  'use strict';

  var CLE = 'cg_age18';

  function memoire() {
    // Un navigateur en navigation privée stricte lève sur localStorage.
    // Le portail ne doit pas planter pour autant : sans mémoire, on
    // redemande à chaque visite, ce qui est le comportement sûr.
    try { return window.localStorage; } catch (e) { return null; }
  }

  function accepter() {
    var m = memoire();
    try { if (m) m.setItem(CLE, '1'); } catch (e) {}
    document.documentElement.classList.add('age-ok');
    var g = document.getElementById('agegate');
    if (g) g.remove();
    // Le globe attendait derrière : sans ce réveil, il reste sur la
    // dernière image peinte avant l'ouverture du portail.
    if (typeof drawGlobe === 'function') { try { drawGlobe(); } catch (e) {} }
  }

  /**
   * Refus : on ne laisse pas entrer, et on ne stocke rien.
   *
   * Rediriger d'autorité vers un site tiers serait présomptueux — et
   * `history.back()` ramène sur le site quand la page a été ouverte
   * directement. Le portail reste donc en place, avec un message clair
   * et la possibilité de revenir sur sa réponse : quelqu'un qui a cliqué
   * à côté ne doit pas se retrouver enfermé.
   */
  function refuser() {
    var boite = document.querySelector('#agegate .ag-box');
    if (!boite) return;
    boite.classList.add('ag-refus');
    boite.innerHTML =
      '<div class="ag-ey">CIGAR ODYSSEY</div>' +
      '<h1 class="ag-titre">' + t('age_refus_titre') + '</h1>' +
      '<p class="ag-txt">' + t('age_refus_texte') + '</p>' +
      '<div class="ag-btns"><button class="ag-non" id="agRetour">' + t('age_retour') + '</button></div>' +
      '<p class="ag-sante">' + t('age_sante') + '</p>';
    var r = document.getElementById('agRetour');
    if (r) r.onclick = function () { location.reload(); };
  }

  function brancher() {
    var g = document.getElementById('agegate');
    if (!g) return;
    if (document.documentElement.classList.contains('age-ok')) { g.remove(); return; }

    var oui = document.getElementById('agOui');
    var non = document.getElementById('agNon');
    if (oui) oui.onclick = accepter;
    if (non) non.onclick = refuser;

    // Le focus part sur « oui » : au clavier, on ne doit pas avoir à
    // deviner où l'on est. Et il ne sort pas du portail — c'est le
    // propre d'une boîte modale, à plus forte raison de celle-ci.
    if (oui) { try { oui.focus(); } catch (e) {} }
    document.addEventListener('keydown', function (e) {
      if (!document.getElementById('agegate')) return;
      // Échap NE ferme PAS : ce n'est pas une modale d'information.
      if (e.key === 'Escape') { e.preventDefault(); e.stopPropagation(); return; }
      if (e.key !== 'Tab') return;
      var cibles = g.querySelectorAll('button');
      if (!cibles.length) return;
      var premier = cibles[0], dernier = cibles[cibles.length - 1];
      if (e.shiftKey && document.activeElement === premier) { e.preventDefault(); dernier.focus(); }
      else if (!e.shiftKey && document.activeElement === dernier) { e.preventDefault(); premier.focus(); }
    }, true);
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', brancher);
  } else {
    brancher();
  }

  // Exposé pour les tests, et pour un futur lien « changer de réponse ».
  window.portailAge = { accepter: accepter, cle: CLE };
})();
