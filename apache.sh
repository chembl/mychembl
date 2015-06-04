python -mplatform | grep Ubuntu && export APACHE_NAME="apache2" || export APACHE_NAME="httpd"
export APACHE_HOME=/etc/$APACHE_NAME
python -mplatform | grep Ubuntu && export APACHE_ENV_FILE=/etc/apache2/envvars || export APACHE_ENV_FILE=/etc/sysconfig/httpd
python -mplatform | grep Ubuntu && export APACHE_EXPORT="export " || export APACHE_EXPORT=
python -mplatform | grep Ubuntu && export AUX_OS_NAME="Ubuntu" || export AUX_OS_NAME="CentOS"
python -mplatform | grep Ubuntu && export PHPPGADMIN="phppgadmin" || export PHPPGADMIN="phpPgAdmin"
python -mplatform | grep Ubuntu && export PGADMIN_CONFIG="$APACHE_HOME/sites-available/$PHPPGADMIN.conf" || export PGADMIN_CONFIG="$APACHE_HOME/conf.d/$PHPPGADMIN.conf"
python -mplatform | grep Ubuntu && export PHP_INI="/etc/php5/apache2/php.ini" || export PHP_INI="/etc/php.ini"
RAW=https://raw.githubusercontent.com/chembl/mychembl/master

sudo -E curl -o $APACHE_HOME/conf.d/launchpad.conf $RAW/configuration/launchpad.conf
sudo -E bash -c 'echo "${APACHE_EXPORT}LD_LIBRARY_PATH=/home/chembl/rdkit/lib:\$LD_LIBRARY_PATH" >> ${APACHE_ENV_FILE}'
sudo -E curl -o /etc/$PHPPGADMIN/config.inc.php $RAW/configuration/phppgadmin_config.inc.php
sudo -E curl -o $PGADMIN_CONFIG $RAW/configuration/phppgadmin_${AUX_OS_NAME}.conf

sudo -E curl -o $PHP_INI $RAW/configuration/mychembl_php.ini
sudo -E kill -9 $(pidof $APACHE_NAME)
python -mplatform | grep Ubuntu && sudo a2enmod rewrite || sudo bash -c 'echo "LoadModule rewrite_module modules/mod_rewrite.so" > /etc/httpd/conf.modules.d/10-rewrite.conf'
python -mplatform | grep Ubuntu && sudo a2ensite phppgadmin
python -mplatform | grep Ubuntu && sudo service apache2 restart || sudo systemctl restart httpd -l

wget $RAW/webservices/ws_cache_generation.sh && sh ws_cache_generation.sh
