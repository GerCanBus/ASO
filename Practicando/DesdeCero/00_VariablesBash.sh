#!/bin/bash

Premisa00='Las variables son la espina dorsal de cualquier script; son nombres que usamos para almacenar datos, como números o cadenas de texto.

En Bash, a diferencia de otros lenguajes, declarar una variable es muy directo y no necesita un tipo (int, string, etc.).

Para empezar, ¿cuál es la sintaxis básica que usarías para crear una variable llamada nombre y asignarle el valor "Gerard"? Ten en cuenta una regla de oro: no se usan espacios alrededor del signo de igual (=).'

nombre=Gerard

echo $Premisa00
echo
echo '&nombre'
echo
echo $nombre
echo 
echo 'Al poner el símbolo de dólar ($) antes del nombre de la variable, le estás diciendo a Bash: "No quiero imprimir la palabra 'nombre', quiero imprimir el valor que está guardado dentro de esa variable."

Si ejecutas las dos líneas juntas:

#!/bin/bash

nombre=Gerard
echo $nombre
La salida en la terminal sería:

Gerard'
