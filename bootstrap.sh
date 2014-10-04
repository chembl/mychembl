#!/bin/bash

sudo useradd -G sudo -s /bin/bash -m chembl
sudo echo "chembl:chemblvm"| sudo chpasswd

sudo sysctl -w kernel.shmmax=2147483648
sudo /sbin/iptables -A INPUT -i eth0 -p tcp --destination-port 5432 -j ACCEPT

sudo dd if=/dev/zero of=/swapfile bs=1024 count=524288
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

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
#sudo apt-get install -y python-pandas
sudo apt-get install -y python-networkx
#sudo apt-get install -y python-sklearn
sudo apt-get install -y libnss-mdns
sudo apt-get install -y avahi-utils
sudo apt-get install -y python-gobject
sudo apt-get install -y python-dev
sudo apt-get install -y phppgadmin

sudo -u postgres createuser -dsr chembl

sudo pip install Cython
sudo pip install -U ipython
sudo pip install -U jinja2
sudo pip install -U scikit-learn
sudo pip install -U tornado
sudo pip install -U pandas
#sudo pip install -U requests
sudo pip install -U mpld3
sudo pip install -U service_identity
sudo pip install https://garage.maemo.org/frs/download.php/8363/python-brisa_0.10.3maemo0.tar.gz
sudo pip install -U paste
sudo pip install -U netifaces

if grep -Fxq "ipv6" /etc/modules
then
    modprobe ipv6
else
    sudo su
    echo ipv6 >> /etc/modules
    exit
fi


cd /tmp
sudo git clone https://github.com/chembl/mychembl_webapp.git
sudo git clone https://github.com/chembl/mychembl.git
sudo rm /var/www -rf
sudo mkdir /var/www
sudo cp -r mychembl/launchpad/* /var/www/
sudo mkdir /var/www/mychembl/
sudo cp -r mychembl_webapp/* /var/www/mychembl/
curl -O http://peter-ertl.com/jsme/download/JSME_2013-08-04.zip
unzip JSME_2013-08-04.zip
sudo mv JSME_2013-08-04/jsme /var/www/mychembl/static/js/
sudo curl -o /etc/apache2/httpd.conf https://raw.githubusercontent.com/chembl/mychembl/master/configuration/launchpad_httpd.conf
sudo curl -o /etc/apache2/apache2.conf https://raw.githubusercontent.com/chembl/mychembl/master/configuration/apache2.conf
sudo curl -o /etc/apache2/envvars https://raw.githubusercontent.com/chembl/mychembl/master/configuration/apache2_envvars
sudo curl -o /etc/network/interfaces https://raw.githubusercontent.com/chembl/mychembl/master/configuration/mychembl_interfaces
sudo -u chembl curl -o /home/chembl/.bashrc https://raw.githubusercontent.com/chembl/mychembl/master/configuration/mychembl_bashrc
sudo curl -o /etc/init/mychembl-upnp.conf https://raw.githubusercontent.com/chembl/mychembl/master/zeroconf/mychembl-upnp.conf
sudo curl -o /etc/avahi/services/mychembl.service https://raw.githubusercontent.com/chembl/mychembl/master/zeroconf/mychembl.service
sudo curl -o /usr/bin/mychembl-upnp.py https://raw.githubusercontent.com/chembl/mychembl/master/zeroconf/mychembl-upnp.py
sudo chmod +x /usr/bin/mychembl-upnp.py
sudo mkdir /usr/share/themes/mychembl
sudo curl -o /usr/share/themes/mychembl/mychembl.png https://raw.githubusercontent.com/chembl/mychembl/master/branding/mychembl.png
sudo curl -o /lib/plymouth/themes/ubuntu-text/ubuntu-text.plymouth https://github.com/chembl/mychembl/blob/master/branding/ubuntu-text.plymouth
sudo curl -o /etc/phppgadmin/apache.conf https://raw.githubusercontent.com/chembl/mychembl/master/configuration/mychembl_phppgadmin_httpd.conf
sudo curl -o /etc/apache2/conf.d/phppgadmin https://raw.githubusercontent.com/chembl/mychembl/master/configuration/mychembl_phppgadmin_httpd.conf

curl -s https://raw.githubusercontent.com/chembl/mychembl/master/osra.sh | sudo -i sh
curl -s https://raw.githubusercontent.com/chembl/mychembl/master/rdkit_install.sh | sudo -i -u chembl sh
curl -s https://raw.githubusercontent.com/chembl/mychembl/master/ipynb_setup.sh | sudo -i -u chembl sh
curl -s https://raw.githubusercontent.com/chembl/mychembl/master/create_db.sh | sudo -i -u chembl sh
curl -s https://raw.githubusercontent.com/chembl/mychembl/master/webservices/ws_setup.sh | sudo -i -u chembl sh
curl -s https://raw.githubusercontent.com/chembl/mychembl/master/ipython_notebooks/ipynb_deamonise.sh | sudo -i -u chembl sh

sudo swapoff -v /swapfile
sudo rm /swapfile
sudo rm /tmp/* -rf

sudo echo "GRUB_BACKGROUND=\"/usr/share/themes/mychembl/mychembl.png\"" >> /etc/default/grub
sudo update-grub
