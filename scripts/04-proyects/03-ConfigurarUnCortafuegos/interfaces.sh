#!/bin/bash
# Autor: juan
# Fecha: 2022/02/01 14:08
# Descripcion: Modifica el archivo de configuracion de las interfaces de red.

clear
basepath=$(cd `dirname $0`; pwd) # Variable que guarda la ruta donde se encuentra el script.
source $basepath/environment.sh # Importa las variables de entorno.
# Comprueba que el reenvio de paquetes entre las interfaces de red esta activo.
if [ $(cat /proc/sys/net/ipv4/ip_forward) -eq 0 ]
then
    # Activa el reenvio de paquetes entre las interfaces de red de manera permanente.
    sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/' /etc/sysctl.conf
    sysctl -p /etc/sysctl.conf
fi
archivo=$(ls /etc/netplan/*.yaml) # Localiza el archivo de configuracion de interfaces. 
oldarchivo=$(cat $archivo) # Guarda una copia del contenido del archivo por si se cancela la operacion.
# Modifica el archivo con los parametros establecidos en las variables de entorno.
echo "network:" > $archivo
echo "  version: 2" >> $archivo
echo "  ethernets:" >> $archivo
echo "    RED:" >> $archivo
echo "      match:" >> $archivo
echo "        macaddress: \"$RED_MAC\"" >> $archivo
echo "      set-name: RED" >> $archivo
echo "      dhcp4: $RED_DHCP" >> $archivo
if [ $RED_DHCP == "no" ] # Si se desactiva el DHCP se toma la siguiente configuracion.
then
    echo "      addresses: [$RED_IP]" >> $archivo
    echo "      gateway4: $RED_GATEWAY" >> $archivo
    echo "      nameservers:" >> $archivo
    echo "        addresses: [$RED_DNS]" >> $archivo
fi
echo "    GREEN:" >> $archivo
echo "      match:" >> $archivo
echo "        macaddress: "$GREEN_MAC"" >> $archivo
echo "      set-name: GREEN" >> $archivo
echo "      dhcp4: no" >> $archivo
echo "      addresses: [$GREEN_IP]" >> $archivo

#Muestra la configuracion antes de aplicarla.
echo "Esta es la nueva configuracion:"
echo "-------------------------------------------------------"
cat $archivo
echo "-------------------------------------------------------"
# Pregunta para aplicar o no la nueva configuracion.
while true; do
    read -p "Desea aplicarla? : " sn
    case $sn in
        [Ss]* ) 
            netplan apply
            exit 0
        ;;
        [Nn]* ) 
            echo -e "\nRestaurando valores iniciales..."
            echo "$oldarchivo" > $archivo # Restaura los valores originales del archivo.
            exit 0
        ;;
        * ) echo -e "\nPor favor, elige 'si' o 'no'.\n";;
    esac
done
