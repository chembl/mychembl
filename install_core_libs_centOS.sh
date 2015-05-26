#!/bin/bash

# for  CentOS Linux release 7.1.1503

sudo rpm -iUvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
sudo rpm -iUvh http://yum.postgresql.org/9.3/redhat/rhel-7-x86_64/pgdg-centos93-9.3-1.noarch.rpm
sudo yum -y update
sudo yum install -y kernel-devel
sudo yum install -y dkms
sudo yum install -y bash
sudo yum install -y git
sudo yum install -y unzip
sudo yum install -y ruby
sudo yum install -y openssl-devel
sudo yum install -y libxml2 libxml2-devel
sudo yum install -y libxslt libxslt-devel
#sudo apt-get install -y ipython-qtconsole
sudo yum install -y boost
sudo yum install -y postgresql93 postgresql93-server postgresql93-contrib postgresql93-libs --disablerepo=* --enablerepo=pgdg93
#sudo yum install -y postgresql
#sudo yum install -y postgresql-devel
#sudo yum install -y postgresql-docs
#sudo yum install -y postgresql-contrib
sudo yum install -y flex
sudo yum install -y bison
sudo yum install -y gcc*
sudo yum install -y cmake
sudo yum install -y make
sudo yum install -y libffi-devel
#sudo yum install -y numpy
#sudo yum install -y scipy
#sudo yum install -y python-matplotlib
#sudo yum install -y python-pip
sudo yum install -y python-psycopg2
sudo yum install -y tkinter
sudo yum install -y python-networkx
sudo yum install -y nss-mdns avahi-compat-libdns_sd-devel
sudo yum install -y avahi-tools
sudo yum install -y pygobject3
sudo yum install -y python-devel
sudo yum install -y ntsysv

sudo systemctl enable postgresql-9.3
sudo /usr/pgsql-9.3/bin/postgresql93-setup initdb
sudo systemctl start postgresql-9.3

sudo mkdir /media/cdrom/
sudo mount /dev/cdrom /media/cdrom/
cd /media/cdrom/
sudo ./VBoxLinuxAdditions.run

gem install gist
