#!/bin/bash
# Autor: juan
# Fecha: 2022/01/18 13:31
# Descripcion: Menu de opciones disponibles en el proyecto de Copias de seguridad

clear
basepath=$(cd `dirname $0`; pwd) # Variable que guarda la ruta donde se encuentra el script.
# Funcion que muestra los usuarios del sistema y recoge en una variable los usuarios introducidos por consola.
Local_user(){
    echo -e "Usuarios del sistema:\n"        
    awk -F ":" '$3 >= 1000 && $1 != "nobody" { print $1 }' /etc/passwd
    echo -e "\n-------------------------------"
    usuarios=''
    while [ -z "$usuarios" ] # Bucle hasta que la variable $usuarios tenga algun contenido.
    do
    echo -e "\nInica los usuarios seperados por un espacio:\n"
    read usuarios
    done
}
# Comprobacion de que se ejecuta el script como root.
if ! [ $(id -u) = 0 ]
then 
    echo -e "No tienes permisos.\nEjecuta el script como root." 
    exit 1 
fi
PS3="Elige una opcion: " # Define el promt dentro del menu.
echo "-----------MENU------------"
# Menu con el comando select.
select option in 'Copia Completa' 'Restaurar Copia' 'Salir'
do
    case $option in
        'Copia Completa')
            echo -e "\n####### COPIA COMPLETA #######\n"
            Local_user # Llama a la funcion definida arriba.
            bash $basepath/fullBackup.sh $usuarios # Llama al script de copias de seguridad.
         ;;
        'Restaurar Copia')
            echo -e "\n####### RESTAURACION DE LOS DATOS #######\n"
            Local_user # Llama a la funcion definida arriba.
            bash $basepath/restore.sh $usuarios # Llama al script de restauracion de copias.

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
