// ════════════════════════════════════════════════════════
// panels.spec.js — Panneaux pays, lounges et modale de marque
// ────────────────────────────────────────────────────────
// Les liens profonds (?country=, ?brand=…) servent de point d'entree :
// cliquer une cible sur le canvas dependrait de la rotation courante.
// ════════════════════════════════════════════════════════

const { test, expect } = require('@playwright/test');
const { ouvrir } = require('./aide');

test.describe('Panneaux', () => {

  test('un lien profond ouvre la fiche pays garnie', async ({ page }) => {
    await ouvrir(page, '/?country=cuba');
    const panneau = page.locator('#panel');
    await expect(panneau).toHaveClass(/open/, { timeout: 15_000 });
    await expect(panneau).toContainText('Cuba');
    // Donnees de production issues de la base, pas du snapshot statique
    await expect(panneau).toContainText(/cigares\/an|Tropical/i);
  });

  test('la fiche pays se ferme', async ({ page }) => {
    await ouvrir(page, '/?country=cuba');
    await expect(page.locator('#panel')).toHaveClass(/open/, { timeout: 15_000 });
    await page.locator('#panel .panel-close, #panel [aria-label="Fermer"]').first().click();
    await expect(page.locator('#panel')).not.toHaveClass(/open/);
  });

  // ── Regression ───────────────────────────────────────
  // Les pays producteurs disposaient de deux panneaux distincts qui
  // s'ouvraient l'un par-dessus l'autre, cote a cote a droite.
  test('les deux panneaux de droite ne s\'affichent jamais ensemble', async ({ page }) => {
    await ouvrir(page, '/?country=cuba');
    await expect(page.locator('#panel')).toHaveClass(/open/, { timeout: 15_000 });

    // Ouvrir la liste des etablissements depuis la fiche pays
    const bouton = page.locator('#panel-lounges button, #panel-lounges a').first();
    if (await bouton.count()) {
      await bouton.click();
      await expect(page.locator('#lounge-panel')).toHaveClass(/open/);
      await expect(page.locator('#panel'), 'la fiche pays doit se retirer')
        .not.toHaveClass(/open/);
    }

    const ouverts = await page.evaluate(() =>
      ['panel', 'lounge-panel'].filter((id) => {
        const el = document.getElementById(id);
        return el && el.getBoundingClientRect().left < window.innerWidth - 10;
      }));
    expect(ouverts.length, `panneaux visibles simultanement : ${ouverts.join(', ')}`)
      .toBeLessThanOrEqual(1);
  });

  // ── Regression ───────────────────────────────────────
  // Le service worker servait un JS perime : la fiche marque affichait
  // « Erreur de chargement » au lieu de son contenu.
  test('la modale de marque affiche son contenu', async ({ page }) => {
    await ouvrir(page, '/?brand=Cohiba');
    const modale = page.locator('#bmodal');
    await expect(modale).toHaveClass(/open/, { timeout: 15_000 });
    await expect(modale).toContainText('Cohiba');
    await expect(modale).not.toContainText(/erreur de chargement/i);
  });

  test('aucun identifiant HTML n\'est duplique', async ({ page }) => {
    // Les etablissements etaient rendus dans deux conteneurs a la fois,
    // ce qui dupliquait les identifiants et cassait les interactions.
    await ouvrir(page, '/?country=cuba');
    await expect(page.locator('#panel')).toHaveClass(/open/, { timeout: 15_000 });

    const doublons = await page.evaluate(() => {
      const vus = new Set(), dup = new Set();
      document.querySelectorAll('[id]').forEach((el) => {
        if (vus.has(el.id)) dup.add(el.id); else vus.add(el.id);
      });
      return [...dup];
    });
    expect(doublons).toEqual([]);
  });
});
