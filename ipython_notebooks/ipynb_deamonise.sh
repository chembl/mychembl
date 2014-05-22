#!/bin/bash

# This script configures ipython notebook server to run as a service on VM
# startup. It requires root priviledges to install supervisor.
# Author: Michal Nowotka, mnowotka@ebi.ac.uk
# Created date: 21.05.2014

# Preliminary step: install all python libraries used in our notebooks that
# are not well known and not installed by default:
echo "password" | sudo -S pip install chembl_webresource_client
echo "password" | sudo -S pip install lxml

# First of all we will install supervisor:
echo "password" | sudo -S apt-get install -y supervisor

# create directory for storing temporary files:
mkdir /home/chembl/ipynb_workbench

# install some files there:
curl -o /home/chembl/ipynb_workbench/physchem_props_heatmap.csv https://raw.githubusercontent.com/chembl/mychembl/master/ipython_notebooks/physchem_props_heatmap.csv

# Configure it to take care about ipython notebook server:
echo "password" | sudo -S curl -o /etc/supervisor/conf.d/ipynb.conf https://raw.githubusercontent.com/chembl/mychembl/master/ipython_notebooks/ipynb.conf

# Notify it about changes in configuration:
echo "password" | sudo -S supervisorctl reread

# Add new process group:
echo "password" | sudo -S supervisorctl update
