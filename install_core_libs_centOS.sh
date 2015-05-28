#!/bin/bash

# for  CentOS Linux release 7.1.1503

sudo rpm -iUvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
sudo rpm -iUvh http://yum.postgresql.org/9.3/redhat/rhel-7-x86_64/pgdg-centos93-9.3-1.noarch.rpm
sudo yum -y update
sudo yum install -y kernel-devel
sudo yum install -y freetype freetype-devel
sudo yum install -y libpng libpng-devel
sudo yum install -y openjpeg openjpeg-devel
sudo yum install -y libtiff libtiff-devel
sudo yum install -y dkms
sudo yum install -y bash
sudo yum install -y git
sudo yum install -y unzip
sudo yum install -y ruby
sudo yum install -y openssl-devel
sudo yum install -y libxml2 libxml2-devel
sudo yum install -y libxslt libxslt-devel
sudo yum install -y boost
sudo yum install -y boost-devel
sudo yum install -y flex
sudo yum install -y bison
sudo yum install -y gcc*
sudo yum install -y cmake
sudo yum install -y make
sudo yum install -y libffi-devel
sudo yum -y --enablerepo=epel install uuid
sudo yum install -y postgresql93 postgresql93-server postgresql93-contrib postgresql93-debuginfo postgresql93-libs --disablerepo=* --enablerepo=pgdg93
sudo yum install -y python-psycopg2
sudo yum install -y tkinter
sudo yum install -y nss-mdns avahi-compat-libdns_sd-devel
sudo yum install -y avahi-tools
sudo yum install -y pygobject3
sudo yum install -y python-devel
sudo yum install -y ntsysv
sudo yum install -y GraphicsMagick
sudo yum install -y GraphicsMagick-devel
sudo yum install -y GraphicsMagick-c++
sudo yum install -y GraphicsMagick-c++-devel
sudo yum install -y potrace
sudo yum install -y potrace-devel
sudo yum install -y openbabel
sudo yum install -y openbabel-devel
sudo yum install -y netpbm-devel
sudo yum install -y glib2-devel

sudo systemctl enable postgresql-9.3
sudo /usr/pgsql-9.3/bin/postgresql93-setup initdb
sudo systemctl start postgresql-9.3

sudo mkdir /media/cdrom/
sudo mount /dev/cdrom /media/cdrom/
cd /media/cdrom/
sudo ./VBoxLinuxAdditions.run

gem install gist
