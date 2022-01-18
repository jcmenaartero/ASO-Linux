#!/bin/bash
# Autor: juan
# Fecha: 2021/11/19 08:40
# Descripcion: Ejemplo de como utilizar una funcion definida en otro script

clear
# En source debemos indicar donde se encuentra el script con la funcion.
source /home/juan/ASO/scripts/impColor.sh
echo "Introduce un texto:"
read text
read -p "Dime un color: " color
clear 
impColor $color "\n$text\n"

exit 0