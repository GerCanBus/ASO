# Forzar a la consola a usar codificación UTF-8 para mostrar acentos correctamente
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "--- Listado de Usuarios desde CSV ---" -ForegroundColor Cyan
Write-Host ""

# 1. Importar los datos del archivo CSV
# Suponemos que el CSV tiene las cabeceras: nombre, apellidos, grupo
$usuarios = Import-Csv -Path ".\usuarios.csv" -Delimiter ","

# 2. Estructura repetitiva foreach para recorrer la lista
foreach ($usuario in $usuarios) {
    Write-Host "Nombre: " -NoNewline
    Write-Host "$($usuario.nombre)" -ForegroundColor Yellow
    
    Write-Host "Apellidos: " -NoNewline
    Write-Host "$($usuario.apellidos)" -ForegroundColor Yellow
    
    Write-Host "Grupo: " -NoNewline
    Write-Host "$($usuario.grupo)" -ForegroundColor Green
    
    Write-Host "------------------------------------"
}

Write-Host ""
Read-Host "Presiona Enter para finalizar"