#!/bin/bash

sudo apt-get update
sudo apt-get install apache2
sudo apt-get install php5
sudo apt-get install php5-pgsql
sudo apt-get install git
sudo apt-get install unzip

cd /home/chembl
mkdir src
cd src
sudo git clone https://github.com/chembl/mychembl_webapp.git
sudo git clone https://github.com/chembl/mychembl.git
sudo mv /var/www /var/www_old
sudo mkdir /var/www
sudo cp -r mychembl/launchpad/* /var/www/
sudo mkdir /var/www/mychembl/
sudo cp -r mychembl_webapp/* /var/www/mychembl/
curl -O http://peter-ertl.com/jsme/download/JSME_2013-08-04.zip
unzip JSME_2013-08-04.zip
sudo mv JSME_2013-08-04/jsme /var/www/mychembl/static/js/
sudo cp mychembl/configuration/launchpad_httpd.conf /etc/apache2/httpd.conf

curl -s https://raw.githubusercontent.com/chembl/mychembl/master/webservices/ws_setup.sh | sh
