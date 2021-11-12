#!/bin/bash
# Autor: juan
# Fecha: 2021/11/11 11:51
# Descripcion: Muestra informacion del usuario actual con la variables de entorno.

clear
echo " "
echo "------------------------------------------------------"
echo "Equipo: $HOSTNAME"
echo "Usuario: $USER"
echo "Identificador de Usuario: $UID"
echo "Identificador de Grupo: $GROUPS"
echo "Directorio Personal: $HOME"
echo "Directorio Actual: $PWD"
echo "------------------------------------------------------"
echo " "
exit 0