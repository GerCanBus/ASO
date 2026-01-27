#!/bin/bash
# Ejercicio 23: Modificación del anterior para tipos completos (f, d, l, b, c).

DIRECTORIO="$1"
CONTADOR=0

# 1. Comprobar y verificar directorio (igual que el Eje 22)
if [ -z "$DIRECTORIO" ] || [ ! -d "$DIRECTORIO" ]; then
    echo "Error: Debes pasar un directorio existente (como /dev) como único parámetro."
    exit 1
fi

echo "--- Listado de entradas en '$DIRECTORIO' ---"

# Utilizamos 'find' para un listado no recursivo, incluyendo archivos ocultos.
# La opción '-print0' y 'while read -r -d $'\0'' maneja nombres de archivo con espacios o caracteres especiales.
find "$DIRECTORIO" -maxdepth 1 -mindepth 1 -print0 | while IFS= read -r -d $'\0' ENTRADA; do
    NOMBRE_BASE=$(basename "$ENTRADA")
    TIPO="OTRO"

    if [ -d "$ENTRADA" ]; then
        TIPO="DIRECTORIO (d) 📂"
    elif [ -f "$ENTRADA" ]; then
        TIPO="FICHERO ORDINARIO (f) 📄"
    elif [ -L "$ENTRADA" ]; then
        TIPO="ENLACE SIMBÓLICO (l) 🔗"
    elif [ -b "$ENTRADA" ]; then
        TIPO="ARCHIVO ESPECIAL DE BLOQUE (b) 💾"
    elif [ -c "$ENTRADA" ]; then
        TIPO="ARCHIVO ESPECIAL DE CARACTER (c) ⚙️"
    fi

    # Para el directorio /dev, estos tipos son muy comunes.
    echo "$NOMBRE_BASE: $TIPO"
    CONTADOR=$((CONTADOR + 1))
done

echo "-----------------------------------"
echo "Total de entradas procesadas: $CONTADOR"
