#!/bin/bash

# for  CentOS Linux release 7.1.1503

wget https://bootstrap.pypa.io/get-pip.py
sudo -H python get-pip.py

sudo -H pip install numpy
sudo -H pip install matplotlib
sudo -H pip install networkx
sudo -H pip install "ipython[notebook]"
sudo -H pip install biopython
sudo -H pip install -U scikit-learn==0.14.1
sudo -H pip install -U chembl_migration_model
echo "numpy==1.8.2" | cat > /tmp/pandas.requirement.txt
sudo -H pip install -U pandas -r /tmp/pandas.requirement.txt
#sudo pip install -U requests
sudo -H pip install -U mpld3
sudo -H pip install -U service_identity
sudo -H pip install https://garage.maemo.org/frs/download.php/8363/python-brisa_0.10.3maemo0.tar.gz
sudo -H pip install -U paste
sudo -H pip install -U netifaces
python -c "import mpld3; mpld3.utils.write_ipynb_local_js()"
