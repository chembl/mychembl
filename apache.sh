#!/bin/bash

sudo su -c "chmod -R 755 /home/chembl" chembl

if [ "$AUX_OS_NAME" != "Ubuntu" ]
   then
        sudo su -c "chcon -R -t httpd_user_content_t /home/chembl" chembl
        sudo su -c "chcon -R -t httpd_sys_script_exec_t /opt/indigo" chembl
        sudo setsebool -P httpd_can_network_connect_db on
        sudo setsebool -P httpd_can_network_connect on
        sudo setsebool -P httpd_enable_homedirs on
fi

if [ "$AUX_OS_NAME" = "Ubuntu" ]
   then
       export APACHE_NAME="apache2"
       export APACHE_HOME=/etc/$APACHE_NAME
       export APACHE_ENV_FILE=/etc/apache2/envvars
       export APACHE_EXPORT="export "
       export PHPPGADMIN="phppgadmin"
       export APACHE_SITES="$APACHE_HOME/sites-available"
       export PHP_INI="/etc/php5/apache2/php.ini"
       sudo a2dissite 000-default
       sudo service apache2 reload
       sudo -E rm $APACHE_SITES/*
   else
       export APACHE_NAME="httpd"
       export APACHE_HOME=/etc/$APACHE_NAME
       export APACHE_ENV_FILE=/etc/sysconfig/httpd
       export APACHE_EXPORT=""
       export PHPPGADMIN="phpPgAdmin"
       export APACHE_SITES="$APACHE_HOME/conf.d"
       export PHP_INI="/etc/php.ini"
fi

export PGADMIN_CONFIG="$APACHE_SITES/$PHPPGADMIN.conf"

sudo -E curl -o $APACHE_SITES/launchpad.conf $RAW/configuration/launchpad.conf
sudo -E curl -o $APACHE_SITES/chembl_webservices.conf $RAW/webservices/conf/chembl_webservices.conf
sudo -E bash -c 'echo "${APACHE_EXPORT}LD_LIBRARY_PATH=/home/chembl/rdkit/lib:\$LD_LIBRARY_PATH" >> ${APACHE_ENV_FILE}'
sudo -E curl -o /etc/$PHPPGADMIN/config.inc.php $RAW/configuration/phppgadmin_config.inc.php
sudo -E curl -o $PGADMIN_CONFIG $RAW/configuration/phppgadmin_${AUX_OS_NAME}.conf

sudo -E curl -o $PHP_INI $RAW/configuration/mychembl_php.ini
sudo -E kill -9 $(pidof $APACHE_NAME)

if [ "$AUX_OS_NAME" = "Ubuntu" ]
   then
      sudo a2enmod rewrite
      sudo a2enmod proxy
      sudo a2enmod proxy_http
      sudo a2ensite phppgadmin
      sudo a2ensite launchpad
      sudo a2ensite chembl_webservices
      sudo service apache2 restart
   else
      sudo bash -c 'echo "LoadModule rewrite_module modules/mod_rewrite.so" > /etc/httpd/conf.modules.d/10-rewrite.conf'
      sudo systemctl restart httpd -l
fi

wget $RAW/webservices/ws_cache_generation.sh && sh ws_cache_generation.sh
