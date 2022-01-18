#!/bin/bash
# Autor: juan
# Fecha: 2021/11/25 10:46
# Descripcion: Muestra la tabla de multiplicar de un numero pasado como parametro

clear
source /home/juan/ASO/scripts/impColor.sh
if [ $# -ne 1 ]
then
    impColor rojo "ERROR: Numero de parametros incorrecto."
    echo -e "\nIntroduce un numero entero como parametro\n"
    exit 0
elif [[ ! $1 =~ ^[0-9]+$ ]]
then
    impColor rojo "ERROR: No has introducido un numero entero"
    echo -e "\nIntroduce un numero entero como parametro\n"
    exit 0
fi
echo "    Tabla del $1"
echo "---------------------"
for (( i=1; i<=10; i++ ))
do
    echo "    $i x $1 = $(($i*$1))"
done
echo -e "---------------------\n"

exit 0