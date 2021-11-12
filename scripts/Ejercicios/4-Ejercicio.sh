#!/bin/bash
# Autor: juan
# Fecha: 2021/11/12 08:53
# Descripcion: Se envia un nombre de archivo como parametro y comprueba si exister y tiene permisos de lectura. Finalmente muestra el contenido del fichero de forma paginada.

clear
if [ $# -ne 1 ]
then
    echo "Numero de parametros incorrecto."
    exit 0
fi

if [ -e $1 ] 
then
    if [ -r $1 ]
    then
        cat $1 | more
    else
        echo "No tienes permiso de lectura en $1."
    fi
else
    echo "El archivo $1 no existe."
fi

exit 0