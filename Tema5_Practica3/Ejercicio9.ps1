# 1. Solicitar la renta anual al usuario
$rentaEntrada = Read-Host "Introduce tu renta anual (ej: 25000)"

# Convertir a número decimal para permitir cálculos precisos
$renta = [double]$rentaEntrada

# 2. Determinar el tipo impositivo según la tabla
if ($renta -lt 10000) {
    $tipo = "5%"
}
elseif ($renta -ge 10000 -and $renta -lt 20000) {
    $tipo = "15%"
}
elseif ($renta -ge 20000 -and $renta -lt 35000) {
    $tipo = "20%"
}
elseif ($renta -ge 35000 -and $renta -lt 60000) {
    $tipo = "30%"
}
else {
    # Para rentas de 60000€ o más
    $tipo = "45%"
}

# 3. Mostrar el resultado por pantalla
Write-Host "Tu renta anual es de: $renta €"
Write-Host "El tipo impositivo que te corresponde es del: $tipo" -ForegroundColor Cyan

# Pausa para que no se cierre la ventana
Read-Host "Presiona Enter para finalizar"