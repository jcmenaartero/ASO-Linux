#!/bin/bash
# Autor: juan
# Fecha: 2022/01/18 18:05
# Descripcion: Recibe unos usuarios como parametro y realiza una copia de seguridad de su directorio personal.

clear
basepath=$(cd `dirname $0`; pwd) # Variable que guarda la ruta donde se encuentra el script.
source $basepath/environment.sh # Importa un archivo con variables de entorno.
# Comprobacion de que existe el directorio donde se guardaran las copias.
if ! [ -d $SAFEPATH ]
then
    echo -e "Creando el directorio $SAFEPATH\n"
    mkdir $SAFEPATH
fi
# Bucle que recorre el listado pasado como parametro.
for usu in $@
do
    # Comprueba que existe el usuario y realiza una copia de su directorio principal.
    if [ $(grep "^$usu:" /etc/passwd) ] 
    then
        home=$(awk -v usuario="$usu" -F ":" '$1 == usuario { print $6 }' /etc/passwd)
        echo "Realizando una copia completa del directorio personal de $usu."
        tar czf $SAFEPATH$usu.tar.gz $home -p --same-owner # Con estos modificadores conserva los permisos y propietario de los archivos.
    else
        echo "El usuario $usu no existe. No se puede realizar la copia de seguridad del directorio personal de $usu."
    fi
done
# Muestra un listado de las copias realizadas.
echo -e "\nListado de las Copias\n"
ls -l $SAFEPATH

exit 0