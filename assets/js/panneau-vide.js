/* ════════════════════════════════════════════════════════
 * panneau-vide.js — Dire qu'aucun pays n'est choisi
 * ────────────────────────────────────────────────────────
 * Sur mobile, la barre du bas propose Infos, Marques et Lounges. Ces
 * trois onglets se touchent AVANT d'avoir choisi un pays — c'est même
 * le geste naturel : on découvre une application par ses onglets.
 *
 * Ce qu'on obtenait alors n'était pas « vide », c'était CASSÉ : un
 * bandeau gris, une croix de fermeture, et une page blanche. Rien ne
 * disait qu'il manquait un choix, ni où le faire. L'impression donnée
 * est celle d'une application en panne, pas d'une application en
 * attente.
 *
 * DEUX EXIGENCES, ET LA SECONDE COMPTE AUTANT QUE LA PREMIÈRE :
 *
 *   · dire ce qui manque — « aucun pays sélectionné » ;
 *   · donner le geste qui répare. Un écran vide qui explique sans
 *     offrir de sortie laisse exactement où l'on était. Le bouton
 *     ramène au globe, là où le choix se fait.
 *
 * Le bandeau se replie : sans pays, il n'a ni drapeau ni nom à montrer,
 * et sa hauteur pleine n'était qu'une bande grise. La croix reste.
 * ════════════════════════════════════════════════════════ */
(function () {
  'use strict';

  function t(k) { return (typeof window.t === 'function' ? window.t(k) : k); }

  // Onglet → panneau, corps, et texte propre à ce panneau. Les trois
  // messages diffèrent parce que les trois attentes diffèrent : on ne
  // cherche pas un lounge comme on cherche une manufacture.
  var PANNEAUX = {
    lex:    { aside: 'lex',           corps: 'lexBody',    cle: 'vide_lex' },
    panel:  { aside: 'panel',         corps: 'panelBody',  cle: 'vide_panel' },
    lounge: { aside: 'lounge-panel',  corps: 'loungeBody', cle: 'vide_lounge' }
  };

  /**
   * Le panneau a-t-il quelque chose à montrer ?
   *
   * On regarde le CORPS, pas la variable de sélection : un pays choisi
   * pour ses lounges ne remplit pas la fiche « Marques », et l'onglet
   * serait alors vide alors qu'une sélection existe bel et bien. Ce qui
   * compte pour le visiteur, c'est ce qu'il a sous les yeux.
   */
  function garni(corps) {
    if (!corps) return true;
    if (corps.querySelector('.pv-boite')) return false;   // notre propre écran
    return (corps.textContent || '').trim().length > 0;
  }

  function poser(onglet) {
    var def = PANNEAUX[onglet];
    if (!def) return false;
    var aside = document.getElementById(def.aside);
    var corps = document.getElementById(def.corps);
    if (!aside || !corps) return false;

    if (garni(corps)) { aside.classList.remove('est-vide'); return false; }

    aside.classList.add('est-vide');
    // `data-i18n` n'est pas decoratif ici : le panneau reste ouvert
    // pendant qu'on change de langue depuis le menu, et sans ces
    // attributs son texte resterait dans l'ancienne. applyLang() les
    // relit, sans qu'il faille rien rebrancher.
    corps.innerHTML =
      '<div class="pv-boite">' +
        '<div class="pv-ico" aria-hidden="true">🌍</div>' +
        '<div class="pv-titre" data-i18n="vide_titre">' + t('vide_titre') + '</div>' +
        '<p class="pv-txt" data-i18n="' + def.cle + '">' + t(def.cle) + '</p>' +
        '<button type="button" class="pv-btn" data-i18n="vide_action">' + t('vide_action') + '</button>' +
      '</div>';

    var btn = corps.querySelector('.pv-btn');
    if (btn) {
      btn.addEventListener('click', function () {
        if (typeof switchMobileTab === 'function') switchMobileTab('globe');
      });
    }
    return true;
  }

  window.panneauVide = poser;
})();
