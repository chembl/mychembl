#!/bin/bash

sudo useradd -G sudo -s /bin/bash -m chembl
sudo echo "chembl:chemblvm"| sudo chpasswd

sudo sysctl -w kernel.shmmax=2147483648
sudo /sbin/iptables -A INPUT -i eth0 -p tcp --destination-port 5432 -j ACCEPT

sudo dd if=/dev/zero of=/swapfile bs=1024 count=524288
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

wget https://raw.githubusercontent.com/chembl/mychembl/master/install_core_libs.sh && bash install_core_libs.sh
wget https://raw.githubusercontent.com/chembl/mychembl/master/install_py_libs.sh && bash install_py_libs.sh
wget https://raw.githubusercontent.com/chembl/mychembl/master/ensure_ipv6.sh && bash ensure_ipv6.sh

sudo -u postgres createuser -dsr chembl

cd /tmp
sudo git clone https://github.com/chembl/mychembl_webapp.git
sudo git clone https://github.com/chembl/mychembl.git
sudo rm /var/www -rf
sudo mkdir -p /var/www/html/mychembl
sudo cp -r mychembl/launchpad/* /var/www/html/
sudo cp -r mychembl/launchpad/.htaccess /var/www/html/
sudo cp -r mychembl_webapp/* /var/www/html/mychembl/
curl -O http://peter-ertl.com/jsme/download/JSME_2013-08-04.zip
unzip JSME_2013-08-04.zip
sudo mv JSME_2013-08-04/jsme /var/www/html/mychembl/static/js/
sudo curl -o /etc/network/interfaces https://raw.githubusercontent.com/chembl/mychembl/master/configuration/mychembl_interfaces
sudo -u chembl curl -o /home/chembl/.bashrc https://raw.githubusercontent.com/chembl/mychembl/master/configuration/mychembl_bashrc
sudo curl -o /etc/init/mychembl-upnp.conf https://raw.githubusercontent.com/chembl/mychembl/master/zeroconf/mychembl-upnp.conf
sudo curl -o /etc/avahi/services/mychembl.service https://raw.githubusercontent.com/chembl/mychembl/master/zeroconf/mychembl.service
sudo curl -o /usr/bin/mychembl-upnp.py https://raw.githubusercontent.com/chembl/mychembl/master/zeroconf/mychembl-upnp.py
sudo chmod +x /usr/bin/mychembl-upnp.py
sudo mkdir /usr/share/themes/mychembl
sudo curl -o /usr/share/themes/mychembl/mychembl.png https://raw.githubusercontent.com/chembl/mychembl/master/branding/mychembl.png
sudo curl -o /lib/plymouth/themes/ubuntu-text/ubuntu-text.plymouth https://github.com/chembl/mychembl/blob/master/branding/ubuntu-text.plymouth

cd /tmp
wget https://raw.githubusercontent.com/chembl/mychembl/master/osra.sh && bash osra.sh
wget https://raw.githubusercontent.com/chembl/mychembl/master/rdkit_install.sh && su -c "bash rdkit_install.sh" chembl
wget https://raw.githubusercontent.com/chembl/mychembl/master/ipynb_setup.sh && su -c "bash ipynb_setup.sh" chembl
wget https://raw.githubusercontent.com/chembl/mychembl/master/create_db.sh && su -c "bash create_db.sh" chembl
wget https://raw.githubusercontent.com/chembl/mychembl/master/webservices/ws_setup.sh && su -c "bash ws_setup.sh" chembl
wget https://raw.githubusercontent.com/chembl/mychembl/master/beaker/install_beaker.sh && su -c "bash install_beaker.sh" chembl
wget https://raw.githubusercontent.com/chembl/mychembl/master/ipython_notebooks/ipynb_deamonise.sh && su -c "bash ipynb_deamonise.sh" chembl
wget https://raw.githubusercontent.com/chembl/mychembl/master/apache.sh && bash apache.sh


sudo swapoff -v /swapfile
sudo rm /swapfile
sudo rm /tmp/* -rf

sudo bash -c "echo \"GRUB_BACKGROUND=\\\"/usr/share/themes/mychembl/mychembl.png\\\"\" >> /etc/default/grub"
sudo update-grub
