#!/bin/bash

# This file should be used to configure building myChEMBL image.
# This should be the only file that has to be edited when creating a new version.
# Is sets some important variables.

# myChEMBL version:
export CHEMBL_VERSION="20"

# location of raw files for mychembl webapp:
export RAW_MYCHEMBL_APP="https://raw.githubusercontent.com/chembl/mychembl_webapp/master"

# operating system, currently only Ubuntu and CentOS are supported:
python -mplatform | grep Ubuntu && export AUX_OS_NAME="Ubuntu" || export AUX_OS_NAME="CentOS"

# rdkit tookit (http://www.rdkit.org/) repository location:
export RDKIT_REPO="https://github.com/rdkit/rdkit"

# rdkit release tag:
export RDKIT_RELEASE="Release_2015_03_1"

# indigo toolkit location
export INDIGO_FILENAME="indigo-python-1.1.11-linux"
export INDIGO_LOCATION="https://dl.dropboxusercontent.com/u/10967207/${INDIGO_FILENAME}.zip"

# TCLAP (http://tclap.sourceforge.net/) location:
export TCLAP_VERSION="1.2.1"
export TCLAP_LOCATION="http://downloads.sourceforge.net/project/tclap/tclap-${TCLAP_VERSION}.tar.gz"

# OCRAD (https://www.gnu.org/software/ocrad/) location:
export OCRAD_VERSION="0.21"
export OCRAD_LOCATION="http://ftp.heanet.ie/mirrors/gnu/ocrad/ocrad-${OCRAD_VERSION}.tar.gz"

# GOCR location:
export GOCR_VERSION="0.50pre-patched"
export GOCR_LOCATION="http://sourceforge.net/projects/osra/files/gocr-patched/gocr-${GOCR_VERSION}.tgz"

# OSRA location:
export OSRA_VERSION="2.0.0"
export OSRA_LOCATION="http://sourceforge.net/projects/osra/files/osra/${OSRA_VERSION}/osra-${OSRA_VERSION}.tgz"

# BLAST location:
export BLAST_VERSION="2.2.29"
export BLAST_FILE_NAME="ncbi-blast-${BLAST_VERSION}+-x64-linux"
export BLAST_LOCATION="ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/${BLAST_VERSION}/${BLAST_FILE_NAME}.tar.gz"

# EBI FTP location:
export FTP_ROOT="ftp://ftp.ebi.ac.uk/pub/databases/chembl"
export EBI_FTP="$FTP_ROOT/ChEMBLdb/releases/chembl_${CHEMBL_VERSION}"
export TARGET_PREDICTIONS_LOCATION="$FTP_ROOT/target_predictions/chembl_${CHEMBL_VERSION}_models.tar.gz"

# Raphael.js (http://raphaeljs.com/) location:
export RAPHAEL_JS_LOCATION="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"

export CHEMBL_GIT_ROOT="https://github.com/chembl"
export MYCHEMBL_GIT="$CHEMBL_GIT_ROOT/mychembl.git"
export MYCHEMBL_WEBAPP="$CHEMBL_GIT_ROOT/mychembl_webapp.git"

export JSME_VERSION="2013-08-04"
export JSME_LOCATION="http://peter-ertl.com/jsme/download/JSME_${JSME_VERSION}.zip"

# chem_fp (https://code.google.com/p/chem-fingerprints/) version:
export CHEM_FP_VERSION="chemfp-1.1p1"
export CHEM_FP_LOCATION="https://pypi.python.org/packages/source/c/chemfp/${CHEM_FP_VERSION}.tar.gz"
