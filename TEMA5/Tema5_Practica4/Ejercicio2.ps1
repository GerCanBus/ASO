# Configuración para que los acentos y caracteres especiales se muestren correctamente
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "--- Contador de Años Cumplidos ---" -ForegroundColor Cyan
Write-Host ""

# 1. Solicitar la edad al usuario
$edad = [int](Read-Host "¿Cuántos años tienes?")

Write-Host ""
Write-Host "Has cumplido los siguientes años:" -ForegroundColor Yellow

# 2. Bucle para recorrer desde 1 hasta la edad introducida
# Usamos el operador -le (menor o igual) para incluir el año actual
for ($i = 1; $i -le $edad; $i++) {
    Write-Host "Año: $i"
}

Write-Host ""
Read-Host "Presiona Enter para finalizar"