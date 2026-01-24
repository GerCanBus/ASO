#!/bin/bash

# Este script imprime variables de entorno relevantes,
# enfocándose en aquellas que suelen usarse para la configuración de red.

echo "=========================================="
echo "🌐 Variables de Entorno (Red y Sistema) 🌐"
echo "=========================================="
echo

# 1. Variables Comunes de Sistema
echo "--- Variables de Sistema Comunes ---"
echo "Usuario:              $USER"
echo "Directorio HOME:      $HOME"
echo "Directorio Actual:    $PWD"
echo "PATH (Rutas de comandos): $PATH"
echo

# 2. Variables Comunes de Red/Conexión (Proxies y Puertos)
echo "--- Configuración de Red/Proxy ---"
echo "Proxy HTTP (minúsculas): $http_proxy"
echo "Proxy HTTP (mayúsculas): $HTTP_PROXY"
echo "Proxy HTTPS (minúsculas): $https_proxy"
echo "Proxy HTTPS (mayúsculas): $HTTPS_PROXY"
echo "Excluir Proxy (no_proxy): $no_proxy"
echo "Puerto (PORT):          $PORT" # Común en despliegues web/APIs
echo

# 3. Variables de Configuración de Aplicaciones (a menudo incluyen detalles de red)
echo "--- Variables de Aplicación Comunes ---"
echo "Entorno de Aplicación: $NODE_ENV $RAILS_ENV $APP_ENV" # Ejemplos de entornos
echo "Clave Secreta/API: (Si existe) $API_KEY"
echo

# 4. Lista Completa de Todas las Variables
echo "=========================================="
echo "📜 Lista Completa (Resultado de printenv) 📜"
echo "=========================================="
printenv

echo
echo "Fin del script."
