#!/bin/bash

# ACTUALIZAR SISTEMA

read -p "Escribe 'ACTUALIZAR' si quieres actualizar automáticamente tu sistema:  " decision

if [ "$decision" = "ACTUALIZAR" ]; then

	sudo apt update && sudo apt upgrade && sudo apt autoremove

		echo "__________"
		echo " "
		echo " Actualización completa"
		echo "__________"
		echo " "
else 

	echo "NO SE RECONOCE LA INSTRUCCIÓN"
	exit
fi
