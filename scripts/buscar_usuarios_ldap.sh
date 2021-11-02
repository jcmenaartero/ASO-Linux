#!/bin/bash
# Descripcion: Busca a un usuario de LDAP y muestra los datos del usuario si existe

clear
echo "Introduzca el nombre de usuario:"
read usuario
comando=$(ldapsearch -xLLL -b 'dc=ies,dc=local' "(&(objectClass=Person)(uid=$usuario))" dn )

clear
if [ -z "$comando" ]; then
	echo "El usuario $usuario no existe"

else
	echo "        Busqueda de Datos del Usuario:" $usuario
	echo "--------------------------------------------------------"
	ldapsearch -xLLL -b 'dc=ies,dc=local' "(&(objectClass=Person)(uid=$usuario))" dn cn mail
fi
