#!/bin/bash
# Ejercicio 7: Crea un archivo tar.gz de un directorio pasado como parámetro.

# Comprobar si se ha pasado un parámetro
if [ -z "$1" ]; then
    echo "Error: Debes pasar un directorio como parámetro."
    echo "Uso: $0 /ruta/al/directorio"
    exit 1
fi

DIRECTORIO="$1"

# Comprobar si el parámetro es un directorio y existe
if [ ! -d "$DIRECTORIO" ]; then
    echo "Error: '$DIRECTORIO' no existe o no es un directorio."
    exit 1
fi

# Obtener la fecha en formato yyyy-mm-dd
FECHA=$(date +%Y-%m-%d)

# Obtener solo el nombre base del directorio (sin la ruta)
NOMBRE_BASE=$(basename "$DIRECTORIO")

# Definir el nombre del archivo de salida
NOMBRE_TAR_GZ="${FECHA}_${NOMBRE_BASE}.tar.gz"

echo "Comprimiendo el directorio '$DIRECTORIO'..."

# Crear el archivo tar.gz
# -c: crear, -z: comprimir con gzip, -v: verbose, -f: nombre del archivo
tar -czvf "$NOMBRE_TAR_GZ" -C "$(dirname "$DIRECTORIO")" "$NOMBRE_BASE"

echo "-----------------------------------"
echo "Compresión finalizada. Archivo creado: $NOMBRE_TAR_GZ"
