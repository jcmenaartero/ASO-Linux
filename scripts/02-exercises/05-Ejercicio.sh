#!/bin/bash
# Autor: juan
# Fecha: 2021/11/12 09:21
# Descripcion: Copia archivos del directorio actual a un directorio pasado como parametro.

clear
if [ $# -ne 1 ]
then
    echo "Numero de parametros incorrecto."
    echo -e "\nIntroduce un nombre de un direcctorio como parametro"
    exit 0
fi

# test ! -d $1 && mkdir $1
if [ ! -d $1 ]
then
    mkdir $1
fi

if [ -d $1 ]
then
    cp *.dat *.c $1 2> /dev/null
fi
