#!/bin/bash

# This script configures ipython notebook server to run as a service on VM
# startup. It requires root priviledges to install supervisor.
# Author: Michal Nowotka, mnowotka@ebi.ac.uk
# Created date: 21.05.2014

# Preliminary step: install all python libraries used in our notebooks that
# are not well known and not installed by default:
sudo pip install chembl_webresource_client
sudo pip install lxml

# First of all we will install supervisor:
sudo apt-get install supervisor

# Configure it to take care about ipython notebook server:
sudo curl -o /etc/supervisor/conf.d/ipynb.conf https://raw.githubusercontent.com/chembl/mychembl/master/ipython_notebooks/ipynb.conf

# Notify it about changes in configuration:
sudo supervisorctl reread

# Add new process group:
sudo supervisorctl update
