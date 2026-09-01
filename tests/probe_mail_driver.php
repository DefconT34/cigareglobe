<?php
// ════════════════════════════════════════════════════════
// tests/probe_mail_driver.php — Quel pilote d'email est retenu ?
// ────────────────────────────────────────────────────────
// Les constantes de configuration ne se définissent qu'une fois par
// processus : les variantes de MAIL_DRIVER se testent donc dans un
// processus séparé, et c'est tout ce que fait ce fichier.
//
// POURQUOI DES ARGUMENTS ET NON DES VARIABLES D'ENVIRONNEMENT
//
// La version précédente recevait les valeurs par l'environnement. Elle a
// fonctionné tant que le `.env` du poste portait une MAIL_API_KEY vide —
// et elle a cessé le jour où une vraie clé y a été posée.
//
// La cause : une variable d'environnement VIDE ne traverse pas
// `proc_open` de façon fiable sous Windows. Le chargeur de config.php
// ignore le `.env` pour toute variable réellement définie
// (`getenv($k) !== false`) ; si la variable vide se perd en route, il
// retombe sur le `.env` — et le test mesurait alors la configuration du
// poste au lieu du cas construit.
//
// Un argument, lui, est présent ou absent sans ambiguïté, chaîne vide
// comprise. C'est le genre de dépendance cachée qui rend un test vert
// sans qu'il prouve quoi que ce soit.
//
// USAGE
//   php tests/probe_mail_driver.php <driver> <cle_api>
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }

// Posées AVANT config.php : son chargeur laisse la main à toute variable
// déjà définie, et `env()` lit `$_ENV` en premier. Le `.env` du poste
// n'a donc aucune prise sur ce que mesure cette sonde.
foreach (['MAIL_DRIVER' => $argv[1] ?? '', 'MAIL_API_KEY' => $argv[2] ?? '',
          'MAIL_LOG_ONLY' => 'false'] as $cle => $valeur) {
    $_ENV[$cle] = $valeur;
    putenv("$cle=$valeur");
}

require_once __DIR__ . '/../backend/config.php';
require_once __DIR__ . '/../backend/mailer.php';

echo mail_driver();
