#!/bin/bash
# Autor: juan
# Fecha: 2021/12/14 12:38
# Descripcion: Menu que muestra informacion del sistema

clear
PS3="Elige una opcion: "
echo "-----------MENU------------"
select option in 'Kernel' 'Procesador' 'Memoria Principal' 'Memoria Swap' 'Usuarios conectados' 'Salir'
do
    case $option in
        'Kernel') 
            echo " "
            uname -a 
        ;;
        'Procesador')
            echo " " 
            grep "^model name" /proc/cpuinfo | cut -d':' -f2 | sed 's/^ *//g' 
        ;;
        'Memoria Principal')
            echo " "
            free -h | grep  "^Memoria:" | tr -s ' ' | cut -d' ' -f2 
        ;;
        'Memoria Swap')
            echo " "
            free -h | grep  "^Swap:" | tr -s ' ' | cut -d' ' -f2 
        ;;
        'Usuarios conectados') 
            echo " "
            who -q 
        ;;
        'Salir') 
            echo " "
            echo "Saliendo..." 
            exit 0
        ;;
    esac
    echo " "
    read -p "pulse una tecla para continuar ... " PAUSA
	clear
	echo "-----------MENU------------"
	echo "1) Kernel"
	echo "2) Procesador"
	echo "3) Memoria Principal"
	echo "4) Memoria Swap"
    echo "5) Usuarios conectados"
	echo "6) Salir"
done

exit 0