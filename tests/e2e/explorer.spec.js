// ════════════════════════════════════════════════════════
// explorer.spec.js — Vue Explorer (carte 2D + liste)
// ════════════════════════════════════════════════════════

const { test, expect } = require('@playwright/test');
const { ouvrir } = require('./aide');

test.describe('Explorer', () => {

  test.beforeEach(async ({ page }) => {
    await ouvrir(page, '/');
        await page.locator('#explorer-btn').click();
    await expect(page.locator('#exp-overlay')).toBeVisible();
  });

  test('liste les etablissements et se ferme', async ({ page }) => {
    await expect(page.locator('#exp-list')).toBeVisible();
    // Les cartes arrivent avec les donnees : on attend leur presence
    // plutot qu'un libelle de compteur.
    await expect.poll(async () => page.locator('.exp-card').count(),
      { timeout: 15_000 }).toBeGreaterThan(0);
    await expect(page.locator('#exp-stats')).not.toBeEmpty();

    await page.locator('#exp-close').click();
    await expect(page.locator('#exp-overlay')).toBeHidden();
  });

  // ── Regression : commit 488daed ──────────────────────
  // Le champ n'avait aucune icone dans son markup : sa loupe venait du
  // placeholder, contrairement a la recherche principale.
  test('le champ de filtre porte la meme loupe que la recherche', async ({ page }) => {
    const champ = page.locator('#exp-search');
    await expect(champ).toBeVisible();

    const placeholder = await champ.getAttribute('placeholder');
    expect(placeholder).not.toContain('🔍');

    const icone = page.locator('.exp-search-wrap .search-icon');
    await expect(icone).toHaveCount(1);
    await expect(icone).toHaveAttribute('aria-hidden', 'true');

    // Le cadre est porte par l'enveloppe, le champ est transparent.
    const style = await page.evaluate(() => {
      const w = document.querySelector('.exp-search-wrap');
      const i = document.getElementById('exp-search');
      return { cadreEnveloppe: getComputedStyle(w).borderTopWidth,
               cadreChamp:     getComputedStyle(i).borderTopWidth };
    });
    expect(style.cadreEnveloppe).not.toBe('0px');
    expect(style.cadreChamp).toBe('0px');
  });

  test('le filtre textuel restreint la liste', async ({ page }) => {
    const cartes = page.locator('.exp-card, .exp-item');
    const avant = await cartes.count();
    expect(avant).toBeGreaterThan(0);

    await page.locator('#exp-search').fill('zzzzqqq');
    await expect.poll(async () => cartes.count()).toBeLessThan(avant);

    await page.locator('#exp-search').fill('');
    await expect.poll(async () => cartes.count()).toBe(avant);
  });

  test('le filtre par region restreint la liste', async ({ page }) => {
    const cartes = page.locator('.exp-card, .exp-item');
    const avant = await cartes.count();

    await page.locator('#exp-region').selectOption({ index: 1 });
    await expect.poll(async () => cartes.count()).toBeLessThanOrEqual(avant);
  });
});
