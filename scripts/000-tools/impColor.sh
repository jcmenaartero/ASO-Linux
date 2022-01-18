#!/bin/bash
# Autor: juan
# Fecha: 2021/11/19 08:40
# Descripcion: Se define una funcion que cambia el color del texto dependiendo del parametro pasado

impColor(){
    case $1 in 
    rojo) echo -e "\e[0;31m$2\e[0m";;
    verde) echo -e "\e[0;32m$2\e[0m";;
    *) echo -e "$2" ;;
    esac
}

# Ejemplo de como usar la funcion
# impColor "<color>" "Texto a cambiar de color"