# 1. Crear la carpeta principal (OU Empresa)
# Si da error porque ya existe, no pasa nada
New-ADOrganizationalUnit -Name "Empresa" -Path "DC=empresa,DC=local"

# 2. Leer el archivo de departamentos y crear sus carpetas y grupos
$depts = Import-Csv -Path "departamentos.csv" -Delimiter ";"

foreach ($d in $depts) {
    $nombre = $d.departamento
    $rutaEmpresa = "OU=Empresa,DC=empresa,DC=local"
    
    # Crear la carpeta del departamento
    New-ADOrganizationalUnit -Name $nombre -Path $rutaEmpresa
    
    # Crear el grupo del departamento dentro de su carpeta
    $rutaDept = "OU=$nombre,$rutaEmpresa"
    New-ADGroup -Name $nombre -GroupScope Global -Path $rutaDept
}

# 3. Leer el archivo de empleados y crear los usuarios
$emps = Import-Csv -Path "empleados.csv" -Delimiter ";"

foreach ($e in $emps) {
    $nom = $e.nombre
    $ape = $e.apellido
    $dep = $e.departamento
    
    # El login es nombre.apellido
    $login = "$nom.$ape".ToLower().Replace(" ", "")
    $rutaDondeVa = "OU=$dep,OU=Empresa,DC=empresa,DC=local"
    $pass = ConvertTo-SecureString "aso2025." -AsPlainText -Force

    # Crear el usuario
    New-ADUser -Name "$nom $ape" -SamAccountName $login -Path $rutaDondeVa -AccountPassword $pass -ChangePasswordAtLogon $true -Enabled $true
    
    # Meter al usuario en su grupo
    Add-ADGroupMember -Identity $dep -Members $login
}