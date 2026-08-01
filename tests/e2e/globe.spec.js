// ════════════════════════════════════════════════════════
// globe.spec.js — Chargement du globe et colonne de boutons
// ════════════════════════════════════════════════════════

const { test, expect } = require('@playwright/test');
const { ouvrir, collecteErreurs } = require('./aide');

test.describe('Globe', () => {

  test('se charge sans erreur console et peint le canvas', async ({ page }) => {
    // Les coupures reseau du serveur de developpement sont ecartees ;
    // les exceptions JavaScript, jamais (voir aide.js).
    const erreurs = collecteErreurs(page);

    await ouvrir(page, '/');
    await expect(page.locator('#globe')).toBeVisible();

    // Le canvas doit contenir des pixels : un globe non peint passerait
    // sinon inapercu, l'element etant present mais vide.
    await expect.poll(async () => page.evaluate(() => {
      const c = document.getElementById('globe');
      const d = c.getContext('2d').getImageData(0, 0, c.width, c.height).data;
      let n = 0;
      for (let i = 3; i < d.length; i += 4 * 97) if (d[i] > 8) n++;   // echantillonnage
      return n;
    }), { timeout: 15_000, message: 'le globe ne peint rien' }).toBeGreaterThan(100);

    expect(erreurs).toEqual([]);
  });

  test('charge les donnees de l\'atlas depuis l\'API', async ({ page }) => {
    await ouvrir(page, '/');
    const compte = await page.evaluate(() => ({
      pays:     (window.COUNTRIES || []).length,
      marches:  (window.MARKETS || []).length,
      lounges:  (window.LOUNGE_COUNTRIES || []).length,
    }));
    expect(compte.marches).toBeGreaterThan(5);
    expect(compte.lounges).toBeGreaterThan(50);
  });

  // ── Regression : commit c0e57da ──────────────────────
  // Les quatre boutons flottants etaient positionnes par des offsets
  // « bottom » codes en dur dans quatre fichiers ; les valeurs avaient
  // derive jusqu'a 0 px d'ecart entre deux d'entre eux.
  test.describe('colonne de boutons flottants', () => {

    test('les boutons partagent taille, axe et ecart', async ({ page }) => {
      await ouvrir(page, '/');
      const colonne = page.locator('#side-fabs');
      await expect(colonne).toBeVisible();
      // Les boutons 🔍 et 🗺 sont injectes par leurs modules.
      await expect(colonne.locator('.side-fab')).toHaveCount(3);

      const boutons = await page.evaluate(() => {
        const els = [...document.querySelectorAll('#side-fabs .side-fab')];
        return els.map((el) => {
          const r = el.getBoundingClientRect();
          return { id: el.id, l: Math.round(r.left), t: Math.round(r.top),
                   b: Math.round(r.bottom), w: Math.round(r.width), h: Math.round(r.height) };
        }).sort((a, b) => a.t - b.t);
      });

      // Meme taille
      const tailles = new Set(boutons.map((b) => `${b.w}x${b.h}`));
      expect(tailles.size, `tailles divergentes : ${[...tailles].join(', ')}`).toBe(1);

      // Meme axe vertical
      const axes = new Set(boutons.map((b) => b.l + b.w / 2));
      expect(axes.size, `axes divergents : ${[...axes].join(', ')}`).toBe(1);

      // Ecarts constants et non nuls
      const ecarts = boutons.slice(1).map((b, i) => b.t - boutons[i].b);
      expect(new Set(ecarts).size, `ecarts irreguliers : ${ecarts.join(', ')}`).toBe(1);
      expect(ecarts[0]).toBeGreaterThan(0);
    });

    test('les trois boutons sont cliquables', async ({ page }) => {
      await ouvrir(page, '/');
      await expect(page.locator('#side-fabs .side-fab')).toHaveCount(3);

      const masques = await page.evaluate(() => {
        return [...document.querySelectorAll('#side-fabs .side-fab')]
          .filter((el) => {
            const r = el.getBoundingClientRect();
            return document.elementFromPoint(r.left + r.width / 2, r.top + r.height / 2) !== el;
          }).map((el) => el.id);
      });
      expect(masques, 'boutons recouverts par un autre element').toEqual([]);
    });
  });

  // ── Regression : commit e4ce434 ──────────────────────
  // #tip declarait « transition:opacity » sans jamais declarer
  // « opacity » : l'infobulle vide restait peinte au coin haut-gauche.
  test.describe('infobulle', () => {

    test('est invisible au chargement', async ({ page }) => {
      await ouvrir(page, '/');
      const tip = page.locator('#tip');
      await expect(tip).toBeHidden();

      const etat = await page.evaluate(() => {
        const s = getComputedStyle(document.getElementById('tip'));
        return { opacite: s.opacity, visibilite: s.visibility };
      });
      expect(etat).toEqual({ opacite: '0', visibilite: 'hidden' });
    });

    test('apparait au survol d\'un pays puis disparait', async ({ page }) => {
      await ouvrir(page, '/');
      // On vise le centre du globe en balayant jusqu'a toucher une cible :
      // la rotation initiale n'est pas garantie.
      const touche = await page.evaluate(async () => {
        const c = document.getElementById('globe');
        const r = c.getBoundingClientRect();
        for (let i = 0; i < 400; i++) {
          const x = r.left + r.width * (0.3 + 0.4 * Math.random());
          const y = r.top + r.height * (0.3 + 0.4 * Math.random());
          if (typeof hitTest === 'function' && hitTest(x, y)) return { x, y };
        }
        return null;
      });
      test.skip(!touche, 'aucune cible trouvee sur la face visible du globe');

      await page.mouse.move(touche.x, touche.y);
      await expect(page.locator('#tip')).toBeVisible();
      await expect(page.locator('#tip')).not.toBeEmpty();

      // Hors du globe : l'infobulle se retire
      await page.mouse.move(5, 700);
      await expect(page.locator('#tip')).toBeHidden();
    });
  });
});
