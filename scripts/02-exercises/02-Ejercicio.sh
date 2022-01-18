#!/bin/bash
# Autor: juan
# Fecha: 2021/11/11 12:10
# Descripcion: Realiza una Backup del directorio home.

clear
fecha=$(date +%F_%H-%M)
backup="backup_$fecha.tgz"
tar cvzf /tmp/backups/$backup $HOME 