# Solicitar la ruta del archivo o carpeta
$ruta = Read-Host "Introduce la ruta completa del fichero o carpeta que deseas comprobar"

# Comprobar la existencia
if (Test-Path -Path $ruta) {
    Write-Host "¡Confirmado! El elemento existe en la ruta: $ruta" -ForegroundColor Green
    
    # Opcional: Indicar si es un archivo o un directorio
    if ((Get-Item $ruta) -is [System.IO.DirectoryInfo]) {
        Write-Host "Tipo: Carpeta" -ForegroundColor Cyan
    } else {
        Write-Host "Tipo: Fichero" -ForegroundColor Cyan
    }
}
else {
    Write-Host "Error: El fichero o carpeta no existe en la ruta indicada." -ForegroundColor Red
}

# Pausa para que no se cierre la ventana
Read-Host "Presiona Enter para salir"