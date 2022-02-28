#!/bin/bash
# Autor: juan
# Fecha: 2022/02/04 09:14
# Descripcion: Guarda las reglas iptables y crea un servicio que las aplica automaticamente al reiniciar la maquina.

clear
echo "Guardando las reglas iptables..."
# Comprobamos si existe la carpeta iptables y si no la crea
if [ ! -d /etc/iptables ]
then
    mkdir /etc/iptables
fi
# Genera un archivo con las reglas actuales iptables.
iptables-save -f /etc/iptables/rules.conf
# Muestra información sobre el archivo generado
ls -l /etc/iptables/rules.conf
# Comprueba si existe el iptables.service y si no la crea
if [ ! -e /lib/systemd/system/iptables.service ]
then
    echo -e "\nCreando el servicio..."
    echo "[Unit]" > /lib/systemd/system/iptables.service
    echo "Description=Reglas de iptables" >> /lib/systemd/system/iptables.service
    echo "After=systemd-sysctl.service" >> /lib/systemd/system/iptables.service
    echo "" >> /lib/systemd/system/iptables.service
    echo "[Service]" >> /lib/systemd/system/iptables.service
    echo "Type=oneshot" >> /lib/systemd/system/iptables.service
    echo "ExecStart=/sbin/iptables-restore /etc/iptables/rules.conf" >> /lib/systemd/system/iptables.service
    echo "" >> /lib/systemd/system/iptables.service
    echo "[Install]" >> /lib/systemd/system/iptables.service
    echo "WantedBy=multi-user.target" >> /lib/systemd/system/iptables.service
fi
echo ""
# Pregunta para si activar o no el servicio que automatiza la aplicacion de las reglas.
while true; do
    read -p "Desea activar el servicio que automatiza la aplicacion de lar reglas iptables? : " sn
    case $sn in
        [Ss]* ) 
            echo -e "\nActivando el servicio..."
            systemctl enable iptables.service
            systemctl start iptables.service
            systemctl status iptables.service
            exit 0
        ;;
        [Nn]* ) 
            echo -e "\nDesactivando el servicio..."
            systemctl stop iptables.service
            systemctl disable iptables.service
            exit 0
        ;;
        * ) echo -e "\nPor favor, elige 'si' o 'no'.\n";;
    esac
done
exit 0