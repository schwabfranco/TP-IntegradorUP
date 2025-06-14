#!/bin/bash
set -euo pipefail

if [ $# -lt 1 ]; then
  echo -e "ERROR: Se espera como mínimo un parámetro. \nUtilice el parámetro -help para imprimir el mensaje de ayuda" >&2
  exit 1
elif [ $# -gt 2 ]; then
  echo -e "ERROR: Se espera como máximo dos parámetros. \nUtilice el parámetro -help para imprimir el mensaje de ayuda" >&2
  exit 1
fi

DIRECTORIO_ORIGEN=$1

# Validar que si hay un solo parámetro, el primero sea -help
if [ $# -eq 1 ] && [ "$DIRECTORIO_ORIGEN" != "-help" ]; then
  echo -e "ERROR: Se obtuvo un directorio origen '${DIRECTORIO_ORIGEN}', pero no un directorio destino. \nUtilice el parámetro -help para imprimir el mensaje de ayuda" >&2
  exit 1
# Imprimir mensaje de ayuda
elif [ "$DIRECTORIO_ORIGEN" == "-help" ]; then
  cat << EOF
Uso:  ./backup_full.sh <origen> <objetivo>   Generar un backup del directorio origen y 
                                            guardarlo en el objetivo.
      ./backup_full.sh -help                 Imprimir este mensaje de ayuda.

El script verificará que tanto origen como objetivo sean directorios y existan.
Luego, comenzará la compresión de origen y se guardará el resultado en objetivo.
EOF
  exit 0
fi

DIRECTORIO_OBJETIVO=$2
DIRECTORIO_BASE=/backup_dir

echo "Validando directorios"
if ! [ -d $DIRECTORIO_ORIGEN ]; then
  echo  "ERROR: El directorio de origen '$DIRECTORIO_ORIGEN' no existe" >&2
  exit 1
elif ! [ -d $DIRECTORIO_OBJETIVO ]; then
  echo "ERROR: El directorio objetivo '$DIRECTORIO_OBJETIVO' no existe" >&2
  exit 1
elif ! [ -d $DIRECTORIO_BASE ]; then
  echo "ERROR: El directorio base de backups '$DIRECTORIO_BASE' no existe" >&2
  exit 1
fi

# Genera el prefijo para el archivo de backup a partir del path objetivo
PREFIJO_ARCHIVO=$(echo $DIRECTORIO_ORIGEN | sed "s/\/$//" | sed "s/^.*\///g")
NOMBRE_FORMATEADO="${PREFIJO_ARCHIVO}_bkp_$(date +%Y%m%d).tar.gz"
echo "Iniciando proceso de backup"
tar -czf $NOMBRE_FORMATEADO $DIRECTORIO_ORIGEN > /dev/null 2>&1
mv $NOMBRE_FORMATEADO $DIRECTORIO_OBJETIVO
echo "Proceso de backup finalizado con éxito"
