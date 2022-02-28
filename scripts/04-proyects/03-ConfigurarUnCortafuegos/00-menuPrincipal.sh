#!/bin/bash
# Autor: juan
# Fecha: 2022/01/25 11:44
# Descripcion: Menu de opciones disponibles en el proyecto para configurar un cortafuegos.

clear
basepath=$(cd `dirname $0`; pwd) # Variable que guarda la ruta donde se encuentra el script.
# Comprobacion de que se ejecuta el script como root.
if ! [ $(id -u) = 0 ]
then 
    echo -e "No tienes permisos.\nEjecuta el script como root." 
    exit 1 
fi
PS3="Elige una opcion: " # Define el promt dentro del menu.
# Pregunta al iniciar el scrip para verificar que se han configurado las variables de entorno.
echo -e "Algunas de las opciones del siguiente menu no son interactivas y dependen de \nlas variables de entorno establecidas en el archivo environment.sh\n"
while true; do
    read -p "Has configurado correctamente el archivo environment.sh? : " sn
    case $sn in
        [Ss]* ) break;;
        [Nn]* ) 
            echo -e "\nSaliendo....\nConfigura el archivo environment.sh y vuelve a ejecutar el script\n"
            exit 0
        ;;
        * ) echo -e "\nPor favor, elige 'si' o 'no'.\n";;
    esac
done

clear
echo "-----------MENU------------"
# Menu con el comando select.
oldcolumns=$COLUMNS # Guardo el valor de la varible COLUMNS para luego restaurarlo.
COLUMNS=42 # Cambio el tamaño de columna para que muestre las opciones del menu en vertical.
options=("Configurar interfaces de red" "Borrar reglas iptables" "Aplicar reglas restrictivas iptables" "Aplicar reglas customs" "Persistencia de las reglas iptables" "Salir")
select option in "${options[@]}"
do
    case $option in # En las distintas opciones llama a otro script
        'Configurar interfaces de red')
            bash $basepath/interfaces.sh
         ;;
        'Borrar reglas iptables')
            bash $basepath/flushRules.sh
        ;;
        'Aplicar reglas restrictivas iptables')
            bash $basepath/restrictedRules.sh
        ;;
        'Aplicar reglas customs')
            bash $basepath/customRules.sh
        ;;
        'Persistencia de las reglas iptables')
            bash $basepath/saveRules.sh
        ;;
        'Salir') # Opcion del menu para salir del script
            echo " "
            echo "Saliendo..." 
            COLUMNS=$oldcolumns
            exit 0
        ;;
    esac
    # En esta parte del script limpia la terminal y vuelve a escribir el menu 
    # ya que los menus select no lo hacen por defecto
    echo " "
    read -p "pulse una tecla para continuar ... " PAUSA
	clear
	echo "-----------MENU------------"
	echo "1) Configurar interfaces de red"
	echo "2) Borrar reglas iptables"
	echo "3) Aplicar reglas restrictivas iptables"
	echo "4) Aplicar reglas customs"
	echo "5) Persistencia de las reglas iptables"
	echo "6) Salir"
done
