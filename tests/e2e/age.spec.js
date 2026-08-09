// ════════════════════════════════════════════════════════
// age.spec.js — Le portail d'age
// ────────────────────────────────────────────────────────
// SEUL fichier de la campagne a ne PAS franchir le portail d'avance :
// `ouvrir(page, url, { portail: false })`. Tous les autres le
// franchissent, sinon ils echoueraient sur un calque qui n'est pas leur
// sujet (voir aide.js).
//
// Le cigare est un produit du tabac : l'acces au site est reserve aux
// personnes majeures (§10 de docs/communaute.md).
// ════════════════════════════════════════════════════════

const { test, expect } = require('@playwright/test');
const { ouvrir } = require('./aide');

test.describe('Portail d\'age', () => {

  test('il se dresse a l\'arrivee, au centre, au-dessus de tout', async ({ page }) => {
    await ouvrir(page, '/', { portail: false });

    const portail = page.locator('#agegate');
    await expect(portail).toBeVisible();
    await expect(page.locator('.ag-titre')).toContainText('18');
    // La mention sanitaire est obligatoire, et elle se lit.
    await expect(page.locator('.ag-sante')).toContainText(/tabac|sant/i);

    // Au-dessus de l'ecran de chargement (z-index 9999) et de tout le
    // reste : un portail qu'on peut contourner en cliquant a cote n'en
    // est pas un.
    const z = await portail.evaluate((el) => parseInt(getComputedStyle(el).zIndex, 10));
    expect(z).toBeGreaterThan(9999);

    // Centre : la demande de l'utilisateur, et le bon endroit pour une
    // decision qu'on ne peut pas remettre a plus tard.
    const boite = await page.locator('.ag-box').boundingBox();
    const vue = page.viewportSize();
    const centreX = boite.x + boite.width / 2;
    const centreY = boite.y + boite.height / 2;
    expect(Math.abs(centreX - vue.width / 2)).toBeLessThan(12);
    expect(Math.abs(centreY - vue.height / 2)).toBeLessThan(12);
  });

  // ── Il bloque vraiment ─────────────────────────────────
  // C'est le seul point qui compte : un portail decoratif ne protege
  // rien. On tente le geste le plus courant du site — ouvrir la
  // recherche — et il ne doit pas passer.
  test('rien du site n\'est atteignable avant d\'avoir repondu', async ({ page }) => {
    await ouvrir(page, '/', { portail: false });

    // Le calque intercepte le clic : Playwright refuse de cliquer un
    // element couvert, et ce refus EST la preuve recherchee.
    const bloque = await page.locator('#search-btn').click({ timeout: 2500 })
      .then(() => false).catch(() => true);
    expect(bloque, 'le portail laisse cliquer derriere lui').toBe(true);
    await expect(page.locator('#search-input')).toBeHidden();

    // Echap NE ferme PAS : ce n'est pas une modale d'information.
    await page.keyboard.press('Escape');
    await expect(page.locator('#agegate')).toBeVisible();

    // Un clic a cote de la boite non plus.
    await page.mouse.click(5, 5);
    await expect(page.locator('#agegate')).toBeVisible();
  });

  test('« oui » ouvre le site et se retient d\'une visite a l\'autre', async ({ page }) => {
    await ouvrir(page, '/', { portail: false });
    await page.locator('#agOui').click();

    await expect(page.locator('#agegate')).toHaveCount(0);
    // Le site redevient utilisable : le geste refuse a l'instant passe.
    await page.locator('#search-btn').click();
    await expect(page.locator('#search-input')).toBeVisible({ timeout: 10_000 });

    // La reponse est gardee SUR LE POSTE — pas de cookie, rien qui parte
    // au serveur, donc rien a declarer dans une banniere de consentement.
    const memoire = await page.evaluate(() => localStorage.getItem('cg_age18'));
    expect(memoire).toBe('1');

    // Rechargement : le portail ne revient pas.
    await page.reload();
    await expect(page.locator('#agegate')).toHaveCount(0, { timeout: 15_000 });
  });

  // ── CONTRE-EPREUVE ─────────────────────────────────────
  // Sans elle, le test precedent passerait aussi si le portail ne
  // s'affichait JAMAIS. On vide la memoire et il doit revenir.
  test('sans la reponse en memoire, le portail revient', async ({ page }) => {
    await ouvrir(page, '/', { portail: false });
    await page.locator('#agOui').click();
    await expect(page.locator('#agegate')).toHaveCount(0);

    await page.evaluate(() => localStorage.removeItem('cg_age18'));
    await page.reload();
    await expect(page.locator('#agegate')).toBeVisible({ timeout: 15_000 });
  });

  test('« non » n\'ouvre rien, et laisse revenir sur sa reponse', async ({ page }) => {
    await ouvrir(page, '/', { portail: false });
    await page.locator('#agNon').click();

    // Le portail reste : on ne redirige pas d'autorite vers un site
    // tiers, et history.back() ramenerait ici quand la page a ete
    // ouverte directement.
    await expect(page.locator('#agegate')).toBeVisible();
    await expect(page.locator('.ag-refus')).toBeVisible();
    // Rien n'est retenu : refuser ne se memorise pas.
    const memoire = await page.evaluate(() => localStorage.getItem('cg_age18'));
    expect(memoire).toBeNull();

    // Quelqu'un qui a clique a cote ne doit pas se retrouver enferme.
    await page.locator('#agRetour').click();
    await expect(page.locator('#agOui')).toBeVisible({ timeout: 15_000 });
  });

  // La langue passe par « ?lang= » et non par « /en/ » : les URL
  // prefixees sont reecrites par le .htaccess d'Apache, que le serveur
  // integre de PHP n'a pas. Sous /en/, index.php ne voit aucun
  // parametre et sert le francais — c'est une limite du harnais, pas du
  // site. i18n.spec.js emprunte bien /en/, mais pour verifier les
  // chemins des ressources, pas la langue.
  test('le portail parle la langue de la page', async ({ page }) => {
    await ouvrir(page, '/?lang=en', { portail: false });
    await expect(page.locator('.ag-titre')).toContainText(/18 or older/i);
    await expect(page.locator('#agOui')).toContainText(/I am 18/i);

    // CONTRE-EPREUVE : en francais, le meme portail parle francais.
    await ouvrir(page, '/?lang=fr', { portail: false });
    await expect(page.locator('.ag-titre')).toContainText(/18 ans/i);
  });
});
