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
const { ouvrir, marquesChargeables } = require('./aide');

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

  // ── Regression : le globe restait FIGE apres fermeture ──
  // Sur mobile, la boucle de rendu se met en pause hors de l'onglet
  // Globe (_globeHidden), et seul switchMobileTab('globe') la relance.
  //
  // `interactions.js` definissait bien une fermeture qui appelait
  // switchMobileTab('globe') — mais `panels.js`, charge APRES,
  // reassignait panelClose.onclick. Or « .onclick = » remplace au lieu
  // d'ajouter : le bon gestionnaire etait mort, et fermer un panneau par
  // sa croix laissait le globe immobile. L'utilisateur croyait
  // l'application plantee ; il fallait taper l'onglet Globe pour la
  // reveiller, ce que personne ne devine.
  //
  // Invisible sur bureau : _globeHidden() exige la classe mobile-mode.
  test('le globe repart apres fermeture d\'un panneau par la croix', async ({ page }) => {
    await ouvrir(page, '/');
    await expect(page.locator('body')).toHaveClass(/mobile-mode/, { timeout: 20_000 });

    const resultat = await page.evaluate(async () => {
      const pause = (ms) => new Promise((r) => setTimeout(r, ms));
      const vrai = window.drawGlobe;
      let n = 0;
      window.drawGlobe = function () { n++; return vrai.apply(null, arguments); };

      // Ouvrir un pays producteur : l'onglet bascule, la boucle se met en pause
      selectEntity('country', COUNTRIES.find((c) => c.id === 'cuba'));
      await pause(500);
      const ongletOuvert = mobileActiveTab;

      // Le geste qui plantait : fermer par la croix, PAS par la barre du bas
      document.getElementById('panelClose').click();
      await pause(400);
      n = 0;
      await pause(600);

      const out = { ongletOuvert, ongletFerme: mobileActiveTab, rendus: n };
      window.drawGlobe = vrai;
      return out;
    });

    // Le panneau avait bien pris la main…
    expect(resultat.ongletOuvert).toBe('panel');
    // …et la croix rend la main au globe.
    expect(resultat.ongletFerme).toBe('globe');
    // Le seul critere qui compte : ca redessine. Zero = fige.
    expect(resultat.rendus,
           'le globe ne se redessine plus apres fermeture par la croix')
      .toBeGreaterThan(0);
  });

  // ── Le partage, pour de vrai ───────────────────────────
  // Sur telephone, le bon partage est celui du systeme. Encore faut-il
  // pouvoir l'atteindre : la pastille de l'en-tete faisait 26 px, sous
  // la cible tactile de 44 px, collee a la croix de fermeture, et son
  // pictogramme annoncait un lien la ou le bouton envoie une fiche.
  test('le partage est un vrai bouton, en fin d\'article', async ({ page }) => {
    await ouvrir(page, '/');
    await expect(page.locator('body')).toHaveClass(/mobile-mode/, { timeout: 20_000 });

    const [m] = await marquesChargeables(page, 1);
    expect(m, 'aucune fiche de marque ne s\'est chargee').toBeTruthy();
    await page.evaluate((m) => openBrand(m.nom, m.cid), m);

    const cta = page.locator('#bmShareCta');
    await expect(cta).toBeVisible();
    // La pastille cede la place : deux boutons de partage, c'est un de trop.
    await expect(page.locator('#bmShare')).toBeHidden();

    const boite = await cta.boundingBox();
    expect(boite.height, 'sous 44 px, la cible n\'est pas tactile')
      .toBeGreaterThanOrEqual(44);
    // Il porte un libelle, pas seulement un pictogramme.
    await expect(cta).toContainText(/PARTAGER|SHARE|COMPARTIR|TEILEN/i);
  });

  // ── Le geste doit survivre au dessin ───────────────────
  // navigator.share() exige une « activation transitoire » : l'appel
  // doit partir du geste. Dessiner la fiche demande de charger cinq
  // polices puis d'encoder un PNG de 300 Ko — assez pour que Safari
  // juge le geste perime et REFUSE le partage. La fiche est donc
  // dessinee pendant la lecture (voir _renderBrand), et le clic n'a
  // plus qu'a l'envoyer.
  test('la fiche est prete avant le clic, sinon le systeme refuse le partage', async ({ page }) => {
    await ouvrir(page, '/');
    await expect(page.locator('body')).toHaveClass(/mobile-mode/, { timeout: 20_000 });

    // Deux marques distinctes : la fiche est mise en cache par nom, et
    // la contre-epreuve doit partir d'un cache froid.
    const marques = await marquesChargeables(page, 2);
    expect(marques.length, 'il faut deux fiches chargeables').toBe(2);

    const mesure = await page.evaluate(async (marques) => {
      const pause = (ms) => new Promise((r) => setTimeout(r, ms));

      // On simule un telephone qui accepte le partage de fichiers, et
      // on chronometre le delai entre le clic et l'appel a share().
      let vu = null, t0 = 0;
      const orig = { s: navigator.share, c: navigator.canShare };
      Object.defineProperty(navigator, 'canShare', { configurable: true, value: () => true });
      Object.defineProperty(navigator, 'share', { configurable: true, value: (d) => {
        vu = { delai: performance.now() - t0, fichiers: (d.files || []).length };
        return Promise.resolve();
      } });

      const clic = async (m, lecture) => {
        vu = null;
        document.getElementById('bmodal').classList.remove('open');
        openBrand(m.nom, m.cid);
        for (let i = 0; i < 80 && !(window.BRANDS_DB || {})[m.nom]; i++) await pause(100);
        await pause(lecture);                       // le visiteur lit… ou pas
        t0 = performance.now();
        document.getElementById('bmShareCta').click();
        for (let i = 0; i < 80 && !vu; i++) await pause(100);
        return vu;
      };

      // 1. Cas normal : l'article est reste affiche le temps d'etre lu.
      const chaud = await clic(marques[0], 3000);
      // 2. CONTRE-EPREUVE : clic immediat, la fiche n'a pas pu etre
      //    dessinee. Sans elle, le cas 1 passerait meme si la
      //    preparation en amont etait supprimee — il suffirait que le
      //    dessin soit rapide.
      const froid = await clic(marques[1], 0);

      Object.defineProperty(navigator, 'share', { configurable: true, value: orig.s });
      Object.defineProperty(navigator, 'canShare', { configurable: true, value: orig.c });
      return { chaud, froid };
    }, marques);

    // La fiche part AVEC l'image, pas juste un lien.
    expect(mesure.chaud.fichiers, 'le partage doit emporter la fiche').toBe(1);
    // Et elle part dans le geste : quelques millisecondes, pas une seconde.
    expect(mesure.chaud.delai,
           'share() appele trop tard : Safari considererait le geste perime')
      .toBeLessThan(150);
    // La contre-epreuve : dessiner coute reellement du temps.
    expect(mesure.froid.delai,
           'si dessiner etait instantane, la preparation en amont ne prouverait rien')
      .toBeGreaterThan(200);
  });
});
