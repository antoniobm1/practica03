#!/bin/bash
set -x
#Actualizamos los repositorios
sudo apt-get update

#Instalamos apache
sudo apt-get install apache2 -y

#Instalamos paquetes para apache
sudo apt-get install php libapache2-mod-php php-mysql -y

#Instalamos adminer
cd /var/www/html
mkdir adminer
cd adminer
sudo wget https://github.com/vrana/adminer/releases/download/v4.3.1/adminer-4.3.1-mysq$
sudo mv adminer-4.3.1-mysql.php index.php
