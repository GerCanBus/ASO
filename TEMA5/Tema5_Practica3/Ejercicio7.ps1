# 1. Almacenar la contraseña correcta en una variable
$passwordCorrecta = "SeguridadASO2026"

# 2. Preguntar al usuario por la contraseña
$intentoUsuario = Read-Host "Introduce la contraseña para acceder"

# 3. Comparar e imprimir el resultado
# El operador -eq en PowerShell no distingue entre mayúsculas y minúsculas por defecto
if ($intentoUsuario -eq $passwordCorrecta) {
    Write-Host "¡Correcto! La contraseña coincide." -ForegroundColor Green
}
else {
    Write-Host "Error: La contraseña es incorrecta." -ForegroundColor Red
}

# Pausa para que no se cierre la ventana
Read-Host "Presiona Enter para finalizar"