#!/bin/bash 
clear

echo "Faça um script que solicite ao usuário o nome de um processo e procure esse processo entre os processos
em execução."

read -p "Digite o nome do processo a ser procurado: " processo

resultado=$(ps -ef | grep "$processo")

if [ -z "$resultado" ] ; then
	echo "Não econtrado o processo $processo"
	else
	echo "$resultado"
fi

