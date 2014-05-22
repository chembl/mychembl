#!/bin/bash

git clone https://github.com/rdkit/rdkit
cd rdkit/
git checkout tags/Release_2014_03_1
cd $RDBASE/External/INCHI-API
bash download-inchi.sh

cd $RDBASE
mkdir build
cd build
cmake -DRDK_BUILD_INCHI_SUPPORT=ON ..
make -j4 install
ctest

cd $RDBASE/Code/PgSQL/rdkit
make
sudo make install
make installcheck
