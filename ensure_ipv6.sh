#!/bin/bash

if grep -Fxq "ipv6" /etc/modules
then
    modprobe ipv6
else
    sudo bash -c "echo ipv6 >> /etc/modules"
fi
