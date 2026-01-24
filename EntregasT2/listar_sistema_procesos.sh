#!/bin/bash
# 2. Lista los procesos que se están ejecutando en el sistema.
echo "--- 2. Procesos en todo el sistema (ps aux) ---"
ps aux | head -n 1
ps aux | sort -k3,3nr | head -n 10
