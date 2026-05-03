#!/bin/bash
# Pablo Espina García
# Fecha: 19/04/2026

# Declaramos al rutas de los logs y el contenedor

LOG="/var/log/ids/monitor.log"
CONTAINER="ids-suricata_suricata_1"

# # Creamos los directorios y archivos necesarios

mkdir -p /var/log/ids
touch "$LOG"


# Verificar si suricata esta activo
if docker ps --format '{{.Names}}' | grep -q "^$CONTAINER$"; then
    echo "$(date) - Suricata activo" >> "$LOG"
else
    echo "$(date) - Suricata caído" >> "$LOG"
fi
