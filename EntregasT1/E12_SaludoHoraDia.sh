#!/bin/bash
# Ejercicio 12: Muestra un saludo basado en la hora del sistema.

# Obtener la hora actual en formato de 24 horas (00 a 23)
HORA=$(date +%H)

echo "La hora actual es $HORA:$(date +%M)."

# Convertir HORA a número para la comparación
if [ "$HORA" -ge 8 ] && [ "$HORA" -lt 15 ]; then
    echo "¡Buenos días! ☀️"
elif [ "$HORA" -ge 15 ] && [ "$HORA" -lt 20 ]; then
    echo "¡Buenas tardes! 🌇"
else
    echo "¡Buenas noches! 🌙"
fi
