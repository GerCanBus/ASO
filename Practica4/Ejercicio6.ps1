# Configuración para que los acentos y caracteres especiales se muestren correctamente
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "--- Juego: Adivina el Número Secreto ---" -ForegroundColor Cyan
Write-Host ""

# 1. Configuración del juego
$numeroSecreto = 42  # Puedes cambiar este número por el que quieras
$adivinado = $false

Write-Host "He pensado un número entre 0 y 100. ¡Intenta adivinarlo!"
Write-Host ""

# 2. Bucle de juego
while (-not $adivinado) {
    # Pedir número al usuario
    $intento = [int](Read-Host "Introduce tu número")

    if ($intento -eq $numeroSecreto) {
        Write-Host ""
        Write-Host "¡ENHORABUENA! Has adivinado el número $numeroSecreto." -ForegroundColor Green
        $adivinado = $true
    }
    elseif ($intento -lt $numeroSecreto) {
        Write-Host "El número secreto es MAYOR que $intento." -ForegroundColor Yellow
        Write-Host ""
    }
    else {
        Write-Host "El número secreto es MENOR que $intento." -ForegroundColor Yellow
        Write-Host ""
    }
}

Write-Host ""
Read-Host "Presiona Enter para salir"