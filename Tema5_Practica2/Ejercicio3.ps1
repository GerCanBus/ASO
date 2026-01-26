# Pedir datos al usuario
$horasTexto = Read-Host "Introduce el número de horas trabajadas"
$costeTexto = Read-Host "Introduce el coste por hora (ej: 15.50)"

# Convertir a números decimales para permitir precisión
$horas = [double]$horasTexto
$coste = [double]$costeTexto

# Calcular el salario
$salario = $horas * $coste

# Mostrar el resultado con un formato limpio
Write-Host ""
Write-Host "--- Resumen de Pago ---" -ForegroundColor Yellow
Write-Host "Horas totales: $horas"
Write-Host "Precio/Hora:   $coste"
Write-Host "-----------------------"
Write-Host "Salario total a pagar: $salario" -ForegroundColor Green

Read-Host "Presiona Enter para finalizar"
