#!/bin/bash
# script2.sh: Script de espera para usuario2

echo "=================================================="
echo "    💻 Script de Usuario 2: Proceso en espera"
echo "=================================================="

# La línea 'read -p' detiene el script y cambia su estado a 'S' (Sleeping/Dormido)
read -p "usuario2> ESTADO 'S': Presiona ENTER para continuar y finalizar el script: " dato2

echo "Script de usuario2 finalizado."
