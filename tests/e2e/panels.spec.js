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
    // Donnees de production issues de la base, pas du snapshot statique.
    // Le motif visait « cigares/an », que la relecture R1 a retire faute
    // de source : Habanos ne publie plus d'unites. On vise desormais le
    // climat, qui vient de la meme requete et ne porte pas de chiffre.
    await expect(panneau).toContainText(/Tropical/i);
  });

  // La legende sous le montant porte le PERIMETRE du chiffre affiche :
  // « chiffre d'affaires Habanos S.A. », « exportations de tabac vers
  // les Etats-Unis (COMTRADE) ». Sans elle, deux montants mesurant des
  // choses differentes se lisent comme comparables.
  //
  // Elle n'a JAMAIS ete affichee : panels.js lisait « c.revDetail »
  // quand l'API sert « rev_detail » — elle fait SELECT * et ne renomme
  // rien. Un champ rempli sur quinze pays, traduit en six langues et
  // sauvegarde, rendu nulle part. Rien ne pouvait le voir : un
  // sous-titre facultatif qui reste vide ne ressemble pas a une panne.
  test('le montant affiche porte son perimetre', async ({ page }) => {
    await ouvrir(page, '/?country=cuba');
    await expect(page.locator('#panel')).toHaveClass(/open/, { timeout: 15_000 });

    const sub = page.locator('#panel .rev-sub').first();
    await expect(sub).toContainText(/Habanos/i);

    // CONTRE-EPREUVE : un pays SANS montant dit POURQUOI il n'en a pas.
    // C'est le cas qui compte le plus — dix fiches sur quinze.
    //
    // LE PAYS N'EST PAS NOMME, ET C'EST DELIBERE. Ce test a casse DEUX
    // FOIS, pour deux raisons opposees :
    //
    //   - il attendait « — » dans .rev-amt ; le tiret a ete remplace par
    //     la raison, qui prend desormais la place principale ;
    //   - puis il prenait les Etats-Unis comme exemple de pays sans
    //     montant — et la migration 035 leur en a trouve un.
    //
    // Le second echec est une faute de conception du test : il epinglait
    // un PAYS la ou il devait epingler un COMPORTEMENT. Combler un
    // revenu manquant est un progres, pas une regression, et ne doit pas
    // faire rougir la campagne. On cherche donc le premier pays sans
    // montant, quel qu'il soit.
    const sansMontant = await page.evaluate(() => {
      const c = COUNTRIES.find((x) => !x.revenue);
      if (!c) return null;
      selCountry = c; openPanel(c);
      return c.id;
    });
    expect(sansMontant, 'aucun pays sans montant : adapter ce test').not.toBeNull();

    const raison = page.locator('#panel .rev-absente').first();
    await expect(raison).toBeVisible();
    await expect(raison).not.toBeEmpty();
    // Et surtout : plus de chiffre du tout, pas meme un tiret deguise.
    await expect(page.locator('#panel .rev-amt')).toHaveCount(0);
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

  // ── Une etiquette absente ne s'ecrit pas « undefined » ─
  // Trente-deux vitoles sur cent quarante-neuf n'ont ni force ni cape
  // en base. Toutes appartenaient aux onze articles que personne ne
  // pouvait ouvrir (migration 021) : le defaut existait depuis
  // toujours, et il a fallu rendre ces articles visibles pour le voir.
  test('une gamme sans force ni cape n\'ecrit pas « undefined »', async ({ page }) => {
    // On fabrique le cas plutot que de dependre du contenu de l'atlas :
    // le jeu de test ne porte qu'une marque, et elle est complete.
    await page.route('**/data.php?action=brand*', async (route) => {
      const rep = await route.fetch();
      const d = await rep.json();
      if (d.brand) {
        d.brand.gamme = [
          { name: 'Sans etiquettes', color: '#8B5A2B', story: 'Ni force ni cape en base.' },
          { name: 'Avec etiquettes', color: '#C9A227', story: 'Les deux sont la.',
            force: 'Medium', wrapper: 'Habano Ecuador' },
        ];
      }
      await route.fulfill({ response: rep, json: d });
    });

    await ouvrir(page, '/?brand=Marque de test');
    const modale = page.locator('#bmodal');
    await expect(modale).toHaveClass(/open/, { timeout: 15_000 });
    await expect(page.locator('#bmGam .gam-item')).toHaveCount(2, { timeout: 15_000 });

    const vide = page.locator('#bmGam .gam-item').first();
    await expect(vide).not.toContainText('undefined');
    await expect(vide.locator('.gam-mt')).toHaveCount(0);

    // CONTRE-EPREUVE : quand les etiquettes existent, elles s'affichent —
    // ET DANS LA LANGUE DE LA PAGE.
    //
    // Ce test exigeait « Force: Medium » et « Wrapper: Habano Ecuador ».
    // Les deux libelles etaient ecrits EN DUR, EN ANGLAIS, dans
    // panels.js, juste a cote d'un t('bm_distinctions') traduit : un
    // lecteur chinois lisait « Wrapper: ». Et la VALEUR de force l'etait
    // aussi — cinq libelles anglais (Light … Full) stockes a l'identique
    // dans les six colonnes de langue, soit 244 pastilles que la
    // campagne de traduction n'avait jamais touchees parce qu'elle
    // mesurait de la PROSE et que ceci est une etiquette.
    //
    // Le test verifie desormais ce qui compte : le libelle ET la valeur
    // suivent la langue.
    const plein = page.locator('#bmGam .gam-item').nth(1);
    await expect(plein).toContainText('Force: Moyenne');
    await expect(plein).toContainText('Cape: Habano Ecuador');
  });

  // La meme pastille, dans une autre langue. Sans cette contre-epreuve,
  // « Force: Moyenne » pourrait n'etre qu'une chaine en dur de plus.
  test('les etiquettes de gamme suivent la langue', async ({ page }) => {
    await page.route('**/data.php?action=brand*', async (route) => {
      const rep = await route.fetch();
      const d = await rep.json();
      if (d.brand) {
        d.brand.gamme = [{ name: 'Avec etiquettes', color: '#C9A227',
                           story: 'Les deux sont la.',
                           force: 'Medium-Full', wrapper: 'Habano Ecuador' }];
      }
      await route.fulfill({ response: rep, json: d });
    });

    await ouvrir(page, '/?lang=de&brand=Marque de test');
    await expect(page.locator('#bmodal')).toHaveClass(/open/, { timeout: 15_000 });
    const item = page.locator('#bmGam .gam-item').first();
    await expect(item).toContainText('Stärke: Mittel bis kräftig', { timeout: 15_000 });
    await expect(item).toContainText('Deckblatt: Habano Ecuador');
    // Le libelle anglais ne doit plus apparaitre nulle part.
    await expect(item).not.toContainText('Wrapper:');
  });
  // ── Une cape n'est pas une marque ─────────────────────
  // La fiche du Cameroun annoncait « Marques emblematiques » puis
  // listait trois cigares roules au Honduras, en Republique
  // dominicaine et au Nicaragua. Ce que le Cameroun leur donne, c'est
  // sa CAPE — leurs articles le disaient deja ; seul le titre
  // pretendait autre chose (migration 023).
  //
  // On fabrique les deux cas plutot que de dependre du contenu de
  // l'atlas : le jeu de test porte les listes d'avant la migration.
  test('les cigares a cape ont leur propre section', async ({ page }) => {
    await page.route('**/data.php?action=globe*', async (route) => {
      const rep = await route.fetch();
      const d = await rep.json();
      const cu = (d.countries || []).find((c) => c.id === 'cuba');
      if (cu) {
        cu.brands = [
          { name: 'Maison locale', desc: 'Roulee ici', iconic: true },
          { name: 'Autre maison',  desc: 'Roulee ici aussi', iconic: false },
          { name: 'Cigare a cape', desc: 'Roule ailleurs', iconic: false, cape: true },
        ];
      }
      await route.fulfill({ response: rep, json: d });
    });

    await ouvrir(page, '/?country=cuba');
    await expect(page.locator('#panel')).toHaveClass(/open/, { timeout: 15_000 });
    // On attend que la base ait remplace la copie inline.
    await expect.poll(async () => page.locator('#panel .cape-note').count(),
                      { timeout: 20_000 }).toBe(1);

    // La zone Habanos ajoute plus bas un « Marques officielles » qui
    // n'a rien a voir : on regarde les TROIS premiers titres, dans
    // l'ordre, plutot que leur nombre.
    const titres = (await page.locator('#panel .sec').allTextContents())
      .filter((x) => /marque|cape/i.test(x));
    expect(titres.length).toBeGreaterThanOrEqual(3);
    expect(titres[0]).toMatch(/emblématiques/i);
    expect(titres[1]).toMatch(/autres/i);
    expect(titres[2]).toMatch(/cape/i);

    // Le cigare a cape ne doit PAS figurer dans les deux premieres
    // grilles : c'est tout l'objet de la separation.
    const grilles = page.locator('#panel .brand-grid');
    await expect(grilles).toHaveCount(3);
    await expect(grilles.nth(0)).not.toContainText('Cigare a cape');
    await expect(grilles.nth(1)).not.toContainText('Cigare a cape');
    await expect(grilles.nth(2)).toContainText('Cigare a cape');
  });

  // CONTRE-EPREUVE : un pays SANS entree a cape n'affiche pas la
  // troisieme section — ni son explication.
  test('sans cigare a cape, pas de troisieme section', async ({ page }) => {
    await ouvrir(page, '/?country=cuba');
    await expect(page.locator('#panel')).toHaveClass(/open/, { timeout: 15_000 });
    await expect(page.locator('#panel .brand-grid').first()).toBeVisible();
    await expect(page.locator('#panel .cape-note')).toHaveCount(0);
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

  // ── L'amorcage ne remplace pas la base ──────────────────
  //
  // Le front embarquait SIX copies statiques du contenu, chacune
  // faisant un `var X = [...]` non garde : la derniere chargee ecrasait
  // les autres. Elles dataient d'avant les migrations 021 a 024 — huit
  // marques cubaines au lieu de vingt-sept — et rien a l'ecran ne
  // permettait de savoir laquelle des deux versions on lisait (E5).
  //
  // `data.amorce.js` ne porte plus que de quoi dessiner le globe. Ce
  // parcours le prouve par la negative : on retarde la base et on ne
  // lui fait servir qu'UNE marque temoin. Si un jour le panneau
  // retrouvait une source statique, il afficherait autre chose que
  // cette marque-la — et le test tomberait.
  test('le panneau attend la base au lieu d\'un etat fige', async ({ page }) => {
    await page.route('**/data.php?action=globe*', async (route) => {
      const rep  = await route.fetch();
      const data = await rep.json();
      (data.countries || []).forEach((c) => {
        if (c.id === 'cuba') {
          c.brands = [{ name: 'Marque-Temoin', desc: 'servie par la base', iconic: true }];
        }
      });
      await new Promise((r) => setTimeout(r, 1200));   // la base tarde
      await route.fulfill({ json: data });
    });

    await ouvrir(page, '/?country=cuba');

    // Ce que le panneau finit par montrer vient de la base servie.
    await expect(page.locator('#panelBody')).toContainText('Marque-Temoin', { timeout: 20_000 });

    // Et RIEN d'autre : une seule carte, celle que la base a servie. Une
    // copie statique en ajouterait forcement d'autres.
    await expect(page.locator('#panelBody .brand-grid > *')).toHaveCount(1);
  });

  // Le corollaire, verifie sur le fichier lui-meme : ce qui n'est pas
  // embarque ne peut pas devenir perime.
  // On lit le fichier servi, pas celui du disque : c'est ce que le
  // navigateur recoit qui compte.
  test('le fichier d\'amorcage n\'embarque aucun contenu de panneau', async ({ request }) => {
    const rep = await request.get('/assets/js/data.amorce.js');
    expect(rep.ok(), 'data.amorce.js n\'est pas servi').toBeTruthy();
    const src = await rep.text();

    // Les champs de panneau, un par un. `history` et `gamme` ne sont
    // meme pas dans la charge du globe ; les autres y etaient.
    for (const champ of ['brands', 'revenue', 'production', 'history', 'gamme',
                         'tabacaleras', 'varieties', 'notes', 'consumption']) {
      expect(src, 'le fichier d\'amorcage porte « ' + champ + ' »').not.toContain('"' + champ + '"');
    }

    // Ce qu'il DOIT porter : de quoi placer un marqueur.
    expect(src).toContain('"lat"');
    expect(src).toContain('"amorce"');
  });
});
