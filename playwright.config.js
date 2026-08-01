// ════════════════════════════════════════════════════════
// playwright.config.js — Tests de bout en bout du front
// ────────────────────────────────────────────────────────
// Complement des tests d'API (tests/run.php) : ceux-ci verifient ce que
// le navigateur affiche reellement — globe, panneaux, recherche,
// Explorer, langues, accessibilite clavier.
//
//   npm run test:e2e            campagne complete
//   npm run test:e2e:ui         mode interactif
//   npm run test:e2e -- --headed --project=chromium-desktop
//
// Playwright lance lui-meme un serveur PHP sur le port 8100, branche sur
// la base de TEST : la base applicative n'est jamais touchee. Le port
// differe du serveur de developpement (8099) pour que les deux
// cohabitent.
// ════════════════════════════════════════════════════════

const { defineConfig, devices } = require('@playwright/test');
const fs   = require('fs');
const path = require('path');

const PORT = Number(process.env.E2E_PORT || 8100);
const ROOT = __dirname;

/**
 * Interpreteur PHP. Le PHP du PATH n'est pas forcement celui qui porte
 * pdo_mysql (c'est le cas sur le poste de developpement, ou seul le PHP
 * de WAMP l'a) : on privilegie PHP_BIN, puis les emplacements WAMP
 * usuels, avant de retomber sur « php ».
 */
function trouvePhp() {
  if (process.env.PHP_BIN) return process.env.PHP_BIN;
  const candidats = [
    'C:/wamp64/bin/php/php8.4.0/php.exe',
    'C:/wamp64/bin/php/php8.3.0/php.exe',
    'C:/xampp/php/php.exe',
  ];
  return candidats.find((p) => fs.existsSync(p)) || 'php';
}

const PHP = trouvePhp();

/**
 * Nom de la base de test, selon la meme regle que test_db_name() dans
 * tests/bootstrap.php : « <base applicative>_test ». Playwright demarre
 * le serveur AVANT globalSetup, il faut donc resoudre ce nom ici, sans
 * passer par PHP. TEST_DB reste prioritaire, comme cote PHP.
 */
function baseDeTest() {
  if (process.env.TEST_DB) return process.env.TEST_DB;
  let nom = process.env.DB_NAME || '';
  if (!nom) {
    try {
      const env = fs.readFileSync(path.join(ROOT, '.env'), 'utf8');
      const m = env.match(/^\s*DB_NAME\s*=\s*(.*)$/m);
      if (m) nom = m[1].trim().replace(/^["']|["']$/g, '');
    } catch { /* pas de .env : integration continue, DB_NAME vient de l'environnement */ }
  }
  return (nom || 'cigarodyssey') + '_test';
}

const DB_TEST = baseDeTest();

module.exports = defineConfig({
  testDir: path.join(ROOT, 'tests/e2e'),
  // La preparation de la base est un script PHP : voir tests/e2e/global-setup.js
  globalSetup: path.join(ROOT, 'tests/e2e/global-setup.js'),

  // Le globe est anime et charge ses donnees en differe : on laisse de
  // la marge sans masquer une vraie lenteur.
  timeout: 60_000,
  expect: { timeout: 10_000 },

  // Le serveur integre de PHP traite une requete a la fois (et
  // PHP_CLI_SERVER_WORKERS n'existe pas sous Windows). Les fichiers
  // inertes ne lui sont plus demandes (tests/e2e/statique.js), mais
  // index.php et backend/*.php si : plusieurs travailleurs les mettraient
  // en file. La suite PHP s'execute deja sequentiellement.
  fullyParallel: false,
  workers: 1,
  forbidOnly: !!process.env.CI,
  // Un seul reessai, et aucun en local.
  //
  // Il y en avait deux partout, pour absorber les coupures du serveur
  // integre sur la rafale de ~40 ressources d'une page. Cette rafale
  // n'existe plus : les fichiers inertes sont servis depuis le disque
  // (tests/e2e/statique.js, ou les mesures sont detaillees), et une page
  // ne demande plus que quatre reponses PHP. La campagne complete passe
  // desormais du premier coup.
  //
  // En local, zero reessai : une instabilite residuelle doit se voir
  // tout de suite, pas etre rattrapee en silence. En integration
  // continue, un reessai distingue un incident d'infrastructure d'un
  // vrai defaut — et le compte « flaky » du rapport le signale.
  retries: process.env.CI ? 1 : 0,
  reporter: process.env.CI ? [['github'], ['html', { open: 'never' }]]
                           : [['list'], ['html', { open: 'never' }]],

  use: {
    baseURL: `http://127.0.0.1:${PORT}`,
    // Volontairement inchange. Les expirations de page.goto() qui
    // rendaient la campagne instable etaient des blocages nets de ~19 s
    // (connexion acceptee puis jamais servie), pas une lenteur
    // graduelle : relever ce seuil aurait transforme un echec en test
    // lent sans rien corriger. Un chargement sain tient en 3 a 4 s, soit
    // huit fois de marge. Voir tests/e2e/statique.js.
    navigationTimeout: 30_000,
    trace: 'retain-on-failure',
    screenshot: 'only-on-failure',
    video: 'off',
    // Les animations du globe rendraient les captures instables.
    launchOptions: { args: ['--force-color-profile=srgb'] },
  },

  projects: [
    {
      name: 'chromium-desktop',
      use: { ...devices['Desktop Chrome'], viewport: { width: 1280, height: 900 } },
      // responsive.spec.js suppose une fenetre de telephone : il
      // appartient au seul projet mobile. testMatch cote mobile ne
      // suffit pas, il faut l'exclure explicitement ici.
      testIgnore: /responsive\.spec\.js/,
    },
    {
      name: 'chromium-mobile',
      use: { ...devices['Pixel 7'] },
      testMatch: /responsive\.spec\.js/,
      // L'emulation mobile ralentit le rendu du globe.
      timeout: 60_000,
    },
  ],

  webServer: {
    command: `"${PHP}" -d xdebug.mode=off -S 127.0.0.1:${PORT} -t "${ROOT}"`,
    port: PORT,
    reuseExistingServer: !process.env.CI,
    timeout: 30_000,
    // Le serveur integre journalise chaque fichier servi : illisible.
    stdout: 'ignore',
    stderr: 'pipe',
    env: {
      // Base de TEST, jamais la base applicative. Cette variable prime
      // sur le .env du projet (voir backend/config.php).
      DB_NAME: DB_TEST,
      MAIL_LOG_ONLY: 'true',
      APP_DEBUG: 'false',
      ADMIN_KEY: 'test-admin-key',
    },
  },
});
