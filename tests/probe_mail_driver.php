<?php
// Sonde appelée par tests/run.php : imprime le pilote d'email retenu
// pour l'environnement courant. Les constantes de configuration étant
// définies une seule fois par processus, les variantes de MAIL_DRIVER
// se testent nécessairement dans un processus séparé.
if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }
require_once __DIR__ . '/../backend/config.php';
require_once __DIR__ . '/../backend/mailer.php';
echo mail_driver();
