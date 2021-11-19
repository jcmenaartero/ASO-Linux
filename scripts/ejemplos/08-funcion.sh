#!/bin/bash
# Autor: juan
# Fecha: 2021/11/19 08:26
# Descripcion: Ejemplo de una funcion que calcula el cubo de un entero.

clear
cubo(){
    echo -e "\nEl cubo de $1 es: $(($1**3)) \n"
}

read -p "Dame un numero: " num
cubo $num

exit 0