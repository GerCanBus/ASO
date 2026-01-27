#!/bin/bash
# Ejercicio 21: Juego de adivinar un número.

NUMERO_SECRETO=42 # El número fijo a adivinar (del 1 al 100)

echo "================================================="
echo "        Adivina el Número (del 1 al 100)         "
echo "================================================="

INTENTO=-1

# Bucle principal: se ejecuta mientras el intento NO sea el secreto y NO sea 0
while [ "$INTENTO" -ne "$NUMERO_SECRETO" ] && [ "$INTENTO" -ne 0 ]; do
    read -p "Introduce tu intento (o 0 para rendirte): " INTENTO

    # Control de entrada (opcional)
    if ! [[ "$INTENTO" =~ ^[0-9]+$ ]]; then
        echo "¡Entrada no válida! Introduce solo números."
        continue
    fi

    if [ "$INTENTO" -eq 0 ]; then
        echo "Te has rendido. El número secreto era $NUMERO_SECRETO."
        break # Sale del bucle y del script
    elif [ "$INTENTO" -eq "$NUMERO_SECRETO" ]; then
        echo "¡🎉 Enhorabuena! ¡Has adivinado el número ($NUMERO_SECRETO)!"
        break # Sale del bucle y del script
    elif [ "$INTENTO" -lt "$NUMERO_SECRETO" ]; then
        echo "El número es MAYOR que $INTENTO. ¡Sigue intentándolo!"
    else
        echo "El número es MENOR que $INTENTO. ¡Sigue intentándolo!"
    fi
done
