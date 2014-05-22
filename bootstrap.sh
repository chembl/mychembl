#!/bin/bash

sudo apt-get update
sudo apt-get install apache2
sudo apt-get install php5
sudo apt-get install php5-pgsql
sudo apt-get install git
sudo apt-get install unzip
sudo apt-get install ipython
sudo apt-get install ipython-notebook
sudo apt-get install ipython-qtconsole
sudo apt-get install libboost-all-dev
sudo apt-get install postgresql
sudo apt-get install postgresql-server-dev-all
sudo apt-get install postgresql-doc
sudo apt-get install postgresql-contrib
sudo apt-get install flex
sudo apt-get install bison
sudo apt-get install g++
sudo apt-get install cmake
sudo apt-get install unzip
sudo apt-get install git
sudo apt-get install python-numpy
sudo apt-get install python-scipy
sudo apt-get install python-matplotlib
sudo apt-get install python-pip
sudo apt-get install python-psycopg2
sudo apt-get install python-imaging-tk
sudo apt-get install python-pandas
sudo apt-get install python-networkx
sudo apt-get install python-sklearn

sudo pip install -U ipython
sudo pip install -U jinja2
sudo pip install -U scikit-learn
sudo pip install -U tornado
sudo pip install -U pandas #will update numpy too
sudo pip install -U requests

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
