#!/bin/bash
# Modifica el script anterior para que además muestre por pantalla el número de líneas y palabras.

FICHERO_LISTADO="listado_etc.txt"

# Aseguramos que el archivo existe
if [ ! -f "$FICHERO_LISTADO" ]; then
    ls -l /etc > "$FICHERO_LISTADO"
fi

echo "--- Contenido de $FICHERO_LISTADO ---"
cat "$FICHERO_LISTADO"
echo "-------------------------------------"

# Muestra el número de líneas (wc -l) y palabras (wc -w)
NUM_LINEAS=$(wc -l < "$FICHERO_LISTADO")
NUM_PALABRAS=$(wc -w < "$FICHERO_LISTADO")

echo "Estadísticas de $FICHERO_LISTADO:"
echo "Número de líneas: $NUM_LINEAS"
echo "Número de palabras: $NUM_PALABRAS"
