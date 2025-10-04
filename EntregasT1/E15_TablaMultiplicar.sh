#!/bin/bash
# Ejercicio 15: Muestra la tabla de multiplicar de un número pasado por parámetro.

# Comprobar si se ha pasado un parámetro
if [ -z "$1" ]; then
    echo "Error: Debes pasar un número como parámetro."
    echo "Uso: $0 <número>"
    exit 1
fi

NUMERO="$1"

# Verificar que sea un número (opcional pero recomendado)
if ! [[ "$NUMERO" =~ ^[0-9]+$ ]]; then
    echo "Error: '$NUMERO' no es un número entero válido."
    exit 1
fi

echo "--- Tabla de Multiplicar del $NUMERO (del 1 al 10) ---"

# Bucle for
for i in {1..10}; do
    # Calcular el resultado usando aritmética de Bash
    RESULTADO=$((i * NUMERO))
    echo "$i x $NUMERO = $RESULTADO"
done
