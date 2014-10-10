#!/bin/bash

# This script installs and configures local copy of Beaker on
# myChEMBL VM.
# Author: Michal Nowotka, mnowotka@ebi.ac.uk
# Created date: 06.10.2014

# First, create a new virtualenv called chembl_beaker
source virtualenvwrapper.sh
mkvirtualenv chembl_beaker

# Install all (optional) dependencies 
pip install Pillow
pip install standardiser
pip install lxml
pip install cairocffi
pip install numpy
pip install matplotlib

#installing beaker:
pip install chembl_beaker

#configure beaker and Apache:
mkdir -p /home/chembl/chembl_beaker/conf.d/

# Now we have to download configuration files:
RAW=https://github.com/chembl/mychembl/blob/master/beaker
curl $RAW/beaker.py > /home/chembl/chembl_beaker/conf.d/beaker.py
curl $RAW/beaker.conf > /home/chembl/chembl_beaker/conf.d/beaker.conf

