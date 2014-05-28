#!/bin/bash

mkdir /home/chembl/notebooks
curl -o /home/chembl/notebooks/01_myChEMBL_introduction.ipynb https://raw.githubusercontent.com/chembl/mychembl/master/ipython_notebooks/01_myChEMBL_introduction.ipynb
curl -o /home/chembl/notebooks/02_myChEMBL_web_services.ipynb https://raw.githubusercontent.com/chembl/mychembl/master/ipython_notebooks/02_myChEMBL_web_services.ipynb
curl -o /home/chembl/notebooks/03_myChEMBL_predict_targets.ipynb https://raw.githubusercontent.com/chembl/mychembl/master/ipython_notebooks/03_myChEMBL_predict_targets.ipynb
curl -o /home/chembl/notebooks/04_myChEMBL_plotting_tutorial.ipynb https://raw.githubusercontent.com/chembl/mychembl/master/ipython_notebooks/04_myChEMBL_plotting_tutorial.ipynb
curl -o /home/chembl/notebooks/05_myChEMBL_mds_tutorial.ipynb https://raw.githubusercontent.com/chembl/mychembl/master/ipython_notebooks/05_myChEMBL_mds_tutorial.ipynb
curl -o /home/chembl/notebooks/06_Differences_between_ChEMBL_and_myChEMBL.ipynb https://raw.githubusercontent.com/chembl/mychembl/master/ipython_notebooks/06_Differences_between_ChEMBL_and_myChEMBL.ipynb

ipython profile create mychembl
curl -o /home/chembl/.ipython/profile_mychembl/ipython_notebook_config.py https://raw.githubusercontent.com/chembl/mychembl/master/configuration/mychembl_ipython_notebook_config.py
