import json
import time

ruta = "var/log/suricata/eve.json"


def print_alert(alerta):
    sig = alerta["alert"]["signature"]
    sev = alerta["alert"]["severity"]
    src = alerta.get("src_ip", "N/A")
    dst = alerta.get("dest_ip", "N/A")
    ts  = alerta.get("timestamp", "N/A")

    print("\n================ ALERTA ================")
    print(f"Firma:     {sig}")
    print(f"Severidad: {sev}")
    print(f"Origen:    {src}")
    print(f"Destino:   {dst}")
    print(f"Fecha:     {ts}")
    print("========================================\n")

print("Escuchando alertas de Suricata...")

with open(ruta, "r") as f:
    f.seek(0, 2)
    while True:
        linea = f.readline()
        if linea:
            try:
                evento = json.loads(linea)
                if "alert" in evento:
                    print_alert(evento)
            except:
                pass
        time.sleep(0.1)

