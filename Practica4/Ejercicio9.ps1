# Forzar a la consola a usar codificación UTF-8 para mostrar acentos correctamente
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "--- Sistema de Seguridad del Shell ---" -ForegroundColor Cyan
Write-Host ""

# 1. Almacenar la contraseña correcta en una variable
$contrasenaCorrecta = "contraseña"
$intento = ""

# 2. Bucle que pregunta hasta que la contraseña coincida
while ($intento -ne $contrasenaCorrecta) {
    $intento = Read-Host "Introduce la contraseña para acceder"
    
    if ($intento -ne $contrasenaCorrecta) {
        Write-Host "Acceso denegado. Inténtalo de nuevo." -ForegroundColor Red
        Write-Host ""
    }
}

# 3. Mensaje de éxito al salir del bucle
Write-Host ""
Write-Host "¡Acceso concedido! Bienvenido al sistema." -ForegroundColor Green

Write-Host ""
Read-Host "Presiona Enter para finalizar"