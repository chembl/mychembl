#!/bin/bash

python -mplatform | grep Ubuntu && export APACHE_NAME="apache2" || export APACHE_NAME="httpd"

cd /tmp
sudo git clone $MYCHEMBL_WEBAPP
sudo git clone $MYCHEMBL_GIT
sudo rm /var/www/html/* -rf
sudo mkdir -p /var/www/html/mychembl
sudo cp -r mychembl/launchpad/* /var/www/html/
sudo cp -r mychembl/launchpad/.htaccess /var/www/html/
sudo cp -r mychembl_webapp/* /var/www/html/mychembl/
wget $JSME_LOCATION -O JSME.zip
unzip JSME.zip
sudo mv JSME/jsme /var/www/html/mychembl/static/js/

sudo -E kill -9 $(pidof $APACHE_NAME)
python -mplatform | grep Ubuntu && sudo service apache2 restart || sudo systemctl restart httpd -l
