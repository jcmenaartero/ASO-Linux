#!/bin/bash
# Autor: juan
# Fecha: 2021/11/23 13:47
# Descripcion: Menu con diferentes consultas tipicas de la Red

clear
i=0
until [ $i -eq 1 ]
do
    clear
    echo "              MENU"
    echo "-----------------------------------"
    echo "      1 - Interfaces de Red"
    echo "      2 - Tablas de Ruta"
    echo "      3 - Tabla arp"
    echo "      4 - Puertos abiertos"
    echo "      5 - Salir"
    echo " "
    read -p "Elige una opcion: " opt
    echo " "
    case $opt in 
        1) ip addr list ;;
        2) ip route show ;;
        3) ip neighbor show;;
        4) netmap localhost ;;
        5) i=1 ;;
        *) echo -e "\nOpcion incorrecta\n" ;;
    esac
    echo " "
    read -p "Pulsa una tecla para continuar ..." PAUSA
done 

exit 0