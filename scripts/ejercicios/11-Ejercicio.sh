#!/bin/bash
# Autor: juan
# Fecha: 2021/11/23 12:55
# Descripcion: Se pide un año y muestra el signo del zodiaco chino de ese año

clear
source /home/juan/ASO/scripts/impColor.sh
signo=" "
read -p "Dame tu fecha de nacimiento: " anio
let resto=$anio%12

case $resto in
    0) signo="Mono" ;;
    1) signo="Gallo" ;;
    2) signo="Perro" ;;
    3) signo="Cerdo" ;;
    4) signo="Rata" ;;
    5) signo="Buey" ;;
    6) signo="Tigre" ;;
    7) signo="Conejo" ;;
    8) signo="Dragon" ;;
    9) signo="Serpiente" ;;
    10) signo="Caballo" ;;
    11) signo="Cabra" ;;
esac

echo " "
echo -n "Tu signo del zodiaco chino es "
impColor verde "$signo\n"

exit 0