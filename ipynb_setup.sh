#!/bin/bash

mkdir /home/chembl/notebooks
ipython profile create mychembl
curl -o /home/chembl/.ipython/profile_mychembl/ipython_notebook_config.py https://raw.githubusercontent.com/chembl/mychembl/master/configuration/mychembl_ipython_notebook_config.py
