#!/bin/bash
# Autor: juan
# Fecha: 2022/01/13 10:31
# Descripcion: Menu de opciones disponibles en el proyecto de creacion de usuarios

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
select option in 'Importar' 'Exportar' 'Salir'
do
    case $option in
        'Importar')
            file='' # Inicializa la variable $file con una cadena vacia
            echo -e "\nHas elegido importar\n"
            while [ -z $file ] # Bucle hasta que la variable $file tenga algun contenido
            do
            read -p "Introduce el nombre del archivo: " file
            done
            if [ -f $file ] # Comprobacion de que la variable $file se corresponde con un archivo real
            then
                # Si el archivo existe, llama a script de importar con el nombre del archivo como parametro
                bash $basepath/importar.sh $file
            else
                echo -e "\nEl archivo $file no existe."
            fi
         ;;
        'Exportar')
            file='' # Inicializa la variable $file con una cadena vacia
            echo -e "\nHas elegido exportar\n"
            while [ -z $file ] # Bucle hasta que la variable $file tenga algun contenido
            do
            read -p "Introduce el nombre del archivo: " file
            done
            # Llama a script de exportar con el nombre del archivo que va a generar como parametro
            bash $basepath/exportar.sh $file
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
	echo "1) Importar"
	echo "2) Exportar"
	echo "3) Salir"
done
