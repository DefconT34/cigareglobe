// ════════════════════════════════════════════════════════
// images.spec.js — Photos dans les messages
// ────────────────────────────────────────────────────────
// Le jeu de donnees pose DEUX images sous le premier message du sujet
// francais, et ecrit VRAIMENT les fichiers sur le disque
// (tests/setup_front_db.php). Sans cela, le navigateur afficherait des
// icones cassees et les selecteurs passeraient quand meme : un parcours
// qui ne verifie que la presence d'une balise <img> ne dit rien de
// l'image.
//
// Le televersement lui-meme est couvert cote API (21 verifications dans
// tests/run.php) : reconstruction, polyglotte, EXIF, plafonds,
// propriete. Ici on verifie ce que le VISITEUR voit.
// ════════════════════════════════════════════════════════

const { test, expect } = require('@playwright/test');
const { ouvrir, collecteErreurs } = require('./aide');

test.describe('Images des messages', () => {

  test('les vignettes s\'affichent sous le message, et se chargent', async ({ page }) => {
    const erreurs = collecteErreurs(page);
    await ouvrir(page, '/?sujet=900');

    const vignettes = page.locator('.fo-post').first().locator('.fo-p-img img');
    await expect(vignettes).toHaveCount(2, { timeout: 15_000 });

    // Chargees pour de vrai : `naturalWidth` vaut 0 sur une image
    // cassee, et c'est la seule facon de distinguer « la balise est la »
    // de « l'image est arrivee ».
    const largeurs = await vignettes.evaluateAll((els) => els.map((e) => e.naturalWidth));
    expect(largeurs.every((w) => w > 0), 'une vignette ne s\'est pas chargee').toBe(true);

    // C'est bien la VIGNETTE qui est servie, pas l'original.
    const src = await vignettes.first().getAttribute('src');
    expect(src).toContain('thumb_');
    expect(erreurs, 'erreurs de console').toEqual([]);
  });

  test('un clic agrandit l\'image, et trois gestes la referment', async ({ page }) => {
    await ouvrir(page, '/?sujet=900');
    const vignette = page.locator('.fo-p-img').first();
    await expect(vignette).toBeVisible({ timeout: 15_000 });

    // ── Ouverture ────────────────────────────────────────
    await vignette.click();
    const visio = page.locator('.fo-visio');
    await expect(visio).toBeVisible();
    // La visionneuse montre l'ORIGINAL, pas la vignette : agrandir une
    // vignette de 400 px donnerait une bouillie.
    const grand = await visio.locator('img').getAttribute('src');
    expect(grand).not.toContain('thumb_');
    await expect
      .poll(async () => visio.locator('img').evaluate((e) => e.naturalWidth))
      .toBeGreaterThan(400);

    // ── Echap ferme la visionneuse, PAS le forum ─────────
    // Le calque du forum ecoute lui aussi Echap : sans arret de
    // propagation, une seule touche fermerait les deux et le lecteur
    // se retrouverait sur le globe pour avoir voulu refermer une photo.
    await page.keyboard.press('Escape');
    await expect(visio).toHaveCount(0);
    await expect(page.locator('#forum.open')).toBeVisible();

    // ── Un clic a cote ferme aussi ───────────────────────
    await vignette.click();
    await expect(page.locator('.fo-visio')).toBeVisible();
    await page.mouse.click(8, 8);
    await expect(page.locator('.fo-visio')).toHaveCount(0);

    // ── Et la croix ──────────────────────────────────────
    await vignette.click();
    await page.locator('.fo-visio-x').click();
    await expect(page.locator('.fo-visio')).toHaveCount(0);
    await expect(page.locator('#forum.open')).toBeVisible();
  });

  // ── Ecrire exige un compte ─────────────────────────────
  // Le selecteur d'images vit dans la zone de redaction : un visiteur
  // n'a pas de zone de redaction, il ne doit donc pas voir de selecteur.
  test('un visiteur ne se voit pas proposer d\'ajouter des photos', async ({ page }) => {
    await ouvrir(page, '/?sujet=900');
    await expect(page.locator('.fo-post').first()).toBeVisible({ timeout: 15_000 });
    await expect(page.locator('.fo-connexion')).toBeVisible();
    await expect(page.locator('.fo-img-zone')).toHaveCount(0);
  });
});
