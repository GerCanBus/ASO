#!/bin/bash
# script9_mejorado.sh: Muestra las primeras 5 líneas con 'error'

# Inicializa un contador en el buffer de espera (hold space)
sed -n '1{x;s/^/0/;x}
/error/{
    p
    x
    s/[0-9]*/\0+1/e
    /5/{q}
    x
}' /var/log/syslog
