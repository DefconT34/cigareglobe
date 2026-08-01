// ════════════════════════════════════════════════════════
// responsive.spec.js — Affichage mobile
// ────────────────────────────────────────────────────────
// Ce fichier tourne sur le seul projet « chromium-mobile » (Pixel 7).
//
// L'emulation etant tactile, le bouton gyroscope s'ajoute a la colonne :
// on y compte donc QUATRE boutons la ou le bureau en montre trois. C'est
// le seul contexte ou ce bouton est testable — sa creation depend de
// « ontouchstart »/maxTouchPoints, evalue une fois au chargement.
// ════════════════════════════════════════════════════════

const { test, expect } = require('@playwright/test');
const { ouvrir } = require('./aide');

test.describe('Mobile', () => {

  test('bascule en mode mobile et affiche la barre du bas', async ({ page }) => {
    await ouvrir(page, '/');
    await expect(page.locator('body')).toHaveClass(/mobile-mode/, { timeout: 20_000 });
    await expect(page.locator('#mobile-nav')).toBeVisible();
    // Les quatre onglets de navigation
    await expect(page.locator('#mobile-nav .mnav-tab')).toHaveCount(4);
  });

  test('le bouton gyroscope s\'ajoute a la colonne sur appareil tactile', async ({ page }) => {
    await ouvrir(page, '/');
    await expect(page.locator('#side-fabs #gyro-btn')).toHaveCount(1, { timeout: 20_000 });
    // Il se place entre ✏ et 🔍
    const ordre = await page.evaluate(() =>
      [...document.querySelectorAll('#side-fabs .side-fab')]
        .sort((a, b) => a.getBoundingClientRect().top - b.getBoundingClientRect().top)
        .map((el) => el.id));
    expect(ordre).toEqual(['explorer-btn', 'search-btn', 'gyro-btn', 'contrib-btn']);
  });

  test('la colonne de boutons reste alignee et au-dessus de la barre', async ({ page }) => {
    await ouvrir(page, '/');
    // Mesurer avant que la mise en page mobile soit posee donnerait des
    // positions transitoires : on attend la barre du bas.
    await expect(page.locator('body')).toHaveClass(/mobile-mode/);
    await expect(page.locator('#mobile-nav')).toBeVisible();
    const boutons = page.locator('#side-fabs .side-fab');
    await expect.poll(async () => boutons.count(), { timeout: 20_000 }).toBeGreaterThanOrEqual(3);

    const mesure = await page.evaluate(() => {
      const b = [...document.querySelectorAll('#side-fabs .side-fab')].map((el) => {
        const r = el.getBoundingClientRect();
        return { l: Math.round(r.left), t: Math.round(r.top),
                 bas: Math.round(r.bottom), w: Math.round(r.width), h: Math.round(r.height) };
      }).sort((x, y) => x.t - y.t);
      const nav = document.getElementById('mobile-nav');
      return {
        tailles: [...new Set(b.map((x) => `${x.w}x${x.h}`))],
        axes:    [...new Set(b.map((x) => x.l + x.w / 2))],
        ecarts:  b.slice(1).map((x, i) => x.t - b[i].bas),
        plusBas: b[b.length - 1].bas,
        hautBarre: nav ? Math.round(nav.getBoundingClientRect().top) : window.innerHeight,
      };
    });

    expect(mesure.tailles.length, `tailles divergentes : ${mesure.tailles}`).toBe(1);
    expect(mesure.axes.length,    `axes divergents : ${mesure.axes}`).toBe(1);
    expect(new Set(mesure.ecarts).size, `ecarts irreguliers : ${mesure.ecarts}`).toBe(1);
    expect(mesure.ecarts[0]).toBeGreaterThan(0);
    // La barre de navigation ne doit pas recouvrir le dernier bouton.
    expect(mesure.plusBas,
      'le bas de la colonne passe sous la barre de navigation').toBeLessThanOrEqual(mesure.hautBarre);
  });

  test('la page ne defile pas horizontalement', async ({ page }) => {
    await ouvrir(page, '/');
    await expect(page.locator('body')).toHaveClass(/mobile-mode/, { timeout: 20_000 });

    const debordement = await page.evaluate(() =>
      document.documentElement.scrollWidth - document.documentElement.clientWidth);
    expect(debordement, 'debordement horizontal').toBeLessThanOrEqual(1);
  });

  test('la recherche s\'ouvre et reste utilisable', async ({ page }) => {
    await ouvrir(page, '/');
    await expect(page.locator('#search-btn')).toBeVisible({ timeout: 20_000 });
    await page.locator('#search-btn').click();

    const champ = page.locator('#search-input');
    await expect(champ).toBeVisible();
    const boite = await champ.boundingBox();
    expect(boite.width).toBeGreaterThan(150);
  });
});
