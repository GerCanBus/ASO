#!/bin/bash

# =======================================================
# Variables de Configuración
# =======================================================

# variables para crear los ficheros que me van a hacer falta.

FICHERO_CSV="nuevos_usuarios.csv"
LOG_FILE="/var/log/gestion_usuarios.log"

# Comprobación de permisos de root (Necesario para useradd/groupadd)
if [ "$(id -u)" -ne 0 ]; then
    echo "ERROR: Este script debe ejecutarse como root (o con sudo)." | tee -a "$LOG_FILE" >&2
    exit 1
fi

# Comprobación del archivo de entrada
if [ ! -f "$FICHERO_CSV" ]; then
    echo "ERROR: Archivo CSV no encontrado: $FICHERO_CSV" | tee -a "$LOG_FILE" >&2
    exit 2
fi

# Cabecera del log
echo "========================================================" | tee -a "$LOG_FILE"
echo "INICIO DE PROCESAMIENTO: $(date)" | tee -a "$LOG_FILE"
echo "========================================================" | tee -a "$LOG_FILE"

# =======================================================
# Bucle para Procesar el Archivo CSV
# =======================================================
# 'IFS=;' configura el Separador de Campos Interno como punto y coma.
# 'while read -r' lee el archivo línea por línea.
while IFS=';' read -r USERNAME FULLNAME GROUPNAME
do
    ACTION_LOG="Procesando $USERNAME..."
    echo "$ACTION_LOG" | tee -a "$LOG_FILE"

    # 1. Crear el grupo si no existe
    if ! getent group "$GROUPNAME" > /dev/null; then
        groupadd "$GROUPNAME"
        if [ $? -eq 0 ]; then
            echo "   [OK] Grupo $GROUPNAME creado." | tee -a "$LOG_FILE"
        else
            echo "   [FAIL] No se pudo crear el grupo $GROUPNAME." | tee -a "$LOG_FILE" >&2
            continue # Pasa a la siguiente línea si el grupo falla
        fi
    else
        echo "   [INFO] El grupo $GROUPNAME ya existe." | tee -a "$LOG_FILE"
    fi

    # 2. Crear el usuario
    if ! id -u "$USERNAME" > /dev/null 2>&1; then
        # -m: Crear home directory
        # -s /bin/bash: Asignar shell bash
        # -g: Asignar grupo principal
        useradd -m -s /bin/bash -g "$GROUPNAME" -c "$FULLNAME" "$USERNAME"
        if [ $? -eq 0 ]; then
            echo "   [OK] Usuario $USERNAME creado y asignado al grupo $GROUPNAME." | tee -a "$LOG_FILE"
        else
            echo "   [FAIL] No se pudo crear el usuario $USERNAME." | tee -a "$LOG_FILE" >&2
        fi
    else
        echo "   [WARN] El usuario $USERNAME ya existe. Omitido." | tee -a "$LOG_FILE"
    fi

done < "$FICHERO_CSV"

echo "========================================================" | tee -a "$LOG_FILE"
echo "FIN DE PROCESAMIENTO: $(date)" | tee -a "$LOG_FILE"
exit 0
