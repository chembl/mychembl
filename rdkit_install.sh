#!/bin/bash

export RDBASE=$HOME/rdkit
export LD_LIBRARY_PATH=$RDBASE/lib:$LD_LIBRARY_PATH
export PYTHONPATH=$RDBASE:$PYTHONPATH
python -mplatform | grep Ubuntu && PATH=$PATH || export PATH=$PATH:/usr/pgsql-9.3/bin/
