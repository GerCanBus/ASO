#!/bin/bash

# --- Configuración de Variables ---
# Las variables definidas por el usuario están en minúsculas.
archivo_salida="archivos_peligrosos.txt"

echo "🔎 Buscando archivos modificables por cualquier usuario (permiso 'w' para 'otros')..."

# 1. Limpia el archivo de salida si existe, o lo crea
# Uso de la redirección > para truncar (vaciar) o crear el archivo.
> "$archivo_salida"

# 2. Usa 'find' para localizar archivos con permiso de escritura para 'otros' (permiso /002)
# y guarda la ruta completa en la variable $archivo_salida.
# Nota: find $PWD busca desde el directorio actual, que es similar a find .
find . -type f -perm /002 -print >> "$archivo_salida"

# 3. Muestra el resultado
# Almacenamos el recuento de líneas en una variable de usuario en minúsculas.
lineas_encontradas=$(wc -l < "$archivo_salida")

if [ "$lineas_encontradas" -gt 0 ]; then
    echo "✅ Se encontraron $lineas_encontradas archivos peligrosos."
    echo "La lista completa con las rutas exactas se ha guardado en: $(pwd)/$archivo_salida"
else
    echo "👍 No se encontraron archivos con permiso de escritura para 'otros' en este directorio."
    # Si no hay archivos, eliminamos el archivo de salida para limpiar.
    rm "$archivo_salida"
fi

echo "---"
