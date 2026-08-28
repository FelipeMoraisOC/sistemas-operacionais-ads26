#!/bin/bash

clear

read -p "Digite uma palavra para buscar: " palavra
read -p "Digite um arquivo para buscar: " arquivo

if [ -e $arquivo ] ; then
	if grep -q $palavra $arquivo ; then
		linha=$(grep -c $palavra $arquivo)
		echo "Palavra $palavra esta na linha: $linha"
	else 
		echo "Não tem essa palavra no arquivo"
	fi
	
else
	echo "Arquivo inexistente. "
fi
