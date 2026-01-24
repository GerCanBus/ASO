#!/bin/bash

# Define el número máximo de filas
MAX_FILAS=5

# Variable para construir la cadena de números
patron=""

# Bucle for que itera desde 1 hasta MAX_FILAS (5)
for i in $(seq 1 $MAX_FILAS); do
    # Concatena el valor actual de 'i' a la variable 'patron'
    patron="${patron}${i}"

    # Imprime la cadena 'patron'
    echo "$patron"
done
