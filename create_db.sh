#!/bin/bash

cd /tmp

CHEMBL_VERSION=20
python -mplatform | grep Ubuntu && export POSTGRES_CONFIG=/etc/postgresql/9.3/main || export POSTGRES_CONFIG=/var/lib/pgsql/9.3/data
python -mplatform | grep Ubuntu && export AUX_OS_NAME="Ubuntu" || export AUX_OS_NAME="CentOS"
RAW="https://raw.githubusercontent.com/chembl/mychembl/master"
EBI_FTP="ftp://ftp.ebi.ac.uk/pub/databases/chembl/ChEMBLdb/releases/chembl_${CHEMBL_VERSION}"
NCBI_FTP="ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.2.29/ncbi-blast-2.2.29+-x64-linux.tar.gz"
python -mplatform | grep Ubuntu && export SYSCTL_PATH=/etc || export SYSCTL_PATH=/usr/lib

## Creating BLAST database
mkdir -p /home/chembl/blast/chembl
cd /home/chembl/blast/
wget $NCBI_FTP
tar -xzf ncbi-blast-2.2.29+-x64-linux.tar.gz 
rm ncbi-blast-2.2.29+-x64-linux.tar.gz
cd /home/chembl/blast/chembl
wget $EBI_FTP/chembl_${CHEMBL_VERSION}.fa.gz
wget $EBI_FTP/chembl_${CHEMBL_VERSION}_bio.fa.gz
gunzip chembl_${CHEMBL_VERSION}.fa.gz
gunzip chembl_${CHEMBL_VERSION}_bio.fa.gz
/home/chembl/blast/ncbi-blast-2.2.29+/bin/makeblastdb -in chembl_${CHEMBL_VERSION}.fa -dbtype prot
/home/chembl/blast/ncbi-blast-2.2.29+/bin/makeblastdb -in chembl_${CHEMBL_VERSION}_bio.fa -dbtype prot
cd /home/chembl

## Download target prediction models
#wget ftp://ftp.ebi.ac.uk/pub/databases/chembl/target_predictions/chembl_${CHEMBL_VERSION}_models.tar.gz
#tar -zxf chembl_${CHEMBL_VERSION}_models.tar.gz
#rm chembl_${CHEMBL_VERSION}_models.tar.gz

## Install ChEMBLdb
wget $EBI_FTP/chembl_${CHEMBL_VERSION}_postgresql.tar.gz
tar zxf chembl_${CHEMBL_VERSION}_postgresql.tar.gz

echo "chemblvm" | sudo -SE curl -o $POSTGRES_CONFIG/postgresql.conf $RAW/configuration/mychembl_postgresql_${AUX_OS_NAME}.conf
echo "chemblvm" | sudo -SE curl -o $POSTGRES_CONFIG/pg_hba.conf $RAW/configuration/mychembl_pg_hba.conf
# see: http://michael.otacoo.com/postgresql-2/take-care-of-kernel-memory-limitation-for-postgresql-shared-buffers/
echo "chemblvm" | sudo -SE bash -c 'echo "kernel.shmmax = 2147483648" > ${SYSCTL_PATH}/sysctl.d/10-mychembl-pgsql.conf'

python -mplatform | grep Ubuntu && echo "chemblvm" | sudo -S service postgresql restart || echo "chemblvm" | sudo -S systemctl restart postgresql-9.3

createdb chembl_${CHEMBL_VERSION}

cd chembl_${CHEMBL_VERSION}_postgresql/
psql chembl_${CHEMBL_VERSION} < chembl_${CHEMBL_VERSION}.pgdump.sql

cd ..

rm chembl_${CHEMBL_VERSION}_postgresql.tar.gz

psql --username=chembl -d chembl_${CHEMBL_VERSION} -c "create extension rdkit;"
wget $RAW/indexes.sql
psql --username=chembl -d chembl_${CHEMBL_VERSION} -a -f indexes.sql
rm indexes.sql

wget $RAW/sql/webapp.sql
psql --username=chembl -d chembl_${CHEMBL_VERSION} -a -f webapp.sql
rm webapp.sql

psql --username=chembl -d chembl_${CHEMBL_VERSION} -c "create user mychembl password 'read';"
psql --username=chembl -d chembl_${CHEMBL_VERSION} -c "GRANT SELECT ON ALL TABLES IN SCHEMA public TO mychembl;"

cd /home/chembl/
rm chembl_${CHEMBL_VERSION}_postgresql/ -rf
