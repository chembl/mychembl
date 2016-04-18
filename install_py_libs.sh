#!/bin/bash

wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh -O miniconda.sh;
sudo bash miniconda.sh -b -p /opt/conda
sudo ln -sf /opt/conda/bin/* /usr/local/bin
hash -r
sudo conda config --set always_yes yes --set changeps1 no
sudo conda update -q conda
sudo conda install anaconda-client

#sudo -H pip install pyopenssl 
sudo conda install ndg-httpsclient
#sudo -H pip install pyasn1
sudo conda install lxml
sudo -H pip install supervisor --pre
sudo conda install Pillow
sudo conda install cairo #sudo -H pip install cairocffi
sudo conda install numpy
sudo conda install scipy
sudo conda install matplotlib
sudo conda install networkx
sudo conda install ipython-notebook
sudo conda install biopython
sudo conda install scikit-learn
sudo -H pip install -U chembl_migration_model
sudo -H pip install -U chembl_webresource_client
sudo conda install pandas
sudo -H pip install git+git://github.com/jakevdp/mpld3.git@master
sudo conda install service_identity
sudo -H pip install https://garage.maemo.org/frs/download.php/8363/python-brisa_0.10.3maemo0.tar.gz
sudo conda install paste
sudo -H pip install -U netifaces
#sudo -H pip install virtualenv
#sudo -H pip install virtualenvwrapper
sudo conda install progressbar
sudo -H pip install -U plotly
sudo conda install -c https://conda.binstar.org/rdkit rdkit-postgresql
sudo ln -sf /opt/conda/bin/* /usr/local/bin

wget $CHEM_FP_LOCATION
tar -zxvf $CHEM_FP_VERSION.tar.gz
cd $CHEM_FP_VERSION
sudo python setup.py install
cd ..
rm $CHEM_FP_VERSION.tar.gz

sudo python -c "import mpld3; mpld3.utils.write_ipynb_local_js()"

