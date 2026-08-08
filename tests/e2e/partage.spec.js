// ════════════════════════════════════════════════════════
// partage.spec.js — La fiche de partage (assets/js/fiche-partage.js)
// ────────────────────────────────────────────────────────
// Le bouton de partage produit une IMAGE : un PNG 1080 × 1350 dessine
// sur le poste du visiteur. Rien de tout cela n'est dans le DOM, donc
// rien ne se verifie par un selecteur — un parcours qui se contenterait
// d'appeler la fonction sans regarder l'image ne dirait rien de
// l'image.
//
// On decode donc le PNG produit et on RELIT SES PIXELS. C'est le seul
// moyen d'affirmer que les distinctions sont bien dessinees et que le
// filigrane teinte le fond sans manger le texte.
//
// Les couleurs citees ici sont celles du theme clair, que la fiche
// impose (voir l'en-tete de fiche-partage.js).
// ════════════════════════════════════════════════════════

const { test, expect } = require('@playwright/test');
const { ouvrir, marquesChargeables } = require('./aide');

const OR_PALE = [0xF5, 0xE8, 0xC0];   // --gold-p : le fond des medailles
const FOND    = [0xF8, 0xF5, 0xEE];   // --bg     : le creme de la fiche

/**
 * Charge une marque de l'atlas de test et rend la main sur son nom.
 * Aucun nom n'est ecrit en dur : le jeu de donnees peut changer, la
 * mecanique de partage, non.
 */
async function marqueChargee(page) {
  const [m] = await marquesChargeables(page, 1);
  expect(m, 'aucune fiche de marque ne s\'est chargee').toBeTruthy();
  return m;
}

/**
 * Dessine la fiche d'une marque dont on a remplace les distinctions,
 * puis compte les BANDES horizontales de medailles.
 *
 * Une bande = un rang de la grille. Trois distinctions tiennent en deux
 * rangs, sept en trois (la fiche en garde six au plus). Compter les
 * rangs, plutot que les pixels, resiste a un changement de taille.
 */
async function rangsDeMedailles(page, ref, scores) {
  return page.evaluate(async ({ ref, scores, OR_PALE }) => {
    const b = Object.assign({}, window.BRANDS_DB[ref.nom], { scores });
    const pays = (window.COUNTRIES || []).find((c) => c.id === ref.cid);
    const blob = await window.ficheMarqueBlob(b, pays);

    const img = await createImageBitmap(blob);
    const cv = document.createElement('canvas');
    cv.width = img.width; cv.height = img.height;
    const g = cv.getContext('2d');
    g.drawImage(img, 0, 0);
    const px = g.getImageData(0, 0, img.width, img.height).data;

    const estOrPale = (x, y) => {
      const i = (y * img.width + x) * 4;
      return Math.abs(px[i] - OR_PALE[0]) < 6
          && Math.abs(px[i + 1] - OR_PALE[1]) < 6
          && Math.abs(px[i + 2] - OR_PALE[2]) < 6;
    };

    // Une ligne « pleine » traverse au moins 200 px de medaille.
    const pleine = (y) => {
      let n = 0;
      for (let x = 100; x < img.width - 100; x += 4) if (estOrPale(x, y)) n++;
      return n > 50;
    };

    let rangs = 0, dedans = false;
    for (let y = 0; y < img.height; y += 2) {
      const p = pleine(y);
      if (p && !dedans) rangs++;
      dedans = p;
    }
    return { rangs, largeur: img.width, hauteur: img.height };
  }, { ref, scores, OR_PALE });
}

function note(source, year, score, vitola) {
  return { source, year, score, vitola };
}

test.describe('Fiche de partage', () => {

  test('le format est celui que les messageries affichent sans recadrer', async ({ page }) => {
    await ouvrir(page, '/');
    const ref = await marqueChargee(page);
    const r = await rangsDeMedailles(page, ref, []);
    // 1080 × 1350, soit 4:5 — voir l'en-tete de fiche-partage.js.
    expect(r.largeur).toBe(1080);
    expect(r.hauteur).toBe(1350);
  });

  // ── Le bas de la fiche porte les distinctions ──────────
  // Le bas etait vide sous l'histoire, avec une seule medaille posee
  // dans le blanc. Les notes ferment desormais la fiche, en grille.
  test('les distinctions garnissent le bas, sur autant de rangs qu\'il en faut', async ({ page }) => {
    await ouvrir(page, '/');
    const ref = await marqueChargee(page);

    const trois = await rangsDeMedailles(page, ref, [
      note('Cigar Aficionado', 2019, 98, 'Siglo VI'),
      note('Cigar Journal', 2021, 97, 'Behike 52'),
      note('Cigar Snob', 2022, 95, 'Robusto'),
    ]);
    // Deux colonnes : trois medailles occupent deux rangs.
    expect(trois.rangs, 'trois distinctions doivent tenir sur deux rangs').toBe(2);

    // CONTRE-EPREUVE. Sans elle, le test ci-dessus passerait meme si la
    // fiche dessinait des medailles en toutes circonstances.
    const aucune = await rangsDeMedailles(page, ref, []);
    expect(aucune.rangs, 'sans distinction, aucune medaille ne doit apparaitre').toBe(0);
  });

  test('la fiche s\'arrete a six distinctions', async ({ page }) => {
    await ouvrir(page, '/');
    const ref = await marqueChargee(page);
    // Huit notes : trois rangs de deux, et les deux dernieres tombent.
    // Au-dela, la grille mangerait l'histoire, qui reste le coeur.
    const r = await rangsDeMedailles(page, ref, [
      note('A', 2019, 98, 'x'), note('B', 2021, 97, 'x'),
      note('C', 2022, 96, 'x'), note('D', 2018, 95, 'x'),
      note('E', 2017, 94, 'x'), note('F', 2016, 93, 'x'),
      note('G', 2015, 92, 'x'), note('H', 2014, 91, 'x'),
    ]);
    expect(r.rangs, 'six medailles au plus, soit trois rangs').toBe(3);
  });

  // ── Le filigrane ───────────────────────────────────────
  // Des feuilles de tabac derriere le texte n'ont d'interet que si
  // elles se voient ET ne genent pas : deux bornes, pas une.
  //
  // On classe chaque pixel par son ecart au creme du fond :
  //   0 a 1    le fond nu
  //   2 a 30   une TEINTE — c'est le filigrane
  //   > 30     de l'encre : texte, bandeau, medailles
  //
  // Que la teinte vienne bien des feuilles, et non du lissage des
  // caracteres, se verifie en retirant tout le texte du corps : la part
  // teintee ne baisse pas (elle monte meme legerement, les feuilles
  // n'etant plus recouvertes). Le lissage n'y est donc pour rien.
  test('le filigrane teinte le fond sans gener la lecture', async ({ page }) => {
    await ouvrir(page, '/');
    const ref = await marqueChargee(page);

    const mesurer = (b) => page.evaluate(async ({ ref, FOND, remplace }) => {
      const base = window.BRANDS_DB[ref.nom];
      const b = remplace ? Object.assign({}, base, remplace) : base;
      const pays = (window.COUNTRIES || []).find((c) => c.id === ref.cid);
      const img = await createImageBitmap(await window.ficheMarqueBlob(b, pays));
      const cv = document.createElement('canvas');
      cv.width = img.width; cv.height = img.height;
      const g = cv.getContext('2d');
      g.drawImage(img, 0, 0);
      const px = g.getImageData(0, 0, img.width, img.height).data;

      let teintes = 0, total = 0, somme = 0;
      for (let y = 20; y < img.height - 10; y += 2) {
        for (let x = 0; x < img.width; x += 2) {
          const i = (y * img.width + x) * 4;
          const d = Math.max(Math.abs(px[i] - FOND[0]),
                             Math.abs(px[i + 1] - FOND[1]),
                             Math.abs(px[i + 2] - FOND[2]));
          total++;
          if (d > 1 && d <= 30) { teintes++; somme += d; }
        }
      }
      return { part: teintes / total, moyenne: somme / teintes };
    }, { ref, FOND, remplace: b });

    const avecTexte = await mesurer(null);
    // Il se voit : une part notable de la fiche porte les feuilles.
    expect(avecTexte.part, 'le filigrane a disparu de la fiche')
      .toBeGreaterThan(0.08);
    // Il reste un filigrane : l'ecart moyen au fond tient sous un
    // vingtieme de l'echelle. Doubler l'opacite ferait echouer ceci —
    // et rendrait le texte pose par-dessus penible a lire.
    expect(avecTexte.moyenne, 'le filigrane est devenu un motif, plus un filigrane')
      .toBeLessThan(18);

    // CONTRE-EPREUVE : sans texte ni medailles, la teinte demeure. Elle
    // ne vient donc pas du lissage des caracteres.
    const sansTexte = await mesurer({ history: '', scores: [] });
    expect(sansTexte.part, 'la teinte venait du texte, pas des feuilles')
      .toBeGreaterThan(avecTexte.part * 0.9);
  });
});
