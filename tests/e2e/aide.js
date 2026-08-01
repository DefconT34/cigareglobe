// ════════════════════════════════════════════════════════
// aide.js — Utilitaires partages par les tests de bout en bout
// ════════════════════════════════════════════════════════

const { expect } = require('@playwright/test');
const { servirStatiqueDepuisDisque } = require('./statique');

/**
 * Ouvre une page et attend que l'application soit REELLEMENT prete :
 * les donnees de l'atlas chargees depuis data.php.
 *
 * Sans cette attente, les tests courent contre le chargement : le
 * serveur integre de PHP ne sert qu'une requete a la fois, si bien
 * qu'un clic peut arriver avant que le module concerne ait fini de
 * s'initialiser. Les echecs qui en decoulent sont intermittents et ne
 * disent rien de l'application.
 */
async function ouvrir(page, url = '/') {
  // Les fichiers JS/CSS et les ressources tierces sont servis depuis le
  // disque : c'est le seul point de la campagne qui rendait page.goto()
  // instable. Voir statique.js pour les mesures.
  await servirStatiqueDepuisDisque(page);

  await page.goto(url);

  await expect
    .poll(async () => page.evaluate(() => (window.COUNTRIES || []).length),
          { timeout: 20_000, message: 'les donnees de l\'atlas ne sont jamais arrivees' })
    .toBeGreaterThan(5);

  // L'ecran de chargement couvre toute la fenetre (z-index 9999) et
  // intercepte les clics. Il se retire APRES l'arrivee des donnees :
  // attendre les seules donnees laissait les clics rebondir dessus
  // jusqu'a expiration du test.
  // 30 s : en emulation mobile, le globe met sensiblement plus longtemps
  // a s'initialiser, et le serveur mono-requete allonge encore le
  // chargement. C'est une tolerance d'infrastructure, pas une mesure de
  // performance — les tests de contenu ont leurs propres delais.
  await expect(page.locator('#loading-overlay'))
    .toBeHidden({ timeout: 40_000 });

  // Les boutons 🔍 et 🗺 sont injectes par search.js et explorer.js.
  // Les attendre prouve que ces modules ont bien ete servis ET executes :
  // sous charge, le serveur mono-requete coupe parfois une connexion, et
  // le test echouait alors sur un « element introuvable » indechiffrable.
  await expect(page.locator('#side-fabs .side-fab'),
    'les modules du front n\'ont pas tous ete charges')
    .toHaveCount(await page.evaluate(() =>
      ('ontouchstart' in window || navigator.maxTouchPoints) ? 4 : 3),
      { timeout: 20_000 });

  return page;
}

/**
 * Erreurs de console dignes d'interet : coupures de transport ecartees,
 * reponses en erreur retenues.
 *
 * Le motif couvrait aussi « Failed to load resource », qui est le
 * prefixe commun a DEUX messages tres differents chez Chrome :
 *
 *   Failed to load resource: net::ERR_CONNECTION_RESET
 *   Failed to load resource: the server responded with a status of 404
 *
 * Le second est un vrai defaut — un fichier absent, une URL mal
 * reecrite — et il passait inapercu. Le prefixe est donc retire : les
 * coupures restent filtrees par les motifs net::ERR_*, qui figurent
 * dans le meme message, et un 404 fait desormais echouer le test.
 *
 * Verifie : un chargement complet ne produit aucune reponse non-2xx, en
 * bureau comme en mobile, depuis que les ressources inertes viennent du
 * disque (voir statique.js).
 */
const BRUIT_RESEAU = /ERR_CONNECTION_RESET|ERR_ABORTED|ERR_NETWORK_CHANGED/i;

function collecteErreurs(page) {
  const erreurs = [];
  page.on('console', (m) => {
    if (m.type() === 'error' && !BRUIT_RESEAU.test(m.text())) erreurs.push(m.text());
  });
  // Les exceptions JavaScript sont toujours retenues, sans filtre.
  page.on('pageerror', (e) => erreurs.push(String(e)));
  return erreurs;
}

module.exports = { ouvrir, collecteErreurs };
