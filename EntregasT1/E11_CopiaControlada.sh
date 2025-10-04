#!/bin/bash
# Ejercicio 11: Copia de ficheros con control de parámetros y existencia.

FICHERO_ORIGEN="$1"
FICHERO_DESTINO="$2"

echo "---------------------------------------"

# a) Controlar que se indiquen dos parámetros
if [ "$#" -ne 2 ]; then
    echo "Error: Debes indicar dos parámetros."
    echo "Uso: $0 <fichero_origen> <fichero_destino>"
    exit 1
fi

# b) Controlar que exista y sea archivo ordinario el primer parámetro
if [ ! -f "$FICHERO_ORIGEN" ]; then
    echo "Error: El fichero origen '$FICHERO_ORIGEN' no existe o no es un archivo ordinario."
    exit 1
fi

# c) Controlar que no exista un identificador con el mismo nombre que el segundo parámetro
if [ -e "$FICHERO_DESTINO" ]; then
    echo "Error: Ya existe una entrada con el nombre '$FICHERO_DESTINO'. La copia fallará para prevenir sobrescribir."
    exit 1
fi

# Si todas las condiciones se cumplen, realizar la copia
cp "$FICHERO_ORIGEN" "$FICHERO_DESTINO"

if [ $? -eq 0 ]; then
    echo "Éxito: El archivo '$FICHERO_ORIGEN' ha sido copiado a '$FICHERO_DESTINO'."
else
    echo "Error: Ocurrió un error desconocido durante la copia."
fi
