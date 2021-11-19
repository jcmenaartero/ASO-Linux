#!/bin/bash
# Autor: juan
# Fecha: 2021/11/16 13:18
# Descripcion: Devuelve el tamaño en MB de un archivo o directorio pasado como parametro

clear
if [ $# -ne 1 ]
then
    echo "ERROR!! Numero de parametros incorrecto."
    echo -e "\nFormato:\n \n$0 <nombre_archivo>\n"
    exit 0
fi

if [ -e $1 ]
then
    du -sh $1
else
    echo "No existe un archivo o directorio llamado $1"
fi

exit 0