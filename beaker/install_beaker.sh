#!/bin/bash

# This script installs and configures local copy of Beaker on
# myChEMBL VM.
# Author: Michal Nowotka, mnowotka@ebi.ac.uk
# Created date: 06.10.2014

# First, create a new virtualenv called chembl_beaker
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
