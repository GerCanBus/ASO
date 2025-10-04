#!/bin/bash
# Ejercicio 2: Guarda el listado de /etc en un fichero y lo imprime.

FICHERO="listado_etc.txt"

# Guardar el listado en el fichero
ls -l /etc > "$FICHERO"

# Imprimir el listado por pantalla
echo "Contenido del directorio /etc guardado en $FICHERO y mostrado a continuación:"
cat "$FICHERO"
