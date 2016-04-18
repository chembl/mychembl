#!/bin/bash

# location of raw files of this repository
export RAW="https://raw.githubusercontent.com/chembl/mychembl/master"

sudo apt-get install -y wget

wget $RAW/settings.sh && source settings.sh
wget $RAW/install_core_libs_${AUX_OS_NAME}.sh && bash install_core_libs_${AUX_OS_NAME}.sh
wget $RAW/install_py_libs.sh && bash install_py_libs.sh
wget $RAW/ensure_ipv6.sh && bash ensure_ipv6.sh

sudo useradd -G sudo -s /bin/bash -m chembl
sudo echo "chembl:chemblvm"| sudo chpasswd

sudo sysctl -w kernel.shmmax=2147483648
sudo /sbin/iptables -A INPUT -i eth0 -p tcp --destination-port 5432 -j ACCEPT

sudo dd if=/dev/zero of=/swapfile bs=1024 count=524288
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

export POSTGRES_VERSION=9.4
export POSTGRES_ROOT=/etc/postgresql/$POSTGRES_VERSION
export POSTGRES_CONFIG=$POSTGRES_ROOT/main
echo "chemblvm" | sudo -SE curl -o $POSTGRES_CONFIG/postgresql.conf $RAW/configuration/mychembl_postgresql_${AUX_OS_NAME}.conf
ln -sf /opt/conda/share/postgresql/extension/* $POSTGRES_ROOT/extension/
echo "chemblvm" | sudo -S service postgresql restart

echo "vagrant" | sudo -Su postgres createuser -dsr chembl # sudo -u postgres createuser -dsr chembl

cd /tmp
sudo curl -o /etc/network/interfaces $RAW/configuration/mychembl_interfaces
sudo curl -o /etc/init/failsafe.conf $RAW/configuration/failsafe.conf
sudo curl -o /etc/profile.d/mychembl.sh $RAW/configuration/mychembl_bashrc
sudo curl -o /etc/init/mychembl-upnp.conf $RAW/zeroconf/mychembl-upnp.conf
sudo curl -o /etc/avahi/services/mychembl.service $RAW/zeroconf/mychembl.service
sudo curl -o /usr/bin/mychembl-upnp.py $RAW/zeroconf/mychembl-upnp.py
sudo chmod +x /usr/bin/mychembl-upnp.py
sudo mkdir -p /usr/share/themes/mychembl
sudo curl -o /usr/share/themes/mychembl/mychembl.png $RAW/branding/mychembl.png
sudo curl -o /lib/plymouth/themes/ubuntu-text/ubuntu-text.plymouth $RAW/branding/ubuntu-text.plymouth

wget $RAW/osra.sh && source osra.sh
wget $RAW/rdkit_install.sh && sudo -E su -m -c "bash rdkit_install.sh" chembl
wget $RAW/ipynb_setup.sh && sudo -E su -m -c "bash ipynb_setup.sh" chembl
wget $RAW/create_db.sh && sudo -E su -m -c "bash create_db.sh" chembl
wget $RAW/webservices/ws_setup.sh && sudo -E su -m -c "bash ws_setup.sh" chembl
wget $RAW/beaker/install_beaker.sh && sudo -E su -m -c "bash install_beaker.sh" chembl
wget $RAW/ipython_notebooks/ipynb_deamonise.sh && source ipynb_deamonise.sh
wget $RAW/apache.sh && source apache.sh
wget $RAW/launchpad.sh && source launchpad.sh

sudo apt-get remove -y cloud-init
sudo rm /etc/init/cloud-* -rf

sudo swapoff -v /swapfile
sudo rm /swapfile
sudo rm /tmp/* -rf

sudo bash -c "echo \"GRUB_BACKGROUND=\\\"/usr/share/themes/mychembl/mychembl.png\\\"\" >> /etc/default/grub"
sudo update-grub
