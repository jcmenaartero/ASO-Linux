#!/bin/bash
# Autor: juan
# Fecha: 2022/02/04 08:21
# Descripcion: Establece reglas restrictivas a la red LAN, solo permite el acceso a internet.

# Defino una funcion con las reglas iptables
rules(){
    # Establece politica por defecto DROP 
    iptables -P INPUT DROP
    iptables -P OUTPUT DROP
    iptables -P FORWARD DROP

    # Enmascara la red local y DMZ
    iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

    # Operar en localhost sin limitaciones
    iptables -A INPUT -i lo -j ACCEPT
    iptables -A OUTPUT -o lo -j ACCEPT

    # Acepta los paquetes ICMP que se dirigen la interfaz GREEN
    iptables -A INPUT -i GREEN -p icmp -j ACCEPT
    iptables -A OUTPUT -o GREEN -p icmp -j ACCEPT

    # Permite el trafico de los paquetes ICMP desde la red local a internet
    iptables -A FORWARD -i GREEN -o RED -p icmp -j ACCEPT
    iptables -A FORWARD -i RED -o GREEN -p icmp -m state --state RELATED,ESTABLISHED -j ACCEPT

    # Permite que los equipos de la red local consulten DNS externos
    iptables -A FORWARD -i GREEN -o RED -p udp --dport 53 -j ACCEPT
    iptables -A FORWARD -i RED -o GREEN -p udp --sport 53 -m state --state RELATED,ESTABLISHED -j ACCEPT

    # Permite el tráfico web en la red local
    iptables -A FORWARD -i GREEN -o RED -p tcp --dport 80 -j ACCEPT
    iptables -A FORWARD -i RED -o GREEN -m state --state RELATED,ESTABLISHED -p tcp --sport 80 -j ACCEPT
    iptables -A FORWARD -i GREEN -o RED -p tcp --dport 443 -j ACCEPT
    iptables -A FORWARD -i RED -o GREEN -m state --state RELATED,ESTABLISHED -p tcp --sport 443 -j ACCEPT
}

clear
echo "Se va a implementar unas reglas restrictivas, que solo permiten el trafico web y realizar pings."
# Pregunta para confirmar el establecer las reglas iptables, restrictivas y basicas.
while true; do
    read -p "Seguro que quieres aplicar las reglas iptables ? : " sn
    case $sn in
        [Ss]* ) 
            echo -e "\nAplicando Reglas iptables..."
            rules # Llama a la funcion definida anteriormente.
            echo -e "\nREGLAS NAT"
            echo "---------------------------------------------------------------"
            iptables -t nat -nL
            echo "---------------------------------------------------------------"
            echo -e "\nREGLAS"
            echo "---------------------------------------------------------------"
            iptables -nL
            echo "---------------------------------------------------------------"
            exit 0
        ;;
        [Nn]* ) 
            echo -e "\nVolviendo atras"
            exit 0
        ;;
        * ) echo -e "\nPor favor, elige 'si' o 'no'.\n";;
    esac
done


exit 0