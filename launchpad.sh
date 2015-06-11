#!/bin/bash

[[ "$AUX_OS_NAME" = "Ubuntu" ]] && export APACHE_NAME="apache2" || export APACHE_NAME="httpd"
export AUX_WWW="/var/www/html/"

cd /tmp
sudo git clone $MYCHEMBL_WEBAPP
sudo git clone $MYCHEMBL_GIT
sudo -E rm $AUX_WWW* -rf
sudo -E mkdir -p ${AUX_WWW}mychembl
sudo -E cp -r mychembl/launchpad/* $AUX_WWW
sudo -E cp -r mychembl/launchpad/.htaccess $AUX_WWW
sudo -E cp -r mychembl_webapp/* ${AUX_WWW}mychembl/
sed -i 's/Release XXX/Release ${CHEMBL_VERSION}/g' ${AUX_WWW}mychembl/launchpad/*.php

wget $JSME_LOCATION -O JSME.zip
unzip JSME.zip
sudo -E mv JSME_${JSME_VERSION}/jsme ${AUX_WWW}mychembl/static/js/

sudo -E kill -9 $(pidof $APACHE_NAME)
python -mplatform | grep Ubuntu && sudo service apache2 restart || sudo systemctl restart httpd -l
