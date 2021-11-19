#!/bin/bash
# Autor: juan
# Fecha: 2021/11/16 13:55
# Descripcion: Ordena las lineas de un archivo de texto que se pasa como parametro, el orden se de las lineas se determina con un primer parametro.

clear
if [ $# -lt 1 ] || [ $# -gt 2 ]
then
    echo "ERROR!! Numero de parametros incorrecto."
    echo -e "\nFormato:\n \n$0 [ A || D ] <nombre_archivo>\n"
    exit 0
fi

if [ $# -eq 1 ] && [ -f $1 ]
then
    cat $1
    exit 0
elif [ $# -eq 1 ] && [ ! -f $1 ]
then
    echo "El archivo $1 no existe"
    exit 0
fi

if [ $# -eq 2 ] && [ -f $2 ]
then
    case $1 in
        A) cat $2 | sort ;;
        D) cat $2 | sort -r ;;
        *) echo -e "El primer parametro introducido es incorrecto.\nIntroduce una A o D"
    esac
    exit 0
else
    echo "El archivo $2 no existe"
fi

exit 0 