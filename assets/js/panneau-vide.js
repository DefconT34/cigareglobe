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

  /**
   * Le nom d'un pays vient de la base et traverse le serveur, mais il
   * est injecté ici en HTML : on l'échappe, comme partout ailleurs dans
   * ce projet. Un nom ne contient pas de balise aujourd'hui ; c'est
   * exactement le raisonnement qui finit par en laisser passer une.
   */
  function escapeHtml(s) {
    return String(s == null ? '' : s)
      .replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;')
      .replace(/"/g, '&quot;').replace(/'/g, '&#39;');
  }

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

  /**
   * Le pays actuellement choisi, quel qu'en soit le genre.
   *
   * Les trois variables sont exclusives : chaque chemin de sélection met
   * les deux autres à null (voir interactions.js). On rend la première
   * qui vaut quelque chose.
   */
  function paysChoisi() {
    try {
      if (typeof selCountry       !== 'undefined' && selCountry)       return selCountry;
      if (typeof selLoungeCountry !== 'undefined' && selLoungeCountry) return selLoungeCountry;
      if (typeof selMarket        !== 'undefined' && selMarket)        return selMarket;
    } catch (e) {}
    return null;
  }

  /**
   * VIDER LES TROIS PANNEAUX. Appelé au début de CHAQUE sélection.
   *
   * LE DÉFAUT QU'IL RÉPARE, ET IL N'ÉTAIT PAS COSMÉTIQUE. Quatre chemins
   * mènent à un pays — le globe, la recherche, l'explorateur, un lien
   * partagé — et chacun remplit les panneaux qui le concernent sans
   * toucher aux autres. Choisir Cuba puis la France laissait donc, sous
   * les onglets Infos et Marques, la fiche de CUBA : ses coordonnées,
   * sa production, ses 827 M$, et jusqu'à son nom dans le bandeau.
   *
   * Le visiteur ne voyait pas un panneau périmé, il lisait les données
   * d'un pays sous le nom d'un autre. Une information fausse est pire
   * qu'une information absente : l'absence se voit.
   *
   * On vide AUSSI les bandeaux — nom, région, drapeau. Un corps vide
   * sous un bandeau qui annonce encore « Cuba » n'aurait fait que
   * déplacer le mensonge.
   */
  function reinitialiser() {
    for (var onglet in PANNEAUX) {
      var def   = PANNEAUX[onglet];
      var corps = document.getElementById(def.corps);
      var aside = document.getElementById(def.aside);
      if (corps) corps.innerHTML = '';
      if (aside) {
        aside.classList.remove('est-vide');
        var bandeau = aside.querySelectorAll(
          '.lex-country-name, .lex-country-reg, .lex-flag-emoji,' +
          '.banner-name, .banner-region, .banner-flag');
        for (var i = 0; i < bandeau.length; i++) bandeau[i].textContent = '';
      }
    }
  }

  function poser(onglet) {
    var def = PANNEAUX[onglet];
    if (!def) return false;
    var aside = document.getElementById(def.aside);
    var corps = document.getElementById(def.corps);
    if (!aside || !corps) return false;

    if (garni(corps)) { aside.classList.remove('est-vide'); return false; }

    aside.classList.add('est-vide');

    // DEUX ÉCRANS, PARCE QU'IL Y A DEUX SITUATIONS. « Aucun pays
    // sélectionné » serait FAUX quand la France est choisie et qu'on
    // ouvre l'onglet Marques : un pays l'est bel et bien, il n'est
    // simplement pas producteur. Dire l'un pour l'autre renvoie le
    // visiteur au globe alors qu'il n'a rien à y refaire.
    var pays  = paysChoisi();
    var titre = pays ? (pays.name || '') : t('vide_titre');
    var texte = pays ? t('vide_non_producteur') : t(def.cle);
    var libAction = pays && onglet !== 'lounge' ? t('vide_voir_lounges') : t('vide_action');

    // `data-i18n` n'est pas decoratif ici : le panneau reste ouvert
    // pendant qu'on change de langue depuis le menu, et sans ces
    // attributs son texte resterait dans l'ancienne. applyLang() les
    // relit, sans qu'il faille rien rebrancher. Le NOM DU PAYS, lui,
    // n'en porte pas : il ne se traduit pas d'une langue à l'autre.
    corps.innerHTML =
      '<div class="pv-boite">' +
        // LE MÊME GLOBE DANS LES DEUX CAS. Le premier jet mettait 🚭
        // quand un pays était choisi : à côté de « France », ce
        // pictogramme dit « interdiction de fumer », ce qui n'est pas
        // ce que la phrase affirme. La distinction se porte dans le
        // titre et le texte, pas dans une icône qui parle d'autre chose.
        '<div class="pv-ico" aria-hidden="true">🌍</div>' +
        '<div class="pv-titre"' + (pays ? '' : ' data-i18n="vide_titre"') + '>' +
          escapeHtml(titre) + '</div>' +
        '<p class="pv-txt" data-i18n="' + (pays ? 'vide_non_producteur' : def.cle) + '">' +
          escapeHtml(texte) + '</p>' +
        '<button type="button" class="pv-btn" data-i18n="' +
          (pays && onglet !== 'lounge' ? 'vide_voir_lounges' : 'vide_action') + '">' +
          escapeHtml(libAction) + '</button>' +
      '</div>';

    var btn = corps.querySelector('.pv-btn');
    if (btn) {
      btn.addEventListener('click', function () {
        if (typeof switchMobileTab !== 'function') return;
        // Un pays est choisi : ce qu'on a à lui montrer est sous
        // l'onglet des lounges, pas sur le globe qu'il vient de quitter.
        switchMobileTab(pays && onglet !== 'lounge' ? 'lounge' : 'globe');
      });
    }
    return true;
  }

  window.panneauVide = poser;
  // Appelée par CHAQUE chemin de sélection — le globe, la recherche,
  // l'explorateur, un lien partagé. Voir reinitialiser() pour ce que le
  // manquement coûtait.
  window.reinitialiserPanneaux = reinitialiser;
})();
