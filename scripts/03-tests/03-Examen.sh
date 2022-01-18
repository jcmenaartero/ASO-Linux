#!/bin/bash
# Autor: Juan Carlos
# Fecha: 2021/12/17 18:42
# Descripcion: Script que imita la funcion de una papelera de reciclaje

clear
# Comprobamos si existe la carpeta papelera y si no la crea
if [ ! -d /home/$USER/papelera ]
then
    mkdir /home/$USER/papelera
fi
# Validacion de que al menos se introduce un parametro
if [ $# -lt 1 ]
then
    echo "ERROR!! Numero de parametros incorrecto."
    echo -e "\nFormato:\n \n$0 <accion> <nombre_archivo>"
    echo " "
    exit 1
fi
# Case para comprobar que accion vamos a realizar, segun el parametro 1
case $1 in
    -d) # Esta accion mueve los archivos a la papelera
        # Si el archivo pesa mas de 2GB lo elimina directamente
        for file in $* # Bucle que recorre los parametros
        do
            if [ $file == $1 ]
            then
                continue; # Salta la primera iteracion
            fi
            # Comprobacion de que NO existe un archivo 
            # con el mismo nombre en la papelera,
            # Si existe, concatena "copia" al nombre del archivo
            if [ -e $file ] && [ -e /home/$USER/papelera/$file ]
            then
                oldname=$file
                mv $file copia-$file
                file=copia-$file
                echo "Existe un archivo llamado $oldname en la papelera"
                echo "Se ha cambiado el nombre de $oldname por $file"
            fi
            # Si existe el archivo guarda su tamaño
            # en Bytes en una variable
            if [ -e $file ]
            then
                size=$(du -b $file | tr '\t' ':' | cut -d':' -f1)
            fi
            # Comprobaciones para saber si elimina 
            # o mueve el archivo a la papelera
            if [ -e $file ] && [ $size -gt 2000000000 ]
            then
                find -maxdepth 1 -name $file -exec rm -f {} \;
                echo "Archivo $file es muy pesado"
                echo "$file se ha eliminado del disco"
            elif [ -e $file ]
            then
                # Se copia el archivo para generar una fecha de modificacion
                find -maxdepth 1 -name $file -exec cp {} /home/$USER/papelera \;
                rm -f $file # Elimino el archivo original
                echo "Moviendo $file a la papelera"
            else
                echo "El archivo $file no existe"
            fi
        done
    ;;
    -l) # Borra los archivos que se encuentran en la papelera
        # a los que no se ha accedido en 7 o mas dias.
        # Luego muestra el contenido de la papelera
        for trash in $(find /home/$USER/papelera -type f -mtime +7)
        do
            rm -f $trash
        done
        echo "Contenido de la papelera:"
        ls -l /home/$USER/papelera 
    ;;
    -r) # Recupera los archivos pasados como parametro
        # de la papelera al directorio donde se ejecuta el script
        for file in $*
        do
            if [ $file == $1 ]
            then
                continue; # Salta la primera iteracion
            fi
            if [ -e /home/$USER/papelera/$file ]
            then
                mv /home/$USER/papelera/$file ./
                echo "Restaurando el archivo $file a $(pwd)"
            else
                echo "No existe un archivo llamado $file en la papelera"
            fi
        done
     ;;
    -v) # Elimina todos los archivos de la papelera
        rm -f /home/$USER/papelera/* 
        echo "Vaciando la papelera ..."
    ;;
    *) echo "ERROR, accion incorecta" ;; # Accion por defecto
esac

exit 0