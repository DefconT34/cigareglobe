/* fiche.js */
// fiche.js — Encart pratique du pays : devise, langue, heure, distance
//
// ════════════════════════════════════════════════════════
// EMPLACEMENT : juste sous le badge de niveau, avant l'encadré des
// revenus. C'est le premier bloc après le nom du pays, et c'est
// volontaire — l'heure qu'il est là-bas et la monnaie qu'on y paie
// répondent à des questions qu'on se pose AVANT de lire les chiffres de
// production. Plus bas, l'encart aurait été noyé entre les régions, les
// variétés et les marques.
//
// Rien n'est traduit ici : les noms de devise, de langue et de fuseau
// viennent d'Intl, dans la langue du visiteur. Seuls les quatre
// intitulés passent par t(). Voir data.pays.js.
//
// L'heure est VIVANTE : un horodatage figé au rendu vieillirait sous les
// yeux de l'utilisateur qui laisse la fiche ouverte. Elle est rafraîchie
// à la minute, et l'intervalle est arrêté avec la fiche — la leçon des
// drapeaux, dont trois boucles tournaient indéfiniment après fermeture.
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

  function ligne(cle, valeur, extra) {
    return '<div class="fiche-item"' + (extra || '') + '>'
         + '<span class="fiche-k">' + t(cle) + '</span>'
         + '<span class="fiche-v">' + valeur + '</span></div>';
  }

  /** Bloc HTML complet, ou '' si le pays n'est pas dans la table. */
  function ficheHtml(pays) {
    var code = iso(pays);
    var d = (window.PAYS_INFOS || {})[code];
    if (!d) return '';

    var lang = langueCourante();
    var items = '';

    items += ligne('fiche_devise', _echap(nomDe('currency', d[0], lang)) + ' <em>' + _echap(d[0]) + '</em>');

    var langues = d[1].split(',').map(function (l) { return nomDe('language', l, lang); });
    items += ligne('fiche_langue', _echap(langues.join(' · ')));

    var h = heureLocale(d[2], lang);
    if (h) {
      var multi = (window.PAYS_MULTIFUSEAUX || []).indexOf(code) !== -1;
      items += '<div class="fiche-item">'
             + '<span class="fiche-k">' + t('fiche_heure') + '</span>'
             + '<span class="fiche-v"><strong id="fiche-heure">' + _echap(h.heure) + '</strong> '
             + '<em>' + _echap(h.fuseau) + '</em>'
             + (multi ? '<span class="fiche-note" title="' + _echap(t('fiche_multifuseau')) + '">*</span>' : '')
             + '</span></div>';
    }

    // Distance : affichée si la position est déjà connue, proposée sinon.
    // On ne demande jamais la géolocalisation d'office — l'autorisation
    // se demande sur un geste, pas à l'ouverture d'une fiche.
    if (window.positionUtilisateur && pays.lat != null && pays.lon != null) {
      var km = distanceKm(window.positionUtilisateur.lat, window.positionUtilisateur.lon, pays.lat, pays.lon);
      items += ligne('fiche_distance', _echap(formateKm(km, lang)));
    } else if (pays.lat != null && pays.lon != null) {
      items += '<div class="fiche-item">'
             + '<span class="fiche-k">' + t('fiche_distance') + '</span>'
             + '<span class="fiche-v"><button type="button" class="fiche-geo" id="fiche-geo-btn">'
             + t('fiche_distance_btn') + '</button></span></div>';
    }

    return '<div class="fiche-pays" id="fiche-pays">' + items + '</div>';
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
    if (!d) return;

    _horloge = setInterval(function () {
      var el = document.getElementById('fiche-heure');
      // L'élément disparaît avec la fiche : c'est le signal d'arrêt le
      // plus sûr, il ne dépend d'aucun appelant.
      if (!el) { ficheArreter(); return; }
      var h = heureLocale(d[2], langueCourante());
      if (h) el.textContent = h.heure;
    }, 20000);

    var btn = document.getElementById('fiche-geo-btn');
    if (btn) btn.addEventListener('click', function () {
      if (!navigator.geolocation) { btn.textContent = t('contrib_geo_indispo'); return; }
      btn.disabled = true;
      btn.textContent = t('contrib_geo_encours');
      navigator.geolocation.getCurrentPosition(function (p) {
        window.positionUtilisateur = { lat: p.coords.latitude, lon: p.coords.longitude };
        var km = distanceKm(p.coords.latitude, p.coords.longitude, pays.lat, pays.lon);
        var v = btn.parentNode;
        if (v) v.textContent = formateKm(km, langueCourante());
      }, function (err) {
        btn.disabled = false;
        btn.textContent = (err && err.code === 1) ? t('contrib_geo_refus') : t('contrib_geo_echec');
      }, { timeout: 12000, maximumAge: 300000 });
    });
  }

  function ficheArreter() {
    if (_horloge) { clearInterval(_horloge); _horloge = null; }
  }

  window.ficheHtml     = ficheHtml;
  window.ficheActiver  = ficheActiver;
  window.ficheArreter  = ficheArreter;
  window.distanceKm    = distanceKm;
})();
