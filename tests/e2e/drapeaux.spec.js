// ════════════════════════════════════════════════════════
// drapeaux.spec.js — Chaque drapeau annonce doit vraiment se peindre
// ────────────────────────────────────────────────────────
// `drawFlag()` peint les drapeaux sur un canvas, et FLAGS_DESSINES
// declare ceux qu'il sait tracer. `tools/coherence_check.php` verifie
// que la liste couvre bien toutes les fiches — mais il lit du texte : il
// ne peut pas savoir si le dessin PEINT quelque chose.
//
// CE QUE CE FICHIER ATTRAPE, ET QUE RIEN D'AUTRE NE VOIT. L'Australie
// etait declaree, son trace existait, et il ne posait que le canton et
// les etoiles — sans champ bleu. Sur une vignette au fond blanc, le
// resultat ressemblait a un drapeau presque normal ; sur le panneau
// sombre du site, a un trou. Aucun compteur ne bronchait : la liste
// etait complete, la fonction ne jetait pas.
//
// On mesure donc la seule chose qui compte ici — la SURFACE PEINTE.
// Un drapeau qui couvre moins de la moitie de son canvas ne peut pas
// etre juste : tous les drapeaux nationaux couvrent leur champ entier.
// ════════════════════════════════════════════════════════

const { test, expect } = require('@playwright/test');
const { ouvrir } = require('./aide');

test.describe('Drapeaux dessines', () => {

  test('chaque drapeau declare couvre son canvas et ne jette pas', async ({ page }) => {
    await ouvrir(page, '/');
    await page.waitForFunction(
      () => typeof drawFlag === 'function' && Array.isArray(window.FLAGS_DESSINES),
      null, { timeout: 15_000 }
    );

    const bilan = await page.evaluate(() => {
      const cv = document.createElement('canvas');
      cv.width = 300; cv.height = 150;
      const ctx = cv.getContext('2d');
      const exceptions = [], creux = [];

      FLAGS_DESSINES.forEach(function (id) {
        // Plusieurs trames : l'ondulation depend du temps, et un trace
        // peut tenir a t=0 puis sortir du canvas plus loin.
        [0, 17, 41, 73].forEach(function (t) {
          try { drawFlag(cv, id, t); } catch (e) {
            exceptions.push(id + '@' + t + ' : ' + e.message);
          }
        });

        ctx.clearRect(0, 0, cv.width, cv.height);
        drawFlag(cv, id, 0);
        const px = ctx.getImageData(0, 0, cv.width, cv.height).data;
        let opaques = 0, total = 0;
        for (let i = 3; i < px.length; i += 4) { total++; if (px[i] > 10) opaques++; }
        const taux = opaques / total;
        if (taux < 0.5) creux.push(id + ' : ' + Math.round(taux * 100) + ' %');
      });

      return { exceptions: exceptions, creux: creux, nb: FLAGS_DESSINES.length };
    });

    expect(bilan.exceptions, 'trace qui jette').toEqual([]);
    expect(bilan.creux, 'drapeau qui ne peint pas son champ').toEqual([]);
    // Un compteur a zero passerait les deux assertions precedentes sans
    // avoir rien verifie — la lecon du lot R1.
    expect(bilan.nb).toBeGreaterThan(90);
  });

  test('un identifiant inconnu retombe sur le repli, sans jeter', async ({ page }) => {
    await ouvrir(page, '/');
    await page.waitForFunction(() => typeof drawFlag === 'function', null, { timeout: 15_000 });
    const ok = await page.evaluate(() => {
      const cv = document.createElement('canvas');
      cv.width = 60; cv.height = 40;
      try { drawFlag(cv, 'pays-qui-n-existe-pas', 0); return true; } catch (e) { return e.message; }
    });
    expect(ok).toBe(true);
  });

});
