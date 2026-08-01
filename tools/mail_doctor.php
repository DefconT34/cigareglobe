<?php
// ════════════════════════════════════════════════════════
// tools/mail_doctor.php — Diagnostic de délivrabilité email
// ────────────────────────────────────────────────────────
// Contrôle la configuration d'envoi et les enregistrements DNS qui
// décident du sort d'un email : SPF, DKIM, DMARC. À lancer après tout
// changement de prestataire ou de domaine.
//
//   php tools/mail_doctor.php                    diagnostic seul
//   php tools/mail_doctor.php --to=vous@mail.com envoie aussi un test
//
// Code de sortie : 0 si aucun problème bloquant, 1 sinon.
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }
if (function_exists('stream_get_meta_data')) @stream_set_blocking(STDOUT, true);

require_once __DIR__ . '/../backend/config.php';
require_once __DIR__ . '/../backend/mailer.php';

$problemes = 0;
$alertes   = 0;

function line(string $etat, string $texte, string $detail = ''): void {
    $puce = ['ok' => '  OK  ', 'ko' => ' ECHEC', 'warn' => ' ALERTE', 'info' => '  ..  '][$etat] ?? '      ';
    echo str_pad($puce, 8) . $texte . "\n";
    if ($detail !== '') foreach (explode("\n", $detail) as $l) echo str_repeat(' ', 10) . $l . "\n";
}
function titre(string $t): void { echo "\n" . $t . "\n" . str_repeat('-', strlen($t)) . "\n"; }
function ko(string $t, string $d = ''): void   { global $problemes; $problemes++; line('ko', $t, $d); }
function warn(string $t, string $d = ''): void { global $alertes;   $alertes++;   line('warn', $t, $d); }

/**
 * Enregistrements TXT d'un nom, concaténés (les TXT longs sont
 * découpés en fragments). Retourne false si la résolution a échoué —
 * à distinguer d'un tableau vide, qui signifie « pas d'enregistrement ».
 */
function txt_records(string $name) {
    $recs = @dns_get_record($name, DNS_TXT);
    if (!is_array($recs)) return false;
    $out = [];
    foreach ($recs as $r) {
        if (isset($r['entries']) && is_array($r['entries'])) $out[] = implode('', $r['entries']);
        elseif (isset($r['txt']))                            $out[] = $r['txt'];
    }
    return $out;
}

/**
 * Le résolveur est-il exploitable pour ce domaine ? Deux contrôles :
 * le domaine doit répondre, et un sous-domaine aléatoire ne doit PAS
 * répondre. Certains résolveurs (box opérateur, DNS captif) renvoient
 * une réponse pour n'importe quel nom : les vérifications DKIM
 * donneraient alors de faux positifs.
 */
function dns_utilisable(string $domain): string {
    if (!function_exists('dns_get_record')) return 'indisponible';
    if (!@dns_get_record($domain, DNS_NS) && !@dns_get_record($domain, DNS_A)) return 'injoignable';
    $bidon = 'cg-doctor-' . bin2hex(random_bytes(6)) . '._domainkey.' . $domain;
    if (txt_records($bidon)) return 'detourne';
    return 'ok';
}

echo "CigarOdyssey — diagnostic de delivrabilite\n";

// ── Configuration ─────────────────────────────────────────
titre('Configuration');

$driver = mail_driver();
$from   = defined('MAIL_FROM') ? MAIL_FROM : '';
$domain = substr(strrchr($from, '@') ?: '@', 1);

line('info', 'Pilote          : ' . $driver . (defined('MAIL_DRIVER') && MAIL_DRIVER !== $driver ? '  (demande : ' . MAIL_DRIVER . ')' : ''));
line('info', 'Expediteur      : ' . (defined('MAIL_FROM_NAME') ? MAIL_FROM_NAME . ' ' : '') . '<' . $from . '>');
line('info', 'Reply-To        : ' . (defined('MAIL_REPLY_TO') && MAIL_REPLY_TO !== '' ? MAIL_REPLY_TO : '(aucun)'));
line('info', 'URL du site     : ' . (defined('SITE_URL') ? SITE_URL : '(non definie — liens des emails casses)'));

if (!defined('SITE_URL') || SITE_URL === '') {
    ko('SITE_URL absente', "Les liens de verification et de reinitialisation seront invalides.\nRenseignez SITE_URL dans .env.");
}

if ($driver === 'log') {
    line('ok', 'Mode developpement : aucun email ne part reellement.');
    echo "\nRien d'autre a verifier tant que MAIL_LOG_ONLY vaut true.\n";
    exit(0);
}

if ($driver === 'mail') {
    if (defined('MAIL_DRIVER') && MAIL_DRIVER !== 'mail') {
        ko('Repli sur mail() : le pilote ' . MAIL_DRIVER . ' n\'a pas pu etre active',
           "MAIL_API_KEY est vide, ou l'extension cURL est absente.");
    } else {
        warn('Transport mail() : delivrabilite faible',
             "Pas de signature DKIM, IP mutualisee de l'hebergeur souvent mal notee.\n"
           . "Gmail et Outlook classent frequemment ces messages en spam.\n"
           . "Basculez MAIL_DRIVER sur brevo, mailgun ou resend (docs/emails.md).");
    }
} else {
    line('ok', 'Transport ' . $driver . ' : signature DKIM assuree par le prestataire.');
    if (!defined('MAIL_API_KEY') || strlen(MAIL_API_KEY) < 16) {
        warn('MAIL_API_KEY inhabituellement courte', 'Verifiez que la cle complete a bien ete copiee.');
    }
    if ($driver === 'mailgun') {
        $md = defined('MAILGUN_DOMAIN') && MAILGUN_DOMAIN !== '' ? MAILGUN_DOMAIN : $domain;
        line('info', 'Domaine Mailgun : ' . $md . '   (hote : ' . MAILGUN_HOST . ')');
        if (strpos(MAILGUN_HOST, 'eu.') === false) {
            line('info', 'Compte cree dans l\'UE ? utilisez MAILGUN_HOST=api.eu.mailgun.net');
        }
    }
}

// ── DNS ───────────────────────────────────────────────────
titre('DNS du domaine ' . $domain);

$etatDns = ($domain === '' || $domain === 'localhost') ? 'injoignable' : dns_utilisable($domain);

if ($etatDns !== 'ok') {
    $causes = [
        'indisponible' => 'La fonction dns_get_record est absente de cette installation PHP.',
        'injoignable'  => "Le domaine ne repond pas : resolveur inaccessible, ou domaine inexistant.\n"
                        . 'Relancez depuis le serveur de production, ou verifiez MAIL_FROM.',
        'detourne'     => "Le resolveur repond a des noms inexistants (DNS captif ou box operateur).\n"
                        . "Les verifications DKIM donneraient de faux positifs : elles sont ignorees.\n"
                        . 'Relancez depuis le serveur de production, ou via un resolveur public.',
    ];
    warn('Verifications DNS ignorees (' . $etatDns . ')', $causes[$etatDns] ?? '');
} else {
    // SPF
    $txtApex = txt_records($domain);
    $spf = $txtApex === false
         ? false
         : array_values(array_filter($txtApex, fn($t) => stripos($t, 'v=spf1') === 0));

    if ($spf === false) {
        // Cas courant sous Windows : la reponse TXT de l'apex depasse
        // 512 octets et le resolveur systeme ne bascule pas en TCP.
        warn('SPF non verifiable : la requete TXT sur ' . $domain . ' a echoue',
             "Ce n'est pas la preuve d'une absence d'enregistrement.\n"
           . 'Controlez a la main :  nslookup -type=TXT ' . $domain);
    } elseif (!$spf) {
        ko('SPF absent',
           "Publiez un TXT sur $domain autorisant votre prestataire, ex. :\n"
         . '  v=spf1 include:spf.brevo.com ~all');
    } elseif (count($spf) > 1) {
        ko('SPF multiple (' . count($spf) . ' enregistrements)',
           "Un domaine ne doit porter qu'un seul TXT v=spf1 ; sinon la verification echoue.\nFusionnez les include: dans un unique enregistrement.");
    } else {
        line('ok', 'SPF present', $spf[0]);
        if (stripos($spf[0], '+all') !== false) {
            ko('SPF en +all', 'Autorise n\'importe quel serveur a usurper votre domaine. Utilisez ~all ou -all.');
        }
    }

    // DKIM — on sonde les selecteurs usuels des prestataires supportes
    $selecteurs = ['brevo1', 'brevo2', 'mail', 'resend', 'mailo', 'smtp', 'k1', 'default', 'selector1'];
    $trouves = [];
    foreach ($selecteurs as $s) {
        if (txt_records($s . '._domainkey.' . $domain)) $trouves[] = $s;
    }
    if ($trouves) {
        line('ok', 'DKIM present', 'Selecteur(s) : ' . implode(', ', $trouves));
    } else {
        ko('DKIM introuvable',
           "Aucun selecteur usuel ne repond sur $domain.\n"
         . "Ajoutez les enregistrements fournis par votre prestataire, puis relancez.\n"
         . 'Selecteurs sondes : ' . implode(', ', $selecteurs));
    }

    // DMARC
    $dmarc = array_values(array_filter(txt_records('_dmarc.' . $domain) ?: [], fn($t) => stripos($t, 'v=DMARC1') === 0));
    if (!$dmarc) {
        ko('DMARC absent',
           "Publiez un TXT sur _dmarc.$domain, ex. :\n"
         . '  v=DMARC1; p=none; rua=mailto:dmarc@' . $domain . "\n"
         . 'Depuis 2024, Gmail et Yahoo exigent DMARC pour les envois vers leurs boites.');
    } else {
        line('ok', 'DMARC present', $dmarc[0]);
        if (stripos($dmarc[0], 'p=none') !== false) {
            line('info', 'Politique p=none : surveillance seule. Passez a p=quarantine une fois les rapports propres.');
        }
    }
}

// ── Envoi de test ─────────────────────────────────────────
$to = '';
foreach ($argv as $a) if (strpos($a, '--to=') === 0) $to = substr($a, 5);

if ($to !== '') {
    titre('Envoi de test vers ' . $to);
    $html = email_template(
        'Test de delivrabilite',
        'Ce message confirme que le transport ' . $driver . ' fonctionne. Si vous le lisez depuis votre boite de reception (et non depuis les indesirables), la configuration est bonne.',
        'Ouvrir CigarOdyssey', (defined('SITE_URL') ? SITE_URL : 'https://example.com'),
        'Message emis par tools/mail_doctor.php.'
    );
    $ok = send_email($to, 'CigarOdyssey — test de delivrabilite', $html);
    if ($ok) {
        line('ok', 'Message accepte par le transport.',
             "Verifiez la reception, et surtout le dossier indesirables.\n"
           . "Chez Gmail : « Afficher l'original » doit montrer SPF, DKIM et DMARC en PASS.");
    } else {
        ko('Envoi refuse', mail_last_error() ?: 'cause inconnue — voir backend/cache/mail_outbox.log');
    }
} else {
    titre('Envoi de test');
    line('info', 'Non demande. Ajoutez --to=votre@adresse.com pour envoyer un message reel.');
}

// ── Bilan ─────────────────────────────────────────────────
titre('Bilan');
if ($problemes === 0 && $alertes === 0) {
    line('ok', 'Aucun probleme detecte.');
} else {
    line($problemes ? 'ko' : 'warn', $problemes . ' probleme(s) bloquant(s), ' . $alertes . ' alerte(s).');
}
exit($problemes > 0 ? 1 : 0);
