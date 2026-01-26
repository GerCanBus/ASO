# Configuración para que los acentos se muestren correctamente
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "--- Sistema de Cobro: Sala de Juegos ---" -ForegroundColor Cyan
Write-Host ""

# Solicitar la edad al usuario
$edadEntrada = Read-Host "Introduce la edad del cliente"
$edad = [int]$edadEntrada

Write-Host ""

# Lógica para determinar el precio
if ($edad -lt 4) {
    Write-Host "El cliente tiene $edad años. Entrada: GRATIS." -ForegroundColor Green
}
elseif ($edad -ge 4 -and $edad -le 18) {
    Write-Host "El cliente tiene $edad años. Precio de la entrada: 5€." -ForegroundColor Yellow
}
else {
    Write-Host "El cliente tiene $edad años. Precio de la entrada: 10€." -ForegroundColor Magenta
}

Write-Host ""
Read-Host "Presiona Enter para salir"