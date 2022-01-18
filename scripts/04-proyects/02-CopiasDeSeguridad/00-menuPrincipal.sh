#!/bin/bash
# Autor: juan
# Fecha: 2022/01/18 13:31
# Descripcion: Menu de opciones disponibles en el proyecto de Copias de seguridad

clear
# Comprobacion de que se ejecuta el script como root
if ! [ $(id -u) = 0 ]
then 
    echo -e "No tienes permisos.\nEjecuta el script como root." 
    exit 1 
fi
basepath=$(cd `dirname $0`; pwd) # Variable que guarda la ruta donde se encuentra el script
PS3="Elige una opcion: " # Define el promt dentro del menu
echo "-----------MENU------------"
# Menu con el comando select 
select option in 'Copia Completa' 'Restaurar Copia' 'Salir'
do
    case $option in
        'Copia Completa')
            echo "Realizando Copia $basepath"
         ;;
        'Restaurar Copia')
            echo "Resataurando Copia"
        ;;
        'Salir') # Opcion del menu para salir del script
            echo " "
            echo "Saliendo..." 
            exit 0
        ;;
    esac
    # En esta parte del script limpia la terminal y vuelve a escribir el menu 
    # ya que los menus select no lo hacen por defecto
    echo " "
    read -p "pulse una tecla para continuar ... " PAUSA
	clear
	echo "-----------MENU------------"
	echo "1) Copia Completa"
	echo "2) Restaurar Copia"
	echo "3) Salir"
done
