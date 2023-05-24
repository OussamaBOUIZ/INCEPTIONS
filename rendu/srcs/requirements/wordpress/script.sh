#!/bin/sh
DOMAIN_NAME=obouizga.42.fr
WP_TITLE=personal_blog
WP_ADMIN_USR=obouizga
WP_ADMIN_PWD=obouizgawp
WP_ADMIN_EMAIL=obouizga@wp.fr
WP_USR=testusr
WP_EMAIL=testusr@wp.fr
WP_PWD=test13

mkdir -p /var/www/html

cd /var/www/html

# rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

sed -i -r "s/'database_name_here'/'OUSSAMADB'/1" wp-config.php
sed -i -r "s/'username_here'/'obouizga'/1" wp-config.php
sed -i -r "s/'password_here'/'mariadbpwd'/1" wp-config.php
sed -i -r "s/localhost/mariadb/1" wp-config.php 

wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR \
                --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL \
                --skip-email --allow-root

wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root

###############################################

# uses the sed command to modify the www.conf file in the /etc/php/7.3/fpm/pool.d directory. The s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g command substitutes the value 9000 for /run/php/php7.3-fpm.sock throughout the file. This changes the socket that PHP-FPM listens on from a Unix domain socket to a TCP port.
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
# creates the /run/php directory, which is used by PHP-FPM to store Unix domain sockets.
mkdir /run/php

# starts the PHP-FPM service in the foreground. The -F flag tells PHP-FPM to run in the foreground, rather than as a daemon in the background.
/usr/sbin/php-fpm7.3 -F