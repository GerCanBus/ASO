#!/bin/bash
# 9. Crea un script de nombre procesos.sh que muestre todos los procesos activos y que permita aumentar o disminuir la prioridad de un proceso.
echo "=================================================="
echo "         ADMINISTRADOR DE PROCESOS (Prioridad)    "
echo "=================================================="

echo "Mostrando procesos (PID, NI, COMM, USER, %CPU, %MEM):"
ps -eo pid,ni,comm,user,%cpu,%mem | head -n 1
ps -eo pid,ni,comm,user,%cpu,%mem | sort -k2n | grep -v "ps" | grep -v "$$" | tail -n +2
echo "--------------------------------------------------"

read -p "¿Desea cambiar la prioridad (nice/renice) de un proceso? (s/n): " respuesta

if [[ "$respuesta" == "s" || "$respuesta" == "S" ]]; then
    read -p "Introduce el PID del proceso: " PID
    
    if ! ps -p "$PID" > /dev/null; then
        echo "Error: El PID $PID no existe."
        exit 1
    fi

    read -p "Introduce el nuevo valor 'nice' (-20 (más prioridad) a 19 (menos)): " NICE_VALOR

    if [[ "$NICE_VALOR" -lt 0 ]]; then
        echo "Aumentar prioridad (nice negativo) requiere permisos de superusuario (sudo)."
        COMANDO="sudo renice"
    else
        COMANDO="renice"
    fi

    if $COMANDO "$NICE_VALOR" -p "$PID"; then
        echo "Prioridad (nice) del proceso $PID cambiada a $NICE_VALOR."
        echo "Nueva información del proceso:"
        ps -eo pid,ni,comm,user,%cpu,%mem | grep "$PID" | grep -v "grep"
    else
        echo "Error al cambiar la prioridad. Puede que necesite 'sudo'."
    fi
else
    echo "Saliendo del script."
fi
