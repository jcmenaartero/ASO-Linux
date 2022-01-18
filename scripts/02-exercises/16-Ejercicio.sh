#!/bin/bash
# Autor: juan
# Fecha: 2021/11/26 08:37
# Descripcion: Juego de adivinar un numero

clear
correcto=$(($RANDOM%30+1))
num=0
cont=0
echo -e "\nAdivina un numero entre [1-30]\n"
until [ $num -eq $correcto ]
do
    read -p "Introduce el numero: " num
    if [ $num -lt $correcto ]
    then 
        echo -e "\nMayor\n"
    elif [ $num -gt $correcto ]
    then
        echo -e "\nMenor\n"
    fi
    let cont++
done
clear
echo -e "\nCorrecto!!! El numero secreto es: $correcto\n\nSolo necesitaste $cont intentos para adivinarlo.\n\nPrueba de nuevo.\n" 
exit 0