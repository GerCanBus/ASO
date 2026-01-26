# Mostrar el encabezado
Write-Host "****** CALCULADORA ********" -ForegroundColor Cyan

# Pedir los números al usuario
$n1 = [double](Read-Host "Introduce el primer número")
$n2 = [double](Read-Host "Introduce el segundo número")

# Mostrar el menú de opciones
Write-Host "Opciones disponibles:"
Write-Host "1. Sumar"
Write-Host "2. Restar"
Write-Host "3. Multiplicar"
Write-Host "4. Dividir"

$opcion = Read-Host "¿Qué desea hacer? Elige una opción (1-4)"

Write-Host "" # Espacio en blanco

# Procesar la opción elegida
switch ($opcion) {
    "1" { 
        $resultado = $n1 + $n2
        Write-Host "Resultado de la Suma: $resultado" -ForegroundColor Green 
    }
    "2" { 
        $resultado = $n1 - $n2
        Write-Host "Resultado de la Resta: $resultado" -ForegroundColor Green 
    }
    "3" { 
        $resultado = $n1 * $n2
        Write-Host "Resultado de la Multiplicación: $resultado" -ForegroundColor Green 
    }
    "4" { 
        if ($n2 -ne 0) {
            $resultado = $n1 / $n2
            Write-Host "Resultado de la División: $resultado" -ForegroundColor Green
        } else {
            Write-Host "Error: No se puede dividir por cero." -ForegroundColor Red
        }
    }
    Default { 
        Write-Host "Opción no válida. Por favor, elige del 1 al 4." -ForegroundColor Yellow 
    }
}

# Pausa para que no se cierre la ventana
Read-Host "Presiona Enter para salir"