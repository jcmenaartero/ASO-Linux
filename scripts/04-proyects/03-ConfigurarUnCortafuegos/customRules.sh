#!/bin/bash
# Autor: juan
# Fecha: 2022/02/04 09:11
# Descripcion: Importa un archivo con reglas iptables personalizadas.

clear
read -p "Indica el nombre del script con las reglas iptables custom: " custom
if [ ! -e $custom ] # Comprueba que el archivo existe.
then
    echo -e "\nEl archivo $custom no existe.\nVolviendo atras."
    exit 1
fi
regex="^[[:graph:]]+\.sh$" # Expresion regular para validar que el archivo pasado acaba en .sh
if [[ ! $custom =~ $regex  ]] # Comprueba que el archivo es un script.
then
    echo -e "\nEl archivo $custom no es un script.\nVolviendo atras."
    exit 2
fi
echo " "
# Pregunta para confirmar si se aplican las reglas custom.
while true; do
    read -p "Seguro que quieres aplicar las reglas custom de $custom ? : " sn
    case $sn in
        [Ss]* ) 
            echo -e "\nAplicando Reglas Custom..."
            bash $custom
            exit 0
        ;;
        [Nn]* ) 
            echo -e "\nVolviendo atras"
            exit 0
        ;;
        * ) echo -e "\nPor favor, elige 'si' o 'no'.\n";;
    esac
done
exit 0