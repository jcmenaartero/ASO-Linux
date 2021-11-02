#!/bin/bash
# Autor: Juan Carlos Mena Artero
# Fecha: 2021/11/02
# Descripcion: Crea un archivo, añade unas lineas comunes y le concede permisos de ejecucion 

clear

read -p "Nombre del Script: " name
name=${name}.sh
fecha=$(date +"%Y/%m/%d %H:%M")

rm ./$name 2> /dev/null
touch ./$name
chmod u+x $name

echo "#!/bin/bash" >> ./$name
echo "# Autor: Juan Carlos Mena Artero" >> ./$name
echo "# Fecha: $fecha" >> ./$name
echo "# Descripcion:" >> ./$name
echo -e "\nclear" >> ./$name

echo " "
echo "Creado el archivo $name con permiso de ejecucion"
echo "---------------------------------------------------"
ls -l $name
echo " "

exit 0
