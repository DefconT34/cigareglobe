/* data.lazy.js */
// data.lazy.js — Chargement paresseux des données lourdes depuis MySQL
// ════════════════════════════════════════════════════════
// • LOUNGES   ~74KB — chargé au clic sur un triangle lounge
// • BRANDS_DB ~38KB — chargé au clic sur une marque
// • HABANOS   ~20KB — chargé à l'ouverture du panneau pays
//
// Tout est mis en cache mémoire : un même pays/marque
// ne provoque jamais deux appels réseau.
// ════════════════════════════════════════════════════════

// ════════════════════════════════════════════════════════
// Endpoints backend — SOURCE UNIQUE (window.CG_BACKEND_BASE)
// URL relative à l'origine : fonctionne sur n'importe quel
// domaine (localhost, production…) sans rien changer, et évite le
// cross-origin (même origine que le site).
// Pour cibler un backend distant, définir window.CG_BACKEND_BASE
// AVANT ce script.
// ════════════════════════════════════════════════════════
window.CG_BACKEND_BASE = window.CG_BACKEND_BASE || '/backend';
var DATA_API = window.CG_BACKEND_BASE + '/data.php';

// ── Guard : détecte si l'URL n'a pas encore été configurée ─
var _API_READY = (DATA_API.indexOf('VOTRE_DOMAINE') === -1);
if (!_API_READY) {
    console.info('[CigarOdyssey] DATA_API non configurée — remplacez VOTRE_DOMAINE par votre domaine réel dans le fichier HTML.');
}

// ── Cache LRU simple (évite les re-fetch) ────────────────
var _dc = {};   // { "type:key": data }

function _fetch(url, cacheKey) {
    if (!_API_READY) return Promise.reject(new Error('DATA_API non configurée'));
    if (_dc[cacheKey]) return Promise.resolve(_dc[cacheKey]);
    return fetch(url)
        .then(function(r) {
            if (!r.ok) throw new Error('HTTP ' + r.status);
            return r.json();
        })
        .then(function(d) {
            _dc[cacheKey] = d;
            return d;
        });
}

// ── Lounges d'un pays ────────────────────────────────────
// Appelé par app.js → openLoungePanel
window.loadLounges = function(countryId) {
    if (LOUNGES[countryId] !== undefined) {
        return Promise.resolve(LOUNGES[countryId]);
    }
    return _fetch(
        DATA_API + '?action=lounges&id=' + encodeURIComponent(countryId)
                 + '&lang=' + (window.currentLang || 'fr'),
        'lounges:' + countryId + ':' + (window.currentLang || 'fr')
    ).then(function(data) {
        // Fusionner statiques + communautaires approuvés
        var all = (data.static || []).concat(data.community || []);
        // Normaliser le champ description → desc pour compat panels.js
        all = all.map(function(l) {
            if (l.description && !l.desc) { l.desc = l.description; }
            return l;
        });
        LOUNGES[countryId] = all;
        return all;
    });
};

// ── Marque ───────────────────────────────────────────────
// Appelé par panels.js → openBrand
window.loadBrand = function(brandName) {
    if (BRANDS_DB[brandName]) return Promise.resolve(BRANDS_DB[brandName]);
    return _fetch(
        DATA_API + '?action=brand&name=' + encodeURIComponent(brandName)
                 + '&lang=' + (window.currentLang || 'fr'),
        'brand:' + brandName
    ).then(function(data) {
        var b = data.brand;
        if (b) BRANDS_DB[brandName] = b;
        return b;
    });
};

// ── Détails complets d'un pays (habanos + refresh zones) ─
// Appelé par panels.js → openPanel / openLex
window.loadCountryDetails = function(countryId) {
    return _fetch(
        DATA_API + '?action=country&id=' + encodeURIComponent(countryId)
                 + '&lang=' + (window.currentLang || 'fr'),
        'country:' + countryId
    ).then(function(data) {
        // Mettre à jour les globals si plus frais
        if (data.habanos) HABANOS_DATA[countryId] = data.habanos;
        if (data.zones)   ZONES[countryId]        = data.zones;
        if (data.geo)     GEO_INFO[countryId]     = data.geo;
        return data;
    });
};

// ── Préchargement opportuniste ───────────────────────────
// Déclenché 2s après le premier rendu — charge les lounges
// du pays le plus probable (celui au centre du globe)
window._prefetchNearby = function() {
    if (!LOUNGE_COUNTRIES || !LOUNGE_COUNTRIES.length) return;
    // Trouver le pays lounge le plus proche du centre actuel de rotation
    var best = null, bestDist = Infinity;
    LOUNGE_COUNTRIES.slice(0, 20).forEach(function(lc) {
        var dlat = lc.lat - (typeof rotX !== 'undefined' ? rotX * 180 / Math.PI : 0);
        var dlon = lc.lon - (typeof rotY !== 'undefined' ? rotY * 180 / Math.PI : 0);
        var d = dlat*dlat + dlon*dlon;
        if (d < bestDist) { bestDist = d; best = lc; }
    });
    if (best && !LOUNGES[best.id]) {
        window.loadLounges(best.id).catch(function() {});
    }
};

// Lancer le préchargement 3s après le démarrage — seulement si l'API est configurée
if (_API_READY) {
    setTimeout(function() {
        if (typeof window._prefetchNearby === 'function') {
            window._prefetchNearby();
        }
    }, 3000);
}


