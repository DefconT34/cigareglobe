// ════════════════════════════════════════════════════════
// aide.js — Utilitaires partages par les tests de bout en bout
// ════════════════════════════════════════════════════════

const { expect } = require('@playwright/test');

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
    .toBeHidden({ timeout: 30_000 });

  return page;
}

/**
 * Erreurs de console dignes d'interet. Le serveur de developpement,
 * mono-requete, ferme parfois une connexion quand plusieurs fichiers
 * sont demandes ensemble : ces coupures reseau ne disent rien de
 * l'application et rendraient la campagne intermittente.
 */
const BRUIT_RESEAU = /ERR_CONNECTION_RESET|ERR_ABORTED|ERR_NETWORK_CHANGED|Failed to load resource/i;

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
