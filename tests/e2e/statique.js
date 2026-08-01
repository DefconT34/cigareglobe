// ════════════════════════════════════════════════════════
// statique.js — Sert les ressources inertes sans passer par le reseau
// ────────────────────────────────────────────────────────
// POURQUOI
// --------
// Une page de l'atlas demande une quarantaine de ressources : ~30
// fichiers JS/CSS locaux, plus les polices Google et Leaflet (charges
// par explorer.js). Deux mesures, prises en chargeant la page 8 fois de
// suite contre « php -S » :
//
//   sans interception   3 chargements sur 8 depassent 18 s
//   interception        0 sur 8, mediane 3,1 s, maximum 4,0 s
//
// Les deux causes mesurees, distinctes :
//
// 1. « php -S » ne repond a une requete a la fois et annonce
//    « Connection: close » : chaque fichier ouvre sa propre connexion
//    TCP. Sur la rafale de ~30, il lui arrive d'accepter une connexion
//    puis de ne jamais la servir — le releve Chrome montre connect=5 ms
//    puis 19 s d'attente avant ERR_CONNECTION_RESET. Les scripts
//    classiques s'executant dans l'ordre, tout le reste de la page
//    attend derriere.
//
// 2. fonts.googleapis.com et unpkg.com sont interroges pour de vrai a
//    chaque chargement : ~2 s en temps normal, 7 s au pire releve. Ce
//    delai entre dans « load », donc dans page.goto().
//
// Les deux fabriquaient des expirations de page.goto() qui ne disaient
// rien de l'application.
//
// CE QUE CELA NE MASQUE PAS
// -------------------------
// Les octets servis sont ceux du disque, sans transformation. Un fichier
// absent ou une URL erronee (chemins reecrits par index.php, par
// exemple) n'est pas interceptee : la requete repart vers le serveur,
// qui repond 404 comme avant. Seul le transport change, et il n'est pas
// celui de la production — le site est servi par Apache, jamais par
// « php -S ».
//
// Tout ce qui est dynamique — « / » et index.php, backend/*.php — passe
// par le serveur, inchange.
// ════════════════════════════════════════════════════════

const fs   = require('fs');
const fsp  = require('fs/promises');
const path = require('path');
const crypto = require('crypto');

const RACINE = path.join(__dirname, '..', '..');

/**
 * Cache des ressources tierces. Rempli au premier passage, relu
 * ensuite : la campagne ne depend d'Internet qu'une fois. Ignore par
 * Git (voir .gitignore).
 */
const CACHE_TIERS = path.join(__dirname, '.cache-tiers');

/** Hotes tiers charges par la page. Tout le reste part au reseau. */
const TIERS = /^https:\/\/(fonts\.googleapis\.com|fonts\.gstatic\.com|unpkg\.com)\//;

/**
 * Types servis depuis le disque. Volontairement limite aux ressources
 * inertes : « .php » n'y figure pas, et « / » n'a pas d'extension.
 */
const TYPES = {
  '.js':    'application/javascript; charset=utf-8',
  '.mjs':   'application/javascript; charset=utf-8',
  '.css':   'text/css; charset=utf-8',
  '.json':  'application/json; charset=utf-8',
  '.svg':   'image/svg+xml',
  '.png':   'image/png',
  '.jpg':   'image/jpeg',
  '.jpeg':  'image/jpeg',
  '.webp':  'image/webp',
  '.ico':   'image/x-icon',
  '.woff':  'font/woff',
  '.woff2': 'font/woff2',
  '.ttf':   'font/ttf',
};

/** Pages deja equipees : ouvrir() peut etre appele deux fois. */
const equipees = new WeakSet();

/** Chemin de cache d'une ressource tierce, par URL et agent utilisateur. */
function cheminCache(url, agent) {
  // L'agent entre dans la cle : Google Fonts renvoie une feuille
  // differente au projet mobile et au projet bureau, pour la meme URL.
  const cle = crypto.createHash('sha1').update(agent + '|' + url).digest('hex').slice(0, 16);
  return path.join(CACHE_TIERS, cle);
}

/** Sert une ressource tierce depuis le cache, en la telechargeant au besoin. */
async function servirTiers(route, agent) {
  const base  = cheminCache(route.request().url(), agent);
  const meta  = base + '.json';
  const corps = base + '.bin';

  if (fs.existsSync(meta) && fs.existsSync(corps)) {
    const m = JSON.parse(await fsp.readFile(meta, 'utf8'));
    return route.fulfill({ status: m.status, contentType: m.type, body: await fsp.readFile(corps) });
  }

  let reponse;
  try {
    reponse = await route.fetch();
  } catch {
    // Pas de reseau et pas de cache : on laisse la requete suivre son
    // cours pour que l'echec soit celui du navigateur, lisible.
    return route.fallback();
  }

  const octets = await reponse.body();
  const type   = reponse.headers()['content-type'] || 'application/octet-stream';
  await fsp.mkdir(CACHE_TIERS, { recursive: true });
  await fsp.writeFile(corps, octets);
  await fsp.writeFile(meta, JSON.stringify({ status: reponse.status(), type }), 'utf8');
  return route.fulfill({ status: reponse.status(), contentType: type, body: octets });
}

/**
 * Installe l'interception sur une page. A appeler AVANT toute
 * navigation : ouvrir() s'en charge.
 */
async function servirStatiqueDepuisDisque(page) {
  if (equipees.has(page)) return;
  equipees.add(page);

  const agent = await page.evaluate(() => navigator.userAgent);

  await page.route('**/*', async (route) => {
    const url = route.request().url();

    if (TIERS.test(url)) return servirTiers(route, agent);

    let u;
    try { u = new URL(url); } catch { return route.fallback(); }
    if (u.hostname !== '127.0.0.1' && u.hostname !== 'localhost') return route.fallback();

    const type = TYPES[path.extname(u.pathname).toLowerCase()];
    if (!type) return route.fallback();                       // « / », *.php

    const fichier = path.resolve(RACINE, '.' + decodeURIComponent(u.pathname));
    // Garde-fou : une URL bricolee ne doit pas lire hors du depot.
    if (!fichier.startsWith(RACINE) || !fs.existsSync(fichier)) return route.fallback();

    return route.fulfill({ status: 200, contentType: type, body: await fsp.readFile(fichier) });
  });
}

module.exports = { servirStatiqueDepuisDisque };
