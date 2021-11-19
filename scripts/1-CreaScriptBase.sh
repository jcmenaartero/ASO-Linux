#!/bin/bash
# Autor: Juan Carlos Mena Artero
# Fecha: 2021/11/02
# Descripcion: Crea un archivo, añade unas lineas comunes y le concede permisos de ejecucion 

clear

fecha=$(date +"%Y/%m/%d %H:%M")
read -p "Nombre del Script: " name
name=${name}.sh
clear
echo " "
echo "Escribe una pequeña descripcion del script:"
echo " "
read desc

rm ./$name 2> /dev/null
touch ./$name
chmod u+x $name

echo "#!/bin/bash" >> ./$name
echo "# Autor: $USER" >> ./$name
echo "# Fecha: $fecha" >> ./$name
echo "# Descripcion: $desc" >> ./$name
echo -e "\nclear" >> ./$name

clear
echo "Creado el archivo $name en el ruta $(pwd)"
echo "---------------------------------------------------------------------------------"
ls -l $name
echo " "

exit 0
