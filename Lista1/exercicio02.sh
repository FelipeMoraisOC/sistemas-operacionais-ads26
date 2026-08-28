#!/bin/bash

clear

read -p "Digite o nome do arquivo que deseja remover: " arquivo

if [ -e $arquivo ] ; then
	rm $arquivo
	echo "Arquivo $arquivo removido com sucesso."
	else
	echo "Arquivo não encontrado."
fi

