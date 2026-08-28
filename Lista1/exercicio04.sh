#!/bin/bash

clear

read -p "Digite o nome do arquivo: " arquivo
read -p "Digite o nome do diretório destino: " diretorio

if [ -e $arquivo ] ; then
	if [ -e $diretorio ] ; then
		mv $arquivo $diretorio
		echo "$arquivo movido para $diretorio com sucesso!!" 
		else
		echo "Diretório $diretorio não encontrado."
	fi
else
	echo "Arquivo $arquivo não encontrado."
fi
