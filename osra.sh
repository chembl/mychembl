#!/bin/bash

# This script installs osra (http://cactus.nci.nih.gov/osra/)
# Author: Michal Nowotka, mnowotka@ebi.ac.uk
# Created date: 06.10.2014

# first, let's install all required dependencies, that can be installed from ubuntu repositories
yes | sudo apt-get install -y graphicsmagick
yes | sudo apt-get install -y libgraphicsmagick++1-dev
yes | sudo apt-get install -y libgraphicsmagick++3
yes | sudo apt-get install -y libgraphicsmagick1-dev
yes | sudo apt-get install -y libgraphicsmagick3
yes | sudo apt-get install -y libpotrace-dev
yes | sudo apt-get install -y libpotrace0
yes | sudo apt-get install -y potrace
yes | sudo apt-get install -y libtclap-dev
yes | sudo apt-get install -y openbabel
yes | sudo apt-get install -y libopenbabel-dev
yes | sudo apt-get install -y libnetpbm10-dev
yes | sudo apt-get install -y libglib2.0-dev

# installing ocrad (https://www.gnu.org/software/ocrad/) from source bacause standard distribution doesn't work for me...
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

# installing special patched version of gocr
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

# finally, installing osra itself
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



