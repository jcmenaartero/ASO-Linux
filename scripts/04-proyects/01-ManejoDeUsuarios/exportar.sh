#!/bin/bash
# Autor: juan
# Fecha: 2022/01/13 10:36
# Descripcion: Exporta los usuarios locales a un archivo de texto con el formato "usuario:grupo:directorio_personal:shell".

clear
basepath=$(cd `dirname $0`; pwd) # Variable que guarda la ruta donde se encuentra el script.
> $basepath/$1 # Crea un archivo vacio en el directorio del script, con el nombre pasado como parametro.
# Todos los usuarios con uid menor que 1000 son usuarios del sistema, los cuales no queremos exportar.
# Bucle que recorre todos los usuarios con uid mayor que 1000 e ignora al usuario nobody.
for usu in $(awk -F ":" '$3 >= 1000 && $1 != "nobody" { print $1  }' /etc/passwd)
do
    # En cada iteracion obtiene el nombre de usuario, grupo principal, directorio home y su shell.
    GID=$(awk -v usuario="$usu" -F ":" '$1 == usuario { print $4 }' /etc/passwd)
    grupo=$(awk -v gid="$GID" -F ":" '$3 == gid { print $1 }' /etc/group)
    home=$(awk -v usuario="$usu" -F ":" '$1 == usuario { print $6 }' /etc/passwd)
    shell=$(awk -v usuario="$usu" -F ":" '$1 == usuario { print $7 }' /etc/passwd)
    # Añade al archivo los parametros que hemos obtenido con formato para ser luego importados.
    echo "$usu:$grupo:$home:$shell" >> $basepath/$1
    echo "Exportando usuario $usu"
done

echo -e "\nExportacion completada al archivo $basepath/$1"
exit 0