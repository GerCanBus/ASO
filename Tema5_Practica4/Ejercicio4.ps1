# Configuración para que los acentos y caracteres especiales se muestren correctamente
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "--- Buscador de Números Impares ---" -ForegroundColor Cyan
Write-Host ""

# 1. Solicitar el número al usuario
$numero = [int](Read-Host "Introduce un número entero positivo")

Write-Host ""

# 2. Crear una lista para almacenar los impares
$impares = @()

# 3. Bucle para recorrer desde 1 hasta el número indicado
for ($i = 1; $i -le $numero; $i++) {
    # Si el resto de dividir $i entre 2 no es 0, es impar
    if ($i % 2 -ne 0) {
        $impares += $i
    }
}

# 4. Mostrar el resultado separados por comas
$resultado = $impares -join ", "
Write-Host "Los números impares hasta el $numero son:" -ForegroundColor Yellow
Write-Host $resultado

Write-Host ""
Read-Host "Presiona Enter para finalizar"
