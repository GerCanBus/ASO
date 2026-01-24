# Pedir los números al usuario
$num1 = Read-Host "Introduce el primer número"
$num2 = Read-Host "Introduce el segundo número"

# Convertir a tipo numérico para asegurar que las operaciones sean matemáticas
$n1 = [double]$num1
$n2 = [double]$num2

# Realizar los cálculos
$suma = $n1 + $n2
$resta = $n1 - $n2
$multi = $n1 * $n2

# Mostrar resultados por pantalla
Write-Host "--- Resultados ---" -ForegroundColor Cyan
Write-Host "La suma es: $suma"
Write-Host "La resta es: $resta"
Write-Host "La multiplicación es: $multi"

# Controlar la división por cero
if ($n2 -ne 0) {
    $div = $n1 / $n2
    $resto = $n1 % $n2
    Write-Host "La división es: $div"
    Write-Host "El resto (módulo) es: $resto"
} else {
    Write-Host "La división y el resto no se pueden calcular (división por cero)." -ForegroundColor Red
}

Read-Host -Prompt "Presiona Enter para salir"