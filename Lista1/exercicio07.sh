#!/bin/bash

clear

echo "+++MENU+++"
echo "1. Procurar um arquivo utilizando find;
2. Procurar um comando utilizando whereis;
3. Procurar um arquivo utilizando locate."

read -p "Digite uma opção: " op

case $op in
	1) 
		read -p "Digite o nome do arquivo para procurar com find: " arq
		aux="find $arq"
		;;
	2)
		read -p "Digite o nome do comando para procurar com whereis: " arq
		aux="whereis $arq"
		;;
	3)
		read -p "Digite o nome do arquivo para procurar com locate: " arq
		aux="locate $arq"
		;;
	*)
		aux="Opção inexistente"
		;;
esac
if $aux ; then
	echo "Sáida: $($aux)"
else
	echo "Arquivo não encontrado utilizando find"
fi
