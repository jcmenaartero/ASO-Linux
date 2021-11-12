#!/bin/bash
# Autor: juan
# Fecha: 2021/11/09 13:05
# Descripcion: Ejemplo de prueba del comando case

clear
read -p "Dame el numero del dia de la semana [1-7]: " dia
echo " "
case $dia in
    1)
        echo "Lunes"
        ;;
    2)
        echo "Martes"
        ;;
    3)
        echo "Miercoles"
        ;;
    4)
        echo "Jueves"
        ;;
    5)
        echo "Viernes"
        ;;
    6)
        echo "Sabado"
        ;;
    7)
        echo "Domingo"
        ;;
    *)
        echo "Has introducido un dato erroneo"
        ;;
esac
echo " "
exit 0