#!/bin/bash
# Ejercicio 14: Gestión de usuarios del sistema (alta/baja).

OPERACION="$1"
NOMBRE="$2"
APELLIDO1="$3"
APELLIDO2="$4"
GRUPO="${5:-}" # Opcional: si no se pasa, queda vacío

# Función para calcular el ID de usuario
function calcular_id() {
    # alu + APELLIDO1 (2 primeras) + APELLIDO2 (2 primeras) + NOMBRE (inicial)
    local ALIAS1=$(echo "$APELLIDO1" | cut -c 1-2 | tr '[:lower:]' '[:upper:]')
    local ALIAS2=$(echo "$APELLIDO2" | cut -c 1-2 | tr '[:lower:]' '[:upper:]')
    local INICIAL=$(echo "$NOMBRE" | cut -c 1 | tr '[:lower:]' '[:upper:]')
    echo "alu${ALIAS1}${ALIAS2}${INICIAL}"
}

# Comprobación de sintaxis básica
if [ "$#" -lt 4 ] || [ "$#" -gt 5 ]; then
    echo "Error. La sintaxis correcta es:"
    echo "./gestionusuarios.sh alta/baja nombre apellido1 apellido2 [grupo]"
    exit 1
fi

# Procesar la operación
case "$OPERACION" in
    alta)
        ID_USUARIO=$(calcular_id)
        
        echo "--- Proceso de ALTA de usuario ---"
        echo "Nombre completo: $NOMBRE $APELLIDO1 $APELLIDO2"
        echo "ID de usuario a crear: $ID_USUARIO"
        
        # 1. Verificar si el usuario ya existe
        if id "$ID_USUARIO" &>/dev/null; then
            echo "Error: El usuario '$ID_USUARIO' ya existe en el sistema."
            exit 1
        fi
        
        # 2. Definir el grupo (si no se especifica, usa el ID de usuario)
        GRUPO_PRINCIPAL="$GRUPO"
        if [ -z "$GRUPO_PRINCIPAL" ]; then
            GRUPO_PRINCIPAL="$ID_USUARIO"
            echo "Creando nuevo grupo: $GRUPO_PRINCIPAL (ya que no se especificó un grupo)."
            # Crear el grupo si no existe
            if ! getent group "$GRUPO_PRINCIPAL" &>/dev/null; then
                groupadd "$GRUPO_PRINCIPAL"
                if [ $? -ne 0 ]; then
                    echo "Error: No se pudo crear el grupo '$GRUPO_PRINCIPAL'. ¿Permisos de root?"
                    exit 1
                fi
            fi
        else
             # Verificar si el grupo especificado existe
            if ! getent group "$GRUPO_PRINCIPAL" &>/dev/null; then
                echo "Error: El grupo especificado '$GRUPO_PRINCIPAL' no existe."
                exit 1
            fi
        fi
        
        # 3. Dar de alta al usuario
        # -m: crear directorio home, -g: grupo principal
        echo "Creando usuario '$ID_USUARIO' con grupo principal '$GRUPO_PRINCIPAL'..."
        useradd -m -g "$GRUPO_PRINCIPAL" -c "$NOMBRE $APELLIDO1 $APELLIDO2" "$ID_USUARIO"
        
        if [ $? -eq 0 ]; then
            echo "Éxito: Usuario '$ID_USUARIO' creado con éxito."
            echo "Recuerda asignar una contraseña con: sudo passwd $ID_USUARIO"
        else
            echo "Error: No se pudo crear el usuario. ¿Permisos de root?"
        fi
        ;;

    baja)
        ID_USUARIO=$(calcular_id)
        
        echo "--- Proceso de BAJA de usuario ---"
        echo "ID de usuario a eliminar: $ID_USUARIO"

        # 1. Verificar si el usuario existe
        if ! id "$ID_USUARIO" &>/dev/null; then
            echo "Error: El usuario '$ID_USUARIO' no existe en el sistema."
            exit 1
        fi

        # 2. Dar de baja al usuario
        # -r: eliminar el directorio home y el buzón de correo
        read -p "¿Estás seguro de que quieres ELIMINAR al usuario '$ID_USUARIO' y su directorio home? (s/n): " CONFIRM
        if [ "$CONFIRM" = "s" ] || [ "$CONFIRM" = "S" ]; then
            echo "Eliminando usuario '$ID_USUARIO'..."
            userdel -r "$ID_USUARIO"
            if [ $? -eq 0 ]; then
                echo "Éxito: Usuario '$ID_USUARIO' eliminado con éxito."
            else
                echo "Error: No se pudo eliminar el usuario. ¿Permisos de root?"
            fi
        else
            echo "Operación de baja cancelada."
        fi
        ;;

    *)
        echo "Error. La opción '$OPERACION' no es válida."
        echo "La sintaxis correcta es: ./gestionusuarios.sh alta/baja nombre apellido1 apellido2 [grupo]"
        exit 1
        ;;
esac
