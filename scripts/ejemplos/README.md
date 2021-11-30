# _Ejemplos de expresiones regulares_
1) Busca las líneas en las que aparece la palabra **bash** en el archivo **/etc/passwd**.
```sh
cat /etc/passwd | egrep "(bash)"
```
2) Busca en el archivo anterior todas las líneas que empiezan por **m**.
```sh
cat /etc/passwd | grep "^m"
```
3) En el archivo anterior imprime todas las líneas que NO empiezan por **m**.
```sh
cat /etc/passwd | grep "^[^m]"
```
4) Busca en el archivo anterior todas las líneas que acaban con la palabra **nologin**.
```sh
cat /etc/passwd | grep "^m"
```
5) Busca en el archivo anterior las líneas que NO comienzan por **g**, **m**, **r** o **s**. 
```sh
cat /etc/passwd | grep "^m"
```
6) ¿Cuántos ficheros **README** hay en los subdirectorios **/usr/share/doc**?
```sh
cat /etc/passwd | grep "^m"
```
7) Buscar en el archivo **/etc/hosts** todas las líneas de la red **127.0.0.0/8**.  
```sh
cat /etc/passwd | grep "^m"
```
8) Buscar en el archivo **/etc/group** los grupos con identificador comprendido entre **1000** y **1099**.  
```sh
cat /etc/passwd | grep "^m"
```
9) Buscar en el archivo anterior todos los grupos con identificador comienza por **2**.
```sh
grep ":2[0-9]*" /etc/group
```
10) Buscar en el archivo anterior todos los grupos cuyo nombre comience por **s** y finalice con **d**.
```sh
grep "^s[a-z]*d:" /etc/group
```