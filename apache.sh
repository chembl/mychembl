python -mplatform | grep Ubuntu && export APACHE_HOME=/etc/apache2 || export APACHE_HOME=/etc/httpd
RAW=https://raw.githubusercontent.com/chembl/mychembl/master

sudo curl -o $APACHE_HOME/conf.d/launchpad.conf $RAW/configuration/launchpad.conf
#sudo curl -o /etc/apache2/apache2.conf $RAW/configuration/apache2.conf
python -mplatform | grep Ubuntu && sudo curl -o /etc/apache2/envvars $RAW/configuration/apache2_envvars || TODO
sudo curl -o /etc/phppgadmin/apache.conf $RAW/configuration/mychembl_phppgadmin_httpd.conf
sudo curl -o /etc/apache2/conf.d/phppgadmin $RAW/configuration/mychembl_phppgadmin_httpd.conf
sudo curl -o /etc/php5/apache2/php.ini $RAW/configuration/mychembl_php.ini
sudo kill -9 $(pidof apache2)
sudo a2enmod rewrite
sudo service apache2 restart

wget $RAW/webservices/ws_cache_generation.sh && sh ws_cache_generation.sh
