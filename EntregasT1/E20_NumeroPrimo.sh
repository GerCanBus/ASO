#!/bin/bash
# Ejercicio 20: Verifica si un número pasado por parámetro es primo.

# Comprobar si se ha pasado un parámetro
if [ -z "$1" ]; then
    echo "Error: Debes pasar un número como parámetro."
    echo "Uso: $0 <número>"
    exit 1
fi

NUMERO=$1

# 1. Comprobaciones básicas
if [ "$NUMERO" -lt 2 ]; then
    echo "El número $NUMERO NO es primo (los primos deben ser mayores o iguales a 2)."
    exit 0
fi

if [ "$NUMERO" -eq 2 ]; then
    echo "El número $NUMERO ES primo."
    exit 0
fi

# 2. Bucle para verificar divisibilidad
# Solo necesitamos comprobar divisibilidad hasta la raíz cuadrada del número.
# Para simplificar en Bash, comprobaremos hasta NUMERO - 1
ES_PRIMO=1 # Asumimos que es primo al inicio

# El bucle empieza en 2 y va hasta NUMERO - 1
for i in $(seq 2 $((NUMERO - 1))); do
    # Si el resto es 0, es divisible, por lo tanto NO es primo
    if [ $((NUMERO % i)) -eq 0 ]; then
        ES_PRIMO=0
        break # Salir del bucle, ya encontramos un divisor
    fi
done

# 3. Mostrar el resultado
if [ "$ES_PRIMO" -eq 1 ]; then
    echo "El número $NUMERO ES primo."
else
    echo "El número $NUMERO NO es primo (es divisible por $i)."
fi
