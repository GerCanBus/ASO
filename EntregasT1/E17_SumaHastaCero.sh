#!/bin/bash
# Ejercicio 17: Suma números introducidos por teclado hasta que se introduce 0.

SUMA_TOTAL=0
NUMERO=1 # Inicializar para entrar en el bucle

echo "--- Suma Acumulada (introduce 0 para terminar) ---"

# Bucle while: se ejecuta mientras NUMERO sea distinto de 0
while [ "$NUMERO" -ne 0 ]; do
    read -p "Introduce un número (0 para parar): " NUMERO

    # Verificar que es un número (opcional)
    if ! [[ "$NUMERO" =~ ^-?[0-9]+$ ]]; then
        echo "¡Entrada no válida! Ignorando y continuando."
        NUMERO=1 # Aseguramos que el bucle continúe si la entrada es basura
        continue
    fi

    # Si el número es 0, el bucle terminará en la próxima iteración.
    # NO se suma el 0.
    if [ "$NUMERO" -ne 0 ]; then
        SUMA_TOTAL=$((SUMA_TOTAL + NUMERO))
        echo "Suma actual: $SUMA_TOTAL"
    fi
done

echo "-----------------------------------"
echo "¡Fin del script! El resultado final de la suma es: $SUMA_TOTAL"
