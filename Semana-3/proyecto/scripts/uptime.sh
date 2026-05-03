#!/bin/bash
# Pablo Espina García 
# 19/04/2026

#Comprobar que suricata esta activo o no
if systemctl is-active --quiet suricata; then
    echo "$(date) - Suricata activo" >> /var/log/ids/monitor.log
else
    echo "$(date) - Suricata caído" >> /var/log/ids/monitor.log
fi
