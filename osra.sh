#!/bin/bash

sudo apt-get install -y graphicsmagick
sudo apt-get install -y libgraphicsmagick++1-dev
sudo apt-get install -y libgraphicsmagick++3
sudo apt-get install -y libgraphicsmagick1-dev
sudo apt-get install -y libgraphicsmagick3
sudo apt-get install -y libpotrace-dev
sudo apt-get install -y libpotrace0
sudo apt-get install -y potrace
sudo apt-get install -y libocrad-dev
sudo apt-get install -y ocrad
sudo apt-get install -y libtclap-dev
sudo apt-get install -y openbabel
sudo apt-get install -y libopenbabel-dev
sudo apt-get install -y libnetpbm10-dev
sudo apt-get install libglib2.0-dev

cd /tmp
wget http://sourceforge.net/projects/osra/files/gocr-patched/gocr-0.50pre-patched.tgz
tar -zxvf gocr-0.50pre-patched.tgz
cd gocr-0.50pre-patched/
./configure
make libs
sudo make install
cd src
sudo /usr/bin/install -c pgm2asc.h output.h list.h unicode.h gocr.h pnm.h /usr/local/include/gocr
sudo /usr/bin/install -c ../include/config.h /usr/local/include/gocr
cd ../..

cd /tmp
wget sourceforge.net/projects/osra/files/osra/2.0.0/osra-2.0.0.tgz
tar -zxvf osra-2.0.0.tgz
cd osra-2.0.0/
./configure --with-gocr-include=/tmp/gocr-0.50pre-patched/src

cd ..
rm -rf gocr-0.50pre-patched/
rm gocr-0.50pre-patched.tgz

