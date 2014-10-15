#!/bin/bash

# This script configures ipython notebook server to run as a service on VM
# startup. It requires root priviledges to install supervisor.
# Author: Michal Nowotka, mnowotka@ebi.ac.uk
# Created date: 21.05.2014

# Preliminary step: install all python libraries used in our notebooks that
# are not well known and not installed by default:
echo "chemblvm" | sudo -S pip install chembl_webresource_client
echo "chemblvm" | sudo -S pip install lxml

# First of all we will install supervisor:
echo "chemblvm" | sudo -S apt-get install -y supervisor

# create directory for storing temporary files:
mkdir /home/chembl/ipynb_workbench

# we would like to tread ipynb_workbench directory as a regular python module so creating __init__.py:
touch /home/chembl/ipynb_workbench/__init__.py

# install some files to ipynb_workbench:
curl -o /home/chembl/ipynb_workbench/physchem_props_heatmap.csv https://raw.githubusercontent.com/chembl/mychembl/master/ipython_notebooks/physchem_props_heatmap.csv
curl -o /home/chembl/ipynb_workbench/settings.py https://raw.githubusercontent.com/chembl/mychembl/master/ipython_notebooks/settings.py
curl -o /home/chembl/ipynb_workbench/A2A_Adenosine_set_mychembl.csv https://raw.githubusercontent.com/chembl/mychembl/master/ipython_notebooks/A2A_Adenosine_set_mychembl.csv
curl -o /home/chembl/ipynb_workbench/US_antimalarial_patents_cmpds.txt https://raw.githubusercontent.com/chembl/mychembl/master/ipython_notebooks/US_antimalarial_patents_cmpds.txt
curl -o /home/chembl/ipynb_workbench/fps.pkl https://raw.githubusercontent.com/chembl/mychembl/master/ipython_notebooks/fps.pkl
curl -o /home/chembl/ipynb_workbench/smiles_cas_N6512.smi https://raw.githubusercontent.com/chembl/mychembl/master/ipython_notebooks/smiles_cas_N6512.smi



# Configure it to take care about ipython notebook server:
echo "chemblvm" | sudo -S curl -o /etc/supervisor/conf.d/ipynb.conf https://raw.githubusercontent.com/chembl/mychembl/master/ipython_notebooks/ipynb.conf

# Notify it about changes in configuration:
echo "chemblvm" | sudo -S supervisorctl reread

# Add new process group:
echo "chemblvm" | sudo -S supervisorctl update
