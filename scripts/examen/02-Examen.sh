#!/bin/bash
# Autor: juan
# Fecha: 2021/12/14 13:19
# Descripcion: Importa usuarios de un archivo de texto que contiene en cada linea "usuario:grupo"

clear
if [ $# -ne 1 ]
then
    echo "ERROR!! Numero de parametros incorrecto."
    echo -e "\nFormato:\n \n$0 <nombre_archivo>"
    echo " "
    exit 1
fi
if [ -f $1 ]
then 
    for i in $(cat $1 | cut -d':' -f1)
    do
        usu=$i
        grupo=$(grep "$i" $1 | cut -d':' -f2)
        if [ ! $(grep "^$usu" /etc/passwd) ]
        then
            if [ ! $(grep "^$grupo" /etc/group) ]
            then
                echo "Creando el grupo $grupo"
                groupadd $grupo
            fi
            echo "Creando al usuario $usu"
            rnd=$(($RANDOM%10000))
            pass=abcd$rnd
            useradd -g $grupo -d /home/$usu -m -s /bin/bash -p $pass $usu
            if [ $(grep "^$usu" /etc/passwd) ]
            then
                echo "$usu:$pass" >> usuarios.log
            fi
        else
            echo "El usuario $usu ya existe"
        fi
    done
else
    echo "El archivo $1 NO existe"
    exit 1
fi

exit 0