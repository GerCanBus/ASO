#!/bin/bash
# Ejercicio 8: Pide dos números y dice cuál es mayor.

# Pedir los dos números
read -p "Introduce el primer número: " NUMERO1
read -p "Introduce el segundo número: " NUMERO2

echo "-----------------------------------"

# Comparación numérica
if [ "$NUMERO1" -gt "$NUMERO2" ]; then
    echo "El número $NUMERO1 es mayor que $NUMERO2."
elif [ "$NUMERO2" -gt "$NUMERO1" ]; then
    echo "El número $NUMERO2 es mayor que $NUMERO1."
else
    echo "Ambos números, $NUMERO1 y $NUMERO2, son iguales."
fi
