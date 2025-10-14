#!/bin/bash
# Script: informe_red.sh
# Genera un informe de la red local, incluyendo la información de subred,
# un escaneo de IPs y la indicación del método de cálculo usado.

# --- Variables de Usuario (en minúsculas) ---
fichero_informe="informe_ip_libres.txt"
ping_count=1 # Número de pings a enviar para cada IP
ping_timeout=1 # Tiempo de espera para la respuesta de ping
calculo_metodo="Fallback" # Variable para rastrear el método usado

# --- Funciones ---

## 💾 Comprobar e Instalar ipcalc
function verificar_e_instalar_ipcalc() {
    # Comprueba si el comando 'ipcalc' existe en el PATH
    if ! command -v ipcalc &> /dev/null; then
        echo "⚠️ El comando 'ipcalc' no está instalado. Es necesario para precisión en el cálculo de subred."
        echo "Intentando instalar ipcalc (se requerirá 'sudo')..."
        
        # Intentar instalar ipcalc (-y para evitar la pregunta de confirmación)
        if sudo apt update && sudo apt install -y ipcalc; then
            echo "✅ 'ipcalc' instalado con éxito."
        else
            echo "❌ Error al instalar 'ipcalc'. El informe de red podría ser incompleto o menos preciso."
        fi
    fi
}

## 🛠️ Obtener Configuración de Red (Con Fallback)
function obtener_configuracion_red() {
    local interfaz=$(ip route | grep default | awk '{print $5}' | head -n 1)
    local cidr=$(ip addr show "$interfaz" | grep 'inet ' | awk '{print $2}')
    
    if [ -z "$cidr" ]; then
        echo "❌ Error: No se pudo obtener la configuración de red principal."
        return 1
    fi

    local ip_equipo=$(echo "$cidr" | cut -d '/' -f 1)
    local mascara_cidr=$(echo "$cidr" | cut -d '/' -f 2)

    # Usa ipcalc si está disponible
    if command -v ipcalc &> /dev/null; then
        local red=$(ipcalc -n "$cidr" | grep Network | awk '{print $2}')
        local broadcast=$(ipcalc -b "$cidr" | grep Broadcast | awk '{print $2}')
        local mascara_subred=$(ipcalc -m "$cidr" | grep Netmask | awk '{print $2}')
        calculo_metodo="ipcalc" # Actualiza la variable global
    else
        # Lógica de fallback
        local red=$(ip route show dev "$interfaz" | grep proto | awk '{print $1}' | cut -d '/' -f 1)
        local mascara_subred="N/A (instalar ipcalc)"
        local broadcast="N/A (instalar ipcalc)"
        calculo_metodo="Fallback" # Mantener la variable global
    fi
    
    # Exportar variables de red (MAYÚSCULAS)
    export IP_EQUIPO="$ip_equipo"
    export RANGO_CIDR="$cidr"
    export INTERFAZ_RED="$interfaz"
    export IP_RED="$red"
    export MASCARA_SUBRED="$mascara_subred"
    export BROADCAST="$broadcast"
    export MASCARA_CIDR="$mascara_cidr"
    export CALCULO_METODO="$calculo_metodo" # Exportar el método para el informe

    return 0
}

## 🔍 Escanear Red y Generar Informe
function escanear_red_y_generar_informe() {
    if ! obtener_configuracion_red; then
        echo "No se puede continuar sin configuración de red."
        return 1
    fi
    
    echo "Generando informe de red. Esto puede tomar tiempo..."
    
    # 1. Preparar el archivo de informe
    {
        echo "--- Informe de la Red Local ---"
        echo "Fecha: $(date)"
        echo "Equipo: $IP_EQUIPO (Interfaz: $INTERFAZ_RED)"
        echo "-------------------------------"
        echo "## Configuración de Subred"
        echo "Tipo de Red (CIDR): $RANGO_CIDR"
        echo "IP de Red:          $IP_RED"
        echo "Máscara de Subred:  $MASCARA_SUBRED (/$MASCARA_CIDR)"
        echo "Broadcast:          $BROADCAST"
        echo "Método de Cálculo:  **$CALCULO_METODO**" # Línea añadida
        echo "-------------------------------"
        echo "## Listado de IPs y Estado"
        printf "%-18s %s\n" "Dirección IP" "Estado"
        echo "-----------------------------------"
    } > "$fichero_informe"

    # 2. Extraer el prefijo de red para el escaneo (Asume subred /24)
    local prefijo_red=$(echo "$IP_EQUIPO" | cut -d '.' -f 1-3)

    # 3. Bucle para escanear de .1 a .254
    for i in $(seq 1 254); do
        local ip_a_pingear="$prefijo_red.$i"
        local estado="LIBRE"

        # Silenciar la salida de ping y comprobar el código de retorno
        if ping -c "$ping_count" -W "$ping_timeout" "$ip_a_pingear" &> /dev/null; then
            estado="OCUPADA"
        fi

        printf "%-18s %s\n" "$ip_a_pingear" "$estado" >> "$fichero_informe"
    done
    
    echo "-----------------------------------" >> "$fichero_informe"
    echo "✅ Informe completado y guardado en $fichero_informe"
    echo "Pulsa Enter para mostrar el contenido..."
    read -r
    cat "$fichero_informe"
}

# --- Ejecución Principal ---

verificar_e_instalar_ipcalc 

escanear_red_y_generar_informe
