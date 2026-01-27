#!/bin/bash
# script1.sh: Script de espera para usuario1

echo "=================================================="
echo "    💻 Script de Usuario 1: Proceso en espera"
echo "=================================================="

# La línea 'read -p' detiene el script y cambia su estado a 'S' (Sleeping/Dormido)
read -p "usuario1> ESTADO 'S': Presiona ENTER para continuar y finalizar el script: " dato

echo "Script de usuario1 finalizado."
