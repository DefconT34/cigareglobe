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
};
