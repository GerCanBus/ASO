#!/bin/bash
# Ejercicio 16: Suma los números del 1 al 1000 usando for, while y until.

LIMITE=1000

echo "--- Suma del 1 al $LIMITE ---"

# 1. Estructura FOR
SUMA_FOR=0
for i in $(seq 1 $LIMITE); do
    SUMA_FOR=$((SUMA_FOR + i))
done
echo "Resultado con FOR: $SUMA_FOR"

echo "-----------------------------------"

# 2. Estructura WHILE
SUMA_WHILE=0
CONTADOR_WHILE=1
while [ "$CONTADOR_WHILE" -le "$LIMITE" ]; do
    SUMA_WHILE=$((SUMA_WHILE + CONTADOR_WHILE))
    CONTADOR_WHILE=$((CONTADOR_WHILE + 1))
done
echo "Resultado con WHILE: $SUMA_WHILE"

echo "-----------------------------------"

# 3. Estructura UNTIL
SUMA_UNTIL=0
CONTADOR_UNTIL=1
# Ejecuta hasta que la condición sea VERDADERA
until [ "$CONTADOR_UNTIL" -gt "$LIMITE" ]; do
    SUMA_UNTIL=$((SUMA_UNTIL + CONTADOR_UNTIL))
    CONTADOR_UNTIL=$((CONTADOR_UNTIL + 1))
done
echo "Resultado con UNTIL: $SUMA_UNTIL"
