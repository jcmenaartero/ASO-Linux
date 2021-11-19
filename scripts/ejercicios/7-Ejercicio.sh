#!/bin/bash
# Autor: juan
# Fecha: 2021/11/16 12:54
# Descripcion: Identifica si el parametro pasdo es un directorio o un fichero

clear
if [ $# -ne 1 ]
then
    echo "ERROR!! Numero de parametros incorrecto."
    echo -e "\nFormato:\n \n$0 <nombre_archivo>"
    echo " "
    exit 0
fi

if [ -e $1 ]
then
    if [ -d $1 ]
    then
        echo " "
        echo "$1 es un DIRECTORIO"
        echo " "
    else
        echo " "
        echo "$1 es un ARCHIVO"
        echo " "
    fi
else
    echo " "
    echo "$1 no existe"
    echo " "
fi

exit 0