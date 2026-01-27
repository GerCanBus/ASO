#!/bin/bash
# Ejercicio 9: Menú de operaciones matemáticas.

echo "--- Menú de Operaciones Matemáticas ---"
echo "1) Sumar"
echo "2) Restar"
echo "3) Multiplicar"
echo "4) Dividir"
echo "---------------------------------------"

read -p "Selecciona una opción (1-4): " OPCION

# Pedir los números
read -p "Introduce el primer número (A): " NUM_A
read -p "Introduce el segundo número (B): " NUM_B

RESULTADO=""

# Evaluar la opción seleccionada
case $OPCION in
    1)
        # Sumar: A + B
        RESULTADO=$(echo "scale=2; $NUM_A + $NUM_B" | bc -l)
        OPERACION="Suma"
        SIGNO="+"
        ;;
    2)
        # Restar: A - B
        RESULTADO=$(echo "scale=2; $NUM_A - $NUM_B" | bc -l)
        OPERACION="Resta"
        SIGNO="-"
        ;;
    3)
        # Multiplicar: A * B
        RESULTADO=$(echo "scale=2; $NUM_A * $NUM_B" | bc -l)
        OPERACION="Multiplicación"
        SIGNO="*"
        ;;
    4)
        # Dividir: A / B
        if [ "$(echo "$NUM_B == 0" | bc -l)" -eq 1 ]; then
            echo "Error: No se puede dividir por cero."
            exit 1
        fi
        RESULTADO=$(echo "scale=2; $NUM_A / $NUM_B" | bc -l)
        OPERACION="División"
        SIGNO="/"
        ;;
    *)
        echo "Error: Opción no válida."
        exit 1
        ;;
esac

echo "---------------------------------------"
echo "Resultado de la $OPERACION:"
echo "$NUM_A $SIGNO $NUM_B = $RESULTADO"
