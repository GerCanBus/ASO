#!/bin/bash
# 6. Comprueba qué proceso está consumiendo más recursos utilizando top.
echo "--- 6. Procesos con mayor consumo (top -b -n 1) ---"
echo "El proceso con el PID y %CPU más alto es el que más recursos consume en este instante."
top -b -n 1 | head -n 10
