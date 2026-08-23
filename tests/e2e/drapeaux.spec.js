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

  // ── L'emoji ne s'affiche pas sur Windows ──────────────
  //
  // Les listes affichaient le drapeau EMOJI. Windows n'embarque aucun
  // glyphe de drapeau : il rend les deux indicateurs regionaux comme
  // deux lettres — « IT » pour l'Italie. macOS, iOS et Android les
  // affichent parfaitement, ce qui explique que le defaut ait tenu si
  // longtemps : il ne se voit pas chez celui qui developpe sur Mac.
  //
  // Ce test ne peut pas verifier le rendu de la police — il verifie ce
  // qui le remplace : la presence d'une VIGNETTE DESSINEE, et l'absence
  // du caractere emoji dans le texte.
  test('les listes portent une vignette dessinee, pas un emoji', async ({ page }) => {
    await ouvrir(page, '/');
    await page.waitForFunction(() => typeof drapeauImg === 'function', null, { timeout: 15_000 });

    const bilan = await page.evaluate(async () => {
      if (typeof openExplorer === 'function') openExplorer();
      await new Promise(r => setTimeout(r, 2000));
      const cases = Array.from(document.querySelectorAll('.exp-flag'));
      // Les indicateurs regionaux vivent dans le plan U+1F1E6..U+1F1FF.
      const emoji = /[\u{1F1E6}-\u{1F1FF}]/u;
      return {
        cases:   cases.length,
        avecImg: cases.filter(e => e.querySelector('img')).length,
        avecEmoji: cases.filter(e => emoji.test(e.textContent || '')).length
      };
    });

    // Un compteur a zero passerait les deux assertions suivantes sans
    // rien avoir verifie.
    expect(bilan.cases, 'aucune carte dans l\'Explorer').toBeGreaterThan(20);
    expect(bilan.avecEmoji, 'emoji de drapeau encore present').toBe(0);
    expect(bilan.avecImg).toBe(bilan.cases);
  });

  test('l\'en-tete d\'une fiche pays porte sa vignette', async ({ page }) => {
    await ouvrir(page, '/');
    await page.waitForFunction(
      () => typeof openLex === 'function' && Array.isArray(window.COUNTRIES) && COUNTRIES.length,
      null, { timeout: 15_000 }
    );
    const t = await page.evaluate(async () => {
      openLex(COUNTRIES[0]);
      await new Promise(r => setTimeout(r, 500));
      const el = document.getElementById('lexFlag');
      const img = el && el.querySelector('img');
      return { img: !!img, largeur: img ? img.width : 0,
               dataURL: img ? img.src.slice(0, 15) : '' };
    });
    expect(t.img, 'pas de vignette dans l\'en-tete').toBe(true);
    expect(t.largeur).toBeGreaterThan(10);
    // Une data-URL : rien a telecharger, donc rien a autoriser dans la CSP.
    expect(t.dataURL).toContain('data:image');
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
