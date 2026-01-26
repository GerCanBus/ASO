# Configuración para que los acentos y caracteres especiales se muestren correctamente
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "--- Repetidor de Nombres en el Shell ---" -ForegroundColor Cyan
Write-Host ""

# 1. Solicitar los datos al usuario
$nombre = Read-Host "Introduce tu nombre"
$veces = [int](Read-Host "¿Cuántas veces quieres que se repita?")

Write-Host ""

# 2. Bucle para repetir la impresión
# La variable $i es nuestro contador, empieza en 1 y llega hasta el número indicado
for ($i = 1; $i -le $veces; $i++) {
    Write-Host "$i. $nombre"
}

Write-Host ""
Read-Host "Presiona Enter para finalizar"