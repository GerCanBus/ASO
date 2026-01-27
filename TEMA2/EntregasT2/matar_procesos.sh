#!/bin/bash
# 10. Crea un script de nombre matar_procesos.sh que muestre todos los procesos activos y permita matar un proceso especificando su PID.
echo "=================================================="
echo "          ADMINISTRADOR DE PROCESOS (Kill)        "
echo "=================================================="

echo "Mostrando los 20 procesos más activos (por %CPU):"
ps aux | head -n 1
ps aux | grep -v "ps aux" | grep -v "$$" | sort -k 3,3nr | head -n 20
echo "--------------------------------------------------"

read -p "¿Desea matar (kill) un proceso? (s/n): " respuesta

if [[ "$respuesta" == "s" || "$respuesta" == "S" ]]; then
    read -p "Introduce el PID del proceso a matar: " PID

    if ! ps -p "$PID" > /dev/null; then
        echo "Error: El PID $PID no existe."
        exit 1
    fi

    read -p "¿Está seguro de que desea matar el proceso $PID de forma forzada (kill -9)? (s/n): " confirmacion

    if [[ "$confirmacion" == "s" || "$confirmacion" == "S" ]]; then
        if kill -9 "$PID"; then
            echo "Proceso $PID terminado (matado) exitosamente."
        else
            echo "Error: No se pudo matar el proceso $PID. Puede que necesite 'sudo'."
        fi
    else
        echo "Operación cancelada."
    fi
else
    echo "Saliendo del script."
fi
