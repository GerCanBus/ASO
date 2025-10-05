#!/bin/bash
# Ejercicio 24: Muestra las estadísticas de ficheros y subdirectorios.

DIRECTORIO="$1"
NUM_FICHEROS=0
NUM_SUBDIRECTORIOS=0

# 1. Comprobar que se pasó un parámetro
if [ -z "$DIRECTORIO" ]; then
    echo "Error: Debes pasar un directorio como parámetro."
    echo "Uso: $0 /ruta/al/directorio"
    exit 1
fi

# 2. Comprobar que existe y es un directorio
if [ ! -d "$DIRECTORIO" ]; then
    echo "Error: '$DIRECTORIO' no existe o no es un directorio."
    exit 1
fi

echo "--- Estadísticas de Contenido en '$DIRECTORIO' ---"

# Usamos 'find' no recursivo (-maxdepth 1) para listar el contenido (ocultos incluidos)
# Y luego lo contamos con 'wc -l'
# -type f: ficheros ordinarios
# -type d: directorios
# -maxdepth 1: no recursivo
# -mindepth 1: excluye el propio directorio pasado como parámetro

NUM_FICHEROS=$(find "$DIRECTORIO" -maxdepth 1 -type f -print | wc -l)
NUM_SUBDIRECTORIOS=$(find "$DIRECTORIO" -maxdepth 1 -mindepth 1 -type d -print | wc -l)

echo "Número de Ficheros Ordinarios: $NUM_FICHEROS 📄"
echo "Número de Subdirectorios: $NUM_SUBDIRECTORIOS 📂"
