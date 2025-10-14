#!/bin/bash
# Script: InformeDeRed.sh
# Genera un informe de la red local, incluyendo la información de subred
# y un escaneo de IPs para determinar cuáles están libres.

fichero_informe="informe_ip_libres.txt"
ping_count=1 # Número de pings a enviar para cada IP
ping_timeout=1 # Tiempo de espera para la respuesta de ping

# --- Funciones ---

## 🛠️ Obtener Configuración de Red
# Utiliza 'ip a' y 'ip r' para obtener la configuración de la red local activa.
function obtener_configuracion_red() {
    # 1. Obtener la interfaz de red principal y la subred CIDR
    local interfaz=$(ip route | grep default | awk '{print $5}' | head -n 1)
    local cidr=$(ip addr show "$interfaz" | grep 'inet ' | awk '{print $2}')
    
    if [ -z "$cidr" ]; then
        echo "❌ Error: No se pudo obtener la configuración de red principal."
        return 1
    fi

    # 2. Separar IP y máscara CIDR
    local ip_equipo=$(echo "$cidr" | cut -d '/' -f 1)
    local mascara_cidr=$(echo "$cidr" | cut -d '/' -f 2)

    # 3. Calcular la IP de red y la máscara de subred (dotada)
    # Se usa 'ipcalc' si está disponible, si no, se utiliza 'ip' (más robusto en Ubuntu)
    if command -v ipcalc &> /dev/null; then
        local red=$(ipcalc -n "$cidr" | grep Network | awk '{print $2}')
        local broadcast=$(ipcalc -b "$cidr" | grep Broadcast | awk '{print $2}')
        local mascara_subred=$(ipcalc -m "$cidr" | grep Netmask | awk '{print $2}')
    else
        # Usar el comando 'ip' y cálculos de subred
        local red=$(ip route show dev "$interfaz" | grep proto | awk '{print $1}' | cut -d '/' -f 1)
        local broadcast="Desconocido (ipcalc no instalado)" # 'ip' no da broadcast directamente
        local mascara_subred=$(printf '%.0f' $((0xFFFFFFFF << (32 - $mascara_cidr) & 0xFFFFFFFF)) | awk '{print int($1)}' | awk -F '.' ' {printf("%d.%d.%d.%d\n", $1/16777216, $1%16777216/65536, $1%65536/256, $1%256)}')
        broadcast="N/A (instalar ipcalc para precisión)"
    fi
    
    # Exportar variables (en mayúsculas por ser datos del sistema/red)
    export IP_EQUIPO="$ip_equipo"
    export RANGO_CIDR="$cidr"
    export INTERFAZ_RED="$interfaz"
    export IP_RED="$red"
    export MASCARA_SUBRED="$mascara_subred"
    export BROADCAST="$broadcast"
    export MASCARA_CIDR="$mascara_cidr"

    return 0
}

## 🔍 Escanear Red y Generar Informe
function escanear_red_y_generar_informe() {
    # Verificar que la configuración de red se obtuvo correctamente
    if ! obtener_configuracion_red; then
        echo "No se puede continuar sin configuración de red."
        return 1
    fi
    
    echo "Generando informe de red. Paciencia!! Esto puede durar varios minutos..."
    
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
        echo "-------------------------------"
        echo "## Listado de IPs y Estado"
        printf "%-18s %s\n" "Dirección IP" "Estado"
        echo "-----------------------------------"
    } > "$fichero_informe"

    # 2. Extraer el prefijo de red para el escaneo (Ej: 192.168.1)
    local prefijo_red=$(echo "$IP_EQUIPO" | cut -d '.' -f 1-3)

    # 3. Bucle para escanear de .1 a .254
    for i in $(seq 1 254); do
        local ip_a_pingear="$prefijo_red.$i"
        local estado="LIBRE"

        # Silenciar la salida de ping y comprobar el código de retorno
        # -c: count (número de paquetes) | -W: timeout (tiempo de espera)
        if ping -c "$ping_count" -W "$ping_timeout" "$ip_a_pingear" &> /dev/null; then
            estado="OCUPADA"
        fi

        printf "%-18s %s\n" "$ip_a_pingear" "$estado" >> "$fichero_informe"
    done
    
    echo "-----------------------------------" >> "$fichero_informe"
    echo "✅ Informe completado y guardado en $fichero_informe"
    echo "Pulsa Enter para mostrar el contenido..."
    read
    cat "$fichero_informe"
}

# --- Ejecución Principal ---

escanear_red_y_generar_informe
