#!/bin/bash

# This file should be used to configure building myChEMBL image.
# This should be the only file that has to be edited when creating a new version.
# Is sets some important variables.

# myChEMBL version:
export CHEMBL_VERSION="20"

# operating system, currently only Ubuntu and CentOS are supported:
python -mplatform | grep Ubuntu && export AUX_OS_NAME="Ubuntu" || export AUX_OS_NAME="CentOS"

# rdkit repository location:
export RDKIT_REPO="https://github.com/rdkit/rdkit"

# rdkit release tag:
export RDKIT_RELEASE="Release_2015_03_1"

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
export BLAST_LOCATION="ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.2.29/ncbi-blast-2.2.29+-x64-linux.tar.gz"

# EBI FTP location:
export EBI_FTP="ftp://ftp.ebi.ac.uk/pub/databases/chembl/ChEMBLdb/releases/chembl_${CHEMBL_VERSION}"

export RAPHAEL_JS_LOCATION="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"

export MATHJAX_LOCATION="https://cdn.mathjax.org/mathjax/latest/MathJax.js"
