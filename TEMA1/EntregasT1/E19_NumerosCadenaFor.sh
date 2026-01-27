#!/bin/bash

# Define el número máximo de filas
MAX_FILAS=5

echo "Patrón de repetición de números:"

# Bucle externo: Controla el número de fila (i)
# y el número a imprimir.
for i in $(seq 1 $MAX_FILAS); do
    # Inicializa una cadena vacía para construir la fila
    fila_actual=""

    # Bucle interno: Controla cuántas veces se repite el número (j)
    # Itera desde 1 hasta el valor de 'i'
    for j in $(seq 1 $i); do
        # Concatena el valor de 'i' a la cadena
        fila_actual="${fila_actual}${i}"
    done

    # Imprime la cadena construida de la fila actual
    echo "$fila_actual"
done
