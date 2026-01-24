#!/bin/bash
# Ejercicio 13: Programa AGENDA con mantenimiento de lista.txt

FICHERO="lista.txt"
# Crear el fichero si no existe, con una cabecera
if [ ! -f "$FICHERO" ]; then
    echo "Nombre:Dirección:Teléfono" > "$FICHERO"
fi

function añadir_registro() {
    echo "--- Añadir Nuevo Registro ---"
    read -p "Nombre: " NOMBRE
    read -p "Dirección: " DIRECCION
    read -p "Teléfono: " TELEFONO
    # Añadir el registro al final del archivo en formato "Nombre:Dirección:Teléfono"
    echo "$NOMBRE:$DIRECCION:$TELEFONO" >> "$FICHERO"
    echo "Registro añadido con éxito."
}

function buscar_registro() {
    echo "--- Buscar Registros ---"
    read -p "Introduce el término de búsqueda (Nombre, Dirección o Teléfono): " TERMINO
    echo "Resultados de la búsqueda para '$TERMINO':"
    # Mostrar la cabecera y luego filtrar con grep (ignorando la cabecera)
    head -n 1 "$FICHERO"
    grep -i "$TERMINO" "$FICHERO" | grep -v "Nombre:Dirección:Teléfono"
}

function listar_registros() {
    echo "--- Listado Completo de la Agenda ---"
    if [ -s "$FICHERO" ]; then
        cat "$FICHERO"
    else
        echo "La agenda está vacía."
    fi
}

function ordenar_registros() {
    echo "--- Ordenar Registros Alfabéticamente por Nombre ---"
    # El comando 'sort' se usa para ordenar. -t: separador, -k1: clave de ordenación 1 (por nombre)
    # Se guarda el contenido ordenado (sin la cabecera) en un temp, se añade la cabecera, y se reemplaza el original
    (grep -v "Nombre:Dirección:Teléfono" "$FICHERO" | sort -t: -k1) > temp_sorted.txt
    echo "Nombre:Dirección:Teléfono" > "$FICHERO"
    cat temp_sorted.txt >> "$FICHERO"
    rm temp_sorted.txt
    echo "Agenda ordenada con éxito."
}

function borrar_archivo() {
    read -p "¿Estás seguro de que quieres BORRAR el archivo AGENDA ($FICHERO)? (s/n): " CONFIRM
    if [ "$CONFIRM" = "s" ] || [ "$CONFIRM" = "S" ]; then
        rm -f "$FICHERO"
        echo "El archivo '$FICHERO' ha sido borrado."
        exit 0
    else
        echo "Operación de borrado cancelada."
    fi
}

# Bucle principal del menú
while true; do
    echo "==================================="
    echo "             A G E N D A           "
    echo "==================================="
    echo "1) Añadir registro"
    echo "2) Buscar registro"
    echo "3) Listar registros"
    echo "4) Ordenar registros"
    echo "5) Borrar archivo (Salir)"
    echo "6) Salir sin borrar"
    echo "-----------------------------------"
    read -p "Elige una opción (1-6): " OPCION

    case $OPCION in
        1) añadir_registro ;;
        2) buscar_registro ;;
        3) listar_registros ;;
        4) ordenar_registros ;;
        5) borrar_archivo ;;
        6) echo "Saliendo del programa AGENDA."; exit 0 ;;
        *) echo "Opción no válida. Por favor, elige un número del 1 al 6." ;;
    esac
    echo -e "\nPulsa [Enter] para continuar..."
    read
done
