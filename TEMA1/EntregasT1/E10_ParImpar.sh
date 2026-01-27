#!/bin/bash
# Ejercicio 10: Solicita un número y dice si es par o impar.

read -p "Introduce un número entero: " NUMERO

# Verificar que se ha introducido un número
if ! [[ "$NUMERO" =~ ^[0-9]+$ ]]; then
    echo "Error: '$NUMERO' no es un número entero válido."
    exit 1
fi

# Usar el operador módulo (%) para saber el resto de la división por 2.
# El resto 0 indica par, 1 indica impar.
if [ $((NUMERO % 2)) -eq 0 ]; then
    echo "El número $NUMERO es PAR."
else
    echo "El número $NUMERO es IMPAR."
fi
