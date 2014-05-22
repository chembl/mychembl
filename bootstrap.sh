#!/bin/bash

sudo useradd -G sudo -s /bin/bash -m chembl
sudo echo "chembl:chemblvm"| sudo chpasswd

sudo sysctl -w kernel.shmmax=2147483648
sudo /sbin/iptables -A INPUT -i eth0 -p tcp --destination-port 5432 -j ACCEPT

sudo apt-get update
sudo apt-get install -y apache2
sudo apt-get install -y php5
sudo apt-get install -y php5-pgsql
sudo apt-get install -y git
sudo apt-get install -y unzip
sudo apt-get install -y ipython
sudo apt-get install -y ipython-notebook
sudo apt-get install -y ipython-qtconsole
sudo apt-get install -y libboost-all-dev
sudo apt-get install -y postgresql
sudo apt-get install -y postgresql-server-dev-all
sudo apt-get install -y postgresql-doc
sudo apt-get install -y postgresql-contrib
sudo apt-get install -y flex
sudo apt-get install -y bison
sudo apt-get install -y g++
sudo apt-get install -y cmake
sudo apt-get install -y unzip
sudo apt-get install -y git
sudo apt-get install -y python-numpy
sudo apt-get install -y python-scipy
sudo apt-get install -y python-matplotlib
sudo apt-get install -y python-pip
sudo apt-get install -y python-psycopg2
sudo apt-get install -y python-imaging-tk
sudo apt-get install -y python-pandas
sudo apt-get install -y python-networkx
sudo apt-get install -y python-sklearn

sudo -u postgres createuser -dSR chembl
sudo -u chembl createdb chembl_18

sudo pip install Cython
sudo pip install -U ipython
sudo pip install -U jinja2
sudo pip install -U scikit-learn
sudo pip install -U tornado
sudo pip install -U pandas
sudo pip install -U requests

sudo -u chembl mkdir /home/chembl/src
sudo -u chembl git clone https://github.com/chembl/mychembl_webapp.git /home/chembl/src/mychembl_webapp
sudo -u chembl git clone https://github.com/chembl/mychembl.git /home/chembl/src/mychembl
sudo mv /var/www /var/www_old
sudo mkdir /var/www
sudo cp -r /home/chembl/mychembl/launchpad/* /var/www/
sudo mkdir /var/www/mychembl/
sudo cp -r /home/chembl/mychembl_webapp/* /var/www/mychembl/
curl -O http://peter-ertl.com/jsme/download/JSME_2013-08-04.zip
unzip JSME_2013-08-04.zip
sudo mv JSME_2013-08-04/jsme /var/www/mychembl/static/js/
sudo curl -o /etc/apache2/httpd.conf https://raw.githubusercontent.com/chembl/mychembl/master/configuration/launchpad_httpd.conf
sudo curl -o /etc/apache2/envvars https://github.com/chembl/mychembl/blob/master/configuration/apache2_envvars
sudo -u chembl curl -o /home/chembl/.bashrc https://raw.githubusercontent.com/chembl/mychembl/master/configuration/mychembl_bashrc

curl -s https://raw.githubusercontent.com/chembl/mychembl/master/webservices/ws_setup.sh | sudo -i -u chembl bash
curl -s https://raw.githubusercontent.com/chembl/mychembl/master/ipython_notebooks/ipynb_deamonise.sh | sudo -i -u chembl bash
curl -s https://raw.githubusercontent.com/chembl/mychembl/master/rdkit_install.sh | sudo -i -u chembl bash

