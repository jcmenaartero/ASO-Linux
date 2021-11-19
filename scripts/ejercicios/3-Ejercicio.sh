#!/bin/bash
# Autor: juan
# Fecha: 2021/11/12 08:33
# Descripcion: Una pequeña calculadora que suma, resta, multiplica y divide.

clear
echo " "
echo "----------Operaciones Basicas-----------"

select option in Sumar Restar Dividir Multiplicar Salir
	do
	  case $option in
	    "Sumar")
	       echo -e "\n-------Suma--------\n"
	       read -p "Introduce el primer numero: " n1
	       read -p "Introduce el segundo numero: " n2
	       echo -e "\n$n1 + $n2 = $(($n1+$n2))\n"
	  ;;
	    "Restar")
	       echo -e "\n-------Resta--------\n"
	       read -p "Introduce el primer numero: " n1
	       read -p "Introduce el segundo numero: " n2
	       echo -e "\n$n1 - $n2 = $(($n1-$n2))\n"
	  ;;
	    "Dividir")
	       echo -e "\n-------Division--------\n"
	       read -p "Introduce el primer numero: " n1
	       read -p "Introduce el segundo numero: " n2
	       echo -e "\n$n1 / $n2 = $(($n1/$n2))\n"
	  ;;
	    "Multiplicar")
	       echo -e "\n-------Multiplicacion--------\n"
	       read -p "Introduce el primer numero: " n1
	       read -p "Introduce el segundo numero: " n2
	       echo -e "\n$n1 * $n2 = $(($n1*$n2))\n"
	  ;;
	    "Salir")
	       echo -e "\nHas pulsado $option.\n"
	       exit 0
	  ;;
	# Entrada no desada
	    *)
	      echo -e "\n $REPLY no es una opcion valida.\n"
	  ;;
	    esac
	done
exit 1