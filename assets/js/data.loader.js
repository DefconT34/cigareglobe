/* data.loader.js */
// data.loader.js — Remplace tous les data.*.js
// Charge les données depuis MySQL via data.php
// ════════════════════════════════════════════════════════
// DATA_API est défini une seule fois plus haut (source unique) ;
// on réutilise cette valeur ici plutôt que de la redéclarer.
var DATA_API = (typeof DATA_API !== 'undefined' && DATA_API)
  ? DATA_API
  : (window.CG_BACKEND_BASE || '/backend') + '/data.php';

// Globals — initialisés seulement si pas déjà définis par data.inline.js
if(typeof COUNTRIES        ==='undefined') var COUNTRIES        = (typeof COUNTRIES!=="undefined"&&COUNTRIES.length) ? COUNTRIES : [];
if(typeof MARKETS          ==='undefined') var MARKETS          = (typeof MARKETS!=="undefined"&&MARKETS.length) ? MARKETS : [];
if(typeof LOUNGE_COUNTRIES ==='undefined') var LOUNGE_COUNTRIES = (typeof LOUNGE_COUNTRIES!=="undefined"&&LOUNGE_COUNTRIES.length) ? LOUNGE_COUNTRIES : [];
if(typeof LOUNGES          ==='undefined') var LOUNGES          = (typeof LOUNGES!=="undefined") ? LOUNGES : {};
if(typeof ZONES            ==='undefined') var ZONES            = (typeof ZONES!=="undefined"&&Object.keys(ZONES).length) ? ZONES : {};
if(typeof GEO_INFO         ==='undefined') var GEO_INFO         = (typeof GEO_INFO!=="undefined"&&Object.keys(GEO_INFO).length) ? GEO_INFO : {};
if(typeof BRANDS_DB        ==='undefined') var BRANDS_DB        = (typeof BRANDS_DB!=="undefined") ? BRANDS_DB : {};
if(typeof HABANOS_DATA     ==='undefined') var HABANOS_DATA     = (typeof HABANOS_DATA!=="undefined") ? HABANOS_DATA : {};

/**
 * URL d'un endpoint, langue comprise.
 *
 * Trois appels sur cinq oubliaient « lang » : le globe, la fiche pays
 * et la fiche marché revenaient donc toujours en français, quelle que
 * soit la langue choisie — alors que la base contient bien les
 * traductions. Passer par cette fonction rend l'oubli impossible.
 *
 * La langue fait partie de l'URL, donc de la clé de cache : deux
 * langues ne se marchent pas dessus.
 */
function _api(action, params) {
    var url = DATA_API + '?action=' + encodeURIComponent(action);
    Object.keys(params || {}).forEach(function (k) {
        if (params[k] !== undefined && params[k] !== null && params[k] !== '')
            url += '&' + k + '=' + encodeURIComponent(params[k]);
    });
    return url + '&lang=' + (window.currentLang || 'fr');
}

// ── Cache en mémoire (évite les re-fetch) ────────────────
var _cache = {};
window._loungeCache = _cache; // exposé pour invalidation par i18n.js

function _cachedFetch(url) {
    if (_cache[url]) return Promise.resolve(_cache[url]);
    return fetch(url)
        .then(function(r) {
            if (!r.ok) throw new Error('HTTP ' + r.status + ' — ' + url);
            return r.json();
        })
        .then(function(data) {
            _cache[url] = data;
            return data;
        });
}

// ── Chargement initial du globe ──────────────────────────
// Appelé au démarrage — charge tout ce qu'il faut pour afficher le globe
window.loadGlobeData = function() {
    return _cachedFetch(_api('globe'))
        .then(function(data) {
            // Remplir les globals
            COUNTRIES        = data.countries        || [];
            MARKETS          = data.markets          || [];
            LOUNGE_COUNTRIES = data.lounge_countries || [];
            GEO_INFO         = data.geo              || {};
            ZONES            = data.zones            || {};

            // Convertir lat/lon en nombres
            COUNTRIES.forEach(function(c) {
                c.lat = parseFloat(c.lat); c.lon = parseFloat(c.lon);
            });
            MARKETS.forEach(function(m) {
                m.lat = parseFloat(m.lat); m.lon = parseFloat(m.lon);
                m.rank = parseInt(m.rank, 10);
            });
            LOUNGE_COUNTRIES.forEach(function(lc) {
                lc.lat = parseFloat(lc.lat); lc.lon = parseFloat(lc.lon);
            });
            Object.values(ZONES).forEach(function(arr) {
                arr.forEach(function(z) {
                    z.lat = parseFloat(z.lat); z.lon = parseFloat(z.lon);
                });
            });

            return data;
        });
};

// ── Chargement détails d'un pays (au clic) ───────────────
window.loadCountryDetails = function(countryId) {
    return _cachedFetch(_api('country', { id: countryId }))
        .then(function (data) {
            // La presence Habanos vit dans un global lu par panels.js.
            // Sans cette affectation, seul le snapshot francais de
            // data.habanos.js etait affiche, quelle que soit la langue.
            if (data && data.habanos) HABANOS_DATA[countryId] = data.habanos;
            return data;
        });
};

// ── Chargement des lounges d'un pays (au clic) ───────────
window.loadLounges = function(countryId) {
    if (LOUNGES[countryId] !== undefined) {
        return Promise.resolve(LOUNGES[countryId]);
    }
    return _cachedFetch(_api('lounges', { id: countryId }))
        .then(function(data) {
            var all = (data.static || []).concat(data.community || []);
            LOUNGES[countryId] = all;
            return all;
        })
        .catch(function() {
            LOUNGES[countryId] = [];
            return [];
        });
};

// ── Chargement d'une marque (au clic) ────────────────────
window.loadBrand = function(brandName) {
    if (BRANDS_DB[brandName]) return Promise.resolve(BRANDS_DB[brandName]);
    return _cachedFetch(_api('brand', { name: brandName }))
        .then(function(data) {
            if (data.brand) BRANDS_DB[brandName] = data.brand;
            return data.brand;
        });
};

// ── Chargement d'un marché (au clic) ─────────────────────
window.loadMarket = function(marketId) {
    return _cachedFetch(_api('market', { id: marketId }));
};

// ── Bootstrap : lance le chargement et démarre le globe ──
// Le globe démarre via animation.js (qui gère l'overlay et startGlobeLoop)
// data.loader.js charge les données DB en arrière-plan uniquement
window.addEventListener('DOMContentLoaded', function() {
    // Si données inline présentes → animation.js démarre déjà le globe
    // Ici on enrichit depuis la DB en arrière-plan
    if (typeof COUNTRIES !== 'undefined' && COUNTRIES.length > 0) {
        window.loadGlobeData()
            .then(function() {
                console.info('[CigarOdyssey] Données DB chargées ✓');
            })
            .catch(function(err) {
                console.warn('[CigarOdyssey] DB indisponible — données inline utilisées:', err.message);
            });
    }
});









