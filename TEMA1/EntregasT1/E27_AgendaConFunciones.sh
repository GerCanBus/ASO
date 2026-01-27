#!/bin/bash
# 📅 Agenda Avanzada: Gestión de contactos con validación y edición.

# --- Variables de Usuario (en minúsculas) ---
fichero_agenda="agenda.csv"
separador=";"
cabecera="Nombre${separador}Teléfono${separador}Email"
temp_file="agenda_temp.csv" # Archivo temporal para operaciones de modificación

# --- Expresiones Regulares para Validación ---
# RegEx básica para un número de teléfono (asume al menos 9 dígitos)
regex_telefono="^[0-9]{9,}$"
# RegEx básica para formato de email (algo@algo.algo)
regex_email="^[^@]+@[^@]+\.[^@]{2,}$"

## 🛠️ Inicialización
# Crea el archivo CSV si no existe, añadiendo la cabecera
function inicializar_agenda() {
    if [ ! -f "$fichero_agenda" ]; then
        echo "📜 Creando archivo de agenda: $fichero_agenda"
        echo "$cabecera" > "$fichero_agenda"
    fi
}

## ➕ Añadir Contacto
function agregar_contacto() {
    echo "--- ➕ Añadir Nuevo Contacto ---"
    
    # Lectura de campos
    read -r -p "Nombre: " nombre
    read -r -p "Teléfono (mín. 9 dígitos): " telefono
    read -r -p "Email: " email

    # Validación de campos
    if [ -z "$nombre" ] || [ -z "$telefono" ] || [ -z "$email" ]; then
        echo "❌ Error: Todos los campos deben ser completados."
        return 1
    fi
    
    # Validación de Teléfono
    if ! [[ "$telefono" =~ $regex_telefono ]]; then
        echo "❌ Error: Formato de teléfono no válido. Debe tener al menos 9 dígitos."
        return 1
    fi

    # Validación de Email
    if ! [[ "$email" =~ $regex_email ]]; then
        echo "❌ Error: Formato de email no válido (ej: usuario@dominio.com)."
        return 1
    fi

    # Añadir el registro al final del archivo
    echo "$nombre$separador$telefono$separador$email" >> "$fichero_agenda"
    echo "✅ Contacto de '$nombre' añadido con éxito."
}

## 🔍 Buscar Contacto
function buscar_contacto() {
    echo "--- 🔍 Buscar Contactos ---"
    read -r -p "Introduce el término de búsqueda (Nombre, Teléfono o Email): " termino_busqueda
    
    if [ -z "$termino_busqueda" ]; then
        echo "⚠️ No se introdujo un término de búsqueda."
        return 1
    fi

    echo "Resultados de la búsqueda para '$termino_busqueda':"
    
    # Mostrar la cabecera y luego filtrar las líneas que coinciden
    grep -i "$termino_busqueda" "$fichero_agenda" | \
    grep -Fv "$cabecera" # Filtramos la cabecera si coincide con el término
}

## 📃 Listar Contactos
function listar_contactos() {
    echo "--- 📃 Listado Completo de la Agenda ---"
    # El comando 'tail -n +1' incluye la primera línea (cabecera)
    if [ -s "$fichero_agenda" ]; then
        column -t -s "$separador" "$fichero_agenda" # Usa 'column' para formato tabular
    else
        echo "La agenda está vacía."
    fi
}

## ✏️ Editar Contacto
function editar_contacto() {
    echo "--- ✏️ Editar Contacto ---"
    read -r -p "Introduce el nombre del contacto a EDITAR: " nombre_editar

    # Buscamos y mostramos las coincidencias (excluyendo la cabecera)
    linea_a_editar=$(grep -i -n -Fv "$cabecera" "$fichero_agenda" | grep -i "$nombre_editar" | cut -d ':' -f 1)
    
    if [ -z "$linea_a_editar" ]; then
        echo "❌ No se encontró un contacto con el nombre '$nombre_editar'."
        return 1
    fi

    # El número de línea de grep -n es relativo al archivo completo, no al filtrado.
    contacto_original=$(sed -n "${linea_a_editar}p" "$fichero_agenda")
    IFS="$separador" read -r old_nombre old_telefono old_email <<< "$contacto_original"
    
    echo "Contacto encontrado (Línea $linea_a_editar): $contacto_original"
    
    # Pedir nuevos datos
    read -r -p "Nuevo Nombre (dejar vacío para '$old_nombre'): " nuevo_nombre
    read -r -p "Nuevo Teléfono (dejar vacío para '$old_telefono'): " nuevo_telefono
    read -r -p "Nuevo Email (dejar vacío para '$old_email'): " nuevo_email

    # Usar los valores antiguos si el nuevo campo está vacío
    nombre=${nuevo_nombre:-$old_nombre}
    telefono=${nuevo_telefono:-$old_telefono}
    email=${nuevo_email:-$old_email}

    # Validación del nuevo Teléfono (solo si se modificó)
    if [ "$telefono" != "$old_telefono" ] && ! [[ "$telefono" =~ $regex_telefono ]]; then
        echo "❌ Error: Nuevo formato de teléfono no válido. Edición cancelada."
        return 1
    fi
    
    # Validación del nuevo Email (solo si se modificó)
    if [ "$email" != "$old_email" ] && ! [[ "$email" =~ $regex_email ]]; then
        echo "❌ Error: Nuevo formato de email no válido. Edición cancelada."
        return 1
    fi

    # Reemplazar la línea en el archivo
    nueva_linea="$nombre$separador$telefono$separador$email"
    # Usamos sed para reemplazar la línea exacta
    sed -i "${linea_a_editar}c\\$nueva_linea" "$fichero_agenda"
    
    echo "✅ Contacto editado con éxito."
}

## 🗑️ Borrar Contacto
function borrar_contacto() {
    echo "--- 🗑️ Borrar Contacto ---"
    read -r -p "Introduce el nombre del contacto a BORRAR: " nombre_borrar
    
    # Buscamos la línea, sin la cabecera
    lineas_encontradas=$(grep -i -n -Fv "$cabecera" "$fichero_agenda" | grep -i "$nombre_borrar")
    
    if [ -z "$lineas_encontradas" ]; then
        echo "❌ No se encontró ningún contacto con el nombre '$nombre_borrar'."
        return 1
    fi

    echo "Contactos encontrados:"
    echo "----------------------"
    # Extraemos el número de línea y el contenido. Usamos 'grep -v $cabecera' para excluir la cabecera si $nombre_borrar coincide con 'Nombre'
    echo "$lineas_encontradas" | grep -i -Fv "$cabecera" | cut -d ':' -f 1 --output-delimiter=') ' -s | column -t -s "$separador" 
    echo "----------------------"

    read -r -p "¿Estás seguro de que quieres borrar TODOS los contactos listados? (s/N): " confirmacion
    
    if [[ "$confirmacion" =~ ^[Ss]$ ]]; then
        # Extraemos el número de línea de cada coincidencia y lo usamos con sed
        lineas_a_borrar=$(echo "$lineas_encontradas" | cut -d ':' -f 1 | tr '\n' ',' | sed 's/,$//')
        
        # sed -i: editar el archivo in-place (directamente)
        # sed 'Nd' borra la línea N. Aquí usamos sed para generar múltiples comandos de borrado
        sed -i "${lineas_a_borrar}d" "$fichero_agenda"
        
        echo "✅ Contactos borrados con éxito."
    else
        echo "Operación de borrado cancelada."
    fi
}

## ❌ Borrar Archivo (y Salir)
function borrar_archivo_salir() {
    echo "--- ❌ Borrar Archivo y Salir ---"
    read -r -p "¿Estás seguro de que quieres BORRAR la agenda ($fichero_agenda) y salir? (s/N): " confirmacion_borrar
    if [[ "$confirmacion_borrar" =~ ^[Ss]$ ]]; then
        rm -f "$fichero_agenda"
        echo "El archivo '$fichero_agenda' ha sido borrado."
        exit 0
    else
        echo "Operación de borrado cancelada."
    fi
}

## 🖥️ Imprimir Menú
function imprimir_menu() {
    echo "======================================="
    echo "            A G E N D A (CSV)          "
    echo "======================================="
    echo "1) ➕ Añadir contacto"
    echo "2) 🔍 Buscar contacto"
    echo "3) 📃 Listar contactos"
    echo "4) ✏️ Editar contacto"
    echo "5) 🗑️ Borrar contacto(s)"
    echo "6) ❌ Borrar archivo y Salir"
    echo "7) 🚪 Salir sin borrar"
    echo "---------------------------------------"
    read -r -p "Elige una opción (1-7): " opcion
    
    case "$opcion" in
        1) agregar_contacto ;;
        2) buscar_contacto ;;
        3) listar_contactos ;;
        4) editar_contacto ;;
        5) borrar_contacto ;;
        6) borrar_archivo_salir ;;
        7) echo "Saliendo del programa AGENDA."; exit 0 ;;
        *) echo "❌ Opción no válida. Por favor, elige un número del 1 al 7." ;;
    esac
}

# --- Bucle Principal del Programa ---

inicializar_agenda # Asegura que el archivo y la cabecera existan.

while true; do
    imprimir_menu
    echo -e "\nPulsa [Enter] para volver al menú..."
    read -r # read -r para evitar que las barras invertidas sean interpretadas
done
