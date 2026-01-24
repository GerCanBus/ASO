#!/bin/bash

# Numera las líneas

# Se usa '=' para imprimir el número de línea.

sed '=' /etc/hostname.bak | sed 'N;s/\n/\t/'


