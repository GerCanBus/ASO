# Solicitar la edad al usuario
$entrada = Read-Host "Por favor, introduce tu edad"

# Convertir la entrada a un número entero
$edad = [int]$entrada

# Verificar si es mayor de edad (18 años o más)
if ($edad -ge 18) {
    Write-Host "Eres mayor de edad." -ForegroundColor Green
}
else {
    Write-Host "Eres menor de edad." -ForegroundColor Red
}

# Pausa para que la ventana no se cierre
Read-Host "Presiona Enter para salir"