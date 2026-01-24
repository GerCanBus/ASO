#!/bin/bash
# Ejercicio 6: Pide una palabra y la añade al final de lista.txt.

FICHERO="lista.txt"

# Pedir la palabra
read -p "Introduce una palabra para añadir a $FICHERO: " PALABRA

# Añadir la palabra al fichero (usando >> para añadir al final)
echo "$PALABRA" >> "$FICHERO"

echo "-----------------------------------"
echo "La palabra '$PALABRA' ha sido añadida a '$FICHERO'."
echo "Contenido actual de '$FICHERO':"
cat "$FICHERO"
