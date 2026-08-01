// ════════════════════════════════════════════════════════
// i18n.spec.js — Changement de langue
// ────────────────────────────────────────────────────────
// Regression : commit 488daed. Le placeholder de l'Explorer etait ecrit
// depuis une cle a la creation du champ et depuis une AUTRE au
// changement de langue, et celui de la recherche n'etait jamais
// rafraichi — l'overlay etant construit une seule fois au chargement.
// ════════════════════════════════════════════════════════

const { test, expect } = require('@playwright/test');
const { ouvrir } = require('./aide');

const LANGUES = ['en', 'de', 'es', 'fr'];

test.describe('Langues', () => {

  test('l\'interface suit la langue choisie', async ({ page }) => {
    await ouvrir(page, '/');
    const titre = await page.locator('.title-sub, .hdr .title-sub').first().textContent();

    await page.evaluate(() => applyLang('en'));
    await expect.poll(async () =>
      page.locator('.title-sub, .hdr .title-sub').first().textContent()
    ).not.toBe(titre);
  });

  test('les deux champs de recherche suivent la langue', async ({ page }) => {
    await ouvrir(page, '/');
    // Construire les deux overlays avant de changer de langue : c'est
    // precisement le cas qui echouait.
    await page.locator('#explorer-btn').click();
    await expect(page.locator('#exp-search')).toBeVisible();
    await page.locator('#exp-close').click();
    await page.locator('#search-btn').click();
    await page.keyboard.press('Escape');

    const vus = { recherche: new Set(), explorer: new Set() };

    for (const langue of LANGUES) {
      await page.evaluate((l) => applyLang(l), langue);

      const textes = await page.evaluate(() => ({
        recherche: document.getElementById('search-input').placeholder,
        explorer:  document.getElementById('exp-search').placeholder,
      }));

      expect(textes.recherche, `recherche vide en ${langue}`).toBeTruthy();
      expect(textes.explorer,  `explorer vide en ${langue}`).toBeTruthy();
      expect(textes.recherche, `loupe residuelle en ${langue}`).not.toContain('🔍');
      expect(textes.explorer,  `loupe residuelle en ${langue}`).not.toContain('🔍');

      vus.recherche.add(textes.recherche);
      vus.explorer.add(textes.explorer);
    }

    // Un texte identique partout signifierait que le rafraichissement
    // ne se fait pas.
    expect(vus.recherche.size, 'le placeholder de recherche ne change pas').toBe(LANGUES.length);
    expect(vus.explorer.size,  'le placeholder de l\'Explorer ne change pas').toBe(LANGUES.length);
  });

  test('le placeholder de l\'Explorer reste stable apres reouverture', async ({ page }) => {
    await ouvrir(page, '/');
    await page.locator('#explorer-btn').click();
    const initial = await page.locator('#exp-search').getAttribute('placeholder');

    await page.evaluate(() => applyLang('en'));
    const apresLangue = await page.locator('#exp-search').getAttribute('placeholder');
    expect(apresLangue).not.toBe(initial);

    // Le texte doit venir de la meme cle qu'a la creation : s'il
    // raccourcit, c'est que deux cles coexistent a nouveau.
    await page.evaluate(() => applyLang('fr'));
    await expect(page.locator('#exp-search')).toHaveAttribute('placeholder', initial);
  });
});
