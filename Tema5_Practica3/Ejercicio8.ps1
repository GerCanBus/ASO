# 1. Pedir datos al usuario
$nombre = Read-Host "Introduce tu nombre"
$sexo = Read-Host "Introduce tu sexo (M para mujer, H para hombre)"

# Convertimos a mayúsculas para facilitar la comparación
$nombreMayus = $nombre.ToUpper()
$sexoMayus = $sexo.ToUpper()

# 2. Lógica de clasificación
# Grupo A: Mujeres con nombre < M  O  Hombres con nombre > N
if ( ($sexoMayus -eq "M" -and $nombreMayus -lt "M") -or ($sexoMayus -eq "H" -and $nombreMayus -gt "N") ) {
    $grupo = "A"
} 
else {
    $grupo = "B"
}

# 3. Mostrar resultado
Write-Host "Hola $nombre. Te corresponde el grupo: $grupo" -ForegroundColor Cyan

# Pausa para que no se cierre la ventana
Read-Host "Presiona Enter para finalizar"