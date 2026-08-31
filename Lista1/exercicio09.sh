#!/bin/bash

clear

echo "Faça um script que solicite o nome de dois arquivos e mostre suas diferenças: "

read -p "Digite o nome do primeiro arquivo: " arq1
read -p "Digite o nome do segundo arquivo: " arq2


if [ -e $arq1 ] ; then
	if [ -e $arq2 ] ; then
			diff -y $arq1 $arq2
		else 
			echo "Arquivo 2 Inexistente."
	fi
	else
		echo "Arquivo 1 Inexistente. "
fi
