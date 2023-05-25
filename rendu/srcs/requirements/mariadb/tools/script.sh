#!/bin/sh

cat << EOF > /etc/mysql/my.cnf
[mysqld]
user = root
port = 3306
socket = /var/run/mysqld/mysqld.sock
bind-address = 0.0.0.0
EOF
mysql_install_db #--user=mysql --datadir=/var/lib/mysql

service mysql start
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME ;" > db.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PWD' ;" >> db.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' ;" >> db.sql
echo "FLUSH PRIVILEGES;" >> db.sql

mysql < db.sql
service mysql stop
mysqld