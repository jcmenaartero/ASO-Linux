#!/bin/bash
# Autor: juan
# Fecha: 2021/12/14 14:09
# Descripcion: Creacion de una papelera de reciclaje

clear
if [ ! -d /home/$USER/papelera ]
then
    mkdir /home/$USER/papelera
fi
if [ $# -lt 1 ]
then
    echo "ERROR!! Numero de parametros incorrecto."
    echo -e "\nFormato:\n \n$0 <accion> <nombre_archivo>"
    echo " "
    exit 1
fi
case $1 in
    -d) echo "Moviendo archivos a la papelera" ;;
    -i) ls -l /home/$USER/papelera ;;
    -r) echo "Restaurar archivos" ;;
    -v) rm /home/$USER/papelera/* ;;
    *) echo "ERROR, accion incorecta" ;;
esac

exit 0