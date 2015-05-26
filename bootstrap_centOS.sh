#!/bin/bash

# for  CentOS Linux release 7.1.1503

sudo useradd -G wheel -s /bin/bash -m chembl
udo echo "chembl:chemblvm"| sudo chpasswd

sudo sysctl -w kernel.shmmax=2147483648
sudo /sbin/iptables -A INPUT -i eth0 -p tcp --destination-port 5432 -j ACCEPT

sudo dd if=/dev/zero of=/swapfile bs=1024 count=524288
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

wget https://raw.githubusercontent.com/chembl/mychembl/master/install_core_libs_centOS.sh && bash install_core_libs_centOS.sh
wget https://raw.githubusercontent.com/chembl/mychembl/master/install_py_libs_centOS.sh && bash install_py_libs_centOS.sh

sudo -Hu postgres createuser -dsr chembl
