Proyecto IDS con Suricata – Versión Final

Sistema de Detección de Intrusiones (IDS) basado en Suricata, desplegado mediante Docker, con reglas personalizadas y un entorno preparado para pruebas de seguridad en red.
Este repositorio contiene todas las versiones del proyecto (Semana 1, 2, 3 y Versión Final), así como la documentación técnica necesaria para su comprensión y despliegue.

1. Descripción del proyecto

Este proyecto implementa un IDS funcional utilizando Suricata, configurado para analizar tráfico de red, detectar patrones sospechosos y generar alertas basadas en reglas personalizadas.
El objetivo principal es demostrar la capacidad de diseñar, desplegar y validar un sistema de seguridad en red dentro de un entorno controlado.

2. Arquitectura del sistema

El sistema se compone de:

  Un contenedor Docker con Suricata

  Reglas personalizadas alojadas en /etc/suricata/rules

  Archivo de configuración suricata.yaml adaptado al entorno

  Interfaz de red monitorizada (ens18)

  Scripts auxiliares para procesar alertas (si aplica)


  3. Tecnologías utilizadas

  Suricata 6.x

  Docker / Docker Compose

  Ubuntu 22.04

  Reglas personalizadas (local.rules)

  Python (si usas script procesador)

  GitHub Pages (opcional para documentación)

  4. Estructura del repositorio
Proyecto-IDS/
│
├── Semana1/
├── Semana2/
├── Semana3/
│
├── Version Final/
│   ├── docker-compose.yml
│   ├── suricata.yaml
│   ├── rules/
│   │   └── local.rules
│   ├── procesador.py   (si aplica)
│   └── Dockerfile.suricata
│
└── README.md

5. Despliegue del entorno
   Clonar el repositorio
   git clone https://github.com/usuario/Proyecto-IDS

   Entrar en la versión final:
   cd "Version Final"

   Levantar el contenedor:
   docker compose up -d

   Ver logs de Suricata por si ha ocurrido un error:
   docker logs -f suricata

   6. Reglas personalizadas
      Las reglas personalizadas se encuentran en:
      Version Final/rules/local.rules

      Incluyen detecciones como:
      Escaneos de puertos
      Peticiones HTTP sospechosas
      Tráfico ICMP anómalo
      Pruebas de ataque controladas

   7. Pruebas realizadas
       Se han ejecutado pruebas para validar:
       Carga correcta de reglas
       Generación de alertas
       Funcionamiento del contenedor
       Detección de tráfico ICMP
       Detección de patrones HTTP
       Estabilidad del sistema
  8. Problemas detectados y soluciones
     ❌ Suricata no cargaba las reglas
     ✔ Solución: Ajuste de rutas absolutas en suricata.yaml.
     ❌ El contenedor no detectaba tráfico
     ✔ Solución: Configuración correcta de la interfaz ens18.
     ❌ Reglas no aplicadas
     ✔ Solución: Copia explícita de rules/ en el Dockerfile.
  9. Conclusiones finales
     El proyecto demuestra la capacidad de desplegar un IDS funcional, estable y documentado, capaz de detectar tráfico sospechoso mediante reglas personalizadas.
     La versión final incluye mejoras en estabilidad, organización del repositorio y correcciones en la configuración de Suricata.
