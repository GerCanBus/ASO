# Configuración para que los acentos y caracteres especiales se muestren correctamente
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "--- Cuenta Atrás en el Shell ---" -ForegroundColor Cyan
Write-Host ""

# 1. Solicitar un número entero positivo
$numero = [int](Read-Host "Introduce un número entero positivo")

Write-Host ""

# 2. Crear la cuenta atrás
# Generamos un rango desde el número hasta 0 y lo unimos con comas
$cuentaAtras = ($numero..0) -join ", "

# 3. Mostrar el resultado
Write-Host "Resultado:" -ForegroundColor Yellow
Write-Host $cuentaAtras

Write-Host ""
Read-Host "Presiona Enter para finalizar"