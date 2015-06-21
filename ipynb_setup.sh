#!/bin/bash

export HOME="/home/chembl"
NOTEBOOKS="$HOME/notebooks"
WORKBENCH="$HOME/ipynb_workbench"
I_NOTEBOOKS="$RAW/ipython_notebooks"

mkdir $NOTEBOOKS
curl -o $NOTEBOOKS/01_myChEMBL_introduction.ipynb $I_NOTEBOOKS/01_myChEMBL_introduction.ipynb
curl -o $NOTEBOOKS/02_myChEMBL_web_services.ipynb $I_NOTEBOOKS/02_myChEMBL_web_services.ipynb
curl -o $NOTEBOOKS/03_myChEMBL_predict_targets.ipynb $I_NOTEBOOKS/03_myChEMBL_predict_targets.ipynb
curl -o $NOTEBOOKS/04_myChEMBL_plotting_tutorial.ipynb $I_NOTEBOOKS/04_myChEMBL_plotting_tutorial.ipynb
curl -o $NOTEBOOKS/05_myChEMBL_MDS_tutorial.ipynb $I_NOTEBOOKS/05_myChEMBL_mds_tutorial.ipynb
curl -o $NOTEBOOKS/06_myChEMBL_differences_with_ChEMBL.ipynb $I_NOTEBOOKS/06_myChEMBL_differences_with_ChEMBL.ipynb
curl -o $NOTEBOOKS/07_myChEMBL_Beaker.ipynb $I_NOTEBOOKS/07_myChEMBL_Beaker.ipynb
curl -o $NOTEBOOKS/08_myChEMBL_Django_ORM.ipynb $I_NOTEBOOKS/08_myChEMBL_Django_ORM.ipynb
curl -o $NOTEBOOKS/09_myChEMBL_BLAST_and_druggability.ipynb $I_NOTEBOOKS/09_myChEMBL_BLAST_and_druggability.ipynb
curl -o $NOTEBOOKS/10_myChEMBL_machine_learning.ipynb $I_NOTEBOOKS/10_myChEMBL_machine_learning.ipynb
curl -o $NOTEBOOKS/11_myChEMBL_SureChEMBL.ipynb $I_NOTEBOOKS/11_myChEMBL_SureChEMBL.ipynb
curl -o $NOTEBOOKS/12_myChEMBL_drugs_ADME.ipynb $I_NOTEBOOKS/12_myChEMBL_drugs_ADME.ipynb
sed -i "s/chembl_XXX/chembl_${CHEMBL_VERSION}/g" $NOTEBOOKS/*.ipynb

ipython profile create mychembl
curl -o $HOME/.ipython/profile_mychembl/ipython_notebook_config.py $RAW/configuration/mychembl_ipython_notebook_config.py

cd /home/chembl/.ipython/nbextensions/
wget $RAPHAEL_JS_LOCATION

python -m IPython.external.mathjax

# create directory for storing temporary files:
mkdir $WORKBENCH

# we would like to tread ipynb_workbench directory as a regular python module so creating __init__.py:
touch $WORKBENCH/__init__.py

# install some files to ipynb_workbench:
curl -o $WORKBENCH/physchem_props_heatmap.csv $I_NOTEBOOKS/physchem_props_heatmap.csv
curl -o $WORKBENCH/settings.py $I_NOTEBOOKS/settings.py
sed -i "s/chembl_XXX/chembl_${CHEMBL_VERSION}/g" $WORKBENCH/settings.py
curl -o $WORKBENCH/A2A_Adenosine_set_mychembl.csv $I_NOTEBOOKS/A2A_Adenosine_set_mychembl.csv
curl -o $WORKBENCH/US_antimalarial_patents_cmpds.txt $I_NOTEBOOKS/US_antimalarial_patents_cmpds.txt
curl -o $WORKBENCH/document_chemistry_20141011_114421_271.csv $I_NOTEBOOKS/document_chemistry_20141011_114421_271.csv
curl -o $WORKBENCH/fps.pkl $I_NOTEBOOKS/fps.pkl
curl -o $WORKBENCH/smiles_cas_N6512.smi $I_NOTEBOOKS/smiles_cas_N6512.smi

curl -o /home/chembl/.ipython/profile_mychembl/static/custom/custom.css $I_NOTEBOOKS/custom.css
