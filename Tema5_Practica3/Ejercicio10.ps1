# 1. Definir la base del bono
$bonoBase = 2400

# 2. Solicitar la puntuación al usuario
$puntosEntrada = Read-Host "Introduce la puntuación del empleado (0.0, 0.4, 0.6 o más)"
$puntos = [double]$puntosEntrada

# 3. Determinar el nivel y validar la puntuación
$nivel = ""
$valido = $true

if ($puntos -eq 0.0) {
    $nivel = "Inaceptable"
}
elseif ($puntos -eq 0.4) {
    $nivel = "Aceptable"
}
elseif ($puntos -ge 0.6) {
    $nivel = "Meritorio"
}
else {
    # Caso para valores intermedios no permitidos
    Write-Host ""
    Write-Host "Error: La puntuación introducida no es válida." -ForegroundColor Red
    $valido = $false
}

# 4. Calcular y mostrar resultados si la puntuación es válida
if ($valido) {
    $dineroTotal = $bonoBase * $puntos
    
    Write-Host ""
    Write-Host "--- Resultado de la Evaluación ---" -ForegroundColor Cyan
    Write-Host "Nivel de rendimiento: $nivel"
    Write-Host "Puntuación obtenida:  $puntos"
    Write-Host "Cantidad a recibir:   $dineroTotal €" -ForegroundColor Green
}

# Pausa para que no se cierre la ventana
Write-Host ""
Read-Host "Presiona Enter para salir"