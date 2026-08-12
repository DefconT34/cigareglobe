// ════════════════════════════════════════════════════════
// forum.spec.js — Espace communautaire
// ────────────────────────────────────────────────────────
// Le jeu de donnees pose DEUX sujets, l'un en francais, l'autre en
// espagnol (tests/setup_front_db.php). C'est ce qui rend le filtre de
// langue verifiable : avec un seul sujet, basculer le filtre afficherait
// la meme chose dans les deux cas et ne prouverait rien.
//
// Cahier des charges : docs/communaute.md
// ════════════════════════════════════════════════════════

const { test, expect } = require('@playwright/test');
const { ouvrir, collecteErreurs } = require('./aide');

/** Ouvre le calque par le bouton d'en-tete, comme un visiteur. */
async function ouvrirForum(page) {
  await page.locator('#forumBtn').click();
  await expect(page.locator('#forum.open')).toBeVisible();
  await expect(page.locator('.fo-sec')).toHaveCount(8, { timeout: 15_000 });
}

test.describe('Communaute', () => {

  test('le bouton d\'en-tete ouvre les huit rubriques, traduites', async ({ page }) => {
    await ouvrir(page, '/');
    await ouvrirForum(page);

    // Les libelles ne sont PAS en base : ils viennent d'i18n.js. Si la
    // cle manquait, t() renverrait la cle elle-meme.
    const noms = await page.locator('.fo-sec-name').allTextContents();
    expect(noms).toContain('Conservation & cave');
    expect(noms.join(' ')).not.toContain('forum_sec_');

    // La mention sanitaire n'est pas decorative : le cigare est un
    // produit du tabac, et cet espace n'est pas ouvert aux mineurs.
    await expect(page.locator('.fo-foot')).toContainText(/tabac|majeures/i);
  });

  test('une rubrique ouvre ses sujets, un sujet ouvre son fil', async ({ page }) => {
    await ouvrir(page, '/');
    await ouvrirForum(page);

    await page.locator('.fo-sec[data-sec="conservation"]').click();
    await expect(page.locator('.fo-topic').first()).toBeVisible({ timeout: 15_000 });

    await page.locator('.fo-topic').first().click();
    await expect(page.locator('.fo-titre')).toContainText('Hygrometrie');
    await expect(page.locator('.fo-post')).toHaveCount(2);
  });

  // ── Le rendu vient du SERVEUR ──────────────────────────
  // forum_lib.php echappe tout, puis reintroduit une poignee de balises.
  // Ce parcours verifie que ce contrat tient jusque dans le navigateur :
  // le Markdown est bien devenu du HTML, et rien d'autre ne l'est.
  test('le Markdown restreint est rendu, et seulement lui', async ({ page }) => {
    const erreurs = collecteErreurs(page);
    await ouvrir(page, '/');
    await ouvrirForum(page);
    await page.locator('.fo-sec[data-sec="conservation"]').click();
    await page.locator('.fo-topic').first().click();
    await expect(page.locator('.fo-post').first()).toBeVisible();

    const corps = page.locator('.fo-post').first().locator('.fo-p-corps');
    await expect(corps.locator('strong')).toHaveText('65 %');
    await expect(corps.locator('li')).toHaveCount(2);
    await expect(corps.locator('blockquote')).toContainText('trop humide');
    expect(erreurs, 'erreurs de console').toEqual([]);
  });

  // ── Le filtre de langue ────────────────────────────────
  // Le site parle six langues et le serveur ne traduit pas. Sans filtre,
  // une rubrique serait un empilement ou cinq lecteurs sur six ne
  // comprennent rien.
  test('le filtre de langue cache et remontre, dans les deux sens', async ({ page }) => {
    await ouvrir(page, '/');
    await ouvrirForum(page);
    await page.locator('.fo-sec[data-sec="conservation"]').click();
    await expect(page.locator('.fo-topic').first()).toBeVisible({ timeout: 15_000 });

    // Reglage par defaut en francais : « la mienne + anglais ». Le sujet
    // espagnol n'a donc pas sa place ici.
    const titres = () => page.locator('.fo-t-title').allTextContents();
    expect((await titres()).join(' ')).toContain('Hygrometrie');
    expect((await titres()).join(' '),
           'le sujet espagnol ne devrait pas passer le filtre').not.toContain('Curado');

    // CONTRE-EPREUVE : « toutes les langues » le fait apparaitre. Sans
    // elle, le test ci-dessus passerait aussi si le sujet espagnol
    // n'existait pas du tout.
    await page.locator('.fo-lang').selectOption('all');
    await expect(page.locator('.fo-topic')).toHaveCount(2, { timeout: 15_000 });
    expect((await titres()).join(' ')).toContain('Curado');

    // La langue d'un sujet etranger s'annonce AVANT le clic.
    await expect(page.locator('.fo-lang-tag').first()).toHaveText('ES');
  });

  test('un visiteur lit tout, mais on lui propose de se connecter pour ecrire', async ({ page }) => {
    await ouvrir(page, '/');
    await ouvrirForum(page);
    await page.locator('.fo-sec[data-sec="conservation"]').click();
    await page.locator('.fo-topic').first().click();

    await expect(page.locator('.fo-post').first()).toBeVisible();
    await expect(page.locator('.fo-connexion')).toBeVisible();
    await expect(page.locator('.fo-repondre')).toHaveCount(0);
  });

  // ── Une adresse partagee ouvre la bonne vue ────────────
  // Ce module est charge AVANT i18n.js et account.js : ouvrir la vue au
  // moment du parsing levait une ReferenceError sur t(), qui
  // interrompait le module — le calque restait vide et « ?forum=… » ne
  // montrait rien. Tout est desormais differe a DOMContentLoaded.
  test('un lien direct ouvre la rubrique, pas une page vide', async ({ page }) => {
    await ouvrir(page, '/?forum=conservation');
    await expect(page.locator('#forum.open')).toBeVisible({ timeout: 15_000 });
    await expect(page.locator('.fo-topic').first()).toBeVisible({ timeout: 15_000 });
    await expect(page.locator('.fo-sub')).toHaveText('Conservation & cave');
  });

  test('un lien direct vers un sujet ouvre le fil', async ({ page }) => {
    await ouvrir(page, '/?sujet=900');
    await expect(page.locator('.fo-titre')).toContainText('Hygrometrie', { timeout: 15_000 });
  });

  // ── Le pictogramme de la rubrique « Les cigares » ──────
  // Il n'existe pas d'emoji de cigare : Unicode n'a que la cigarette,
  // qui est precisement l'objet que ce site ne traite pas. Celui-ci est
  // donc dessine. Le test regarde les deux cotes — le trace present, et
  // l'emoji absent — parce que verifier seulement le premier passerait
  // aussi si les deux cohabitaient.
  test('la rubrique des cigares porte un cigare, pas une cigarette', async ({ page }) => {
    await ouvrir(page, '/');
    await ouvrirForum(page);

    const ico = page.locator('.fo-sec[data-sec="cigares"] .fo-sec-ico');
    await expect(ico.locator('svg')).toHaveCount(1);
    expect(await ico.textContent(), 'l\'emoji cigarette ne doit plus paraitre')
      .not.toContain('\u{1F6AC}');

    // Les autres gardent le leur : le remplacement vise une rubrique,
    // pas la colonne entiere.
    const autre = page.locator('.fo-sec[data-sec="conservation"] .fo-sec-ico');
    await expect(autre.locator('svg')).toHaveCount(0);
    expect((await autre.textContent()).trim().length).toBeGreaterThan(0);
  });

  // ── Le retour doit RESSEMBLER a un bouton ──────────────
  // Il etait un texte dore nu, dans la fonte et le corps des intitules
  // decoratifs qui l'entourent. On mesure ce qui le distingue d'un
  // texte : une bordure et une hauteur de cible tactile.
  test('« Retour aux rubriques » se voit et ramene aux rubriques', async ({ page }) => {
    await ouvrir(page, '/');
    await ouvrirForum(page);
    await page.locator('.fo-sec[data-sec="conservation"]').click();

    const retour = page.locator('.fo-back-btn').first();
    await expect(retour).toBeVisible({ timeout: 15_000 });

    const style = await retour.evaluate((el) => {
      const c = getComputedStyle(el);
      return { bordure: parseFloat(c.borderTopWidth), hauteur: el.getBoundingClientRect().height };
    });
    expect(style.bordure, 'le bouton doit porter une bordure').toBeGreaterThan(0);
    expect(style.hauteur, 'hauteur de cible trop faible').toBeGreaterThanOrEqual(28);

    // Et il fait ce qu'il annonce.
    await retour.click();
    await expect(page.locator('.fo-sec')).toHaveCount(8);
  });

  test('la croix referme et rend la main au globe', async ({ page }) => {
    await ouvrir(page, '/');
    await ouvrirForum(page);
    await page.locator('.fo-close').click();
    await expect(page.locator('#forum.open')).toHaveCount(0);
    await expect(page.locator('body')).not.toHaveClass(/forum-open/);
  });
});
