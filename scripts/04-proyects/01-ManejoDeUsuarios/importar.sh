#!/bin/bash
# Autor: juan
# Fecha: 2022/01/13 10:33
# Descripcion: Importa usuarios desde un archivo de texto con el siguiente formato "usuario:grupo:directorio_personal:shell"

clear
basepath=$(cd `dirname $0`; pwd) # Variable que guarda la ruta donde se encuentra el script
echo -e "Importando usuarios de $1 \n"
# Bucle que recorre el archivo que se ha pasado como parametro
for linea in $(cat $1)
    do
        # Por cada iteracion extrae de cada linea los distintos parametros necesarios para la creacion de usuarios
        usu=$(grep "$linea" $1 | cut -d':' -f1)
        grupo=$(grep "$linea" $1 | cut -d':' -f2)
        home=$(grep "$linea" $1 | cut -d':' -f3)
        shell=$(grep "$linea" $1 | cut -d':' -f4)
        # Comrpobacion de si se ha definido en el archivo un directorio home 
        # para el usuario, si no se le asigna uno por defecto
        if [ -z $home ]
        then
            home=/home/$usu
        fi
        # Comrpobacion de si se ha definido en el archivo un shell 
        # para el usuario, si no se le asigna uno por defecto
        if [ -z $shell ]
        then
            shell=/bin/false
        fi
        # Primero comprueba que no exista ni el usuario ni el grupo, 
        # para proceder a crear el grupo.
        if [ ! $(grep "^$usu" /etc/passwd) ] && [ ! $(grep "^$grupo" /etc/group) ]
        then
            echo "Creando el grupo $grupo"
            groupadd $grupo
        fi
        # Verifica que el usuario no existe para posteriormente crealo
        if [ ! $(grep "^$usu" /etc/passwd) ]
        then
            echo "Creando al usuario $usu"
            rnd=$(($RANDOM%10000)) # Genera un numero aleatorio de 4 cifras
            pass=$usu$rnd # Crea la contraseña con el nombre del usuario y el numero aleatorio
            useradd -g $grupo -d $home -m -s $shell -p $pass $usu
            # Crea un archivo log con el usuario y contraseña, si el usuario se creo correctamente
            if [ $(grep "^$usu" /etc/passwd) ]
            then
                echo "$usu:$pass fecha de creacion $(date)" >> $basepath/password.log
            fi
        else
            echo "El usuario $usu ya existe en el sistema"
        fi
    done
echo -e "\nImportacion completada.\nSe ha generado el archivo password.log que contiene las contraseñas generadas de los nuevos usuarios"