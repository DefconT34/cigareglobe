<?php
// ════════════════════════════════════════════════════════
// tools/forum_rappels.php — Rappels des rendez-vous à J-2
// ────────────────────────────────────────────────────────
// À lancer par une tâche planifiée. Une fois par jour suffit ; plus
// souvent ne fait pas de mal (`reminded_at` empêche le doublon), moins
// souvent fait rater la fenêtre.
//
//   php tools/forum_rappels.php            envoie
//   php tools/forum_rappels.php --dry-run  montre sans envoyer
//   php tools/forum_rappels.php --jours=3  autre fenêtre
//
// Sur o2switch (cron du cPanel), une ligne quotidienne à 9 h :
//   0 9 * * * /usr/local/bin/php /home/<compte>/<site>/tools/forum_rappels.php
//
// POURQUOI UN CRON ET PAS UN DÉCLENCHEMENT À LA VISITE. Un rappel doit
// partir même si personne ne visite le site ce jour-là — et surtout,
// l'envoi ne doit pas dépendre du hasard d'une page ouverte : le
// visiteur attendrait la fin de vingt envois SMTP avant de voir le
// globe. Le passage en « past » d'un rendez-vous, lui, se rattrape bien
// à la lecture (forum_evt_perimer) : il ne coûte qu'un UPDATE.
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }

require_once __DIR__ . '/../backend/config.php';
require_once __DIR__ . '/../backend/forum_lib.php';

// Sous Windows, la console est en cp1252 : sans cela, les accents des
// messages sortent en caractères de remplacement.
if (function_exists('stream_get_meta_data')) {
    @stream_set_write_buffer(STDOUT, 0);
}

$jours  = 2;
$simule = false;
foreach (array_slice($argv, 1) as $arg) {
    if ($arg === '--dry-run') $simule = true;
    elseif (preg_match('/^--jours=(\d+)$/', $arg, $m)) $jours = max(1, min(30, (int)$m[1]));
}

$db = getDB();

if ($simule) {
    // Le mode simulation ne se contente pas d'annoncer un nombre : il
    // liste QUI recevrait quoi. Un rappel parti au mauvais destinataire
    // ne se rattrape pas.
    forum_evt_perimer($db);
    $q = $db->prepare(
        "SELECT e.topic_id, t.title, e.starts_at, e.timezone
         FROM forum_events e JOIN forum_topics t ON t.id = e.topic_id
         WHERE e.status = 'upcoming'
           AND e.starts_at BETWEEN UTC_TIMESTAMP() AND DATE_ADD(UTC_TIMESTAMP(), INTERVAL ? DAY)
         ORDER BY e.starts_at"
    );
    $q->execute([$jours]);
    $total = 0;
    foreach ($q->fetchAll() as $e) {
        $inscrits = forum_evt_inscrits($db, (int)$e['topic_id'], true);
        printf("#%d  %s  —  %s\n", $e['topic_id'], $e['title'],
               forum_evt_date_lisible($e['starts_at'], $e['timezone']));
        foreach ($inscrits as $p) {
            printf("      -> %s (%s)\n", $p['email'], $p['lang'] ?: 'fr');
            $total++;
        }
        if (!$inscrits) echo "      (personne a prevenir)\n";
    }
    printf("\nSimulation : %d email(s) partiraient.\n", $total);
    exit(0);
}

[$evts, $mails] = forum_evt_rappels($db, $jours);

// ── La trace ─────────────────────────────────────────────
// Un cron qui cesse de tourner ne dit rien. Il n'echoue pas : il
// n'arrive plus, et c'est tout. Version de PHP changee par
// l'hebergeur, dossier deplace, quota atteint — le rendez-vous passe
// sans que personne soit prevenu, et on l'apprend par un inscrit.
//
// Chaque passage laisse donc une ligne au journal de moderation, ou la
// portee « systeme » est justement faite pour les actions sans auteur
// humain. `prevol.php` s'en sert pour dire depuis quand le cron n'a
// plus donne signe de vie.
//
// La trace est ecrite MEME quand il n'y a rien a envoyer : c'est le
// cas le plus frequent, et c'est precisement celui ou l'on ne saurait
// pas distinguer « rien a faire » de « ne tourne plus ».
//
// --dry-run n'ecrit rien : une simulation ne doit pas laisser croire
// que le cron a tourne.
journaliser($db, 'cron_rappels', 'cron', 0,
    sprintf('%d rendez-vous, %d email(s)', $evts, $mails));

printf("Rappels J-%d : %d rendez-vous, %d email(s) envoye(s).\n", $jours, $evts, $mails);
exit(0);
