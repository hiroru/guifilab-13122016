<?php
define('DB_NAME', 'wordpress');
define('DB_USER', 'wordpress');
define('DB_PASSWORD', 'BHiUoXaK&jgmwkxiv7pN9q7mk');
define('DB_HOST', 'sbarroso-mysql-svc');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

define('AUTH_KEY',         'fFz+;#-#51|J5a9juk!:O$H%|9wRf-*3A][~nk3>aK-K&=njxL5U@fi^A@%L3F>L');
define('SECURE_AUTH_KEY',  'jd>+Q+T[|SSsJ)O^x({!0vA>=Z /mcl-}dp(0=7[y/Q~&1M#n= 2ziU.6:pp%--x');
define('LOGGED_IN_KEY',    'hZl)/>BN2h~J4 nnR%%Zm+9$b{lL[i5AXT92pJO#-`1!d-^VUl,.*={hS64SoXgh');
define('NONCE_KEY',        'F7zBH.V=9EQL9<J+DP|8KpMigC6_$3cwIF&%I+VOiv-C#d}<xJi~J0.~)0d)p+}u');
define('AUTH_SALT',        '+^^uC5~]h|r|/u k7-rG|e%rIG&q&WrTzy}qL!x@#7>2QcEl4LIv&3)}WEg,QH*Z');
define('SECURE_AUTH_SALT', 'L+M/:Q#s?RfQ)r3|p,zKHORVm^/WaI#FB%?F_ha{B.Ny&z;-nWG{>|j8<u#Yb>rs');
define('LOGGED_IN_SALT',   'S%@Uf8O?12Z0yy]}:VmSE-Izd1P]RrMpdC2F|XX?.Q#1MunCze5FK)A=Nmupb>T0');
define('NONCE_SALT',       '6?3LkRue$#Zgoh)Pz=~C;0Ga@ +Q}8RY!C(y~n-HSc-|-|| M1|XA6z^+W-hB/R ');

$table_prefix  = 'wp_';
define('WPLANG', '');
define('WP_DEBUG', false);
define( 'AUTOMATIC_UPDATER_DISABLED', false );
define( 'WP_AUTO_UPDATE_CORE', true );
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

require_once(ABSPATH . 'wp-settings.php');
