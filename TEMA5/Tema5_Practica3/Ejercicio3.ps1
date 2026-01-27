# Solicitar los dos números enteros
$num1 = Read-Host "Introduce el primer número entero"
$num2 = Read-Host "Introduce el segundo número entero"

# Convertir a entero [int]
$n1 = [int]$num1
$n2 = [int]$num2

Write-Host ""
Write-Host "--- Comparación ---" -ForegroundColor Cyan

# Lógica de comparación
if ($n1 -gt $n2) {
    Write-Host "El primer número ($n1) es MAYOR que el segundo ($n2)." -ForegroundColor Green
}
elseif ($n1 -lt $n2) {
    Write-Host "El primer número ($n1) es MENOR que el segundo ($n2)." -ForegroundColor Yellow
}
else {
    Write-Host "Ambos números son IGUALES ($n1 = $n2)." -ForegroundColor White
}

# Pausa para que no se cierre la ventana
Read-Host "ñPresiona Enter para salir"