#!/bin/bash
# Autor: juan
# Fecha: 2021/11/26 09:50
# Descripcion: Mueve todos los ficheros que se le pasen por parámetro, y para los que tengamos permisos, al directorio Backup

clear
source /home/juan/ASO/scripts/impColor.sh
if [ $# -lt 1 ]
then
    impColor rojo "ERROR: Numero de parametros incorrecto."
    echo -e "\nIntroduce algo como $0 <archivo1> <archivo2> ... para mover esos archivos al directorio /home/$USER/backup\n"
    exit 0
fi
if [ ! -d /home/$USER/Backup ]
then
    mkdir /home/$USER/Backup
fi
for i in $@
do
    if [ -f $i ] && [ -r $i ] && [ -w $i ]
    then
        mv $i /home/$USER/Backup
    fi
done
exit 0