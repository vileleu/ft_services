<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wp' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'admin123' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '^Q2aR1/e!EeUk0u1po7AvT/?Ry`TG.4]=>EE,E&[-0%5/A+.~~r4mywGu#h<{H)h' );
define( 'SECURE_AUTH_KEY',  'z_5Wr:L`u f  F0<<T$!h}kk%.n(;5FbYF~?N+TKP5#[=sH}+vOYbF0MxMX9<Z]o' );
define( 'LOGGED_IN_KEY',    '09cP4O:Bb rvV44zqKwec6#DWvST8jKG=-3IQTrM0p1G^G0M9Tp:[DV74 -S-g{r' );
define( 'NONCE_KEY',        '6YjM6%0U^MoH39(yAsN<6x/s&srKd0Aa%Xn#)YW^ZB(/G_ylQ% (h}KQ4w9N0o4q' );
define( 'AUTH_SALT',        'QFOTCu~|LXxY>CY6#G#*u~+y?lMh5q}?RXzS8F:&eJ60KXpCsq:0i;9y,jB:f}VC' );
define( 'SECURE_AUTH_SALT', '=(]DxTF]c}J:S<o#D%:G?R{<75~8]xD%W;9r7VH{pl&_6I$;7,Et[n1<Uys}E3yU' );
define( 'LOGGED_IN_SALT',   '?5ue=m[X>~2O%+l1DfB=uqDQMRPn/:y6*i,Xs5tB31Pjk_Mv=dTaKZo.8/SxSI8k' );
define( 'NONCE_SALT',       'L1;5z$N/x>($S!|Q|$oCSRfFOiNqtqN?-KX-TWoFWb9Oh-efKW}_U8TT$f(3Q[%L' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';