# Forzar a la consola a usar codificación UTF-8 para mostrar acentos correctamente
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$opcion = ""

while ($opcion -ne "x") {
    Write-Host "--- MENÚ DE GESTIÓN DE SISTEMA (ASO) ---" -ForegroundColor Cyan
    Write-Host "a) Crear una carpeta"
    Write-Host "b) Crear un fichero nuevo"
    Write-Host "c) Cambiar el nombre de un fichero o carpeta"
    Write-Host "d) Borrar un archivo o carpeta"
    Write-Host "e) Verificar si existe un fichero o carpeta"
    Write-Host "f) Mostrar el contenido de un directorio"
    Write-Host "g) Mostrar la fecha y hora actuales"
    Write-Host "x) Salir"
    Write-Host ""
    
    $opcion = (Read-Host "Seleccione una opción").ToLower()
    Write-Host ""

    switch ($opcion) {
        "a" {
            $nombre = Read-Host "Nombre de la carpeta a crear"
            New-Item -Path $nombre -ItemType Directory
            Write-Host "Carpeta '$nombre' creada." -ForegroundColor Green
        }
        "b" {
            $nombre = Read-Host "Nombre del nuevo fichero (ej: notas.txt)"
            New-Item -Path $nombre -ItemType File
            Write-Host "Fichero '$nombre' creado." -ForegroundColor Green
        }
        "c" {
            $viejo = Read-Host "Nombre actual del archivo/carpeta"
            $nuevo = Read-Host "Nuevo nombre"
            Rename-Item -Path $viejo -NewName $nuevo
            Write-Host "Renombrado con éxito." -ForegroundColor Green
        }
        "d" {
            $nombre = Read-Host "Nombre del elemento a borrar"
            Remove-Item -Path $nombre -Recururse -Confirm
            Write-Host "Elemento eliminado." -ForegroundColor Yellow
        }
        "e" {
            $nombre = Read-Host "Ruta a verificar"
            if (Test-Path $nombre) {
                Write-Host "El elemento EXISTE." -ForegroundColor Green
            } else {
                Write-Host "El elemento NO existe." -ForegroundColor Red
            }
        }
        "f" {
            $ruta = Read-Host "Introduce la ruta (pulsa Enter para el directorio actual)"
            if ($ruta -eq "") { $ruta = "." }
            Get-ChildItem -Path $ruta
        }
        "g" {
            Get-Date
        }
        "x" {
            Write-Host "Saliendo del programa..." -ForegroundColor Cyan
        }
        default {
            Write-Host "Opción no válida, intente de nuevo." -ForegroundColor Red
        }
    }
    Write-Host ""
}