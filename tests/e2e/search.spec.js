// ════════════════════════════════════════════════════════
// search.spec.js — Recherche globale
// ════════════════════════════════════════════════════════

const { test, expect } = require('@playwright/test');
const { ouvrir } = require('./aide');

test.describe('Recherche', () => {

  test('s\'ouvre par le bouton et se ferme par Echap', async ({ page }) => {
    await ouvrir(page, '/');
    const champ = page.locator('#search-input');

    await page.locator('#search-btn').click();
    await expect(champ).toBeVisible();
    await expect(champ).toBeFocused();

    await page.keyboard.press('Escape');
    await expect(champ).toBeHidden();
  });

  test('s\'ouvre au raccourci clavier', async ({ page }) => {
    await ouvrir(page, '/');
    // On donne le focus au globe sans cliquer : le canvas occupe toute
    // la fenetre, et son coin haut-gauche passe sous l'entete fixe —
    // un clic a cet endroit n'aboutirait jamais.
    await page.locator('#globe').focus();
    await page.keyboard.press('/');
    await expect(page.locator('#search-input')).toBeVisible();
  });

  // ── Regression : commit 75fc560 ──────────────────────
  // La loupe etait a la fois dans le markup et en tete du placeholder
  // traduit, dans les six langues : deux loupes affichees.
  test('n\'affiche qu\'une seule loupe', async ({ page }) => {
    await ouvrir(page, '/');
    await page.locator('#search-btn').click();

    const champ = page.locator('#search-input');
    await expect(champ).toBeVisible();

    const placeholder = await champ.getAttribute('placeholder');
    expect(placeholder, 'la loupe doit venir du markup, pas du texte').not.toContain('🔍');
    expect(placeholder.length).toBeGreaterThan(5);

    const icones = page.locator('#search-overlay .search-icon');
    await expect(icones).toHaveCount(1);
    await expect(icones).toHaveText('🔍');
    // Decorative : le champ porte deja un aria-label.
    await expect(icones).toHaveAttribute('aria-hidden', 'true');
  });

  test('trouve un pays et ouvre sa fiche', async ({ page }) => {
    await ouvrir(page, '/');
    await page.locator('#search-btn').click();
    await page.locator('#search-input').fill('Cuba');

    const resultats = page.locator('#search-results >> text=/cuba/i');
    await expect(resultats.first()).toBeVisible();

    await resultats.first().click();
    await expect(page.locator('#search-overlay')).toBeHidden();
    await expect(page.locator('#panel')).toHaveClass(/open/);
  });

  test('ne renvoie rien pour une saisie absurde', async ({ page }) => {
    await ouvrir(page, '/');
    await page.locator('#search-btn').click();
    await page.locator('#search-input').fill('zzzzqqqxxx');
    await expect(page.locator('#search-results')).not.toContainText('Cuba');
  });

  // ── Une seule recherche ────────────────────────────────
  // Il y avait trois entrees : la loupe, l'Explorer, et la communaute
  // avec sa propre navigation. Les discussions arrivent du SERVEUR,
  // apres les resultats locaux : la recherche ne doit pas attendre le
  // reseau pour repondre ce qu'elle sait deja.
  test('la recherche trouve aussi les discussions', async ({ page }) => {
    await ouvrir(page, '/');
    await page.locator('#search-btn').click();
    await page.locator('#search-input').fill('Hygrometrie');

    const bloc = page.locator('#search-results .sr-forum');
    await expect(bloc).toBeVisible({ timeout: 15_000 });
    await expect(bloc).toContainText('Hygrometrie');

    // Le resultat mene au FIL, pas a la rubrique.
    await bloc.locator('.sr-item').first().click();
    await expect(page.locator('#search-overlay')).toBeHidden();
    await expect(page.locator('.fo-titre')).toContainText('Hygrometrie', { timeout: 15_000 });
  });

  // Les resultats locaux ne doivent pas attendre le serveur : ils sont
  // deja en memoire. Le bloc des discussions se pose EN DESSOUS.
  test('les resultats locaux passent avant les discussions', async ({ page }) => {
    await ouvrir(page, '/');
    await page.locator('#search-btn').click();
    await page.locator('#search-input').fill('Cuba');
    await expect(page.locator('#search-results .sr-item').first()).toBeVisible();

    const ordre = await page.evaluate(() => {
      const items = [...document.querySelectorAll('#search-results .sr-item')];
      const forum = document.querySelector('#search-results .sr-forum');
      if (!forum) return { premierLocal: true };
      return { premierLocal: !forum.contains(items[0]) };
    });
    expect(ordre.premierLocal, 'une discussion est passee devant l\'atlas').toBe(true);
  });
});
