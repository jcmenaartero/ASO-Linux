#!/bin/bash
# Autor: juan
# Fecha: 2021/12/14 13:19
# Descripcion: Importa usuarios de un archivo de texto

clear
if [ $# -ne 1 ]
then
    echo "ERROR!! Numero de parametros incorrecto."
    echo -e "\nFormato:\n \n$0 <nombre_archivo>"
    echo " "
    exit 1
fi
if [ $# -eq 1 -a -f $1 ]
then 
    for i in $(cat $1 | cut -d':' -f1)
    do
        usu=$(grep "$i" $1 | cut -d':' -f1)
        grupo=$(grep "$i" $1 | cut -d':' -f2)
        rnd=$(($RANDOM%10000))
        pass=abcd$rnd
        useradd -g $grupo -d /home/$usu -m -s /bin/bash -p $pass $usu
        if [ $(grep "^$usu" /etc/passwd) ]
        then
            echo "Usuario:$usu Contraseña:$pass" >> usuarios.log
        fi
    done
else
    echo "El archivo $1 NO existe"
    exit 1
fi

exit 0