#!/bin/bash

# This script installs and configures local copy of ChEMBL webservices on
# myChEMBL VM.
# Author: Michal Nowotka, mnowotka@ebi.ac.uk
# Created date: 20.05.2014

export HOME=/home/chembl
export VIRTUALENVWRAPPER_PYTHON=$(which python)
export PATH=/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/chembl/.local/bin:/home/chembl/bin
export PYTHONPATH=$HOME/rdkit:$HOME/indigo
export RDBASE=$HOME/rdkit
export LD_LIBRARY_PATH=$RDBASE/lib:$LD_LIBRARY_PATH
export WORKON_HOME=$HOME/.virtualenvs

cd $HOME

# We need indigo toolkit as alternative compound rendering engine:
wget $INDIGO_LOCATION -O indigo.zip
unzip indigo.zip
mv $INDIGO_FILENAME indigo
rm indigo.zip

# Source virtualenvwrapper because it makes our job lot easier:
source virtualenvwrapper.sh

# Use the wrapper to create new virtualenv called chembl_webservices
mkvirtualenv chembl_webservices

# OK, we are ready to use pip to install chembl_webservices
pip install chembl_webservices

# We need live online documentation as well
pip install tastypie_spore_docs

# Because webservices on myChEMBL VM will be run against exported CHEMBL schema,
# which is only a subset of chembl_app schema we will have to install
# a compatibility layer that can handle differences between schemas:
pip install chembl_compatibility

# webservices are DB agnostic so they are not shipped with any specific DB
# driver. We have to install the driver separately, in case of myChEMBL this
# will be postgres:
echo $(env)
echo $(which pg_config)
pip install psycopg2

# we want our application to support CORS so we have to install django app
# which will handle this:
pip install django-cors-headers

# OK, now we are ready to configure our webservices django app.
# First, lets create new django project:
cd $HOME
mkdir chembl_webservices
cd chembl_webservices/
django-admin.py startproject deployment

# Now we have to download configuration files:
RAW_WS=$RAW/webservices/conf

curl $RAW_WS/settings.py > deployment/deployment/settings.py
sed -i "s/chembl_XXX/chembl_${CHEMBL_VERSION}/g" deployment/deployment/settings.py
curl $RAW_WS/urls.py > deployment/deployment/urls.py
curl $RAW_WS/wsgi.py > deployment/deployment/wsgi.py

# Lets configure cache by creating DB table for storing the cache:
cd deployment
python manage.py createcachetable ws_cache

# We should also take care about places to store static files and logs:
mkdir deployment/static
mkdir deployment/logs

# We can collect static files now:
python manage.py collectstatic --noinput --clear





