#!/bin/bash
# Autor: juan
# Fecha: 2021/11/05 09:42
# Descripcion: Probando la expresion elif

clear
read -p "Dame un numero: " n
if [ $n -gt 0 ]
  then
    echo  "El numero $n es positivo"
elif [ $n -eq 0 ]
  then
    echo "El numero $n es cero"
else
  echo "El numero $n es negativo"
fi

exit 0
