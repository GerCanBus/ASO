#!/bin/bash
# Ejercicio 5: Pide dos números y calcula su media aritmética.

# Pedir los dos números
read -p "Introduce el primer número: " NUMERO1
read -p "Introduce el segundo número: " NUMERO2

# Calcular la media aritmética. Se usa 'bc -l' para operaciones de punto flotante.
# (NUMERO1 + NUMERO2) / 2
MEDIA=$(echo "scale=2; ($NUMERO1 + $NUMERO2) / 2" | bc -l)

echo "-----------------------------------"
echo "La media aritmética de $NUMERO1 y $NUMERO2 es: $MEDIA"
