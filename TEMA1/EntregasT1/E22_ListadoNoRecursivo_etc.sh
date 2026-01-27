#!/bin/bash
# Ejercicio 22: Listado no recursivo de un directorio, indicando si es fichero o directorio.

DIRECTORIO="$1"
CONTADOR=0

# 1. Comprobar que se ha pasado un parámetro
if [ -z "$DIRECTORIO" ]; then
    echo "Error: Debes pasar un directorio como parámetro (ruta completa)."
    echo "Uso: $0 /ruta/al/directorio"
    exit 1
fi

# 2. Comprobar que el parámetro es un directorio y existe
if [ ! -d "$DIRECTORIO" ]; then
    echo "Error: '$DIRECTORIO' no existe o no es un directorio."
    exit 1
fi

echo "--- Listado de entradas en '$DIRECTORIO' ---"

# Bucle for: lista todos los archivos/directorios en el directorio (no recursivo)
# El asterisco "*" en el directorio lista su contenido (incluyendo archivos ocultos con un punto "." al final, pero se complica)
# Usaremos 'find' con profundidad 1 para un listado no recursivo.
# Opcionalmente, 'ls -A "$DIRECTORIO"' o 'for entrada in "$DIRECTORIO"/* "$DIRECTORIO"/.[!.]*'
find "$DIRECTORIO" -maxdepth 1 -mindepth 1 -print0 | while IFS= read -r -d $'\0' ENTRADA; do
    NOMBRE_BASE=$(basename "$ENTRADA")
    TIPO=""

    if [ -d "$ENTRADA" ]; then
        TIPO="DIRECTORIO 📂"
    elif [ -f "$ENTRADA" ]; then
        TIPO="FICHERO 📄"
    else
        TIPO="OTRO TIPO"
    fi

    echo "$NOMBRE_BASE: $TIPO"
    CONTADOR=$((CONTADOR + 1))
done

echo "-----------------------------------"
echo "Total de entradas procesadas: $CONTADOR"
