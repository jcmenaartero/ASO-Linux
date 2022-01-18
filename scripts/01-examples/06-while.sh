#!/bin/bash
# Autor: juan
# Fecha: 2021/11/18 11:42
# Descripcion: Ejemplo bucle while

clear
n=0
max=0

while [ $n -ge 0 ] 
do
    read -p "Dame un numero: " n
    if [ $n -gt $max ]
    then
        max=$n
    fi
done

echo -e "\nEl mayor numero introducido es el $max \n"

exit 0