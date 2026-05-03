import json
import time

ruta = "/var/log/suricata/eve.json"

print("Escuchando alertas de Suricata...")

with open(ruta, "r") as f:
    f.seek(0, 2)  # Ir al final del archivo
    while True:
        linea = f.readline()
        if linea:
            try:
                alerta = json.loads(linea)
                if "alert" in alerta:
                    print(f"[ALERTA] {alerta['alert']['signature']}")
            except:
                pass
        time.sleep(0.1)
