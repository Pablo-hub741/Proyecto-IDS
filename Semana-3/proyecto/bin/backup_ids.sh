#!/bin/bash

FECHA=$(date +%Y-%m-%d)
DESTINO="/var/backups/ids_$FECHA.tar.gz"
LOG="/var/log/ids/backup.log"

mkdir -p /var/log/ids
touch "$LOG"

tar -czf "$DESTINO" --ignore-failed-read \
/etc/suricata/ \
/usr/local/bin/gestionar_suricata.sh \
/var/log/ids/

if [ $? -eq 0 ]; then
    echo "$(date) - Backup generado en $DESTINO" >> "$LOG"
else
    echo "$(date) - ERROR: El backup no se pudo generar" >> "$LOG"
fi

