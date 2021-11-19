#!/bin/bash
# Autor: juan
# Fecha: 2021/11/18 10:31
# Descripcion: Ejermplo del bucle until

clear
n=1
sum=0
until [ $n -eq 0 ]
do
    read -p "Dame un numero: " n 
    let sum=sum+n
done

echo -e "\nTotal = $sum\n"

exit 0