#!/bin/bash
# Imprime la primera línea de /etc/passwd

sed -n '1p;1q' /etc/passwd.bak
