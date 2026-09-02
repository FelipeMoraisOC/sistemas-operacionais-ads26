#!/bin/bash

clear
echo "Faça um script que solicite ao usuário o nome de dois arquivos e crie um terceiro arquivo contendo o
conteúdo dos dois arquivos"
read -p "Digite o nome do primeiro arquivo: " arq1
read -p "Digite o nome do segundo arquivo: " arq2

if [ -e $arq1 ] ; then
	if [ -e $arq2 ] ; then
			cat $arq1 $arq2 >> result.txt
		else 
			echo "Arquivo 2 Inexistente."
	fi
	else
		echo "Arquivo 1 Inexistente. "
fi
