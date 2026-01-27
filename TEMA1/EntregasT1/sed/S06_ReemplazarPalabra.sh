#!/bin/bash

# Reemplaza 'tcp' por 'TCP' (modificación in-place)

# OJO!! : Esto modificará /etc/services. Se recomienda usar una copia para pruebas.

sed -i 's/tcp/TCP/g' /etc/services.bak

echo "/etc/services ha sido modificado. Se ha reemplazado 'tcp' por ‘TCP'."
