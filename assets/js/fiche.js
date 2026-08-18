/* fiche.js */
// fiche.js — Encart pratique du pays : devise, langue, heure, distance
//
// ════════════════════════════════════════════════════════
// EMPLACEMENT : le PANNEAU GAUCHE, celui des données de pays. Il portait
// déjà des lignes « Devise », « Langue » et « Fuseau » — un encart de
// plus à droite faisait donc doublon, et c'est pourquoi il a été retiré.
//
// Ces lignes existantes ont un défaut que le déplacement corrige : elles
// viennent de `producer_geo`, table SANS AUCUNE COLONNE DE LANGUE et
// absente du plan de traduction. « Peso cubain (CUP) », « Espagnol »,
// « UTC−5 » s'affichaient donc en français dans les six langues. Le
// balayage i18n ne l'avait jamais vu : il n'ouvre pas de fiche pays.
//
// Intl règle cela sans ajouter une seule chaîne à traduire — il nomme
// devise, langue et fuseau dans la langue du visiteur. La valeur de la
// base sert de repli quand le pays n'est pas dans data.pays.js.
//
// L'heure est VIVANTE, là où `geo.timezone` ne donnait qu'un décalage
// figé : un horodatage vieillirait sous les yeux de qui laisse la fiche
// ouverte. Rafraîchie à la minute, et l'intervalle est arrêté avec la
// fiche — la leçon des drapeaux, dont trois boucles tournaient
// indéfiniment après fermeture.
//
// La DISTANCE se pose à côté des coordonnées : c'est la même question —
// « où est-ce, par rapport à moi ».
// ════════════════════════════════════════════════════════

(function () {
  'use strict';

  var _horloge = null;
  // Position de l'utilisateur, en mémoire seulement, pour la session.
  // Jamais écrite sur le disque, jamais envoyée : la distance se calcule
  // ici, dans le navigateur. Partagée avec le formulaire de contribution
  // pour ne demander l'autorisation qu'une fois.
  window.positionUtilisateur = window.positionUtilisateur || null;

  function iso(pays) {
    return (window.isoDepuisDrapeau && pays) ? window.isoDepuisDrapeau(pays.flag) : '';
  }

  /** Nom localisé, avec repli sur le code brut si Intl ne connaît pas. */
  function nomDe(type, code, lang) {
    try {
      var n = new Intl.DisplayNames([lang], { type: type }).of(code);
      return n && n !== code ? n : code;
    } catch (e) { return code; }
  }

  function langueCourante() {
    return window.currentLang || 'fr';
  }

  /** Heure locale du pays + nom court du fuseau. */
  function heureLocale(fuseau, lang) {
    try {
      var h = new Intl.DateTimeFormat(lang, {
        timeZone: fuseau, hour: '2-digit', minute: '2-digit'
      }).format(new Date());
      var parts = new Intl.DateTimeFormat(lang, {
        timeZone: fuseau, timeZoneName: 'short'
      }).formatToParts(new Date());
      var nom = '';
      for (var i = 0; i < parts.length; i++) {
        if (parts[i].type === 'timeZoneName') nom = parts[i].value;
      }
      return { heure: h, fuseau: nom };
    } catch (e) {
      // Fuseau inconnu du moteur : mieux vaut ne rien afficher qu'une
      // heure fausse prise sur le poste du visiteur.
      return null;
    }
  }

  /**
   * Distance orthodromique, en kilomètres.
   * Formule de haversine — la Terre n'est pas plate, et sur des
   * distances intercontinentales l'écart avec un calcul plan se compte
   * en milliers de kilomètres.
   */
  function distanceKm(lat1, lon1, lat2, lon2) {
    var R = 6371, r = Math.PI / 180;
    var dLat = (lat2 - lat1) * r, dLon = (lon2 - lon1) * r;
    var a = Math.sin(dLat / 2) * Math.sin(dLat / 2)
          + Math.cos(lat1 * r) * Math.cos(lat2 * r) * Math.sin(dLon / 2) * Math.sin(dLon / 2);
    return 2 * R * Math.asin(Math.min(1, Math.sqrt(a)));
  }

  function formateKm(km, lang) {
    var n = km < 100 ? Math.round(km * 10) / 10 : Math.round(km);
    try {
      return new Intl.NumberFormat(lang, {
        style: 'unit', unit: 'kilometer', unitDisplay: 'short',
        maximumFractionDigits: km < 100 ? 1 : 0
      }).format(n);
    } catch (e) {
      return n.toLocaleString(lang) + ' km';
    }
  }

  /**
   * Valeurs localisées pour les lignes du panneau gauche.
   * Retourne null si le pays n'est pas dans la table — l'appelant garde
   * alors les valeurs de la base.
   */
  function ficheInfos(pays) {
    var code = iso(pays);
    // Un territoire qui arbore le drapeau de son Etat heriterait de la
    // ligne de cet Etat. Les Canaries affichaient ainsi l'heure de
    // Madrid, une heure de trop toute l'annee. La table par identifiant
    // passe donc AVANT celle par drapeau.
    var propre = (window.TERRITOIRES_INFOS || {})[pays && pays.id];
    var d = propre || (window.PAYS_INFOS || {})[code];
    if (!d) return null;
    var lang = langueCourante();
    var h = heureLocale(d[2], lang);
    return {
      // Le code ISO n'est ajoute que si le nom localise n'en porte pas
      // deja un entre parentheses : Intl rend « franc CFA (BEAC) », et y
      // accoler « (XAF) » donnait « franc CFA (BEAC) (XAF) ».
      devise:  (function (n) { return /\(/.test(n) ? n : n + ' (' + d[0] + ')'; })(nomDe('currency', d[0], lang)),
      langue:  d[1].split(',').map(function (l) { return nomDe('language', l, lang); }).join(' · '),
      heure:   h ? h.heure : null,
      fuseau:  h ? h.fuseau : null,
      // L'asterisque « plusieurs fuseaux » vient de PAYS_MULTIFUSEAUX,
      // indexe par code ISO — donc par DRAPEAU. Un territoire qui a sa
      // propre ligne l'heritait de son Etat : les Canaries, qui n'ont
      // qu'un fuseau et affichent desormais le bon, se voyaient
      // signalees « plusieurs fuseaux » parce que l'Espagne l'est.
      //
      // Corriger le fuseau sans corriger l'asterisque n'aurait repare
      // que la moitie de la fiche. Une ligne propre decrit un
      // territoire a un seul fuseau, par construction.
      multi:   propre ? false : (window.PAYS_MULTIFUSEAUX || []).indexOf(code) !== -1,
      zone:    d[2]
    };
  }

  /**
   * Puce de distance, à poser à côté des coordonnées.
   *
   * Affiche la distance si la position est déjà connue, propose de la
   * calculer sinon. On ne demande JAMAIS la géolocalisation d'office :
   * l'autorisation se demande sur un geste, pas à l'ouverture d'une fiche.
   */
  function ficheDistanceHtml(pays) {
    if (pays.lat == null || pays.lon == null) return '';
    // Une rangee a part, sous la coordonnee, separee par un filet : le
    // libelle « Calculer la distance » ne tient pas a cote de « 04°N
    // 12°E » dans un panneau de 280 px, et les serrer sur une ligne
    // donnait ce cartouche a l'etroit.
    if (window.positionUtilisateur) {
      var km = distanceKm(window.positionUtilisateur.lat, window.positionUtilisateur.lon, pays.lat, pays.lon);
      return '<span class="lex-dist" id="lex-dist">↔ ' + _echap(formateKm(km, langueCourante())) + '</span>';
    }
    return '<button type="button" class="lex-dist-btn" id="lex-dist-btn">'
         + '<span aria-hidden="true">↔</span> ' + _echap(t('fiche_distance_btn')) + '</button>';
  }

  function _echap(s) {
    return String(s == null ? '' : s).replace(/[&<>"']/g, function (c) {
      return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c];
    });
  }

  /** Démarre l'horloge et câble le bouton. À appeler après l'injection. */
  function ficheActiver(pays) {
    ficheArreter();
    var code = iso(pays);
    var d = (window.PAYS_INFOS || {})[code];

    if (d) {
      _horloge = setInterval(function () {
        var el = document.getElementById('lex-heure');
        // L'élément disparaît avec la fiche : c'est le signal d'arrêt le
        // plus sûr, il ne dépend d'aucun appelant.
        if (!el) { ficheArreter(); return; }
        var h = heureLocale(d[2], langueCourante());
        if (h) el.textContent = h.heure;
      }, 20000);
    }

    var btn = document.getElementById('lex-dist-btn');
    if (btn) btn.addEventListener('click', function () {
      if (!navigator.geolocation) { btn.textContent = t('contrib_geo_indispo'); return; }
      btn.disabled = true;
      btn.textContent = t('contrib_geo_encours');
      navigator.geolocation.getCurrentPosition(function (p) {
        window.positionUtilisateur = { lat: p.coords.latitude, lon: p.coords.longitude };
        var km = distanceKm(p.coords.latitude, p.coords.longitude, pays.lat, pays.lon);
        var s = document.createElement('span');
        s.className = 'lex-dist'; s.id = 'lex-dist';
        s.textContent = '↔ ' + formateKm(km, langueCourante());
        if (btn.parentNode) btn.parentNode.replaceChild(s, btn);
        // Les fiches d'établissement affichent la même distance : elles
        // doivent en profiter sans que l'utilisateur re-autorise.
        if (window.rafraichirDistancesLounges) window.rafraichirDistancesLounges();
      }, function (err) {
        btn.disabled = false;
        btn.textContent = (err && err.code === 1) ? t('contrib_geo_refus') : t('contrib_geo_echec');
      }, { timeout: 12000, maximumAge: 300000 });
    });
  }

  function ficheArreter() {
    if (_horloge) { clearInterval(_horloge); _horloge = null; }
  }

  window.ficheInfos        = ficheInfos;
  window.ficheDistanceHtml = ficheDistanceHtml;
  window.ficheActiver      = ficheActiver;
  window.formateKm         = formateKm;
  window.ficheArreter  = ficheArreter;
  window.distanceKm    = distanceKm;
})();
