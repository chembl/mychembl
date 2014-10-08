#!/bin/bash

export RDBASE=$HOME/rdkit
export LD_LIBRARY_PATH=$RDBASE/lib:$LD_LIBRARY_PATH
export PYTHONPATH=$RDBASE:$PYTHONPATH

cd $HOME
git clone https://github.com/rdkit/rdkit
cd rdkit/
git checkout tags/Release_2014_03_1
cd $RDBASE/External/INCHI-API
sed -i 's/sites\/default\/files\/inchi-1.04/wp\/wp-content\/uploads\/2014\/06/g' download-inchi.sh
sed -i 's/wget http/curl -O http/g' download-inchi.sh
bash download-inchi.sh

cd $RDBASE
mkdir build
cd build
cmake -DRDK_BUILD_INCHI_SUPPORT=ON ..
make -j4 install
ctest

cd $RDBASE/Code/PgSQL/rdkit
make
echo "chemblvm" | sudo -S make install
make installcheck
