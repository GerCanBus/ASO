# Práctica 1 UT7: Administración de Usuarios y Grupos con PowerShell

Este repositorio contiene un script de PowerShell diseñado para automatizar la creación de la estructura de un Directorio Activo en Windows Server 2022.

## Descripción
El script lee la información de dos archivos CSV y genera automáticamente:
1. Una Unidad Organizativa (OU) principal llamada **Empresa**.
2. Unidades Organizativas para cada **Departamento** (Ventas, Producción, etc.).
3. **Grupos Globales** dentro de cada departamento.
4. **Cuentas de usuario** con el formato `nombre.apellido`.

## Requisitos
* Tener instalado el rol de **Active Directory** en el servidor.
* El nombre del dominio debe ser `empresa.local`.
* Los archivos `departamentos.csv` y `empleados.csv` deben estar en la misma carpeta que el script.

## Cómo funciona el script
1. **Configuración de texto:** Se asegura de que los nombres con acentos o la letra "ñ" se lean correctamente.
2. **Creación de OUs:** Crea la carpeta "Empresa" y luego una carpeta para cada departamento que encuentra en el CSV.
3. **Grupos:** Dentro de cada carpeta de departamento, crea un grupo con el mismo nombre.
4. **Usuarios:** Crea los usuarios con la contraseña por defecto `aso2025.` y les obliga a cambiarla la primera vez que entren. Finalmente, los añade a su grupo correspondiente.

## Cómo usarlo
1. Abre PowerShell como **Administrador**.
2. Ve a la carpeta donde tienes el script y los archivos CSV.
3. Ejecuta el script:
   ```powershell
   .\GestionAD_Empresa.ps1