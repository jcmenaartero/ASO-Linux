#!/bin/bash
# Autor: juan
# Fecha: 2021/11/16 13:50
# Descripcion: Crea un fichero copia.bck que guarda los acrhivos comprimidos pasado como parametro

clear
if [ $# -eq 0 ]
then
    echo "ERROR!! Numero de parametros incorrecto."
    echo -e "\nFormato:\n \n$0 <nombre_archivo>\n"
    exit 0
fi

tar cvzf copia.tgz $@ 

exit 0