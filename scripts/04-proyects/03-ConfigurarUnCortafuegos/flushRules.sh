#!/bin/bash
# Autor: juan
# Fecha: 2022/02/04 09:13
# Descripcion: Borrar todas las reglas iptables.

clear
# Pregunta para confirmar el borrado de las reglas iptables.
while true; do
    read -p "Seguro que quieres borrar las reglas iptables ? : " sn
    case $sn in
        [Ss]* ) 
            echo -e "\nBorrando Reglas iptables..."
            # Las siguientes comandos iptables borran todas las reglas establecidas.
            iptables -F
            iptables -X
            iptables -Z
            iptables -t nat -F
            exit 0
        ;;
        [Nn]* ) 
            echo -e "\nVolviendo atras"
            exit 0
        ;;
        * ) echo -e "\nPor favor, elige 'si' o 'no'.\n";;
    esac
done
