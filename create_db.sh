#!/bin/bash

CHEMBL_VERSION=19

## Creating BLAST database
mkdir -p /home/chembl/blast/chembl
cd /home/chembl/blast/
wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.2.29/ncbi-blast-2.2.29+-x64-linux.tar.gz
tar -xzf ncbi-blast-2.2.29+-x64-linux.tar.gz 
rm ncbi-blast-2.2.29+-x64-linux.tar.gz
cd /home/chembl/blast/chembl
wget ftp://ftp.ebi.ac.uk/pub/databases/chembl/ChEMBLdb/releases/chembl_19/chembl_"$CHEMBL_VERSION".fa.gz
wget ftp://ftp.ebi.ac.uk/pub/databases/chembl/ChEMBLdb/releases/chembl_19/chembl_"$CHEMBL_VERSION"_bio.fa.gz
gunzip chembl_"$CHEMBL_VERSION".fa.gz
gunzip chembl_"$CHEMBL_VERSION"_bio.fa.gz
/home/chembl/blast/ncbi-blast-2.2.29+/bin/makeblastdb -in chembl_"$CHEMBL_VERSION".fa -dbtype prot
/home/chembl/blast/ncbi-blast-2.2.29+/bin/makeblastdb -in chembl_"$CHEMBL_VERSION"_bio.fa -dbtype prot
cd /home/chembl

## Download target prediction models
wget ftp://ftp.ebi.ac.uk/pub/databases/chembl/target_predictions/chembl_"$CHEMBL_VERSION"_models.tar.gz
tar -zxf chembl_"$CHEMBL_VERSION"_models.tar.gz
rm chembl_"$CHEMBL_VERSION"_models.tar.gz

## Install ChEMBLdb
wget ftp://ftp.ebi.ac.uk/pub/databases/chembl/ChEMBLdb/releases/chembl_"$CHEMBL_VERSION"/chembl_"$CHEMBL_VERSION"_postgresql.tar.gz
tar zxf chembl_"$CHEMBL_VERSION"_postgresql.tar.gz

createdb chembl_"$CHEMBL_VERSION"

cd chembl_"$CHEMBL_VERSION"_postgresql/
psql chembl_"$CHEMBL_VERSION" < chembl_"$CHEMBL_VERSION".pgdump.sql

cd ..

rm chembl_"$CHEMBL_VERSION"_postgresql.tar.gz

echo "chemblvm" | sudo -S curl -o /etc/postgresql/9.3/main/postgresql.conf https://raw.githubusercontent.com/chembl/mychembl/master/configuration/mychembl_postgresql.conf
echo "chemblvm" | sudo -S curl -o /etc/postgresql/9.3/main/pg_hba.conf https://raw.githubusercontent.com/chembl/mychembl/master/configuration/mychembl_pg_hba.conf
echo "chemblvm" | sudo -S curl -o /etc/sysctl.conf https://raw.githubusercontent.com/chembl/mychembl/master/configuration/mychembl_sysctl.conf

echo "chemblvm" | sudo -S service postgresql restart

psql --username=chembl -d chembl_"$CHEMBL_VERSION" -c "create extension rdkit;"
wget https://raw.githubusercontent.com/chembl/mychembl/master/indexes.sql
psql --username=chembl -d chembl_"$CHEMBL_VERSION" -a -f indexes.sql
rm indexes.sql

wget https://raw.githubusercontent.com/chembl/mychembl_webapp/master/sql/webapp.sql
psql --username=chembl -d chembl_"$CHEMBL_VERSION" -a -f webapp.sql
rm webapp.sql

psql --username=chembl -d chembl_"$CHEMBL_VERSION" -c "create user mychembl password 'read';"
psql --username=chembl -d chembl_"$CHEMBL_VERSION" -c "GRANT SELECT ON ALL TABLES IN SCHEMA public TO mychembl;"

cd /home/chembl/
rm chembl_"$CHEMBL_VERSION"_postgresql/ -rf
