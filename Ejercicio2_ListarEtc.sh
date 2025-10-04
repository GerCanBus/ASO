#!/bin/bash
# Realiza un script que guarde en un fichero el listado de archivos y directorios de /etc, 
# a posteriori que imprima por pantalla dicho listado.

FICHERO_LISTADO="listado_etc.txt"

# 1. Guarda el listado en un fichero
echo "Guardando listado de /etc en $FICHERO_LISTADO..."
ls -l /etc > "$FICHERO_LISTADO"

# 2. Imprime por pantalla dicho listado
echo -e "\n--- Contenido de $FICHERO_LISTADO ---"
cat "$FICHERO_LISTADO"
echo "-------------------------------------"
