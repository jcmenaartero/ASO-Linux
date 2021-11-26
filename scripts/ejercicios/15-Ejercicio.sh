#!/bin/bash
# Autor: juan
# Fecha: 2021/11/25 11:58
# Descripcion: Contador de palabras hasta que se introduzca la palabar salir

clear
i=0
word="nulo"
declare -a array
until [ $word == 'salir' ]
do  
    clear
    read -p "Dame una palabra: " palabra
    # Si se introduce mas de una palabra, se queda solo con la primera
    word=$(echo $palabra | cut  -d' ' -f1)
    # Comprueba que se ha escritto al menos una letra y no es "salir"
    if [ -n $word ] && [ $word != 'salir' ]
    then
        array[$i]="$word"
        i=$i+1
    fi
done
clear
echo ${array[*]}
echo ${#array[@]}

exit 0