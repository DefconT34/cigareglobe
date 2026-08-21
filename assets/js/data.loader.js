/* data.loader.js */
// data.loader.js — Remplace tous les data.*.js
// Charge les données depuis MySQL via data.php
// ════════════════════════════════════════════════════════
// DATA_API est défini une seule fois plus haut (source unique) ;
// on réutilise cette valeur ici plutôt que de la redéclarer.
var DATA_API = (typeof DATA_API !== 'undefined' && DATA_API)
  ? DATA_API
  : (window.CG_BACKEND_BASE || '/backend') + '/data.php';

// Globals — déclarés seulement s'ils manquent. data.amorce.js les a
// normalement déjà posés ; ce repli sert au cas où il ne serait pas
// chargé (tests unitaires du module, page réduite).
if(typeof COUNTRIES        ==='undefined') var COUNTRIES        = [];
if(typeof MARKETS          ==='undefined') var MARKETS          = [];
if(typeof LOUNGE_COUNTRIES ==='undefined') var LOUNGE_COUNTRIES = [];
if(typeof LOUNGES          ==='undefined') var LOUNGES          = {};
if(typeof ZONES            ==='undefined') var ZONES            = {};
if(typeof GEO_INFO         ==='undefined') var GEO_INFO         = {};
if(typeof BRANDS_DB        ==='undefined') var BRANDS_DB        = {};
if(typeof HABANOS_DATA     ==='undefined') var HABANOS_DATA     = {};

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

// ── Chargement d'une feuille (au clic) ───────────────────
// Le pendant de loadBrand pour les pays qui vendent du tabac et non des
// cigares. Le cache est porte par _cachedFetch, indexe par langue.
window.FEUILLES_DB = window.FEUILLES_DB || {};
window.loadFeuille = function(id) {
    if (FEUILLES_DB[id]) return Promise.resolve(FEUILLES_DB[id]);
    return _cachedFetch(_api('feuille', { id: id }))
        .then(function(data) {
            if (data.feuille) FEUILLES_DB[id] = data.feuille;
            return data.feuille;
        });
};

// ── Chargement d'un marché (au clic) ─────────────────────
window.loadMarket = function(marketId) {
    return _cachedFetch(_api('market', { id: marketId }));
};

// ── Amorçage : la requête part TOUT DE SUITE ─────────────
//
// Elle attendait `DOMContentLoaded`, soit après l'exécution de tous les
// scripts de la page. Le globe était déjà dessiné et cliquable pendant
// que la requête n'était pas même partie : quiconque cliquait vite
// ouvrait une fiche remplie avec la copie statique. En la lançant ici,
// pendant le parsing, on gagne tout le temps des scripts suivants.
//
// `window.donneesPretes` est LA promesse que les panneaux attendent
// quand ils tiennent une ébauche d'amorçage. Elle ne rejette jamais :
// un panneau ne doit pas rester bloqué parce que la base est tombée —
// il affiche ce qu'il peut et le dit.

// La langue sort de <html lang="xx">, que index.php pose selon l'URL.
// C'est la MÊME source que i18n.js, lequel s'exécute plus loin dans la
// page : sans cette lecture, la requête partirait avant lui et
// demanderait du français, si bien que l'interface serait traduite mais
// pas les données. L'attribut fait foi, aucun des deux scripts.
if (!window.currentLang) {
    var _lg = (document.documentElement.getAttribute('lang') || 'fr').toLowerCase();
    window.currentLang = ['fr','en','es','de','zh','ar'].indexOf(_lg) >= 0 ? _lg : 'fr';
}

window.donneesPretes = window.loadGlobeData()
    .then(function (d) {
        console.info('[CigarOdyssey] Données DB chargées ✓');
        window.CG_AMORCE = false;
        return d;
    })
    .catch(function (err) {
        console.warn('[CigarOdyssey] base injoignable :', err.message);
        window.CG_DB_INJOIGNABLE = true;
        return null;
    });

/**
 * Rend l'objet à jour correspondant à une ébauche d'amorçage.
 *
 * Les entrées de `data.amorce.js` portent `amorce:1` et ne contiennent
 * que de quoi dessiner le globe. Un panneau qui en reçoit une doit
 * attendre la base plutôt qu'afficher des champs qu'il n'a pas — et
 * surtout plutôt que de ressortir un contenu figé d'il y a six mois.
 *
 * Retourne toujours quelque chose : si la base est injoignable, on rend
 * l'ébauche telle quelle et l'appelant affiche ce qu'il peut.
 */
window.versionFraiche = function (obj, collection) {
    if (!obj || !obj.amorce) return Promise.resolve(obj);
    return window.donneesPretes.then(function () {
        var liste = (collection === 'markets') ? MARKETS : COUNTRIES;
        var frais = (liste || []).filter(function (x) { return x.id === obj.id; })[0];
        return frais || obj;
    });
};









