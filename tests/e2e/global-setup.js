// ════════════════════════════════════════════════════════
// tests/e2e/global-setup.js — Preparation de la campagne
// ────────────────────────────────────────────────────────
// Reconstruit la base de test et y charge le jeu de donnees de l'atlas,
// en deleguant a tests/setup_front_db.php : la logique de creation de
// base vit deja cote PHP (tests/bootstrap.php), on ne la duplique pas.
// ════════════════════════════════════════════════════════

const { execFileSync } = require('child_process');
const fs   = require('fs');
const path = require('path');

const ROOT = path.join(__dirname, '..', '..');
const PORT = Number(process.env.E2E_PORT || 8100);

/**
 * Prechauffe le serveur avant le premier parcours.
 *
 * CE QUE CELA COUTE, MESURE
 * -------------------------
 * index.php rend la page puis la met en cache par langue, et met en
 * cache a part les chaines SEO extraites de i18n.js — 200 Ko a analyser.
 * Ce cout de premiere requete est reel mais petit : cache
 * backend/cache/ vide, index.php repond en 28 ms, contre 13 a 24 ms une
 * fois chaud. Les sept requetes ci-dessous coutent quelques centaines de
 * millisecondes au total.
 *
 * CE QUE CELA N'EXPLIQUE PAS
 * --------------------------
 * Ce prechauffage a d'abord ete ajoute pour des expirations a 30 s du
 * parcours n°1 de chaque projet. Les mesures ne soutiennent pas cette
 * attribution : 28 ms de cout a froid ne peuvent pas produire une
 * expiration a 30 s.
 *
 * La cause de ces expirations etait ailleurs — le serveur integre
 * acceptait une connexion sans jamais la servir, sur la rafale des ~40
 * ressources d'une page (connect=5 ms, puis 19 s, puis
 * ERR_CONNECTION_RESET). C'est tests/e2e/statique.js qui l'a supprimee,
 * et le releve y est detaille.
 *
 * POURQUOI ON LE GARDE QUAND MEME
 * -------------------------------
 * Il est quasi gratuit, et il sort du chronometre du premier test le peu
 * qui reste de cout de premiere requete : connexion MySQL, generation
 * des pages en cache pour les six langues. Ne rien lui attribuer de
 * plus — il se retire sans consequence mesurable le jour ou il gene.
 */
async function prechauffer() {
  const base = `http://127.0.0.1:${PORT}`;
  const urls = [
    `${base}/`,
    `${base}/?lang=en`, `${base}/?lang=es`, `${base}/?lang=de`,
    `${base}/?lang=zh`, `${base}/?lang=ar`,
    `${base}/backend/data.php?action=globe&lang=fr`,
  ];
  const debut = Date.now();
  for (const url of urls) {
    // Sequentiel : le serveur integre ne repond qu'a une requete a la
    // fois, les paralleliser reviendrait a les mettre en file.
    try {
      const reponse = await fetch(url);
      // Le corps DOIT etre consomme. « php -S » annonce
      // « Connection: close » et ferme la socket apres chaque reponse ;
      // si le corps reste en suspens a ce moment-la, undici — le fetch
      // integre de Node — echoue sur une assertion interne
      // (assert(!this.paused)). Elle est levee depuis un gestionnaire
      // d'evenement de socket, donc HORS de ce try : elle remonte en
      // exception non capturee et tue le processus. La campagne entiere
      // echouait avant le premier test.
      await reponse.arrayBuffer();
    } catch { /* un test dira ce qui ne va pas */ }
  }
  process.stdout.write(`Prechauffage : ${urls.length} requetes en ${Date.now() - debut} ms\n\n`);
}

function trouvePhp() {
  if (process.env.PHP_BIN) return process.env.PHP_BIN;
  const candidats = [
    'C:/wamp64/bin/php/php8.4.0/php.exe',
    'C:/wamp64/bin/php/php8.3.0/php.exe',
    'C:/xampp/php/php.exe',
  ];
  return candidats.find((p) => fs.existsSync(p)) || 'php';
}

module.exports = async () => {
  const php = trouvePhp();
  try {
    const sortie = execFileSync(
      php,
      ['-d', 'xdebug.mode=off', path.join(ROOT, 'tests', 'setup_front_db.php')],
      { cwd: ROOT, encoding: 'utf8' }
    );
    // Le chargeur xdebug de WAMP bavarde sur stderr : on ne garde que
    // le compte rendu du script.
    process.stdout.write(
      sortie.split('\n').filter((l) => !/Failed loading/.test(l)).join('\n').trim() + '\n\n'
    );
  } catch (e) {
    const detail = [e.stdout, e.stderr].filter(Boolean).join('\n');
    throw new Error(
      'Preparation de la base de test impossible.\n' +
      'Verifiez que MySQL tourne et que PHP_BIN pointe vers un PHP avec pdo_mysql.\n' +
      `Interpreteur essaye : ${php}\n\n${detail}`
    );
  }

  await prechauffer();
};
