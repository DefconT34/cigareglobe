// ════════════════════════════════════════════════════════
// a11y.spec.js — Accessibilite du globe (chantier D4)
// ════════════════════════════════════════════════════════

const { test, expect } = require('@playwright/test');
const { ouvrir } = require('./aide');

test.describe('Accessibilite', () => {

  test('le globe est atteignable au clavier et annonce son role', async ({ page }) => {
    await ouvrir(page, '/');
    const globe = page.locator('#globe');
    await expect(globe).toHaveAttribute('tabindex', /0|-?\d+/);

    const etiquette = await globe.evaluate((el) =>
      el.getAttribute('aria-label') || el.getAttribute('aria-labelledby') || '');
    expect(etiquette, 'le canvas doit porter une etiquette').not.toBe('');
  });

  test('les fleches font tourner le globe', async ({ page }) => {
    await ouvrir(page, '/');
    await page.locator('#globe').focus();
    const avant = await page.evaluate(() => ({ x: window.targetX, y: window.targetY }));
    await page.keyboard.press('ArrowRight');
    await page.keyboard.press('ArrowRight');
    const apres = await page.evaluate(() => ({ x: window.targetX, y: window.targetY }));

    expect(apres.y !== avant.y || apres.x !== avant.x,
      'aucune rotation apres deux appuis sur Fleche droite').toBeTruthy();
  });

  test('une alternative textuelle liste les pays', async ({ page }) => {
    await ouvrir(page, '/');
    // « Explorer sans le globe » : equivalent accessible du canvas.
    // La liste est construite une fois les donnees chargees.
    const liste = page.locator('#globe-a11y');
    await expect(liste).toHaveAttribute('aria-label', /globe/i);
    await expect.poll(async () => liste.locator('button').count(),
      { timeout: 15_000, message: 'la liste accessible reste vide' }).toBeGreaterThan(10);
    await expect(liste).toContainText('Explorer sans le globe');
    await expect(liste).toContainText('Cuba');
  });

  test('les boutons flottants portent une etiquette', async ({ page }) => {
    await ouvrir(page, '/');
    // Quatre sur grand ecran : Explorer, Recherche, Rotation, Contribuer.
    // Le gyroscope s'y ajoute sur un appareil tactile.
    await expect(page.locator('#side-fabs .side-fab')).toHaveCount(4);

    const sans = await page.evaluate(() =>
      [...document.querySelectorAll('#side-fabs .side-fab')]
        .filter((el) => !el.getAttribute('aria-label') && !el.title)
        .map((el) => el.id));
    expect(sans, 'boutons sans etiquette accessible').toEqual([]);
  });

  test('l\'infobulle est masquee aux lecteurs d\'ecran quand elle est cachee', async ({ page }) => {
    await ouvrir(page, '/');
    await expect(page.locator('#tip')).toHaveAttribute('aria-hidden', 'true');
  });
});
