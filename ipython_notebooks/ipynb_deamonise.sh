#!/bin/bash

SUPERVISOR_DIR="/etc/supervisor.d"

sudo mkdir -p $SUPERVISOR_DIR
sudo curl -o $SUPERVISOR_DIR/supervisor.conf $RAW/configuration/supervisor.conf
sudo curl -o $SUPERVISOR_DIR/ipynb.ini $RAW/configuration/ipynb.ini

if [ "$AUX_OS_NAME" = "Ubuntu" ]
   then
       sudo curl -o /etc/init.d/supervisord $RAW/configuration/supervisord
       sudo chmod +x /etc/init.d/supervisord
       sudo update-rc.d supervisord defaults
       sudo service supervisord start
   else
       sudo curl -o /usr/lib/systemd/system/supervisord.service $RAW/configuration/supervisord.service
       sudo systemctl enable supervisord
       sudo systemctl start supervisord
fi
