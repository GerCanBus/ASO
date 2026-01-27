#!/bin/bash

# Este script muestra los últimos usuarios que iniciaron sesión,
# incluyendo las direcciones IP de origen, filtrando la salida de 'last'.

echo "⏳ Últimos inicios de sesión (solo mostrando líneas con IP de origen):"
echo "------------------------------------------------------------------"

# Ejecutamos 'last' y filtramos la salida con 'egrep' (que soporta expresiones regulares extendidas)
# La expresión regular busca un patrón de dirección IPv4 (cuatro grupos de dígitos separados por puntos).
# La expresión es: ([0-9]{1,3}\.){3}[0-9]{1,3}
# Explicación de la RegEx:
# - [0-9]{1,3} : Coincide con 1 a 3 dígitos (para un octeto de IP).
# - \.         : Coincide con un punto literal.
# - ( ... ){3} : Repite el patrón del octeto y el punto exactamente 3 veces.
# - [0-9]{1,3} : El cuarto y último octeto.

last | egrep '([0-9]{1,3}\.){3}[0-9]{1,3}'

echo "------------------------------------------------------------------"
echo "✅ Fin del reporte."
