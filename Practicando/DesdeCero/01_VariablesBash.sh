#!/bin/bash

premisa00="Hasta ahora sabemos:Asignación: variable=valor (sin espacios).
Acceso/Lectura: $variable."

explicacion="El Uso de Comillas en las Variables 🗣️Cuando asignamos un valor a una variable, el uso de comillas es crucial,
especialmente si el valor contiene espacios o caracteres especiales (como $ o !).Observa estos dos ejemplos:
mensaje=Hola Mundo (Error.) Bash intentará ejecutar un comando llamado Hola y pasarle Mundo como argumento.
mensaje=(comillas dobles)Hola Mundo(comillas dobles) (Correcto). El valor asignado a mensaje es la cadena de texto completa."

pregunta="¿Cuál es la principal razón por la que debemos usar comillas dobles al asignar un valor que contiene
espacios en Bash?"

respuestas="
1.- Para que se vea mejor en el código.
2.- Para que Bash trate todo el texto entre las comillas como una sola unidad (una sola cadena de texto).
3.- Porque el signo de igual (=) lo requiere."

respuesta="La respuesta correcta es 2 ->> Para que Bash trate todo el texto entre las comillas como una sola unidad (una sola cadena de texto)."


echo $pregunta
echo
echo "la respuesta es $respuesta"
echo
echo "abre el script con 'nano 01_VariablesBash.sh' para ver las opciones"

