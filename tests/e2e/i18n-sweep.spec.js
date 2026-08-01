// ════════════════════════════════════════════════════════
// i18n-sweep.spec.js — Balayage des six langues
// ────────────────────────────────────────────────────────
// Bascule l'interface dans chaque langue, ouvre les surfaces
// principales, et signale tout texte reste en francais.
//
// LE PRINCIPE DU CLIQUET
// ----------------------
// L'interface porte aujourd'hui des chaines codees en dur, hors de
// t() (lots F1 et F2 de docs/i18n.md). Exiger zero francais ferait
// echouer le test des maintenant et il serait desactive dans la
// semaine. On enregistre donc l'existant dans i18n-baseline.json : le
// test echoue si une chaine francaise APPARAIT, pas si une chaine
// connue subsiste.
//
// Au fil de F1 et F2, les entrees disparaissent du fichier de
// reference. Quand il est vide, l'interface est integralement traduite
// — et le test devient une exigence stricte, sans rien changer au code.
//
// Pour reconstruire la reference apres un lot de traductions :
//   npm run test:e2e -- i18n-sweep --update-snapshots
// (ou supprimer le fichier et relancer : il est reecrit)
// ════════════════════════════════════════════════════════

const { test, expect } = require('@playwright/test');
const { ouvrir } = require('./aide');
const fs   = require('fs');
const path = require('path');

const LANGUES = ['fr', 'en', 'es', 'de', 'zh', 'ar'];
const REFERENCE = path.join(__dirname, 'i18n-baseline.json');

// Mots outils et lettres accentuees propres au francais. « Menu »,
// « Version » ou « Description » existent a l'identique ailleurs : le
// filtre vise les tournures, pas les mots isoles.
const MARQUEURS = new RegExp(
  '(\\b(le|la|les|des|une|du|au|aux|pour|avec|sans|dans|sur|par|est|sont'
  + '|pas|plus|tous|toutes|aucun|aucune|votre|vos|cette|ces|vous|nous'
  + '|deja|encore|veuillez|chargement|connexion|rechercher|etablissement'
  + '|pays|avis|note|ajouter|fermer|retour)\\b)'
  + '|[\\u00e0\\u00e2\\u00e4\\u00e9\\u00e8\\u00ea\\u00eb\\u00ee\\u00ef'
  + '\\u00f4\\u00f6\\u00f9\\u00fb\\u00fc\\u00e7]', 'i');

/**
 * Textes visibles des surfaces principales, dedupliques.
 * On lit les feuilles de l'arbre pour ne pas remonter des blocs entiers.
 */
async function textesVisibles(page) {
  return page.evaluate(() => {
    const zones = ['header.hdr', '.bbar', '#side-fabs', '#panel', '#lex',
                   '#search-overlay', '#exp-overlay', '#contrib-modal',
                   '#globe-a11y', '#mobile-nav'];
    const vus = new Set();
    zones.forEach((z) => {
      const racine = document.querySelector(z);
      if (!racine) return;
      const cs = getComputedStyle(racine);
      if (cs.display === 'none' || cs.visibility === 'hidden') return;
      // Le texte issu de la base (descriptions d'etablissements,
      // adresses, listes de pays) releve du lot F4 — traduire le
      // CONTENU — et noierait le signal recherche ici : l'INTERFACE.
      const CONTENU = '.exp-card, #exp-list, .lounge-card, #panel-lounges,'
                    + ' .sr-item, #search-results, #globe-a11y li, .lc-rev-item';
      racine.querySelectorAll('*').forEach((el) => {
        if (el.children.length) return;                 // feuilles seulement
        if (el.closest(CONTENU)) return;
        const s = getComputedStyle(el);
        if (s.display === 'none' || s.visibility === 'hidden') return;
        const t = (el.textContent || '').trim();
        if (t && t.length >= 4 && t.length < 120) vus.add(t);
        const ph = el.getAttribute && el.getAttribute('placeholder');
        if (ph && ph.trim().length >= 4) vus.add(ph.trim());
      });
    });
    return [...vus];
  });
}

/**
 * Parcourt les surfaces de l'interface en relevant les textes AU MOMENT
 * ou chacune est ouverte : lire apres les avoir refermees ne
 * remonterait rien, textesVisibles() ignorant les zones masquees.
 */
async function releverToutesSurfaces(page) {
  const tous = new Set();
  const ajouter = async () => (await textesVisibles(page)).forEach((t) => tous.add(t));

  await ajouter();                                   // entete, barre, boutons

  await page.locator('#search-btn').click();
  await expect(page.locator('#search-input')).toBeVisible();
  await ajouter();
  await page.keyboard.press('Escape');
  await expect(page.locator('#search-input')).toBeHidden();

  await page.locator('#explorer-btn').click();
  await expect(page.locator('#exp-search')).toBeVisible();
  await ajouter();
  await page.locator('#exp-close').click();
  await expect(page.locator('#exp-overlay')).toBeHidden();

  return [...tous];
}

test.describe('Balayage des langues', () => {

  test('aucun texte francais nouveau dans les cinq autres langues', async ({ page }) => {
    // Six langues x trois surfaces, sur un serveur qui ne sert qu'une
    // requete a la fois : ce parcours est long par nature.
    test.setTimeout(180_000);
    await ouvrir(page, '/');

    // On releve d'abord le rendu francais, qui sert de comparaison.
    const releve = {};
    for (const langue of LANGUES) {
      await page.evaluate((l) => applyLang(l), langue);
      await page.waitForTimeout(200);
      releve[langue] = await releverToutesSurfaces(page);
    }

    // Un texte n'est du francais residuel que s'il apparait A L'IDENTIQUE
    // dans le rendu francais. Se fier aux seuls accents flaguerait
    // « Länder » ou « Américas », l'allemand et l'espagnol partageant
    // nos signes ; et « CIGAR ODYSSEY », identique partout, n'a aucun
    // marqueur francais et reste donc ignore.
    const enFrancais = new Set(releve.fr);
    const trouve = { fr: [] };
    for (const langue of LANGUES) {
      if (langue === 'fr') continue;
      trouve[langue] = releve[langue]
        .filter((t) => enFrancais.has(t) && MARQUEURS.test(t))
        .sort();
    }

    // Premiere execution : on enregistre l'existant.
    if (!fs.existsSync(REFERENCE)) {
      fs.writeFileSync(REFERENCE, JSON.stringify(trouve, null, 2) + '\n', 'utf8');
      console.log('Reference i18n creee : ' + REFERENCE);
      console.log('Chaines francaises residuelles par langue : '
        + LANGUES.map((l) => `${l}=${trouve[l].length}`).join(' '));
      return;
    }

    const reference = JSON.parse(fs.readFileSync(REFERENCE, 'utf8'));
    const nouvelles = {};
    for (const langue of LANGUES) {
      if (langue === 'fr') continue;
      const connues = new Set(reference[langue] || []);
      const n = (trouve[langue] || []).filter((t) => !connues.has(t));
      if (n.length) nouvelles[langue] = n;
    }

    expect(nouvelles,
      'Du francais est apparu dans l\'interface traduite. Corrigez la chaine '
      + '(elle doit passer par t()), ou mettez a jour tests/e2e/i18n-baseline.json '
      + 'si le texte est legitimement identique.').toEqual({});
  });

  test('chaque langue applique son sens de lecture et son code', async ({ page }) => {
    await ouvrir(page, '/');
    for (const langue of LANGUES) {
      await page.evaluate((l) => applyLang(l), langue);
      const etat = await page.evaluate(() => ({
        lang: document.documentElement.lang,
        dir:  document.documentElement.dir,
      }));
      expect(etat.lang, `<html lang> pour ${langue}`).toBe(langue);
      expect(etat.dir,  `sens de lecture pour ${langue}`)
        .toBe(langue === 'ar' ? 'rtl' : 'ltr');
    }
  });

  test('l\'arabe retourne reellement la mise en page', async ({ page }) => {
    await ouvrir(page, '/');

    const gaucheLtr = await page.evaluate(() =>
      document.getElementById('side-fabs').getBoundingClientRect().left);

    await page.evaluate(() => applyLang('ar'));
    await page.waitForTimeout(300);

    const mesure = await page.evaluate(() => {
      const c = document.getElementById('side-fabs').getBoundingClientRect();
      return { gauche: c.left, droite: window.innerWidth - c.right, largeur: window.innerWidth };
    });

    // En RTL, la colonne d'actions doit passer du cote oppose.
    expect(mesure.droite,
      `la colonne de boutons reste a gauche en arabe (gauche=${Math.round(mesure.gauche)}, `
      + `droite=${Math.round(mesure.droite)}) — regle RTL manquante pour #side-fabs`)
      .toBeLessThan(mesure.gauche);
  });
});
