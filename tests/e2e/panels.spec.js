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


  // ── Le bouton Retour du navigateur ────────────────────
  // Il rechargeait la page ENTIERE pour revenir a un etat deja present
  // en memoire, et ne faisait rien du tout a la derniere etape : l'URL
  // redevenait « / » pendant que le panneau restait ouvert. Or fermer
  // un panneau par le bouton Retour est le premier reflexe sur
  // telephone.
  //
  // La preuve du non-rechargement est un TEMOIN pose sur window : il ne
  // survit pas a un chargement de document. Verifier seulement l'URL ne
  // dirait rien — elle est correcte dans les deux cas.
  test('le bouton Retour rouvre le panneau precedent sans recharger', async ({ page }) => {
    await ouvrir(page, '/');
    await page.evaluate(() => { window.__temoin = 'vivant'; });

    // Deux pays a la suite : l'adresse doit suivre le panneau ouvert.
    await page.evaluate(() => {
      const c = COUNTRIES.find((x) => x.id === 'cuba');
      selCountry = c; openPanel(c);
    });
    await expect.poll(() => page.url(), { timeout: 10_000 }).toContain('country=cuba');
    await page.evaluate(() => {
      const c = COUNTRIES.find((x) => x.id !== 'cuba');
      selCountry = c; openPanel(c);
    });
    await expect.poll(() => page.url(), { timeout: 10_000 }).not.toContain('country=cuba');

    await page.goBack();
    await expect.poll(() => page.url(), { timeout: 10_000 }).toContain('country=cuba');
    await expect(page.locator('#panel')).toHaveClass(/open/);
    await expect(page.locator('#panel')).toContainText('Cuba');
    expect(await page.evaluate(() => window.__temoin),
           'la page a ete rechargee').toBe('vivant');

    // Derniere etape : plus d'etat, donc plus de panneau.
    await page.goBack();
    await expect(page.locator('#panel')).not.toHaveClass(/open/, { timeout: 10_000 });
    expect(await page.evaluate(() => window.__temoin)).toBe('vivant');
  });

  // L'entree par laquelle on ARRIVE n'a pas d'etat : le navigateur ne
  // pose que ce qu'on lui donne. Sans marquage au demarrage, revenir
  // sur un lien partage se lisait comme « aucun panneau ».
  test('revenir sur un lien partage retrouve sa cible', async ({ page }) => {
    await ouvrir(page, '/?country=cuba');
    await expect(page.locator('#panel')).toHaveClass(/open/, { timeout: 15_000 });
    await page.evaluate(() => {
      const c = COUNTRIES.find((x) => x.id !== 'cuba');
      selCountry = c; openPanel(c);
    });
    await expect.poll(() => page.url(), { timeout: 10_000 }).not.toContain('country=cuba');

    await page.goBack();
    await expect(page.locator('#panel')).toHaveClass(/open/, { timeout: 10_000 });
    await expect(page.locator('#panel')).toContainText('Cuba');
  });

  // La pastille de partage n'a JAMAIS ete posee : son ancrage visait
  // « .panel-head », qui n'existe pas dans ce balisage. Elle etait
  // creee puis jetee, et la regle CSS qui la stylait a coups de
  // !important ne s'appliquait a rien.
  test('la pastille de partage existe et vient de la feuille de style', async ({ page }) => {
    await ouvrir(page, '/?country=cuba');
    await expect(page.locator('#panel')).toHaveClass(/open/, { timeout: 15_000 });

    const pastille = page.locator('#panel .share-btn');
    await expect(pastille).toBeVisible();

    const style = await pastille.evaluate((el) => ({
      enLigne: el.getAttribute('style') || '',
      rond: getComputedStyle(el).borderRadius,
      largeur: el.getBoundingClientRect().width,
    }));
    expect(style.enLigne, 'le style doit venir de la feuille, pas du JS').toBe('');
    expect(style.rond).toBe('50%');
    expect(style.largeur).toBeGreaterThanOrEqual(24);
  });

  // ── La pastille doit FAIRE quelque chose ──────────────
  // Trois voies, et deux d'entre elles n'existent qu'en contexte
  // securise : navigator.share et navigator.clipboard. Servi en
  // « http://192.168.x.x » — le telephone qui teste sur le reseau
  // local —, le navigateur ne fournit ni l'un ni l'autre : le doigt
  // appuyait, et il ne se passait rien.
  test('la pastille copie l\'adresse, avec la langue', async ({ page, context }) => {
    await context.grantPermissions(['clipboard-read', 'clipboard-write']);
    await ouvrir(page, '/?lang=es&country=cuba');
    await expect(page.locator('#panel')).toHaveClass(/open/, { timeout: 15_000 });

    await page.locator('#panel .share-btn').click();
    await expect(page.locator('#panel .share-btn')).toHaveText('✓');

    const copie = await page.evaluate(() => navigator.clipboard.readText());
    expect(copie).toContain('country=cuba');
    expect(copie, 'le lien partage perd la langue').toContain('lang=es');
  });

  test('la pastille marche sans partage natif ni presse-papiers', async ({ page }) => {
    // Exactement ce que voit un telephone sur « http://192.168.x.x ».
    await page.addInitScript(() => {
      Object.defineProperty(navigator, 'clipboard', { get: () => undefined });
      Object.defineProperty(navigator, 'share', { get: () => undefined });
    });
    await ouvrir(page, '/?country=cuba');
    await expect(page.locator('#panel')).toHaveClass(/open/, { timeout: 15_000 });

    await page.locator('#panel .share-btn').click();
    await expect(page.locator('#panel .share-btn')).toHaveText('✓');
  });

  // Et si meme la vieille methode echoue, on montre l'adresse : un
  // bouton ne doit JAMAIS ne rien faire.
  test('quand tout echoue, l\'adresse s\'affiche, selectionnee', async ({ page }) => {
    await page.addInitScript(() => {
      Object.defineProperty(navigator, 'clipboard', { get: () => undefined });
      Object.defineProperty(navigator, 'share', { get: () => undefined });
      document.execCommand = function () { return false; };
    });
    await ouvrir(page, '/?country=cuba');
    await expect(page.locator('#panel')).toHaveClass(/open/, { timeout: 15_000 });

    await page.locator('#panel .share-btn').click();
    const champ = page.locator('#share-url');
    await expect(champ).toBeVisible();
    await expect(champ).toHaveValue(/country=cuba/);
    expect(await champ.evaluate((el) => document.activeElement === el)).toBe(true);
  });

  // La cible tactile ne se voit pas : 44 px autour d'une pastille de
  // 28 px. On mesure la ZONE SENSIBLE, pas le dessin.
  test('la pastille se vise au doigt', async ({ page }) => {
    await ouvrir(page, '/?country=cuba');
    await expect(page.locator('#panel')).toHaveClass(/open/, { timeout: 15_000 });

    const taille = await page.locator('#panel .share-btn').evaluate((el) => {
      const q = el.getBoundingClientRect();
      const d = Math.abs(parseFloat(getComputedStyle(el, '::before').top || '0'));
      return { dessin: q.width, sensible: q.width + 2 * d };
    });
    expect(taille.dessin).toBeGreaterThanOrEqual(24);
    expect(taille.sensible, 'cible tactile trop petite').toBeGreaterThanOrEqual(44);
  });

  // La langue vit dans « ?lang=xx » quand la reecriture d'URL n'est pas
  // active — c'est le cas du serveur de test. Ecraser la requete par
  // « ?country=… » la ramenait au francais au premier panneau ouvert.
  test('ouvrir un panneau ne perd pas la langue', async ({ page }) => {
    await ouvrir(page, '/?lang=es');
    await page.evaluate(() => {
      const c = COUNTRIES.find((x) => x.id === 'cuba');
      selCountry = c; openPanel(c);
    });
    await expect.poll(() => page.url(), { timeout: 10_000 }).toContain('country=cuba');
    expect(page.url()).toContain('lang=es');
    await expect(page.locator('html')).toHaveAttribute('lang', 'es');
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

  // ── Fete nationale ────────────────────────────────────
  // La celebration ne se declenche que le jour dit. Un test qui
  // attendrait ce jour ne s'executerait qu'une fois l'an : on passe donc
  // par ?fete=<ISO>, qui force le cas sans toucher a l'horloge.
  test.describe('Fete nationale', () => {

    test('la banniere salue le pays, dans la langue courante', async ({ page }) => {
      await ouvrir(page, '/?country=cuba&fete=CU');
      const carte = page.locator('.fete-carte');
      await expect(carte).toBeVisible({ timeout: 15_000 });
      await expect(carte).toContainText('Cuba');
      // Le libelle vient de t(), pas d'une chaine en dur : si la cle
      // manquait, on lirait « fete_independance » a l'ecran.
      await expect(carte).toContainText(/ind[ée]pendance/i);
      await expect(carte).toContainText('1868');
    });

    test('rien ne s\'affiche un jour ordinaire', async ({ page }) => {
      // Sans ?fete=, la celebration ne doit paraitre que si l'on tombe
      // vraiment sur la date — ce que le test verifie en interrogeant la
      // table plutot qu'en supposant la date du jour.
      await ouvrir(page, '/?country=cuba');
      await expect(page.locator('#panel')).toHaveClass(/open/, { timeout: 15_000 });

      const cestLeJour = await page.evaluate(() => !!window.feteDuJour('CU'));
      if (cestLeJour) test.skip(true, 'c\'est reellement la fete cubaine aujourd\'hui');
      await expect(page.locator('.fete-carte')).toHaveCount(0);
    });

    // Regression : une banniere plein ecran qui avale les clics ne se
    // voit pas a l'oeil — la page parait normale, seule l'interaction
    // meurt. C'est le risque principal de cette fonctionnalite.
    test('la celebration n\'intercepte aucun clic', async ({ page }) => {
      await ouvrir(page, '/?country=cuba&fete=CU');
      await expect(page.locator('.fete-carte')).toBeVisible({ timeout: 15_000 });

      const sous = await page.evaluate(() => {
        const r = document.querySelector('.fete-carte').getBoundingClientRect();
        const dessous = document.elementFromPoint(r.left + 30, r.top + r.height / 2);
        return {
          // Sous la banniere, c'est la page qui doit repondre, pas elle.
          cible: dessous ? (dessous.id || dessous.className || dessous.tagName) : null,
          voile: getComputedStyle(document.getElementById('fete-zone')).pointerEvents,
        };
      });
      expect(sous.voile).toBe('none');
      expect(String(sous.cible)).not.toMatch(/fete-/);

      // Le globe reste pilotable, et la croix referme bien.
      await page.locator('.fete-fermer').click();
      await expect(page.locator('.fete-carte')).toHaveCount(0);
    });
  });
});
