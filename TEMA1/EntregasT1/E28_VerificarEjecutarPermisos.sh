#!/bin/bash
# Script: E28_VerificarEjecutarPermisos.sh
# Uso: ./E28_VerificarEjecutarPermisos.sh <nombre_del_fichero>

# --- Variables de Usuario ---
# El nombre del archivo se obtiene del primer parámetro pasado al script.
fichero_a_verificar="$1"

## 🔍 Función 'existe': Verifica y modifica permisos
# Parámetros: $1 - El nombre del fichero
function existe() {
    local nombre_fichero="$1"

    echo "Verificando la existencia del fichero: $nombre_fichero..."

    # Verifica si el fichero existe y es un archivo regular (-f)
    if [ -f "$nombre_fichero" ]; then
        echo "✅ El fichero '$nombre_fichero' EXISTE."
        
        # 1. Obtenemos los permisos actuales para referencia (opcional)
        permisos_actuales=$(stat -c "%a" "$nombre_fichero")
        echo "   Permisos actuales (octal): $permisos_actuales"

        # 2. Modificamos los permisos: 
        #    u+x: Añade permiso de ejecución (x) al propietario (u).
        #    o-x: Quita permiso de ejecución (x) a otros (o).
        #    g-x: Quita permiso de ejecución (x) al grupo (g).
        #    Alternativamente: chmod u+x,go-x "$nombre_fichero"
        
        chmod u+x,go-x "$nombre_fichero"
        
        permisos_nuevos=$(stat -c "%a" "$nombre_fichero")
        echo "   Permisos cambiados. Nuevo modo (octal): $permisos_nuevos"
        echo "   (Ahora es ejecutable para el propietario, pero no para el grupo/otros)."
        return 0 # Éxito
    else
        echo "❌ Error: El fichero '$nombre_fichero' NO existe o no es un archivo regular."
        return 1 # Fallo
    fi
}

# --- Lógica Principal del Script ---

# 1. Comprobar que se ha pasado el parámetro
if [ -z "$fichero_a_verificar" ]; then
    echo "⚠️ ERROR: Debes pasar el nombre del fichero como parámetro."
    echo "Uso: $0 <nombre_del_fichero>"
    exit 1
fi

# 2. Llamar a la función con el parámetro recibido
existe "$fichero_a_verificar"

echo "---"
