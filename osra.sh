#!/bin/bash

sudo apt-get install -y graphicsmagick
sudo apt-get install -y libgraphicsmagick++1-dev
sudo apt-get install -y libgraphicsmagick++3
sudo apt-get install -y libgraphicsmagick1-dev
sudo apt-get install -y libgraphicsmagick3
sudo apt-get install -y libpotrace-dev
sudo apt-get install -y libpotrace0
sudo apt-get install -y potrace
sudo apt-get install -y libtclap-dev
sudo apt-get install -y openbabel
sudo apt-get install -y libopenbabel-dev
sudo apt-get install -y libnetpbm10-dev
sudo apt-get install -y libglib2.0-dev

cd /tmp
wget http://ftp.heanet.ie/mirrors/gnu/ocrad/ocrad-0.21.tar.gz -O ocrad.tgz
tar -zxvf ocrad.tgz
cd ocrad-0.21/
./configure
make
sudo make install
cd ..
rm -rf ocrad-0.21/
rm ocrad.tgz

cd /tmp
wget http://sourceforge.net/projects/osra/files/gocr-patched/gocr-0.50pre-patched.tgz
tar -zxvf gocr-0.50pre-patched.tgz
cd gocr-0.50pre-patched/
./configure
make libs
sudo make install
cd ..
rm -rf gocr-0.50pre-patched/
rm gocr-0.50pre-patched.tgz

cd /tmp
wget sourceforge.net/projects/osra/files/osra/2.0.0/osra-2.0.0.tgz
tar -zxvf osra-2.0.0.tgz
cd osra-2.0.0/
./configure
make all
sudo make install
cd ..
rm -rf osra-2.0.0/
rm osra-2.0.0.tgz



