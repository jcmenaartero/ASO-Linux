#!/bin/bash
# Autor: juan
# Fecha: 2021/11/09 13:41
# Descripcion: Busca un direcorio y le cambia los permisos de ejecucion a todos los archivos.sh

clear
read -p "Dime el nombre de la carpeta: " dir
ruta=$(find /home/$USER -type d -name $dir)
echo $ruta
cd $ruta
for i in $(ls *.sh 2>/dev/null)
do
    echo $i
done