sudo curl -o /etc/apache2/httpd.conf https://raw.githubusercontent.com/chembl/mychembl/master/configuration/launchpad_httpd.conf
sudo curl -o /etc/apache2/apache2.conf https://raw.githubusercontent.com/chembl/mychembl/master/configuration/apache2.conf
sudo curl -o /etc/apache2/envvars https://raw.githubusercontent.com/chembl/mychembl/master/configuration/apache2_envvars
sudo curl -o /etc/phppgadmin/apache.conf https://raw.githubusercontent.com/chembl/mychembl/master/configuration/mychembl_phppgadmin_httpd.conf
sudo curl -o /etc/apache2/conf.d/phppgadmin https://raw.githubusercontent.com/chembl/mychembl/master/configuration/mychembl_phppgadmin_httpd.conf
sudo curl -o /etc/php5/apache2/php.ini https://raw.githubusercontent.com/chembl/mychembl/master/configuration/mychembl_php.ini
sudo kill -9 $(pidof apache2)
sudo a2enmod rewrite
sudo service apache2 restart

wget https://raw.githubusercontent.com/chembl/mychembl/master/webservices/ws_cache_generation.sh && sh ws_cache_generation.sh
