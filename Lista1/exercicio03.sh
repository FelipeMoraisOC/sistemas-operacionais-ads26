#!/bin/bash

clear

read -p "Digite o nome atual do arquivo: " antigo
read -p "Digite o novo nome do arquivo: " novo 

if [ -e $antigo ] ; then
	mv $antigo $novo
	echo "Arquivo renomeado com sucesso: $antigo -> $novo"
	else
	echo "Arquivo não encontrado"
fi
