#!/bin/bash
# Autor: juan
# Fecha: 2022/01/18 18:05
# Descripcion: Recibe unos usuarios como parametro y realiza una copia de seguridad de su directorio personal.

clear
tar czf /mnt/backups/$user.tar.gz $user/ -p --same-owner
