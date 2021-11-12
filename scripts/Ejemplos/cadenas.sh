#!/bin/bash
# Descripcion: Manejo de cadenas

clear

comando=$(ldapsearch -xLLL -b 'dc=ies,dc=local' '(&(objectClass=Person)(uid=pazv))' dn cn mail)
cadena=$(echo $comando)
#echo $(expr match "$cadena" '.*\([ ][c][n][:]*\)')
#cadena2=$(echo  ${cadena// /_})
dn=$(echo $cadena | cut  -d' ' -f2)
name=$(echo $cadena | cut  -d' ' -f4)
echo $dn
echo $name
