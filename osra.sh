#!/bin/bash

# This script installs osra (http://cactus.nci.nih.gov/osra/)
# Author: Michal Nowotka, mnowotka@ebi.ac.uk
# Created date: 06.10.2014

# installing TCLAP (http://tclap.sourceforge.net/)
cd /tmp
wget $TCLAP_LOCATION -O tclap.tgz
tar -zxvf tclap.tgz
cd tclap-${TCLAP_VERSION}/
./configure
make
sudo make install
cd ..
rm -rf tclap-${TCLAP_VERSION}/
rm tclap.tgz

# installing ocrad (https://www.gnu.org/software/ocrad/) from source bacause standard distribution doesn't work for me...
cd /tmp
wget $OCRAD_LOCATION -O ocrad.tgz
tar -zxvf ocrad.tgz
cd ocrad-${OCRAD_VERSION}/
./configure
make
sudo make install
cd ..
rm -rf ocrad-${OCRAD_VERSION}/
rm ocrad.tgz

# installing special patched version of gocr
cd /tmp
wget $GOCR_LOCATION -O gocr.tgz
tar -zxvf gocr.tgz
cd gocr-${GOCR_VERSION}/
./configure
make libs
sudo make install
cd ..
rm -rf gocr-${GOCR_VERSION}/
rm gocr.tgz

# finally, installing osra itself
cd /tmp
wget $OSRA_LOCATION -O osra.tgz
tar -zxvf osra.tgz
cd osra-${OSRA_VERSION}/
./configure
make all
sudo make install
cd ..
rm -rf osra-${OSRA_VERSION}/
rm osra.tgz
