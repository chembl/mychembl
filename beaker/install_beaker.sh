#!/bin/bash

# This script installs and configures local copy of Beaker on
# myChEMBL VM.
# Author: Michal Nowotka, mnowotka@ebi.ac.uk
# Created date: 06.10.2014

export HOME=/home/chembl
BEAKER_DIR="$HOME/chembl_beaker/conf.d"
RAW_BEAKER=$RAW/beaker

# Switching to webservices virtualenv, beaker should be already installed
#source virtualenvwrapper.sh
#workon chembl_webservices

#pip install chembl_beaker

# Install all (optional) dependencies 
#pip install standardiser
#pip install matplotlib
#pip install Pillow
#pip install lxml
#pip install cairocffi
#pip install numpy

#configure beaker and Apache:
mkdir -p $BEAKER_DIR

# Now we have to download configuration files:
curl $RAW_BEAKER/beaker.py > $BEAKER_DIR/beaker.py
curl $RAW_BEAKER/beaker.conf > $BEAKER_DIR/beaker.conf
