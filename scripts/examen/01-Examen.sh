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
        'Kernel') uname -a ;;
        'Procesador') grep "^model name" /proc/cpuinfo | cut -d':' -f2 ;;
        'Memoria Principal') grep "^MemTotal" /proc/meminfo ;;
        'Memoria Swap') grep "^SwapCached" /proc/meminfo;;
        'Usuarios conectados') who -q ;;
        'Salir') 
            echo "Saliendo..."
            exit 0
            ;;
    esac
done

exit 0