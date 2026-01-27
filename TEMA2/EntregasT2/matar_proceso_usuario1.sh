#!/bin/bash
# 7. Mata el proceso del script que está ejecutando el usuario 1.
echo "--- 7. Matar proceso de usuario1 (Requiere PID) ---"

# Se asume que el usuario1 está ejecutando './script1.sh' y está en estado 'S' (esperando input)
echo "Busca el PID del proceso de usuario1 (ej. 'bash ./script1.sh') antes de continuar."

# Usa 'ps aux | grep usuario1' para encontrar el PID. 
# EJEMPLO: Si el PID es 12345
# PID_A_MATAR="12345" 

read -p "Introduce el PID del script de usuario1 a matar: " PID_A_MATAR

if [ -z "$PID_A_MATAR" ]; then
    echo "PID no proporcionado. Saliendo."
    exit 1
fi

echo "Intentando matar el proceso $PID_A_MATAR..."
# Se usa kill -9 (SIGKILL) para asegurar la terminación.
if sudo kill -9 "$PID_A_MATAR"; then
    echo "Proceso $PID_A_MATAR terminado exitosamente."
else
    echo "Error al matar el proceso. Verifique el PID y los permisos (sudo)."
fi
