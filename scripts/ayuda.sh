#!/bin/bash
# Autor: juan
# Fecha: 2021/12/17 08:39
# Descripcion: Sirve como ayuda a otros scripts

clear
if ! [ $(id -u) = 0 ]
then 
    echo "I am not root!" 
    exit 1 
fi

echo "Yo soy root"
exit 0

