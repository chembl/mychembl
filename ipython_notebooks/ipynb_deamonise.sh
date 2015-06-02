#!/bin/bash

sudo mkdir -p /etc/supervisor.d

sudo curl -o /etc/supervisor.d/supervisor.conf https://raw.githubusercontent.com/chembl/mychembl/master/configuration/supervisor.conf
sudo curl -o /etc/supervisor.d/ipynb.ini https://raw.githubusercontent.com/chembl/mychembl/master/configuration/ipynb.ini
python -mplatform | grep Ubuntu && sudo curl -o /etc/init.d/supervisord ... || sudo curl -o /usr/lib/systemd/system/supervisord.service
