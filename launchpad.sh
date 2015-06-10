#!/bin/bash

python -mplatform | grep Ubuntu && APACHE_NAME="apache2" || APACHE_NAME="httpd"
WWW="/var/www/html/"

cd /tmp
sudo git clone $MYCHEMBL_WEBAPP
sudo git clone $MYCHEMBL_GIT
sudo rm $WWW* -rf
sudo mkdir -p ${WWW}mychembl
sudo cp -r mychembl/launchpad/* $WWW
sudo cp -r mychembl/launchpad/.htaccess $WWW
sudo cp -r mychembl_webapp/* ${WWW}mychembl/
wget $JSME_LOCATION -O JSME.zip
unzip JSME.zip
sudo mv JSME/jsme ${WWW}mychembl/static/js/

sudo -E kill -9 $(pidof $APACHE_NAME)
python -mplatform | grep Ubuntu && sudo service apache2 restart || sudo systemctl restart httpd -l
