# Solicitar el número al usuario
$entrada = Read-Host "Introduce un número para saber si es par o impar"

# Convertir la entrada a un número entero
$numero = [int]$entrada

# Lógica: Si el resto de dividir por 2 es 0, es par
if ($numero % 2 -eq 0) {
    Write-Host "El número $numero es PAR." -ForegroundColor Green
}
else {
    Write-Host "El número $numero es IMPAR." -ForegroundColor Yellow
}

# Pausa para ver el resultado
Read-Host "Presiona Enter para salir"