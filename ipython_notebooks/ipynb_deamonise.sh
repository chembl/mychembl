#!/bin/bash

# This script configures ipython notebook server to run as a service on VM
# startup. It requires root priviledges to install supervisor.
# Author: Michal Nowotka, mnowotka@ebi.ac.uk
# Created date: 21.05.2014

#First of all we will install supervisor:
sudo apt-get install supervisor

curl -o /etc/supervisor/conf.d/ipynb.conf http://ipynb.conf
