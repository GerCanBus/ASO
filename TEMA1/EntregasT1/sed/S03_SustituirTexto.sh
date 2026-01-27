#!/bin/bash

# Sustituye 'daemon' por 'servicio' (modificación in-place)

# Advertencia: Esto modifica realmente el archivo /etc/passwd. Menos mal que tenía hecha una instantanea.

# Se recomienda usar una copia para pruebas.

# sed -i.bak 's/daemon/servicio/g' /etc/passwd (Yo ya la tengo hecha) 

# Usar .bak para copia de seguridad


sed -i 's/daemon/servicio/g' /etc/passwd.bak
echo "/etc/passwd ha sido modificado. Se ha reemplazado 'daemon' por 'servicio'."

