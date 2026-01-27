# Configuración para que los acentos y caracteres especiales se muestren correctamente
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "--- Generador de Tablas de Multiplicar ---" -ForegroundColor Cyan
Write-Host ""

# 1. Solicitar el número al usuario y convertirlo a entero
$numero = [int](Read-Host "Introduce el número del que quieres ver la tabla")

Write-Host ""
Write-Host "Tabla del $numero :" -ForegroundColor Yellow
Write-Host "------------------"

# 2. Bucle for para calcular del 1 al 10
# $i es el multiplicador que irá cambiando en cada vuelta
for ($i = 1; $i -le 10; $i++) {
    $resultado = $numero * $i
    Write-Host "$numero x $i = $resultado"
}

Write-Host ""
Read-Host "Presiona Enter para finalizar"