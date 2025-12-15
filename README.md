# Descarga automática de datos meteorológicos del SMN

Este repositorio descarga automáticamente los datos horarios del Servicio Meteorológico Nacional (SMN) de Argentina.

## Cómo funciona

- Un workflow de GitHub Actions se ejecuta todos los días a las 03:00 AM UTC (o manualmente con `workflow_dispatch`).
- Descarga el ZIP oficial del SMN.
- Descomprime los archivos CSV/TXT.
- Combina todos los archivos en un CSV único: `clima_smn_horarios.csv`.
- Hace commit y push del CSV al repositorio.

## Requisitos

- El workflow usa R con las librerías:
  - `readr`
  - `dplyr`
  - `lubridate`
