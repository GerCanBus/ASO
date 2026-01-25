# Solicitar la ruta al usuario
$ruta = Read-Host "Introduce la ruta de la carpeta que deseas explorar"

# 1. Comprobar si la ruta existe
if (Test-Path -Path $ruta) {
    
    # 2. Comprobar si lo que se ha introducido es efectivamente un directorio
    if ((Get-Item $ruta) -is [System.IO.DirectoryInfo]) {
        Write-Host "La ruta es un directorio. Listando contenido (incluyendo subcarpetas)...`n" -ForegroundColor Green
        
        # 3. Listar archivos y carpetas de forma recursiva
        # Usamos -Recurse para profundizar en subdirectorios
        Get-ChildItem -Path $ruta -Recurse | Select-Object FullName, LastWriteTime
    } 
    else {
        Write-Host "La ruta existe, pero es un FICHERO, no un directorio." -ForegroundColor Yellow
    }
} 
else {
    Write-Host "Error: La ruta indicada no existe." -ForegroundColor Red
}

# Pausa para ver los resultados
Read-Host "Presiona Enter para finalizar"