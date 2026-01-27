#!/bin/bash

Enunciado="


El script debe verificar que se ejecuta con privilegios de root. Si no es así, debe salir con un mensaje
de error adecuado.

Debe buscar en el directorio /var/log/aplicaciones/ todos los archivos con la extensión .log que no hayan sido
modificados en los últimos 30 días (-mtime).

Los archivos encontrados deben ser comprimidos utilizando gzip y movidos al directorio /var/backups/logs_historico/.

Los archivos comprimidos con extensión .gz que lleven más de 180 días en /var/backups/logs_historico/ deben
ser eliminados.

Finalmente, el script debe enviar un correo electrónico al administrador (admin@example.com) con la lista de los archivos que fueron comprimidos y movidos en esta ejecución.
"

#!/bin/bash

# Directorios
LOG_DIR="/var/log/"
HISTORICO_DIR="/var/backups/logs_historico"
ADMIN_EMAIL="gercanbus@alu.edu.gva.es"
LOG_MOVIDOS=$(mktemp) # Crea un archivo temporal para la lista de logs

# 1. Verificar privilegios de root
if [ "$(id -u)" -ne 0 ]; then
    echo "ERROR: Este script debe ejecutarse como root (sudo)." >&2
    rm "$LOG_MOVIDOS"
    exit 1
fi

mkdir -p "$HISTORICO_DIR"

# 2. y 3. Buscar, comprimir y mover archivos de más de 30 días
echo "Iniciando compresión de logs antiguos..."
# -type f: solo archivos | -name "*.log": solo logs | -mtime +30: modificados hace más de 30 días
find "$LOG_DIR" -type f -name "*.log" -mtime +30 -print0 | while IFS= read -r -d $'\0' LOG_FILE; do
    # Compresión y movimiento
    gzip -f "$LOG_FILE" # Comprime el archivo en el mismo lugar, crea .gz
    LOG_GZ="${LOG_FILE}.gz"
    
    if [ -f "$LOG_GZ" ]; then
        mv "$LOG_GZ" "$HISTORICO_DIR/"
        echo "$(basename "$LOG_GZ")" >> "$LOG_MOVIDOS"
    fi
done

# 4. Eliminar archivos comprimidos con más de 180 días
echo "Eliminando logs históricos con más de 180 días..."
# -mtime +180: modificados hace más de 180 días | -delete: elimina directamente
find "$HISTORICO_DIR" -type f -name "*.gz" -mtime +180 -delete

# 5. Enviar correo electrónico
if [ -s "$LOG_MOVIDOS" ]; then
    MAIL_BODY="Se han comprimido y movido los siguientes archivos:\n\n$(cat "$LOG_MOVIDOS")"
    echo -e "$MAIL_BODY" | mail -s "Informe de Limpieza de Logs $(date +%F)" "$ADMIN_EMAIL"
    echo "Informe enviado a $ADMIN_EMAIL."
else
    echo "No se encontraron logs para comprimir y mover."
fi

rm "$LOG_MOVIDOS" # Limpia el archivo temporal
exit 0
