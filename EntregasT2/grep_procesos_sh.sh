#!/bin/bash
# 4. Haciendo uso del comando grep y ps, lista todos los procesos que se están ejecutando en el sistema y terminan en .sh
echo "--- 4. Procesos terminados en .sh (ps aux | grep '\.sh$') ---"
ps aux | grep '\.sh$' | grep -v "grep"
# Por si no hubiese  ningún proceso terminado en '.sh'
if [ $? -ne 0 ]; then
    echo "(No se encontraron procesos terminados en .sh)"
fi
