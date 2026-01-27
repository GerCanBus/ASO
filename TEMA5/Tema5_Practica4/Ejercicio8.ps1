# Forzar a la consola a usar codificación UTF-8 para mostrar acentos correctamente
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "--- Generador de Triángulos de Números ---" -ForegroundColor Cyan
Write-Host ""

# 1. Solicitar el número de filas al usuario
$altura = [int](Read-Host "Introduce la altura del triángulo (número de filas)")

Write-Host ""

# 2. Bucle principal para cada fila
for ($i = 1; $i -le $altura; $i++) {
    
    $linea = ""
    # 3. Bucle interno para generar los números impares de la fila
    # El número máximo de cada fila se calcula con (2 * $i - 1)
    for ($j = (2 * $i - 1); $j -ge 1; $j -= 2) {
        $linea += "$j "
    }
    
    # Mostrar la fila construida
    Write-Host $linea
}

Write-Host ""
Read-Host "Presiona Enter para finalizar"