#!/bin/bash
set -x

apt-get install git -y

apt-get install debconf-utils -y

DB_ROOT_PASSWD=root
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $DB_ROOT_PASSWD"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $DB_ROOT_PASSWD"

apt-get install mysql-server -y

sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf

systemctl restart mysql

DB_NAME=lamp_db
DB_USER=lamp_user
DB_PASSWD=lamp_user
mysql -u root -p$DB_ROOT_PASSWD <<< "DROP DATABASE IF EXISTS $DB_NAME;"
mysql -u root -p$DB_ROOT_PASSWD <<< "CREATE DATABASE $DB_NAME;"
mysql -u root -p$DB_ROOT_PASSWD <<< "GRANT ALL PRIVILEGES ON $DB_NAME.* TO $DB_USER@'%' IDENTIFIED BY '$DB_PASSWD';"
mysql -u root -p$DB_ROOT_PASSWD <<< "FLUSH PRIVILEGES;"

cd /home/ubuntu
rm -rf iaw-practica-lamp
git clone https://github.com/josejuansanchez/iaw-practica-lamp.git
mysql -u root -p$DB_ROOT_PASSWD < /home/ubuntu/iaw-practica-lamp/db/database.sql
