#!/bin/bash

export $HOME=/home/chembl
cd /tmp

if [ $(python -mplatform | grep Ubuntu) ]
   then
       POSTGRES_CONFIG=/etc/postgresql/9.3/main
       SYSCTL_PATH=/etc
   else
       POSTGRES_CONFIG=/var/lib/pgsql/9.3/data
       SYSCTL_PATH=/usr/lib
fi

## Creating BLAST database
mkdir -p $HOME/blast/chembl
cd $HOME/blast/
wget $BLAST_LOCATION -O blast.tar.gz
tar -xzf blast.tar.gz 
rm blast.tar.gz
cd $HOME/blast/chembl
wget $EBI_FTP/chembl_${CHEMBL_VERSION}.fa.gz
wget $EBI_FTP/chembl_${CHEMBL_VERSION}_bio.fa.gz
gunzip chembl_${CHEMBL_VERSION}.fa.gz
gunzip chembl_${CHEMBL_VERSION}_bio.fa.gz
$HOME/blast/ncbi-blast-${BLAST_VERSION}+/bin/makeblastdb -in chembl_${CHEMBL_VERSION}.fa -dbtype prot
$HOME/blast/ncbi-blast-${BLAST_VERSION}+/bin/makeblastdb -in chembl_${CHEMBL_VERSION}_bio.fa -dbtype prot
cd $HOME

if [ ! $(python -mplatform | grep Ubuntu) ]
   then
       echo "chemblvm" | sudo -S mkdir /var/run/postgresql
       echo "chemblvm" | sudo -S chown postgres:postgres /var/run/postgresql
       echo "chemblvm" | sudo -S chmod 0755 /var/run/postgresql
       echo "chemblvm" | sudo -S semanage fcontext -a -t httpd_var_run_t "/var/run/postgresql(/.*)?"
       echo "chemblvm" | sudo -S restorecon -R /var/run/postgresql
fi

## Download target prediction models
wget $TARGET_PREDICTIONS_LOCATION
tar -zxf chembl_${CHEMBL_VERSION}_models.tar.gz
rm chembl_${CHEMBL_VERSION}_models.tar.gz

## Install ChEMBLdb
wget $EBI_FTP/chembl_${CHEMBL_VERSION}_postgresql.tar.gz
tar zxf chembl_${CHEMBL_VERSION}_postgresql.tar.gz

echo "chemblvm" | sudo -SE curl -o $POSTGRES_CONFIG/postgresql.conf $RAW/configuration/mychembl_postgresql_${AUX_OS_NAME}.conf
echo "chemblvm" | sudo -SE curl -o $POSTGRES_CONFIG/pg_hba.conf $RAW/configuration/mychembl_pg_hba.conf
# see: http://michael.otacoo.com/postgresql-2/take-care-of-kernel-memory-limitation-for-postgresql-shared-buffers/
echo "chemblvm" | sudo -SE bash -c 'echo "kernel.shmmax = 2147483648" > ${SYSCTL_PATH}/sysctl.d/10-mychembl-pgsql.conf'

if [ $(python -mplatform | grep Ubuntu) ]
   then
       echo "chemblvm" | sudo -S service postgresql restart
   else
       echo "chemblvm" | sudo -S systemctl restart postgresql-9.3
fi

createdb chembl_${CHEMBL_VERSION}

cd chembl_${CHEMBL_VERSION}_postgresql/
psql chembl_${CHEMBL_VERSION} < chembl_${CHEMBL_VERSION}.pgdump.sql

cd ..

rm chembl_${CHEMBL_VERSION}_postgresql.tar.gz

psql --username=chembl -d chembl_${CHEMBL_VERSION} -c "create extension rdkit;"
wget $RAW/indexes.sql
psql --username=chembl -d chembl_${CHEMBL_VERSION} -a -f indexes.sql
rm indexes.sql

wget $RAW_MYCHEMBL_APP/sql/webapp.sql
psql --username=chembl -d chembl_${CHEMBL_VERSION} -a -f webapp.sql
rm webapp.sql

psql --username=chembl -d chembl_${CHEMBL_VERSION} -c "create user mychembl password 'read';"
psql --username=chembl -d chembl_${CHEMBL_VERSION} -c "GRANT SELECT ON ALL TABLES IN SCHEMA public TO mychembl;"

cd $HOME
rm chembl_${CHEMBL_VERSION}_postgresql/ -rf
