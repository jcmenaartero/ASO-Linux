#!/bin/bash
# Autor: juan
# Fecha: 2022/01/20 12:34
# Descripcion: Restaura una copia de seguridad

clear
basepath=$(cd `dirname $0`; pwd) # Variable que guarda la ruta donde se encuentra el script
source $basepath/environment.sh # Importa un archivo con variables de entorno.
# Bucle que recorre el listado pasado como parametro.
for usu in $@
do
    # Valida que el usuario exista y tenga una copia de seguridad, para poder restaurarla.
    if [ $(ls $SAFEPATH | grep "^$usu\.") ] && [ $(grep "^$usu:" /etc/passwd) ]
    then
        echo "Restaurando la copia del usuario $usu"
        tar xzf $SAFEPATH$(ls /mnt/backups/ | grep "^$usu\.") -C / # Restaura la copia partiendo desde la raiz / 
    else
        echo "El usuario $usu no tiene una copia de seguridad."
    fi
done

exit 0
