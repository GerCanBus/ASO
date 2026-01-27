#!/bin/bash

Usuario=$(whoami)

if [ "$Usuario" == "root" ]; then
	echo "OJO! Estás ejecutando el script como root"
elif [ "$Usuario" != "root" ]; then
	echo "Estás ejecutando el script como $Usuario"
else
	echo "¿Estás seguro?"
fi
