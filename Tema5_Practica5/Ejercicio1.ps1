# --- Definición de Funciones ---

function Sumar($a, $b) {
    return $a + $b
}

function Restar($a, $b) {
    return $a - $b
}

function Multiplicar($a, $b) {
    return $a * $b
}

function Dividir($a, $b) {
    if ($b -eq 0) {
        return "Error: No se puede dividir por cero"
    }
    return $a / $b
}

# --- Cuerpo Principal del Script ---

$opcion = 0

while ($opcion -ne 5) {
    Write-Host "****** CALCULADORA ********" -ForegroundColor Cyan
    Write-Host "1. Sumar"
    Write-Host "2. Restar"
    Write-Host "3. Multiplicar"
    Write-Host "4. Dividir"
    Write-Host "5. Salir"
    Write-Host ""
    
    # Usamos textos más sencillos para evitar errores si la consola falla
    $opcionInput = Read-Host "Que desea hacer? Elige una opcion"
    $opcion = [int]$opcionInput
    Write-Host ""

    if ($opcion -ge 1 -and $opcion -le 4) {
        $n1 = [float](Read-Host "Introduce el primer numero")
        $n2 = [float](Read-Host "Introduce el segundo numero")
        Write-Host ""

        switch ($opcion) {
            1 { $res = Sumar $n1 $n2; Write-Host "Resultado de la suma: $res" -ForegroundColor Green }
            2 { $res = Restar $n1 $n2; Write-Host "Resultado de la resta: $res" -ForegroundColor Green }
            3 { $res = Multiplicar $n1 $n2; Write-Host "Resultado de la multiplicacion: $res" -ForegroundColor Green }
            4 { $res = Dividir $n1 $n2; Write-Host "Resultado de la division: $res" -ForegroundColor Green }
        }
    }
    elseif ($opcion -eq 5) {
        Write-Host "Saliendo de la calculadora..." -ForegroundColor Cyan
    }
    else {
        Write-Host "Opcion no valida." -ForegroundColor Red
    }
    
    Write-Host ""
}