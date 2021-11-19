#!/bin/bash
# Autor: juan
# Fecha: 2021/11/16 12:44
# Descripcion: Listar los direcctorios y subdirectorios de un directorio pasado como parametro

clear
if [ $# -ne 1 ]
then
    echo "Numero de parametros incorrecto."
    echo -e "\nIntroduce un nombre de un direcctorio como parametro\nFormato: $0 <nombre_dir>"
    echo " "
    exit 0
fi

if [  -d $1 ]
then
    ls -lR $1 | grep "^d"
else
    echo "No exixte un directorio llamado $1"
fi

exit 0
