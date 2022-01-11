#!/bin/bash
# Autor: juan
# Fecha: 2021/12/17 08:39
# Descripcion: Sirve como ayuda a otros scripts

clear
usu=$1
if [ ! $(grep "^$usu" /etc/passwd) ]
then
    echo "Creando $usu"
else
    echo "El usuario $usu ya existe"
fi