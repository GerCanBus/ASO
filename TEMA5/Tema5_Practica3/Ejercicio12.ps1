# Configuración para que los acentos y caracteres especiales se muestren correctamente
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "--- Pizzería Bella Napoli ---" -ForegroundColor Cyan
Write-Host ""

# 1. Preguntar tipo de pizza
$tipo = Read-Host "¿Desea una pizza vegetariana? (S/N)"
Write-Host ""

# Inicializar variables base
$ingredientesBase = "Tomate, Mozzarella"
$esVegetariana = $false

# 2. Lógica según el tipo elegido
if ($tipo.ToUpper() -eq "S") {
    $esVegetariana = $true
    Write-Host "Ingredientes vegetarianos disponibles:"
    Write-Host "1. Pimiento"
    Write-Host "2. Tofu"
    Write-Host ""
    $eleccion = Read-Host "Elija un ingrediente (1-2)"
    
    if ($eleccion -eq "1") { $ingredienteExtra = "Pimiento" }
    else { $ingredienteExtra = "Tofu" }
}
else {
    $esVegetariana = $false
    Write-Host "Ingredientes no vegetarianos disponibles:"
    Write-Host "1. Peperoni"
    Write-Host "2. Jamón"
    Write-Host "3. Salmón"
    Write-Host ""
    $eleccion = Read-Host "Elija un ingrediente (1-3)"
    
    if ($eleccion -eq "1") { $ingredienteExtra = "Peperoni" }
    elseif ($eleccion -eq "2") { $ingredienteExtra = "Jamón" }
    else { $ingredienteExtra = "Salmón" }
}

# 3. Mostrar resultado final
Write-Host ""
Write-Host "--- Resumen de su pedido ---" -ForegroundColor Cyan

if ($esVegetariana) {
    Write-Host "Tipo de pizza: Vegetariana" -ForegroundColor Green
} else {
    Write-Host "Tipo de pizza: No vegetariana" -ForegroundColor Yellow
}

Write-Host "Ingredientes: $ingredientesBase, $ingredienteExtra"
Write-Host ""

Read-Host "Presiona Enter para salir"