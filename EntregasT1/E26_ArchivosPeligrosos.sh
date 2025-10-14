#!/bin/bash

# Defino el nombre del archivo de salida
ARCHIVO_SALIDA="archivos_peligrosos.txt"

echo "🔎 Buscando archivos modificables por cualquier usuario (permiso 'w' para 'otros')..."

# 1. Limpio el archivo de salida si existe, y si no, lo creo
> "$ARCHIVO_SALIDA"

# 2. Uso 'find' para localizar los archivos
#    -type f: Busca solo archivos regulares.
#    -perm /002: Esta es la clave. Busca archivos que tengan al menos
#                el permiso de escritura (w) habilitado para el grupo "otros" (el último dígito '2').
#    -print: Imprimo la ruta completa de cada archivo encontrado.
find . -type f -perm /002 -print >> "$ARCHIVO_SALIDA"

# 3. Muestra el resultado
LINEAS_ENCONTRADAS=$(wc -l < "$ARCHIVO_SALIDA")

if [ "$LINEAS_ENCONTRADAS" -gt 0 ]; then
    echo "✅ Se encontraron $LINEAS_ENCONTRADAS archivos peligrosos."
    echo "La lista completa con las rutas exactas se ha guardado en: $ARCHIVO_SALIDA"
else
    echo "👍 No se encontraron archivos con permiso de escritura para 'otros' en este directorio."
    # Opcional: Eliminar el archivo si no se encontró nada para mantener limpio el entorno
    rm "$ARCHIVO_SALIDA"
fi

echo "---"
